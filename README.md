# Nice_Conky_system_monitor
Conky Light System Monitor - Modified by Mudhitha
:+1:

![alt text](https://3.bp.blogspot.com/-dzWVKWSzm1g/XHYsKLIxniI/AAAAAAAAAdA/OJew-3C4SN8Ar59fV6sQKiGvPz_QTduKACLcBGAs/s1600/ezgif-5-8b33123a4ea8.gif)

Conky යනු කුමක්ද?

Conky යනු ලිනක්ස් සහ BSD මත සැහැල්ලු නිදහස් පද්ධති මොනිටරයයි. CPU පරිභෝජනය, තැටි භාවිතය, RAM භාවිතය, ජාල වේගයන් ආදී ක්රමවත් ආකාරයෙන් පද්ධතියේ තොරතුරු සහ සංඛ්යා ලේඛන පෙන්විය හැකිය. සියලුම තොරතුරු ඔබේ තිරය මත දිස්වනු ඇත. එය ඔබේ පරිගණකයේ ඩෙස්ක්ටොප් තිරය සදහා සජීවී හැඟීමක් ලබා දෙයි.

ලිනක්ස් මින්ට් සහ උබුන්ටු වැනි පද්ධති සදහාConky ස්ථාපනය කිරීම සඳහා, ධාවනය කරන්න:


sudo apt-get install conky-all


Conky ධාවනය කිරීම සඳහා මෙනුවෙහි (හෝ උබුන්ටු මත ඩෑෂ් දී) ඔබේ යෙදුම්වල සෙවුම් පහසුකමෙහි Terminal තෝරාගන්න පහත  ලෙස ටයිප් කරන්න:

conky -b &

ඉහත සදහන් ආකාරයේ සැකසුමක් සාදා ගැනීමට පහත සදහන් ගොනු ඔබේ අව්ශ්යතාවයට ගැලපෙන(රතු හා නිල් මගින් සලකුනු කර ඇති ස්ථාන ) ලෙස සැකසුම් සකසා දී ඇති උපදෙස් පිළිපදින්න



File save as :-  conkystartup.sh
Path :- ~/
  Bash Script -->

     #!/bin/bash
    xmessage -center "Begin Conky Startup Process? " -buttons Start,Stop,Exit
    ans="$?"
    if [[ "$ans" == 101 ]]; then
            notify-send "Conky Start..."
        sleep 0 &&    # 0 good for Xfce - use 20 to 30 for Gnome
        conky -b -p 3 -c /home/mudhitha//.conkyrc &
    elif [[ "$ans" == 102 ]]; then
        notify-send "kill conky ..."
        killall conky
    else
        notify-send "Exit conky ..."
        exit
    fi


File save as :-  Conky_Startop.desktop
Path :- ~/.local/share/applications
 Desktop Shortcut --->

    [Desktop Entry]
    Hidden=false
    Exec=/Path to .sh
    Icon=/Path to .ico
    Type=Application
    NoDisplay=false
    Version=1.0
    StartupNotify=false
    Comment=Start and Stop Running
    DBusActivatable=false
    Terminal=false
    Name=Conky_Start-Stop
    Name[en_US]=Conky_Start-Stop
    Comment[en_US]=Start and Stop Running


ඔබට /etc/conky/conky.conf හි පරිගනකයේ පවතින ගොනුව දැකිය හැක.
වැඩි විස්තර සදහා / usr / share/ doc / conky-all other useful documents මගින් සොයා ගත හැකිය.
conkyrc වෙනස් කිරීම සඳහා  ඔබට ඕනෑම සංස්කාරකයක් භාවිතා කළ හැකිය.මුලින්ම ඔබේ  User home තුල .conkyrc ගොනුවක් නිර්මාණය කරන්න. නැනෝ පෙළ සංස්කාරකයක් භාවිතා කරමින් ගොනුව සෑදීම සඳහා පහත සඳහන් පරිදි ටයිප් කරන්න:
nano .conkrc
File save as :-  .conkyrc
Path :- ~/


    -- Conky, a system monitor
    -- Modify by Mudhitha Dharmasena

    conky.config = {

    -- Conky settings
       
        alignment = 'top_left',
        background = true,
        use_xft = true,
        xftalpha= .1,
        total_run_times= 0,
        update_interval = 1,
        double_buffer = true,

    -- Setup Windows
        own_window = true,
        own_window_type = 'desktop',
        own_window_argb_visual = true, 
        -- own_window_argb_value = 0,
        own_window_title = 'System-Mudhy',
        own_window_transparent = true,
        own_window_class = 'conky',
        own_window_colour = '000000',
        own_window_hints = undecorated,below,sticky,skip_taskbar,skip_pager,
       
    -- Alignment Windows

        minimum_height = 10,
        minimum_width = 10,
        maximum_width = 1366,
        gap_x = 20,
        gap_y = 10,

    -- Text settings
       
        font = 'Serif:light:size=9',
        override_utf8_locale = true,
        uppercase = false,
        border_inner_margin = 0,
        pad_percents = 2,
        use_spacer = 'left',
       
    --Graphics settings
       
        draw_shades = false,
        draw_outline = false,
        draw_borders= false,
        draw_graph_borders = false,
        default_color = '48b844',
        default_shade_color = 000000,
        default_outline_color = 'FFFFFF',
        no_buffers= true,
    }

    conky.text = [[
    ${voffset 4}${goto 10}${font Serif:bold:size=9}${color d03d40}CPU ~ ${color}${font}${goto 35}${offset 20}${font Serif:size=9}Core 1 ${font}${cpubar cpu1 10,60}${offset 12}${cpu cpu1}%${goto 210}${font Serif:size=9}Core 2 ${font}${cpubar cpu2 10,60}${offset 12}${cpu cpu2}% \
    ${goto 366}${font Serif:bold:size=9}${color d03d40}RAM${color}${font}~ ${membar 10,100}${offset 8}${memperc}% \
    ${goto 570}${font Serif:bold:size=9}${color d03d40}TEMP${color}${font} ~[CPU]${acpitemp}° \
    ${if_existing /proc/net/route wlx7cdd90840a37} \
    ${goto 700}${font Serif:bold:size=9}${color d03d40}DOWNLOAD${color}${font} ~${downspeed wlx7cdd90840a37}/s - ${totaldown wlx7cdd90840a37} \
    ${goto 940} ${font Serif:bold:size=9}${color d03d40}UPLOAD${color}${font} ~ ${upspeed wlx7cdd90840a37}/s - ${totalup wlx7cdd90840a37} \
    ${else} \
    ${if_existing /proc/net/route enp2s0} \
    ${goto 700}${font Serif:bold:size=9}${color d03d40}DOWNLOAD${color}${font} ~${downspeed enp2s0}/s - ${totaldown enp2s0} \
    ${goto 940} ${font Serif:bold:size=9}${color d03d40}UPLOAD${color}${font} ~${upspeed enp2s0}/s - ${totalup enp2s0} \
    ${else}${color grey}${offset 40}No Network Interface Found !${endif}${endif} \
    ${goto 1180}${voffset -20}${font Carlito:light:size=8}${color white}Download${offset 54}Upload${font}${color}${goto 1366}
    ${goto 60}${voffset 10}${color orange} System - $sysname | Kernel - $kernel | Mem - $mem / $memmax | Swap - $swap  / $swapmax | File System Keep $fs_used of $fs_size - $fs_used_perc% - [${blink By Mudhitha}] ${color}
    ${goto 1158}${voffset -30}${execpi 10 /home/mudhitha/.conky.sh}${voffset 5}
    ${goto 1175}${color yellow}${font Serif:bold:size=12}${scroll 15 uptime : ${uptime}}${font}${color}
    ${goto 500}${voffset -25}${font Serif:light:size=40}${time %l:%M:%S %p}${font}
    ${offset 530}${voffset 10}${font Carlito:light:size=13}${time %F, %A}${font}${voffset -108}
    ${image /home/mudhitha/.conky/dark-cover.png -p 2,1 -s 1140x20}
    ${image /home/mudhitha/.conky/dark-gray.png -p 1150,1 -s 200x100}
    ]]

 ඉහත  සහ පහත ගොනු එකම ස්ථානයේ තබන්න
File save as :-  conky.sh
Path :- ~/

     #!/bin/bash

    #Module1=$(ifconfig | egrep -E '^en*' | sed -r s/://gi | tr -s ' ' | cut -d ' ' -f1)
    #Module2=$(ifconfig | egrep -E '^wl*' | sed -r s/://gi | tr -s ' ' | cut -d ' ' -f1)

    #for i in $( ls /sys/class/net ); do echo -n $i; ethtool $i | grep Link\ d; done

    if [ "$(cat /sys/class/net/enp2s0/operstate)" = "up" ]; then
        #echo "$Module1"
        echo "\${downspeedgraph enp2s0 72,80 ff0000 0000ff} : \${upspeedgraph enp2s0 72,80 0000ff ff0000}"
    else
        #echo "$Module2"
        echo "\${downspeedgraph wlx7cdd90840a37 72,80 ff0000 0000ff} : \${upspeedgraph wlx7cdd90840a37 72,80 0000ff ff0000}"
    fi


Terminal භාවිතයෙන් ධාවනය කිරීම සඳහා :


conky -b -p 3 -c /home/mudhitha//.conkyrc &


පරිගනකය ආරම්භ වන විට ධාවනය කිරීම සඳහා  Alt + F2 --->  gnome-session-properties විධානය ක්රියාත්මක කර ක්‍රියාත්මක කළ යුතු විධානය ඇතුල් කරන්න (නම සහ අදහස් විකල්ප වේ).

ඔබ විසින් භාවිතා කිරීමට තීරණය කරන කුමන හෝ ස්ක්රිප්ට් එකක පිටපත ඔබගේ .conkyrc ගොනුව තුලට paste කළ හැක. .

#mudhitha
