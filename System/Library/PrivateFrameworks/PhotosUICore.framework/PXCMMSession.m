@implementation PXCMMSession

- (PXCMMSession)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSession.m"), 23, CFSTR("%s is not available as initializer"), "-[PXCMMSession init]");

  abort();
}

- (PXCMMSession)initWithContext:(id)a3
{
  id v4;
  PXCMMSession *v5;
  uint64_t v6;
  PXAssetsDataSourceManager *dataSourceManager;
  uint64_t v8;
  PXUIMediaProvider *mediaProvider;
  uint64_t v10;
  NSDictionary *preparationOptionsPerAsset;
  uint64_t v12;
  PXPeopleSuggestionsDataSourceManager *peopleSuggestionsPreviewDataSourceManager;
  uint64_t v14;
  PXPeopleSuggestionsDataSourceManager *peopleSuggestionsDataSourceManager;
  void *v16;
  PXCMMViewModel *v17;
  PXCMMViewModel *viewModel;
  PXCMMViewModel *v19;
  id v20;
  id v21;
  uint64_t v22;
  PXCMMActionManager *actionManager;
  double v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PXCMMSession;
  v5 = -[PXCMMSession init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "dataSourceManager");
    v6 = objc_claimAutoreleasedReturnValue();
    dataSourceManager = v5->_dataSourceManager;
    v5->_dataSourceManager = (PXAssetsDataSourceManager *)v6;

    objc_msgSend(v4, "mediaProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    mediaProvider = v5->_mediaProvider;
    v5->_mediaProvider = (PXUIMediaProvider *)v8;

    v5->_activityType = objc_msgSend(v4, "activityType");
    v5->_sourceType = objc_msgSend(v4, "sourceType");
    v5->_hideActionMenu = objc_msgSend(v4, "hideActionMenu");
    objc_msgSend(v4, "assetPreparationOptions");
    v10 = objc_claimAutoreleasedReturnValue();
    preparationOptionsPerAsset = v5->_preparationOptionsPerAsset;
    v5->_preparationOptionsPerAsset = (NSDictionary *)v10;

    objc_msgSend(v4, "peopleSuggestionsPreviewDataSourceManager");
    v12 = objc_claimAutoreleasedReturnValue();
    peopleSuggestionsPreviewDataSourceManager = v5->_peopleSuggestionsPreviewDataSourceManager;
    v5->_peopleSuggestionsPreviewDataSourceManager = (PXPeopleSuggestionsDataSourceManager *)v12;

    objc_msgSend(v4, "peopleSuggestionsDataSourceManager");
    v14 = objc_claimAutoreleasedReturnValue();
    peopleSuggestionsDataSourceManager = v5->_peopleSuggestionsDataSourceManager;
    v5->_peopleSuggestionsDataSourceManager = (PXPeopleSuggestionsDataSourceManager *)v14;

    v16 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v5->_dataSourceManager);
    v17 = objc_alloc_init(PXCMMViewModel);
    viewModel = v5->_viewModel;
    v5->_viewModel = v17;

    v19 = v5->_viewModel;
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __32__PXCMMSession_initWithContext___block_invoke;
    v29 = &unk_1E5123280;
    v20 = v4;
    v30 = v20;
    v31 = v16;
    v21 = v16;
    -[PXCMMViewModel performChanges:](v19, "performChanges:", &v26);
    objc_msgSend(v20, "actionManager", v26, v27, v28, v29);
    v22 = objc_claimAutoreleasedReturnValue();
    actionManager = v5->_actionManager;
    v5->_actionManager = (PXCMMActionManager *)v22;

    objc_msgSend(v20, "ppt_delay");
    v5->_ppt_delay = v24;
    v5->_ppt_presentComposeRecipientView = objc_msgSend(v20, "ppt_presentComposeRecipientView");
    v5->_ppt_scrollComposeRecipientsView = objc_msgSend(v20, "ppt_scrollComposeRecipientsView");

  }
  return v5;
}

- (id)momentShareStatusPresentationWithPresentationStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  PXMomentShareStatusMock *v7;
  PXMomentShareStatusMock *v8;
  PXMomentShareStatusPresentation *v9;

  -[PXCMMSession momentShareStatus](self, "momentShareStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentShare");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PXMomentShareStatusMock shouldUseMockStatus](PXMomentShareStatusMock, "shouldUseMockStatus"))
  {
    v7 = -[PXMomentShareStatusMock initWithMomentShare:]([PXMomentShareStatusMock alloc], "initWithMomentShare:", v6);
  }
  else
  {
    -[PXCMMSession momentShareStatus](self, "momentShareStatus");
    v7 = (PXMomentShareStatusMock *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (v7)
    v9 = -[PXMomentShareStatusPresentation initWithMomentShareStatus:presentationStyle:]([PXMomentShareStatusPresentation alloc], "initWithMomentShareStatus:presentationStyle:", v7, a3);
  else
    v9 = 0;

  return v9;
}

- (NSSet)notificationSuppressionContexts
{
  return 0;
}

- (PXAssetImportStatusManager)importStatusManager
{
  return 0;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsPreviewDataSourceManager
{
  return self->_peopleSuggestionsPreviewDataSourceManager;
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager
{
  return self->_peopleSuggestionsDataSourceManager;
}

- (PXCMMActionManager)actionManager
{
  return self->_actionManager;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (BOOL)hideActionMenu
{
  return self->_hideActionMenu;
}

- (NSDictionary)preparationOptionsPerAsset
{
  return self->_preparationOptionsPerAsset;
}

- (PXCMMViewModel)viewModel
{
  return self->_viewModel;
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (PXMomentShareStatus)momentShareStatus
{
  return self->_momentShareStatus;
}

- (double)ppt_delay
{
  return self->_ppt_delay;
}

- (void)setPpt_delay:(double)a3
{
  self->_ppt_delay = a3;
}

- (BOOL)ppt_presentComposeRecipientView
{
  return self->_ppt_presentComposeRecipientView;
}

- (BOOL)ppt_scrollComposeRecipientsView
{
  return self->_ppt_scrollComposeRecipientsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShareStatus, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_preparationOptionsPerAsset, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsPreviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __32__PXCMMSession_initWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v13 = a2;
  objc_msgSend(v3, "originalTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOriginalTitle:", v4);

  objc_msgSend(*(id *)(a1 + 32), "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v5);

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSubtitle:", v6);

  objc_msgSend(*(id *)(a1 + 32), "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRecipients:", v7);

  objc_msgSend(*(id *)(a1 + 32), "originatorRecipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOriginatorRecipient:", v8);

  objc_msgSend(v13, "setNumberOfReceivedAssets:", objc_msgSend(*(id *)(a1 + 32), "numberOfReceivedAssets"));
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStartDate:", v9);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEndDate:", v10);

  objc_msgSend(v13, "setPhotosCount:", objc_msgSend(*(id *)(a1 + 32), "photosCount"));
  objc_msgSend(v13, "setVideosCount:", objc_msgSend(*(id *)(a1 + 32), "videosCount"));
  objc_msgSend(v13, "setTotalCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
  objc_msgSend(*(id *)(a1 + 32), "posterAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "posterMediaProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPosterAsset:posterMediaProvider:", v11, v12);

  objc_msgSend(v13, "setSelectionManager:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v13, "setSelectionEnabled:", 1);
  objc_msgSend(v13, "setOneUpDisabled:", objc_msgSend(*(id *)(a1 + 32), "disableOneUp"));

}

+ (PXCMMSession)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSession.m"), 27, CFSTR("%s is not available as initializer"), "+[PXCMMSession new]");

  abort();
}

- (NSDictionary)diagnosticDictionary
{
  unint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Activity Type");
  v3 = -[PXCMMSession activityType](self, "activityType");
  if (v3 - 1 > 3)
    v4 = CFSTR("PXCMMActivityTypeNone");
  else
    v4 = off_1E51422A0[v3 - 1];
  v9[0] = v4;
  v8[1] = CFSTR("Source Type");
  v5 = -[PXCMMSession sourceType](self, "sourceType");
  v6 = CFSTR("PXCMMSourceTypeMessages");
  if (!v5)
    v6 = CFSTR("PXCMMSourceTypePhotos");
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

@end
