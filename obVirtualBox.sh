#!/bin/sh
echo "<openbox_pipe_menu>"
vms=$(
  vboxmanage list vms | grep -v inaccessible | cut -d'"' -f2 |while read line;
    do  
    vms=$(echo "$line")
    name=$(echo $line | cut -d. -f1)
    echo "<menu id=\"$name\" label=\"$name\">

      <item label=\"start\">
        <action name=\"Execute\">
          <command>
          vboxmanage startvm --type gui \"$name\"
          </command>
        </action>
      </item>

      <item label=\"stop\">
        <action name=\"Execute\">
          <command>
          vboxmanage controlvm \"$name\" poweroff
          </command>
        </action>
      </item>
      
      <item label=\"restart\">
        <action name=\"Execute\">
          <command>
          vboxmanage controlvm \"$name\" reset
          </command>
        </action>
      </item>

      <item label=\"Save\">
        <action name=\"Execute\">
          <command>
          vboxmanage controlvm \"$name\" savestate
          </command>
        </action>
      </item>


    </menu>"
done);

echo "$vms"

echo "<separator />"
echo "<item label=\"Open VirtualBox\">
    <action name=\"Execute\"><command>virtualbox</command></action>
  </item>"
echo "</openbox_pipe_menu>"
