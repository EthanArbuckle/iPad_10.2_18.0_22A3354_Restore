@implementation SXFullscreenImageView

- (SXFullscreenImageView)initWithContentView:(id)a3 viewIndex:(unint64_t)a4
{
  id v7;
  SXFullscreenImageView *v8;
  SXFullscreenImageView *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXFullscreenImageView;
  v8 = -[SXFullscreenImageView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contentView, a3);
    v9->_viewIndex = a4;
    -[SXFullscreenImageView setup](v9, "setup");
  }

  return v9;
}

- (void)setup
{
  id v3;
  void *v4;
  void *v5;
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

  v3 = objc_alloc(MEMORY[0x24BDF6D50]);
  -[SXFullscreenImageView bounds](self, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[SXFullscreenImageView setScrollView:](self, "setScrollView:", v4);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollsToTop:", 0);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEnabled:", 0);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBounces:", 1);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlwaysBounceHorizontal:", 1);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlwaysBounceVertical:", 1);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinimumZoomScale:", 1.0);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaximumZoomScale:", 2.0);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setZoomScale:", 1.0);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShowsHorizontalScrollIndicator:", 0);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShowsVerticalScrollIndicator:", 0);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenImageView contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenImageView addSubview:](self, "addSubview:", v18);

  -[SXFullscreenImageView setupGestures](self, "setupGestures");
}

- (void)setupGestures
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleDoubleTap_);
  -[SXFullscreenImageView setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", v3);

  -[SXFullscreenImageView doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[SXFullscreenImageView doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfTapsRequired:", 2);

  -[SXFullscreenImageView doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenImageView addGestureRecognizer:](self, "addGestureRecognizer:", v6);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenImageView;
  -[SXFullscreenImageView layoutSubviews](&v4, sel_layoutSubviews);
  -[SXFullscreenImageView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenImageView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)handleDoubleTap:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  void *v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22 = a3;
  if (-[SXFullscreenImageView isZooming](self, "isZooming"))
  {
    -[SXFullscreenImageView scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 1.0;
    v7 = 1;
  }
  else
  {
    objc_msgSend(v22, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    v14 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[SXFullscreenImageView scrollView](self, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v16 = CGRectGetWidth(v23) * 0.5;

    -[SXFullscreenImageView scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v18 = CGRectGetHeight(v24) * 0.5;

    v25.origin.x = v14;
    v25.origin.y = v13;
    v25.size.width = v16;
    v25.size.height = v18;
    v19 = v10 - CGRectGetMidX(v25);
    v26.origin.x = v19;
    v26.origin.y = v13;
    v26.size.width = v16;
    v26.size.height = v18;
    v20 = v12 - CGRectGetMidY(v26);
    -[SXFullscreenImageView scrollView](self, "scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "zoomToRect:animated:", 1, v19, v20, v16, v18);

    -[SXFullscreenImageView scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 2.0;
    v7 = 0;
  }
  objc_msgSend(v4, "setZoomScale:animated:", v7, v6);

}

- (void)setIsZooming:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a3;
  if (-[SXFullscreenImageView isZooming](self, "isZooming") != a3)
  {
    -[SXFullscreenImageView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setScrollEnabled:", 1);

      -[SXFullscreenImageView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[SXFullscreenImageView delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fullScreenImageViewDidStartZooming:", self);
LABEL_7:

      }
    }
    else
    {
      objc_msgSend(v5, "setScrollEnabled:", 0);

      -[SXFullscreenImageView delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[SXFullscreenImageView delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fullScreenImageViewDidStopZooming:", self);
        goto LABEL_7;
      }
    }
    self->_isZooming = v3;
  }
}

- (void)showLoadingIndicator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  v3 = a3;
  -[SXFullscreenImageView activityIndicator](self, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 1);
      -[SXFullscreenImageView setActivityIndicator:](self, "setActivityIndicator:", v8);

      -[SXFullscreenImageView activityIndicator](self, "activityIndicator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXFullscreenImageView frame](self, "frame");
      v10 = CGRectGetWidth(v13) * 0.5;
      -[SXFullscreenImageView frame](self, "frame");
      objc_msgSend(v9, "setCenter:", v10, CGRectGetHeight(v14) * 0.5);

      -[SXFullscreenImageView activityIndicator](self, "activityIndicator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXFullscreenImageView addSubview:](self, "addSubview:", v11);

      -[SXFullscreenImageView activityIndicator](self, "activityIndicator");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startAnimating");

    }
  }
  else
  {
    objc_msgSend(v5, "stopAnimating");

    -[SXFullscreenImageView activityIndicator](self, "activityIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[SXFullscreenImageView setActivityIndicator:](self, "setActivityIndicator:", 0);
  }
}

- (BOOL)allowsDismissal
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  double v6;

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isZooming") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[SXFullscreenImageView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoomScale");
    if (v6 <= 1.0)
      v4 = !-[SXFullscreenImageView isZooming](self, "isZooming");
    else
      LOBYTE(v4) = 0;

  }
  return v4;
}

- (void)setContentViewFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXFullscreenImageView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoomScale");
  v10 = v9;

  if (v10 != 1.0)
  {
    -[SXFullscreenImageView scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setZoomScale:animated:", 0, 1.0);

  }
  self->_contentViewFrame.origin.x = x;
  self->_contentViewFrame.origin.y = y;
  self->_contentViewFrame.size.width = width;
  self->_contentViewFrame.size.height = height;
  -[SXFullscreenImageView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenImageView contentViewFrame](self, "contentViewFrame");
  objc_msgSend(v12, "setFrame:");

  -[SXFullscreenImageView scrollView](self, "scrollView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenImageView scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v16, "setContentSize:", v14, v15);

}

- (void)scrollViewDidZoom:(id)a3
{
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  objc_msgSend(a3, "zoomScale");
  -[SXFullscreenImageView setIsZooming:](self, "setIsZooming:", v4 > 1.0);
  -[SXFullscreenImageView contentView](self, "contentView");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "frame");
  v7 = v6;
  -[SXFullscreenImageView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  LOBYTE(v5) = -[SXFullscreenImageView isZooming](self, "isZooming");
  -[SXFullscreenImageView contentViewFrame](self, "contentViewFrame");
  v12 = v11;
  v14 = v13;
  -[SXFullscreenImageView contentViewFrame](self, "contentViewFrame");
  if ((v5 & 1) != 0)
  {
    v17 = v16;
    v18 = v7 * 0.5;
    v19 = v10 * 0.5;
    -[SXFullscreenImageView bounds](self, "bounds");
    v21 = v20;
    -[SXFullscreenImageView bounds](self, "bounds");
    if (v14 <= v17)
    {
      if (v21 > v22)
      {
        -[SXFullscreenImageView scrollView](self, "scrollView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bounds");
        v32 = v31;
        -[SXFullscreenImageView scrollView](self, "scrollView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "contentSize");
        v18 = v18 + (v32 - v33) * 0.5;
        goto LABEL_8;
      }
    }
    else if (v21 < v22)
    {
      -[SXFullscreenImageView scrollView](self, "scrollView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v25 = v24;
      -[SXFullscreenImageView scrollView](self, "scrollView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contentSize");
      v19 = v19 + (v25 - v27) * 0.5;
LABEL_8:

    }
  }
  else
  {
    v18 = v12 + v15 * 0.5;
    -[SXFullscreenImageView contentViewFrame](self, "contentViewFrame");
    v29 = v28;
    -[SXFullscreenImageView contentViewFrame](self, "contentViewFrame");
    v19 = v29 + v30 * 0.5;
  }
  -[SXFullscreenImageView contentView](self, "contentView");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setCenter:", v18, v19);

}

- (SXFullscreenImageViewDelegate)delegate
{
  return (SXFullscreenImageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXImageView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CGRect)contentViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentViewFrame.origin.x;
  y = self->_contentViewFrame.origin.y;
  width = self->_contentViewFrame.size.width;
  height = self->_contentViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (unint64_t)viewIndex
{
  return self->_viewIndex;
}

- (BOOL)isZooming
{
  return self->_isZooming;
}

- (unint64_t)activeGestureCount
{
  return self->_activeGestureCount;
}

- (void)setActiveGestureCount:(unint64_t)a3
{
  self->_activeGestureCount = a3;
}

- (CGPoint)currentTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentTranslation.x;
  y = self->_currentTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentTranslation:(CGPoint)a3
{
  self->_currentTranslation = a3;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_currentScale = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
