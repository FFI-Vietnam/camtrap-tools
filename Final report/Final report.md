# Final report

Created time: June 30, 2021 10:41 AM
Last edited time: September 1, 2021 5:34 PM

# A Proposed Workflow for Camera Trap Project that Integrates Computational and Digital Solutions

# Background

Camera trap is an effective way to monitor quantitatively the appearance of animals in an ecological environment in a specific time period. A camera trap project brings about thousands of data points that can be useful to evaluate the health of an ecological system. Because of this big source of data, however, there come the difficulties of *data pre-processing* before it reaches the data analysis phase, and *data management* afterward. These difficulties have already appeared in Fauna and Flora International Vietnam (FFI Vietnam) current workflow. Habitually, camera trap images are extracted from cameras in the field into a staff computer. The images are then uploaded to OneDrive. One staff then follows a protocol to reorganize the folder structure. Then, a group of biologists start cataloging the images on digiKam; they have to go through the dataset completely, which takes a group of three more than two weeks to finish. After that, they start analyzing the data. The analysis is kept by the scientists in charge but not included in the same data warehouse.

Although the protocol is clear and systematic, there are still places for development. In this report, I demonstrate what I have done during my internship at FFI to address these broad issues and propose a workflow that integrates a lot of advancement in computational and digital solutions that can help reduce the logistical burden for conservationists so that they can use their time more wisely with the data in hand. This proposed workflow is kept suited for FFI Vietnam, but other organizations can adapt accordingly.

**An issue with data pre-processing**

Traditionally, after receiving the data, a group of conservationists needs to collectively go through the whole dataset to find the images with animals and identify them. In this procedure, about 75% of the time they have to look at blank images (this statics is derived from FFI Vietnam's camera trap project in Kong Plong during 2019-2020). Blank images or false triggers, triggers caused by movement of non-animal objects such as falling leaves or swinging grasses, are least interested in data analysis because they bring no more information to the ecological understanding of the location and thus have to be removed. Although this step is crucial to guarantee the credibility of post-processed data and its readiness for analysis, this task is very time-consuming and often needs a group of full-time staff to annotate for weeks, which extends the project duration unnecessarily. Thus, to make camera trap practice more effective and scalable, this step is demanded to be shortened but still maintain the integrity of the data. 

Fortunately, because this task is merely about repetition and pattern recognition, it is very handy for a Machine Learning algorithm. Recently, with the rise of Machine Learning's broad applications in interdisciplinary fields, there have been more and more Machine Learning models that are designed with this purpose in mind. Among them does stand out MegaDetector by Microsoft's scientists as the most powerful, accurate, continually developed, and supported model in the marketplace. 

**Issues with data management**

There are also complications regarding data management accompanied by the tremendous amount of valuable images. Besides ensuring data security, raw data sharing, and proper backups, two other important aspects of data management that are often disrespected in the context of wildlife conservation are its *interactive capability* and *openness to outsiders*, i.e. anyone does not involve in the project, in terms of results showcase and contribution to the world effort. Commonly, all images are centralized in an online cloud storage One Drive where they are, mostly, kept safely as an online backup in addition to a physical backup. However, with the lack of an appropriate interactive user interface, the data on the drive is simply exhaustively static images. Furthermore, images and analysis data are not centralized but distributed across the organization drive, which makes it harder to navigate around a specific project. Thus, it is not useful for staff outside of the project to have a quick glimpse of the images and interact with the dataset if they do not sync the cloud onto their local computer and look at its statistical inferences given they do not read the report. As a result, it hinders new coming staff or external collaborators to instantly acquire a comprehensive understanding of conducted projects. In this fashion, it hinders collaboration to some extent.

Furthermore, since conservation is a global effort, and each knowledge about a particular ecological location can be contributed worldwide so that collectively, they produce a set of complete, timely, accurate, and critical wildlife indicators that expose the global wildlife condition. Moreover, these images also play as a good source to convey a special meaning to engage public interest. It is one effective way to draw public attention, call for proactive community engagement as well as provide people with information about the wildlife's current status. Thus, for wildlife conservation, besides a well-conducted data storing method, these two criteria should also be taken into account in order to enhance camera trap project efficiency, foster collaboration among organizations, and promote data sharing across the globe in order to move towards a global effort.

Many initiatives are trying to resolve these obstacles, and one of them, potentially and trustworthy, is Wildlife Insights.  

# An Introduction to MegaDetector and Wildlife Insights

### MegaDetector

MegaDetector is a product of Microsoft's AI for Earth initiative in the effort to bridge the gap between advanced technology and wildlife conservation. Its only and best feature is detecting objects of interest in an ecological camera trap survey. MegaDetector can help with detecting the appearance of animals, humans, and vehicles to some confidence threshold which can be easily adjusted. It works best with terrestrial mammals so it is very suitable for camera-trap projects on the ground. Moreover, its power lies in the capability to be applied widely across various environments, so it is useful and potential to be used worldwide.  

### Wildlife Insights

Wildlife Insights is an all-in-one platform to systematically and methodologically manage, annotate, analyze, and share camera trap data. It is "a partnership between eight organizations – the core partners – including NGOs (Conservation International, Wildlife Conservation Society, World Wildlife Fund, Zoological Society of London), academic organizations (The Smithsonian Institution, North Carolina Museum of Natural Sciences, Yale University) and a technology company (Google)" [1]. Wildlife Insights has many key features to be considered an overarching digital platform for camera trap projects. It provides a user interface to upload, catalog, and filter images. The images and metadata are stored in a private Google cloud bucket granted to each organization which follows a standardization designed by the Wildlife Insights team. They also integrate an automatic AI that pre-catalog the images once they are uploaded. In terms of facilitating collaboration, the platform displays a camera trap map of all projects joining the platform, allows multiple organizations to collaborate through an initiative, and allows data download by request. Furthermore, Wildlife Insight is also sensitive about privacy given the open data it brings about. It ensures camera trap data stays under the control of the owners, removes data with humans from download requests, and obscures the exact location of rare species.

Incorporated with the most innovative computational solution and infrastructure such as cloud computing, cloud storage, big data, and a notably powerful AI at the core that could be able to identify each animal to species level, Wildlife Insights is proving its leading role to connect the considerable and intellectual camera trap efforts all around the world.

# Objective

In this proposal, I want to propose a comprehensive workflow that goes from the data processing phase, in which I will introduce two new tools that should be incorporated into FFI's current workflow. The two tools are *MegaDetector*, which is developed and maintained by Microsoft's scientists, and *Wildlife Insights*, which is developed by Google's developers in consultation with NGOs and academic institutions. This revised workflow aims to (1) enhance the efficiency of the data pre-processing phase by reducing the time used for annotation but at the same time minimizing the trade-off of replacing manual work with Machine Learning, i.e. accept some data loss but maximize the retrieval of important data; and (2) manage the data more systematically so that the data is interactive and centralized for easy accessibility and quick reference. 

# Methodology

This section describes the experiments conducted so as to evaluate the performance and usefulness of MegaDetector and Wildlife Insights. More broadly, they are assessed on 3 criteria *usefulness*, *inclusivity*, and *user-friendliness.* The *usefulness* considers how well the platform does it job, and how it could leverage FFI staff's productivity. *Inclusivity* encompasses struggles and difficulties FFI staff of various technical backgrounds may face when using the platform, thus ensures the platform can be used by anyone. And *user-friendliness* makes sure the platform is easy to install and the workflow is easy to use. As its experimental nature, it was an incremental process where the result of each experiment was used to informed the next one of the next steps. Findings from all experiments were then used as rationales to decide the extent to which each tool can be used in the camera trap protocol.

### **MegaDetector**

**The first run**

In this experiment, I tried a dry run to quickly gain an experience with MegaDetector. This step was important to know to what extent the model was applicable to Vietnam's forest geographical background.

Initially, I ran MegaDetector on Google Colab to avoid any cumbersome installation and quickly gain an understanding of how the model worked. I let it scan an arbitrary folder from the Kon Plong dataset which was uploaded to my Google Drive and set the confidence threshold to be 0.8 (maximum value is 1, the higher the confidence threshold, the more strictly the user wants the model to make a prediction). The setup took about 10 minutes, nevertheless, the result was magnificent. The model correctly picked up most of the images in which the animal was clearly visible. There was some false negative (animal images classified as blank) where it failed to find animals in blurred images and night images, which had the mixture of flashlight and darkness. And there were many false positives (blank images classified as animals) where it misidentified, for example, a tree branch with an animal. I tested with two more folders and the results were consistent. 

This success indicates two things, (1) the model is capable of detecting animal images on Kon Plong background, so it might work well with a tropical-forest-based camera trap, and (2) its ability to pick up the majority of true positive (correctly classified animal images) given very high confidence threshold suggest that it is useful and may perform better if the threshold is set lower.

After the successful implementation, I wanted to quantify its performance by comparing the predictions with the FFI staff's tags. After that, if the result was significant, I would find a way to embed the MegaDetector result into image metadata so that the MegaDetector tag is filterable by digiKam.

**Performance evaluation**

In this experiment, I wanted to carry out a quantitative evaluation of MegaDetector on Kon Plong's dataset, specifically, evaluate the recall value the model performs on each species. The recall value evaluates the missing rate that the model misses a class by calculating the proportion of correct prediction of a class and the number of images with that class. For example, if the recall value of the model with Annamite striped rabbit is 0.7, it indicates that in 10 images of Annamite striped rabbit, the model will be able to detect 7 and miss 3. This evaluation was important in terms of knowing the model strength and blind-spot and choosing the best threshold that minimizes the missing rate of rare species. 

I compared the model's predictions with the FFI staff's tags, i.e. the ground truth label. A confusion table is created with columns represent the truth label and rows are the model's predictions; all cells default $0$. Because the recall value of each species is needed, a prediction is marked correct if it ignores blank images, classify human as *Human* and any species as *Animal*. I wrote a script to scan through all test images **(~...)** and add $1$ to the cell which features the pairing of the model's prediction and FFI staff's tag. For example, if an image has an Annamite Dark Muntjac but the model fails to detect it, then add $1$ to the cell at column *Annamite Dark Muntjact* and row *Blank*; similarly, if an image is blank but the model claims that there is an animal, then add $1$ to the cell at column *Blank* and row *Animal*. The recall value is then calculated from this table by dividing the number of correct predictions by the total number of images of the same label. For example, the recall value for Annamite Dark Muntjac is calculated with this formula:

$\frac{number Annamite Dark Muntjac As Animal}{numberAnnamiteDarkMuntjav}$

I tuned the threshold to examine the difference in terms of recall value respectively with each threshold. Here are the results.

![Untitled](Images/Untitled.png)

![Untitled](Images/Untitled%201.png)

**Findings ... Not enough data to analyze... wait for Google Drive**

The resulting file is a .json file which would not bring too much interpretability to the results, thus, it is demanding to have a more intuitive way to utilize this result. Next, I will work on tools that could embed these results into the image metadata so that staff can filter images of interest with digiKam.

**Integration with digiKam**

This experiment aims to test the available tools that integrate digiKam-style XMP metadata into images. There is an open-source that is built by Microsoft AI for Earth that directly serves this purpose. In this experiment, I want to manipulate that tool so that it is intuitively usable for non-technical staff.

The code was originally written in python and needed to be executed as a normal python file. Thus, in order to start the application from the source code, users need to install python and lots of dependency packages and start the application from the command-line interface. This approach is not preferred because of its error-prone for non-technical users. Luckily, the developer team provides a compilation script that helps compile the python files into an executable application which can be run on a Windows machine just by double-clicking the desktop icon. I was able to compile the code successfully with the help of an AI for Earth staff. The end file was similar to a normal desktop application that can be started from any Windows machine. For Mac OS, it would require a different compilation. 

I have tested both ways to starting the program, i.e. from the command line and from the compiled desktop application, both gave equivalent accurate performances, and the desktop version was easy to use as well. It could also utilize multi-core to speed up the process and would take only minutes to scan through thousands of images.

![Untitled](Images/digiKam_integration.png)

Integration app to embed XMP results to images

From this point, I have had a complete straightforward workflow with MegaDetector additionally integrated at the stirring of data annotation. As it could be set up and implemented easily on the cloud, i.e. through Google Colab, it has good results on the latest Kon Plong dataset, and it is easy to integrate the results into digiKam workflow, all criteria, i.e. *usefulness*, *inclusivity*, and *user-friendliness*, are all satisfied with this additional platform. The next experiment is a further step to extend the application of MegaDetector. I want to see if MegaDetector is installed on a desktop, is there any advantage of it over running on Google Colab. 

**Desktop installation**

In this experiment, I wanted to download and install MegaDetector on a laptop to see (1) how the installation process was and (2) would running MegaDetector offline bring any more benefit than running it on the cloud.

I followed the steps written on the MegaDetector repository [1] to install MegaDetector onto my laptop which was running the Ubuntu operating system. I expected it to be a quick and straightforward process since I had already had all required environments preinstalled, i.e. python3, Anaconda, and git. But for some reason, it failed. I had an email exchange about this issue with the MegaDetector team but unfortunately, the problem remained unresolved. I also tried to replicate their successful installation on a cloud machine, but it still did not work. 

From this failure, I decided not to include the desktop version of MegaDetector into the workflow because of the complexity of the installation process. Also, because it requires sufficient programming experience, especially with python, to manage the desktop program, this option hinders the effort of non-technical staff to give it a try. After all, Google Colab is the best alternative.

### **Wildlife Insights**

**User interface and AI**

The Wildlife Insights team emphasized that the platform was undergoing constant development, nevertheless, the basic features were complete and ready to use. Because of the vast functionalities, the scope of this experiment was narrow down to basic features that aid the data management process inside the organization. In this experiment, I wanted to examine the basic features of Wildlife Insights, specifically, project creation, image upload, image annotation, data query, AI, and index analysis.

Basically, I interacted with the platform as a normal user. Instructions were clearly stated in the Wildlife Insights user guide. My experience shows that, in general, project creation, image upload, image annotation, and data query were simple and clear-cut. A new user could jump in and take action without watching tutorials. The AI, which was supposed to accelerate the annotation did not work with Kon Plong images. However, this was an expected behavior because none of the images in the training data came from Vietnam, so the AI was apparently confused by Vietnam's ecological backgrounds and species. Furthermore, the analysis function had not been developed yet so it could not be used at this stage as well. There were a lot of conversations between me and the Wildlife Insights team. The AI is undergoing active research so it has not been yet settled. Hence, the current AI model could be replaced, but certainly, there will be regular model retraining in the future given the vast diverse data uploaded to Wildlife Insights daily. Moreover, given some of the demo for the analysis function, once deployed, it would be useful to provide a visual understanding of the data set.

From the firsthand experience with the platform, I found that Wildlife Insights did its job very well as a platform for managing camera trap data, however, it was not useful when it came to digesting MegaDetector results. Hence, using Wildlife Insights for annotating data was not justifiable in this developmental stage. Next, I would utilize one of its functions called bulk upload to upload legacy data so that we could use it as a data management system.

![Untitled](Images/WI_analytics_01.png)

Images from Wildlabs Webinar: "How do I get started with Wildlife Insights?" by Nicole Flores

![Untitled](Images/WI_analytics_02.png)

**Bulk upload**

Bulk upload is a systematic way to upload legacy data to Wildlife Insights, it is a crucial step to upload the images together with metadata to Wildlife Insights presumed that the images are not cataloged on the Wildlife Insights platform. This experiment aims to test the bulk upload process and to design a coding workflow to migrate ExifTool's metadata to match with the Wildlife Insights upload template. 

Wildlife Insights team provides data-migration code, mainly in R, for a variety of data tagging software such as Wild.ID, Camelot, or eMammal. However, there is no code template for digiKam, so I had to write one. There are 2 subtasks needed to be accomplished, (1) fill in the bulk upload templates and (2) transfer images from Google Drive to Google Cloud bucket. For the first subtask, the Wildlife Insights team had provided a set of templates with clear instructions, my task was to write a python script that would fill in those templates from information in 2 available datasheets, i.e. image metadata spreadsheet and camera deployments spreadsheet. For the second task, the Wildlife Insights team provided the code to help upload images stored in Google Drive to the Google Cloud bucket. The template was neat with clear instructions, and it was a Colab notebook written in python. I had also acquired access to FFI's private bucket in the Google Cloud Platform given by Wildlife Insights staff. I followed the notebook instructions with some minor modifications to the code, the experiment was a success.

These two experiments closed the loop of the Wildlife Insights workflow. FFI can store their images on Google Drive and then transfer a copy of each to FFI's private bucket on GCP. Also, FFI staff can use digiKam to annotate images and then use the migration code to organize the information into bulk upload templates.

# Conclusion & Recommendation

The experiments show that it is possible to have an automated code-based workflow for FFI's camera trap projects. For MegaDetector, although the overall accuracy does not guarantee a hundred percent retrieval rate of animal images, its ability to filter most images of large mammals is sufficient for a lot of applications in camera trap surveys whose targets are mammals in an ecological area. On that note, when a staff wants to use MegaDetector to catalog images, they must consider thoroughly the trade-off of losing images of some animals in exchange for the beneficial time reduction. If the trade-off is tolerable for that specific project, then MegaDetector will be useful. Moreover, it is still in constant development by a very supportive team in Microsoft AI for Earth, it is reasonable to expect MegaDetector will perform better and be more contextually applicable as a new model is released. The capability to work with diverse backgrounds makes it highly applicable for camera trap surveys in various geographical locations. Additionally, the fact that anyone can run an instance of MegaDetector on Google Colab with ease makes it accessible and inclusive to any staff with or without programming skills, provided that they have an Internet connection, and online MegaDetector frees staff with worrisome of hardware resources such as powerful CPU or GPU, or cumbersome installation process as well. In summary, because MegaDetector is powerful and easy to use, it can remove the laborious barrier of image annotation, thus accelerate a camera trap project of all scales without too many compromises, which makes camera trap practices more scalable and mainstream as a result.

Wildlife Insights, on the other hand, has not been fully developed, yet its vision to become an all-in-one platform that facilitates every step of data analysis and data sharing is the future of camera trap survey. For the time being, it is no more useful to FFI than a data management resource. Similar to MegaDetector, it is possible to devise a code-based procedure to transfer cataloged data to Wildlife Insights so that FFI biologists can discharge the laborious duty of uploading processed images manually.

### Recommendation and Best Practice

Here is my recommended integrated workflow. This is adapted from *FFI Vietnam camera trap data management protocol (v0.2)* 

![FFI workflow.png](Images/FFI_workflow.png)

**Summary**

1️⃣ **Initial data preparation**

- Create a folder on the camera trap Google Drive to receive the new data
- Finalize the camera trap **deployment spreadsheet**
- Copy the raw images into the correct station folders
- Backup the raw data
- Make a copy ("**processed images**") of the raw data that you will work on
- Fix any images with incorrect dates/times
- Rename all images

2️⃣ **Run MegaDetector with images on Google Drive**

- Create a new folder name **annotated images** outside **processed images**
- Open MegaDetector Colab notebook
- Assign `images_dir` and `output_file_path` with the directory of **processed images** folder on Google Drive
- Assign `visualization_dir` with the directory of **annotated images** folder on Google Drive
- Run MegaDetector ... and wait! (you can estimate the waiting time for ~1.5s / image)
- Google Colab will shut down after running for 12 hours, you have to rerun it again, it will start from where it left off.

**3️⃣ Embed MegaDetector result into images**

- Start digiKam integration app
- Modify the result JSON file, change the image directories from **processed images** to  **annotated images** folder

**4️⃣ Catalog images**

- Catalog **annotated images** with digiKam, use MegaDetector tag in the *Tags* column to filter images with Human and Animal

5️⃣ **Extract image metadata** 

- Extract digiKam tag with ExifTool to **image metadata** spreadsheet

6️⃣ **Auto transfer images from Google Drive to Google Cloud bucket**

- Open GoogleDriveToGCP Colab notebook
- Assign `GDFolder`  with the directory of **processed images** folder on Google Drive
- Authenticate Google account and implement the notebook

7️⃣ **Autofill bulk upload templates**

- Open Bulk upload Colab notebook
- Upload **deployment** spreadsheet and **image metadata** spreadsheet to that notebook to generate filled templates

8️⃣ **Upload to Wildlife Insights**

- Submit templates to Wildlife Insights

# Reference

- Wearn, O. R. "Camera trap data: A suggested approach (2020)"
- Wearn, O. R. "FFI Vietnam camera trap data management protocol (v0.2)"
- Ahumada, Jorge A., Eric Fegraus, Tanya Birch, Nicole Flores, Roland Kays, Timothy G. O’Brien, Jonathan Palmer, et al. “Wildlife Insights: A Platform to Maximize the Potential of Camera Trap and Other Passive Sensor Wildlife Data for the Planet.” Environmental Conservation 47, no. 1 (March 2020): 1–6. [https://doi.org/10.1017/S0376892919000298](https://doi.org/10.1017/S0376892919000298).
- Beery, Sara, Dan Morris, and Siyu Yang. “Efficient Pipeline for Camera Trap Image Review.” ArXiv:1907.06772 [Cs], July 15, 2019. [http://arxiv.org/abs/1907.06772](http://arxiv.org/abs/1907.06772).

# Appendix

### **Different ways to run MegaDetector**

There are three ways to proactively run MegaDetector provided in its GitHub repository, they are (1) download and execute the source code on a local computer, (2) do the same thing but on Google Colaboratory (or Google Colab)*, and (3) send API requests to MegaDetector server hosted on Microsoft Azure**. The first option demands the user to have appropriate knowledge of programming in python. Once downloaded and compiled successfully, MegaDetector can be implemented on the local computer, it will take advantage of the hardware (if there is), and does not need an Internet connection. However, the installation process could be cumbersome and error-prone if the instruction is not carefully followed or there is an environmental conflict. Meanwhile, the second and third options do not require a manual installation or prior python knowledge but take advantage of cloud computing. For the second step, a contributor had set up a Google Colab notebook which formulated a complete workflow to run MegaDetector on Google Colab just by clicking the buttons. This template is then used by the MegaDetector team. Despite the effortless initialization, however, this template assumes that the images are stored on Google Drive as it reads the images by mounting to the user's Google Drive with authentication and read the images in specific folders. These folders are specified by the user at their least modification to the template. The last option frees the users from trouble with any line of code, nevertheless, they still need to write a JSON-format request to be able to send API requests to the MegaDetector server. The instruction for this is well documented in the MegaDetector [repository](https://github.com/microsoft/CameraTraps/tree/master/api/batch_processing). Moreover, users need to store their images on Microsoft's Azure storage in order to make the request.

**Google Colaboratory, or Google Colab, is a cloud-based product from the Google research team which supports running python code directly on a web browser without any prior configuration of the language. The Colab file format is called a notebook, a notebook comprises code blocks or code cells, and the python codes are executed cell by cell in any order. It will store the result of each cell and pass it to the next in the implementation chain. A Colab notebook is easy to set up, the only requirement is a Google account, and its free service is more than enough for normal tasks.* 

***Microsoft Azure is a cloud computing infrastructure developed by Microsoft. In this context, Microsoft provides some Azure cloud machines to host MegaDetector. Users can send API requests to these machines so that it will run MegaDetector on their images and return the results very quickly. In this fashion, users can take advantage of parallel computing as MegaDetector will initialize at most 6 parallel instances to run the model.* 

### How to run MegaDetector on Google Colab

...