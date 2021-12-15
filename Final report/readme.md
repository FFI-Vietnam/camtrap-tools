# Final report (2021-09-27)

Created time: September 27, 2021 4:02 PM
Last edited time: September 27, 2021 9:48 PM

# An assessment and proposal of applying MegaDetector and Wildlife Insights in camera-trapping project at Fauna & Flora International - Vietnam Programme

# Background

Camera-trapping is an effective way to quantitatively monitor the presence of animals in an ecological system in a specific time period. A camera trap project produces thousands of data points that can be leveraged to evaluate the health of an ecological system. However, due to the large availability of data, there exist difficulties of *data pre-processing*, selecting images that contain animals, and *data management*, especially after the completion of data analysis. These difficulties have been presented in the current workflow of Fauna & Flora International - Vietnam Programme, thereafter referred to as FFI Vietnam, which I will try to solve in this report. All the codes that are used to generate the results featured in this report can be found at [FFI-Vietnam/camtrap-tools](https://github.com/FFI-Vietnam/camtrap-tools) repository.

### **Summary of FFI Vietnam camera trap data management protocol**

After the cameras are retrieved from the field, camera trap images are extracted from the SD cards into a staff computer and uploaded to OneDrive into a clearly-defined project folder. At the same time, an Excel spreadsheet which has the information of camera-trapping deployments such as date-time setup, date-time retrieval, geographic location, etc,. is finalized. After that, an FFI Vietnam staff member will reorganize the OneDrive project directory following a folder structure convention; this task is usually done by using camtrapR (an R library designed for camera-trapping). When the images are properly stored on OneDrive, a group of biologists will start cataloging the images on digiKam. digiKam is an all-purpose image management software that allows a flexible hierarchical tagging system, which is suitable for tagging species to different taxonomic levels. As they have to go through the entire dataset, it often takes more than two weeks to catalgue all images for a group of three conservationists. After that, they start analyzing the data. The analysis is kept by the conservationists in charge but is not included in the shared storage.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled.png)

An example of cataloging images with digiKam

Although the protocol is clear and systematic, there is still room for improvement. There are two ready-made tools, namely MegaDetector and Wildlife Insights, can help reduce the logistical burden for conservationists so that they can use their time more effectively with the data in hand. In this report, I demonstrate what I have done during my internship at Fauna & Flora International - Vietnam Programme (June to September 2021) to explore these off-the-shelf technologies that help solve some practical issues inherent in this protocol. The assessment and proposed workflow are based on and kept suited for camera-trapping projects at FFI Vietnam, but other organizations can adapt accordingly.

### I**ssues with data pre-processing**

Traditionally, after receiving the data, a group of conservationists needs to collectively go through the whole dataset to find the images with animals and identify them. In this procedure, about 75% of the time they have to look at blank images (this statistics is derived from FFI Vietnam's camera trap project in Kong Plong during 2019-2020). Blank images, otherwise known as false triggers caused by movement of non-animal objects such as falling leaves or swinging grasses, are not used in data analysis because they do not contribute any information to the ecological understanding of the location and thus have to be removed. Although human-intensive species identification is crucial to guarantee the credibility of post-processed data and its readiness for analysis, its time-consuming nature often requires a group of full-time staff to annotate for weeks, which can cause unwanted delays for the project. Thus, for camera-trapping to be effective and scalable, this step must be condensed whilst still maintaining the accuracy of the data. 

Because cataloging animal images is merely about repetition and pattern recognition, it is very amenable to automation using Machine Learning algorithms. Recently, with the rise of Machine Learning's broad applications in interdisciplinary fields, there have been more Machine Learning models that are designed with this purpose in mind. Among them, the MegaDetector by Microsoft stands out as the most powerful, accurate, continually developed, and supported model in the marketplace. 

### **Issues with data management**

With the high volume of images, there are also complications regarding data management. Besides ensuring data security, raw data sharing, and proper backups, two other important aspects of data management that are often neglected in the context of global wildlife conservation are its *interactive capability* and *openness to outsiders,* i.e. anyone who is not involved in the project.

Commonly, all images are centralized in an online cloud storage such as One Drive where it is serving as an online backup in addition to a physical backup. However, due to the lack of an appropriate interactive user interface, the data on the drive is simply static images. Furthermore, images and analysis data are not centralized but distributed across the organization's drive, which makes it harder to navigate around a specific project. Thus, it is not easy for external parties to have a quick glimpse of the images and statistical inferences and interact with the dataset if they do not sync the cloud onto their local computer. As a result, new staff or external collaborators are hindered from the static data to instantly acquire a comprehensive understanding of finished projects. In this fashion, to some extent, it hinders collaboration.

Furthermore, conservation is a global effort and every piece of knowledge about a particular ecological location can be contributed worldwide so that collectively, they produce a set of complete, timely, accurate, and critical wildlife indicators that shed light on the global wildlife condition. Moreover, these images can also be used as a tool for engaging public interest in nature and particular species of conservation concern. It is an effective way to draw public attention, call for proactive community engagement as well as provide people with information about the wildlife's current status. Thus, for wildlife conservation, besides a well-conducted data storing method, these two criteria, i.e. *interactive capability* and *openness to outsiders,* should also be taken into account in order to enhance the efficiency of camera trap projects, foster collaboration among organizations, and promote data sharing across the globe. Currently, many initiatives are attempting to resolve the aforementioned obstacles, one of which is Wildlife Insights.  

As discussed so far, there are many logistical issues inherent in the current protocol that hinder the effectiveness of camera-trapping projects. In terms of data analysis, going through the entire dataset for species identification often costs time. In terms of data management, using a cloud storage as the only data container makes it difficult to access and understand for external parties. And as also mentioned, there are two tools that are designed to target these issues, namely MegaDetector and Wildlife Insights. MegaDetector could be used to remove blank images more quickly, thus reduces the tagging burden for conservationists. While Wildlife Insights is a great platform to store and showcase camera-trapping image. These tools will be introduced, assessed, and proposed in the rest of the report. 

# An Introduction to MegaDetector and Wildlife Insights

### MegaDetector

MegaDetector is a product of Microsoft's AI for Earth initiative, developed as an effort to bridge the gap between advanced technology and wildlife conservation. Its best feature is detecting objects of interest in an ecological camera trap survey. MegaDetector can help with detecting the appearance of animals, humans, and vehicles to some confidence threshold, which can be easily adjusted. It works best with terrestrial mammals, which makes it a suitable choice for camera-trapping projects on the ground. Moreover, its power lies in its ability to work with camera-trapping images from different locations around the world, which forms the rationale for using it with images from Vietnam despite the lack of Vietnam-based images in the training data.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%201.png)

An example of MegaDetector Animal detection

### Wildlife Insights

Wildlife Insights is an all-in-one platform that systematically and methodologically manages, annotates, analyzes, and shares camera trap data. It is "a partnership between eight organizations – the core partners – including NGOs (Conservation International, Wildlife Conservation Society, World Wildlife Fund, Zoological Society of London), academic organizations (The Smithsonian Institution, North Carolina Museum of Natural Sciences, Yale University) and a technology company (Google)" [1]. Wildlife Insights has four key features to be considered an overarching digital platform for camera trap projects. Firstly, it provides a user interface to upload, catalog, and manage images. The images and metadata are stored in a private Google cloud bucket granted to each organization, which follows a standard designed by the Wildlife Insights team. Secondly, it also integrates an automatic AI that pre-catalog the images once they are uploaded. Thirdly, in terms of facilitating collaboration, the platform displays a camera-trapping map of all projects on the platform, allows multiple organizations to collaborate through an initiative, and allows data download by request. Furthermore, Wildlife Insights is also sensitive about privacy, thus ensuring that camera trap data stay under the control of owners, removing data containing humans from download requests, and obscuring the exact location of 'sensitive' species (in particular those that are threatened by illegal wildlife trade).

Incorporated with the most innovative computational solution and infrastructure such as cloud computing, cloud storage, big data, and a notably powerful AI at the core that is capable of identifying animals to the species level, Wildlife Insights is proving its leading role in connecting intellectual camera trap efforts all around the world.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%202.png)

Wildlife Insights' camera-trapping map

# Objective

In this report, I assess the usefulness of two novel tools for FFI Vietnam's camera-trapping projects and propose a comprehensive workflow in which those tools are utilized. The two tools are 1) *MegaDetector*, which is developed and maintained by Microsoft's scientists, and 2) *Wildlife Insights*, which is developed by Google's developers in consultation with NGOs and academic institutions. First and foremost, the revised workflow aims to enhance the efficiency of the data pre-processing phase by reducing the time used for annotation but at the same time minimizing the trade-off between replacing manual work with Machine Learning, i.e. to accept some data loss but maximize the retrieval of important data. At the same time, the revised workflow seeks to manage the data more systematically so that the data is interactive and centralized for easy accessibility and quick reference. 

# Methodology

This section describes the experiments conducted so as to evaluate the performance and usefulness of MegaDetector and Wildlife Insights. MegaDetector v4.1 was used for the assessment. They are assessed on 2 criteria: *usefulness* and *accessibility.* The first criterion, *usefulness,* considers the functionality of the platform, and how it could increase FFI Vietnam staff's productivity. The second criteria, *accessibility,* encompasses the struggles and difficulties that FFI Vietnam staff of various technical backgrounds may face when using the tools, thus ensuring that the platform is easy to install and used by anyone. All the tests and assessments were done using the Kon Plong dataset (110K images), which was the results of the two-phase 2019-2020 surveys conducted in Kon Plong forest, Kon Tum by FFI Vietnam in partnership with other NGOs, e.g. GreenViet. Due to its experimental nature, the process was an incremental process where the result of each experiment was used to inform the next one. Findings from all experiments were then used as evidences to decide the extent to which each tool can be used in the camera trap protocol.

There are some terminologies that I will use throughout the Methodology and Evaluation. Firstly, "model" refers to the MegaDetector model, "class" refers to the model classification category. MegaDetector has an important parameter which is called "confidence threshold". The confidence threshold has continuous values and ranges between $0$ and $1$; the higher the confidence threshold is, the more strictly the user wants the model to make a prediction. From this point, whenever the term "threshold" is used with MegaDetector, it refers to the confidence threshold. MegaDetector has three classification classes. It classifies an image into one of the three categories Animal-Human-Blank (there is Vehicle but it is ignored in this report). Secondly, in terms of describing the detection class, I use *Positive* to indicate Animal and Human class, and *Negative* to indicate Blank class. To describe the accuracy of the prediction, *True* and *False* are used to indicate the correctness of the prediction. When they are combined, there are four types of prediction accuracy classes, namely, *True Positive*, *True Negative*, *False Positive*, and *False Negative*. 

1. 

[Untitled](https://www.notion.so/8fab522845f74d3f80cfb8c53cabb113)

Besides, there are three descriptive accuracy metrics that will be used; they are *overall* *accuracy*, *precision*, and *recall,* with **each metrics having its own designated classification components. The first metrics, *overall accuracy* (for True-False), is calculated by dividing True predictions by the total number of predictions. This metrics quantifies the performance of the model over all species. For example, the model's overall accuracy of 0.7 means that for every 10 images, regardless of classes, the model is able to detect correctly 7 images. The second metri, *precision* (for Animal-Human-Blank), is calculated by dividing True Positive by the total number of images that are classified as Positive. The result implies the quality of each class classified by the model. For example, *precision* of Animal class is 0.7 implies that for every 10 images that are classified by the model as Animal, 7 of them are correct. The last metrics, *recall* (for every species), is calculated by dividing True Positive by the total number of ground-truth Positive class. This statistic quantifies the ability of the model to detect each species. For example, *recall* of Owston's civet is 0.8 means that if there are 10 images of Owston's civet in the dataset, the model is able to detect 8. While overall accuracy gives us an idea on how the model classifies Animal-Human-Blank in general, precision warns us how much work we have to do to clean the model's predictions, and recall tells us how much data loss of each species we have to admit.

In the context of conservation, however, recall is the most favored metrics to assess and tune the model because the most important goal of camera-trapping is to detect the most threatened species so that appropriate intervention is targeted. Threatened species are usually rare species, which makes every capture of them is valuable. Thus, in order to make the most of camera-trapping images, the model is expected to retrieve as many captures of threatened species as possible, which is reflected by recall. Nevertheless, most of the time, precision and recall are negatively correlated, i.e. if the model is tuned to increase recall, it will come at the expense of precision. This trade-off implies that more manual effort must be spent on verifying the model prediction for every increase of recall value. That said, this extra effort is several order of magnitude less than the effort spent without the model's help, so it is acceptable. Therefore, throughout this Methodology and MegaDetector Evaluation section, I will use recall as the main metric to evaluate the results.

## **MegaDetector**

### **The first run**

In this experiment, I tried a dry run to quickly gain experience with MegaDetector by running it on Google Colab. Google Colaboratory, or Google Colab, is a cloud-based product from the Google research team that supports running Python and R code directly on a web browser without any prior configuration of the language. A Colab notebook is easy to set up; the only requirement is a Google account, and its free service is more than enough for normal tasks. This step was conducted to know the extent to which the model was applicable to Vietnam's forest geographical background.

Initially, I ran MegaDetector on Google Colab to avoid any cumbersome installation and quickly gain an understanding of how the model worked. I let it scan an arbitrary folder from the Kon Plong dataset which was uploaded to my Google Drive, and set the confidence threshold to 0.8. I also annotated the images with bounding box (a rectangle bounding a detected object) for visual interpretation of the results. The setup took about 10 minutes; nevertheless, the result was magnificent. The model correctly picked up most of the images in which the animals, or their body part, were clearly visible. There was some False Negatives where MegaDetector failed to find animals in blurred images and night images, which had a mixture of flashlight and darkness. There were also many False Positives which MegaDetector misidentified, for example, a tree branch with an animal. I tested with two more folders and the results were consistent. 

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%203.png)

example of True Positive (image from folder 100/67096)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%204.png)

example of True Positive (image from folder 100/67096)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%201.png)

example of True Positive (image from folder 100/67096)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%205.png)

example of False Positive (image from folder 100/67096)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%206.png)

example of False Negative, there is an Ferret-badger in the center (image from folder 100/67096)

The successful implementation and good results indicated two things. Firstly, the model was capable of detecting animal images on Kon Plong background, which was a good thing because it indicated that it had high potential to be applied in Vietnamese context regardless the fact that it had been trained mostly on non-Vietnamese species. Secondly, its ability to pick up many True Positive (correctly classified animal images) given a very high confidence threshold suggested that it might perform better, in terms of recall, if the threshold is set lower.

After the successful implementation, I proceeded to quantify its performance by comparing the predictions with the FFI Vietnam staff's tags. After that, if the results showed satisfactory detection accuracy, in terms of *recall*, and possible time reduction by more than 50%, I would find a way to embed the MegaDetector result into image metadata so that the MegaDetector tag is filterable by digiKam.

### **Performance evaluation**

In this experiment, I carried out a quantitative evaluation of MegaDetector on Kon Plong dataset, specifically to evaluate the recall value the model performs on each species. This evaluation was important because it allowed us to detect the model's strengths and blind-spots and on such grounds, choose the best threshold that minimizes the missing rate of rare species. 

I compared the model's predictions with the FFI Vietnam staff's tags, otherwise called the ground truth labels. A confusion table was created (see **Appendix**) with rows representing the ground-truth label and columns representing the model's predictions. There were two kinds of detection, detection at image level and detection at camera-trigger level. An image-level detection is the detection of every image. In this kind, a detection was marked correct if it ignored blank images, classify human as *Human* and any species as *Animal*. On the other hand, a detection at camera-trigger level was a detection for a group of images taken when the camera was triggered and each trigger could be considered an independent event. The camera hardware used in Kon Plong surveys was Panthera V4. During the day, it took 3 images sequentially with a delay of 2 seconds when the camera was triggered by a movement. At night, it still took 3 image sequentially, but with a delay of 20 seconds due to flash recharging. In FFI Vietnam, camera-trigger detection, or independent event, was more of a concern for analysis. Thus, to account for independent events, I grouped every triplet of 2-second-interval consecutive images into one event. This rule was only applied for non-flash images since a 20-second interval of with-flash images was large enough to be consider another event, and the animal might get scared by the flash and fled away before the next image was shot. For detection of such groups to be assigned as correct, at least one image with animal in that group must be detected as Animal or all images were detected as Blank if all of them were blank. 

Table 01 showed statistics on the model's performance on Owston's Civet where independent events were taken into account and threshold was set to $0.5$. In total, there were 160 times where the camera were triggered by a movement of one or many Owston's Civet(s): 135 of them were correctly detected as Animal, 1 of which was detected as Human, and 24 of which were detected as Blank. Therefore, the recall value for this species was $135÷160 = 0.84$

[Table 01: Confusion matrix sample row](https://www.notion.so/0907b6c7ac934fabb8dc2493a30167e0)

Thorough analysis would be provided in the **Assessment of MegaDetector** section. Generally, on the one hand, the model was good at detecting large mammals such as Ungulates, Bear, and Primate species. The model was not as good as detecting small carnivores like the Leopard cat or Yellow-bellied weasel, but we could hope for better performance in future models. On the other hand, the model was not aquainted with Birds and Small mammals like Rodent species. This is understandable because camera-trapping on the ground was not designed for Birds (as they spent most of their lives on the canopy), and small animals like Murids and Squirrels were sometimes very difficult to find in the images. It was interesting to see that small animals were the most redundant (~1K events), they were often not of conservation concern. On the bright side, the performance on endangered species was positive. As discussed above, high recall values for endangered species strongly advocate for the use of a Machine Learning model in tagging animals.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled.jpeg)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%201.jpeg)

After running the model, the resulting file was a .json, file which did not contribute much interpretation of the results; thus, it was necessary to have a more intuitive way to utilize this result. Therefore, I worked on tools that could embed these results into the image metadata so that staff members could filter images of interest with digiKam.

### **Integration with digiKam**

This experiment aimed to test the available tools that integrated digiKam-style XMP metadata into images. There was an open-source that was built by Microsoft AI for Earth that directly served this purpose. In this experiment, I configured that tool so that it would be easily utilized by non-technical staff members.

There were two problems that I faced with this tools. Firstly, the tool originally embedded a new XMP field called `hierarchicalSubject` into the images, and this new tag could be filtered by digiKam. However, after running the program, although I could see the new tag created in the metadata, I could not filter it with digiKam. This raised a concern because if digiKam could not filter MegaDetector results, the model became useless. To solve this problem, I decided to create a new tag that would appear in the same panel with other identification tags created by FFI Vietnam conservationists. With this, FFI Vietnam staff member could quickly navigate between MegaDetector detection and their identification. I made some modifications to the source code to achieve this.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%207.png)

A new tag category named MegaDetector was created and it could be used to filter images that had the object detected by the model. In this example, all images that the model thought to have Human were displayed.

The second problem was that the code was originally written in Python and needed to be executed as a normal Python file. Thus, in order to start the application from the source code, users needed to install Python and lots of dependency packages and started the application from the command-line interface. This approach was not preferred because non-technical users are prone to making errors since they are likely unfamiliar with starting up a program from command line. To solve this problem, the developer team provided a compilation script that helped compile the Python files into an application which could be executed on a Windows machine just by double-clicking the desktop icon. However, to run that file on an operating system, the source file must be compiled on a machine running that OS also. For instance, I could not compile the source code in a Linux machine and distribute it to Windows users. In this case, I might need to ask someone using Windows to compile it for me. So, it was tricky for me because I was using Ubuntu 21.04 at the time. But with the help of an AI for Earth staff member, I was able to compile the code successfully. The end file was similar to a normal desktop application that can be started from any Windows machine. For Mac OS or Linux environment, it would require a different compilation. So far, I had tested both ways of starting the program, i.e. from the command line and from the compiled desktop application and both gave equivalently accurate performances; the desktop version was easy to use as well. It could also utilize multi-core to speed up the process and would take only minutes to scan through thousands of images.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%208.png)

Integration app to embed XMP results to images

From this point, I had had a complete straightforward workflow with MegaDetector by integrating it at the beginning of data cataloging. It could be set up and implemented easily using cloud-based environment, i.e. through Google Colab, produced good results on the latest Kon Plong dataset, and was easy to integrate the results into digiKam workflow. Both criteria, i.e. *usefulness* and *accessibility*, were all satisfied with this additional platform. The next experiments were additional steps to extend the application of MegaDetector. The first one is the visualization function provided by the MegaDetector team to add bounding rectangles around objects detected by the model, which could help conservationists quickly find the object of interest. The second one is an alternative implementation of MegaDetector on a local desktop; to see whether it brought any advantages over the Colab implementation.

### **Annotation**

This experiment aimed to test the visualization scripts provided by the MegaDetector team. These scripts not only created a duplication of every image but it also added a bounding rectangle around each detected object, i.e. Human and Animal. When conservationists used annotated images for tagging rather than original images, those annotations were expected to save time for conservationists as they could quickly identify the animal and verify the model's detection. 

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%209.png)

Original image

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2010.png)

Annotated image

At first, there were two technical issues with running the visualization script. The first issue was the compression of annotated images. By default, the script would resize the original images so that it could process the annotations much quicker; however, it only had effect on resulted images, whereas the original remained untouched. This could cause significant decrease in the annotated image's resolution, which potentially resulted in confusion among conservationists. This issue was easily resolved by adjusting one argument in the executed command so that it did not make resizing effect on annotated images. The second issue was the renaming of resulted images: the script renamed the annotated images. However, in order for annotated images to be useful in the tagging phase, i.e. they became reliable substitutions of original images, they must bear the exact names as their original counterparts. This identical naming ensured the metadata spreadsheet generated from both choices were identical. Unlike the first issue, there was no parameter to handle the naming, so I must made changes to the source code. It was done successfully.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2011.png)

Original images

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2012.png)

Annotated images with renaming

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2013.png)

Annotated images without renaming

There was one practical issue when using annotated images for cataloging, which was revealed in cases where the model put the correct tag, but the actual detection was wrong. These instances would become problematic when conservationists depended too much on the annotation that they made judges quickly about the absence of animal in an camera-trapping image just because the annotation was blank. Such instances, however, could be prevented by looking at the whole sequence of images created by the same camera trigger. Using all three images in a sequence, it was easier to detect the movements of the animal than from one static image. However, because MegaDetector did not account for sequential images, looking at all 3 images in one trigger was equivalent to looking through the entire dataset, which made MegaDetector useless. Thus, this was an unavoidable problem when MegaDetector and its annotations were deployed in the process.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2014.png)

An example of a True Positive but the annotation is misleading. This was a hard case where the animal, Yellow-throated Marten (*Martes flavigula*) deeply hid behind the bush. Usually, the movement of this animal could be revealed by a sequence of 3 consecutive images, without the other 2 images, it was very likely to miss this animal. 

Because of practitioners' possible dependence on the the model's detection led by annotations and a lack of quantitative assessment on the impact of misleading annotations on the tagging correctness, I put this as an optional step. With it, the tagging process could be qualitatively accelerated, but without it, the usefulness of MegaDetector was still appreciated. When being used, the annotations could be made before digiKam integration, and they could be used for species tagging afterwards.

### **Desktop installation**

In this experiment, I wanted to download and install MegaDetector on a laptop to see (1) how the installation process was and (2) if running MegaDetector offline would bring any more advantages over running it on the cloud.

I followed the steps written on the MegaDetector repository to install MegaDetector onto my laptop, which was running the Ubuntu 21.04 operating system. I expected it to be a quick and straightforward process since I had already had all required environments preinstalled, i.e. Python 3, Anaconda, and git. However, for some reason, it failed at the first time. I found the bug and fixed in the source code and executed again. It worked, but the model ran very slowly (2 minutes/image), which was significantly slower than running on Google Colab (1.5 seconds/image). At first, I was not aware that my laptop did not have GPU specialized for such a task, I presumed that it was an issue by a hardware conflict. I had an email exchange about this issue with the MegaDetector team but unfortunately, the problem remained unresolved. I tried to replicate their successful implementation on a Google cloud instance, but it still did not perform any better. Later, I realized that MegaDetector was a heavy deep learning model, so it needed GPU-based machine to run it effectively. For a camera-trapping dataset which usually had thousands of images, running the model on a CPU-based machine is practically impossible.

As a result, I decided not to include the desktop version of MegaDetector in the workflow because of the complexity of the installation process and high hardware requirements. Furthermore, because it requires sufficient programming experience, especially with Python, to manage the desktop program (installing new packages as every new model is released for example), this option poses a steep learning curve for non-technical staff. For reasons articulated above, Google Colab is the more suitable alternative.

### **Google Colab: Free and Pro**

Although Google Colab is free, it had runtime constraints and the hardware provided for free service was limited. It posed many problems with using Colab Free for such a big dataset like Kon Plong dataset. Therefore, Google also offered a subscription version including Colab Pro ($9.99/month), which extended the runtime and offered more powerful GPU resources, and Colab Pro+ ($49.99/month) which offered even more powerful GPUs and allowed execution in the background as a plus feature. To keep it at a relative low cost (if not free), I considered the first option affordable. In this experiment, I compared Colab Free and Colab Pro to draw conclusions regarding the superior features that Colab Pro offers over its free version.

I did the comparison on Kon Plong dataset, with each kind handling half of the dataset. In terms of speed, Colab Pro was two times faster than Colab Free. MegaDetector running on Colab Free processed an image for roughly 2 seconds, while it took only 1 second in Colab Pro. This was explained by the fact that Colab Pro offered more powerful GPU resources. In terms of runtime constraint, i.e. maximum number of hours the notebook was allowed to run, Colab Pro was more resilient than Colab Free. MegaDetector running on Colab Free often stopped after 6 hours; after that, I had to wait for 1 or 2 days before the quotas were refreshed and I could resume the model. As a result, it took 5 days to go through half of the dataset with Colab Free. Meanwhile, the model processed the other half of the dataset in Colab Pro for 18 hours straight, so, in theory, the model might take a day or two on Colab Pro to process the Kon Plong dataset completely. These figures showed that Colab Free was not a good choice for a thousand-image dataset as it could take weeks to finish running, which totally offsets the time reduction benefit. Google Colab Pro would be a better choice. However, Google Colab Pro would stop running if the computer was set to sleep mode, which is, although minor, still a problem to address. During the daytime, it would stop after 3-4 hours, but at night, it could execute longer, for 8 or 18 hours unpredictably. To work around with this issue, FFI Vietnam staff in charge should not let the notebook stand by in the sleep mode during the day; more specifically, they are advised to frequently interact with the notebook to prevent it from going into the sleep mode. In cases where the model was started in the weekend and interaction with the notebook was limited, they could run a simple Python script to automate the cursor so that it double click on the notebook every 30 seconds. The script is called [keep-colab-alive.py](http://keep-colab-alive.py) in the *camtrap-tools* repository.

## **Wildlife Insights**

### **User interface and Basic functionalities**

Despite the fact that the platform is under development, its basic features were complete and ready to use. Because of its plentiful functionalities, the scope of this experiment was narrowed down to basic features that aid the data management process inside the organization. In this experiment, I examined the basic features of Wildlife Insights including project creation, image upload, image annotation, data query, and index analysis. Artificial Intelligence will be covered in the next section

In short, I interacted with the platform as a normal user. Instructions were clearly stated in the Wildlife Insights user guide. My experience shows that, in general, project creation, image upload, image annotation, and data query were simple and clear-cut, even for a first-time user. The index analysis function had not been developed yet so it could not be used at this stage. However, given some of the demos for the analysis function, once deployed, it would be useful to provide a visual understanding of the data set.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2015.png)

Demo for Analysis function from Wildlabs Webinar: "How do I get started with Wildlife Insights?" by Nicole Flores

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2016.png)

### **Artificial Intelligence**

Artificial Intelligence (AI) was one of the key features of Wildlife Insights; it was expected to accelerate the tagging process by automatically identifying the species presenting in the image. The problem it was trying to solve, i.e. animal identification, was complicated and is still a hotly debated and researched topic. In this experiment, I wanted to understand the capability of Wildlife Insights' early-staged AI models to evaluate its potential for use at FFI Vietnam. 

From 3 arbitrary camera deployments with around 2,800 images, at first glance, the AI performed very poorly with Kon Plong images. The AI functionality had two models and they were totally unconnected. The first one was a detection model that drew a bounding box around the animal (which was similar to MegaDetector). This model was quite good, and similar to MegaDetector, it was able to detect clearly visible animal. However, it was far less efficient than MegaDetector. The other model was an identification model that identified the animal to the Species level in the taxonomic rank. Qualitatively, the identification model was quite good at detecting Human; however, it struggled with other species. The taxonomic rank with which it was most successful was Class, with most of the correct identifiable falling under the categories of Mammalia or Aves. The second most successful rank was Order, as it could classify an animal in Carnivora and Rodentia. Below the Order level, the model neither detected the animal, nor detected it correctly. However, this was expected because none of the images in the training data came from Vietnam (according to Wildlife Insights website, they trained the model on camera-trapping images from Conservation International’s Tropical Ecology and Monitoring (TEAM) Network, Snapshot Serengeti, Caltech Camera Traps, North American Camera Trap Images, One Tam, and WWF), so the identification model was unable to identify Vietnam's ecological backgrounds and species (see Appendix for the number of images of each Kon Plong species in Wildlife Insights training data). It was important to note that at the time the test was done, these two models worked separatedly, meaning that there were many cases in which the animal was detected (the detection model could see the animal), but there was no identification given to it (the identification failed to see the animal), and vice versa. 

There were many conversations between me and the Wildlife Insights team. The AI is undergoing active research so it has not yet been optimized. The current built-in AI model could be replaced, but certainly, there would be regular model retraining in the future given the vast diverse data uploaded to Wildlife Insights daily. 

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2017.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2017.png)

The only True bird in a deployment. The detection model worked.

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2018.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2018.png)

Incorrect Family identification. The detection model worked.

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2019.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2019.png)

Incorrect Species identification. The detection model failed.

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2020.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2020.png)

Incorrect Family identification. The detection model failed.

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2021.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2021.png)

The detection model worked. But there was no identification.

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2022.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2022.png)

There was an animal in this image. The detection model failed to see it, whereas the identification model amazingly found it, but sadly, the identification was wrong. Can you find the animal?

**Comparisons between Wildlife Insights detection model (June 2021) and MegaDetector v4.1, threshold 0.8**

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2023.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2023.png)

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2024.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2024.png)

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2025.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2025.png)

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2026.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2026.png)

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2027.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2027.png)

The animal was on the falling big branch.

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2028.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2028.png)

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2029.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2029.png)

![Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2030.png](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2030.png)

From the first-hand experience with the platform, I found that Wildlife Insights did very well as a platform for managing camera trap data. However, it was not as effective when it came to the AI. Hence, using Wildlife Insights for annotating data was not justifiable in this developmental stage. Next, I would utilize one of its functions called bulk upload to upload legacy data so that we could use it as a data management system.

### **Bulk upload**

Bulk upload is a systematic way to upload legacy data to Wildlife Insights, and a crucial step to upload the images together with metadata to Wildlife Insights assuming that the images are not cataloged on the Wildlife Insights platform. This experiment aimed to test the bulk upload process and to design a coding workflow to fill in Wildlife Insights upload template from ExifTool's metadata spreadsheet. 

Wildlife Insights team provides data-migration code, mainly in R, for a variety of data tagging software such as Wild.ID, Camelot, or eMammal. However, there is no code template for digiKam, so I had to write one. There are 2 subtasks needed to be accomplished, (1) fill in the bulk upload templates and (2) transfer images from Google Drive to Google Cloud bucket. For the first subtask, the Wildlife Insights team had provided a set of templates with clear instructions so my task was to write a python script that would fill in those templates from the information in the 2 available datasheets, i.e. image metadata spreadsheet and camera deployments spreadsheet. For the second task, the Wildlife Insights team provided the code to help upload images stored in Google Drive to the Google Cloud bucket. The template was neat with clear instructions, and it was a Colab notebook written in python. I had also acquired access to FFI Vietnam's private bucket in the Google Cloud Platform given by Wildlife Insights staff. I followed the notebook instructions with some minor modifications to the code. The experiment was a success.

These two experiments closed the loop of the Wildlife Insights workflow. FFI Vietnam can store their images on Google Drive and then transfer a copy of each to FFI Vietnam's private bucket on GCP. Also, FFI Vietnam staff can use digiKam to annotate images and then use the migration code to organize the information into bulk upload templates.

# Assessment of MegaDetector

The color code, if there is, is based on conservation status by IUCN Red List extracted in September 2021. The grey color for Not Applicable indicates that there is no data about conservation status for that species. They are species family, e.g. Murid or Muntjac, as they are unidentifiable in the images.

In this graph for all species, only species which had more than 20 images in the ground-truth data are considered. This makes the graph neater for interpretation and  also because fewer than 20 imges does not provide enough credible insights about the detection rate (a full graph will be provided in the **Appendix**). This graph shows that MegaDetector's capability is a full spectrum, i.e. it is not capped at any certain recall threshold for Kon Plong species, which means that there is no prior distinct bias of this Machine Learning model towards Kon Plong species. Moreover, the histogram shows that most recall values stay in the range $(0.6,0.7]$ and $(0.8, 0.9]$, which is good acknowledging the fact that the model is not trained on Vietnamese data. Furthermore, the fact that none of mammals species has $0$-recall values tells us that MegaDetector can be used to survey the presence of on-the-ground animals presenting in an ecological system. 

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2031.png)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2032.png)

The Large groups graph below describes how the model performs on common species. Excluding Pangolin and Bear which have too few sample images, big animals such as Ungulates and Primates receive the best results. Small carnivores (usually still bigger than Small mammals) also gain good results. For Kon Plong project, on-the-ground mammals are targeted species, so these statistics shows that MegaDetector is a good choice for project of similar purposes. However, surprisingly, the model underperformed with Human (Human receives poorer results than Small carnivores). I expect the model to perform better at Human because they are usually clearly visible in the images, and as the Human class has narrower data diversity in the training set than Animals, so it must have learnt Human better than the Animal class. The second-to-last rank of Birds does not bother me because camera-trapping method is not specialized for Birds. These species spend their lives on the canopy while trapping cameras are tightened with trees at knee-high level, so surveying them requires other methods. It is interesting to see that all species whose recall values are $0$, i.e. none of their images are detected, are in Birds class, which is also a clue that MegaDetector may not be ready for Birds at the moment. The poorest class in the rank is Small mammals, which contains Rodent species such as Murids, Squirrels and Porcupines. In this, there are more than $8000$ images of unidentifiable Murids species with low recall value, $0.39$, but their redundancy infers that they are not of FFI Vietnam's conservation concern. However, when it comes to projects that focus on Rodent species, this low accuracy should be taken into consideration.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2033.png)

As discussed earlier, when it comes to the application of a Machine Learning model to remove blank images, conservationists at FFI Vietnam do not want to miss many (if any) images of threatened species as they are key factors to make conservation decisions. For Vulnerable+ species group which includes Vulnerable, Endangered, and Critically Endangered species based on IUCN Red List standard, the model is good at detecting and identifying them. On average, its recall rate is $0.87$, with the maximal value of $1$ and minimal value of $0.66$. Moreover, all species that have full recall rate are those that have extremely small capture rate ($1$ to $5$ images in total), which makes every correct detection highly valuable. 

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2034.png)

It is necessary to understand the interrelationship among the recall rate of Animal and Human, the reduction rate, and the threshold value. Reduction rate is the time reduction achieved when MegaDetector results are used to remove Blank images; it is calculated by dividing the number of MegaDetector's Blank images by the total amount of images in the dataset. Confidence threshold is the fine-tuned parameter to achieve the most balancing outcome between recall rate and time reduction for a specific project. The graph below describes the trends of these factors on the basis of threshold values. As the threshold increases, so does the reduction rate, but the recall rate decreases steadily at the same time. These are expected observations as high thresholds imply that the model has more freedom to make detection, so it drops the reduction rate, but at the same time leverages the likelihood of finding the animals, so it boosts the recall rate. It is interesting to see that even when the threshold is set to 0.9, MegaDetector still does not skip any Kon Plong Vulnerable+ species. Because there are $24128$ animal images in the dataset, every $1%$% increase in the recall rate equivalent to ~$241$ animal images that are not missed. And $10%$ % recall rate increase from threshold $0.4$  down to $0.1$ is equivalent to $2412$ animal images that are successfully retrieved, which is considerable. This graph suggests that to select the most appropriate threshold, FFI Vietnam staff members can base it on the dimensions of time and accuracy. Thus, this graph could be used as a reference for decision making when MegaDetector is used and its confidence threshold must be defined for project's specific purposes and resources.

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2035.png)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2036.png)

Threshold 0.1

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2037.png)

Threshold 0.9

It is worth noting that these statistics only represent the performance of MegaDetector on the Kon Plong dataset and Panthera V4 trapping camera- brand. More dataset of diverse background and camera configurations need including in the assessment in order to derive a more generalized conclusion. Nevertheless, the code used in this assessment can be used as a framework for further assessment of any new Machine Learning model that serves the same task, as well as for deriving more generalized insights about the suitability of MegaDetector with FFI Vietnam camera-trapping projects.

# Conclusions & Discussions

The experiments show that it is possible to have an automated code-based workflow for FFI Vietnam's camera trap projects. For MegaDetector, although the overall accuracy does not guarantee a hundred percent retrieval rate of animal images, its ability to detect huge proportions of large mammals, especially threatened species, is sufficient for a lot of applications in camera-trapping surveys which target mammals in an ecological area. 

When a staff member wants to use MegaDetector to remove blank images, they must consider thoroughly the trade-off between losing images of some animals and time reduction. In this step, it is advised that they carefully choose the most appropriate threshold to achieve satisfactory results in timely manner. A low threshold is used for cases when the project is not rushed. However, in cases where there is a time constraint, setting the threshold too high is not recommended because it makes the missing rate too expensive that evidences of threatened species with rare encounters cannot be reclaimed. Hence, for inferences derived from this instantaneous technique, it is assumed that the Machine Learning model makes adequate predictions. In practice, using a Machine Learning model like MegaDetector can be considered an option when the project is short of time and human resources as quick inferences can be drawn from this approach, and as a result, appropriate decisions regarding conservation actions can be made in a well-timed manner. When time allows, intensive human resources can be deployed to pass over the image dataset exhaustively and validate the former inferences. 

Besides the detection function, the annotation function to visualize detection is an optional extra step when conservationists really want to speed up the process. It helps conservationists quickly find the animal or determine blank images. However, the detection function is misleading in cases in which it causes images containing animals to be ignored although they are marked by MegaDetector. As a result, this mistake amplifies MegaDetector's missing rate. The verification of MegaDetector tags needs expertise, so this extra step is only recommended when time is the first priority.

The fact that anyone can run an instance of MegaDetector on Google Colab with ease and at a relative low cost (free with Colab Free and $9.99 for Colab Pro) makes it accessible and inclusive to any staff with or without programming skills, provided that they have an Internet connection. Cloud-based MegaDetector also frees staff from worries about hardware resources, cumbersome installation process, and updates. Although testing with local installation is not done thoroughly, it is certain that the speed decreases drastically when switching from GPU to CPU, which implies that only GPU-based computers are favored to run the model. Besides the hardware limitation, there will be more difficulties coming when the model is updated; for example, it may be a case that a Python library named tensorflow 2 must be installed to run the next version. Thus, it is recommended to run a cloud-based instance of the model rather than a local installation version. 

In summary, because MegaDetector is powerful and easy to use, it can remove the laborious barrier of image annotation, thus accelerating a camera trap project of all scales without too many compromises. Because the model is still in constant development by a very supportive team in Microsoft AI for Earth, it is reasonable to expect MegaDetector will perform better and be more contextually applicable as new updated models are released. As a result, in the long run, MegaDetector can help make camera trap practices more scalable and mainstream.

Wildlife Insights, on the other hand, has not been fully developed, yet its vision to become an all-in-one platform that facilitates every step of data analysis and data sharing is the future of camera trap survey. For the time being, it is no more useful to FFI Vietnam than a data management resource. Similar to MegaDetector, it is possible to devise a code-based procedure to transfer cataloged data to Wildlife Insights so that FFI Vietnam staff members can discharge the laborious duty of uploading processed images manually.

Google Colab and Google Drive are good cloud platforms to use throughout the whole process, with Google Drive to store images and Google Colab to run codes. Google Colab can connect with Google Drive to process data from it, so Google Drive can be used as a central storage for storing all kind of data, from images to analyses. For MegaDetector, Google Colab provides a cloud-based environment to run the model where the setup is kept at bare minimum. It takes images from Google Drive, processes them, and saves  results on Google Drive. For Wildlife Insights, it is much easier to transfer legacy data from Google Drive to Google Cloud Storage though Google Colab. Without this combination, FFI Vietnam staff members need to upload it manually from local machine through command line, which is not recommended for those who have no experience working with cloud technology. The back-and-forth interaction between Google Drive and Google Colab makes the whole process compacted and easier to handle. Furthermore, Google Colab Pro is a good investment when it comes to MegaDetector; other than that, Google Colab Free is enough. 

# Recommendations and Best Practices

Here is my recommended integrated workflow. This is adapted from *FFI Vietnam camera trap data management protocol (v0.2)* 

![FFI workflow(2021-09-27).jpg](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/FFI_workflow(2021-09-27).jpg)

Workflow diagram

**Summary**

1️⃣ **Initial data preparation**

- Create a folder on the camera trap Google Drive to receive the new data.
- Finalize the camera trap **deployment spreadsheet.**
- Copy the raw images into the correct station folders.
- Backup the raw data.
- Make a copy ("**processed images**") of the raw data that you will work on.
- Fix any images with incorrect dates/times.
- Rename all images.

2️⃣ **Run MegaDetector with images on Google Drive (Google Colab Pro is recommended from this step)**

- Create a new folder name **annotated images** outside **processed images.**
- Open MegaDetector Colab notebook.
- Assign `images_dir` and `output_file_path` with the directory of **processed images** folder on Google Drive.
- Run MegaDetector and ... wait! (you can estimate the waiting time as it takes ~1s to process an image in Colab Pro). Recommend to run Google Colab at night to prevent sudden timeout, otherwise, interact frequently with the notebook.
- When the notebook is down, just restart it and do not forget to activate `--resume_from_checkpoint` parameter as it will resume from where it left off.

**(Optional) Add annotations**

- Assign `visualization_dir` with the directory of **annotated images** folder on Google Drive
- Run the visualization code

**3️⃣ Embed MegaDetector result into images**

- Start digiKam integration app.
- Modify the result JSON file so that the directories are of images on local computer (not on Google Drive).
- If annotation step is executed, change the image directories from **processed images** folder to  **annotated images** folder as we want the annotated images have the MegaDetector tags.

**4️⃣ Catalog images**

- Catalog **annotated images** with digiKam, use MegaDetector tag in the *Tags* panel to filter images with Human and Animal.

5️⃣ **Extract image metadata** 

- Extract digiKam tag with ExifTool to **image metadata** spreadsheet.

6️⃣ **Auto transfer images from Google Drive to Google Cloud bucket**

- Open GoogleDriveToGCP Colab notebook.
- Assign `GDFolder`  with the directory of **processed images** folder on Google Drive.
- Follow the instructions in the notebook to transfer a copy of original data into Google Cloud bucket.

7️⃣ **Autofill bulk upload templates**

- Open Bulk upload Colab notebooks.
- Follow the pipeline to fill in Wildlilfe Insights bulk upload templates.

8️⃣ **Upload to Wildlife Insights**

- Submit templates to Wildlife Insights.

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

## Graphs

*To see each graph with higher resolution in Notion, click on the image and then type Spacebar or click Original (on the top left)*

### Confusion matrix heatmap

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2038.png)

Threshold 0.1

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2039.png)

Threshold 0.5

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2040.png)

Threshold 0.9

### Recall by species

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2041.png)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2042.png)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2043.png)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2044.png)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2045.png)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2046.png)

![Untitled](Final%20report%20(2021-09-27)%20d77ba09f3c184849aad0e9709aabe7f0/Untitled%2047.png)

### Tables

[Recall and reduction by confidence threshold](https://www.notion.so/c2e6124342a546219ea63495b2f5b621)

[confusion matrix - threshold 0.5](https://www.notion.so/da2bf669b70c4467a244c6d2ef85bc30)