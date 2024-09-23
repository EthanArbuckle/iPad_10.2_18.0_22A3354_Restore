@implementation SKUISlideshowItemViewController

- (SKUISlideshowItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SKUISlideshowItemViewController *v8;
  SKUISlideshowItemViewController *v9;
  SKUISlideshowImageScrollView *v10;
  SKUISlideshowImageScrollView *imageScrollView;
  SKUISlideshowImageScrollView *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISlideshowItemViewController initWithNibName:bundle:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUISlideshowItemViewController;
  v8 = -[SKUISlideshowItemViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_indexInCollection = 0;
    v10 = objc_alloc_init(SKUISlideshowImageScrollView);
    imageScrollView = v9->_imageScrollView;
    v9->_imageScrollView = v10;

    -[SKUISlideshowImageScrollView setDelegate:](v9->_imageScrollView, "setDelegate:", v9);
    -[SKUISlideshowImageScrollView setAutoresizingMask:](v9->_imageScrollView, "setAutoresizingMask:", 18);
    v12 = v9->_imageScrollView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISlideshowImageScrollView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v9->_zoomingGestureThresholdBroken = 0;
    v9->_lastContentOffset = (CGPoint)*MEMORY[0x1E0C9D538];
    v9->_lastZoomScale = 0.0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUISlideshowImageScrollView setDelegate:](self->_imageScrollView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUISlideshowItemViewController;
  -[SKUISlideshowItemViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  SKUISlideshowImageScrollView *imageScrollView;
  void *v5;
  UIView *loadingView;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SKUISlideshowItemViewController;
  -[SKUISlideshowItemViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[SKUISlideshowItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  imageScrollView = self->_imageScrollView;
  objc_msgSend(v3, "bounds");
  -[SKUISlideshowImageScrollView setFrame:](imageScrollView, "setFrame:");
  objc_msgSend(v3, "addSubview:", self->_imageScrollView);
  -[SKUISlideshowItemViewController itemImage](self, "itemImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    loadingView = self->_loadingView;
    if (!loadingView)
    {
      v7 = -[SKUISlideshowItemViewController _newLoadingView](self, "_newLoadingView");
      v8 = self->_loadingView;
      self->_loadingView = v7;

      v9 = self->_loadingView;
      objc_msgSend(v3, "center");
      -[UIView setCenter:](v9, "setCenter:");
      loadingView = self->_loadingView;
    }
    objc_msgSend(v3, "addSubview:", loadingView);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel__pinchGestureAction_);
  objc_msgSend(v10, "setDelegate:", self);
  -[SKUISlideshowImageScrollView addGestureRecognizer:](self->_imageScrollView, "addGestureRecognizer:", v10);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUISlideshowItemViewController;
  -[SKUISlideshowItemViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SKUISlideshowImageScrollView resetZoomScale](self->_imageScrollView, "resetZoomScale");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (UIImage)itemImage
{
  return -[SKUISlideshowImageScrollView image](self->_imageScrollView, "image");
}

- (void)setItemImage:(id)a3
{
  UIView *loadingView;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  id v9;

  -[SKUISlideshowImageScrollView setImage:](self->_imageScrollView, "setImage:");
  loadingView = self->_loadingView;
  if (a3)
  {
    if (loadingView)
    {
      -[UIView removeFromSuperview](loadingView, "removeFromSuperview");
      v6 = self->_loadingView;
      self->_loadingView = 0;

    }
  }
  else
  {
    if (!loadingView)
    {
      v7 = -[SKUISlideshowItemViewController _newLoadingView](self, "_newLoadingView");
      v8 = self->_loadingView;
      self->_loadingView = v7;

    }
    -[SKUISlideshowItemViewController view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_loadingView);

  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return -[SKUISlideshowImageScrollView imageView](self->_imageScrollView, "imageView", a3);
}

- (BOOL)_gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (id)_newLoadingView
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  SKUIClientContext *clientContext;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double MaxX;
  double MaxY;
  double v24;
  double v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 1);
  objc_msgSend(v3, "addSubview:", v5);
  objc_msgSend(v5, "startAnimating");
  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  clientContext = self->_clientContext;
  if (clientContext)
    -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SCREENSHOTS_LOADING"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SCREENSHOTS_LOADING"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v11);

  objc_msgSend(v6, "sizeToFit");
  objc_msgSend(v5, "bounds");
  v13 = v12 + 5.0;
  objc_msgSend(v5, "bounds");
  v15 = v14 * 0.5;
  objc_msgSend(v6, "bounds");
  v17 = v15 - v16 * 0.5;
  objc_msgSend(v6, "bounds");
  v19 = v18;
  objc_msgSend(v6, "bounds");
  v21 = v20;
  objc_msgSend(v6, "setFrame:", v13, v17, v19);
  objc_msgSend(v3, "addSubview:", v6);
  v27.origin.x = v13;
  v27.origin.y = v17;
  v27.size.width = v19;
  v27.size.height = v21;
  MaxX = CGRectGetMaxX(v27);
  objc_msgSend(v5, "frame");
  MaxY = CGRectGetMaxY(v28);
  v29.origin.x = v13;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  v24 = CGRectGetMaxY(v29);
  if (MaxY >= v24)
    v25 = MaxY;
  else
    v25 = v24;
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, MaxX, v25);

  return v3;
}

- (void)_pinchGestureAction:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  -[SKUISlideshowImageScrollView contentOffset](self->_imageScrollView, "contentOffset");
  self->_lastContentOffset.x = v4;
  self->_lastContentOffset.y = v5;
  -[SKUISlideshowImageScrollView zoomScale](self->_imageScrollView, "zoomScale");
  self->_lastZoomScale = v6;
  if (objc_msgSend(v12, "state") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "slideshowItemViewControllerDidBeginPinchGesture:", self);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v12, "state") == 2)
  {
    -[SKUISlideshowImageScrollView zoomScale](self->_imageScrollView, "zoomScale");
    v9 = v8;
    -[SKUISlideshowImageScrollView minimumZoomScale](self->_imageScrollView, "minimumZoomScale");
    v11 = v9 / v10;
    if (v9 / v10 != 1.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "slideshowItemViewControllerDidDismissWithPinchGesture:ratio:", self, (v11 + -0.550000012) / -0.0999999642 + 1.0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUISlideshowItemViewControllerDelegate)delegate
{
  return (SKUISlideshowItemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUISlideshowImageScrollView)imageScrollView
{
  return self->_imageScrollView;
}

- (int64_t)indexInCollection
{
  return self->_indexInCollection;
}

- (void)setIndexInCollection:(int64_t)a3
{
  self->_indexInCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISlideshowItemViewController initWithNibName:bundle:]";
}

@end
