FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y unzip && \
    apt-get install -y xvfb && \
    apt-get install -y libgl1-mesa-dev && \
    apt-get clean

# Download and install Unity
RUN wget -q https://unity3d.com/get-unity/download/archive/2021.2.0f1/installer/linux -O /tmp/unity-installer && \
    chmod +x /tmp/unity-installer && \
    /tmp/unity-installer --unattended --install-location=/Unity && \
    rm /tmp/unity-installer

# Add Unity to the PATH
ENV PATH="/Unity/Editor:${PATH}"

# Additional setup if needed
# ...

CMD ["bash"]
