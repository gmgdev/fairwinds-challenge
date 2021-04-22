  <h3 align="center">Fairwinds Technical Challenge</h3>

  <p align="center">
    Munib Ali
    <br />


<!-- Repo Contents -->
<details open="open">
  <summary><h2 style="display: inline-block">Repo Contents</h2></summary>
  <ol>
    <li>
      <a href="#rails-app">Rails-App</a>
      <ul>
        <li><a href="#docker">Built With Docker</a></li>
      </ul>
    </li>
    <li>
      <a href="#terraform">Terraform</a>
      <ul>
        <li><a href="#files">Files</a></li>
      </ul>
    </li>
    <li><a href="#aws">AWS</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
# Rails App

For my basic web application, I decided to build a sample rails application locally make the following updates:
* Create an additional controller
* Update config/routes.rb to point to the new controller
* Uploaded an image to image/assets and referenced it in the view

### Docker

* Created a Dockerfile to package the rails app
* Built and ran the app locally to ensure it works
* Pushed rails app Docker image to DockerHub




# Terraform

To automate the deployment of the EC2 instance and docker pull/run, I decided on using Terraform since I have used Terraform for a large number of projects. 

### Files
* main.tf - includes the main configuration code which specifies the instance type, security groups and provider details
* Outputs.tf - Added this file so we can output the public DNS of the EC2 instance deployed
* ec2docker.sh - This is a basic shell script which includes the Terraform apply command with auto approve option so that the user can deploy the EC2 instance with Docker in a single command

### AWS

* Key pair was created through the CLI and was downloaded to my local machine
* Default VPC had to be created initially since there was none assigned
* AWS credentials were passed using the aws configure command via CLI to avoid hard-coding secrets
* When utilizing Rails 6 for my project, I noticed I was not able to access the ec2 public DNS address at first. After some research it turns out new middleware is included in Rails to prevent against DNS rebinding attacks, therefore I had to clear the entire whitelist in my config/environments/developments.rb file as follows:

 ```sh
 Rails.application.configure do
  config.hosts.clear
end
  ```


<!-- CONTACT -->
## Contact

Munib Ali - munib.ali1@gmail.com





