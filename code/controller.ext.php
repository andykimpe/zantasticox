<?php
// Zantastico X Open Source Script Installer for ZPX
// Version          : 10.1.2.4 (12-23-2013)
// Updated By       : TGates for ZPanel X translation system andykimpe
// Additional Work  : Durandle
// Packages Updated : 03/08/2013 by jacobg830
// Contact Email    : tgates@zpanelcp.com
// Original Authors : Bobby Allen/Mudasir Mirza

// Function to retrieve remote XML for update check

function check_remote_xml($xmlurl,$destfile){
    $feed = simplexml_load_file($xmlurl);
    if ($feed)
    {
        // $feed is valid, save it
        $feed->asXML($destfile);
    } elseif (file_exists($destfile)) {
        // $feed is not valid, grab the last backup
        $feed = simplexml_load_file($destfile);
    } else {
        die('Unable to retrieve XML file');
    }
}

class module_controller {
    
    static $ok;

    static function getModuleVersion() {
        global $zdbh, $controller, $zlo;
        $module_path="./modules/" . $controller->GetControllerRequest('URL', 'module');
        
        // Get Update URL and Version From module.xml
        $mod_xml = "./modules/" . $controller->GetControllerRequest('URL', 'module') . "/module.xml";
        $mod_config = new xml_reader(fs_filehandler::ReadFileContents($mod_xml));
        $mod_config->Parse();
        $module_version = $mod_config->document->version[0]->tagData;
		echo " ".$module_version."";
    }
	
    static function getUpdateVersion() {
        global $zdbh, $controller, $zlo;
        $module_path="./modules/" . $controller->GetControllerRequest('URL', 'module');
        
        // Get Update URL and Version From module.xml
        $mod_xml = "./modules/" . $controller->GetControllerRequest('URL', 'module') . "/module.xml";
        $mod_config = new xml_reader(fs_filehandler::ReadFileContents($mod_xml));
        $mod_config->Parse();
        $module_updateurl = $mod_config->document->updateurl[0]->tagData;
        $module_version = $mod_config->document->version[0]->tagData;

        // Download XML in Update URL and get Download URL and Version
        $myfile = check_remote_xml($module_updateurl, $module_path."/zantasticox.xml");
        $update_config = new xml_reader(fs_filehandler::ReadFileContents($module_path."/zantasticox.xml"));
        $update_config->Parse();
        $update_url = $update_config->document->downloadurl[0]->tagData;
        $update_version = $update_config->document->latestversion[0]->tagData;
		echo " ".$update_version."";
    } 
	
    static function getCheckUpdate() {
        global $zdbh, $controller, $zlo;
        $module_path="./modules/" . $controller->GetControllerRequest('URL', 'module');
        
        // Get Update URL and Version From module.xml
        $mod_xml = "./modules/" . $controller->GetControllerRequest('URL', 'module') . "/module.xml";
        $mod_config = new xml_reader(fs_filehandler::ReadFileContents($mod_xml));
        $mod_config->Parse();
        $module_updateurl = $mod_config->document->updateurl[0]->tagData;
        $module_version = $mod_config->document->version[0]->tagData;

        // Download XML in Update URL and get Download URL and Version
        $myfile = check_remote_xml($module_updateurl, $module_path."/zantasticox.xml");
        $update_config = new xml_reader(fs_filehandler::ReadFileContents($module_path."/zantasticox.xml"));
        $update_config->Parse();
        $update_url = $update_config->document->downloadurl[0]->tagData;
        $update_version = $update_config->document->latestversion[0]->tagData;

        if($update_version > $module_version)
            return true;
        return false;
    }    
    
    static function doUpdateModule() {
        global $zdbh, $controller, $zlo;

        $myzsudo=ctrl_options::GetOption('zsudo');
        $zproot = ctrl_options::GetOption('zpanel_root');
        
        // Get Update URL and Version From module.xml
        $mod_xml = "./modules/" . $controller->GetControllerRequest('URL', 'module') . "/module.xml";
        $mod_config = new xml_reader(fs_filehandler::ReadFileContents($mod_xml));
        $mod_config->Parse();
        $module_updateurl = $mod_config->document->updateurl[0]->tagData;

        // Download XML in Update URL and get Download URL and Version
        exec("$myzsudo wget -O /tmp/".$controller->GetControllerRequest('URL', 'module').".xml $module_updateurl");
        sleep(2);
        exec("$myzsudo chmod 777 /tmp/".$controller->GetControllerRequest('URL', 'module').".xml");
        $update_xml = "/tmp/".$controller->GetControllerRequest('URL', 'module').".xml";
        $update_config = new xml_reader(fs_filehandler::ReadFileContents($update_xml));
        $update_config->Parse();
        $update_url = $update_config->document->downloadurl[0]->tagData;
        $file_name = basename($update_url);
        $folder_name= basename($update_url, ".zpp");
        
        if (fs_director::CheckFileExists("etc/zppy-cache/package-downloads/" . $file_name . "")) {
            exec("$myzsudo rm -f etc/zppy-cache/package-downloads/" . $file_name . "");
        }
        sleep(1);
        exec("$myzsudo wget -O " . $zproot . "etc/zppy-cache/package-downloads/" . $file_name . " ". $update_url ."");
        exec("$myzsudo chmod 777 " . $zproot . "etc/zppy-cache/package-downloads/" . $file_name . "");
       
        exec("$myzsudo mkdir /tmp/" . $folder_name . "");
        sleep(1);
        exec("$myzsudo unzip " . $zproot . "etc/zppy-cache/package-downloads/" . $folder_name . ".zpp  -d /tmp/" . $folder_name."");
        sleep(1);
        exec("$myzsudo \cp -fr /tmp/" . $folder_name. "/*  " . $zproot . "modules/" . $folder_name . "/");
        sleep(1);
        exec("$myzsudo chown -R apache.apache " . $zproot . "modules/" . $folder_name . "/");
        exec("$myzsudo chmod -R 777 " . $zproot . "modules/" . $folder_name . "/");
        sleep(1);
        exec("$myzsudo \rm -f /tmp/" . $folder_name . ".xml");
        exec("$myzsudo \rm -fr /tmp/" . $folder_name . "");
        }
		
    static function getCheckDBUpdates() {
        global $zdbh;
        include(ctrl_options::GetOption('zpanel_root') . '/cnf/db.php');

        // Updates
        $v_update_sql = $zdbh->prepare("UPDATE x_modules SET mo_version_in=10124 WHERE mo_name_vc='" . ui_module::GetModuleName() . "'");
        $v_update_sql->execute();
    }
   
    static function getModuleDesc() {
        $module_desc = ui_language::translate(ui_module::GetModuleDescription());
        return $module_desc;
    }

    static function getModuleName() {
        $module_name = ui_module::GetModuleName();
        return $module_name;
    }

    static function getModuleIcon() {
        global $controller;
        $module_icon = "./modules/" . $controller->GetControllerRequest('URL', 'module') . "/assets/icon.png";
        return $module_icon;
    }
	
	static function getPackageSelection() {
	$toReturn ="";
	
	//auto detect language user
	if (!isset($Langue)) {
    $Langue = explode(',',$_SERVER['HTTP_ACCEPT_LANGUAGE']);
    $Langue = strtolower(substr(chop($Langue[0]),0,2));
    }
	// intégrate with langue else use english
	if (file_exists('modules/zantasticox/packages/'.$Langue.'.packages.xml')) {
    $lang = $Langue;
    } else {
    $lang = en;
    } 
		$packages= new xml_reader(fs_filehandler::ReadFileContents('modules/zantasticox/packages/'.$lang.'.packages.xml'));
		$packages->Parse();

		$toReturn .="
		<table class=\"table table-striped\" border=\"0\" width=\"100%\">
		  <tr>
			<th>" . ui_language::translate( "Package" ) . "<br />
			" . ui_language::translate( "Name" ) . "</th>
			<th>" . ui_language::translate( "Version" ) . "<br />
			" . ui_language::translate( "Number" ) . "</th>
			<th>" . ui_language::translate( "Package" ) . "<br />
			" . ui_language::translate( "Type" ) . "</th>
			<th>" . ui_language::translate( "Package" ) . "<br />
			" . ui_language::translate( "Description" ) . "</th>
			<th>" . ui_language::translate( "Database" ) . "<br />
			" . ui_language::translate( "Required" ) . "?</th>
			<th>&nbsp;</th>
		  </tr>";
		foreach($packages->document->package as $package){
			// START - Info and DB tags by tgates
			if($package->db[0]->tagData=='yes') $package->pkgdb[0]->tagData="yes";
			else $package->pkgdb[0]->tagData="no";
			if($package->db[0]->tagData=='yes') $package->db[0]->tagData="<font color='green'><strong>" . ui_language::translate( "YES" ) . "</strong></font>";
			else $package->db[0]->tagData="<font color='red'><strong>" . ui_language::translate( "NO" ) . "</strong></font>";
			// END - Info and DB tags by tgates
		$toReturn .="<tr>
			<th>" .$package->name[0]->tagData. "</th>
			<th>" .$package->version[0]->tagData. "</th>
			<td>" .$package->type[0]->tagData. "</td>
			<td>" .$package->info[0]->tagData. "</td>
			<td><center>" .$package->db[0]->tagData. "</center></td>
			<td><a href=\"JavaScript:newPopup('modules/zantasticox/code/installer.php?pkgzip=" .$package->zipname[0]->tagData. "&pkg=" .$package->name[0]->tagData. "&pkgdb=" .$package->pkgdb[0]->tagData. "&startinstall=true');\"><button type=\"button\" class=\"btn btn-primary btn-small\">" . ui_language::translate( "Install" ) . "</button></a></td>
 			</tr>";
			}
		return $toReturn;
	}

	static function getCustomPackageSelection() {
		$toReturn ="";
		if (file_exists('modules/zantasticox/packages/custom_packages.xml')) {
		$packages= new xml_reader(fs_filehandler::ReadFileContents('modules/zantasticox/packages/custom_packages.xml'));
		$packages->Parse();

		foreach($packages->document->package as $package){
			// START - Info and DB tags by tgates
			if($package->db[0]->tagData=='yes') $package->pkgdb[0]->tagData="yes";
			else $package->pkgdb[0]->tagData="no";
			if($package->db[0]->tagData=='yes') $package->db[0]->tagData="<font color='green'><strong>" . ui_language::translate( "YES" ) . "</strong></font>";
			else $package->db[0]->tagData="<font color='red'><strong>" . ui_language::translate( "NO" ) . "</strong></font>";
			// END - Info and DB tags by tgates
		$toReturn .="<tr>
			<th>" .$package->name[0]->tagData. "</th>
			<th>" .$package->version[0]->tagData. "</th>
			<td>" .$package->type[0]->tagData. "</td>
			<td>" .$package->info[0]->tagData. "</td>
			<td><center>" .$package->db[0]->tagData. "</center></td>
			<td><a href=\"JavaScript:newPopup('modules/zantasticox/code/installer.php?pkgzip=" .$package->zipname[0]->tagData. "&pkg=" .$package->name[0]->tagData. "&pkgdb=" .$package->pkgdb[0]->tagData. "&startinstall=true');\"><button type=\"button\" class=\"btn btn-primary btn-small\">" . ui_language::translate( "Install" ) . "</button></a></td>
 			</tr>";
			}
			$toReturn .="</table><br />";
		} else { 
			$toReturn .="</table><br />";
		}
		return $toReturn;
	}
}
?>
