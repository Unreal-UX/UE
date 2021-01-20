**A Template repo to speed up your Unreal Engine development**

- You can fork it, or use it as a [Template Repo](https://css-tricks.com/using-github-template-repos-to-jump-start-static-site-projects/)
- Make sure whatever name you give it is short, if you intent to do CI/CD as you may run over the 256 character limit on windows. The [Long FileNames](/Tools/LongFileNamesEnabled.reg) may help with this.
- Make sure you have [git Large File Storage](https://docs.github.com/en/github/managing-large-files/configuring-git-large-file-storage) enabled

# Working in the template repo

**Unreal Engine** should be setup as a [Submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) in the /UnrealEngine/ folder. In order to pull the submodule you will need to make sure you have [access to the Unreal Engine repo](https://www.unrealengine.com/en-US/ue4-on-github).

the **/Projects/** folder is where you should create your various Unreal Engine Projects

## Setting up CI/CD

- You will need to add your

**GitHub Actions Runners**
- There is an included wokflow that runs on GitHub's Action runners, unfortunatly it will run out of space on those runner at this time

**Self Hosted Runners**
- 

## Switching to your own Fork of Unreal Engine

### Keeping your own Fork of Unreal Engine in sync
