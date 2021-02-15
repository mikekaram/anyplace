# Anyplace-ROS Broker
---
Welcome to the tutorial for running the anyplace-ros broker which resides in ROS and provides the common API of the Anyplace endpoints to the ROS network.

In order to test the package, a docker container is provided. Thus, for testing the package, the docker software is necessary. Steps to test the anyplace-ros broker:

## 0. Create the docker image

- If you haven't done already, go to the *.docker* directory and run:

```
./docker_build_rosjava.sh
```
This command will create a docker image which includes the rosjava packages which are necessary for the anyplace-ros package.

## 1. Run the anyplace_ros_broker in a docker container 

- Open a new terminal, go to the *.docker* directory and run:

```
./docker_run_broker.sh
```
This command will run a bash terminal inside a docker container based on the image you created on step 0. The ROS nodes running in this container know the presence of the ROS master and can communicate with it. From this container you should go to the *~/rosjava* directory and run:
```
catkin_make
```
This will build the package once again (hopefully with no errors). After you have built successfully the code, you can deploy the anyplace_ros package by running in the terminal:

> **Note:** Before running the `anyplace_ros_broker`, make sure that the `wireless_interface` parameter in the `anyplace_ros_broker/params/params.yaml` file has been set correctly to your setting.

```
roslaunch anyplace_ros_pkg anyplace_ros_broker.launch
```

This command will initiate a ROS master and then start the anyplace-ros broker. This broker provides the Anyplace services to the ROS network.
> **Note:** If you have errors like the following: `Unable to contact my own server at [http://username:port/]`, then you should run the following commands before running the `roslaunch` command:
> ```bash
> export ROS_HOSTNAME=localhost
> export ROS_MASTER_URI=http://localhost:11311
> ```

## 2. Test the anyplace_ros package from ROS

- Open a new terminal, go to the *.docker* directory and run:

```bash
./docker_run_client.sh
```

This command will run a bash terminal inside a docker container based on the image you created on step 0. The ROS nodes running in this container know the presence of the ROS master and can communicate with it. In this step we try to test the anyplace_ros with a package created in ROS. From this container you should go to the *~/rosjava* directory and run:
```
catkin_make
```
This will build the package once again (hopefully with no errors). After you have built successfully the code, you can deploy the anyplace_ros_client package by running in the terminal:
> **Note:** Before running the `anyplace_ros_client`, make sure that all the parameters in the `anyplace_ros_client/params/params.yaml` file (especially `buid` and `operating_system="linux"`) has been set correctly to your setting.

```bash
roslaunch anyplace_ros_client anyplace_ros_client.launch
```

This will call the /anyplace_ros/estimate_position service of the anyplace_ros_broker (deployed in step 1), with testing data. If the call is successful we should monitor an estimated position of our computer.
> **Note:** If you have errors like the following: `Unable to contact my own server at [http://username:port/]`, then you should run the following commands before running the `roslaunch` command:
> ```bash
> export ROS_HOSTNAME=localhost
> export ROS_MASTER_URI=http://localhost:11311
> ```