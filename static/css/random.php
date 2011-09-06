<?php

 /*** Random Background Images
http://www.thought-after.com/2006/05/26/css-random-background-image-rotation/

This file will display a random background image to any element targetted through a CSS id.

1) Place this file in the same location as your sites main stylesheet file.

2) In the head section of each page place the following @import statement.

@import url(/path/to/dynamic_css.php)

NOTE: the import must occur after all other style sheet links, imports and declarations to avoid this dynamic style being over-written.

3) Create a folder to hold the images to be used for the random backgrounds.

4) Assign values to the following variables to complete the setup

$imgFolder : the path from the sites root to the image folder created at 3 above example:

$imgFolder = "/images/random-images/";

$element : the css ID of the element to apply the background image to example:

$element = "header";

5)    That's it!! ***/

// Set up
$imgFolder = "/t/img/bg/"; // the path from the sites root to the image folder created at 3 above
$element = "main"; // the css ID of the element to apply the background image to

// That's it!! Nothing below this line needs to be changed
$img = null;

// build up the path to the image folder
if (substr($imgFolder,0,1) != '/') { $imgFolder = '/'.$imgFolder; }
if (substr($imgFolder,-1) != '/') { $imgFolder = $imgFolder.'/'; }
$path = $_SERVER['DOCUMENT_ROOT'] . $imgFolder;

// populate an array to hold valid file type extensions
$extList = array('gif','jpg','jpeg','png');

// create an array to hold the list of image files
$fileList = array();

// open a handle to the directory
$handle = opendir($path);

// loop through the contents of the directory
while ( false !== ( $file = readdir($handle) ) ) {
    // get the info for each file
    $file_info = pathinfo($file);
    // check that the file in in the allowed extensions array
    if ( in_array( strtolower( $file_info['extension'] ), $extList)    ) {
        // add the file to the array
        $fileList[] = $file; }
    }
    // close the handle to the directory
    closedir($handle);

    // if we have at least 1 file in the list
    if (count($fileList) > 0) {
        // select a random index from the file list array
        $imageNumber = time() % count($fileList);
       // assign the filename for that array index to the $img var
       $img = $imgFolder . $fileList[$imageNumber];

       $css = "#$element { background: #f9f9f9 url('".$img."') top center no-repeat;  border:0; }\n";

       // tell the browser what we're sending
       header('Content-type: text/css');
       // and write out the css 
       echo $css;
    }
?>