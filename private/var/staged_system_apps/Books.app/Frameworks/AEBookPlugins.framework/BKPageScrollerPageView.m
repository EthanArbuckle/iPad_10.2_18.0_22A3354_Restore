@implementation BKPageScrollerPageView

- (BKPageScrollerPageView)initWithFrame:(CGRect)a3 pageNumber:(unint64_t)a4 navigationDelegate:(id)a5 thumbnailingDelegate:(id)a6 imageResizerDelegate:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  BKPageScrollerPageView *v18;
  BKPageScrollerPageView *v19;
  id WeakRetained;
  UIImageView *v21;
  UIImageView *thumbnailView;
  void *v23;
  id inited;
  double v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  BKContentViewController *contentViewController;
  void *v32;
  _QWORD v34[4];
  id v35;
  id v36[3];
  id from;
  id location;
  objc_super v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v39.receiver = self;
  v39.super_class = (Class)BKPageScrollerPageView;
  v18 = -[BKPageScrollerPageView initWithFrame:](&v39, "initWithFrame:", x, y, width, height);
  v19 = v18;
  if (v18)
  {
    v18->_pageNumber = a4;
    objc_storeWeak((id *)&v18->_navigationDelegate, v15);
    objc_storeWeak((id *)&v19->_thumbnailingDelegate, v16);
    objc_storeWeak((id *)&v19->_imageResizerDelegate, v17);
    WeakRetained = objc_loadWeakRetained((id *)&v19->_thumbnailingDelegate);

    if (WeakRetained)
    {
      v21 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGPointZero.x, CGPointZero.y, width, height);
      thumbnailView = v19->_thumbnailView;
      v19->_thumbnailView = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      -[UIImageView setBackgroundColor:](v19->_thumbnailView, "setBackgroundColor:", v23);

      -[UIImageView setAutoresizingMask:](v19->_thumbnailView, "setAutoresizingMask:", 18);
      -[BKPageScrollerPageView addSubview:](v19, "addSubview:", v19->_thumbnailView);
      objc_initWeak(&location, v19->_thumbnailView);
      inited = objc_initWeak(&from, v19);
      v25 = CGSizeScaleToScreen(inited, width, height);
      v27 = v26;
      v28 = objc_loadWeakRetained((id *)&v19->_thumbnailingDelegate);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_9EDF8;
      v34[3] = &unk_1C0EE8;
      objc_copyWeak(&v35, &location);
      objc_copyWeak(v36, &from);
      v36[1] = *(id *)&v25;
      v36[2] = v27;
      objc_msgSend(v28, "thumbnailingGenerateImageForPageNumber:size:callbackBlock:", a4, v34, v25, *(double *)&v27);

      objc_destroyWeak(v36);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      v29 = objc_loadWeakRetained((id *)&v19->_navigationDelegate);
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "contentViewControllerForPageNumber:", v19->_pageNumber));
      contentViewController = v19->_contentViewController;
      v19->_contentViewController = (BKContentViewController *)v30;

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](v19->_contentViewController, "view"));
      -[BKPageScrollerPageView addSubview:](v19, "addSubview:", v32);

    }
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, BKContentReadyNotification, self->_contentViewController);

  v4.receiver = self;
  v4.super_class = (Class)BKPageScrollerPageView;
  -[BKPageScrollerPageView dealloc](&v4, "dealloc");
}

- (void)teardown
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerPageView _resizeOperation](self, "_resizeOperation"));
  objc_msgSend(v3, "cancel");

  -[BKPageScrollerPageView set_resizeOperation:](self, "set_resizeOperation:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerPageView _thumbnailingOperation](self, "_thumbnailingOperation"));
  objc_msgSend(v4, "cancel");

  -[BKPageScrollerPageView set_thumbnailingOperation:](self, "set_thumbnailingOperation:", 0);
  objc_storeWeak((id *)&self->_navigationDelegate, 0);
  objc_storeWeak((id *)&self->_thumbnailingDelegate, 0);
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPageScrollerPageView;
  -[BKPageScrollerPageView didMoveToSuperview](&v4, "didMoveToSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerPageView superview](self, "superview"));

  if (!v3)
    -[BKPageScrollerPageView _teardownContentView](self, "_teardownContentView");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  BKPageScrollerThumbnailingDelegate **p_thumbnailingDelegate;
  id WeakRetained;
  id v8;
  double v9;
  double v10;
  BKContentViewController *contentViewController;
  void *v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  p_thumbnailingDelegate = &self->_thumbnailingDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailingDelegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_thumbnailingDelegate);
    objc_msgSend(v8, "thumbnailingContentSizeForPageNumber:", self->_pageNumber);
    goto LABEL_6;
  }
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](contentViewController, "view"));
    v8 = v12;
    if (!v12)
    {
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/EPub/PictureBook/Views/BKPageScrollerPageView.m", 117, "-[BKPageScrollerPageView sizeThatFits:]", "contentView", 0);
      goto LABEL_7;
    }
    objc_msgSend(v12, "sizeThatFits:", width, height);
LABEL_6:
    width = v9;
    height = v10;
LABEL_7:

  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  v8.receiver = self;
  v8.super_class = (Class)BKPageScrollerPageView;
  -[BKPageScrollerPageView layoutSubviews](&v8, "layoutSubviews");
  -[BKPageScrollerPageView bounds](self, "bounds");
  v10 = CGRectIntegral(v9);
  -[UIImageView setFrame:](self->_thumbnailView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  -[BKPageScrollerPageView bounds](self, "bounds");
  v12 = CGRectIntegral(v11);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_contentViewController, "view"));
  objc_msgSend(v7, "setFrame:", x, y, width, height);

}

- (id)snapshot
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_thumbnailView, "image"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_thumbnailView, "image"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController snapshot](self->_contentViewController, "snapshot"));
  return v4;
}

- (void)setScrollState:(int)a3
{
  id WeakRetained;
  BKContentViewController *contentViewController;
  id v7;
  BKContentViewController *v8;
  BKContentViewController *v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_scrollState != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailingDelegate);

    if (WeakRetained)
    {
      if (a3 == 3)
      {
        -[BKPageScrollerPageView _teardownContentView](self, "_teardownContentView");
      }
      else if (a3 == 2)
      {
        contentViewController = self->_contentViewController;
        if (contentViewController)
        {
          if (!-[BKContentViewController isLoading](contentViewController, "isLoading"))
            -[BKPageScrollerPageView _exposeContentView](self, "_exposeContentView");
        }
        else
        {
          v7 = objc_loadWeakRetained((id *)&self->_navigationDelegate);
          v8 = (BKContentViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentViewControllerForPageNumber:", self->_pageNumber));
          v9 = self->_contentViewController;
          self->_contentViewController = v8;

          v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_contentViewController, "view"));
          -[BKPageScrollerPageView addSubview:](self, "addSubview:", v10);

          if (-[BKContentViewController isLoading](self->_contentViewController, "isLoading"))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_contentViewController, "view"));
            objc_msgSend(v11, "setAlpha:", 0.0);

            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
            objc_msgSend(v12, "addObserver:selector:name:object:", self, "_contentIsReady:", BKContentReadyNotification, self->_contentViewController);

          }
          else
          {
            -[BKPageScrollerPageView _exposeContentView](self, "_exposeContentView");
          }
          -[BKPageScrollerPageView setNeedsLayout](self, "setNeedsLayout");
        }
      }
    }
    self->_scrollState = a3;
  }
}

- (UIView)contentView
{
  return (UIView *)-[BKContentViewController view](self->_contentViewController, "view");
}

- (void)_contentIsReady:(id)a3
{
  if (self->_scrollState == 2)
    -[BKPageScrollerPageView _exposeContentView](self, "_exposeContentView", a3);
}

- (void)_exposeContentView
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9F648;
  block[3] = &unk_1BEA38;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_teardownContentView
{
  BKContentViewController *contentViewController;
  void *v4;
  void *v5;
  void *v6;
  BKPageScrollerPageView *v7;
  void *v8;
  BKContentViewController *v9;
  id WeakRetained;

  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](contentViewController, "view"));
    objc_msgSend(v4, "setAlpha:", 1.0);

    -[UIImageView setAlpha:](self->_thumbnailView, "setAlpha:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, BKContentReadyNotification, self->_contentViewController);

    if (-[BKContentViewController isViewLoaded](self->_contentViewController, "isViewLoaded"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_contentViewController, "view"));
      v7 = (BKPageScrollerPageView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

      if (v7 == self)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_contentViewController, "view"));
        objc_msgSend(v8, "removeFromSuperview");

      }
    }
    v9 = self->_contentViewController;
    self->_contentViewController = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    objc_msgSend(WeakRetained, "pageNavigationDidRemoveContentForPageNumber:", self->_pageNumber);

  }
}

- (int)scrollState
{
  return self->_scrollState;
}

- (BKPageNavigationDelegate)navigationDelegate
{
  return (BKPageNavigationDelegate *)objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (BKPageScrollerThumbnailingDelegate)thumbnailingDelegate
{
  return (BKPageScrollerThumbnailingDelegate *)objc_loadWeakRetained((id *)&self->_thumbnailingDelegate);
}

- (void)setThumbnailingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailingDelegate, a3);
}

- (BKImageResizerDelegate)imageResizerDelegate
{
  return (BKImageResizerDelegate *)objc_loadWeakRetained((id *)&self->_imageResizerDelegate);
}

- (void)setImageResizerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageResizerDelegate, a3);
}

- (NSOperation)_resizeOperation
{
  return self->__resizeOperation;
}

- (void)set_resizeOperation:(id)a3
{
  objc_storeStrong((id *)&self->__resizeOperation, a3);
}

- (NSOperation)_thumbnailingOperation
{
  return self->__thumbnailingOperation;
}

- (void)set_thumbnailingOperation:(id)a3
{
  objc_storeStrong((id *)&self->__thumbnailingOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__thumbnailingOperation, 0);
  objc_storeStrong((id *)&self->__resizeOperation, 0);
  objc_destroyWeak((id *)&self->_imageResizerDelegate);
  objc_destroyWeak((id *)&self->_thumbnailingDelegate);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
