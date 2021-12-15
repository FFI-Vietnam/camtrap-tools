- Folder **Data Analysis** contains the code to generate graphs and tables to evaluate MegaDetector results presented in this [report](https://panda1835.notion.site/A-proposal-of-applying-MegaDetector-and-Wildlife-Insights-in-camera-trapping-project-at-Fauna-Flor-365b8d3321c14366b19b799f7ff469b5). The workflow in this folder can be used as a template to evaluate other Deep Learning model as well. Moreover, these scripts are utilized to run on Google Colab, rather than running locally with jupyter notebook, so you may want to click on "Google Colab badge" on top of each notebook to open a version of it in Google Colab. 
    - `01_ground-truth-from-metadata.ipynb`: This script walks through the process of extracting ground-truth data from exiftool metadata file to compare with MegaDetector predictions later. It also groups 3s-consecutive images into a group.

    - `02_add-conservation-status.ipynb`: This script updates a database of specis (in the dataset) with conservation status from IUCN redlist. The original database of species is created by 04_collect-WI-taxon-database.ipynb in Wildlife Insights folder.

    - `03_create-confusion-matrix.ipynb`: This script evaluates recall accuracy of MegaDetector from a ground-truth dataset and its predictions.

    - `04_create-visualization.ipynb`: This script evaluates recall accuracy of MegaDetector from a ground-truth dataset and a result json file. It also creates a set of visualization of recall values on each group of species.

    - `05_create-decision-tree.ipynb`: This script aims to create a decision tree to inform staff when to use MegaDetector (this is not useful indeed!)

- `Megadetector_Colab_FFIVietnam.ipynb` is a FFI-Vietnam adapted version of [MegaDetector v4.1](https://github.com/microsoft/CameraTraps) developed by Microsoft AI for Earth. Click to this badge to open the notebook on Google Colab
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/FFI-Vietnam/camtrap-tools/blob/main/MegaDetector/Megadetector_Colab_FFIVietnam.ipynb). It uses [CameraTraps-FFIVietnamAdaptation](https://github.com/FFI-Vietnam/CameraTraps-FFIVietnamAdaptation) and [ai4eutils-FFIVietnamAdaptation](https://github.com/FFI-Vietnam/ai4eutils-FFIVietnamAdaptation). Here are parameters need changing to run it properly with a new project:
    - ```images_dir```: replace *[Image_Folder]* with the parent Dataset folder on Google Drive in `/content/drive/My Drive/[Image_Folder]`. For example: `images_dir = '/content/drive/My Drive/Camera Trap Data/Kon Plong/2019-2020 Survey/Processed images/Final'`

    - `output_file_path`: replace *[Output_Folder]* with the folder on Google Drive where you want to store the output file, and *[output_file_name.json]* with the output file name in `'/content/drive/My Drive/[Output_Folder]/[output_file_name.json]'`. For example: `output_file_path = '/content/drive/My Drive/Camera Trap Data/Kon Plong/konplong-MegaDetector-result.json'`

    - `checkpoint_file_path`: keep the *[Output_Folder]* specified above, only update *[checkpoint_file_name.json]* with the name of checkpoint file in`'/content/drive/My Drive/[Output_Folder]/[checkpoint_file_name.json]'`. Notice that there is no checkpoint file in the first run, but in the second run forward, there's a new checkpoint file created with name like `checkpoint_20210918055047.json`. Update it before new re-run so that it does not re-process images which already processed in previous run. For example: `checkpoint_file = '/content/drive/My Drive/Camera Trap Data/Kon Plong/checkpoint_20210918055047.json'`

    - `visualization_dir`: replace *[Visualization_Folder]* with the visualization folder on Google Drive where you want to hold the bounding boxes images in `'/content/drive/My Drive/[Visualization_Folder]'`. For example: `visualization_dir = '/content/drive/My Drive/Camera Trap Data/Kon Plong Bounding Boxes'`

    - `confidence_threshold`: update it with the confidence threshold that you define. For example, `confidence_threshold=0.8` means drawing bounding boxes on animal/human where MegaDetector is at least 80% confident.

- `keep-colab-alive.py` is a python snippet that automatically simulates mouse-click on the screen for every 30s in order to ... prevent Google Colab from shutting down! Google Colab (in Free or Pro subscription) usually terminates after several hours of running. This script helps simulate the human interaction with Google Colab when you want to run in overnight or through day long in a beautiful weekend.
