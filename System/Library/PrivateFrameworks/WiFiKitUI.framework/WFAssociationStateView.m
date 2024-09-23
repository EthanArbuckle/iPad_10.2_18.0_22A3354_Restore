@implementation WFAssociationStateView

- (void)setState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3)
    {
      if (a3 != 2)
      {
        if (a3 != 1)
        {
LABEL_12:
          -[WFAssociationStateView setNeedsLayout](self, "setNeedsLayout");
          return;
        }
        -[WFAssociationStateView activityIndicator](self, "activityIndicator");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startAnimating");

        -[WFAssociationStateView imageView](self, "imageView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setHidden:", 1);
LABEL_11:

        goto LABEL_12;
      }
      -[WFAssociationStateView imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        +[WFImageCache sharedImageCache](WFImageCache, "sharedImageCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "imageNamed:", CFSTR("checkmark"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v11);
        -[WFAssociationStateView setImageView:](self, "setImageView:", v12);

        -[WFAssociationStateView imageView](self, "imageView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAssociationStateView addSubview:](self, "addSubview:", v13);

      }
      -[WFAssociationStateView imageView](self, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0;
    }
    else
    {
      -[WFAssociationStateView imageView](self, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 1;
    }
    objc_msgSend(v6, "setHidden:", v8);

    -[WFAssociationStateView activityIndicator](self, "activityIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimating");
    goto LABEL_11;
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)WFAssociationStateView;
  -[WFAssociationStateView layoutSubviews](&v35, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAssociationStateView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[WFAssociationStateView center](self, "center");
  v5 = v4;
  v7 = v6;
  -[WFAssociationStateView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCenter:", v5, v7);

  -[WFAssociationStateView imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentMode:", 4);

  -[WFAssociationStateView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16 + -1.0;
  -[WFAssociationStateView imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAssociationStateView imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v19);

  -[WFAssociationStateView center](self, "center");
  v22 = v21;
  v24 = v23;
  -[WFAssociationStateView activityIndicator](self, "activityIndicator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCenter:", v22, v24);

  -[WFAssociationStateView bounds](self, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[WFAssociationStateView activityIndicator](self, "activityIndicator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

}

- (UIActivityIndicatorView)activityIndicator
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v4;
  void *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;

  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(MEMORY[0x24BEBD4B8], "altTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v4, "setColor:", v5);

    v6 = self->_activityIndicator;
    self->_activityIndicator = v4;
    v7 = v4;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
    -[WFAssociationStateView addSubview:](self, "addSubview:", self->_activityIndicator);

    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
