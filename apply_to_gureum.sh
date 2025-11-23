set -e

CONFIG=config.yaml
if [ -n "$1" ]; then
    CONFIG=$1
fi

uv run convert.py --config $CONFIG
sudo cp ./converted/{hangul-keyboard-2.xml,hangul-keyboard-2-full.xml} /Library/Input\ Methods/Gureum.app/Contents/Frameworks/Hangul.framework/Versions/A/Resources/keyboards
sudo chown root:wheel /Library/Input\ Methods/Gureum.app/Contents/Frameworks/Hangul.framework/Versions/A/Resources/keyboards/{hangul-keyboard-2.xml,hangul-keyboard-2-full.xml}
