@implementation PXCMMFileBackedContext

- (PXCMMFileBackedContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5
{
  PXCMMFileBackedContext *v5;
  PXCMMFileBackedActionManager *v6;
  PXCMMFileBackedActionManager *fileBackedActionManager;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXCMMFileBackedContext;
  v5 = -[PXCMMContext initWithAssetsDataSourceManager:mediaProvider:activityType:](&v9, sel_initWithAssetsDataSourceManager_mediaProvider_activityType_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(PXCMMFileBackedActionManager);
    fileBackedActionManager = v5->_fileBackedActionManager;
    v5->_fileBackedActionManager = v6;

  }
  return v5;
}

- (id)actionManager
{
  return self->_fileBackedActionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileBackedActionManager, 0);
}

+ (id)fileBackedContextWithDirectoryURL:(id)a3 activityType:(unint64_t)a4 title:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  PXCMMFileBackedContext *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  PXFileBackedAssetsDataSourceManager *v34;
  PXFileBackedUIMediaProvider *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  NSObject *v51;
  id obj;
  NSObject *obja;
  uint64_t v54;
  _OWORD v55[2];
  _OWORD v56[2];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  unsigned __int8 v62;
  void *v63;
  void *v64;
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;
  __int16 v68;
  NSObject *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, &v62);
  v12 = v62;

  if (v11)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    PLSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v7;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "%@ does not exist or is not a directory", buf, 0xCu);
    }
    v15 = 0;
  }
  else
  {
    v61 = 0;
    objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, 0, 0, &v61);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v61;
    v14 = v17;
    if (v16)
    {
      v45 = a4;
      v47 = v17;
      v48 = v9;
      v49 = v8;
      v50 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v51 = objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v46 = v16;
      obj = v16;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v18)
      {
        v19 = v18;
        v54 = 0;
        v20 = 0;
        v21 = *(_QWORD *)v58;
        v22 = *MEMORY[0x1E0CEC520];
        v23 = *MEMORY[0x1E0CEC568];
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v58 != v21)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            v26 = (void *)MEMORY[0x1E0CEC3F8];
            objc_msgSend(v25, "pathExtension");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "typeWithFilenameExtension:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              v29 = objc_msgSend(v28, "conformsToType:", v22);
              v30 = objc_msgSend(v28, "conformsToType:", v23);
              v20 += v29;
              v54 += v30;
              if ((v29 & 1) != 0 || v30)
                -[NSObject addObject:](v51, "addObject:", v25);
            }

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        }
        while (v19);
      }
      else
      {
        v54 = 0;
        v20 = 0;
      }

      v31 = v51;
      if (-[NSObject count](v51, "count"))
      {
        v63 = &unk_1E53ECFC0;
        v32 = -[NSObject copy](v51, "copy");
        v64 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v33 = objc_claimAutoreleasedReturnValue();

        obja = v33;
        v34 = -[PXFileBackedAssetsDataSourceManager initWithFileURLsBySection:]([PXFileBackedAssetsDataSourceManager alloc], "initWithFileURLsBySection:", v33);
        v35 = objc_alloc_init(PXFileBackedUIMediaProvider);
        v15 = -[PXCMMFileBackedContext initWithAssetsDataSourceManager:mediaProvider:activityType:]([PXCMMFileBackedContext alloc], "initWithAssetsDataSourceManager:mediaProvider:activityType:", v34, v35, v45);
        -[PXSectionedDataSourceManager dataSource](v34, "dataSource");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v49;
        -[PXCMMContext setTitle:](v15, "setTitle:", v49);
        -[PXCMMContext setSubtitle:](v15, "setSubtitle:", &stru_1E5149688);
        objc_msgSend(v36, "startingAssetReference");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "asset");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCMMContext setPosterAsset:](v15, "setPosterAsset:", v38);

        -[PXCMMContext setPosterMediaProvider:](v15, "setPosterMediaProvider:", v35);
        v7 = v50;
        if (v36)
          objc_msgSend(v36, "firstItemIndexPath");
        else
          memset(v56, 0, sizeof(v56));
        objc_msgSend(v36, "assetAtItemIndexPath:", v56);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "creationDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCMMContext setStartDate:](v15, "setStartDate:", v41);

        if (v36)
          objc_msgSend(v36, "lastItemIndexPath");
        else
          memset(v55, 0, sizeof(v55));
        objc_msgSend(v36, "assetAtItemIndexPath:", v55);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "creationDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCMMContext setEndDate:](v15, "setEndDate:", v43);

        -[PXCMMContext setPhotosCount:](v15, "setPhotosCount:", v20);
        -[PXCMMContext setVideosCount:](v15, "setVideosCount:", v54);
        -[PXCMMContext setCount:](v15, "setCount:", -[NSObject count](v51, "count"));

        v14 = v47;
        v9 = v48;
        v16 = v46;
        v39 = obja;
      }
      else
      {
        PLSharingGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        v8 = v49;
        v7 = v50;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v50;
          _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_ERROR, "There are no recognized media files at %@", buf, 0xCu);
        }
        v15 = 0;
        v14 = v47;
        v9 = v48;
      }

    }
    else
    {
      PLSharingGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v7;
        v68 = 2112;
        v69 = v14;
        _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "Failed to get contents of directory %@: %@", buf, 0x16u);
      }
      v15 = 0;
    }

  }
  return v15;
}

@end
