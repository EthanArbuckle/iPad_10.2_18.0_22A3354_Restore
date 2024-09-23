@implementation QLPreviewItemEditedCopy

- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3
{
  return -[QLPreviewItemEditedCopy initWithEditedCopyURL:temporaryDirectoryCreatedInHost:](self, "initWithEditedCopyURL:temporaryDirectoryCreatedInHost:", a3, 0);
}

- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3 temporaryDirectoryCreatedInHost:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  QLPreviewItemEditedCopy *v8;
  QLPreviewItemEditedCopy *v9;
  FPSandboxingURLWrapper *editedCopyURLWrapper;
  id v11;
  uint64_t v12;
  FPSandboxingURLWrapper *v13;
  NSURL *editedCopyURL;
  NSObject *v15;
  uint64_t v16;
  NSUUID *uuid;
  NSObject **v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)QLPreviewItemEditedCopy;
  v8 = -[QLPreviewItemEditedCopy init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v4)
    {
      objc_storeStrong((id *)&v8->_editedCopyURL, a3);
      editedCopyURLWrapper = v9->_editedCopyURLWrapper;
      v9->_editedCopyURLWrapper = 0;

    }
    else
    {
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v7, 0, &v20);
      v12 = objc_claimAutoreleasedReturnValue();
      v11 = v20;
      v13 = v9->_editedCopyURLWrapper;
      v9->_editedCopyURLWrapper = (FPSandboxingURLWrapper *)v12;

      editedCopyURL = v9->_editedCopyURL;
      v9->_editedCopyURL = 0;

      if (v11 || !v9->_editedCopyURLWrapper)
      {
        v15 = *MEMORY[0x1E0D83678];
        if (!*MEMORY[0x1E0D83678])
        {
          v19 = (NSObject **)MEMORY[0x1E0D83678];
          QLSInitLogging();
          v15 = *v19;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v11;
          _os_log_impl(&dword_1D936E000, v15, OS_LOG_TYPE_ERROR, "Could not create sandbox wrapper. Error: %@ #Generic", buf, 0xCu);
        }
        goto LABEL_10;
      }
    }
    v11 = 0;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v16;

    v9->_version = 1;
    v9->_temporaryDirectoryWasCreatedInHost = v4;

  }
  return v9;
}

- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3 containerTemporaryURL:(id)a4 temporaryDirectoryCreatedInHost:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  QLPreviewItemEditedCopy *v10;
  QLPreviewItemEditedCopy *v11;
  FPSandboxingURLWrapper *directoryURLWrapper;
  uint64_t v13;
  id v14;
  FPSandboxingURLWrapper *v15;
  NSURL *hostTemporaryContainerURL;
  NSObject **v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = -[QLPreviewItemEditedCopy initWithEditedCopyURL:temporaryDirectoryCreatedInHost:](self, "initWithEditedCopyURL:temporaryDirectoryCreatedInHost:", a3, v5);
  v11 = v10;
  if (v10)
  {
    v10->_temporaryDirectoryWasCreatedInHost = v5;
    if (v5)
    {
      objc_storeStrong((id *)&v10->_hostTemporaryContainerURL, a4);
      directoryURLWrapper = v11->_directoryURLWrapper;
      v11->_directoryURLWrapper = 0;

    }
    else
    {
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v9, 0, &v20);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v20;
      v15 = v11->_directoryURLWrapper;
      v11->_directoryURLWrapper = (FPSandboxingURLWrapper *)v13;

      hostTemporaryContainerURL = v11->_hostTemporaryContainerURL;
      v11->_hostTemporaryContainerURL = 0;

      if (v14 || !v11->_directoryURLWrapper)
      {
        v17 = (NSObject **)MEMORY[0x1E0D83678];
        v18 = *MEMORY[0x1E0D83678];
        if (!*MEMORY[0x1E0D83678])
        {
          QLSInitLogging();
          v18 = *v17;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          _os_log_impl(&dword_1D936E000, v18, OS_LOG_TYPE_ERROR, "Could not create sandbox wrapper. Error: %@ #Generic", buf, 0xCu);
        }
      }

    }
  }

  return v11;
}

- (void)bumpVersion
{
  ++self->_version;
}

- (BOOL)containerStillExists
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewItemEditedCopy containerURL](self, "containerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  return v6;
}

- (void)markAsPurgeable
{
  id v3;
  const char *v4;
  int v5;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  int *v11;
  char *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v17;
  const char *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  int *v24;
  char *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  _BYTE v34[24];
  __int16 v35;
  QLPreviewItemEditedCopy *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v30 = 66565;
  -[QLPreviewItemEditedCopy url](self, "url");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  v5 = fsctl(v4, 0xC0084A44uLL, &v30, 0);
  v6 = (NSObject **)MEMORY[0x1E0D83678];
  v7 = *MEMORY[0x1E0D83678];
  if (v5)
  {
    if (!v7)
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      -[QLPreviewItemEditedCopy url](self, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *__error();
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 138413314;
      v32 = v9;
      v33 = 1024;
      *(_DWORD *)v34 = v10;
      *(_WORD *)&v34[4] = 2080;
      *(_QWORD *)&v34[6] = v12;
      *(_WORD *)&v34[14] = 2048;
      *(_QWORD *)&v34[16] = v30;
      v35 = 2112;
      v36 = self;
      v13 = "Failed to mark edited file %@ as purgeable: %d (%s) (flags 0x%llx) . %@ #PreviewItem";
      v14 = v8;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 48;
LABEL_10:
      _os_log_impl(&dword_1D936E000, v14, v15, v13, buf, v16);

    }
  }
  else
  {
    if (!v7)
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      -[QLPreviewItemEditedCopy url](self, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v9;
      v33 = 2048;
      *(_QWORD *)v34 = v30;
      *(_WORD *)&v34[8] = 2112;
      *(_QWORD *)&v34[10] = self;
      v13 = "Marked edited file %@ as purgeable (flags 0x%llx) . %@ #PreviewItem";
      v14 = v8;
      v15 = OS_LOG_TYPE_INFO;
      v16 = 32;
      goto LABEL_10;
    }
  }
  -[QLPreviewItemEditedCopy containerURL](self, "containerURL");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");

  v19 = fsctl(v18, 0xC0084A44uLL, &v30, 0);
  v20 = *v6;
  if (v19)
  {
    if (!v20)
    {
      QLSInitLogging();
      v20 = *v6;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      -[QLPreviewItemEditedCopy containerURL](self, "containerURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *__error();
      v24 = __error();
      v25 = strerror(*v24);
      *(_DWORD *)buf = 138413314;
      v32 = v22;
      v33 = 1024;
      *(_DWORD *)v34 = v23;
      *(_WORD *)&v34[4] = 2080;
      *(_QWORD *)&v34[6] = v25;
      *(_WORD *)&v34[14] = 2048;
      *(_QWORD *)&v34[16] = v30;
      v35 = 2112;
      v36 = self;
      v26 = "Failed to mark container %@ as purgeable: %d (%s) (flags 0x%llx) . %@ #PreviewItem";
      v27 = v21;
      v28 = OS_LOG_TYPE_ERROR;
      v29 = 48;
LABEL_20:
      _os_log_impl(&dword_1D936E000, v27, v28, v26, buf, v29);

    }
  }
  else
  {
    if (!v20)
    {
      QLSInitLogging();
      v20 = *v6;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      -[QLPreviewItemEditedCopy containerURL](self, "containerURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v22;
      v33 = 2048;
      *(_QWORD *)v34 = v30;
      *(_WORD *)&v34[8] = 2112;
      *(_QWORD *)&v34[10] = self;
      v26 = "Marked container %@ as purgeable (flags 0x%llx) . %@ #PreviewItem";
      v27 = v21;
      v28 = OS_LOG_TYPE_INFO;
      v29 = 32;
      goto LABEL_20;
    }
  }
}

- (void)removeFromDisk:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject **v9;
  NSObject *v10;
  _QWORD v11[6];
  BOOL v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  QLPreviewItemEditedCopy *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)objc_opt_new();
  -[QLPreviewItemEditedCopy url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewItemEditedCopy containerURL](self, "containerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__QLPreviewItemEditedCopy_removeFromDisk___block_invoke;
  v11[3] = &unk_1E9EFC3E8;
  v11[4] = self;
  v11[5] = &v14;
  v12 = a3;
  objc_msgSend(v5, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v6, 1, v7, 1, &v13, v11);
  v8 = v13;

  if (!*((_BYTE *)v15 + 24))
  {
    v9 = (NSObject **)MEMORY[0x1E0D83678];
    v10 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = self;
      _os_log_impl(&dword_1D936E000, v10, OS_LOG_TYPE_ERROR, "Cannot remove edited file because coordination failed with error: %@. %@ #PreviewItem", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v14, 8);
}

void __42__QLPreviewItemEditedCopy_removeFromDisk___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject **v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  uint64_t v20;
  char v21;
  id v22;
  NSObject **v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7 && objc_msgSend(v9, "fileExistsAtPath:", v7))
  {
    v32 = 0;
    v11 = objc_msgSend(v10, "removeItemAtURL:error:", v5, &v32);
    v12 = v32;
    v13 = (NSObject **)MEMORY[0x1E0D83678];
    v14 = *MEMORY[0x1E0D83678];
    if ((v11 & 1) != 0)
    {
      if (!v14)
      {
        QLSInitLogging();
        v14 = *v13;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        goto LABEL_13;
      v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      v16 = "Removed edited file. %@ #PreviewItem";
      v17 = v14;
      v18 = OS_LOG_TYPE_DEBUG;
      v19 = 12;
    }
    else
    {
      if (!v14)
      {
        QLSInitLogging();
        v14 = *v13;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v34 = v12;
      v35 = 2112;
      v36 = v20;
      v16 = "Cannot remove edited file with error: %@. %@ #PreviewItem";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 22;
    }
    _os_log_impl(&dword_1D936E000, v17, v18, v16, buf, v19);
LABEL_13:

  }
  if (*(_BYTE *)(a1 + 48) && v8 && objc_msgSend(v10, "fileExistsAtPath:", v8))
  {
    v31 = 0;
    v21 = objc_msgSend(v10, "removeItemAtURL:error:", v6, &v31);
    v22 = v31;
    v23 = (NSObject **)MEMORY[0x1E0D83678];
    v24 = *MEMORY[0x1E0D83678];
    if ((v21 & 1) != 0)
    {
      if (!v24)
      {
        QLSInitLogging();
        v24 = *v23;
      }
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        goto LABEL_27;
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v34 = v25;
      v26 = "Removed edited file directory. %@ #PreviewItem";
      v27 = v24;
      v28 = OS_LOG_TYPE_DEBUG;
      v29 = 12;
    }
    else
    {
      if (!v24)
      {
        QLSInitLogging();
        v24 = *v23;
      }
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v30 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v34 = v22;
      v35 = 2112;
      v36 = v30;
      v26 = "Cannot remove edited file directory with error: %@. %@ #PreviewItem";
      v27 = v24;
      v28 = OS_LOG_TYPE_ERROR;
      v29 = 22;
    }
    _os_log_impl(&dword_1D936E000, v27, v28, v26, buf, v29);
LABEL_27:

  }
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  QLPreviewItemEditedCopy *v6;
  QLPreviewItemEditedCopy *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = (QLPreviewItemEditedCopy *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[QLPreviewItemEditedCopy uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewItemEditedCopy uuid](v7, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[QLPreviewItemEditedCopy uuid](self, "uuid");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLPreviewItemEditedCopy uuid](v7, "uuid");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_22;
        }
      }
      v11 = -[QLPreviewItemEditedCopy version](self, "version");
      if (v11 != -[QLPreviewItemEditedCopy version](v7, "version"))
      {
        v10 = 0;
        goto LABEL_21;
      }
      -[QLPreviewItemEditedCopy url](self, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewItemEditedCopy url](v7, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        -[QLPreviewItemEditedCopy containerURL](self, "containerURL");
        v14 = objc_claimAutoreleasedReturnValue();
        -[QLPreviewItemEditedCopy containerURL](v7, "containerURL");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v14 == v15)
        {
          v10 = 1;
          v21 = (void *)v14;
          v22 = (void *)v14;
LABEL_19:

LABEL_20:
LABEL_21:
          if (v8 == v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v21 = (void *)v14;
        v22 = (void *)v15;
      }
      v25 = v12;
      -[QLPreviewItemEditedCopy url](self, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewItemEditedCopy url](v7, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqual:", v17))
      {
        -[QLPreviewItemEditedCopy containerURL](self, "containerURL");
        v24 = v3;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLPreviewItemEditedCopy containerURL](v7, "containerURL");
        v23 = v4;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v18, "isEqual:", v19);

        v4 = v23;
        v3 = v24;

      }
      else
      {

        v10 = 0;
      }
      v12 = v25;
      if (v25 != v13)
        goto LABEL_20;
      goto LABEL_19;
    }
    v10 = 0;
  }
LABEL_24:

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[QLPreviewItemEditedCopy url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewItemEditedCopy containerURL](self, "containerURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)url
{
  NSURL *v3;

  if (-[QLPreviewItemEditedCopy temporaryDirectoryWasCreatedInHost](self, "temporaryDirectoryWasCreatedInHost"))
  {
    v3 = self->_editedCopyURL;
  }
  else
  {
    -[FPSandboxingURLWrapper url](self->_editedCopyURLWrapper, "url");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSURL)containerURL
{
  NSURL *v3;

  if (-[QLPreviewItemEditedCopy temporaryDirectoryWasCreatedInHost](self, "temporaryDirectoryWasCreatedInHost"))
  {
    v3 = self->_hostTemporaryContainerURL;
  }
  else
  {
    -[FPSandboxingURLWrapper url](self->_directoryURLWrapper, "url");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)outputURLContentType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CD3308];
  -[QLPreviewItemEditedCopy url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UTIForURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID *uuid;
  NSURL *editedCopyURL;
  FPSandboxingURLWrapper *editedCopyURLWrapper;
  NSURL *hostTemporaryContainerURL;
  FPSandboxingURLWrapper *directoryURLWrapper;
  unint64_t version;
  id v11;

  v4 = a3;
  uuid = self->_uuid;
  v11 = v4;
  if (uuid)
  {
    objc_msgSend(v4, "encodeObject:forKey:", uuid, CFSTR("uuid"));
    v4 = v11;
  }
  editedCopyURL = self->_editedCopyURL;
  if (editedCopyURL)
  {
    objc_msgSend(v11, "encodeObject:forKey:", editedCopyURL, CFSTR("editedCopyURL"));
    v4 = v11;
  }
  editedCopyURLWrapper = self->_editedCopyURLWrapper;
  if (editedCopyURLWrapper)
  {
    objc_msgSend(v11, "encodeObject:forKey:", editedCopyURLWrapper, CFSTR("editedCopyURLWrapper"));
    v4 = v11;
  }
  hostTemporaryContainerURL = self->_hostTemporaryContainerURL;
  if (hostTemporaryContainerURL)
  {
    objc_msgSend(v11, "encodeObject:forKey:", hostTemporaryContainerURL, CFSTR("hostTemporaryContainerURL"));
    v4 = v11;
  }
  directoryURLWrapper = self->_directoryURLWrapper;
  if (directoryURLWrapper)
  {
    objc_msgSend(v11, "encodeObject:forKey:", directoryURLWrapper, CFSTR("directoryURLWrapper"));
    v4 = v11;
  }
  version = self->_version;
  if (version)
  {
    objc_msgSend(v11, "encodeInteger:forKey:", version, CFSTR("version"));
    v4 = v11;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_temporaryDirectoryWasCreatedInHost, CFSTR("temporaryDirectoryWasCreatedInHost"));

}

- (QLPreviewItemEditedCopy)initWithCoder:(id)a3
{
  id v4;
  QLPreviewItemEditedCopy *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSURL *editedCopyURL;
  uint64_t v10;
  FPSandboxingURLWrapper *editedCopyURLWrapper;
  uint64_t v12;
  NSURL *hostTemporaryContainerURL;
  uint64_t v14;
  FPSandboxingURLWrapper *directoryURLWrapper;
  QLPreviewItemEditedCopy *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)QLPreviewItemEditedCopy;
  v5 = -[QLPreviewItemEditedCopy init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editedCopyURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    editedCopyURL = v5->_editedCopyURL;
    v5->_editedCopyURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editedCopyURLWrapper"));
    v10 = objc_claimAutoreleasedReturnValue();
    editedCopyURLWrapper = v5->_editedCopyURLWrapper;
    v5->_editedCopyURLWrapper = (FPSandboxingURLWrapper *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostTemporaryContainerURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    hostTemporaryContainerURL = v5->_hostTemporaryContainerURL;
    v5->_hostTemporaryContainerURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("directoryURLWrapper"));
    v14 = objc_claimAutoreleasedReturnValue();
    directoryURLWrapper = v5->_directoryURLWrapper;
    v5->_directoryURLWrapper = (FPSandboxingURLWrapper *)v14;

    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v5->_temporaryDirectoryWasCreatedInHost = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("temporaryDirectoryWasCreatedInHost"));
    v16 = v5;
  }

  return v5;
}

- (BOOL)temporaryDirectoryWasCreatedInHost
{
  return self->_temporaryDirectoryWasCreatedInHost;
}

- (void)setTemporaryDirectoryWasCreatedInHost:(BOOL)a3
{
  self->_temporaryDirectoryWasCreatedInHost = a3;
}

- (FPSandboxingURLWrapper)editedCopyURLWrapper
{
  return self->_editedCopyURLWrapper;
}

- (void)setEditedCopyURLWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_editedCopyURLWrapper, a3);
}

- (FPSandboxingURLWrapper)directoryURLWrapper
{
  return self->_directoryURLWrapper;
}

- (void)setDirectoryURLWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_directoryURLWrapper, a3);
}

- (NSURL)editedCopyURL
{
  return self->_editedCopyURL;
}

- (void)setEditedCopyURL:(id)a3
{
  objc_storeStrong((id *)&self->_editedCopyURL, a3);
}

- (NSURL)hostTemporaryContainerURL
{
  return self->_hostTemporaryContainerURL;
}

- (void)setHostTemporaryContainerURL:(id)a3
{
  objc_storeStrong((id *)&self->_hostTemporaryContainerURL, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_hostTemporaryContainerURL, 0);
  objc_storeStrong((id *)&self->_editedCopyURL, 0);
  objc_storeStrong((id *)&self->_directoryURLWrapper, 0);
  objc_storeStrong((id *)&self->_editedCopyURLWrapper, 0);
}

@end
