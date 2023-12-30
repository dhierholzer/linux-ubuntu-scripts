<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/dhierholzer/linux-ubuntu-scripts/main/Linux-Ubuntu-Scripts.png" style="height:75%;width:100%;" alt="Linux Scripts"></a>
</h1>

<h4 align="center">Custom Linux Ubuntu Scripts Created For 3 Different Use Cases</h4>


<p align="center">
  <a href="#installation">Installation</a> •
  <a href="#features">Features</a> •
  <a href="#documentation">Documentation</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#credits">Credits</a> •
  <a href="#support">Support</a> •  
  <a href="#license">License</a>
</p>

---

<table>
<tr>
<td>
  
**Linux Ubuntu Scripts** are a set of scripts that were created to satisfy 3 different use cases. 

The First Use Case is to help with **Initial Software Installation**. As this name Implies, This script is designed to be used right after a fresh installation of Ubuntu Server. This sort of script typically only needs to be ran once per installation. 

The Second Use Case is to help the server admin with day-to-day operations by providing **Lazy Commands**. The term Lazy Command is used because it allows admins to execute long multi-string commands using only a single word. This script adds the lazy commands as well as making them global so that they can be run from any directory and thus only need to be ran once.

The Third Use Case is to help with **New Client Services**. An example of this would be adding a new domain to a web server, or creating a new client database. The scripts that are designed to satisfy this Use Case might be used regularly or rarely depending on how frequently this type of job is requested.

![Linux Ubuntu Scripts](https://raw.githubusercontent.com/dhierholzer/linux-ubuntu-scripts/main/SoftwareSelect.png)
<p align="right">
<sub>(Preview)</sub>
</p>

</td>
</tr>
</table>

## Installation

> [!NOTE]  
> This Installation Section Is still being worked on and is not yet completed.


##### Cloning & Running:
1. **[Git Clone](https://github.com/dhierholzer/linux-ubuntu-scripts.git)** the latest version of this repository.

2. 

3. **_Profit_** 

> [!IMPORTANT]  
> You must first make the scripts Executable by using chmod u+x TheScriptNameHere.sh


## Features

##### Use Case 1: Initial Software Installation
##### Script Name: Configure-Ubuntu-Server.sh

|        Name         |               Description               | Tested 20.04 | Tested 22.04 |                   Other Notes                     |
|:-------------------:|:---------------------------------------:|:------------:|:-------------:|:------------------------------------------------:|
| `All PHP Packages`  | PHP 7.0 - 8.2 plus update-alternatives  |      ✅       |       ✅      |   Using 22.04 It thows error, but still works.   |
|      `Apache2`      |          Apache2 Web Server             |      ✅       |       ✅      |        You must install MySQL & PHP As Well.     |
| `Build Essentials`  |Contains the GNU/g++ Compiler Collection |      ✅       |       ✅      |                    None                          |
|       `Rust`        |          Rust Along With Cargo          |      ✅       |       ✅      |                    None                          |
|       `GIT`         |          		Git                     |      ✅       |       ✅      |                    None                          |
|     `Composer`      |      manages dependencies of PHP        |      ✅       |       ✅      |                    None                          |
|    `JRE & JDK`      |          Java Runtime & Dev Kit         |      ✅       |       ❌      |               Untested on 22.04                  |
|      `MySQL`        |                MySQL                    |      ✅       |       ✅      |           Need to set Admin Password             |
|      `Nginx`        |           Nginx Web Server              |      ✅       |       ✅      |    Requires Extra config to use with Apache2     |
|      `Redis`        |         Redis NoSQL Database            |      ✅       |       ✅      |       This Version is compiled from scratch.     |
|      `GoLang`       |               GoLang                    |      ❌       |       ❌      |       Not Tested but code seems solid.           |
| `Curl & Zip/Unzip`  |             Curl And Unzip              |      ✅       |       ❌      |               Untested on 22.04                  |
|    `Lets Encrypt`   |        Creates SSL Certificates         |      ✅       |       ❌      |               Untested on 22.04                  |
|     `Laravel`       |       Web App Framework using PHP       |      ❌       |       ❌      |                  Untested                        |
|      `Ruby`         |                 Ruby                    |      ✅       |       ✅      |                    None                          |
|     `Python`        |             Python 2 & 3                |      ✅       |       ❌      |           Possible Issues on 22.04               |
|  `Node.js & NVM`    |        Node.js with NVM manager         |      ✅       |       ✅      |                    None                          |
|     `Clang 17`      |                Clang 17                 |      ✅       |       ❌      |               Untested on 22.04                  |





## Documentation


## Contributing

Got **something interesting** you'd like to **share**? Learn more (coming soon)
        


## Credits

| [![dhierholzer](https://avatars.githubusercontent.com/u/12091032?v=4)](https://github.com/dhierholzer)  | 


## Support

Reach out to me via the **[profile addresses](https://github.com/dhierholzer)**.

## License

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
