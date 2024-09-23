@implementation WFFileValue

- (WFFileValue)initWithURL:(id)a3
{
  id v6;
  WFFileValue *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  WFFileLocation *fileLocation;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileValue.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v19.receiver = self;
  v19.super_class = (Class)WFFileValue;
  v7 = -[WFFileValue init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "createBookmarkWithFileURL:workflowID:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      getWFFilesLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[WFFileValue initWithURL:]";
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Could not create bookmark (%@) for data backed file value falling back to URL backing", buf, 0x16u);
      }

      objc_storeStrong((id *)&v7->_URL, a3);
      +[WFFileLocation locationWithURL:](WFFileLocation, "locationWithURL:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      fileLocation = v7->_fileLocation;
      v7->_fileLocation = (WFFileLocation *)v10;

    }
    objc_msgSend(v6, "wf_localizedDisplayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v6, "lastPathComponent");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    objc_msgSend(v6, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFFileValue initWithBookmarkData:filename:displayName:](v7, "initWithBookmarkData:filename:displayName:", v8, v16, v15);

  }
  return v7;
}

- (WFFileValue)initWithBookmarkData:(id)a3 filename:(id)a4 displayName:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFFileValue *v12;
  WFFileValue *v13;
  WFFileValue *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFFileValue;
  v12 = -[WFFileValue init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmarkData, a3);
    objc_storeStrong((id *)&v13->_filename, a4);
    objc_storeStrong((id *)&v13->_cachedDisplayName, a5);
    v14 = v13;
  }

  return v13;
}

- (WFFileValue)initWithURL:(id)a3 workflowID:(id)a4
{
  id v8;
  id v9;
  WFFileValue *v10;
  WFFileValue *v11;
  uint64_t v12;
  WFFileLocation *fileLocation;
  uint64_t v14;
  NSString *filename;
  id v16;
  WFFileValue *v17;
  void *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileValue.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v20.receiver = self;
  v20.super_class = (Class)WFFileValue;
  v10 = -[WFFileValue init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_URL, a3);
    +[WFFileLocation locationWithURL:](WFFileLocation, "locationWithURL:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    fileLocation = v11->_fileLocation;
    v11->_fileLocation = (WFFileLocation *)v12;

    objc_msgSend(v8, "lastPathComponent");
    v14 = objc_claimAutoreleasedReturnValue();
    filename = v11->_filename;
    v11->_filename = (NSString *)v14;

    if (v9)
      v16 = (id)objc_msgSend((id)objc_opt_class(), "createBookmarkWithFileURL:workflowID:", v8, v9);
    v17 = v11;
  }

  return v11;
}

- (WFFileValue)initWithFileLocation:(id)a3 filename:(id)a4 displayName:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFFileValue *v13;
  WFFileValue *v14;
  uint64_t v15;
  NSString *cachedDisplayName;
  WFFileValue *v17;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileValue.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileLocation"));

  }
  v20.receiver = self;
  v20.super_class = (Class)WFFileValue;
  v13 = -[WFFileValue init](&v20, sel_init);
  if (v13)
  {
    v14 = v13;
    objc_storeStrong((id *)&v13->_fileLocation, a3);
    objc_storeStrong((id *)&v14->_filename, a4);
    v15 = objc_msgSend(v12, "copy");
    cachedDisplayName = v14->_cachedDisplayName;
    v14->_cachedDisplayName = (NSString *)v15;

    v17 = -[WFFileValue initWithFileLocation:filename:displayName:reloadDisplayName:](v14, "initWithFileLocation:filename:displayName:reloadDisplayName:", v10, v11, v12, 1);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (WFFileValue)initWithFileLocation:(id)a3 filename:(id)a4 displayName:(id)a5 reloadDisplayName:(BOOL)a6
{
  id v12;
  id v13;
  id v14;
  WFFileValue *v15;
  WFFileValue *v16;
  uint64_t v17;
  NSString *cachedDisplayName;
  uint64_t v19;
  NSString *displayName;
  WFFileValue *v21;
  void *v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileValue.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileLocation"));

  }
  v24.receiver = self;
  v24.super_class = (Class)WFFileValue;
  v15 = -[WFFileValue init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fileLocation, a3);
    objc_storeStrong((id *)&v16->_filename, a4);
    v17 = objc_msgSend(v14, "copy");
    cachedDisplayName = v16->_cachedDisplayName;
    v16->_cachedDisplayName = (NSString *)v17;

    if (!a6)
    {
      v19 = objc_msgSend(v14, "copy");
      displayName = v16->_displayName;
      v16->_displayName = (NSString *)v19;

    }
    v21 = v16;
  }

  return v16;
}

- (WFFileValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  WFFileValue *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  WFFileValue *v33;
  int v34;
  NSObject *v35;
  void *v37;
  WFFileValue *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("fileLocation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("bookmarkData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    WFEnforceClass(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", CFSTR("filename"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v18 = v16;

    objc_msgSend(v10, "objectForKey:", CFSTR("displayName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    +[WFFileLocation locationWithSerializedRepresentation:](WFFileLocation, "locationWithSerializedRepresentation:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      self = -[WFFileValue initWithFileLocation:filename:displayName:](self, "initWithFileLocation:filename:displayName:", v22, v18, v21);
      v17 = self;
LABEL_37:

      goto LABEL_38;
    }
    if (!v14)
    {
      v17 = 0;
      goto LABEL_37;
    }
    v23 = v7;
    v43 = v14;
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    v25 = v24;

    objc_msgSend(v25, "workflow");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "workflowID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v25;
    if (v27)
    {
      getWFFilesLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFFileValue initWithSerializedRepresentation:variableProvider:parameter:]";
        _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s Attempting to convert bookmark based file value into file location based value", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      v45 = 0;
      v14 = v43;
      objc_msgSend(v29, "resolveBookmarkData:updatedData:error:", v43, &v45, &v44);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v45;
      v41 = v44;

      v39 = v30;
      if (v30)
      {
        v38 = [WFFileValue alloc];
        objc_msgSend(v30, "url");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "workflow");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "workflowID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[WFFileValue initWithURL:workflowID:](v38, "initWithURL:workflowID:", v37, v32);

        if (v17)
        {
          v33 = v17;
          v34 = 1;
        }
        else
        {
          v34 = 0;
        }

        v14 = v43;
      }
      else
      {
        getWFFilesLogObject();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v47 = "-[WFFileValue initWithSerializedRepresentation:variableProvider:parameter:]";
          v48 = 2112;
          v49 = v41;
          _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_ERROR, "%s Failed to resolve bookmark data error: %@", buf, 0x16u);
        }

        self = -[WFFileValue initWithBookmarkData:filename:displayName:](self, "initWithBookmarkData:filename:displayName:", v43, v18, v21);
        v34 = 1;
        v17 = self;
      }

      if (v34)
        goto LABEL_36;
    }
    else
    {
      v14 = v43;
    }
    self = -[WFFileValue initWithBookmarkData:filename:displayName:](self, "initWithBookmarkData:filename:displayName:", v14, v18, v21);
    v17 = self;
LABEL_36:

    goto LABEL_37;
  }
  v17 = 0;
LABEL_38:

  return v17;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[WFFileValue fileLocation](self, "fileLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("fileLocation"));
  -[WFFileValue bookmarkData](self, "bookmarkData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("bookmarkData"));

  -[WFFileValue filename](self, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("filename"));

  -[WFFileValue displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("displayName"));

  return (WFPropertyListObject *)v3;
}

- (BOOL)isSupportedOnCurrentDevice
{
  return 1;
}

- (NSString)filename
{
  NSString *filename;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSString *v9;
  NSObject *v10;
  NSString *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  filename = self->_filename;
  if (filename)
    return filename;
  -[WFFileValue fileLocation](self, "fileLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v12 = 0;
    -[WFFileValue resolveURLWithWorkflowID:error:](self, "resolveURLWithWorkflowID:error:", 0, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (v7)
      goto LABEL_5;
LABEL_7:
    getWFFilesLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFFileValue filename]";
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Could not resolve url with error: %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  -[WFFileValue fileLocation](self, "fileLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "resolveLocationWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (!v7)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v7, "lastPathComponent");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = self->_filename;
  self->_filename = v9;
LABEL_9:

  v11 = self->_filename;
  return v11;
}

- (NSString)displayName
{
  NSString *displayName;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  displayName = self->_displayName;
  if (displayName)
    goto LABEL_9;
  -[WFFileValue URL](self, "URL");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[WFFileValue fileLocation](self, "fileLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFFileValue fileLocation](self, "fileLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v8, "resolveLocationWithError:", &v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15;

      if (v5)
        goto LABEL_6;
    }
    else
    {
      v14 = 0;
      -[WFFileValue resolveURLWithWorkflowID:error:](self, "resolveURLWithWorkflowID:error:", 0, &v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v14;
      if (v5)
        goto LABEL_6;
    }
    v11 = self->_cachedDisplayName;

    return v11;
  }
  v5 = (void *)v4;
  v6 = 0;
LABEL_6:
  objc_msgSend(v5, "wf_localizedDisplayName");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v9 || (v9 = self->_cachedDisplayName) != 0)
  {
    v10 = self->_displayName;
    self->_displayName = v9;

    displayName = self->_displayName;
LABEL_9:
    v11 = displayName;
    return v11;
  }
  getWFFilesLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[WFFileValue displayName]";
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Could not get displayName for URL: %@ falling back to last path component", buf, 0x16u);
  }

  objc_msgSend(v5, "lastPathComponent");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)resolveURLWithWorkflowID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSURL *v22;
  NSURL *URL;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSURL *v28;
  NSURL *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSURL *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  getWFFilesLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEBUG, "%s Resolving URL", buf, 0xCu);
  }

  -[WFFileValue URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[WFFileValue fileLocation](self, "fileLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && v10)
    {
      -[WFFileValue fileLocation](self, "fileLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend(v11, "resolveLocationWithError:", &v46);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v46;

      getWFFilesLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[WFFileValue fileLocation](self, "fileLocation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
        v49 = 2112;
        v50 = v12;
        v51 = 2112;
        v52 = v17;
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEFAULT, "%s Attemping to create wrapper from url: %@ file location type: %@", buf, 0x20u);

      }
      if (!v12)
      {
        getWFFilesLogObject();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
          v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_ERROR, "%s Could not resolve file location with error: %@", buf, 0x16u);
        }

        if (v13)
        {
          v21 = objc_retainAutorelease(v13);
          v9 = 0;
          *a4 = v21;
          goto LABEL_42;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
        v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v40;

        v21 = 0;
LABEL_41:
        v9 = 0;
        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v13;
      objc_msgSend(v18, "resolveFilePath:workflowID:error:", v19, v6, &v45);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v45;

      if (v20)
      {
        objc_msgSend(v20, "url");
        v22 = (NSURL *)objc_claimAutoreleasedReturnValue();
        URL = self->_URL;
        self->_URL = v22;

        goto LABEL_24;
      }
      getWFFilesLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "path");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
        v49 = 2112;
        v50 = v39;
        v51 = 2114;
        v52 = v21;
        _os_log_impl(&dword_1C15B3000, v38, OS_LOG_TYPE_ERROR, "%s Failed to look up file path: %@: %{public}@", buf, 0x20u);

      }
      v37 = objc_retainAutorelease(v21);
      v21 = v37;
    }
    else
    {
      -[WFFileValue bookmarkData](self, "bookmarkData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        -[WFFileValue fileLocation](self, "fileLocation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          v21 = 0;
          goto LABEL_25;
        }
        getWFFilesLogObject();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
          _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_DEFAULT, "%s No workflowID given but a file location found. Falling back to non security scoped URL.", buf, 0xCu);
        }

        -[WFFileValue fileLocation](self, "fileLocation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        objc_msgSend(v32, "resolveLocationWithError:", &v42);
        v33 = (NSURL *)objc_claimAutoreleasedReturnValue();
        v21 = v42;

        if (!v33)
        {
          getWFFilesLogObject();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
            v49 = 2114;
            v50 = v21;
            _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_ERROR, "%s Could not create file from file location %{public}@", buf, 0x16u);
          }

          if (a4)
            *a4 = objc_retainAutorelease(v21);
        }
        v12 = self->_URL;
        self->_URL = v33;
LABEL_24:

LABEL_25:
        -[WFFileValue URL](self, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:

        goto LABEL_43;
      }
      objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFileValue bookmarkData](self, "bookmarkData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v44 = 0;
      objc_msgSend(v25, "resolveBookmarkData:updatedData:error:", v26, &v44, &v43);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v44;
      v21 = v43;

      if (v27)
      {
        objc_msgSend(v27, "url");
        v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
        v29 = self->_URL;
        self->_URL = v28;

        goto LABEL_24;
      }
      getWFFilesLogObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
        v49 = 2112;
        v50 = v21;
        _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_ERROR, "%s Failed to resolve bookmark data error: %@", buf, 0x16u);
      }

      if (!a4)
        goto LABEL_38;
      v37 = objc_retainAutorelease(v21);
    }
    *a4 = v37;
LABEL_38:

    goto LABEL_41;
  }
  -[WFFileValue URL](self, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

  return v9;
}

- (NSData)bookmarkData
{
  return self->_bookmarkData;
}

- (NSURL)URL
{
  return self->_URL;
}

- (WFFileLocation)fileLocation
{
  return self->_fileLocation;
}

- (NSString)cachedDisplayName
{
  return self->_cachedDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_fileLocation, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
}

+ (id)createBookmarkWithFileURL:(id)a3 workflowID:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE buf[24];
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "wf_fileIsWritable");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v8 = (void *)getFPSandboxingURLWrapperClass_softClass;
  v25 = getFPSandboxingURLWrapperClass_softClass;
  if (!getFPSandboxingURLWrapperClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getFPSandboxingURLWrapperClass_block_invoke;
    v27 = &unk_1E7AF9520;
    v28 = &v22;
    __getFPSandboxingURLWrapperClass_block_invoke((uint64_t)buf);
    v8 = (void *)v23[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v22, 8);
  v21 = 0;
  objc_msgSend(v9, "wrapperWithURL:readonly:error:", v5, v7 ^ 1u, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  objc_msgSend(MEMORY[0x1E0DC7928], "accessSpecifierForCurrentProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DC7EA8]);

  if ((v14 & 1) != 0)
  {
    v15 = v11;
LABEL_8:
    getWFFilesLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[WFFileValue createBookmarkWithFileURL:workflowID:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v27 = v15;
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s Could not create bookmark at URL: %@ with error: %@", buf, 0x20u);
    }
    v17 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  objc_msgSend(v16, "createBookmarkWithURL:workflowID:error:", v10, v6, &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;

  if (!v17)
    goto LABEL_8;
  getWFFilesLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "+[WFFileValue createBookmarkWithFileURL:workflowID:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    v27 = v6;
    _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_DEBUG, "%s Created bookmark at URL: %@ for workflowID: %@", buf, 0x20u);
  }
LABEL_11:

  return v17;
}

+ (id)defaultValueWithWorkflowID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  +[WFShortcutsFileLocation locationAtRootDirectory](WFShortcutsFileLocation, "locationAtRootDirectory", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)a1);
  WFLocalizedStringWithKey(CFSTR("Shortcuts iCloud Folder"), CFSTR("Shortcuts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFileLocation:filename:displayName:reloadDisplayName:", v4, CFSTR("Documents"), v6, 0);

  return v7;
}

@end
