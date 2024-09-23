@implementation WFShortcutExtractor

- (WFShortcutExtractor)initWithURL:(id)a3 suggestedName:(id)a4 sourceApplication:(id)a5
{
  return -[WFShortcutExtractor initWithURL:allowsOldFormatFile:fileAdoptionOptions:suggestedName:sourceApplication:](self, "initWithURL:allowsOldFormatFile:fileAdoptionOptions:suggestedName:sourceApplication:", a3, 0, 0, a4, a5);
}

- (WFShortcutExtractor)initWithURL:(id)a3 fileAdoptionOptions:(int64_t)a4 suggestedName:(id)a5 sourceApplication:(id)a6
{
  return -[WFShortcutExtractor initWithURL:allowsOldFormatFile:fileAdoptionOptions:suggestedName:sourceApplication:](self, "initWithURL:allowsOldFormatFile:fileAdoptionOptions:suggestedName:sourceApplication:", a3, 0, a4, a5, a6);
}

- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 suggestedName:(id)a5 sourceApplication:(id)a6
{
  return -[WFShortcutExtractor initWithURL:allowsOldFormatFile:skipsMaliciousScanning:fileAdoptionOptions:suggestedName:sourceApplication:](self, "initWithURL:allowsOldFormatFile:skipsMaliciousScanning:fileAdoptionOptions:suggestedName:sourceApplication:", a3, a4, 0, 0, a5, a6);
}

- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 fileAdoptionOptions:(int64_t)a5 suggestedName:(id)a6 sourceApplication:(id)a7
{
  return -[WFShortcutExtractor initWithURL:allowsOldFormatFile:skipsMaliciousScanning:fileAdoptionOptions:suggestedName:sourceApplication:](self, "initWithURL:allowsOldFormatFile:skipsMaliciousScanning:fileAdoptionOptions:suggestedName:sourceApplication:", a3, a4, 0, a5, a6, a7);
}

- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 suggestedName:(id)a6 sourceApplication:(id)a7
{
  return -[WFShortcutExtractor initWithURL:allowsOldFormatFile:skipsMaliciousScanning:fileAdoptionOptions:suggestedName:sourceApplication:](self, "initWithURL:allowsOldFormatFile:skipsMaliciousScanning:fileAdoptionOptions:suggestedName:sourceApplication:", a3, a4, a5, 0, a6, a7);
}

- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 fileAdoptionOptions:(int64_t)a6 suggestedName:(id)a7 sourceApplication:(id)a8
{
  id v16;
  id v17;
  id v18;
  WFShortcutExtractor *v19;
  WFShortcutExtractor *v20;
  uint64_t v21;
  NSString *suggestedName;
  uint64_t v23;
  NSString *sourceApplication;
  WFShortcutExtractor *v25;
  void *v27;
  objc_super v28;

  v16 = a3;
  v17 = a7;
  v18 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShortcutExtractor.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extractingURL"));

  }
  v28.receiver = self;
  v28.super_class = (Class)WFShortcutExtractor;
  v19 = -[WFShortcutExtractor init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_extractingURL, a3);
    v20->_allowsOldFormatFile = a4;
    v20->_skipsMaliciousScanning = a5;
    v20->_fileAdoptionOptions = a6;
    v21 = objc_msgSend(v17, "copy");
    suggestedName = v20->_suggestedName;
    v20->_suggestedName = (NSString *)v21;

    v23 = objc_msgSend(v18, "copy");
    sourceApplication = v20->_sourceApplication;
    v20->_sourceApplication = (NSString *)v23;

    v25 = v20;
  }

  return v20;
}

- (WFShortcutExtractor)initWithFile:(id)a3 suggestedName:(id)a4 sourceApplication:(id)a5
{
  return -[WFShortcutExtractor initWithFile:allowsOldFormatFile:suggestedName:sourceApplication:](self, "initWithFile:allowsOldFormatFile:suggestedName:sourceApplication:", a3, 0, a4, a5);
}

- (WFShortcutExtractor)initWithFile:(id)a3 allowsOldFormatFile:(BOOL)a4 suggestedName:(id)a5 sourceApplication:(id)a6
{
  return -[WFShortcutExtractor initWithFile:allowsOldFormatFile:skipsMaliciousScanning:suggestedName:sourceApplication:](self, "initWithFile:allowsOldFormatFile:skipsMaliciousScanning:suggestedName:sourceApplication:", a3, a4, 0, a5, a6);
}

- (WFShortcutExtractor)initWithFile:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 suggestedName:(id)a6 sourceApplication:(id)a7
{
  id v14;
  id v15;
  id v16;
  WFShortcutExtractor *v17;
  uint64_t v18;
  NSURL *extractingURL;
  uint64_t v20;
  NSString *suggestedName;
  uint64_t v22;
  NSString *sourceApplication;
  WFShortcutExtractor *v24;
  void *v26;
  objc_super v27;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShortcutExtractor.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extractingFile"));

  }
  v27.receiver = self;
  v27.super_class = (Class)WFShortcutExtractor;
  v17 = -[WFShortcutExtractor init](&v27, sel_init);
  if (v17)
  {
    objc_msgSend(v14, "fileURL");
    v18 = objc_claimAutoreleasedReturnValue();
    extractingURL = v17->_extractingURL;
    v17->_extractingURL = (NSURL *)v18;

    objc_storeStrong((id *)&v17->_extractingFile, a3);
    v17->_allowsOldFormatFile = a4;
    v17->_skipsMaliciousScanning = a5;
    v20 = objc_msgSend(v15, "copy");
    suggestedName = v17->_suggestedName;
    v17->_suggestedName = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    sourceApplication = v17->_sourceApplication;
    v17->_sourceApplication = (NSString *)v22;

    v24 = v17;
  }

  return v17;
}

- (void)extractShortcutWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  WFFileRepresentation *v14;
  WFFileRepresentation *extractingFile;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[WFShortcutExtractor extractShortcutWithCompletion:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Start extracting a shortcut from file", (uint8_t *)&v17, 0xCu);
  }

  -[WFShortcutExtractor extractingURL](self, "extractingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFileURL");

  if ((v7 & 1) != 0)
  {
    -[WFShortcutExtractor extractingFile](self, "extractingFile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      getWFGeneralLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[WFShortcutExtractor extractShortcutWithCompletion:]";
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Found a shortcut file URL", (uint8_t *)&v17, 0xCu);
      }

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0D13F78];
      -[WFShortcutExtractor extractingURL](self, "extractingURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileWithURL:options:", v13, -[WFShortcutExtractor fileAdoptionOptions](self, "fileAdoptionOptions"));
      v14 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
      extractingFile = self->_extractingFile;
      self->_extractingFile = v14;

      -[WFShortcutExtractor extractingFile](self, "extractingFile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, 0, v11);
        goto LABEL_13;
      }
    }
    -[WFShortcutExtractor extractingFile](self, "extractingFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShortcutExtractor extractShortcutFile:completion:](self, "extractShortcutFile:completion:", v11, v4);
  }
  else
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[WFShortcutExtractor extractShortcutWithCompletion:]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Found a remote shortcut URL", (uint8_t *)&v17, 0xCu);
    }

    -[WFShortcutExtractor extractingURL](self, "extractingURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShortcutExtractor extractRemoteShortcutFileAtURL:completion:](self, "extractRemoteShortcutFileAtURL:completion:", v11, v4);
  }
LABEL_13:

}

- (void)extractRemoteShortcutFileAtURL:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  WFShortcutExtractor *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB39F0];
  v8 = a3;
  objc_msgSend(v7, "wf_sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __65__WFShortcutExtractor_extractRemoteShortcutFileAtURL_completion___block_invoke;
  v16 = &unk_1E7AEF840;
  v17 = self;
  v18 = v6;
  v10 = v6;
  objc_msgSend(v9, "downloadTaskWithURL:completionHandler:", v8, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  getWFGeneralLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[WFShortcutExtractor extractRemoteShortcutFileAtURL:completion:]";
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Downloading a remote shortcut file", buf, 0xCu);
  }

  objc_msgSend(v11, "resume", v13, v14, v15, v16, v17);
}

- (void)extractShortcutFile:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  getWFGeneralLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[WFShortcutExtractor extractShortcutFile:completion:]";
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Extracting a shortcut from file", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(v6, "mappedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "length") > 3)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "subdataWithRange:", 0, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_stringWithData:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("AEA1")))
    {
      -[WFShortcutExtractor extractSignedShortcutFile:completion:](self, "extractSignedShortcutFile:completion:", v6, v7);
    }
    else
    {
      objc_msgSend(v6, "wfType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[WFShortcutExtractor isShortcutFileType:](WFShortcutExtractor, "isShortcutFileType:", v13);

      if (v14)
      {
        -[WFShortcutExtractor extractWorkflowFile:completion:](self, "extractWorkflowFile:completion:", v6, v7);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v15);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
  }

}

- (void)extractSignedShortcutFile:(id)a3 completion:(id)a4
{
  -[WFShortcutExtractor extractSignedShortcutFile:allowsRetryIfExpired:completion:](self, "extractSignedShortcutFile:allowsRetryIfExpired:completion:", a3, 1, a4);
}

- (void)extractSignedShortcutFile:(id)a3 allowsRetryIfExpired:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  WFShortcutPackageFile *v10;
  void *v11;
  WFShortcutPackageFile *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  getWFGeneralLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[WFShortcutExtractor extractSignedShortcutFile:allowsRetryIfExpired:completion:]";
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Extracting a signed shortcut format file", buf, 0xCu);
  }

  v10 = [WFShortcutPackageFile alloc];
  objc_msgSend(v7, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFShortcutPackageFile initWithSignedShortcutFileURL:](v10, "initWithSignedShortcutFileURL:", v11);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__WFShortcutExtractor_extractSignedShortcutFile_allowsRetryIfExpired_completion___block_invoke;
  v15[3] = &unk_1E7AEF890;
  v16 = v7;
  v17 = v8;
  v15[4] = self;
  v13 = v7;
  v14 = v8;
  -[WFShortcutPackageFile extractShortcutFileRepresentationWithCompletion:](v12, "extractShortcutFileRepresentationWithCompletion:", v15);

}

- (void)extractWorkflowFile:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  getWFGeneralLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[WFShortcutExtractor extractWorkflowFile:completion:]";
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Extracting an old shortcut format file", (uint8_t *)&v12, 0xCu);
  }

  if (VCIsInternalBuild()
    && +[WFSharingSettings shortcutFileSharingEnabled](WFSharingSettings, "shortcutFileSharingEnabled")
    || -[WFShortcutExtractor allowsOldFormatFile](self, "allowsOldFormatFile"))
  {
    -[WFShortcutExtractor suggestedName](self, "suggestedName");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[WFShortcutExtractor extractWorkflowFile:shortcutName:shortcutFileContentType:iCloudIdentifier:completion:](self, "extractWorkflowFile:shortcutName:shortcutFileContentType:iCloudIdentifier:completion:", v6, v9, 0, 0, v7);
    }
    else
    {
      objc_msgSend(v6, "wfName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFShortcutExtractor extractWorkflowFile:shortcutName:shortcutFileContentType:iCloudIdentifier:completion:](self, "extractWorkflowFile:shortcutName:shortcutFileContentType:iCloudIdentifier:completion:", v6, v11, 0, 0, v7);

      v10 = 0;
    }
  }
  else
  {
    +[WFSharingSettings shortcutFileSharingDisabledError](WFSharingSettings, "shortcutFileSharingDisabledError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
  }

}

- (void)extractWorkflowFile:(id)a3 shortcutName:(id)a4 shortcutFileContentType:(int64_t)a5 iCloudIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  id v15;
  WFWorkflowFileDescriptor *v16;
  void *v17;
  WFWorkflowFileDescriptor *v18;
  WFWorkflowFile *v19;
  id v20;
  void *v21;
  id v22;
  const __CFString *v23;
  WFExtractShortcutResult *v24;
  void *v25;
  void *v26;
  WFExtractShortcutResult *v27;
  WFWorkflowRemoteQuarantineRequest *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  WFExtractShortcutResult *v33;
  void (**v34)(id, void *, _QWORD);
  id v35;
  id v36;

  v12 = a3;
  v13 = a6;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v15 = a4;
  v16 = [WFWorkflowFileDescriptor alloc];
  -[WFShortcutExtractor sourceApplication](self, "sourceApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v12;
  v18 = -[WFWorkflowFileDescriptor initWithFile:name:sourceAppIdentifier:](v16, "initWithFile:name:sourceAppIdentifier:", v12, v15, v17);

  v36 = 0;
  v19 = -[WFWorkflowFile initWithDescriptor:error:]([WFWorkflowFile alloc], "initWithDescriptor:error:", v18, &v36);
  v20 = v36;
  v35 = v20;
  -[WFWorkflowFile recordRepresentationWithError:](v19, "recordRepresentationWithError:", &v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v35;

  if ((unint64_t)(a5 - 1) > 2)
    v23 = CFSTR("ShortcutSourceUnknown");
  else
    v23 = *(&off_1E7AEF8B0 + a5 - 1);
  objc_msgSend(v21, "setSource:", v23);
  if (v21)
  {
    v30 = v22;
    v24 = [WFExtractShortcutResult alloc];
    -[WFShortcutExtractor sourceApplication](self, "sourceApplication");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "creationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[WFExtractShortcutResult initWithRecord:fileContentType:iCloudIdentifier:sourceApplicationIdentifier:sharedDate:](v24, "initWithRecord:fileContentType:iCloudIdentifier:sourceApplicationIdentifier:sharedDate:", v21, a5, v13, v25, v26);

    if (-[WFShortcutExtractor skipsMaliciousScanning](self, "skipsMaliciousScanning"))
    {
      v14[2](v14, v27, 0);
    }
    else
    {
      v28 = -[WFWorkflowRemoteQuarantineRequest initWithWorkflowRecord:]([WFWorkflowRemoteQuarantineRequest alloc], "initWithWorkflowRecord:", v21);
      +[WFRemoteQuarantinePolicyEvaluator sharedEvaluator](WFRemoteQuarantinePolicyEvaluator, "sharedEvaluator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __108__WFShortcutExtractor_extractWorkflowFile_shortcutName_shortcutFileContentType_iCloudIdentifier_completion___block_invoke;
      v32[3] = &unk_1E7AF8548;
      v34 = v14;
      v33 = v27;
      objc_msgSend(v29, "evaluatePolicyForRequest:completion:", v28, v32);

    }
    v22 = v30;
  }
  else
  {
    ((void (**)(id, void *, id))v14)[2](v14, 0, v22);
  }

}

- (NSURL)extractingURL
{
  return self->_extractingURL;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (BOOL)allowsOldFormatFile
{
  return self->_allowsOldFormatFile;
}

- (BOOL)skipsMaliciousScanning
{
  return self->_skipsMaliciousScanning;
}

- (int64_t)fileAdoptionOptions
{
  return self->_fileAdoptionOptions;
}

- (WFFileRepresentation)extractingFile
{
  return self->_extractingFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractingFile, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_extractingURL, 0);
}

uint64_t __108__WFShortcutExtractor_extractWorkflowFile_shortcutName_shortcutFileContentType_iCloudIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if ((a2 & 1) != 0)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
}

void __81__WFShortcutExtractor_extractSignedShortcutFile_allowsRetryIfExpired_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int IsExpiredCertificateError;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a3 == 1)
  {
    if (!v9)
    {
      IsExpiredCertificateError = WFErrorIsExpiredCertificateError(v11);
      if (!v10 || !IsExpiredCertificateError)
      {
LABEL_6:
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_18;
      }
      getWFGeneralLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[WFShortcutExtractor extractSignedShortcutFile:allowsRetryIfExpired:completion:]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEFAULT, "%s Found an iCloud Signed Shortcut File with expired certificate. Trying to download a new one from iCloud", buf, 0xCu);
      }

      +[WFGallerySessionManager sharedManager](WFGallerySessionManager, "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __81__WFShortcutExtractor_extractSignedShortcutFile_allowsRetryIfExpired_completion___block_invoke_171;
      v22[3] = &unk_1E7AEF868;
      v25 = *(id *)(a1 + 48);
      v16 = v12;
      v17 = *(_QWORD *)(a1 + 32);
      v23 = v16;
      v24 = v17;
      v18 = (id)objc_msgSend(v15, "getWorkflowForIdentifier:completionHandler:", v10, v22);

    }
    a3 = 1;
  }
  else
  {
    if (a3 != 3 && a3 != 2)
      a3 = -1;
    if (!v9)
      goto LABEL_6;
  }
  v19 = *(void **)(a1 + 32);
  objc_msgSend(v19, "suggestedName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v19, "extractWorkflowFile:shortcutName:shortcutFileContentType:iCloudIdentifier:completion:", v9, v20, a3, v10, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "wfName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "extractWorkflowFile:shortcutName:shortcutFileContentType:iCloudIdentifier:completion:", v9, v21, a3, v10, *(_QWORD *)(a1 + 48));

  }
LABEL_18:

}

void __81__WFShortcutExtractor_extractSignedShortcutFile_allowsRetryIfExpired_completion___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  objc_msgSend(v8, "signedShortcutFile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v8, "signedShortcutFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extractSignedShortcutFile:allowsRetryIfExpired:completion:", v11, 0, *(_QWORD *)(a1 + 48));

  }
  else
  {
    getWFGeneralLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[WFShortcutExtractor extractSignedShortcutFile:allowsRetryIfExpired:completion:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to download a renewed iCloud Signed Shortcut File", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __65__WFShortcutExtractor_extractRemoteShortcutFileAtURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7
    && (v10 = (void *)MEMORY[0x1E0D13F78],
        objc_msgSend(v8, "suggestedFilename"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "fileWithURL:options:ofType:proposedFilename:", v7, 3, 0, v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    objc_msgSend(*(id *)(a1 + 32), "extractShortcutFile:completion:", v12, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB32E8];
    v17 = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("The shortcut could not be downloaded."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -1100, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (BOOL)isShortcutFileType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("com.apple.shortcut");
  v8[1] = CFSTR("com.apple.shortcuts.workflow-file");
  v8[2] = CFSTR("is.workflow.my.workflow");
  v8[3] = CFSTR("is.workflow.workflow");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_compactMap:", &__block_literal_global_22677);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "conformsToUTTypes:", v6);

  return (char)v3;
}

uint64_t __42__WFShortcutExtractor_isShortcutFileType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
}

@end
