# OpenGapps-For-Magisk-Converter

## Introduction
This script is used to convert [OpenGApps](https://opengapps.org/) flashable zip to a [Magisk](https://github.com/topjohnwu/Magisk) module.

## Requires
* zip
* unzip
* lzip
* tar

### Usage
```bash
  usage : ./convert-opengappss-to-magisk.sh <opengapps flashable zip file> <output directory>

    e.g : ./convert-opengappss-to-magisk.sh gapps.zip ./magisk-template/system
```
### Examples
```bash
./convert-opengappss-to-magisk.sh open_gapps-arm64-9.0-pico-20190920.zip ./magisk-template/system
```
Then you can look `./magisk-template`.It will have a system folder with android `/system` structures.You can zip it into a magisk module zip.

**In this case:**
```bash
cd ./magisk-template
zip -r ../Magisk-opengapps-arm64-9.0-20190920.zip *
```
Finally, you can push this zip file into your device and open `Magisk Manager` flash it.
### Blacklist
It provides a blacklist array in convert-opengappss-to-magisk.sh.
You can modify it to opt which you need.

**Recommend Blacklist:**
* googleonetimeinitializer-all 
* gmssetup-all 
* setupwizarddefault-all 
* setupwizardtablet-all 
* googlepartnersetup-all 
* packageinstallergoogle-all 
* carriersetup-all 
* backuprestore-all 
* googlebackuptransport-all

*This list can fix some devices cannot boot.*

**Full Optional Blacklist:**
* backuprestore-all
* carriersetup-all
* configupdater-all
* defaultetc-common
* defaultframework-common
* extservicesgoogle-all
* extsharedgoogle-all
* gmscore-arm64
* gmssetup-all
* googlebackuptransport-all
* googlecontactssync-all
* googlefeedback-all
* googleonetimeinitializer-all
* googlepartnersetup-all
* gsfcore-all
* setupwizarddefault-all
* setupwizardtablet-all
* soundpicker-all
* vending-arm
* calsync-all
* dialerframework-common
* googletts-arm64
* packageinstallergoogle-all
* 
## Thanks
[OpenGApps](https://opengapps.org/)
[Magisk](https://github.com/topjohnwu/Magisk)
## Lincense
        OpenGapps-For-Magisk-Converter is a free software:
        you can redistribute it and/or modify it under the terms of the
        GNU General Public License as published by the Free Software Foundation,
        either version 3 of the License, or (at your option) any later version.
        
        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.
        
        You should have received a copy of the GNU General Public License
        along with this program.  If not, see <http://www.gnu.org/licenses/>.