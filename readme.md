# Cross-Compilation Example with Docker

This project demonstrates how to use Docker as a containerized build environment for cross-compiling C programs from Linux to Windows using PowerShell commands.

## Prerequisites

- Docker installed on your system
- PowerShell

## Building the Docker Image

Build the custom MinGW Docker image using the provided Dockerfile:

```powershell
docker build -t custom-mingw:latest .
```


## Compiling the Program

To compile the C program for Windows, use the following PowerShell command:

```powershell
docker run --rm -v ${PWD}:/work custom-mingw:latest x86_64-w64-mingw32-gcc -o /work/hello.exe /work/src/main.c
```

This command will compile the `main.c` file located in the `src` directory and produce an executable file `hello.exe` in the same directory.


## Performance Considerations
While using Docker for cross-compilation provides a convenient and consistent environment, it's important to note that this approach may result in slower compilation times compared to using a native build chain. This slowdown is primarily due to the overhead introduced by running Docker, which operates in a virtualized environment on Windows. File I/O operations, in particular, can be slower in Docker compared to native tools like MSYS2 or directly using MinGW on Windows.

For small to moderately sized projects, this performance difference might be negligible, but for larger projects or those requiring frequent builds, you may notice longer compile times. If optimal performance is critical for your workflow, consider setting up a native build environment tailored to your specific development needs.

However, Docker's advantages—such as environment consistency, ease of use, and isolation—can outweigh these performance drawbacks, especially in collaborative projects or when working across different platforms. Ultimately, the choice of whether to use Docker or a native toolchain should be based on the specific requirements of your project and development workflow.

