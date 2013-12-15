<?php
// Zantastico X Open Source Script Installer for ZPX
// Version          : 10.1.2.3 (09-13-2013)
// Updated By       : TGates for ZPanel X
// Additional Work  : Durandle
// Packages Updated : 03/08/2013 by jacobg830
// Contact Email    : tgates@zpanelcp.com
// Original Authors : Bobby Allen/Mudasir Mirza

$zipfile = $_GET["pkgzip"];
$pkgInstall = $_GET['pkg'];
$pkgdb = $_GET['pkgdb'];
$start = $_GET['startinstall'];

if($start){
include('../../../cnf/db.php');
include('../../../dryden/db/driver.class.php');
include('../../../dryden/debug/logger.class.php');
include('../../../dryden/runtime/dataobject.class.php');
include('../../../dryden/sys/versions.class.php');
include('../../../dryden/ctrl/options.class.php');
include('../../../dryden/ctrl/auth.class.php');
include('../../../dryden/ctrl/users.class.php');
include('../../../dryden/fs/director.class.php');
include('../../../inc/dbc.inc.php');
include('functions.php');

if(!isset($_POST['submit'])) {
  
session_start();
if (isset($_SESSION['zpuid'])){
$userid = $_SESSION['zpuid'];
$currentuser = ctrl_users::GetUserDetail($userid);
$hostdatadir = ctrl_options::GetOption('hosted_dir')."".$currentuser['username'];
$userName = $currentuser['username'];
$random=rand();
$sysOS=php_uname('s');
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ZPanel &gt; Zantastico X Installer - <?php echo $pkgInstall ?></title>
<link href="../../../etc/styles/<?php echo $currentuser['usertheme']; ?>/css/<?php echo $currentuser['usercss']; ?>.css" rel="stylesheet" type="text/css">
<link href="../assets/install-form.css?<?php echo $random; ?>" rel="stylesheet" type="text/css">
<link href="../assets/tooltip.css?<?php echo $random; ?>" rel="stylesheet" type="text/css">
<script src="../assets/ajaxsbmt.js?<?php echo $random; ?>" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
 
</head>
<body style="background: #F3F3F3; font-size:12px">

<div style="margin-left:20px;margin-right:20px;">
<h2>ZPanel Zantastico X - <?php echo $pkgInstall ?></h2>
<div id="RunSubmit" style="height:100%;margin:auto;">
<p>Please provide the domain and folder name to start the installation of <?php echo $pkgInstall ?>.</p>

<?php
if ($pkgdb == 'yes') {
database($pkgInstall);
} else {
}
?>

<div class="zgrid_wrapper"><br />
<?php if ($pkgdb == "yes") { ?>
	<table border="0" cellspacing="1" cellpadding="1" align="center" width="600px">
        <tr>
			<td>
                <font color="red"><strong>This package requires a database<br />and database user.</strong></font><br />
            </td>
            <td>
				Create a database now? <a target="_blank" href="../../../?module=mysql_databases">YES!</a><br />
            	Create a database user now? <a target="_blank" href="../../../?module=mysql_users">YES!</a><br />
            </td>
        </tr>
	</table>
    <br />
<?php } ?> 
<strong>Enter package install folder information:</strong><br /><br />
<form name="doInstall" action="installer.php?startinstall=true&u=<?php echo $currentuser['userid']; ?>&pkgzip=<?php echo $zipfile ?>&pkg=<?php echo $pkgInstall ?>" method="post" onsubmit="xmlhttpPost('installer.php?startinstall=true&u=<?php echo $currentuser['userid']; ?>&pkgzip=<?php echo $zipfile ?>&pkg=<?php echo $pkgInstall ?>&pkgdb=<?php echo $pkgdb ?>', 'doInstall', 'RunResult', 'Unpacking the files, please wait...<br /><img src=\'../assets/bar.gif\'>'); return false;">
<table border="0" cellspacing="1" cellpadding="1" align="center" width="600px">
        <tr>
            <td>
                <label for="site_domain">Domain to install to: </label>
            </td>
            <td align="left">
                <?php
                $list = ListDomain($currentuser['userid']);
                echo $list;
                ?>
            </td>
            <td>Server OS: <?php echo $sysOS; ?></td>
        </tr>
        <tr>
            <td>
                <label for="install_to_base_dir">Install into the selected<br />domain's root folder?</label>
            </td>
            <td>
                <input type="checkbox" name="install_to_base_dir" value="1"/>
            </td>
            <td>
            	<font color="red"><strong>ALL FILES AND FOLDERS<br />WILL BE DELETED!</strong></font>
            </td>
        </tr>
        <tr>
            <td>
                <label for="dir_to_install">Install Folder: </label>
            </td>
            <td align="left">
                <input type="text" length="50" maxsize="100" name="dir_to_install" /><br />
                (Leave blank if installing<br />to the root folder)
            </td>
            <td>
            	<font color="red"><strong>NOTE:</strong></font> No "/".
            </td>
        </tr>
        <tr>
        	<td></td>
            <td><br />
             <center><button class="fg-button ui-state-default ui-corner-all" id="SubmitRun" name="submit" align="center" type="submit" value="">Start Install</button></center><br />
             <center><input  class="fg-button ui-state-default ui-corner-all" type="button" align="center" value="Cancel" onclick="self.close()"></center>
          </td>
          <td></td>
       </tr>
    </table>
             
</form>
</div>
</div>
<div id="RunResult" style="display:block;height:100%;margin:auto;">
<br /><br />
Unpacking the <?php echo $pkgInstall ?> files, please wait...<br /><br /><img src='../assets/bar.gif'>
</div>
</div>
</body>
</html>
<?php
} else { ?>
<body style="background: #F3F3F3;">
<h2>Unauthorized Access!</h2>
You have no permission to view this module.
</body>
<?php 

}
}else {
    
    $userid=$_GET['u'];
    $currentuser=ctrl_users::GetUserDetail($userid);
    $hostdatadir = ctrl_options::GetOption('hosted_dir')."".$currentuser['username'];
           
    $site_domain=clean($_POST['site_domain']);
    $dir_to_install=clean($_POST['dir_to_install']);
    $install_to_base_dir=clean($_POST['install_to_base_dir']);
    
    // Retrieve the directory for the Domain selected
    $domaindir=FetchDomainDir($userid, $site_domain);
    
    $completedir=$hostdatadir . "/public_html" . $domaindir . "/" . $dir_to_install . "" ;
    
    echo "<br /><b>Automated " .$pkgInstall. " Installation Status:</b><br /><br />";
        if(file_exists($completedir) and $install_to_base_dir != "1") {
        echo "<div><font color=\"red\"><strong>Destination folder already exists!</strong></font><br /><br />Sorry, the install folder (<strong>/public_html" . $domaindir . "/" . $dir_to_install . "</strong>) already exists, please go back and create a new folder!<br />";
        echo "<p><center><form><input class=\"fg-button ui-state-default ui-corner-all\" type=\"button\" type=\"button\" onClick=\"history.go(0)\" value=\"Go Back\"></form></center></p></div>";
            } else {

    // Creating Directory
	CreateDir($completedir);
    sleep(1);
	// Remove all Files in the install Folder
	emptyDir($completedir);
	sleep(3);
    // Un-Compressing The ZIP Archive
	set_time_limit(300);
	UnZip("../packages/" .$zipfile. ".zip", $completedir);
    sleep(5); 
    // Set file/folder permissions if on *nix
	fixPermissionsIssue($completedir);
	sleep(5);
      
$domaindir = preg_replace('/_/', '.', $site_domain);
echo "Package unzipped to: http://" . $site_domain . "/" . $dir_to_install . "<br><br>";
echo "If no errors, click to continue: ";
		if(file_exists($completedir . "/zanx-install.php")) {
			    echo "<a target=\"_blank\" href='http://" . $site_domain . "/" . $dir_to_install . "/zanx-install.php'> <button class=\"fg-button ui-state-default ui-corner-all\" type=\"button\">Install</button> </a>"; '';
				echo "then <input  class=\"fg-button ui-state-default ui-corner-all\" type=\"button\" type=\"button\" value=\"Close this window\" onclick=\"self.close()\">";
			} else {
				echo "<a target=\"_blank\" href='http://" . $site_domain . "/" . $dir_to_install . "'><button class=\"fg-button ui-state-default ui-corner-all\" type=\"button\">Install</button> </a>";
				echo "then <input  class=\"fg-button ui-state-default ui-corner-all\" type=\"button\" type=\"button\" value=\"Close this window\" onclick=\"self.close()\">";
            }
			}
}

}else{
    echo "<font color=\"red\">Unable to start Install Process</font>";
    exit();
}

?>

<script type="text/javascript">
    $(document).ready(function() { 
        $("#RunResult").hide();
            $("#SubmitRun").click(function(){
            $("#RunSubmit").hide();
            $("#RunResult").show();
        }); 
    })
</script>
