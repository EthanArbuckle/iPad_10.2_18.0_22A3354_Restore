@implementation VKFeedbackProvider

- (VKFeedbackProvider)init
{
  VKFeedbackProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *attachmentsFolderURL;
  NSMutableArray *v11;
  NSMutableArray *screenshots;
  VKFeedbackAttachment *v13;
  VKFeedbackAttachment *requestAssetAttachment;
  VKFeedbackAttachment *v15;
  VKFeedbackAttachment *analysisArchiveAttachment;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VKFeedbackProvider;
  v2 = -[VKFeedbackProvider init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "temporaryDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("feedbackAttachments-%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v8, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    attachmentsFolderURL = v2->_attachmentsFolderURL;
    v2->_attachmentsFolderURL = (NSURL *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    screenshots = v2->_screenshots;
    v2->_screenshots = v11;

    v13 = -[VKFeedbackAttachment initWithFileName:label:isOptional:]([VKFeedbackAttachment alloc], "initWithFileName:label:isOptional:", CFSTR("RequestAsset.png"), CFSTR("Request Asset"), 0);
    requestAssetAttachment = v2->_requestAssetAttachment;
    v2->_requestAssetAttachment = v13;

    v15 = -[VKFeedbackAttachment initWithFileName:label:isOptional:]([VKFeedbackAttachment alloc], "initWithFileName:label:isOptional:", CFSTR("archive.vkimageanalysis"), CFSTR("Analysis Results"), 0);
    analysisArchiveAttachment = v2->_analysisArchiveAttachment;
    v2->_analysisArchiveAttachment = v15;

  }
  return v2;
}

- (void)provideFeedbackWithType:(unint64_t)a3
{
  -[VKFeedbackProvider provideFeedbackWithType:options:metadata:promisedAttachments:userResponseHandler:](self, "provideFeedbackWithType:options:metadata:promisedAttachments:userResponseHandler:", a3, -1, 0, 0, &__block_literal_global_27);
}

- (void)provideFeedbackWithType:(unint64_t)a3 options:(unint64_t)a4 metadata:(id)a5 promisedAttachments:(id)a6 userResponseHandler:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id userResponseHandler;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  VKFeedbackProviderViewController *v22;
  id v23;

  v23 = a5;
  v13 = a6;
  v14 = a7;
  if ((a4 & 1) != 0)
    -[VKFeedbackProvider _captureScreenshots](self, "_captureScreenshots");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeItemAtURL:error:", self->_attachmentsFolderURL, 0);

  self->_type = a3;
  objc_storeStrong((id *)&self->_metadata, a5);
  v16 = (void *)MEMORY[0x1D8249E20](v14);
  userResponseHandler = self->_userResponseHandler;
  self->_userResponseHandler = v16;

  if (!v13)
    v13 = (id)MEMORY[0x1E0C9AA60];
  -[VKFeedbackProvider assetsProvider](self, "assetsProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v13, "arrayByAddingObject:", self->_requestAssetAttachment);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v19;
  }
  -[VKFeedbackProvider imageAnalysis](self, "imageAnalysis");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v13, "arrayByAddingObject:", self->_analysisArchiveAttachment);
    v21 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v21;
  }
  v22 = -[VKFeedbackProviderViewController initWithOptions:attachments:]([VKFeedbackProviderViewController alloc], "initWithOptions:attachments:", a4, v13);
  -[VKFeedbackProviderViewController setDelegate:](v22, "setDelegate:", self);
  -[VKFeedbackProviderViewController present](v22, "present");

}

- (void)feedbackProviderViewControllerDidCancel:(id)a3
{
  id userResponseHandler;
  id v5;

  (*((void (**)(void))self->_userResponseHandler + 2))();
  userResponseHandler = self->_userResponseHandler;
  self->_userResponseHandler = 0;

  -[NSMutableArray removeAllObjects](self->_screenshots, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", self->_attachmentsFolderURL, 0);

}

- (void)feedbackProviderViewController:(id)a3 submitWithOptions:(unint64_t)a4 attachments:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSURL *attachmentsFolderURL;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  unint64_t type;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSURL *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  NSURL *v52;
  id v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  __CFString *v64;
  _QWORD block[4];
  id v66;
  VKFeedbackProvider *v67;
  id v68;
  NSURL *v69;
  id v70;
  id v71;
  id v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  unint64_t v76;
  id v77[2];

  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_attachmentsFolderURL, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0
    || (attachmentsFolderURL = self->_attachmentsFolderURL,
        v77[0] = 0,
        objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", attachmentsFolderURL, 1, 0, v77), (v12 = v77[0]) == 0))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("ComponentName"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("SIML Field Feedback Secured Data");
    if (v16)
      v18 = (__CFString *)v16;
    v19 = v18;

    -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("ComponentVersion"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("Scarlett");
    if (v20)
      v22 = (__CFString *)v20;
    v23 = v22;

    -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("ComponentID"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = CFSTR("1179176");
    if (v24)
      v26 = (__CFString *)v24;
    v27 = v26;

    type = self->_type;
    v63 = v8;
    v64 = v19;
    v58 = v27;
    v60 = v23;
    if (type > 3)
      v29 = 0;
    else
      v29 = off_1E9464C88[type];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Scarlett] %@ feedback"), v29);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v30, "appendString:", CFSTR("Please describe which visual intelligence feature you were trying \n <text selection/OCR, data detectors, MRC codes, visual search>"));
    objc_msgSend(v30, "appendString:", CFSTR("\n\n Please describe your steps:"));
    objc_msgSend(v30, "appendString:", CFSTR("\n 1. Open <app name> "));
    objc_msgSend(v30, "appendString:", CFSTR("\n 2. ... "));
    objc_msgSend(v30, "appendString:", CFSTR("\n\nWhat did you see:"));
    objc_msgSend(v30, "appendString:", CFSTR("\n\nWhat you expected:"));
    objc_msgSend(v30, "appendString:", CFSTR("\n\n(Please attach a screen recording if possible)"));
    objc_msgSend(v30, "appendString:", CFSTR("\n\n Extra Information that will help us screen more effectively:"));
    objc_msgSend(v30, "appendString:", CFSTR("\n If this is a data detector issue, please also select and copy the OCR text output if possible"));
    objc_msgSend(v30, "appendString:", CFSTR("\n If this is a MRC issue, please verify that the MRC correctly works in the Code Scanner app"));
    objc_msgSend(v30, "appendString:", CFSTR("\n For visual search issues, also please attach a screenshot of the Siri Search results"));
    -[VKFeedbackProvider error](self, "error");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[VKFeedbackProvider error](self, "error");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "appendFormat:", CFSTR("\n\nAnalysis Error: %@"), v33);

    }
    -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("AdditionalText"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
      objc_msgSend(v30, "appendFormat:", CFSTR("\n\n%@"), v34);
    v62 = (void *)v35;
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSObject setObject:forKey:](v15, "setObject:forKey:", v29, CFSTR("feedback_type"));
    -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("Client"));
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bundleIdentifier");
      v36 = objc_claimAutoreleasedReturnValue();

    }
    v56 = v36;
    -[NSObject setObject:forKey:](v15, "setObject:forKey:", v36, CFSTR("client_id"));
    -[NSObject setObject:forKey:](v15, "setObject:forKey:", CFSTR("iOS"), CFSTR("platform"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "valueForKey:", CFSTR("ProductBuildVersion"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v15, "setObject:forKey:");
    if ((a4 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "countryCode");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForCountryCode:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        -[NSObject setObject:forKey:](v15, "setObject:forKey:", v41, CFSTR("country"));

    }
    -[VKFeedbackProvider _jsonRepresentationForAttributesDictionary:](self, "_jsonRepresentationForAttributesDictionary:", v15);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      -[VKFeedbackProvider _saveFeedbackAttributesJSON:](self, "_saveFeedbackAttributesJSON:", v42);
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v42, 4);
      objc_msgSend(v30, "appendFormat:", CFSTR("\n\nFeedback Attributes:\n%@"), v43);

    }
    if ((a4 & 1) != 0)
      -[VKFeedbackProvider _saveScreenshots](self, "_saveScreenshots");
    v44 = self->_attachmentsFolderURL;
    -[VKFeedbackProvider assetsProvider](self, "assetsProvider");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKFeedbackProvider imageAnalysis](self, "imageAnalysis");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v47 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke;
    block[3] = &unk_1E9464C40;
    v66 = v7;
    v67 = self;
    v68 = v45;
    v69 = v44;
    v76 = a4;
    v70 = v46;
    v71 = v57;
    v72 = v30;
    v73 = v64;
    v74 = v60;
    v75 = v58;
    v59 = v58;
    v61 = v60;
    v48 = v64;
    v49 = v30;
    v50 = v57;
    v51 = v46;
    v52 = v44;
    v53 = v45;
    dispatch_async(v47, block);

    v13 = v62;
    v8 = v63;
    v14 = v56;
  }
  else
  {
    v13 = v12;
    v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[VKFeedbackProvider feedbackProviderViewController:submitWithOptions:attachments:].cold.1((id *)&self->_attachmentsFolderURL, v13);
    v15 = v14;
  }

}

void __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[16];
  _BYTE v44[16];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v39;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 40);
        if (v7 == *(void **)(v8 + 40))
        {
          v12 = *(void **)(a1 + 48);
          v13 = *(_QWORD *)(a1 + 56);
          v37 = 0;
          v14 = objc_msgSend(v12, "saveAssetsToFeedbackAttachmentsFolder:error:", v13, &v37);
          v11 = v37;
          if ((v14 & 1) != 0)
            goto LABEL_19;
          v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke_cold_1((uint64_t)v44, (uint64_t)v11);

          goto LABEL_18;
        }
        if (v7 == *(void **)(v8 + 48))
        {
          v16 = *(void **)(a1 + 56);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v6), "fileName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "URLByAppendingPathComponent:", v17);
          v15 = objc_claimAutoreleasedReturnValue();

          v18 = *(void **)(a1 + 64);
          v36 = 0;
          objc_msgSend(v18, "writeSecureCodedArchiveToURL:error:", v15, &v36);
          v11 = v36;
          if (v11)
          {
            v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke_cold_2((uint64_t)v43, (uint64_t)v11);

          }
LABEL_18:

          goto LABEL_19;
        }
        v9 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v7, "fileName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend(v9, "initWithString:relativeToURL:", v10, *(_QWORD *)(a1 + 56));

        if (v11)
          objc_msgSend(v31, "addObject:", v11);
LABEL_19:

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v4);
  }

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) + 16))();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentsOfDirectoryAtPath:error:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), *(_QWORD *)(a1 + 56));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v26);
  }

  LOBYTE(v30) = (*(_DWORD *)(a1 + 112) & 4) != 0;
  +[VKRadarUtilities createRadarWithTitle:description:componentName:componentVersion:componentID:keywordIDs:attachmentURLs:includeSysdiagnose:](VKRadarUtilities, "createRadarWithTitle:description:componentName:componentVersion:componentID:keywordIDs:attachmentURLs:includeSysdiagnose:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), 0, v23, v30);

}

- (id)_jsonRepresentationForAttributesDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  if (!objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3))
  {
    v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VKFeedbackProvider _jsonRepresentationForAttributesDictionary:].cold.2((uint64_t)v3, v6);
    v5 = 0;
    v4 = 0;
    goto LABEL_9;
  }
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VKFeedbackProvider _jsonRepresentationForAttributesDictionary:].cold.1(v5, v6);

LABEL_9:
  }

  return v4;
}

- (void)_saveFeedbackAttributesJSON:(id)a3
{
  NSURL *attachmentsFolderURL;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  attachmentsFolderURL = self->_attachmentsFolderURL;
  v4 = a3;
  -[NSURL URLByAppendingPathComponent:](attachmentsFolderURL, "URLByAppendingPathComponent:", CFSTR("FeedbackAttributes.json"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "writeToURL:options:error:", v5, 2, &v8);

  v6 = v8;
  if (v6)
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VKFeedbackProvider _saveFeedbackAttributesJSON:].cold.1(v6, v7);

  }
}

- (void)_captureScreenshots
{
  void *v3;
  double y;
  double x;
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v28 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_screenshots, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CEAC18], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "frame");
        v31.origin.x = v12;
        v31.origin.y = v13;
        v31.size.width = v14;
        v31.size.height = v15;
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        v30 = CGRectUnion(v29, v31);
        x = v30.origin.x;
        y = v30.origin.y;
        width = v30.size.width;
        height = v30.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }
  v16 = objc_alloc(MEMORY[0x1E0CEA610]);
  objc_msgSend(MEMORY[0x1E0CEA618], "defaultFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithBounds:format:", v17, x, y, width, height);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__VKFeedbackProvider__captureScreenshots__block_invoke;
  v21[3] = &unk_1E9464C68;
  v22 = v3;
  v19 = v3;
  objc_msgSend(v18, "imageWithActions:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_screenshots, "addObject:", v20);

}

unint64_t __41__VKFeedbackProvider__captureScreenshots__block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t i;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      objc_msgSend(v4, "drawViewHierarchyInRect:");

      result = objc_msgSend(*(id *)(a1 + 32), "count");
    }
  }
  return result;
}

- (void)_saveScreenshots
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  NSMutableArray *obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = self->_screenshots;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if (v5 + v7 < 1)
        {
          v9 = CFSTR("Screenshot");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), CFSTR("Screenshot"), v5 + v7);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(".png"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKFeedbackProvider _saveImage:withName:](self, "_saveImage:withName:", v8, v10);

        ++v7;
      }
      while (v4 != v7);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 += v7;
    }
    while (v4);
  }

}

- (void)_saveImage:(id)a3 withName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a3, "vk_PNGData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSURL URLByAppendingPathComponent:](self->_attachmentsFolderURL, "URLByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v7, "writeToURL:options:error:", v8, 2, &v11);
    v9 = v11;
    if (v9)
    {
      v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[VKFeedbackProvider _saveImage:withName:].cold.1(v8, v9);

    }
  }

}

- (VKCImageAnalyzerRequest)request
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[VKFeedbackProvider assetsProvider](self, "assetsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VKFeedbackProvider assetsProvider](self, "assetsProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (VKCImageAnalyzerRequest *)v5;
}

- (void)provideFeedbackWithType:(unint64_t)a3 options:(unint64_t)a4 metadata:(id)a5 consentPresentingView:(id)a6
{
  -[VKFeedbackProvider provideFeedbackWithType:options:metadata:promisedAttachments:userResponseHandler:](self, "provideFeedbackWithType:options:metadata:promisedAttachments:userResponseHandler:", a3, a4, a5, 0, &__block_literal_global_154);
}

- (VKFeedbackAssetsProvider)assetsProvider
{
  return self->_assetsProvider;
}

- (void)setAssetsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_assetsProvider, a3);
}

- (VKCImageAnalysis)imageAnalysis
{
  return (VKCImageAnalysis *)objc_loadWeakRetained((id *)&self->_imageAnalysis);
}

- (void)setImageAnalysis:(id)a3
{
  objc_storeWeak((id *)&self->_imageAnalysis, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_imageAnalysis);
  objc_storeStrong((id *)&self->_assetsProvider, 0);
  objc_storeStrong(&self->_userResponseHandler, 0);
  objc_storeStrong((id *)&self->_analysisArchiveAttachment, 0);
  objc_storeStrong((id *)&self->_requestAssetAttachment, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_attachmentsFolderURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)feedbackProviderViewController:(id *)a1 submitWithOptions:(void *)a2 attachments:.cold.1(id *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1D2E0D000, v5, v6, "Failed to create attachments disrectory %@. Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_2();
}

void __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_4(a1, a2), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  OUTLINED_FUNCTION_0_4(&dword_1D2E0D000, v2, OS_LOG_TYPE_ERROR, "Error saving analysis assets: %@", v4);

  OUTLINED_FUNCTION_6();
}

void __83__VKFeedbackProvider_feedbackProviderViewController_submitWithOptions_attachments___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_4(a1, a2), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  OUTLINED_FUNCTION_0_4(&dword_1D2E0D000, v2, OS_LOG_TYPE_ERROR, "Error archiving analysis object: %@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_jsonRepresentationForAttributesDictionary:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize attributes to JSON: %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_5();
}

- (void)_jsonRepresentationForAttributesDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Invalid JSON object: %@", (uint8_t *)&v2);
}

- (void)_saveFeedbackAttributesJSON:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Failed to save the feedback attributes: %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_5();
}

- (void)_saveImage:(void *)a1 withName:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1D2E0D000, v5, v6, "Failed to save image to %@: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_2();
}

@end
