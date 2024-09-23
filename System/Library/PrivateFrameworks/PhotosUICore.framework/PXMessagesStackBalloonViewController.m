@implementation PXMessagesStackBalloonViewController

- (PXMessagesStackBalloonViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4
{
  id v7;
  id v8;
  PXMessagesStackBalloonViewController *v9;
  PXMessagesStackBalloonViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXMessagesStackBalloonViewController;
  v9 = -[PXMessagesStackBalloonViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSourceManager, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
  }

  return v10;
}

- (PXMessagesStackBalloonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackBalloonViewController.m"), 45, CFSTR("%s is not available as initializer"), "-[PXMessagesStackBalloonViewController initWithNibName:bundle:]");

  abort();
}

- (PXMessagesStackBalloonViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackBalloonViewController.m"), 49, CFSTR("%s is not available as initializer"), "-[PXMessagesStackBalloonViewController initWithCoder:]");

  abort();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PXMessagesStackView *v5;
  PXMessagesStackView *v6;
  PXMessagesStackView *stackView;
  void *v8;
  void *v9;
  PXMessagesDebugTapbackStatusManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;
  _QWORD v47[8];

  v47[6] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)PXMessagesStackBalloonViewController;
  -[PXMessagesStackBalloonViewController viewDidLoad](&v46, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMessagesStackBalloonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [PXMessagesStackView alloc];
  v6 = -[PXMessagesStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stackView = self->_stackView;
  self->_stackView = v6;

  -[PXMessagesStackBalloonViewController mediaProvider](self, "mediaProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMessagesStackView setMediaProvider:](self->_stackView, "setMediaProvider:", v8);

  -[PXMessagesStackView setAllowPlayableContentLoading:](self->_stackView, "setAllowPlayableContentLoading:", 1);
  +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "enableDebugTapbacksStack") & 1) != 0)
  {
    v10 = objc_alloc_init(PXMessagesDebugTapbackStatusManager);
    -[PXMessagesStackView setTapbackStatusManager:](self->_stackView, "setTapbackStatusManager:", v10);

  }
  else
  {
    -[PXMessagesStackView setTapbackStatusManager:](self->_stackView, "setTapbackStatusManager:", 0);
  }

  self->_allowAutoplay = 1;
  -[PXMessagesStackBalloonViewController dataSourceManager](self, "dataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBaseMessagesStackView setDataSourceManager:](self->_stackView, "setDataSourceManager:", v11);

  +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "verticalContentInsets");
  -[PXBaseMessagesStackView setVerticalContentInsets:](self->_stackView, "setVerticalContentInsets:");

  -[PXMessagesStackView setDelegate:](self->_stackView, "setDelegate:", self);
  -[PXMessagesStackBalloonViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_stackView);

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E0DC3428];
  v15 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke;
  v43[3] = &unk_1E5147F40;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", CFSTR("Scroll"), 0, 0, v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3428];
  v41[0] = v15;
  v41[1] = 3221225472;
  v41[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_2;
  v41[3] = &unk_1E5147F40;
  objc_copyWeak(&v42, &location);
  objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", CFSTR("Reuse Test"), 0, 0, v41);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3428];
  v39[0] = v15;
  v39[1] = 3221225472;
  v39[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_3;
  v39[3] = &unk_1E5147F40;
  objc_copyWeak(&v40, &location);
  objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", CFSTR("Toggle Playable Loading"), 0, 0, v39);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0DC3428];
  v37[0] = v15;
  v37[1] = 3221225472;
  v37[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_4;
  v37[3] = &unk_1E5147F40;
  objc_copyWeak(&v38, &location);
  objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", CFSTR("Toggle autoplay"), 0, 0, v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DC3428];
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_5;
  v35[3] = &unk_1E5147F40;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", CFSTR("Toggle Snapshot"), 0, 0, v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0DC3428];
  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_6;
  v33[3] = &unk_1E5147F40;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", CFSTR("Toggle +N"), 0, 0, v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v26 = (void *)MEMORY[0x1E0DC39D0];
  v47[0] = v32;
  v47[1] = v31;
  v47[2] = v18;
  v47[3] = v20;
  v47[4] = v22;
  v47[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "menuWithChildren:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v25, "initWithTitle:menu:", CFSTR("Actions"), v28);
  -[PXMessagesStackBalloonViewController navigationItem](self, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRightBarButtonItem:", v29);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  -[PXMessagesStackBalloonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[UIViewController px_safeAreaInsets](self, "px_safeAreaInsets");
  PXEdgeInsetsInsetRect();
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  -[PXMessagesStackView setFrame:](self->_stackView, "setFrame:");
  v4.receiver = self;
  v4.super_class = (Class)PXMessagesStackBalloonViewController;
  -[PXMessagesStackBalloonViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
}

- (void)_executeReuseTest
{
  PXMessagesStackView *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  id v8;
  PXMessagesStackView *v9;
  _QWORD block[4];
  PXMessagesStackView *v11;
  id v12;
  id v13;

  v3 = self->_stackView;
  -[PXMessagesStackBalloonViewController dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMessagesStackBalloonViewController mediaProvider](self, "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBaseMessagesStackView setDataSourceManager:](v3, "setDataSourceManager:", 0);
  -[PXMessagesStackView setMediaProvider:](v3, "setMediaProvider:", 0);
  v6 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXMessagesStackBalloonViewController__executeReuseTest__block_invoke;
  block[3] = &unk_1E51457C8;
  v11 = v3;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  v9 = v3;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

- (void)_executeScroll
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXBaseMessagesStackView dataSourceManager](self->_stackView, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = arc4random_uniform(objc_msgSend(v8, "numberOfItemsInSection:", 0));
  if (!-[PXBaseMessagesStackView scrollToIndex:animated:](self->_stackView, "scrollToIndex:animated:", v4, 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to scroll to index %lu"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Scroll Failed"), v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);

    -[PXMessagesStackBalloonViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }

}

- (void)_togglePlayableLoading
{
  -[PXMessagesStackView setAllowPlayableContentLoading:](self->_stackView, "setAllowPlayableContentLoading:", -[PXMessagesStackView allowPlayableContentLoading](self->_stackView, "allowPlayableContentLoading") ^ 1);
}

- (void)_toggleAutoplay
{
  self->_allowAutoplay ^= 1u;
}

- (void)_toggleSnapshot
{
  PXMessagesStackView *stackView;
  void *v4;
  id v5;

  stackView = self->_stackView;
  if (self->_hasTransitionSnapshot)
  {
    -[PXMessagesStackView removeTransitionSnapshotView](self->_stackView, "removeTransitionSnapshotView");
  }
  else
  {
    -[PXMessagesStackView currentAssetReference](self->_stackView, "currentAssetReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXMessagesStackView installTransitionSnapshotViewForAssetReference:uncroppedImageFrame:](stackView, "installTransitionSnapshotViewForAssetReference:uncroppedImageFrame:", v4, 0);

  }
  self->_hasTransitionSnapshot ^= 1u;
}

- (void)_toggleAdditionalItems
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  __int128 *v8;
  __int128 v9;
  int64x2_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = *(_OWORD *)off_1E50B7F48;
  v10 = vdupq_n_s64(1uLL);
  v3 = -[PXMessagesStackView additionalItemsCount](self->_stackView, "additionalItemsCount", v9, 2, 1, *(_OWORD *)&v10, 3, 2, 1, 2, 12, 1, 102, 0, 1, 0);
  v5 = 0;
  v6 = (_QWORD *)&v9 + 1;
  while (v3 != *(v6 - 1) || v4 != *v6)
  {
    v6 += 2;
    if (++v5 == 8)
    {
      LOBYTE(v5) = 0;
      break;
    }
  }
  v8 = &v9 + (((_BYTE)v5 + 1) & 7);
  -[PXMessagesStackView setAdditionalItemsCount:](self->_stackView, "setAdditionalItemsCount:", *(_QWORD *)v8, *((_QWORD *)v8 + 1));
}

- (void)_presentGridWithAssetReference:(id)a3
{
  PXPhotosViewConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXMessagesDebugTapbackStatusManager *v9;
  PXPhotosUIViewController *v10;
  void *v11;
  void *v12;
  PXPhotosViewConfiguration *v13;

  v4 = [PXPhotosViewConfiguration alloc];
  -[PXMessagesStackBalloonViewController dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMessagesStackBalloonViewController mediaProvider](self, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMessagesStackBalloonViewController assetActionManager](self, "assetActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXPhotosViewConfiguration initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:](v4, "initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:", v5, v6, 0, v7, 0);

  -[PXPhotosViewConfiguration setAllowedActions:](v13, "setAllowedActions:", -[PXPhotosViewConfiguration allowedActions](v13, "allowedActions") | 0x12000);
  -[PXPhotosViewConfiguration setAllowedBehaviors:](v13, "setAllowedBehaviors:", -[PXPhotosViewConfiguration allowedBehaviors](v13, "allowedBehaviors") & 0xFFFFFFFFFFFFFFDFLL);
  -[PXPhotosViewConfiguration setForbiddenBadges:](v13, "setForbiddenBadges:", -1);
  -[PXPhotosViewConfiguration setSectionBodyStyle:](v13, "setSectionBodyStyle:", 2);
  -[PXPhotosViewConfiguration setWantsModernNavBarButtons:](v13, "setWantsModernNavBarButtons:", 0);
  -[PXPhotosViewConfiguration setNavBarStyle:](v13, "setNavBarStyle:", 0);
  +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "enableDebugTapbacksGrid") & 1) != 0)
  {
    v9 = objc_alloc_init(PXMessagesDebugTapbackStatusManager);
    -[PXPhotosViewConfiguration setTapbackStatusManager:](v13, "setTapbackStatusManager:", v9);

  }
  else
  {
    -[PXPhotosViewConfiguration setTapbackStatusManager:](v13, "setTapbackStatusManager:", 0);
  }

  -[PXPhotosViewConfiguration setDecorationViewClass:](v13, "setDecorationViewClass:", objc_opt_class());
  v10 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v13);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);
  objc_msgSend(v11, "setModalPresentationStyle:", 0);
  -[PXMessagesStackView gridTransitioningDelegate](self->_stackView, "gridTransitioningDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTransitioningDelegate:", v12);

  -[PXMessagesStackBalloonViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)stackView:(id)a3 didSelectAssetReference:(id)a4
{
  -[PXMessagesStackBalloonViewController _presentGridWithAssetReference:](self, "_presentGridWithAssetReference:", a4);
}

- (BOOL)stackView:(id)a3 shouldAutoplayAsset:(id)a4
{
  return self->_allowAutoplay;
}

- (void)stackViewDidSelectAdditionalItemsCard:(id)a3
{
  -[PXMessagesStackBalloonViewController _presentGridWithAssetReference:](self, "_presentGridWithAssetReference:", 0);
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetActionManager)assetActionManager
{
  return self->_assetActionManager;
}

- (void)setAssetActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetActionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

uint64_t __57__PXMessagesStackBalloonViewController__executeReuseTest__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMediaProvider:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setDataSourceManager:", *(_QWORD *)(a1 + 48));
}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_executeScroll");

}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_executeReuseTest");

}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_togglePlayableLoading");

}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleAutoplay");

}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSnapshot");

}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleAdditionalItems");

}

@end
