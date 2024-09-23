@implementation PUImportPPTDriver

- (PUImportPPTDriver)init
{
  PUImportPPTDriver *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *extraResults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUImportPPTDriver;
  v2 = -[PUImportPPTDriver init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    extraResults = v2->_extraResults;
    v2->_extraResults = v3;

  }
  return v2;
}

- (NSDictionary)additionalResults
{
  return (NSDictionary *)self->_extraResults;
}

- (void)ppt_insertImportDataSourceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  double v7;
  void *v8;
  id insertDatasourceReply;
  void *v10;
  int v11;
  void *v12;
  PUImportPPTImportSource *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  double v59;
  PUImportPPTDriver *v60;
  SEL v61;
  id v62;
  id v63;
  id v64;

  v64 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_startTime = v7;
  v8 = _Block_copy(v6);
  insertDatasourceReply = self->_insertDatasourceReply;
  self->_insertDatasourceReply = v8;

  -[PUImportPPTDriver setOptions:](self, "setOptions:", v64);
  -[PUImportPPTDriver _removeCurrentImportSourceIfNecessary](self, "_removeCurrentImportSourceIfNecessary");
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("simulateSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "importMediaURLs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "count"))
      goto LABEL_5;
    v13 = -[PHImportUrlSource initWithUrls:]([PUImportPPTImportSource alloc], "initWithUrls:", v12);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD15B8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "importController:addedImportSource:", v15, v13);

    objc_msgSend(MEMORY[0x1E0D7B540], "sharedController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD15B8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "importController:addedImportSource:", v17, v13);

    objc_storeWeak((id *)&self->_currentImportSource, v13);
    -[PUImportPPTDriver importController](self, "importController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_importController, v18);

    WeakRetained = objc_loadWeakRetained((id *)&self->_importController);
    if (WeakRetained)
    {

LABEL_5:
      -[PUImportPPTDriver importViewController](self, "importViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "importDataSourceManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_dataSourceManager, v21);

      v22 = objc_loadWeakRetained((id *)&self->_importController);
      if (!v22)
        goto LABEL_15;
      v23 = objc_loadWeakRetained((id *)&self->_dataSourceManager);

      if (v23)
      {
        v24 = objc_loadWeakRetained((id *)&self->_importController);
        self->_loadingContentStarted = objc_msgSend(v24, "isLoadingContent");

        v25 = objc_loadWeakRetained((id *)&self->_importController);
        objc_msgSend(v25, "registerChangeObserver:context:", self, PXImportControllerObserverContext_38603);

        v26 = objc_loadWeakRetained((id *)&self->_dataSourceManager);
        objc_msgSend(v26, "registerChangeObserver:context:", self, PXImportAssetsDataSourceManagerObserverContext_38604);

        v27 = objc_loadWeakRetained((id *)&self->_mediaProvider);
        if (!v27)
        {
          -[PUImportPPTDriver mediaProvider](self, "mediaProvider");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeWeak((id *)&self->_mediaProvider, v28);

          v29 = objc_loadWeakRetained((id *)&self->_mediaProvider);
          if (!v29)
          {
LABEL_34:
            _PFAssertFailHandler();
            goto LABEL_35;
          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObserver:selector:name:object:", self, sel_ppt_mediaProviderDidProcessAsset_, *MEMORY[0x1E0D7C438], 0);

        }
        -[PUImportPPTDriver options](self, "options");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverNavigateToImportTabKey"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "BOOLValue");

        if (!v33)
        {
LABEL_13:
          -[PUImportPPTDriver options](self, "options");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverReplyWhenMediaProviderReadyKey"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "BOOLValue");

          if (!v38)
          {
LABEL_16:

LABEL_28:
            return;
          }
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          self->_endTime = v39;
LABEL_15:
          -[PUImportPPTDriver signalInsertDatasourceReply:](self, "signalInsertDatasourceReply:", v22 != 0);
          goto LABEL_16;
        }
        -[PUImportPPTDriver tabbedLibraryViewController](self, "tabbedLibraryViewController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          -[PUImportPPTDriver tabbedLibraryViewController](self, "tabbedLibraryViewController");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "navigateToContentMode:animated:completion:", 6, 0, &__block_literal_global_38629);

          goto LABEL_13;
        }
        goto LABEL_32;
      }
LABEL_31:
      _PFAssertFailHandler();
LABEL_32:
      _PFAssertFailHandler();
      goto LABEL_33;
    }
LABEL_30:
    _PFAssertFailHandler();
    goto LABEL_31;
  }
  -[PUImportPPTDriver importViewController](self, "importViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "importDataSourceManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_dataSourceManager, v40);

  -[PUImportPPTDriver importController](self, "importController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_importController, v41);

  v42 = objc_loadWeakRetained((id *)&self->_dataSourceManager);
  if (!v42)
  {
    _PFAssertFailHandler();
    goto LABEL_30;
  }
  v43 = objc_loadWeakRetained((id *)&self->_importController);

  if (!v43)
  {
LABEL_27:
    -[PUImportPPTDriver signalInsertDatasourceReply:](self, "signalInsertDatasourceReply:", v43 != 0);
    goto LABEL_28;
  }
  v44 = objc_loadWeakRetained((id *)&self->_importController);
  self->_loadingContentStarted = objc_msgSend(v44, "isLoadingContent");

  v45 = objc_loadWeakRetained((id *)&self->_importController);
  objc_msgSend(v45, "registerChangeObserver:context:", self, PXImportControllerObserverContext_38603);

  v46 = objc_loadWeakRetained((id *)&self->_dataSourceManager);
  objc_msgSend(v46, "registerChangeObserver:context:", self, PXImportAssetsDataSourceManagerObserverContext_38604);

  v47 = objc_loadWeakRetained((id *)&self->_mediaProvider);
  if (v47)
  {
LABEL_22:
    -[PUImportPPTDriver options](self, "options");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverNavigateToImportTabKey"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "BOOLValue");

    if (v53)
    {
      -[PUImportPPTDriver tabbedLibraryViewController](self, "tabbedLibraryViewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v54)
      {
LABEL_33:
        _PFAssertFailHandler();
        goto LABEL_34;
      }
      -[PUImportPPTDriver tabbedLibraryViewController](self, "tabbedLibraryViewController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "navigateToContentMode:animated:completion:", 6, 0, &__block_literal_global_72);

    }
    -[PUImportPPTDriver options](self, "options");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverReplyWhenMediaProviderReadyKey"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "BOOLValue");

    if (!v58)
      goto LABEL_28;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_endTime = v59;
    goto LABEL_27;
  }
  -[PUImportPPTDriver mediaProvider](self, "mediaProvider");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_mediaProvider, v48);

  v49 = objc_loadWeakRetained((id *)&self->_mediaProvider);
  if (v49)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObserver:selector:name:object:", self, sel_ppt_mediaProviderDidProcessAsset_, *MEMORY[0x1E0D7C438], 0);

    goto LABEL_22;
  }
LABEL_35:
  v60 = (PUImportPPTDriver *)_PFAssertFailHandler();
  -[PUImportPPTDriver ppt_removeImportDataSourceWithOptions:completionHandler:](v60, v61, v62, v63);
}

- (void)ppt_removeImportDataSourceWithOptions:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PUImportPPTDriver _removeCurrentImportSourceIfNecessary](self, "_removeCurrentImportSourceIfNecessary");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    v5 = v6;
  }

}

- (void)_removeCurrentImportSourceIfNecessary
{
  PXImportController **p_importController;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  PUImportPPTImportSource **p_currentImportSource;
  id v11;
  void *v12;
  id v13;
  id v14;

  p_importController = &self->_importController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_importController);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_importController);
    objc_msgSend(v5, "unregisterChangeObserver:context:", self, PXImportControllerObserverContext_38603);

    objc_storeWeak((id *)p_importController, 0);
    self->_loadingContentStarted = 0;
  }
  v6 = objc_loadWeakRetained((id *)&self->_dataSourceManager);

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_dataSourceManager);
    objc_msgSend(v7, "unregisterChangeObserver:context:", self, PXImportAssetsDataSourceManagerObserverContext_38604);

    objc_storeWeak((id *)&self->_dataSourceManager, 0);
  }
  v8 = objc_loadWeakRetained((id *)&self->_mediaProvider);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0D7C438], 0);

    objc_storeWeak((id *)&self->_mediaProvider, 0);
  }
  p_currentImportSource = &self->_currentImportSource;
  v11 = objc_loadWeakRetained((id *)p_currentImportSource);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD15B8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)p_currentImportSource);
    objc_msgSend(v14, "importController:removedImportSource:", v12, v13);

    objc_storeWeak((id *)p_currentImportSource, 0);
  }
}

- (void)ppt_performDeleteWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  double v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  PUImportPPTDriver *v15;
  SEL v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  PUImportPPTDriver *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_importController);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_dataSourceManager);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      self->_startTime = v10;
      -[PUImportPPTDriver modelBatchesForOptions:](self, "modelBatchesForOptions:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke;
      block[3] = &unk_1E58ABAF0;
      v20 = v11;
      v21 = self;
      v22 = v7;
      v13 = v7;
      v14 = v11;
      dispatch_async(v12, block);

      return;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v15 = (PUImportPPTDriver *)_PFAssertFailHandler();
  -[PUImportPPTDriver ppt_performThumbnailWithOptions:completionHandler:](v15, v16, v17, v18);
}

- (void)ppt_performThumbnailWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  id thumbnailTestReply;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  PUImportPPTDriver *v17;
  SEL v18;
  id v19;
  id v20;
  id v21;

  v21 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_importController);

  if (!WeakRetained)
  {
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  v8 = objc_loadWeakRetained((id *)&self->_dataSourceManager);

  if (!v8)
  {
LABEL_10:
    _PFAssertFailHandler();
    goto LABEL_11;
  }
  v9 = objc_loadWeakRetained((id *)&self->_mediaProvider);

  if (!v9)
  {
LABEL_11:
    v17 = (PUImportPPTDriver *)_PFAssertFailHandler();
    -[PUImportPPTDriver ppt_performImportToLibraryWithOptions:completionHandler:](v17, v18, v19, v20);
    return;
  }
  v10 = _Block_copy(v6);
  thumbnailTestReply = self->_thumbnailTestReply;
  self->_thumbnailTestReply = v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_startTime = v12;
  -[PUImportPPTDriver options](self, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverThumbnailToFirstKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
  {
    -[NSMutableDictionary allValues](self->_extraResults, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 >= 2)
      -[PUImportPPTDriver signalThumbnailTestReply:](self, "signalThumbnailTestReply:", 1);
  }
  else
  {

  }
}

- (void)ppt_performImportToLibraryWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id importToLibraryTestReply;
  void *v9;
  void *v10;
  PUImportActionCoordinator *v11;
  void *v12;
  void *v13;
  PUImportActionCoordinator *v14;
  PUImportActionCoordinator *actionCoordinator;
  NSObject *v16;
  id v17;
  _QWORD block[5];
  id v19;
  char v20;

  v6 = a3;
  v7 = _Block_copy(a4);
  importToLibraryTestReply = self->_importToLibraryTestReply;
  self->_importToLibraryTestReply = v7;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverAllModelKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "BOOLValue");

  -[PUImportPPTDriver modelBatchesForOptions:](self, "modelBatchesForOptions:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PUImportActionCoordinator alloc];
  -[PUImportPPTDriver importViewController](self, "importViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportPPTDriver importController](self, "importController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PUImportActionCoordinator initWithViewController:importController:loggingSource:](v11, "initWithViewController:importController:loggingSource:", v12, v13, 0);
  actionCoordinator = self->_actionCoordinator;
  self->_actionCoordinator = v14;

  -[PUImportActionCoordinator setPresentsAdditionalDeleteAllConfirmation:](self->_actionCoordinator, "setPresentsAdditionalDeleteAllConfirmation:", 0);
  -[PUImportActionCoordinator setPpt_alwaysImportDuplicatesNoPrompt:](self->_actionCoordinator, "setPpt_alwaysImportDuplicatesNoPrompt:", 1);
  -[PUImportActionCoordinator setDelegate:](self->_actionCoordinator, "setDelegate:", self);
  dispatch_get_global_queue(-2, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E58AA878;
  v20 = (char)a4;
  block[4] = self;
  v19 = v10;
  v17 = v10;
  dispatch_async(v16, block);

}

- (id)importViewController
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  -[PUImportPPTDriver importViewControllerProvider](self, "importViewControllerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentImportSource);
  objc_msgSend(v3, "importViewControllerForImportSource:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)importController
{
  void *v2;
  void *v3;

  -[PUImportPPTDriver importViewController](self, "importViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mediaProvider
{
  void *v2;
  void *v3;

  -[PUImportPPTDriver importController](self, "importController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importMediaProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelBatchesForOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverAllModelKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverBatchCountKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = (void *)objc_opt_new();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceManager);
  objc_msgSend(WeakRetained, "unfilteredDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13 = v12;
  }
  else
  {
    v14 = objc_msgSend(v12, "count");
    if (v8 >= v14)
    {
      v17 = 0;
      v15 = 0;
    }
    else
    {
      v15 = 0;
      v16 = 0;
      do
      {
        objc_msgSend(v12, "subarrayWithRange:", v15, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObject:", v17);
        v15 += v8;
        v16 = v17;
      }
      while (v8 + v15 < v14);
    }
    objc_msgSend(v12, "subarrayWithRange:", v15, v14 - v15);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "addObject:", v13);

  return v9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  int v13;

  v6 = a4;
  -[PUImportPPTDriver options](self, "options", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverReplyWhenAnyContentIsReadyKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((void *)PXImportControllerObserverContext_38603 == a5)
  {
    if ((v6 & 1) != 0)
    {
      -[PUImportPPTDriver importController](self, "importController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isLoadingContent");

      if (v13)
        self->_loadingContentStarted = 1;
    }
  }
  else if ((v6 & 1) != 0 && (void *)PXImportAssetsDataSourceManagerObserverContext_38604 == a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_endTime = v11;
    if (v10)
      -[PUImportPPTDriver _updateLoadingContentState](self, "_updateLoadingContentState");
    else
      px_dispatch_on_main_queue_sync();
  }
}

- (void)_updateLoadingContentState
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  id v17;

  -[PUImportPPTDriver options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverReplyWhenAllContentIsReadyKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[PUImportPPTDriver options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverReplyWhenAnyContentIsReadyKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[PUImportPPTDriver options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverReplyWhenMediaProviderReadyKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceManager);
  objc_msgSend(WeakRetained, "dataSource");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v17, "numberOfItems");
  self->_loadingContentStarted = v13 != 0;
  if (v13)
  {
    -[PUImportPPTDriver importController](self, "importController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isLoadingContent");

    if ((v15 | v11 | v5 ^ 1) != 1)
      goto LABEL_6;
    v16 = v8 ^ 1;
    if (!self->_loadingContentStarted)
      v16 = 1;
    if (((v16 | v11) & 1) == 0)
LABEL_6:
      -[PUImportPPTDriver signalInsertDatasourceReply:](self, "signalInsertDatasourceReply:", 1);
  }

}

- (double)_contentLoadingCheckInterval
{
  void *v2;
  void *v3;
  int v4;
  double result;

  -[PUImportPPTDriver options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverReplyWhenAllContentIsReadyKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  result = 0.1;
  if (v4)
    return 15.0;
  return result;
}

- (void)signalInsertDatasourceReply:(BOOL)a3
{
  void *v5;
  void *v6;
  id insertDatasourceReply;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;
  dispatch_time_t v12;
  id v13;
  _QWORD block[5];
  id v15;
  BOOL v16;

  if (self->_insertDatasourceReply)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endTime - self->_startTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extraResults, "setObject:forKeyedSubscript:", v5, CFSTR("Import source content load time"));

    v6 = (void *)objc_msgSend(self->_insertDatasourceReply, "copy");
    insertDatasourceReply = self->_insertDatasourceReply;
    self->_insertDatasourceReply = 0;

    -[PUImportPPTDriver options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverReplyWhenMediaProviderReadyKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
      v11 = 1000000000;
    else
      v11 = 100000001;
    v12 = dispatch_time(0, v11);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PUImportPPTDriver_signalInsertDatasourceReply___block_invoke;
    block[3] = &unk_1E58A8FD8;
    block[4] = self;
    v15 = v6;
    v16 = a3;
    v13 = v6;
    dispatch_after(v12, MEMORY[0x1E0C80D38], block);

  }
}

- (void)signalThumbnailTestReply:(BOOL)a3
{
  if (self->_thumbnailTestReply)
    px_dispatch_on_main_queue_sync();
}

- (void)signalImportToLibraryTestReply:(BOOL)a3
{
  if (self->_importToLibraryTestReply)
    px_dispatch_on_main_queue_sync();
}

- (void)ppt_mediaProviderDidProcessAsset:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double startTime;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  PUImportPPTDriver *v21;
  void *v22;
  NSMutableDictionary *extraResults;
  void *v24;
  void *v25;
  char v26;
  id v27;

  v27 = a3;
  objc_msgSend(v27, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  startTime = self->_startTime;
  -[PUImportPPTDriver options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverThumbnailToFirstKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  -[PUImportPPTDriver options](self, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverThumbnailToAllAbsoluteKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  -[PUImportPPTDriver options](self, "options");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverThumbnailToAllScreenKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLastDisplayItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLastAbsoluteItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (v20)
  {
    self->_hasSeenAbsolulteLastThumbnailMarker = 1;
    objc_sync_enter(self);
  }
  else
  {
    v21 = self;
    objc_sync_enter(v21);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    extraResults = v21->_extraResults;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filename"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](extraResults, "setObject:forKeyedSubscript:", v22, v24);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 - startTime);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21->_extraResults, "setObject:forKeyedSubscript:", v25, CFSTR("Image Processing Duration"));

  }
  objc_sync_exit(self);

  if (v13)
  {
    if (self->_hasSeenAbsolulteLastThumbnailMarker)
      v26 = 1;
    else
      v26 = v10;
    if ((v26 & 1) != 0 || (v16 & v18 & 1) != 0)
      goto LABEL_12;
  }
  else if ((v10 | v16 & v18) == 1)
  {
LABEL_12:
    -[PUImportPPTDriver signalThumbnailTestReply:](self, "signalThumbnailTestReply:", 1);
  }

}

- (void)actionCoordinatorDidBeginImport:(id)a3
{
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", a3);
  self->_startTime = v4;
}

- (void)actionCoordinatorDidCancelImport:(id)a3
{
  NSObject *importSemaphore;

  importSemaphore = self->_importSemaphore;
  if (importSemaphore)
    dispatch_semaphore_signal(importSemaphore);
  -[PUImportPPTDriver signalImportToLibraryTestReply:](self, "signalImportToLibraryTestReply:", 0);
}

- (void)actionCoordinator:(id)a3 didCompleteWithImportSession:(id)a4 results:(id)a5
{
  id v8;
  id v9;
  NSObject *importSemaphore;
  double v11;
  double v12;
  double v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  importSemaphore = self->_importSemaphore;
  if (importSemaphore)
    dispatch_semaphore_signal(importSemaphore);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_endTime = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v13 = v12 - self->_startTime;
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = self->_iteration + 1;
  self->_iteration = v15;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Time to perform Import to Library %lu"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extraResults, "setObject:forKeyedSubscript:", v17, v16);

  if (self->_importComplete)
  {
    -[PUImportPPTDriver options](self, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PUImportPPTDriverBatchCountKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");

    if (v20 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extraResults, "setObject:forKeyedSubscript:", v21, CFSTR("Import batch size"));

    }
    -[PUImportPPTDriver signalImportToLibraryTestReply:](self, "signalImportToLibraryTestReply:", 1);
  }

}

- (id)importDestinationForActionCoordinator:(id)a3
{
  return 0;
}

- (PXImportViewControllerProvider)importViewControllerProvider
{
  return (PXImportViewControllerProvider *)objc_loadWeakRetained((id *)&self->_importViewControllerProvider);
}

- (void)setImportViewControllerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_importViewControllerProvider, a3);
}

- (PUTabbedLibraryViewController)tabbedLibraryViewController
{
  return (PUTabbedLibraryViewController *)objc_loadWeakRetained((id *)&self->_tabbedLibraryViewController);
}

- (void)setTabbedLibraryViewController:(id)a3
{
  objc_storeWeak((id *)&self->_tabbedLibraryViewController, a3);
}

- (NSDictionary)testOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTestOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_testOptions, 0);
  objc_destroyWeak((id *)&self->_tabbedLibraryViewController);
  objc_destroyWeak((id *)&self->_importViewControllerProvider);
  objc_storeStrong((id *)&self->_importSemaphore, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_destroyWeak((id *)&self->_mediaProvider);
  objc_destroyWeak((id *)&self->_currentImportSource);
  objc_destroyWeak((id *)&self->_importController);
  objc_destroyWeak((id *)&self->_dataSourceManager);
  objc_storeStrong((id *)&self->_extraResults, 0);
  objc_storeStrong(&self->_importToLibraryTestReply, 0);
  objc_storeStrong(&self->_thumbnailTestReply, 0);
  objc_storeStrong(&self->_insertDatasourceReply, 0);
}

void __52__PUImportPPTDriver_signalImportToLibraryTestReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

void __46__PUImportPPTDriver_signalThumbnailTestReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

uint64_t __49__PUImportPPTDriver_signalInsertDatasourceReply___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = v2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __50__PUImportPPTDriver_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__updateLoadingContentState, 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_contentLoadingCheckInterval");
  return objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel__updateLoadingContentState, 0);
}

void __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  dispatch_semaphore_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_2;
    block[3] = &unk_1E58ABD10;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v20;
      v6 = MEMORY[0x1E0C809B0];
      v7 = MEMORY[0x1E0C80D38];
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v5)
            objc_enumerationMutation(v2);
          v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
          v17[0] = v6;
          v17[1] = 3221225472;
          v17[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_3;
          v17[3] = &unk_1E58AB790;
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(void **)(a1 + 40);
          v17[4] = v9;
          v17[5] = v10;
          v18 = v11;
          dispatch_sync(v7, v17);
          v12 = dispatch_semaphore_create(0);
          v13 = *(_QWORD *)(a1 + 32);
          v14 = *(void **)(v13 + 80);
          *(_QWORD *)(v13 + 80) = v12;

          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 80), 0xFFFFFFFFFFFFFFFFLL);
          v15 = *(_QWORD *)(a1 + 32);
          v16 = *(void **)(v15 + 80);
          *(_QWORD *)(v15 + 80) = 0;

          ++v8;
        }
        while (v4 != v8);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v4);
    }

  }
}

uint64_t __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "ppt_beginImportFromBarButtonItem");
}

void __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  int8x16_t v11;
  id v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v13[0] = v4;
        v13[1] = 3221225472;
        v13[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_4;
        v13[3] = &unk_1E58A0708;
        v13[4] = *(_QWORD *)(a1 + 40);
        v13[5] = v8;
        objc_msgSend(v8, "performChanges:", v13);
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v9 = dispatch_time(0, 2000000000);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_5;
  block[3] = &unk_1E58AB790;
  v11 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v12 = *(id *)(a1 + 48);
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);

}

void __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "setSelectable:", 1);
  objc_msgSend(*(id *)(a1 + 32), "importController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectItem:", *(_QWORD *)(a1 + 40));

}

uint64_t __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = v2 == v3;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "ppt_beginImportFromBarButtonItem");
}

void __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  id obj;
  _QWORD block[6];
  NSObject *v14;
  id v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_semaphore_create(0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    v6 = MEMORY[0x1E0C80D38];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "lastObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8 == v9;

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke_2;
        block[3] = &unk_1E58A8788;
        block[4] = *(_QWORD *)(a1 + 40);
        block[5] = v8;
        v11 = v2;
        v14 = v11;
        v16 = v10;
        v15 = *(id *)(a1 + 48);
        dispatch_async(v6, block);
        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

void __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke_3;
  v5[3] = &unk_1E58A06E0;
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 64);
  v4 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  objc_msgSend(WeakRetained, "deleteItems:withCompletionHandler:", v3, v5);

}

void __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v3 = v2 - *(double *)(*(_QWORD *)(a1 + 40) + 104);
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("Delete all total time"));

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PUImportPPTDriver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_38652 != -1)
    dispatch_once(&sharedInstance_onceToken_38652, block);
  return (id)sharedInstance_sSharedInstance;
}

+ (NSArray)importMediaURLs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  NSArray *result;
  void *v17;
  uint64_t v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("/Developer/PhotosImport/DCIM"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom") == 1)
    v6 = CFSTR("/Library/Wallpaper/Stills/iPad");
  else
    v6 = CFSTR("/Library/Wallpaper/Stills/iPhone");
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v2, "fileExistsAtPath:", v8);

  v10 = v3;
  if (((v9 & 1) != 0
     || (objc_msgSend(v7, "path"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v2, "fileExistsAtPath:", v11),
         v11,
         v10 = v7,
         v12))
    && (v13 = v10) != 0)
  {
    v14 = v13;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    AddFileURLsFromDirectoryWithDepthToArray(v14, 2, v15);

    return (NSArray *)v15;
  }
  else
  {
    v17 = (void *)_PFAssertFailHandler();
    AddFileURLsFromDirectoryWithDepthToArray(v17, v18, v19);
  }
  return result;
}

void __35__PUImportPPTDriver_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

@end
