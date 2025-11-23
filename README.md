# libhangul mapping convertor
python helper script to convert [hangul keyboard mapping](https://github.com/libhangul/libhangul/tree/main/data/keyboards) for any keyboard.

Because [libhangul](https://github.com/libhangul/libhangul) uses mapping xml for Korean Input, it allows you to modify its
mapping xml for any physical keyboard layout.

On Mac, [구름 입력기](https://github.com/gureum/gureum) uses [libhangul](https://github.com/libhangul/libhangul), so the same approach can be applied.

## requirements
1. Input Method with [libhangul](https://github.com/libhangul/libhangul)
1. uv (recommended) or python3

## How to use
1. update [config.yaml](config.yaml) as needed
   ```yaml
   name: colemak-dh:crkbd:thunderbird2086
   conversions:
   - targets:
       - hangul-keyboard-2.xml
       - hangul-keyboard-2-full.xml
     mapping:
       e: f
       r: p
       t: b
       s: r
       d: s
   ```
   `name` is a reference and inserted into xml mapping
   ```xml
   <?xml version='1.0' encoding='utf-8'?>
   <hangul-keyboard id="2" type="jamo" converted="colemak-dh:crkbd:thunderbird2086">
   ```
   `targets` has mappig file names to be modified. In case [구름 입력기](https://github.com/gureum/gureum) is installed on a Mac, 
   it can be found under `/Library/Input Methods/Gureum.app/Contents/Frameworks/Hangul.framework/Versions/A/Resources/keyboards`.<br>
   `mappig` contains key mapping.  For instance, `e: f` changes key `e` to `f`.  Refer to the image below.
1. run `convert.py`. The default input path is ./original and it contains the 두벌식 xml files.
   ```shell
   $ python3 convert.py --help
   usage: Keyboard mapping convertor for libhangul [-h] [--config CONFIG] --in_path IN_PATH [--out_path OUT_PATH]
   
   optional arguments:
     -h, --help            show this help message and exit
     --config CONFIG, -c CONFIG
                           mapping confiiguration
     --in_path IN_PATH, -i IN_PATH
                           path for input files. Default is ./original
     --out_path OUT_PATH, -o OUT_PATH
                           path for output files. Default is ./converted
   ```
 1. copy the output file to the input method's directory. With [구름 입력기](https://github.com/gureum/gureum) installed on a Mac, it can be found under `/Library/Input Methods/Gureum.app/Contents/Frameworks/Hangul.framework/Versions/A/Resources/keyboards`.
 1. Restart the input method to apply the new mapping. On Mac, Activity Monitor can be used to restart the input method.
 1. For 2-3 steps, `apply_to_gureum.sh` can be used instead.

## Configurations
 * `config.yaml`
   * 키보드 펌웨어가 Colemak-DH일 때 두벌식 사용
   * QWERTY의 ; 자리를 ㅔ로 사용하게 되어있음
 * `exchange_ㅔ_;.yaml`
   * 키보드 펌웨어는 QWERTY이고 구름입력기에서 로마자로 Colemak을 사용할 때, 두벌식에서만 ㅔ와 ;를 바꾸고 싶을 때 사용
