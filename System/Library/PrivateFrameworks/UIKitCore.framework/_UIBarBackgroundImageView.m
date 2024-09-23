@implementation _UIBarBackgroundImageView

- (id)image
{
  void *v2;
  objc_super v4;

  if (self->_topStripView)
  {
    -[UIImageView image](self->_customImageContainer, "image");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIBarBackgroundImageView;
    -[UIImageView image](&v4, sel_image);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setImage:(id)a3
{
  objc_super v3;

  if (self->_topStripView)
  {
    -[UIImageView setImage:](self->_customImageContainer, "setImage:", a3);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)_UIBarBackgroundImageView;
    -[UIImageView setImage:](&v3, sel_setImage_, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageContainer, 0);
  objc_storeStrong((id *)&self->_topStripView, 0);
}

- (id)topStripView
{
  return self->_topStripView;
}

- (void)updateTopStripViewCreateIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UIView *topStripView;
  _UIBarBackgroundTopCurtainView *v18;
  UIView *v19;
  _UIBarBackgroundCustomImageContainer *v20;
  UIImageView *customImageContainer;
  _BOOL4 v22;
  double v23;
  void *v24;
  objc_super v25;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultStatusBarHeightInOrientation:", 1);
  v14 = v13;

  v15 = v10 - (v14 + 0.0);
  -[_UIBarBackgroundImageView image](self, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  topStripView = self->_topStripView;
  if (!topStripView)
  {
    v18 = -[UIView initWithFrame:]([_UIBarBackgroundTopCurtainView alloc], "initWithFrame:", v4, v6, v8, v14);
    v19 = self->_topStripView;
    self->_topStripView = &v18->super;

    -[UIView setAutoresizingMask:](self->_topStripView, "setAutoresizingMask:", 2);
    -[UIView addSubview:](self, "addSubview:", self->_topStripView);
    v20 = -[UIImageView initWithFrame:]([_UIBarBackgroundCustomImageContainer alloc], "initWithFrame:", v4 + 0.0, v6 + v14, v8, v15);
    customImageContainer = self->_customImageContainer;
    self->_customImageContainer = &v20->super;

    -[UIView setAutoresizingMask:](self->_customImageContainer, "setAutoresizingMask:", 2);
    -[UIImageView setImage:](self->_customImageContainer, "setImage:", v16);
    v25.receiver = self;
    v25.super_class = (Class)_UIBarBackgroundImageView;
    -[UIImageView setImage:](&v25, sel_setImage_, 0);
    -[UIView addSubview:](self, "addSubview:", self->_customImageContainer);
    topStripView = self->_topStripView;
  }
  v22 = -[_UIBarBackgroundImageView isTranslucent](self, "isTranslucent");
  v23 = 1.0;
  if (v22)
    v23 = 0.96;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](topStripView, "setBackgroundColor:", v24);

  -[UIView setFrame:](self->_topStripView, "setFrame:", v4, v6, v8, v14);
  -[UIImageView setFrame:](self->_customImageContainer, "setFrame:", v4 + 0.0, v6 + v14, v8, v15);

}

- (void)removeTopStripView
{
  void *v3;
  UIView *topStripView;
  UIView *v5;
  UIImageView *customImageContainer;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  -[_UIBarBackgroundImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  topStripView = self->_topStripView;
  if (topStripView)
  {
    -[UIView removeFromSuperview](topStripView, "removeFromSuperview");
    v5 = self->_topStripView;
    self->_topStripView = 0;

    v19.receiver = self;
    v19.super_class = (Class)_UIBarBackgroundImageView;
    -[UIImageView setImage:](&v19, sel_setImage_, v3);
    -[UIView removeFromSuperview](self->_customImageContainer, "removeFromSuperview");
    customImageContainer = self->_customImageContainer;
    self->_customImageContainer = 0;

  }
  if (v3)
  {
    objc_msgSend(v3, "size");
    v8 = v7;
    -[UIView bounds](self, "bounds");
    if (v8 < v9)
    {
      objc_msgSend(v3, "capInsets");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      if ((objc_msgSend(v3, "_isResizable") & 1) == 0)
      {
        objc_msgSend(v3, "size");
        if (v16 > 1.0)
        {
          objc_msgSend(v3, "size");
          objc_msgSend(v3, "resizableImageWithCapInsets:", v17 + -1.0, v11, v13, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIBarBackgroundImageView setImage:](self, "setImage:", v18);

        }
      }
    }
  }

}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->_translucent = a3;
}

@end
