## Nice_Conky_system_monitor
Conky Light System Monitor - Modified by Mudhitha
:+1:

![alt text](https://3.bp.blogspot.com/-dzWVKWSzm1g/XHYsKLIxniI/AAAAAAAAAdA/OJew-3C4SN8Ar59fV6sQKiGvPz_QTduKACLcBGAs/s1600/ezgif-5-8b33123a4ea8.gif)

# Conky යනු කුමක්ද?

Conky යනු ලිනක්ස් සහ BSD මත සැහැල්ලු නිදහස් පද්ධති මොනිටරයයි. CPU පරිභෝජනය, තැටි භාවිතය, RAM භාවිතය, ජාල වේගයන් ආදී ක්රමවත් ආකාරයෙන් පද්ධතියේ තොරතුරු සහ සංඛ්යා ලේඛන පෙන්විය හැකිය. සියලුම තොරතුරු ඔබේ තිරය මත දිස්වනු ඇත. එය ඔබේ පරිගණකයේ ඩෙස්ක්ටොප් තිරය සදහා සජීවී හැඟීමක් ලබා දෙයි.

ලිනක්ස් මින්ට් සහ උබුන්ටු වැනි පද්ධති සදහාConky ස්ථාපනය කිරීම සඳහා, ධාවනය කරන්න:

sudo apt-get install conky-all

Conky ධාවනය කිරීම සඳහා මෙනුවෙහි (හෝ උබුන්ටු මත ඩෑෂ් දී) ඔබේ යෙදුම්වල සෙවුම් පහසුකමෙහි Terminal තෝරාගන්න පහත  ලෙස ටයිප් කරන්න:
conky -b &

# වෙනස් කල යුතු ස්ථාන හදුනා ගැනීම

**1) .conkyModify ගොනුව**

$  ip link show ,lspci,ifconfig -a, netstat -i වැනි විධාන භාවිතා කිරීමෙන් පරිගන්කයේ ජාල අතුරු මුහුනත් හඩුනා ගත හැක.
mudhitha@peek-desktop:[~]
$  netstat -i
Kernel Interface table
Iface      MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
enp2s0    1500    30591      0      0 0         31225      0      0      0 BMRU
lo       65536     2138      0      0 0          2138      0      0      0 LRU
wlx7cdd9  1500        0      0      0 0             0      0      0      0 BMU

එ අනුව -

    lo - ලූප්බැච් අතුරුමුහුණත.
    enp2s0 - මගේ ප්රථම Ethernet ජාල අතුරු මුහුණත Linux.
    wlx7cdd90840a37 - ලිනක්ස් හි රැහැන් රහිත ජාල අතුරු මුහුණතක්
    
වෙනත්

    ppp0 - මොඩියුලය මගින්, PPTP vpn සම්බන්ධතාවය හෝ 3G රැහැන් රහිත USB මොඩමයක් මගින් භාවිතා කල හැකි Point to Point Protocol ජාල අතුරු මුහුණත.
    vboxnet0, vmnet1, vmnet8 - මොඩියුලය තුල හෝ NAT මාතය තුල ලිනක්ස් මෙහෙයුම් පද්ධතිය ක්රියාත්මක වන අතාත්වික යාන්ත්රික අතුරු මුහුණත්

conkyModify සදහා conky.sh භාවිතා කර ඇත්තේ enp2s0 සහ wlx7cdd90840a37 යන ජාල අතුරු මුහුණත් වේ.එබැව්න් ඉහත සදහන් ගොනු ඔබේ පරිගනකයේ අතුරු මුහුණත් සදහා ගැළපෙන් අයුරින් සංස්කරණය කළ යුතුයි.

**2) conky.sh ගොනුව**

ඉහත සදහන් පියවර අනුගනය කරන්න.

************** වැදගත්**
conky.config[[  ------------> maximum_width = 1366,

Conky ගොනුව නිර්මාණය කර ඇත්තේ 1366 පළලක් සහිත තිර සදහා බැවින් ඊට අඩු තිර සදහා ${goto xx},${offset xx} හා ${voffset xx} වෙනස් කිරීමට සිදු විය හැකිය.

**ඉහත සදහන් ආකාරයේ සැකසුමක් සාදා ගැනීමට පහත සදහන් ගොනු ඔබේ අව්ශ්යතාවයට ගැලපෙන ලෙස සැකසුම් සකසා භාවිතා කරන්න.**
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

ඔබට /etc/conky/conky.conf හි පරිගනකයේ පවතින(Default) ගොනුව දැකිය හැක.Conky  Configuration,Variables සම්බන්ද වැඩි විස්තර සදහා පහත සදහන් ස්ථානයේන් සොයා ගත හැකිය.

**/usr/share/doc/conky-all**

conkyrc වෙනස් කිරීම සඳහා  ඔබට ඕනෑම සංස්කාරකයක් භාවිතා කළ හැකිය.මුලින්ම ඔබේ  User home තුල .conkyrc ගොනුවක් නිර්මාණය කරන්න. නැනෝ පෙළ සංස්කාරකයක් භාවිතා කරමින් ගොනුව සෑදීම සඳහා පහත සඳහන් පරිදි ටයිප් කරන්න:
nano .conkrc

**Terminal භාවිතයෙන් ධාවනය කිරීම සඳහා : conky -b -p 3 -c /home/mudhitha//.conkyrc &*

පරිගනකය ආරම්භ වන විට ධාවනය කිරීම සඳහා  Alt + F2 --->  gnome-session-properties විධානය ක්රියාත්මක කර ක්‍රියාත්මක කළ යුතු විධානය ඇතුල් කරන්න (නම සහ අදහස් විකල්ප වේ).
ඔබ විසින් භාවිතා කිරීමට තීරණය කරන කුමන හෝ ස්ක්රිප්ට් එකක පිටපත ඔබගේ .conkyrc ගොනුව තුලට paste කළ හැක. .

#mudhitha
