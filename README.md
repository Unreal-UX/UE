**A Template repo to speed up your Unreal Engine development on Windows**

- You can use it as a [Template Repo](https://css-tricks.com/using-github-template-repos-to-jump-start-static-site-projects/) or fork it. _I would reccommend using it as a template so you can make your work [private](https://gist.github.com/0xjac/85097472043b697ab57ba1b1c7530274)_.
- Make sure whatever name you give it is short, if you intent to do CI/CD. This will help save you from running over the 256 character limit on windows. The [Long FileNames](/Tools/LongFileNamesEnabled.reg) may help with this, but there are intermittent reports of success.
- Make sure you have [git Large File Storage](https://docs.github.com/en/github/managing-large-files/configuring-git-large-file-storage) enabled
- Running [SetupUnreal.bat](SetupUnreal.bat) should initialize the Unreal Repo as a submodule and add it to your computer, as well as pull dependancies, generate project files, and build once. 
  - You may find that you are missing [.Net 4.6.2 Dev Pack](https://dotnet.microsoft.com/download/dotnet-framework/thank-you/net462-developer-pack-offline-installer), as well as the [windows 10 sdk](https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk) 

# Working in the template repo

**Unreal Engine** should be setup as a [Submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) in the /UnrealEngine/ folder. In order to pull the submodule you will need to make sure you have [access to the Unreal Engine repo](https://www.unrealengine.com/en-US/ue4-on-github).

the **/Projects/** folder is where you should create your various Unreal Engine Projects

## Setting up CI/CD

You will need to add your [Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) to [GitHub Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) named PAT. It is then available to your actions runners as ${{secrets.PAT}}.

### GitHub Actions Runners
There is an included wokflow that can be altered to run on GitHub's Action runners, unfortunatly it will run out of space on those runner at this time, as they are 2 CPU, 7Gigi of ram, and under 20gigs of HD space (14 afaik, but some may be 10gig).

### Self Hosted Runners
There are 2 included workflow that will run on a [self hosted runner](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners). One of the included workflows shows how to start and stop an Azure VM to build on, the other uses your local machine. They both take steps beyond building, and some of those steps may fail, feel free to delete them. 
When you setup the self hosted runner, you will need to make the paths as short as possible. I suggest the following changes
- unzip it in a folder called build at the root of a drive (C:\ or D:\)
- make the working folder called w (full path c:\build\w\ 
when everything runs locally it will end up in a structure like C:\build\w\UE\UE\*

## Switching to your own Fork of Unreal Engine

You can switch the github repo that you use for the submodule. In theory, simply editing the [.gitmodules](.gitmodules) file with an updated URL of your Unreal Engine fork (replacing https://github.com/EpicGames/UnrealEngine.git), and then re-syncing the submodule [should do the trick](https://stackoverflow.com/questions/913701/how-to-change-the-remote-repository-for-a-git-submodule).


### Keeping your own Fork of Unreal Engine in sync

If you want to automate syncronizing your fork with the main UnrealEngine repo you can use the [included github action to do so](.github/workflows/UE4-Mirror-Release.yml)
- You will need to add your [Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) to [GitHub Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) named PAT. This token needs to have access to your UnrealEngine fork, and the main [UnrealEngine](https://github.com/epicgames/unrealengine) repo. 
