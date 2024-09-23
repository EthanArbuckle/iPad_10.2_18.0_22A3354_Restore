@implementation VideosExtrasSlideshowTemplateViewController

- (VideosExtrasSlideshowTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  VideosExtrasSlideshowTemplateViewController *v5;
  VideosExtrasSlideshowTemplateViewController *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VideosExtrasSlideshowViewController *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  v5 = -[VideosExtrasTemplateViewController initWithDocument:options:context:](&v27, sel_initWithDocument_options_context_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[VideosExtrasSlideshowTemplateViewController templateElement](v5, "templateElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "transition");
    if ((unint64_t)(v8 - 2) >= 3)
      v9 = 0;
    else
      v9 = v8 - 1;
    objc_msgSend(v7, "transitionInterval");
    if (v10 >= 2.22044605e-16)
      v11 = v10;
    else
      v11 = 3.0;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "images");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v12, "addObject:", v18);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }
    -[VideosExtrasSlideshowTemplateViewController setImageElements:](v6, "setImageElements:", v12);
    v19 = objc_alloc_init(VideosExtrasSlideshowViewController);
    -[VideosExtrasSlideshowViewController setDataSource:](v19, "setDataSource:", v6);
    -[VideosExtrasSlideshowViewController setTransitionStyle:](v19, "setTransitionStyle:", v9);
    -[VideosExtrasSlideshowViewController setTransitionInterval:](v19, "setTransitionInterval:", v11);
    -[VideosExtrasSlideshowViewController setVisibleImageIndex:](v19, "setVisibleImageIndex:", 0);
    -[VideosExtrasSlideshowTemplateViewController addChildViewController:](v6, "addChildViewController:", v19);
    -[VideosExtrasSlideshowViewController didMoveToParentViewController:](v19, "didMoveToParentViewController:", v6);
    -[VideosExtrasSlideshowTemplateViewController setSlideshowViewController:](v6, "setSlideshowViewController:", v19);
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SLIDESHOW_TITLE"), 0, CFSTR("VideosExtras"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasSlideshowTemplateViewController setTitle:](v6, "setTitle:", v21);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[VideosExtrasSlideshowTemplateViewController slideshowViewController](self, "slideshowViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willMoveToParentViewController:", 0);
  if (objc_msgSend(v3, "isViewLoaded"))
  {
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  objc_msgSend(v3, "removeFromParentViewController");
  objc_msgSend(v3, "setDataSource:", 0);
  -[VideosExtrasSlideshowTemplateViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:", self, 0);

  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  -[VideosExtrasTemplateViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  char v3;

  -[VideosExtrasSlideshowTemplateViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNavigationBarHidden");

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  VideosExtrasSlideshowTemplateViewController *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  -[VideosExtrasElementViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[VideosExtrasSlideshowTemplateViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "lastObject");
  v7 = (VideosExtrasSlideshowTemplateViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    objc_msgSend(v6, "removeLastObject");
  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[VideosExtrasSlideshowTemplateViewController slideshowViewController](self, "slideshowViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "indexOfVisibleItem");

    objc_msgSend(v10, "setVisibleImageIndex:", v11);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[VideosExtrasSlideshowTemplateViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearArtworkCatalogs");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[VideosExtrasSlideshowTemplateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[VideosExtrasSlideshowTemplateViewController slideshowViewController](self, "slideshowViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v6);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v6, v3, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_msgSend(v3, "addConstraints:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  objc_msgSend(v3, "addGestureRecognizer:", v9);
  -[VideosExtrasSlideshowTemplateViewController setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v9);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  -[VideosExtrasSlideshowTemplateViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (self->_overlayHidden)
    -[VideosExtrasSlideshowTemplateViewController _toggleVisibilityOfNavigationBar](self, "_toggleVisibilityOfNavigationBar");
}

- (IKSlideshowElement)templateElement
{
  void *v2;
  void *v3;

  -[VideosExtrasTemplateViewController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKSlideshowElement *)v3;
}

- (BOOL)showsPlaceholder
{
  return 0;
}

- (unint64_t)numberOfImagesForSlideshowViewController:(id)a3
{
  void *v3;
  unint64_t v4;

  -[VideosExtrasSlideshowTemplateViewController imageElements](self, "imageElements", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)slideshowViewController:(id)a3 loadImageAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  VideosExtrasSlideshowArtworkCatalogHelper *v18;
  VideosExtrasSlideshowArtworkCatalogHelper *v19;
  id v20;
  _QWORD v21[4];
  VideosExtrasSlideshowArtworkCatalogHelper *v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a5;
  -[VideosExtrasSlideshowTemplateViewController imageElements](self, "imageElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasSlideshowTemplateViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "clearArtworkCatalogs");
  objc_msgSend(v11, "artworkCatalog");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFittingSize:", v14, v16);
  v18 = objc_alloc_init(VideosExtrasSlideshowArtworkCatalogHelper);
  -[VideosExtrasSlideshowArtworkCatalogHelper setArtworkCatalog:](v18, "setArtworkCatalog:", v17);
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __110__VideosExtrasSlideshowTemplateViewController_slideshowViewController_loadImageAtIndex_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E9F9DD10;
  v19 = v18;
  v22 = v19;
  v20 = v9;
  v23 = v20;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v17, "setDestination:configurationBlock:", v12, v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

void __110__VideosExtrasSlideshowTemplateViewController_slideshowViewController_loadImageAtIndex_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "artworkCatalog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "setArtworkCatalog:", 0);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "_firstImageLoadedHideNavigationBar");

    }
  }

}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasSlideshowTemplateViewController slideshowViewController](self, "slideshowViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareZoomingImageTransitionWithContext:", v4);

}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasSlideshowTemplateViewController slideshowViewController](self, "slideshowViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performZoomingImageTransitionWithContext:", v4);

}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[VideosExtrasSlideshowTemplateViewController slideshowViewController](self, "slideshowViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finalizeZoomingImageTransitionWithContext:transitionFinished:", v6, v4);

}

- (BOOL)shouldPerformZoomingImageTransitionFromImageElement:(id)a3 toImageAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[VideosExtrasSlideshowTemplateViewController slideshowViewController](self, "slideshowViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isAnimatingTransition") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[VideosExtrasSlideshowTemplateViewController imageElements](self, "imageElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") <= a4)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bestURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bestURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "isEqual:", v12);

    }
  }

  return v8;
}

- (void)_firstImageLoadedHideNavigationBar
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (!self->_preventNavbarAutohide)
  {
    self->_preventNavbarAutohide = 1;
    -[VideosExtrasSlideshowTemplateViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v6 = v3;
      v5 = objc_msgSend(v3, "isNavigationBarHidden");
      v4 = v6;
      if ((v5 & 1) == 0)
      {
        -[VideosExtrasSlideshowTemplateViewController _toggleVisibilityOfNavigationBar](self, "_toggleVisibilityOfNavigationBar");
        v4 = v6;
      }
    }

  }
}

- (void)_toggleVisibilityOfNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  self->_overlayHidden ^= 1u;
  -[VideosExtrasSlideshowTemplateViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "_setNavigationBarHidden:edge:duration:", self->_overlayHidden, 15, 0.3);
    -[VideosExtrasSlideshowTemplateViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    self->_preventNavbarAutohide = 1;
  }
  -[VideosExtrasTemplateViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extrasRootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainMenuBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", self->_overlayHidden);

}

- (VideosExtrasSlideshowViewController)slideshowViewController
{
  return self->_slideshowViewController;
}

- (void)setSlideshowViewController:(id)a3
{
  objc_storeStrong((id *)&self->_slideshowViewController, a3);
}

- (NSArray)imageElements
{
  return self->_imageElements;
}

- (void)setImageElements:(id)a3
{
  objc_storeStrong((id *)&self->_imageElements, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageElements, 0);
  objc_storeStrong((id *)&self->_slideshowViewController, 0);
}

@end
