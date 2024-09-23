@implementation VideosExtrasGalleryTemplateViewController

- (BOOL)showsPlaceholder
{
  return 0;
}

- (id)contentScrollView
{
  return -[VideosExtrasGridElementViewController contentScrollView](self->_gridViewController, "contentScrollView");
}

- (id)templateElement
{
  void *v2;
  void *v3;

  -[VideosExtrasTemplateViewController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  VideosExtrasGridElementViewController *v9;
  void *v10;
  void *v11;
  VideosExtrasGridElementViewController *v12;
  VideosExtrasGridElementViewController *gridViewController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  VideosExtrasBannerController *v26;
  void *v27;
  void *v28;
  VideosExtrasBannerController *v29;
  VideosExtrasBannerController *bannerController;
  VideosExtrasBannerController *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)VideosExtrasGalleryTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidLoad](&v34, sel_viewDidLoad);
  -[VideosExtrasGalleryTemplateViewController templateElement](self, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "background");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addObject:", v4);
  -[VideosExtrasTemplateViewController configureBackgroundWithElements:](self, "configureBackgroundWithElements:", v6);
  -[VideosExtrasGalleryTemplateViewController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentBanner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasElementViewController _configureBannerWithElement:](self, "_configureBannerWithElement:", v8);

  v9 = [VideosExtrasGridElementViewController alloc];
  -[VideosExtrasGalleryTemplateViewController templateElement](self, "templateElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "grid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VideosExtrasGridElementViewController initWithViewElement:](v9, "initWithViewElement:", v11);
  gridViewController = self->_gridViewController;
  self->_gridViewController = v12;

  +[VideosExtrasGridElementViewController smallGalleryStyle](VideosExtrasGridElementViewController, "smallGalleryStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController setSmallStyle:](self->_gridViewController, "setSmallStyle:", v14);

  +[VideosExtrasGridElementViewController mediumGalleryStyle](VideosExtrasGridElementViewController, "mediumGalleryStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController setMediumStyle:](self->_gridViewController, "setMediumStyle:", v15);

  +[VideosExtrasGridElementViewController largeGalleryStyle](VideosExtrasGridElementViewController, "largeGalleryStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController setLargeStyle:](self->_gridViewController, "setLargeStyle:", v16);

  +[VideosExtrasGridElementViewController extraLargeGalleryStyle](VideosExtrasGridElementViewController, "extraLargeGalleryStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController setExtraLargeStyle:](self->_gridViewController, "setExtraLargeStyle:", v17);

  +[VideosExtrasGridElementViewController wideGalleryStyle](VideosExtrasGridElementViewController, "wideGalleryStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController setWideStyle:](self->_gridViewController, "setWideStyle:", v18);

  -[VideosExtrasGalleryTemplateViewController addChildViewController:](self, "addChildViewController:", self->_gridViewController);
  -[VideosExtrasGalleryTemplateViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController view](self->_gridViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[VideosExtrasGridElementViewController view](self->_gridViewController, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGalleryTemplateViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintsByAttachingView:toView:alongEdges:insets:", v22, v23, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasGalleryTemplateViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraints:", v24);

  -[VideosExtrasGridElementViewController didMoveToParentViewController:](self->_gridViewController, "didMoveToParentViewController:", self);
  v26 = [VideosExtrasBannerController alloc];
  -[VideosExtrasGalleryTemplateViewController templateElement](self, "templateElement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "documentBanner");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[VideosExtrasBannerController initWithBannerElement:](v26, "initWithBannerElement:", v28);
  bannerController = self->_bannerController;
  self->_bannerController = v29;

  -[VideosExtrasBannerController setVignetteType:](self->_bannerController, "setVignetteType:", 4);
  v31 = self->_bannerController;
  -[VideosExtrasGridElementViewController view](self->_gridViewController, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController contentScrollView](self->_gridViewController, "contentScrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasBannerController installBannerOnView:anchoredToScrollView:](v31, "installBannerOnView:anchoredToScrollView:", v32, v33);

}

- (void)_prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasGalleryTemplateViewController;
  -[VideosExtrasElementViewController _prepareLayout](&v3, sel__prepareLayout);
  -[VideosExtrasGridElementViewController _prepareLayout](self->_gridViewController, "_prepareLayout");
}

- (unint64_t)selectedItemIndex
{
  return self->_selectedItemIndex;
}

- (void)setSelectedItemIndex:(unint64_t)a3
{
  self->_selectedItemIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridViewController, 0);
  objc_storeStrong((id *)&self->_bannerController, 0);
}

@end
