@implementation PXSAInboxDataSourceManager

- (PXSAInboxDataSourceManager)init
{
  PXSAInboxDataSourceManager *v2;
  void *v3;
  void *v4;
  PXFeedSectionInfosManager *v5;
  id v6;
  uint64_t v7;
  PXFeedSectionInfosManager *feedSectionInfosManager;
  PXSAInboxTitleProvider *v9;
  PXSAInboxTitleProvider *sharedAlbumTitleProvider;
  PXSAInboxDetailViewControllerProvider *v11;
  PXSAInboxDetailViewControllerProvider *sharedAlbumDetailViewControllerProvider;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXSAInboxDataSourceManager;
  v2 = -[PXSectionedDataSourceManager init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1209600.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [PXFeedSectionInfosManager alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __34__PXSAInboxDataSourceManager_init__block_invoke;
    v14[3] = &unk_1E5142C38;
    v15 = v4;
    v6 = v4;
    v7 = -[PXFeedSectionInfosManager initWithPhotoLibrary:configurationBlock:](v5, "initWithPhotoLibrary:configurationBlock:", v3, v14);
    feedSectionInfosManager = v2->_feedSectionInfosManager;
    v2->_feedSectionInfosManager = (PXFeedSectionInfosManager *)v7;

    v9 = objc_alloc_init(PXSAInboxTitleProvider);
    sharedAlbumTitleProvider = v2->_sharedAlbumTitleProvider;
    v2->_sharedAlbumTitleProvider = v9;

    v11 = objc_alloc_init(PXSAInboxDetailViewControllerProvider);
    sharedAlbumDetailViewControllerProvider = v2->_sharedAlbumDetailViewControllerProvider;
    v2->_sharedAlbumDetailViewControllerProvider = v11;

  }
  return v2;
}

- (id)createInitialDataSource
{
  void *v3;
  void *v4;

  -[PXSAInboxDataSourceManager _dataSourceSnapshot](self, "_dataSourceSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSAInboxDataSourceManager feedSectionInfosManager](self, "feedSectionInfosManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  return v3;
}

- (void)_updateDataSource
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSAInboxDataSourceManager _dataSourceSnapshot](self, "_dataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)off_1E50B4A18);
  v7 = objc_msgSend(v3, "identifier");
  v8 = objc_msgSend(v4, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &unk_1E53EF5E8;
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v7, v8, v9, v10, 0);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v4, v11);
}

- (id)_dataSourceSnapshot
{
  void *v2;
  PXSAInboxDataSource *v3;

  -[PXSAInboxDataSourceManager _sectionInfosForDataSource](self, "_sectionInfosForDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PXInboxModelDataSource initWithModels:]([PXSAInboxDataSource alloc], "initWithModels:", v2);

  return v3;
}

- (id)_sectionInfosForDataSource
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[PXSAInboxDataSourceManager feedSectionInfosManager](self, "feedSectionInfosManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(v3, "photoLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "sharedStreamsEnabledForPhotoLibraryURL:", v5);

  if ((_DWORD)v4)
  {
    v6 = objc_msgSend(v2, "numberOfSectionInfos");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v6);
    objc_msgSend(v2, "loadSectionInfosAtIndexes:", v7);
    objc_msgSend(v2, "sectionInfosAtIndexes:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (int)requestImageForPreviewItem:(id)a3 targetSize:(CGSize)a4 resultHandler:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (objc_class *)MEMORY[0x1E0CD15A8];
    v11 = v8;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v12, "setDeliveryMode:", 0);
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __82__PXSAInboxDataSourceManager_requestImageForPreviewItem_targetSize_resultHandler___block_invoke;
    v18[3] = &unk_1E5147AB8;
    v19 = v9;
    v14 = objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 1, v12, v18, width, height);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v9)
        (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
    }
    else
    {
      PLUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "Invalid preview item type passed to media provider", v17, 2u);
      }

    }
    v14 = 0;
  }

  return v14;
}

- (PXFeedSectionInfosManager)feedSectionInfosManager
{
  return self->_feedSectionInfosManager;
}

- (void)setFeedSectionInfosManager:(id)a3
{
  objc_storeStrong((id *)&self->_feedSectionInfosManager, a3);
}

- (PXSAInboxTitleProvider)sharedAlbumTitleProvider
{
  return self->_sharedAlbumTitleProvider;
}

- (void)setSharedAlbumTitleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAlbumTitleProvider, a3);
}

- (PXSAInboxDetailViewControllerProvider)sharedAlbumDetailViewControllerProvider
{
  return self->_sharedAlbumDetailViewControllerProvider;
}

- (void)setSharedAlbumDetailViewControllerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAlbumDetailViewControllerProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAlbumDetailViewControllerProvider, 0);
  objc_storeStrong((id *)&self->_sharedAlbumTitleProvider, 0);
  objc_storeStrong((id *)&self->_feedSectionInfosManager, 0);
}

void __82__PXSAInboxDataSourceManager_requestImageForPreviewItem_targetSize_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = *MEMORY[0x1E0CD1BE8];
    v6 = a2;
    objc_msgSend(a3, "objectForKeyedSubscript:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v7);

  }
}

void __34__PXSAInboxDataSourceManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setEntryFilter:", 4);
  objc_msgSend(v3, "setEarliestDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setFetchLimit:", 21);

}

@end
