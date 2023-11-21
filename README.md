<!-- Improved compatibility of back to top link: See: https://github.com/charan3844/GitPacker/ -->
<a name="readme-top"></a>

<!--
*** Thanks for checking out the README.md. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Issues][issues-shield]][issues-url]


  <h3 align="center">DTS</h3></strong></a>

  <p align="center">
   Readme file explained about the DTS and how to build the Azure Custom Image using Packer tool.
    <br />
    <a href="https://github.com/eng-citrix/image-creation-pipeline"><strong>Explore the docs »</strong></a>
    <br />  
    <a href="https://github.com/eng-citrix/image-creation-pipeline/issues">Report Bug</a>
    ·
    <a href="https://github.com/eng-citrix/image-creation-pipeline/settings">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-Repository">About The Repository</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#Image build">Build Image</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Repository

In this pipeline, we are going to build the Azure custom image and then publish to image gallery using the Packer tool and Code hosting platform for Version control and collaboration i.e, GitHub. 

Use the `README.md` to get started.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Built With

This section should list any major frameworks/libraries used to bootstrap the build image.
For this business unit Image Framework is built using GitHub on Azure Cloud with the Packer tool.

* [![GitHub][GitHub]][GitHub-url]
* [![Azure][Azure]][Azure-url]
* [![Packer][Packer]][Packer-url]
  

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

Before going to start the build Azure custom, we need the below prerequisites.

### Prerequisites

To Migrate environment, for that below to list things you need to use the software and how to install them.
* Git
* GitHub
* GitHub Actions
* Microsoft Azure
* Self hosted runner 
* Packer

<!-- ROADMAP -->
## Roadmap

- [x] Intial set up the GitHub
- [x] Create a one VM on the Azure Cloud for self hosted runner
- [x] Setup the Self hosted runner on the GitHub and install the required software's on the Self hosted runner
- [x] Integration of Azure Cloud with the GitHub/GitHub Actions using OIDC model
- [x] Create the Packer Build file on JSON format
- [x] Create YAML/workflow file
- [x] Fix the issues
- [x] Build the Azure Custom Image using packer build
- [ ] Publish the Image
- [ ] Migrate the Image
      

See the [open issues](https://github.com/eng-citrix/image-creation-pipeline/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

  
### Installation

How we can install the software's

1. Download and Install the Git using below URL.

   ```sh
   https://git-scm.com/
   ```
   
2. Clone the repo using https method
   ```sh
   git clone https://github.com/eng-citrix/image-creation-pipeline.git
   ```
3. Install Packer
   ```sh
   https://developer.hashicorp.com/packer/install
   ```
4. Install the all required software's on the Self hosted runner which we are created on the Azure cloud.

### Build Image

1. Setup the Azure cloud environment and the GitHub.
2. Create one self hosted runner, in this pipeline we are using the `dts-image-runner` theat to Windows.
3. Install the all required software's and pre requisites on the Self hosted runner.
4. Pass the Azure credentilas and sensitive data in the GitHub secrets environment and as well pass the Variable's on the GitHub environment variable section.
6. To build the Image, create a Packer script in JSON format, Check the `DTS/Packer/PackerImageTemplate.json`.
7. Pass the Variable's on the variable JSON file. Check the `DTS/Packer/Variables.json`.
8. For software installation, use the one scripting language i,e PowerShell and put all required Software's and the Image Path's on the .PS1 file. Check the `DTS/PowershellScripts`.
9. Once script build, create the YAML to run the pipeline, Check the workflow file `image-creation-pipeline/.github/workflows/main.yml`.
10. In the YAML file, we are used the OIDC model to login the Azure cloud and used the Managed Identiry to build the Packer Image.
11. All the file's are stored on the `DTS` folder.
12. To build the Image, run the command/add the command on YAML file as `packer build -force "-var-file=DTS/Packer/Variables.json" DTS/Packer/PackerImageTemplate.json`.
 
   
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

1. Create a one Repository or else Fork the Repository
2. Create your Feature Branch (`git checkout -b Branchname`)
3. Commit your Changes (`git commit -m "Branchname"`)
4. Push to the Branch (`git push -u origin main`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Devara Saicharan - saicharan.devara@cloud.com

Project Link: [https://github.com/eng-citrix/image-creation-pipelin.git](https://github.com/eng-citrix/image-creation-pipeline.git)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[forks-shield]: https://img.shields.io/github/forks/charan3844/GitPacker.svg?style=for-the-badge
[forks-url]: https://github.com/charan3844/GitPacker/network/members
[issues-shield]: https://img.shields.io/github/issues/eng-citrix/image-creation-pipeline.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues

[Packer]: https://img.shields.io/badge/Packer-000000?style=for-the-badge&logo=Packer&logoColor=blue
[Packer-url]: https://developer.hashicorp.com/packer/integrations/hashicorp/azure
[GitHub]: https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=GitHub&logoColor=white
[GitHub-url]: https://github.com/
[Azure]: https://img.shields.io/badge/Azure-007FFF?style=for-the-badge&logo=MicrosoftAzure&logoColor=white
[Azure-url]: https://portal.azure.com

