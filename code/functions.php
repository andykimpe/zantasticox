<?php
// Zantastico X Open Source Script Installer for ZPX
// Version          : 10.1.2.4 (12-23-2013)
// Updated By       : TGates for ZPanel X translation system andykimpe
// Additional Work  : Durandle
// Packages Updated : 03/08/2013 by jacobg830
// Contact Email    : tgates@zpanelcp.com
// Original Authors : Bobby Allen/Mudasir Mirza

include('../../../cnf/db.php');
include('../../../inc/dbc.inc.php');

// Listing domains in DropDown Menu
function ListDomain($uid){
    global $zdbh;
    $sql="SELECT * FROM x_vhosts WHERE vh_acc_fk ='".$uid."' and vh_active_in='1' and vh_deleted_ts is NULL";
    $numrows = $zdbh->query($sql);
    if (@mysql_num_rows($numrows) == 0) {
        $sql = $zdbh->prepare($sql);
        $html="";
        $html .="<select name=site_domain>";
        $sql->execute();
        while ($rowsettings = $sql->fetch()) {
            $domain = $rowsettings['vh_name_vc'];
            $html .= "<option value=\"".$domain."\">".$domain."</option>";
        }
        $html .= "</select>";
        return $html;
    } else {
        echo "Unable to fetch domain list";
    }
}

function FetchDomainDir($uid,$domain){
    global $zdbh;
    $sql="SELECT * FROM x_vhosts WHERE vh_acc_fk='" . $uid . "' AND vh_name_vc='" . $domain . "'";
    $numrows = $zdbh->query($sql);
    if (@mysql_num_rows($numrows) == 0) {
        $sql = $zdbh->prepare($sql);
        $sql->execute();
        while ($rowsettings = $sql->fetch()) {
            $domaindir = $rowsettings['vh_directory_vc'];
        }
        return $domaindir;
    } else {
        echo "Unable to fetch domain dir";
        exit();
    }
}

// Function to create Directory
function CreateDir($dir){
    @$mkdir = mkdir($dir);
    if($mkdir){
        echo "<font color=\"green\">Folder created Successfully</font><br><br>";
    } else {
        echo "<font color=\"red\">Folder Already Exists.</font><br><br>";
    }
}

// Function to Unzip
function UnZip($zipfile,$dest_dir){
    $zip = new ZipArchive;
    $res = $zip->open($zipfile);
    if ($res === TRUE) {
	 $zip->extractTo($dest_dir);
	 $zip->close();
	 echo "<font color=\"green\">Unzip was successful</font><br><br>";
	 } else {
	 echo "<font color=\"red\">Unzip was not successful</font><br><br>";
    }
}

// Function to clean the User Input
function clean($var){
    $res=stripslashes(trim($var));
    return $res;
}

// Set file and folder permissions and ownership
function directoryToArray($directory, $recursive) {
    $array_items = array();
    if ($handle = opendir($directory)) {
        while (false !== ($file = readdir($handle))) {
            if ($file != "." && $file != "..") {
                if (is_dir($directory. "/" . $file)) {
                    if($recursive) {
                        $array_items = array_merge($array_items, directoryToArray($directory. "/" . $file, $recursive));
                    }
                    $file = $directory . "/" . $file;
                    $array_items[] = preg_replace("/\/\//si", "/", $file);
                } else {
                    $file = $directory . "/" . $file;
                    $array_items[] = preg_replace("/\/\//si", "/", $file);
                }
            }
        }
        closedir($handle);
    }
    return $array_items;
}
// Fix permissions of installed files since they will automatically be set to                       
// the apache user and group                                                                        
function fixPermissionsIssue($completedir){                                                         
    $sysOS = php_uname('s');                                                                        
    $zsudo = ctrl_options::GetOption('zsudo');                                                      
                                                                                                    
    switch($sysOS){                                                                                 
        case 'Linux':                                                                               
            exec("$zsudo chown -R ftpuser.ftpgroup " . $completedir);                               
            exec("$zsudo chmod -R 777 " . $completedir);                                            
        break;                                                                                      
        case 'Unix':                                                                                
            exec("$zsudo chown -R ftpuser:ftpgroup " . $completedir);                               
            exec("$zsudo chmod -R 777 " . $completedir);                                            
        break;                                                                                      
        default:                                                                                    
            //windows or uncompilable operating system !!Do Nothing!!                               
        break;                                                                                      
    }                                                                                               
}

// Clean out installation folder
function emptyDir($completedir) {
	$i = new DirectoryIterator($completedir);
		foreach($i as $f) {
			if($f->isFile()) {
				unlink($f->getRealPath());
			} else if(!$f->isDot() && $f->isDir()) {
				emptyDir($f->getRealPath());
		rmdir($f->getRealPath());
			}
		}
}

// Function for Database and Database user creation
function database($pkgInstall) {
	$dbcontent = "<div class=\"zgrid_wrapper\"><br /><br /><font color=\"red\"><strong>This package requires a database.</strong></font><br /><br />
        <strong>Have you created a new database for your installation? <font color=\"blue\">If not,</font> <a href=\"/?module=mysql_databases\" target=\"_blank\"><font color=\"blue\"><u>do so now!</u></strong></font></a><br /><br />
        <strong>Do not forget to also create a database user too! <a href=\"/?module=mysql_users\" target=\"_blank\"><font color=\"blue\"><u>Create a database user now!</u></strong></font></a><br />
 </div>";
	return $dbcontent;
}
?>
