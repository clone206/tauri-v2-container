# tauri-v2-container
Container code for building Linux packages for a Tauri v2 app. This ubuntu-based container image seems to offer the lowest possible version of glibc out of the box, while still providing webkit2gtk 4.1, which is needed for Tauri v2 apps. The packages generated can then be used on any Linux system with at least the same version of glibc as the ubuntu image.

## Using
- Place all files next to your src and src-tauri directories.
- With docker installed, run `./build_run_docker.sh`.
  - This should open a shell into the mounted current working directory.
  - **NOTE**: This will delete your `src-tauri/target` directory.
- Run `npm i` in the container's shell
- Run `npm run tauri build` in the container's shell.
  - This will create the packages for the architecture of the host computer, as the ubuntu docker image is multi-arch. They will be placed in your `src-tauri/target` folder, which was mounted into the container on run.
