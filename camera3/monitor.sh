until detectMotion.py do
    echo "'detectMotion.py' crashed with exit code $?. Restarting..." >&2
    sleep 1
done
