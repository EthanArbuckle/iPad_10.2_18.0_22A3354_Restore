@implementation VideosExtrasShowcaseTemplateViewController

- (VideosExtrasShowcaseTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  VideosExtrasShowcaseTemplateViewController *v5;
  VideosExtrasShowcaseTemplateViewController *v6;
  VideosExtrasShowcaseTemplateViewController *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  VideosExtrasCarouselViewController *v18;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  VideosExtrasShowcaseTemplateViewController *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  v5 = -[VideosExtrasTemplateViewController initWithDocument:options:context:](&v30, sel_initWithDocument_options_context_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[VideosExtrasShowcaseTemplateViewController templateElement](v5, "templateElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = v6;
    v6->_autohighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v21, "carousel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "items");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v23[0] = v12;
            v23[1] = 3221225472;
            v23[2] = __79__VideosExtrasShowcaseTemplateViewController_initWithDocument_options_context___block_invoke;
            v23[3] = &unk_1E9FA2308;
            v24 = v7;
            v25 = v22;
            objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }
    v6 = v7;
    -[VideosExtrasShowcaseTemplateViewController setCarouselLockupElements:](v7, "setCarouselLockupElements:", v22);
    objc_msgSend(v21, "modes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", *MEMORY[0x1E0D3A570]);
    -[VideosExtrasShowcaseTemplateViewController setSupportsOneupMode:](v7, "setSupportsOneupMode:", v17);
    if (objc_msgSend(v16, "containsObject:", *MEMORY[0x1E0D3A578]))
    {
      v18 = objc_alloc_init(VideosExtrasCarouselViewController);
      -[VideosExtrasCarouselViewController setDataSource:](v18, "setDataSource:", v7);
      -[VideosExtrasCarouselViewController setDelegate:](v18, "setDelegate:", v7);
      -[VideosExtrasShowcaseTemplateViewController setCarouselViewController:](v7, "setCarouselViewController:", v18);
      if (!v18)
        goto LABEL_17;
    }
    else
    {
      if (!(_DWORD)v17)
        goto LABEL_17;
      v18 = objc_alloc_init(VideosExtrasImageBrowserViewController);
      -[VideosExtrasShowcaseTemplateViewController setImageBrowserViewController:](v7, "setImageBrowserViewController:", v18);
      -[VideosExtrasCarouselViewController addObserver:forKeyPath:options:context:](v18, "addObserver:forKeyPath:options:context:", v7, CFSTR("title"), 0, 0);
      -[VideosExtrasCarouselViewController setDataSource:](v18, "setDataSource:", v7);
      -[VideosExtrasCarouselViewController setVisibleImageIndex:](v18, "setVisibleImageIndex:", v7->_autohighlightIndex);
      if (!v18)
        goto LABEL_17;
    }
    -[VideosExtrasShowcaseTemplateViewController addChildViewController:](v7, "addChildViewController:", v18);
    -[VideosExtrasCarouselViewController didMoveToParentViewController:](v18, "didMoveToParentViewController:", v7);

LABEL_17:
  }
  return v6;
}

void __79__VideosExtrasShowcaseTemplateViewController_initWithDocument_options_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "autoHighlightIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080) = a3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[VideosExtrasShowcaseTemplateViewController _mainChildViewController](self, "_mainChildViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "willMoveToParentViewController:", 0);
    if (objc_msgSend(v4, "isViewLoaded"))
    {
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

    }
    objc_msgSend(v4, "removeFromParentViewController");
  }
  -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", 0);
  objc_msgSend(v6, "setDelegate:", 0);
  -[VideosExtrasShowcaseTemplateViewController imageBrowserViewController](self, "imageBrowserViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", 0);
  objc_msgSend(v7, "setZoomingImageInteractiveTransitionSource:", 0);
  if (v4 == v7)
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("title"), 0);

  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  -[VideosExtrasTemplateViewController dealloc](&v8, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[VideosExtrasShowcaseTemplateViewController imageBrowserViewController](self, "imageBrowserViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasShowcaseTemplateViewController _mainChildViewController](self, "_mainChildViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v11 || v13 != v14)
  {

    goto LABEL_6;
  }
  v15 = objc_msgSend(v10, "isEqualToString:", CFSTR("title"));

  if (!v15)
  {
LABEL_6:
    v17.receiver = self;
    v17.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
    -[VideosExtrasShowcaseTemplateViewController observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    goto LABEL_7;
  }
  objc_msgSend(v11, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasShowcaseTemplateViewController setTitle:](self, "setTitle:", v16);

LABEL_7:
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidLoad](&v33, sel_viewDidLoad);
  -[VideosExtrasShowcaseTemplateViewController templateElement](self, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "background");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "background");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v3, "documentBanner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "background");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "documentBanner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "background");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  -[VideosExtrasTemplateViewController configureBackgroundWithElements:](self, "configureBackgroundWithElements:", v5);
  if (v4)
  {
    v12 = 0;
  }
  else
  {
    -[VideosExtrasShowcaseTemplateViewController title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "documentBanner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasElementViewController _configureBannerWithElement:](self, "_configureBannerWithElement:", v13);

  if (!v4)
  {
    -[VideosExtrasShowcaseTemplateViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasShowcaseTemplateViewController title](self, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackButtonTitle:", v15);

    -[VideosExtrasShowcaseTemplateViewController setTitle:](self, "setTitle:", v12);
  }
  objc_msgSend(v4, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    -[VideosExtrasShowcaseTemplateViewController imageBrowserViewController](self, "imageBrowserViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v18);

  }
  -[VideosExtrasShowcaseTemplateViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "addSubview:", v16);
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = (void *)MEMORY[0x1E0CB3718];
  if (v4)
  {
    objc_msgSend(v19, "safeAreaLayoutGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 3, 0, v22, 3, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v23);

    v24 = (void *)MEMORY[0x1E0CB3718];
    v25 = *MEMORY[0x1E0DC49E8];
    v26 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v28 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v29 = v16;
    v30 = v19;
    v31 = 14;
  }
  else
  {
    v25 = *MEMORY[0x1E0DC49E8];
    v26 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v28 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v24 = (void *)MEMORY[0x1E0CB3718];
    v29 = v16;
    v30 = v19;
    v31 = 15;
  }
  objc_msgSend(v24, "constraintsByAttachingView:toView:alongEdges:insets:", v29, v30, v31, v25, v26, v27, v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v32);

  objc_msgSend(v19, "addConstraints:", v20);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[VideosExtrasShowcaseTemplateViewController setActiveZoomingImageInteractiveTransitionController:](self, "setActiveZoomingImageInteractiveTransitionController:", 0);
  -[VideosExtrasShowcaseTemplateViewController setOverriddenFullscreenImages:](self, "setOverriddenFullscreenImages:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  -[VideosExtrasElementViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  v4 = 1080;
  if (self->_autohighlightIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIndexOfVisibleItem:", self->_autohighlightIndex);
    }
    else
    {
      -[VideosExtrasShowcaseTemplateViewController imageBrowserViewController](self, "imageBrowserViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setVisibleImageIndex:", self->_autohighlightIndex);
    }

    self->_autohighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    -[VideosExtrasShowcaseTemplateViewController imageBrowserViewController](self, "imageBrowserViewController");
    v4 = objc_claimAutoreleasedReturnValue();
    v8 = v4 != 0;
  }
  -[VideosExtrasTemplateViewController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extrasRootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainMenuBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v8);

  if (!v7)
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VideosExtrasShowcaseTemplateViewController imageBrowserViewController](self, "imageBrowserViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDataSource:", 0);
    objc_msgSend(v5, "setZoomingImageInteractiveTransitionSource:", 0);
    -[VideosExtrasShowcaseTemplateViewController setImageBrowserViewController:](self, "setImageBrowserViewController:", 0);

  }
  -[VideosExtrasShowcaseTemplateViewController setActiveZoomingImageInteractiveTransitionController:](self, "setActiveZoomingImageInteractiveTransitionController:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  -[VideosExtrasShowcaseTemplateViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[VideosExtrasTemplateViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extrasRootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainMenuBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

}

- (IKShowcaseTemplate)templateElement
{
  void *v2;
  void *v3;

  -[VideosExtrasTemplateViewController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKShowcaseTemplate *)v3;
}

- (BOOL)showsPlaceholder
{
  return 0;
}

- (void)_prepareLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  -[VideosExtrasElementViewController _prepareLayout](&v4, sel__prepareLayout);
  -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVignetteType:", 3);

}

- (unint64_t)numberOfItemsInCarouselViewController:(id)a3
{
  void *v3;
  unint64_t v4;

  -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)carouselViewController:(id)a3 configureCarouselCollectionViewCell:(id)a4 forItemAtIndex:(unint64_t)a5 withThumbnailImageContainerSize:(CGSize)a6
{
  double height;
  double width;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  unint64_t v83;
  void *v84;
  VideosExtrasShowcaseTemplateViewController *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  _QWORD v97[5];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[4];

  height = a6.height;
  width = a6.width;
  v109[2] = *MEMORY[0x1E0C80C00];
  v96 = a4;
  v85 = self;
  -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = a5;
  objc_msgSend(v10, "objectAtIndex:", a5);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v96, "titleTextStyle");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:");
  v11 = objc_claimAutoreleasedReturnValue();
  v107 = *MEMORY[0x1E0DC1140];
  v12 = v107;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v13;
  v108 = *MEMORY[0x1E0DC1138];
  v14 = v108;
  v92 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, &v107, 2);
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v96, "subtitleTextStyle");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:");
  v17 = objc_claimAutoreleasedReturnValue();
  v105[0] = v12;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v14;
  v106[0] = v18;
  v89 = (void *)v17;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v17, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v96, "descriptionTextStyle");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:");
  v20 = objc_claimAutoreleasedReturnValue();
  v103[0] = v12;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.6, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v14;
  v104[0] = v21;
  v87 = (void *)v20;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v20, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v95, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v24, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "string");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithString:attributes:", v27, v16);

    objc_msgSend(v24, "textAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addAttributes:range:", v29, 0, objc_msgSend(v28, "length"));
    objc_msgSend(v96, "setTitleText:", v28);

  }
  v91 = (void *)v16;
  objc_msgSend(v95, "subtitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v30, "text");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "string");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v31, "initWithString:attributes:", v33, v94);

    objc_msgSend(v30, "textAttributes");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addAttributes:range:", v35, 0, objc_msgSend(v34, "length"));
    objc_msgSend(v96, "setSubtitleText:", v34);

  }
  objc_msgSend(v95, "descriptionText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v36, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "string");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v37, "initWithString:attributes:", v39, v23);

    objc_msgSend(v36, "textAttributes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addAttributes:range:", v41, 0, objc_msgSend(v40, "length"));
    objc_msgSend(v96, "setDescriptionText:", v40);

  }
  v86 = v24;
  objc_msgSend(v95, "overlays");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  objc_msgSend(v42, "children");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
  if (v44)
  {
    v45 = v44;
    v46 = v30;
    v47 = v23;
    v48 = v42;
    v49 = *(_QWORD *)v99;
    while (2)
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v99 != v49)
          objc_enumerationMutation(v43);
        v51 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v51, "resourceImage");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
      if (v45)
        continue;
      break;
    }
    v52 = 0;
LABEL_17:
    v42 = v48;
    v23 = v47;
    v30 = v46;
  }
  else
  {
    v52 = 0;
  }

  objc_msgSend(v96, "setAllowsPinchingThumbnailImageForInteractiveZoomingImageTransition:", -[VideosExtrasShowcaseTemplateViewController supportsOneupMode](v85, "supportsOneupMode"));
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "userInterfaceIdiom");

  if (v54)
  {
    objc_msgSend(v95, "image");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v55, "placeholderURL");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "imageForPlaceholderURL:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setThumbnailImagePlaceholder:", v58);

    objc_msgSend(v55, "accessibilityText");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setThumbnailImageAccessibilityText:", v59);

    objc_msgSend(v55, "borderColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60;
    if (v60)
    {
      v62 = v60;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "colorWithAlphaComponent:", 0.2);
      v62 = (id)objc_claimAutoreleasedReturnValue();

    }
    v67 = v91;

    objc_msgSend(v96, "setThumbnailBorderColor:", v62);
    if (v52)
      objc_msgSend(v96, "setThumbnailOverlayImage:", v52);
    objc_msgSend(v55, "artworkCatalog");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setFittingSize:", width, height);
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __152__VideosExtrasShowcaseTemplateViewController_carouselViewController_configureCarouselCollectionViewCell_forItemAtIndex_withThumbnailImageContainerSize___block_invoke_2;
    v97[3] = &__block_descriptor_40_e60_v24__0__VideosExtrasCarouselCollectionViewCell_8__UIImage_16l;
    v97[4] = v83;
    objc_msgSend(v68, "setDestination:configurationBlock:", v96, v97);
LABEL_44:

    goto LABEL_45;
  }
  v63 = -[VideosExtrasElementViewController extrasSize](v85, "extrasSize");
  v64 = 175.0;
  if (v63)
  {
    if (v63 == 2)
    {
      v64 = 220.0;
      v65 = 300.0;
    }
    else if (v63 == 1)
    {
      v65 = 260.0;
    }
    else
    {
      v64 = 270.0;
      v65 = 335.0;
    }
  }
  else
  {
    v65 = 205.0;
  }
  objc_msgSend(v96, "setThumbnailMaxSize:", v65, v64);
  objc_msgSend(v95, "image");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v69;
  if (v69)
  {
    v81 = v42;
    objc_msgSend(v69, "placeholderURL");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageForPlaceholderURL:", v62);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setThumbnailImagePlaceholder:", v68);
    objc_msgSend(v55, "borderColor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    v84 = v30;
    if (v70)
    {
      v72 = v70;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "colorWithAlphaComponent:", 0.2);
      v72 = (id)objc_claimAutoreleasedReturnValue();

    }
    v82 = v36;

    objc_msgSend(v96, "setThumbnailBorderColor:", v72);
    if (v52)
      objc_msgSend(v96, "setThumbnailOverlayImage:", v52);
    objc_msgSend(v55, "artworkCatalog");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFittingSize:", v65, v64);
    -[VideosExtrasShowcaseTemplateViewController view](v85, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "window");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "screen");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "scale");
    v79 = v78;

    if (v79 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "scale");
      objc_msgSend(v74, "setDestinationScale:");

    }
    else
    {
      objc_msgSend(v74, "setDestinationScale:", v79);
    }
    v67 = v91;
    v36 = v82;
    v30 = v84;
    objc_msgSend(v74, "setDestination:configurationBlock:", v96, &__block_literal_global_127);

    v42 = v81;
    goto LABEL_44;
  }
  v67 = v91;
LABEL_45:

}

uint64_t __152__VideosExtrasShowcaseTemplateViewController_carouselViewController_configureCarouselCollectionViewCell_forItemAtIndex_withThumbnailImageContainerSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return objc_msgSend(a2, "setThumbnailImage:");
  return result;
}

void __152__VideosExtrasShowcaseTemplateViewController_carouselViewController_configureCarouselCollectionViewCell_forItemAtIndex_withThumbnailImageContainerSize___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5 && objc_msgSend(v6, "itemIndex") == *(_QWORD *)(a1 + 32))
    objc_msgSend(v6, "setThumbnailImage:", v5);

}

- (void)carouselViewController:(id)a3 didHighlightItemAtIndex:(unint64_t)a4
{
  void *v5;
  id v6;

  -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 4, 1, 0, 0, 0);
}

- (void)carouselViewController:(id)a3 didSelectItemAtIndex:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v7 = a5;
  -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108__VideosExtrasShowcaseTemplateViewController_carouselViewController_didSelectItemAtIndex_completionHandler___block_invoke;
  v11[3] = &unk_1E9FA2390;
  v11[4] = self;
  v12 = v7;
  v13 = a4;
  v10 = v7;
  objc_msgSend(v9, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, v11);

}

void __108__VideosExtrasShowcaseTemplateViewController_carouselViewController_didSelectItemAtIndex_completionHandler___block_invoke(_QWORD *a1, char a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  char v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __108__VideosExtrasShowcaseTemplateViewController_carouselViewController_didSelectItemAtIndex_completionHandler___block_invoke_2;
  v6[3] = &unk_1E9F9B458;
  v9 = a2;
  v3 = (void *)a1[5];
  v6[4] = a1[4];
  v4 = v3;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __108__VideosExtrasShowcaseTemplateViewController_carouselViewController_didSelectItemAtIndex_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  int v3;

  if (*(_BYTE *)(a1 + 56))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = objc_msgSend(*(id *)(a1 + 32), "supportsOneupMode");
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v3)
    return objc_msgSend(*(id *)(a1 + 32), "_pushImageBrowserWithVisibleItemIndex:", *(_QWORD *)(a1 + 48));
  return result;
}

- (unint64_t)numberOfImagesForBrowserViewController:(id)a3
{
  void *v3;
  unint64_t v4;

  -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)imageBrowserViewController:(id)a3 loadImageAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, void *);

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  -[VideosExtrasShowcaseTemplateViewController overriddenFullscreenImages](self, "overriddenFullscreenImages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v9[2](v9, v12);
  }
  else
  {
    -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v15, "artworkCatalog");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFittingSize:", v18, v20);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __112__VideosExtrasShowcaseTemplateViewController_imageBrowserViewController_loadImageAtIndex_withCompletionHandler___block_invoke;
    v22[3] = &unk_1E9FA23B8;
    v23 = v9;
    objc_msgSend(v21, "requestImageWithCompletion:", v22);

  }
}

void __112__VideosExtrasShowcaseTemplateViewController_imageBrowserViewController_loadImageAtIndex_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __112__VideosExtrasShowcaseTemplateViewController_imageBrowserViewController_loadImageAtIndex_withCompletionHandler___block_invoke_2;
      v7[3] = &unk_1E9F99420;
      v9 = *(id *)(a1 + 32);
      v8 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }

}

uint64_t __112__VideosExtrasShowcaseTemplateViewController_imageBrowserViewController_loadImageAtIndex_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)imageBrowserViewController:(id)a3 loadTitleAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a5;
  if (-[VideosExtrasElementViewController isWide](self, "isWide"))
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v15[1] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasShowcaseTemplateViewController _loadTextElement:textAttributes:withCompletionHandler:](self, "_loadTextElement:textAttributes:withCompletionHandler:", v14, v11, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)imageBrowserViewController:(id)a3 loadSubtitleAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a5;
  if (-[VideosExtrasElementViewController isWide](self, "isWide"))
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A90]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v15[1] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasShowcaseTemplateViewController _loadTextElement:textAttributes:withCompletionHandler:](self, "_loadTextElement:textAttributes:withCompletionHandler:", v14, v11, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)imageBrowserViewController:(id)a3 loadDescriptionAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a5;
  if (-[VideosExtrasElementViewController isWide](self, "isWide"))
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A98]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.6, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v15[1] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "descriptionText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasShowcaseTemplateViewController _loadTextElement:textAttributes:withCompletionHandler:](self, "_loadTextElement:textAttributes:withCompletionHandler:", v14, v11, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (id)animationControllerForNavigationOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  VideosExtrasShowcaseTemplateViewController *v8;
  VideosExtrasShowcaseTemplateViewController *v9;
  VideosExtrasShowcaseTemplateViewController *v10;
  BOOL v11;
  uint64_t v12;
  char isKindOfClass;
  VideosExtrasShowcaseTemplateViewController *v14;
  char v15;
  VideosExtrasShowcaseTemplateViewController *v16;
  VideosExtrasShowcaseTemplateViewController *v17;
  VideosExtrasShowcaseTemplateViewController *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  VideosExtrasShowcaseTemplateViewController *v22;
  VideosExtrasZoomingImageTransitionController *v23;
  char v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v33;
  void *v34;

  v8 = (VideosExtrasShowcaseTemplateViewController *)a4;
  v9 = (VideosExtrasShowcaseTemplateViewController *)a5;
  v10 = v9;
  v11 = a3 == 1 && v8 == self;
  v12 = v11;
  if (v11)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = v10;
    if ((isKindOfClass & 1) != 0)
      goto LABEL_17;
    objc_opt_class();
    v15 = objc_opt_isKindOfClass();
    v16 = v10;
    if ((v15 & 1) == 0)
    {
LABEL_21:
      v22 = 0;
      goto LABEL_22;
    }
LABEL_11:
    v17 = v16;
    v18 = v17;
    if (!v17)
    {
      v22 = 0;
      goto LABEL_23;
    }
    -[VideosExtrasShowcaseTemplateViewController slideshowViewController](v17, "slideshowViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a3 == 1)
      v21 = -[VideosExtrasShowcaseTemplateViewController indexOfVisibleItem](self, "indexOfVisibleItem");
    else
      v21 = objc_msgSend(v19, "visibleImageIndex");
    v27 = v21;
    -[VideosExtrasShowcaseTemplateViewController carouselLockupElements](self, "carouselLockupElements");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 >= objc_msgSend(v28, "count"))
    {
      v23 = 0;
LABEL_38:

      v22 = 0;
      goto LABEL_39;
    }
    objc_msgSend(v28, "objectAtIndex:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "image");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VideosExtrasShowcaseTemplateViewController shouldPerformZoomingImageTransitionFromImageElement:toImageAtIndex:](v18, "shouldPerformZoomingImageTransitionFromImageElement:toImageAtIndex:", v30, v27))
    {

    }
    else
    {
      objc_msgSend(v29, "fullscreenImage");
      v34 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[VideosExtrasShowcaseTemplateViewController shouldPerformZoomingImageTransitionFromImageElement:toImageAtIndex:](v18, "shouldPerformZoomingImageTransitionFromImageElement:toImageAtIndex:", v31, v27);

      v29 = v34;
      if (!v33)
      {
        v23 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    if (a3 == 1)
      objc_msgSend(v20, "setVisibleImageIndex:", v27);
    v23 = -[VideosExtrasZoomingImageTransitionController initWithItemIndex:forInteractiveTransition:]([VideosExtrasZoomingImageTransitionController alloc], "initWithItemIndex:forInteractiveTransition:", v27, 0);
    -[VideosExtrasZoomingImageTransitionController setShouldUseSpringAnimation:](v23, "setShouldUseSpringAnimation:", v12);
    goto LABEL_37;
  }
  v22 = 0;
  v18 = 0;
  v23 = 0;
  if (a3 != 2 || v9 != self)
    goto LABEL_39;
  objc_opt_class();
  v24 = objc_opt_isKindOfClass();
  v14 = v8;
  if ((v24 & 1) == 0)
  {
    objc_opt_class();
    v26 = objc_opt_isKindOfClass();
    v16 = v8;
    if ((v26 & 1) == 0)
      goto LABEL_21;
    goto LABEL_11;
  }
LABEL_17:
  v22 = v14;
  if (!v22)
  {
LABEL_22:
    v18 = 0;
LABEL_23:
    v23 = 0;
    goto LABEL_39;
  }
  -[VideosExtrasShowcaseTemplateViewController activeZoomingImageInteractiveTransitionController](self, "activeZoomingImageInteractiveTransitionController");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v23 = (VideosExtrasZoomingImageTransitionController *)v25;
  }
  else
  {
    v23 = -[VideosExtrasZoomingImageTransitionController initWithItemIndex:forInteractiveTransition:]([VideosExtrasZoomingImageTransitionController alloc], "initWithItemIndex:forInteractiveTransition:", -[VideosExtrasShowcaseTemplateViewController visibleImageIndex](v22, "visibleImageIndex"), 0);
    -[VideosExtrasZoomingImageTransitionController setShouldUseSpringAnimation:](v23, "setShouldUseSpringAnimation:", v12);
  }
  v18 = 0;
LABEL_39:

  return v23;
}

- (void)handlePinchGestureForZoomingImageInteractiveTransitionWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  char v6;
  double v7;
  int v8;
  int v9;
  void *v10;
  VideosExtrasZoomingImageTransitionController *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "pinchGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) < 2)
  {
    -[VideosExtrasShowcaseTemplateViewController activeZoomingImageInteractiveTransitionController](self, "activeZoomingImageInteractiveTransitionController");
    v11 = (VideosExtrasZoomingImageTransitionController *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasZoomingImageTransitionController completeInteractiveTransitionWithPinchGestureRecognizer:](v11, "completeInteractiveTransitionWithPinchGestureRecognizer:", v4);
LABEL_19:

    goto LABEL_20;
  }
  if (v5 == 2)
  {
    -[VideosExtrasShowcaseTemplateViewController activeZoomingImageInteractiveTransitionController](self, "activeZoomingImageInteractiveTransitionController");
    v11 = (VideosExtrasZoomingImageTransitionController *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasZoomingImageTransitionController updateInteractiveTransitionWithPinchGestureRecognizer:](v11, "updateInteractiveTransitionWithPinchGestureRecognizer:", v4);
    goto LABEL_19;
  }
  if (v5 == 1)
  {
    v6 = objc_msgSend(v15, "supportedZoomingImageTransitionDirections");
    objc_msgSend(v4, "velocity");
    if (v7 >= 0.0 && (v6 & 1) != 0 || (v8 = 0, v9 = 0, v7 < 0.0) && (v6 & 2) != 0)
    {
      objc_msgSend(v15, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("VideosExtrasCarouselZoomingImageTransitionIdentifier"));
      if ((v8 & 1) != 0)
        v9 = 0;
      else
        v9 = objc_msgSend(v10, "isEqualToString:", CFSTR("VideosExtrasImageBrowserZoomingImageTransitionIdentifier"));

    }
    if ((v8 & 1) != 0 || v9)
    {
      v12 = objc_msgSend(v15, "itemIndex");
      v11 = -[VideosExtrasZoomingImageTransitionController initWithItemIndex:forInteractiveTransition:]([VideosExtrasZoomingImageTransitionController alloc], "initWithItemIndex:forInteractiveTransition:", v12, 1);
      -[VideosExtrasShowcaseTemplateViewController setActiveZoomingImageInteractiveTransitionController:](self, "setActiveZoomingImageInteractiveTransitionController:", v11);
      -[VideosExtrasZoomingImageTransitionController prepareInteractiveTransitionWithPinchGestureRecognizer:](v11, "prepareInteractiveTransitionWithPinchGestureRecognizer:", v4);
      if (v8)
      {
        -[VideosExtrasShowcaseTemplateViewController _pushImageBrowserWithVisibleItemIndex:](self, "_pushImageBrowserWithVisibleItemIndex:", v12);
      }
      else
      {
        -[VideosExtrasShowcaseTemplateViewController navigationController](self, "navigationController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v13, "popViewControllerAnimated:", 1);

      }
      goto LABEL_19;
    }
  }
LABEL_20:

}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "appearState");
  if (v5 == 1)
  {
    -[VideosExtrasTemplateViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extrasRootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mainTemplateViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "menuBarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0.0;
    goto LABEL_5;
  }
  if (!v5)
  {
    -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[VideosExtrasTemplateViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extrasRootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mainTemplateViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "menuBarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 1.0;
LABEL_5:
    objc_msgSend(v11, "setAlpha:", v13);

  }
  -[VideosExtrasShowcaseTemplateViewController _mainChildViewController](self, "_mainChildViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "prepareZoomingImageTransitionWithContext:", v4);

}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "appearState");
  if (v5 == 1)
  {
    -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 0.0);

    -[VideosExtrasTemplateViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extrasRootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mainTemplateViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "menuBarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0.0;
    goto LABEL_5;
  }
  if (!v5)
  {
    -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    -[VideosExtrasTemplateViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extrasRootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mainTemplateViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "menuBarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 1.0;
LABEL_5:
    objc_msgSend(v11, "setAlpha:", v13);

  }
  -[VideosExtrasShowcaseTemplateViewController _mainChildViewController](self, "_mainChildViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performZoomingImageTransitionWithContext:", v4);

}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "appearState");
  if (!v7)
  {
    if (v4)
      v15 = 1.0;
    else
      v15 = 0.0;
    -[VideosExtrasTemplateViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extrasRootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mainTemplateViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "menuBarView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", v15);

    goto LABEL_11;
  }
  if (v7 == 1)
  {
    if (v4)
      v8 = 0.0;
    else
      v8 = 1.0;
    -[VideosExtrasTemplateViewController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extrasRootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mainTemplateViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "menuBarView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", v8);

    -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 1.0);
LABEL_11:

  }
  -[VideosExtrasShowcaseTemplateViewController _mainChildViewController](self, "_mainChildViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "finalizeZoomingImageTransitionWithContext:transitionFinished:", v6, v4);

}

- (unint64_t)indexOfVisibleItem
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "indexOfVisibleItem");
  }
  else
  {
    -[VideosExtrasShowcaseTemplateViewController imageBrowserViewController](self, "imageBrowserViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v5 = objc_msgSend(v6, "visibleImageIndex");
    else
      v5 = 0x7FFFFFFFFFFFFFFFLL;

  }
  return v5;
}

- (void)_loadTextElement:(id)a3 textAttributes:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  objc_class *v8;
  void (**v9)(id, id);
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void (*v15)(void);
  id v16;

  v16 = a3;
  v7 = a4;
  if (v16)
  {
    v8 = (objc_class *)MEMORY[0x1E0CB3778];
    v9 = (void (**)(id, id))a5;
    v10 = [v8 alloc];
    objc_msgSend(v16, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "initWithString:attributes:", v12, v7);

    objc_msgSend(v16, "textAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAttributes:range:", v14, 0, objc_msgSend(v13, "length"));
    v9[2](v9, v13);

  }
  else
  {
    v15 = (void (*)(void))*((_QWORD *)a5 + 2);
    v13 = a5;
    v15();
  }

}

- (id)_mainChildViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[VideosExtrasShowcaseTemplateViewController imageBrowserViewController](self, "imageBrowserViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_pushImageBrowserWithVisibleItemIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VideosExtrasImageBrowserViewController *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasShowcaseTemplateViewController carouselViewController](self, "carouselViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "carouselCollectionViewCellForItemAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "thumbnailImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasShowcaseTemplateViewController setOverriddenFullscreenImages:](self, "setOverriddenFullscreenImages:", v9);

  }
  v10 = objc_alloc_init(VideosExtrasImageBrowserViewController);
  -[VideosExtrasImageBrowserViewController setDataSource:](v10, "setDataSource:", self);
  -[VideosExtrasImageBrowserViewController setVisibleImageIndex:](v10, "setVisibleImageIndex:", a3);
  -[VideosExtrasImageBrowserViewController setAllowsPinchingImageForInteractiveZoomingImageTransition:](v10, "setAllowsPinchingImageForInteractiveZoomingImageTransition:", 1);
  -[VideosExtrasImageBrowserViewController setZoomingImageInteractiveTransitionSource:](v10, "setZoomingImageInteractiveTransitionSource:", self);
  -[VideosExtrasShowcaseTemplateViewController setImageBrowserViewController:](self, "setImageBrowserViewController:", v10);
  -[VideosExtrasShowcaseTemplateViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v10, 1);

}

- (VideosExtrasZoomingImageTransitionController)activeZoomingImageInteractiveTransitionController
{
  return self->_activeZoomingImageInteractiveTransitionController;
}

- (void)setActiveZoomingImageInteractiveTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_activeZoomingImageInteractiveTransitionController, a3);
}

- (NSArray)bannerButtonElements
{
  return self->_bannerButtonElements;
}

- (void)setBannerButtonElements:(id)a3
{
  objc_storeStrong((id *)&self->_bannerButtonElements, a3);
}

- (NSArray)carouselLockupElements
{
  return self->_carouselLockupElements;
}

- (void)setCarouselLockupElements:(id)a3
{
  objc_storeStrong((id *)&self->_carouselLockupElements, a3);
}

- (VideosExtrasCarouselViewController)carouselViewController
{
  return self->_carouselViewController;
}

- (void)setCarouselViewController:(id)a3
{
  objc_storeStrong((id *)&self->_carouselViewController, a3);
}

- (VideosExtrasImageBrowserViewController)imageBrowserViewController
{
  return self->_imageBrowserViewController;
}

- (void)setImageBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_imageBrowserViewController, a3);
}

- (NSDictionary)overriddenFullscreenImages
{
  return self->_overriddenFullscreenImages;
}

- (void)setOverriddenFullscreenImages:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenFullscreenImages, a3);
}

- (BOOL)supportsOneupMode
{
  return self->_supportsOneupMode;
}

- (void)setSupportsOneupMode:(BOOL)a3
{
  self->_supportsOneupMode = a3;
}

- (unint64_t)autohighlightIndex
{
  return self->_autohighlightIndex;
}

- (void)setAutohighlightIndex:(unint64_t)a3
{
  self->_autohighlightIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenFullscreenImages, 0);
  objc_storeStrong((id *)&self->_imageBrowserViewController, 0);
  objc_storeStrong((id *)&self->_carouselViewController, 0);
  objc_storeStrong((id *)&self->_carouselLockupElements, 0);
  objc_storeStrong((id *)&self->_bannerButtonElements, 0);
  objc_storeStrong((id *)&self->_activeZoomingImageInteractiveTransitionController, 0);
}

@end
