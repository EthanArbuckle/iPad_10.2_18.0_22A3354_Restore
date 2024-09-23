@implementation PXPeopleCandidateWidget

- (PXPeopleCandidateWidget)init
{
  PXPeopleCandidateWidget *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *loadQueue;
  os_log_t v7;
  OS_os_log *log;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPeopleCandidateWidget;
  v2 = -[PXPeopleCandidateWidget init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("PXPeopleCandidateWidget-loadQueue", v4);
    loadQueue = v2->_loadQueue;
    v2->_loadQueue = (OS_dispatch_queue *)v5;

    v7 = os_log_create((const char *)*MEMORY[0x1E0D71100], "PeopleBanners");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

  }
  return v2;
}

- (void)loadContentData
{
  NSObject *log;
  void *v4;
  void *contentLoadGeneration;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10[2];
  id buf[2];

  if (-[PXPeopleCandidateWidget loadState](self, "loadState"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_1A6789000, log, OS_LOG_TYPE_ERROR, "loadContentData called multiple times for banner widget", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    -[PXPeopleCandidateWidget setLoadState:](self, "setLoadState:", 1);
    -[PXPeopleCandidateWidget context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerChangeObserver:context:", self, PXPeopleCandidateObservationContext);
    contentLoadGeneration = (void *)self->_contentLoadGeneration;
    if (-[PXPeopleCandidateWidget loadPeopleFromFirstAsset](self, "loadPeopleFromFirstAsset"))
    {
      objc_msgSend(v4, "firstAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(buf, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __42__PXPeopleCandidateWidget_loadContentData__block_invoke;
      v9[3] = &unk_1E5140E80;
      objc_copyWeak(v10, buf);
      v10[1] = contentLoadGeneration;
      -[PXPeopleCandidateWidget _requestPersonForAsset:withCompletion:](self, "_requestPersonForAsset:withCompletion:", v6, v9);
      objc_destroyWeak(v10);
      objc_destroyWeak(buf);

    }
    else
    {
      objc_msgSend(v4, "people");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPeopleCandidateWidget _loadBannerProviderWithPerson:generation:isAssetLoad:](self, "_loadBannerProviderWithPerson:generation:isAssetLoad:", v8, contentLoadGeneration, 0);
    }

  }
}

- (void)_loadBannerProviderWithPerson:(id)a3 generation:(int64_t)a4 isAssetLoad:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  PXPhotosGridPeopleBannerProvider *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17[2];
  id location;

  v5 = a5;
  v9 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCandidateWidget.m"), 109, CFSTR("%s must be called on the main thread"), "-[PXPeopleCandidateWidget _loadBannerProviderWithPerson:generation:isAssetLoad:]");

  }
  if (self->_contentLoadGeneration == a4)
  {
    if (v9)
    {
      if (v5)
      {
        -[PXPeopleCandidateWidget setSingleAssetPerson:](self, "setSingleAssetPerson:", v9);
        objc_msgSend(v9, "photoLibrary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "px_registerChangeObserver:", self);

      }
      v11 = -[PXPhotosGridPeopleBannerProvider initWithPerson:namingSuggestionsOnly:]([PXPhotosGridPeopleBannerProvider alloc], "initWithPerson:namingSuggestionsOnly:", v9, v5);
      -[PXPeopleCandidateWidget setBannerProvider:](self, "setBannerProvider:", v11);

      -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPresentationDelegate:", self);

      -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setInvalidationDelegate:", self);

      objc_initWeak(&location, self);
      -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __80__PXPeopleCandidateWidget__loadBannerProviderWithPerson_generation_isAssetLoad___block_invoke;
      v16[3] = &unk_1E5140EA8;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a4;
      objc_msgSend(v14, "loadBannerView:", v16);

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PXPeopleCandidateWidget _didLoadBannerView:forGeneration:](self, "_didLoadBannerView:forGeneration:", 0, a4);
    }
  }

}

- (void)_requestPersonForAsset:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *loadQueue;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    loadQueue = self->_loadQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PXPeopleCandidateWidget__requestPersonForAsset_withCompletion___block_invoke;
    v10[3] = &unk_1E5148CE0;
    v11 = v6;
    v12 = v8;
    dispatch_async(loadQueue, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)controllerTraitCollectionDidChangeFrom:(id)a3 to:(id)a4
{
  id v5;

  -[PXPeopleCandidateWidget widgetDelegate](self, "widgetDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetPreferredContentHeightForWidthDidChange:", self);

}

- (BOOL)hasContentForCurrentInput
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PXPeopleCandidateWidget context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "people");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = 1;
  else
    v5 = -[PXPeopleCandidateWidget loadPeopleFromFirstAsset](self, "loadPeopleFromFirstAsset");

  return v5;
}

- (void)unloadContentData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  self->_contentLoadGeneration = (self->_contentLoadGeneration + 1) % 1000;
  -[PXPeopleCandidateWidget context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:context:", self, PXPeopleCandidateObservationContext);

  -[PXPeopleCandidateWidget singleAssetPerson](self, "singleAssetPerson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_unregisterChangeObserver:", self);

  -[PXPeopleCandidateWidget setSingleAssetPerson:](self, "setSingleAssetPerson:", 0);
  -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPresentationDelegate:", 0);

  -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvalidationDelegate:", 0);

  -[PXPeopleCandidateWidget setBannerProvider:](self, "setBannerProvider:", 0);
  -[PXPeopleCandidateWidget setLoadState:](self, "setLoadState:", 0);
}

- (void)setLoadState:(int64_t)a3
{
  if (self->_loadState != a3)
  {
    self->_loadState = a3;
    if ((unint64_t)a3 <= 2)
      -[PXPeopleCandidateWidget setHasLoadedContentData:](self, "setHasLoadedContentData:", (a3 & 7) == 2);
  }
}

- (void)setHasLoadedContentData:(BOOL)a3
{
  id v4;

  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    -[PXPeopleCandidateWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetHasLoadedContentDataDidChange:", self);

  }
}

- (double)preferredContentHeightForWidth:(double)a3
{
  void *v5;
  char v6;
  double v7;
  void *v8;
  double v9;

  -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDismissed");

  v7 = 0.0;
  if ((v6 & 1) == 0)
  {
    -[PXPeopleCandidateWidget bannerView](self, "bannerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", a3, 0.0);
    v7 = v9;

  }
  return v7;
}

- (int64_t)contentLayoutStyle
{
  return 2;
}

- (BOOL)wantsNoSpaceAfterContentBottom
{
  return 1;
}

- (_PXPeopleCandidateWidgetContainerView)contentView
{
  _PXPeopleCandidateWidgetContainerView *contentView;
  _PXPeopleCandidateWidgetContainerView *v4;
  _PXPeopleCandidateWidgetContainerView *v5;
  _PXPeopleCandidateWidgetContainerView *v6;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = [_PXPeopleCandidateWidgetContainerView alloc];
    v5 = -[_PXPeopleCandidateWidgetContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_contentView;
    self->_contentView = v5;

    contentView = self->_contentView;
  }
  return contentView;
}

- (void)setSpec:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_spec, a3);
  v5 = a3;
  -[PXPeopleCandidateWidget bannerView](self, "bannerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSpec:", v5);

}

- (void)_didLoadBannerView:(id)a3 forGeneration:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PXPeopleCandidateWidget *v16;
  _QWORD v17[5];

  v7 = a3;
  if (self->_contentLoadGeneration == a4)
  {
    objc_storeStrong((id *)&self->_bannerView, a3);
    -[PXPeopleCandidateWidget contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContainedView:", v7);

    -[PXPeopleCandidateWidget spec](self, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSpec:", v9);

    if (-[PXPeopleCandidateWidget loadPeopleFromFirstAsset](self, "loadPeopleFromFirstAsset"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v10);

    }
    -[PXPeopleCandidateWidget bannerView](self, "bannerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.0);

    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__PXPeopleCandidateWidget__didLoadBannerView_forGeneration___block_invoke;
    v17[3] = &unk_1E5149198;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v17, 0.3);
    -[PXPeopleCandidateWidget widgetDelegate](self, "widgetDelegate");
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __60__PXPeopleCandidateWidget__didLoadBannerView_forGeneration___block_invoke_2;
    v14[3] = &unk_1E5148D08;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = self;
    v13 = v15;
    objc_msgSend(v13, "widget:animateChanges:withAnimationOptions:", self, v14, 0);
    -[PXPeopleCandidateWidget setLoadState:](self, "setLoadState:", 2);

  }
}

- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PXPeopleCandidateWidget *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v4 = a3;
  -[PXPeopleCandidateWidget bannerView](self, "bannerView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDismissed");

      if (v9)
      {
        -[PXPeopleCandidateWidget contentView](self, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setIsDisappearing:", 1);

        v11 = MEMORY[0x1E0C809B0];
        v16[4] = self;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke;
        v17[3] = &unk_1E5149198;
        v17[4] = self;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke_2;
        v16[3] = &unk_1E5147360;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v17, v16, 0.25);
        -[PXPeopleCandidateWidget widgetDelegate](self, "widgetDelegate");
        v13[0] = v11;
        v13[1] = 3221225472;
        v13[2] = __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke_3;
        v13[3] = &unk_1E5148D08;
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = self;
        v12 = v14;
        objc_msgSend(v12, "widget:animateChanges:withAnimationOptions:", self, v13, 0);

      }
    }
  }

}

- (id)presentationEnvironmentForPhotosBannerProvider:(id)a3
{
  void *v4;
  void *v5;

  -[PXPeopleCandidateWidget widgetDelegate](self, "widgetDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationEnvironmentForWidget:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v9 = a3;
  if ((void *)PXPeopleCandidateObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCandidateWidget.m"), 303, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 8) != 0)
  {
    v17 = v9;
    v11 = -[PXPeopleCandidateWidget loadPeopleFromFirstAsset](self, "loadPeopleFromFirstAsset");
    v10 = v17;
    if (!v11)
    {
      -[PXPeopleCandidateWidget context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "people");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPerson:", v14);

      v10 = v17;
    }
  }

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PXPeopleCandidateWidget singleAssetPerson](self, "singleAssetPerson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXPeopleCandidateWidget singleAssetPerson](self, "singleAssetPerson");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changeDetailsForObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAfterChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PXPeopleCandidateWidget setSingleAssetPerson:](self, "setSingleAssetPerson:", v7);
      -[PXPeopleCandidateWidget bannerProvider](self, "bannerProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPerson:", v7);

    }
  }

}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (BOOL)loadPeopleFromFirstAsset
{
  return self->_loadPeopleFromFirstAsset;
}

- (void)setLoadPeopleFromFirstAsset:(BOOL)a3
{
  self->_loadPeopleFromFirstAsset = a3;
}

- (PXPeopleSuggestionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (PXPhotosBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (PXPhotosGridPeopleBannerProvider)bannerProvider
{
  return self->_bannerProvider;
}

- (void)setBannerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bannerProvider, a3);
}

- (PHPerson)singleAssetPerson
{
  return self->_singleAssetPerson;
}

- (void)setSingleAssetPerson:(id)a3
{
  objc_storeStrong((id *)&self->_singleAssetPerson, a3);
}

- (int64_t)loadState
{
  return self->_loadState;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleAssetPerson, 0);
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_loadQueue, 0);
}

void __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "bannerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContainedView:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "setBannerView:", 0);
}

uint64_t __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widgetPreferredContentHeightForWidthDidChange:", *(_QWORD *)(a1 + 40));
}

void __60__PXPeopleCandidateWidget__didLoadBannerView_forGeneration___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "bannerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __60__PXPeopleCandidateWidget__didLoadBannerView_forGeneration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widgetPreferredContentHeightForWidthDidChange:", *(_QWORD *)(a1 + 40));
}

void __65__PXPeopleCandidateWidget__requestPersonForAsset_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  +[PXPeopleCandidateWidget _fetchPersonForAsset:](PXPeopleCandidateWidget, "_fetchPersonForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PXPeopleCandidateWidget__requestPersonForAsset_withCompletion___block_invoke_2;
  v5[3] = &unk_1E5148CE0;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __65__PXPeopleCandidateWidget__requestPersonForAsset_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__PXPeopleCandidateWidget__loadBannerProviderWithPerson_generation_isAssetLoad___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_didLoadBannerView:forGeneration:", v4, *(_QWORD *)(a1 + 40));

}

void __42__PXPeopleCandidateWidget_loadContentData__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_loadBannerProviderWithPerson:generation:isAssetLoad:", v4, *(_QWORD *)(a1 + 40), 1);

}

+ (id)_fetchPersonForAsset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD1570];
  v4 = a3;
  objc_msgSend(v3, "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonContext:", 4);
  v10[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(v5, "setIncludedDetectionTypes:", &unk_1E53EAAD0);
  objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(v5, "setFetchLimit:", 2);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAsset:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
