- Folder **Bulk-Upload** walks through the process of extracting legacy data to fill in bulk-upload templates before sending them to Wildlife Insights team.
    - `01_clean-exiftool-dataset.ipynb`: This script is used for cleaning the metadata spreadsheet generated by ExifTool.

    - `02_clean-deployment-dataset.ipynb`: This script is used for cleaning the deployments spreadsheet.

    - `03_explore-exiftool-dataset.ipynb`: This script is used for exploring the exiftool metadata spreadsheet.

    - `04_collect-WI-taxon-database.ipynb`: This script is used for fetching species information from Wildlife Insights species database. It also facilitates adding species whose staff-defined common name does not match with Wildlife Insights common name.

    - `05_autofill-template.ipynb`: This script is used for filling bulk-upload templates.

- Folder **Templates** contains pre-defined templates by Wildlife Insights.

- `GoogleDriveToGCP_FFIVietnam.ipynb` is a notebook which facilitates the transfer of camera-trapping images stored on Google Drive to GCP granted by Wildlife Insights for each organization. It is required in this step so that Wildlife Insights has access to the organization's images. Also, this notebook is written so that it is easily executed in Google Colab. Here are a few notices when running this notebook:
    - First and foremost, you must have an email account that has access to the organization's GCP granted by Wildlife Insights to upload/delete files on the GCP. In order to do that, send a request email to *Wildlife Insights Help Center* info@wildlifeinsights.org.   
    - There are four variables you need to define in the notebook before implementation:
        - ```GDFolder```: the path to Google Drive parent folder that contains the images. Example: ```"My Drive/Camera Trap Data/Kon Plong/2019-2020 Survey/Processed images/Final"```
        
        - ```project_id```: the GCP project ID. Consult Wildlife Insigths staff for more information.
        
        - ```bucket```: the organization's GCP bucket name. The bucket name is unique for each organization, contact Wildlife Insights staff for more information.
        
        - ```project_folder```: the folder in GCP where you want to save your images in. Example: ```project_folder = "KONPLONG19-20"```