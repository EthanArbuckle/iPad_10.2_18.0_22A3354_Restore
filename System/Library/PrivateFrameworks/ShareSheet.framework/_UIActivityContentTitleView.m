@implementation _UIActivityContentTitleView

- (void)setLinkView:(id)a3
{
  id v5;
  LPLinkView *v6;
  LPLinkView *v7;
  LPLinkView *v8;
  char v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_linkView;
  v7 = (LPLinkView *)v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if ((v7 != 0) != (v6 == 0))
    {
      v9 = -[LPLinkView isEqual:](v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_linkView, a3);
    -[_UIActivityContentTitleView addSubview:](self, "addSubview:", v8);
    v21 = (void *)MEMORY[0x1E0CB3718];
    -[_UIActivityContentTitleView linkView](self, "linkView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentTitleView layoutMarginsGuide](self, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    -[_UIActivityContentTitleView linkView](self, "linkView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentTitleView layoutMarginsGuide](self, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v19;
    -[_UIActivityContentTitleView linkView](self, "linkView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentTitleView heightAnchor](self, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v12;
    -[_UIActivityContentTitleView linkView](self, "linkView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentTitleView centerYAnchor](self, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v17);

    -[_UIActivityContentTitleView _updateContent](self, "_updateContent");
  }
LABEL_8:

}

- (void)setHasCloseButton:(BOOL)a3
{
  if (self->_hasCloseButton != a3)
  {
    self->_hasCloseButton = a3;
    -[_UIActivityContentTitleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPhotosCarouselMode:(BOOL)a3
{
  if (self->_photosCarouselMode != a3)
  {
    self->_photosCarouselMode = a3;
    -[_UIActivityContentTitleView _updateContent](self, "_updateContent");
    -[_UIActivityContentTitleView setNeedsLayout](self, "setNeedsLayout");
    -[_UINavigationBarTitleView preferredContentSizeDidChange](self, "preferredContentSizeDidChange");
  }
}

- (void)setIsCloseButtonOnLeadingEdge:(BOOL)a3
{
  if (self->_isCloseButtonOnLeadingEdge != a3)
  {
    self->_isCloseButtonOnLeadingEdge = a3;
    -[_UIActivityContentTitleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateContent
{
  _BOOL8 v3;
  void *v4;

  v3 = -[_UIActivityContentTitleView photosCarouselMode](self, "photosCarouselMode");
  -[_UIActivityContentTitleView linkView](self, "linkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[_UINavigationBarTitleView setHideStandardTitle:](self, "setHideStandardTitle:", -[_UIActivityContentTitleView photosCarouselMode](self, "photosCarouselMode") ^ 1);
}

- (void)contentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIActivityContentTitleView;
  -[_UINavigationBarTitleView contentDidChange](&v3, sel_contentDidChange);
  -[_UIActivityContentTitleView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)preferredContentSizeForSize:(int64_t)a3
{
  if (-[_UIActivityContentTitleView photosCarouselMode](self, "photosCarouselMode"))
    return a3;
  else
    return 3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int v11;
  int v12;
  double v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)_UIActivityContentTitleView;
  -[_UIActivityContentTitleView layoutSubviews](&v34, sel_layoutSubviews);
  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (-[_UIActivityContentTitleView hasCloseButton](self, "hasCloseButton"))
  {
    -[_UINavigationBarTitleView contentOverlayRects](self, "contentOverlayRects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGRectValue");
    v10 = v9;

    v11 = dyld_program_sdk_at_least();
    if (v10 == 0.0)
      v12 = v11;
    else
      v12 = 1;
    if (v12)
      v13 = v10 + 16.0;
    else
      v13 = 59.0;
    -[_UIActivityContentTitleView linkView](self, "linkView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "effectiveUserInterfaceLayoutDirection");

    v16 = -[_UIActivityContentTitleView isCloseButtonOnLeadingEdge](self, "isCloseButtonOnLeadingEdge");
    v17 = -[_UIActivityContentTitleView isCloseButtonOnLeadingEdge](self, "isCloseButtonOnLeadingEdge");
    if (v16)
      v18 = v13;
    else
      v18 = v4;
    if (v17)
      v19 = v6;
    else
      v19 = v13;
    if (v16)
      v20 = v4;
    else
      v20 = v13;
    if (v17)
      v21 = v13;
    else
      v21 = v6;
    if (v15 == 1)
      v6 = v21;
    else
      v6 = v19;
    if (v15 == 1)
      v4 = v20;
    else
      v4 = v18;
  }
  -[_UIActivityContentTitleView linkView](self, "linkView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_setTextSafeAreaInset:", v3, v4, v5, v6);

  -[_UIActivityContentTitleView size](self, "size");
  v24 = v23;
  -[_UIActivityContentTitleView layoutMargins](self, "layoutMargins");
  v26 = v25;
  -[_UIActivityContentTitleView layoutMargins](self, "layoutMargins");
  v28 = v27;
  v29 = -[_UIActivityContentTitleView photosCarouselMode](self, "photosCarouselMode");
  v30 = 0.0;
  if (!v29)
  {
    -[_UIActivityContentTitleView linkView](self, "linkView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sizeThatFits:", v24 - (v26 + v28), 1.79769313e308);
    v33 = v32;

    v30 = 72.0;
    if (v33 >= 72.0)
      v30 = v33;
  }
  -[_UINavigationBarTitleView setHeight:](self, "setHeight:", v30);
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (BOOL)photosCarouselMode
{
  return self->_photosCarouselMode;
}

- (BOOL)customButtonMode
{
  return self->_customButtonMode;
}

- (void)setCustomButtonMode:(BOOL)a3
{
  self->_customButtonMode = a3;
}

- (BOOL)isCloseButtonOnLeadingEdge
{
  return self->_isCloseButtonOnLeadingEdge;
}

- (BOOL)hasCloseButton
{
  return self->_hasCloseButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
}

@end
