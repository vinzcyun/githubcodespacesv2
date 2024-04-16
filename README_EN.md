<div align="left">
<a href="/README_EN.md">English</a> &nbsp;|&nbsp;
<a href="/README.md">Tiếng Việt</a>
</div>


# • Creating a VPS with Github Codespace

## • Introduction

GitHub Codespaces is a service by GitHub that allows you to develop online in an automatically created development environment. This reduces the workload of setting up a development environment on a local machine and provides a strong and flexible development experience.

## • Setup

1. Access [GitHub Codespaces](https://github.com/features/codespaces) in your web browser.

2. Create an account to use.

3. Make a new repo on the official [GitHub](https://github.com/) page.

4. Input Docker VM configurations to create a Codespace.

5. Codespace will be created on the repo you are working on.

## • Setup through Terminal

```
sudo su
wget -O install.sh https://raw.githubusercontent.com/vinzcyun/githubcodespacesv2/main/install.sh
chmod +x install.sh
./install.sh
```


## • How to Restart VPS when Codespaces Stops Working

### • How to Start

You can restart the VPS by [clicking here](https://github.com/codespaces)  Select the repo where you have created the VPS and click Open in => Open in browser.

### • Command to Start

Go to the Terminal of Codespace and paste this command

```
sudo su
wget -O restart.sh https://raw.githubusercontent.com/vinzcyun/githubcodespacesv2/main/restart.sh
chmod +x restart.sh
./restart.sh
```


Then wait about 30 seconds for the system to run.

After that time, you can access VNC to use the VPS.

## • Features

Speedtest internet speeds of the virtual environment.

The interface has become more user-friendly.

Compatible with iso files from Linux, Ubuntu, CentOS to Windows (Windows 11 may have issues due to Microsoft's security policies about TPM 2.0 security chips, it is recommended to use Windows versions like ReviOS 11 or Tiny 11 for the best experience).

## • Minor Notes

Due to GitHub's policy, Codespaces can only operate for no more than 50 hours (can be extended with a GitHub subscription package).

Some errors may occur during installation such as: iso files being corrupt or getting stuck on Captcha authentication, Ngrok AuthToken may have expired, entering configurations too high compared to the standards.

Abuse may lead to your account being flagged and consequently locked.
