#!/bin/sh
echo "<openbox_pipe_menu>"
files=$(
  ls ~/.screenlayout | grep ".sh"  |  while read line; 
    do  
    file=$(echo "$line")
    name=$(echo $line | cut -d. -f1)
    echo "<item label=\"$name\">
        <action name=\"Execute\">
          <command>~/.screenlayout/$line</command>
        </action>
        <action name=\"Execute\">
          <command>nitrogen --restore</command>
        </action>
      </item>"
done);
echo "$files"

echo "<separator />"
echo "<item label=\"Configure Screens\">
    <action name=\"Execute\"><command>arandr</command></action>
  </item>"
echo "</openbox_pipe_menu>"
