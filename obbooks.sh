#!/bin/sh
# Set a pdf reader here, followed by the path to your books
pdfreader='evince'
bookpath="$HOME/documents/books/"
echo "<openbox_pipe_menu>"
files=$(
  ls $bookpath | grep '.pdf' | while read line; 
    do  
    file=$(echo "$line")
    name=$(echo $line | cut -d. -f1)
    echo "<item label=\"$file\">
        <action name=\"Execute\"><command>$pdfreader $bookpath/$file</command></action>
      </item>"
done);
echo "$files"
echo "</openbox_pipe_menu>"
