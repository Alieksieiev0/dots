COUNT=$(dunstctl count waiting)
ENABLED="  " 
DISABLED="  "

if dunstctl is-paused | grep -q "false" ; 
then 
    echo $ENABLED" "; 
else 
    if [ $COUNT == 0 ]; then COUNT=""; fi
    echo $COUNT" "$DISABLED" "; fi
