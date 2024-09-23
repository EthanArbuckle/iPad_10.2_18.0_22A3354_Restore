@implementation BKPictureBookCurlContainerView

- (BKPictureBookCurlContainerView)initWithFrame:(CGRect)a3
{
  BKPictureBookCurlContainerView *v3;
  BKPictureBookCurlPageView *v4;
  double y;
  double width;
  double height;
  BKPictureBookCurlPageView *v8;
  BKPictureBookCurlPageView *leftView;
  BKPictureBookCurlPageView *v10;
  BKPictureBookCurlPageView *rightView;
  BKPictureBookCurlContainerView *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookCurlContainerView;
  v3 = -[BKPictureBookCurlContainerView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [BKPictureBookCurlPageView alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = -[BKPictureBookCurlPageView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    leftView = v3->_leftView;
    v3->_leftView = v8;

    v10 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    rightView = v3->_rightView;
    v3->_rightView = v10;

    -[BKPictureBookCurlPageView setRight:](v3->_rightView, "setRight:", 1);
    -[BKPictureBookCurlContainerView addSubview:](v3, "addSubview:", v3->_leftView);
    -[BKPictureBookCurlContainerView addSubview:](v3, "addSubview:", v3->_rightView);
    v3->_scale = 1.0;
    v12 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BKPictureBookCurlContainerView reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookCurlContainerView;
  -[BKPictureBookCurlContainerView dealloc](&v3, "dealloc");
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[BKPictureBookCurlContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)BKPictureBookCurlContainerView;
  -[BKPictureBookCurlContainerView layoutSubviews](&v17, "layoutSubviews");
  -[BKPictureBookCurlContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9 * 0.5;
  -[BKPictureBookCurlPageView setFrame:](self->_leftView, "setFrame:");
  -[BKPictureBookCurlContainerView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15 * 0.5;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v10;
  v18.size.height = v8;
  -[BKPictureBookCurlPageView setFrame:](self->_rightView, "setFrame:", CGRectGetMaxX(v18), v12, v16, v14);
}

- (void)setLeftImage:(id)a3
{
  double scale;
  BKPictureBookCurlPageView *leftView;
  id v6;

  scale = self->_scale;
  leftView = self->_leftView;
  v6 = a3;
  -[BKPictureBookCurlPageView setScale:](leftView, "setScale:", scale);
  -[BKPictureBookCurlPageView setHidden:](self->_leftView, "setHidden:", 0);
  -[BKPictureBookCurlPageView setImage:](self->_leftView, "setImage:", v6);

}

- (void)setRightImage:(id)a3
{
  double scale;
  BKPictureBookCurlPageView *rightView;
  id v6;

  scale = self->_scale;
  rightView = self->_rightView;
  v6 = a3;
  -[BKPictureBookCurlPageView setScale:](rightView, "setScale:", scale);
  -[BKPictureBookCurlPageView setHidden:](self->_rightView, "setHidden:", 0);
  -[BKPictureBookCurlPageView setImage:](self->_rightView, "setImage:", v6);

  -[BKPictureBookCurlPageView addGutter:](self->_rightView, "addGutter:", 1);
}

- (void)setDrawsSpine:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_drawsSpine = a3;
  -[BKPictureBookCurlPageView setDrawsSpine:](self->_leftView, "setDrawsSpine:");
  -[BKPictureBookCurlPageView setDrawsSpine:](self->_rightView, "setDrawsSpine:", v3);
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  objc_super v7;
  objc_super v8;

  v6 = a3;
  if (*(_OWORD *)&self->_leftView == 0)
    -[BKPictureBookCurlContainerView insertSubview:atIndex:](&v8, "insertSubview:atIndex:", v6, a4, v7.receiver, v7.super_class, self, BKPictureBookCurlContainerView);
  else
    -[BKPictureBookCurlContainerView insertSubview:atIndex:](&v7, "insertSubview:atIndex:", v6, a4 + 3, self, BKPictureBookCurlContainerView, v8.receiver, v8.super_class);

}

- (void)killCurlingSourceViews
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  BKPictureBookCurlPageView *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlContainerView subviews](self, "subviews", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(BKPictureBookCurlPageView **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7);
        if (v8 != self->_leftView && v8 != self->_rightView)
          -[BKPictureBookCurlPageView removeFromSuperview](v8, "removeFromSuperview");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)reset
{
  -[BKPictureBookCurlContainerView killCurlingSourceViews](self, "killCurlingSourceViews");
  -[BKPictureBookCurlContainerView setHidden:](self, "setHidden:", 1);
  -[BKPictureBookCurlPageView setHidden:](self->_leftView, "setHidden:", 1);
  -[BKPictureBookCurlPageView setHidden:](self->_rightView, "setHidden:", 1);
  -[BKPictureBookCurlPageView reset](self->_leftView, "reset");
  -[BKPictureBookCurlPageView reset](self->_rightView, "reset");
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)drawsSpine
{
  return self->_drawsSpine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
}

@end
