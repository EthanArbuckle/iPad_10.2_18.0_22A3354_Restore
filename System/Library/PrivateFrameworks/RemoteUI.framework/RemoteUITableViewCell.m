@implementation RemoteUITableViewCell

- (void)prepareForReuse
{
  objc_super v3;

  -[RemoteUITableViewCell setDetailLinkText:handler:](self, "setDetailLinkText:handler:", 0, 0);
  -[RemoteUITableViewCell setActivityIndicatorVisible:](self, "setActivityIndicatorVisible:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RemoteUITableViewCell;
  -[RemoteUITableViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (RemoteUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RemoteUITableViewCell *v4;
  UIImageView *v5;
  UIImageView *badgeImageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)RemoteUITableViewCell;
  v4 = -[RemoteUITableViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    badgeImageView = v4->_badgeImageView;
    v4->_badgeImageView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_badgeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RemoteUITableViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_badgeImageView);

    -[UIImageView setHidden:](v4->_badgeImageView, "setHidden:", 1);
    -[UIImageView setContentMode:](v4->_badgeImageView, "setContentMode:", 1);
    v8 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView widthAnchor](v4->_badgeImageView, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", 20.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    -[UIImageView heightAnchor](v4->_badgeImageView, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 20.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateConstraints:", v13);

    -[RemoteUITableViewCell updateConstraints](v4, "updateConstraints");
  }
  return v4;
}

- (void)updateConstraints
{
  uint64_t v3;
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
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)RemoteUITableViewCell;
  -[RemoteUITableViewCell updateConstraints](&v17, sel_updateConstraints);
  -[UIImageView superview](self->_badgeImageView, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[RemoteUITableViewCell imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD1628];
      -[UIImageView trailingAnchor](self->_badgeImageView, "trailingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RemoteUITableViewCell imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 8.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      -[UIImageView bottomAnchor](self->_badgeImageView, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RemoteUITableViewCell imageView](self, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 6.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activateConstraints:", v16);

    }
  }
}

- (void)setImage:(id)a3 padding:(UIEdgeInsets)a4 tintColor:(id)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIImage *v11;
  UIColor *v12;
  UIImage *image;
  UIImage *v14;
  UIColor *imageTintColor;
  void *v16;
  id v17;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11 = (UIImage *)a3;
  v12 = (UIColor *)a5;
  image = self->_image;
  self->_image = v11;
  v14 = v11;

  self->_imagePadding.top = top;
  self->_imagePadding.left = left;
  self->_imagePadding.bottom = bottom;
  self->_imagePadding.right = right;
  imageTintColor = self->_imageTintColor;
  self->_imageTintColor = v12;

  -[RemoteUITableViewCell imageSize](self, "imageSize");
  -[RemoteUITableViewCell _paddedImageWithImage:size:insets:](self, "_paddedImageWithImage:size:insets:", v14);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[UITableViewCell ruiImageView](self, "ruiImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v17);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  UIImage *image;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (self->_image)
  {
    v11 = v4;
    -[RemoteUITableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    v7 = objc_msgSend(v11, "userInterfaceStyle");

    v4 = v11;
    if (v6 != v7)
    {
      image = self->_image;
      -[RemoteUITableViewCell imageSize](self, "imageSize");
      -[RemoteUITableViewCell _paddedImageWithImage:size:insets:](self, "_paddedImageWithImage:size:insets:", image);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell ruiImageView](self, "ruiImageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:", v9);

      v4 = v11;
    }
  }

}

- (id)_paddedImageWithImage:(id)a3 size:(CGSize)a4 insets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  id v12;
  void *v13;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = v12;
  if (left == *(double *)(MEMORY[0x24BEBE158] + 8)
    && top == *MEMORY[0x24BEBE158]
    && right == *(double *)(MEMORY[0x24BEBE158] + 24)
    && bottom == *(double *)(MEMORY[0x24BEBE158] + 16))
  {
    v23 = v12;
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x24BEBD618]);
    v18 = (void *)MEMORY[0x24BEBD620];
    -[RemoteUITableViewCell traitCollection](self, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "formatForTraitCollection:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v17, "initWithSize:format:", v20, width, height);

    if (self->_imageTintColor)
    {
      objc_msgSend(v13, "imageWithTintColor:");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = v13;
    }
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __59__RemoteUITableViewCell__paddedImageWithImage_size_insets___block_invoke;
    v26[3] = &unk_24C2973A0;
    v28 = width;
    v29 = height;
    v30 = top;
    v31 = left;
    v32 = bottom;
    v33 = right;
    v27 = v22;
    v24 = v22;
    objc_msgSend(v21, "imageWithActions:", v26);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

void __59__RemoteUITableViewCell__paddedImageWithImage_size_insets___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v2 = *(double *)(a1 + 56);
  v1 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "imageByPreparingThumbnailOfSize:", *(double *)(a1 + 40) - v1 - *(double *)(a1 + 80), *(double *)(a1 + 48) - v2 - *(double *)(a1 + 72));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawAtPoint:", v1, v2);

}

- (void)_accessoriesChanged
{
  UIImageView *invalidRowView;
  UIView *remoteUIAccessoryView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UIImageView *v17;
  float v18;
  float v19;
  double v20;
  UIImageView *v21;
  UIImageView *v22;
  UIImageView *v23;
  UIImageView *v24;

  invalidRowView = self->_invalidRowView;
  remoteUIAccessoryView = self->_remoteUIAccessoryView;
  if (!invalidRowView)
  {
    v22 = remoteUIAccessoryView;
LABEL_9:
    v21 = v22;
    goto LABEL_10;
  }
  if (!remoteUIAccessoryView)
  {
    v22 = invalidRowView;
    goto LABEL_9;
  }
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[UIImageView frame](invalidRowView, "frame");
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->_remoteUIAccessoryView, "frame");
  v13 = v11;
  v14 = v12;
  if (v10 >= v12)
    v15 = v10;
  else
    v15 = v12;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v5, v6, v8 + v11 + 6.0, v15);
  v17 = self->_invalidRowView;
  v23 = v16;
  -[UIImageView addSubview:](v23, "addSubview:", v17);
  -[UIImageView addSubview:](v23, "addSubview:", self->_remoteUIAccessoryView);

  v18 = v15 * 0.5 - v10 * 0.5;
  v19 = v15 * 0.5 - v14 * 0.5;
  v20 = roundf(v19);
  -[UIImageView setFrame:](self->_invalidRowView, "setFrame:", v13 + 6.0, roundf(v18), v8, v10);
  -[UIView setFrame:](self->_remoteUIAccessoryView, "setFrame:", 0.0, v20, v13, v14);
  v21 = v23;
LABEL_10:
  v24 = v21;
  -[RemoteUITableViewCell setAccessoryView:](self, "setAccessoryView:", v21);
  -[RemoteUITableViewCell setEditingAccessoryView:](self, "setEditingAccessoryView:", v24);

}

- (id)_checkmarkImage:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if (self->_accessoryColor)
  {
    v8.receiver = self;
    v8.super_class = (Class)RemoteUITableViewCell;
    -[RemoteUITableViewCell _checkmarkImage:](&v8, sel__checkmarkImage_, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", self->_accessoryColor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RemoteUITableViewCell;
    -[RemoteUITableViewCell _checkmarkImage:](&v7, sel__checkmarkImage_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_disclosureChevronImage:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if (self->_accessoryColor)
  {
    v8.receiver = self;
    v8.super_class = (Class)RemoteUITableViewCell;
    -[RemoteUITableViewCell _disclosureChevronImage:](&v8, sel__disclosureChevronImage_, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", self->_accessoryColor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RemoteUITableViewCell;
    -[RemoteUITableViewCell _disclosureChevronImage:](&v7, sel__disclosureChevronImage_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)editableTextField
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RemoteUITableViewCell;
  -[RemoteUITableViewCell editableTextField](&v6, sel_editableTextField);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_didSetupEditableTextFieldLargeText)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFont:", v4);

    objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
    self->_didSetupEditableTextFieldLargeText = 1;
  }
  return v3;
}

- (void)_setRemoteUIAccessoryType:(int64_t)a3 withColor:(id)a4
{
  UIColor **p_accessoryColor;
  UIColor *v8;
  id v9;

  self->_remoteUIAccessoryType = a3;
  p_accessoryColor = &self->_accessoryColor;
  objc_storeStrong((id *)&self->_accessoryColor, a4);
  v9 = a4;
  -[RemoteUITableViewCell setAccessoryType:](self, "setAccessoryType:", a3);
  v8 = *p_accessoryColor;
  *p_accessoryColor = 0;

}

- (void)setRemoteUIAccessoryType:(int64_t)a3
{
  -[RemoteUITableViewCell _setRemoteUIAccessoryType:withColor:](self, "_setRemoteUIAccessoryType:withColor:", a3, 0);
}

- (void)setRemoteUIAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_remoteUIAccessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_remoteUIAccessoryView, a3);
    -[RemoteUITableViewCell _accessoriesChanged](self, "_accessoriesChanged");
    v5 = v6;
  }

}

- (void)setActivityIndicatorVisible:(BOOL)a3
{
  if (self->_activityIndicatorVisible != a3)
  {
    self->_activityIndicatorVisible = a3;
    if (a3)
    {
      -[RemoteUITableViewCell _showActivityIndicatorAccessory](self, "_showActivityIndicatorAccessory");
    }
    else
    {
      -[RemoteUITableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
      -[RemoteUITableViewCell setEditingAccessoryView:](self, "setEditingAccessoryView:", 0);
      -[RemoteUITableViewCell _accessoriesChanged](self, "_accessoriesChanged");
    }
  }
}

- (void)_showActivityIndicatorAccessory
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double MidX;
  id v8;
  CGRect v9;
  CGRect v10;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v8, "startAnimating");
  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(v8, "bounds");
  v5 = v4 + 16.0;
  objc_msgSend(v8, "bounds");
  v6 = (void *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v5);
  objc_msgSend(v6, "addSubview:", v8);
  objc_msgSend(v6, "bounds");
  MidX = CGRectGetMidX(v9);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v8, "setCenter:", MidX, CGRectGetMidY(v10));
  -[RemoteUITableViewCell setAccessoryView:](self, "setAccessoryView:", v6);
  -[RemoteUITableViewCell setEditingAccessoryView:](self, "setEditingAccessoryView:", v6);

}

- (void)setHTMLData:(id)a3 sourceURL:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  RUIWebContainerView *webContainerView;
  RUIWebContainerView *v11;
  RUIWebContainerView *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[RUIWebContainerView removeFromSuperview](self->_webContainerView, "removeFromSuperview");
  webContainerView = self->_webContainerView;
  self->_webContainerView = 0;

  if (v14)
  {
    v11 = -[RUIWebContainerView initWithContent:baseURL:]([RUIWebContainerView alloc], "initWithContent:baseURL:", v14, v8);
    v12 = self->_webContainerView;
    self->_webContainerView = v11;

    -[RUIWebContainerView setDelegate:](self->_webContainerView, "setDelegate:", v9);
    -[RemoteUITableViewCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_webContainerView);

  }
}

- (void)_detailLinkPressed
{
  _QWORD block[5];

  if (self->_detailLinkHandler)
  {
    -[RemoteUITableViewCell _showActivityIndicatorAccessory](self, "_showActivityIndicatorAccessory");
    -[UIButton removeFromSuperview](self->_detailLinkButton, "removeFromSuperview");
    -[RemoteUITableViewCell setNeedsLayout](self, "setNeedsLayout");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__RemoteUITableViewCell__detailLinkPressed__block_invoke;
    block[3] = &unk_24C2973F0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __43__RemoteUITableViewCell__detailLinkPressed__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, _QWORD *);
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 1064));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 1064);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__RemoteUITableViewCell__detailLinkPressed__block_invoke_2;
  v7[3] = &unk_24C2973C8;
  v7[4] = v3;
  v8 = v2;
  v5 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v4 + 16);
  v6 = v2;
  v5(v4, v3, v7);

}

void __43__RemoteUITableViewCell__detailLinkPressed__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id *v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[133] == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "setAccessoryView:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setEditingAccessoryView:", 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1064);
    *(_QWORD *)(v3 + 1064) = 0;

    v5 = *(id **)(a1 + 32);
    objc_msgSend(v5[132], "titleForState:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetailLinkText:handler:", v6, *(_QWORD *)(a1 + 40));

  }
}

- (void)addDetailLinkButton:(id)a3
{
  id v4;

  -[RemoteUITableViewCell contentView](self, "contentView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_detailLinkButton);

}

- (void)setDetailLinkText:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id detailLinkHandler;
  UIButton *v9;
  UIButton *detailLinkButton;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  id v18;

  v6 = a3;
  if (self->_detailLinkHandler != a4)
  {
    v18 = v6;
    v7 = (void *)objc_msgSend(a4, "copy");
    detailLinkHandler = self->_detailLinkHandler;
    self->_detailLinkHandler = v7;

    if (self->_detailLinkHandler)
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
      detailLinkButton = self->_detailLinkButton;
      self->_detailLinkButton = v9;

      -[UITableViewCell ruiDetailTextLabel](self, "ruiDetailTextLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v18);

      -[UITableViewCell ruiDetailTextLabel](self, "ruiDetailTextLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 1);

      -[UIButton setExclusiveTouch:](self->_detailLinkButton, "setExclusiveTouch:", 1);
      -[UIButton addTarget:action:forControlEvents:](self->_detailLinkButton, "addTarget:action:forControlEvents:", self, sel__detailLinkPressed, 64);
      -[UIButton setTitle:forState:](self->_detailLinkButton, "setTitle:forState:", v18, 0);
      -[UIButton titleLabel](self->_detailLinkButton, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v14);

      -[RemoteUITableViewCell addDetailLinkButton:](self, "addDetailLinkButton:", self->_detailLinkButton);
    }
    else
    {
      -[UITableViewCell ruiDetailTextLabel](self, "ruiDetailTextLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 0);

      -[UITableViewCell ruiDetailTextLabel](self, "ruiDetailTextLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", 0);

      -[UIButton removeFromSuperview](self->_detailLinkButton, "removeFromSuperview");
      v17 = self->_detailLinkButton;
      self->_detailLinkButton = 0;

    }
    -[RemoteUITableViewCell setNeedsLayout](self, "setNeedsLayout");
    v6 = v18;
  }

}

- (id)detailLinkButton
{
  return self->_detailLinkButton;
}

- (CGRect)expand:(CGRect)a3 by:(CGSize)a4 anchor:(CGPoint)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = a3.origin.x - a4.width * a5.x;
  v6 = a3.origin.y - a4.height * a5.y;
  v7 = a3.size.width + a4.width;
  v8 = a3.size.height + a4.height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_tableIsGrouped
{
  void *v3;
  BOOL v4;
  void *v5;

  -[RemoteUITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "style") == 2)
  {
    v4 = 1;
  }
  else
  {
    -[RemoteUITableViewCell _tableView](self, "_tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "style") == 1;

  }
  return v4;
}

- (void)setBadgeImage:(id)a3 tintColor:(id)a4 isCircular:(BOOL)a5
{
  _BOOL4 v5;
  UIImageView *badgeImageView;
  id v9;
  UIImageView *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;

  v5 = a5;
  badgeImageView = self->_badgeImageView;
  v9 = a4;
  -[UIImageView setImage:](badgeImageView, "setImage:", a3);
  -[UIImageView setHidden:](self->_badgeImageView, "setHidden:", a3 == 0);
  -[UIImageView setTintColor:](self->_badgeImageView, "setTintColor:", v9);

  v10 = self->_badgeImageView;
  if (v5)
  {
    -[UIImageView _setCornerRadius:](v10, "_setCornerRadius:", 10.0);
    -[UIImageView setClipsToBounds:](self->_badgeImageView, "setClipsToBounds:", 1);
    if (-[RemoteUITableViewCell _tableIsGrouped](self, "_tableIsGrouped"))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGroupedBackgroundColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "CGColor");
      -[UIImageView layer](self->_badgeImageView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderColor:", v12);

      objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGroupedBackgroundColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellPlainBackgroundColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "CGColor");
      -[UIImageView layer](self->_badgeImageView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBorderColor:", v16);

      objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellPlainBackgroundColor");
    }
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](self->_badgeImageView, "setBackgroundColor:", v18);

  }
  else
  {
    -[UIImageView _setCornerRadius:](v10, "_setCornerRadius:", 0.0);
    -[UIImageView setClipsToBounds:](self->_badgeImageView, "setClipsToBounds:", 1);
    -[UIImageView layer](self->_badgeImageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderColor:", 0);

    -[UIImageView setBackgroundColor:](self->_badgeImageView, "setBackgroundColor:", 0);
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  NSString *v17;
  BOOL IsAccessibilityCategory;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  UIButton *detailLinkButton;
  UIButton *v37;
  UIButton *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double MinX;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  void *v56;
  double MidY;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int64_t v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  char v86;
  double x;
  double y;
  double width;
  double v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  void *v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  double v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  double v127;
  double MaxX;
  void *v129;
  CGFloat v130;
  double v131;
  double v132;
  double v133;
  CGFloat v134;
  double v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  double v149;
  double v150;
  void *v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  double v163;
  double v164;
  uint64_t v165;
  uint64_t v166;
  double v167;
  double v168;
  uint64_t v169;
  uint64_t v170;
  double v171;
  double v172;
  uint64_t v173;
  uint64_t v174;
  double v175;
  double v176;
  double v177;
  void *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  float v186;
  uint64_t v187;
  double v188;
  double v189;
  void *v190;
  double v191;
  double v192;
  double v193;
  void *v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  void *v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  CGFloat v219;
  double v220;
  CGFloat v221;
  double v222;
  CGFloat v223;
  CGFloat v224;
  CGFloat v225;
  CGFloat v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  CGFloat v234;
  CGFloat v235;
  void *v236;
  void *v237;
  double v238;
  CGFloat v239;
  double v240;
  CGFloat v241;
  double v242;
  CGFloat v243;
  double v244;
  CGFloat v245;
  void *v246;
  double v247;
  CGFloat v248;
  double v249;
  CGFloat v250;
  double v251;
  double v252;
  double v253;
  CGFloat v254;
  CGFloat v255;
  CGFloat v256;
  CGFloat height;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  void *v264;
  void *v265;
  uint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  double v272;
  double v273;
  CGFloat v274;
  double v275;
  float v276;
  void *v277;
  double v278;
  double v279;
  double v280;
  CGFloat v281;
  CGFloat v282;
  CGFloat v283;
  double v284;
  CGFloat v285;
  CGFloat v286;
  double v287;
  double v288;
  double rect;
  uint64_t recta;
  CGFloat rectb;
  double rectc;
  double v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  objc_super v299;
  _QWORD v300[4];
  id v301;
  RemoteUITableViewCell *v302;
  objc_super v303;
  uint64_t v304;
  _QWORD v305[2];
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;
  CGRect v322;
  CGRect v323;
  CGRect v324;
  CGRect v325;
  CGRect v326;
  CGRect v327;
  CGRect v328;
  CGRect v329;
  CGRect v330;
  CGRect v331;
  CGRect v332;
  CGRect v333;
  CGRect v334;
  CGRect v335;
  CGRect v336;
  CGRect v337;
  CGRect v338;
  CGRect v339;
  CGRect v340;
  CGRect v341;
  CGRect v342;
  CGRect v343;
  CGRect v344;

  v305[1] = *MEMORY[0x24BDAC8D0];
  v303.receiver = self;
  v303.super_class = (Class)RemoteUITableViewCell;
  -[RemoteUITableViewCell layoutSubviews](&v303, sel_layoutSubviews);
  -[RemoteUITableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemoteUITableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", v5);

  -[UIImageView superview](self->_badgeImageView, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bringSubviewToFront:", self->_badgeImageView);

  -[RemoteUITableViewCell layoutManager](self, "layoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemoteUITableViewCell frame](self, "frame");
  objc_msgSend(v7, "textRectForCell:rowWidth:forSizing:", self, 0, CGRectGetWidth(v306));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[RemoteUITableViewCell traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferredContentSizeCategory");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

  -[RemoteUITableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;

  v24 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[RemoteUITableViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  -[RemoteUITableViewCell imageSize](self, "imageSize");
  v26 = v25;
  -[RemoteUITableViewCell imageSize](self, "imageSize");
  v28 = v26 * v27;
  if (v26 * v27 != 0.0)
  {
    -[RemoteUITableViewCell imageView](self, "imageView", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "image");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_alloc(MEMORY[0x24BEBD618]);
    -[RemoteUITableViewCell imageSize](self, "imageSize");
    v32 = (void *)objc_msgSend(v31, "initWithSize:");
    v300[0] = MEMORY[0x24BDAC760];
    v300[1] = 3221225472;
    v300[2] = __39__RemoteUITableViewCell_layoutSubviews__block_invoke;
    v300[3] = &unk_24C297418;
    v301 = v30;
    v302 = self;
    v33 = v30;
    objc_msgSend(v32, "imageWithActions:", v300);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewCell imageView](self, "imageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setImage:", v34);

    v299.receiver = self;
    v299.super_class = (Class)RemoteUITableViewCell;
    -[RemoteUITableViewCell layoutSubviews](&v299, sel_layoutSubviews);

  }
  detailLinkButton = self->_detailLinkButton;
  if (detailLinkButton)
  {
    v37 = detailLinkButton;
  }
  else
  {
    -[RemoteUITableViewCell detailTextLabel](self, "detailTextLabel", v28);
    v37 = (UIButton *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v37;
  -[UIButton titleLabel](self->_detailLinkButton, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    v41 = v39;
  }
  else
  {
    -[RemoteUITableViewCell detailTextLabel](self, "detailTextLabel");
    v41 = (id)objc_claimAutoreleasedReturnValue();
  }
  v42 = v41;

  -[RemoteUITableViewCell detailTextLabel](self, "detailTextLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "frame");
  -[UIButton setFrame:](v38, "setFrame:");

  objc_msgSend(v42, "setTextAlignment:", 2 * (v24 == 0));
  -[UIButton sizeThatFits:](v38, "sizeThatFits:", v21, v23);
  rect = v45;
  v293 = v44;
  v307.origin.x = v9;
  v307.origin.y = v11;
  v307.size.width = v13;
  v307.size.height = v15;
  MinX = CGRectGetMinX(v307);
  v308.origin.x = v9;
  v308.origin.y = v11;
  v308.size.width = v13;
  v308.size.height = v15;
  v297 = v21 - CGRectGetMaxX(v308);
  v298 = v15;
  if (!IsAccessibilityCategory)
  {
    v295 = v9;
    -[RemoteUITableViewCell editableTextField](self, "editableTextField");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "frame");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;

    -[RemoteUITableViewCell textLabel](self, "textLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "frame");
    MidY = CGRectGetMidY(v309);

    v310.origin.x = v49;
    v310.origin.y = v51;
    v310.size.width = v53;
    v310.size.height = v55;
    v58 = v51 + MidY - CGRectGetMidY(v310);
    if (v24)
    {
      v59 = MinX;
      -[RemoteUITableViewCell textFieldOffset](self, "textFieldOffset");
      v61 = v21 - MinX - MinX - v60;
    }
    else
    {
      -[RemoteUITableViewCell textFieldOffset](self, "textFieldOffset");
      v59 = MinX + v62;
      v61 = v21 - (MinX + v62) - v297;
    }
    -[RemoteUITableViewCell editableTextField](self, "editableTextField");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setFrame:", v59, v58, v61, v55);

    v9 = v295;
  }
  -[RemoteUITableViewCell accessoryView](self, "accessoryView");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    v66 = -[RemoteUITableViewCell remoteUIAccessoryType](self, "remoteUIAccessoryType");

    if (!v66)
    {
      -[RemoteUITableViewCell accessoryView](self, "accessoryView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "frame");
      v68 = v9;
      v70 = v69;
      v72 = v71;
      v74 = v73;
      v76 = v75;

      v77 = -6.0;
      if (!v24)
        v77 = 6.0;
      v78 = v77 + v70;
      -[RemoteUITableViewCell accessoryView](self, "accessoryView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v78;
      v9 = v68;
      objc_msgSend(v79, "setFrame:", v80, v72, v74, v76);

    }
  }
  -[RemoteUITableViewCell textLabel](self, "textLabel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "text");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "length");

  -[RemoteUITableViewCell editableTextField](self, "editableTextField");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v84;
  if (v83)
  {
    if (v84)
      v86 = IsAccessibilityCategory;
    else
      v86 = 1;

    if ((v86 & 1) != 0)
    {
      v288 = MinX;
      if (v38)
      {
        objc_msgSend(v42, "setTextAlignment:", 2 * (v24 != 0));
        if (!IsAccessibilityCategory)
        {
          v296 = v9;
          -[UIButton frame](v38, "frame");
          x = v311.origin.x;
          y = v311.origin.y;
          width = v311.size.width;
          if (CGRectIsEmpty(v311))
          {
            v90 = v293 - width;
            if (v24)
              v90 = 0.0;
            -[UIButton setFrame:](v38, "setFrame:", x - v90, y, v293, rect);
          }
          -[UIButton frame](v38, "frame");
          v92 = v91;
          v94 = v93;
          v96 = v95;
          -[RemoteUITableViewCell textLabel](self, "textLabel");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "frame");
          v99 = v98;
          v101 = v100;
          v103 = v102;

          v312.origin.x = 0.0;
          v342.origin.x = 0.0;
          v312.origin.y = v92;
          v312.size.width = v94;
          v312.size.height = v96;
          v342.origin.y = v99;
          v342.size.width = v101;
          v342.size.height = v103;
          v313 = CGRectIntersection(v312, v342);
          if (!CGRectIsEmpty(v313))
          {
            if (self->_leftAlignDetailLabel)
            {
              -[UIButton frame](v38, "frame");
              v105 = v104;
              v107 = v106;
              v109 = v108;
              v111 = v110;
              -[RemoteUITableViewCell textLabel](self, "textLabel");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "frame");
              v114 = v113;
              v116 = v115;
              v118 = v117;
              recta = v119;

              v120 = v114;
              v121 = v116;
              v122 = v118;
              if (v24)
              {
                v123 = recta;
                v124 = CGRectGetMinX(*(CGRect *)&v120);
                v125 = v105;
                v126 = v124 + -10.0;
                v314.origin.x = v125;
                v314.origin.y = v107;
                v314.size.width = v109;
                v314.size.height = v111;
                v127 = v126 - CGRectGetWidth(v314);
                v315.origin.x = v127;
                v315.origin.y = v107;
                v315.size.width = v109;
                v315.size.height = v111;
                MaxX = CGRectGetMaxX(v315);
                -[RemoteUITableViewCell contentView](self, "contentView");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "bounds");
                v130 = v107;
                v131 = CGRectGetMaxX(v316);
                -[RemoteUITableViewCell textFieldOffset](self, "textFieldOffset");
                v133 = v131 - v132;

                v134 = v109;
                v135 = v130;
                if (MaxX > v133)
                {
                  -[RemoteUITableViewCell contentView](self, "contentView");
                  v136 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v136, "bounds");
                  v137 = CGRectGetMaxX(v317);
                  v318.origin.x = v127;
                  v318.origin.y = v130;
                  v318.size.width = v134;
                  v318.size.height = v111;
                  v138 = v137 - CGRectGetWidth(v318);
                  -[RemoteUITableViewCell textFieldOffset](self, "textFieldOffset");
                  v127 = v138 - v139;

                }
              }
              else
              {
                v187 = recta;
                v127 = CGRectGetMaxX(*(CGRect *)&v120) + 10.0;
                -[RemoteUITableViewCell textFieldOffset](self, "textFieldOffset");
                v134 = v109;
                v135 = v107;
                if (v127 < v188)
                {
                  -[RemoteUITableViewCell textFieldOffset](self, "textFieldOffset");
                  v127 = v189;
                }
              }
              -[RemoteUITableViewCell contentView](self, "contentView");
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v190, "bounds");
              v191 = CGRectGetMaxX(v325) - v297;

              v326.origin.x = v127;
              v326.origin.y = v135;
              v326.size.width = v134;
              v326.size.height = v111;
              v192 = CGRectGetWidth(v326);
              if (v24)
              {
                v193 = v192;
                -[RemoteUITableViewCell contentView](self, "contentView");
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v194, "bounds");
                v195 = CGRectGetMaxX(v327);
                v328.origin.x = v127;
                v328.origin.y = v135;
                v328.size.width = v134;
                v328.size.height = v111;
                v196 = v195 - CGRectGetMaxX(v328);

                v197 = v191 - v196;
                v329.origin.x = v127;
                v329.origin.y = v135;
                v329.size.width = v191 - v196;
                v329.size.height = v111;
                v127 = v127 + v193 - CGRectGetWidth(v329);
              }
              else
              {
                v197 = v191 - v127;
              }
              -[UIButton setFrame:](v38, "setFrame:", v127, v135, v197, v111);
            }
            if (self->_forceFullSizeDetailLabel)
            {
              -[UIButton frame](v38, "frame");
              v199 = v198;
              rectb = v200;
              v202 = v201;
              v279 = v203;
              -[RemoteUITableViewCell textLabel](self, "textLabel");
              v204 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v204, "frame");
              v206 = v205;
              v208 = v207;
              v210 = v209;
              v212 = v211;

              v213 = v21 - v288 - v297;
              if (v293 < v213)
                v213 = v293;
              v214 = ceil(v213 - v202);
              v215 = v202 + v214;
              if (v24)
                v214 = 0.0;
              v216 = v199 - v214;
              v280 = v206;
              v282 = v210;
              v286 = v208;
              v217 = FARectRoundMetrics(v206);
              v219 = v218;
              v221 = v220;
              v223 = v222;
              v283 = v216;
              v343.origin.x = FARectRoundMetrics(v216);
              v343.origin.y = v224;
              v343.size.width = v225;
              v343.size.height = v226;
              v330.origin.x = v217;
              v330.origin.y = v219;
              v330.size.width = v221;
              v330.size.height = v223;
              if (CGRectIntersectsRect(v330, v343))
              {
                v227 = v280;
                v331.origin.x = v280;
                v331.origin.y = v286;
                v331.size.width = v282;
                v331.size.height = v212;
                v228 = CGRectGetWidth(v331);
                if (v24)
                {
                  v278 = v228;
                  v332.origin.x = v280;
                  v229 = v286;
                  v332.origin.y = v286;
                  v332.size.width = v282;
                  v332.size.height = v212;
                  v230 = CGRectGetMaxX(v332);
                  v231 = v283;
                  v333.origin.x = v283;
                  v232 = rectb;
                  v333.origin.y = rectb;
                  v333.size.width = v215;
                  v333.size.height = v279;
                  v233 = fmax(v230 - CGRectGetMaxX(v333) + -6.0, 0.0);
                  v334.origin.x = v280;
                  v334.origin.y = v286;
                  v334.size.width = v233;
                  v334.size.height = v212;
                  v227 = v280 + v278 - CGRectGetWidth(v334);
                }
                else
                {
                  v231 = v216;
                  v335.origin.x = v216;
                  v232 = rectb;
                  v335.origin.y = rectb;
                  v335.size.width = v215;
                  v335.size.height = v279;
                  v234 = CGRectGetMinX(v335);
                  v336.size.width = v282;
                  v235 = v234 + -6.0;
                  v336.origin.x = v280;
                  v229 = v286;
                  v336.origin.y = v286;
                  v336.size.height = v212;
                  v233 = fmax(v235 - CGRectGetMinX(v336), 0.0);
                }
              }
              else
              {
                v232 = rectb;
                v227 = v280;
                v233 = v282;
                v229 = v286;
                v231 = v283;
              }
              -[UIButton setFrame:](v38, "setFrame:", v231, v232, v215, v279, *(_QWORD *)&v278);
              -[RemoteUITableViewCell textLabel](self, "textLabel");
              v236 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v236, "setFrame:", v227, v229, v233, v212);

            }
            if (!self->_leftAlignDetailLabel && !self->_forceFullSizeDetailLabel)
            {
              -[RemoteUITableViewCell textLabel](self, "textLabel");
              v237 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v237, "frame");
              v239 = v238;
              v241 = v240;
              v243 = v242;
              v245 = v244;

              -[RemoteUITableViewCell detailTextLabel](self, "detailTextLabel");
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v246, "frame");
              v248 = v247;
              v250 = v249;
              v294 = v251;
              v253 = v252;

              v281 = v239;
              v337.origin.x = v239;
              v287 = v241;
              v337.origin.y = v241;
              v284 = v243;
              v337.size.width = v243;
              rectc = v245;
              v337.size.height = v245;
              v338 = CGRectInset(v337, -3.0, 0.0);
              v254 = v338.origin.x;
              v255 = v338.origin.y;
              v256 = v338.size.width;
              height = v338.size.height;
              v338.origin.x = v248;
              v285 = v250;
              v338.origin.y = v250;
              v258 = v253;
              v259 = v294;
              v338.size.width = v294;
              v338.size.height = v258;
              v344 = CGRectInset(v338, -3.0, 0.0);
              v339.origin.x = v254;
              v339.origin.y = v255;
              v339.size.width = v256;
              v339.size.height = height;
              v340 = CGRectIntersection(v339, v344);
              if (!CGRectIsEmpty(v340) || v294 < 40.0)
              {
                v260 = v284;
                if (v21 - v288 - v297 - v284 > 40.0)
                {
                  v261 = v285;
                  v262 = v281;
                  v263 = v248;
LABEL_81:
                  -[RemoteUITableViewCell textLabel](self, "textLabel");
                  v277 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v277, "setFrame:", v262, v287, v260, rectc);

                  -[UIButton setFrame:](v38, "setFrame:", v263, v261, v259, v258);
                  goto LABEL_49;
                }
                -[RemoteUITableViewCell detailTextLabel](self, "detailTextLabel");
                v264 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v264, "text");
                v265 = (void *)objc_claimAutoreleasedReturnValue();
                v266 = objc_msgSend(v265, "length");

                v263 = v248;
                if (v266)
                {
                  -[RemoteUITableViewCell detailTextLabel](self, "detailTextLabel");
                  v267 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v267, "text");
                  v268 = (void *)objc_claimAutoreleasedReturnValue();
                  v304 = *MEMORY[0x24BEBB360];
                  -[RemoteUITableViewCell detailTextLabel](self, "detailTextLabel");
                  v269 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v269, "font");
                  v270 = (void *)objc_claimAutoreleasedReturnValue();
                  v305[0] = v270;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v305, &v304, 1);
                  v271 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v268, "sizeWithAttributes:", v271);
                  v273 = v272;

                  v259 = fmin(v273, 40.0);
                  if (v24)
                  {
                    v263 = v288;
                    v341.origin.x = v288;
                    v261 = v285;
                    v341.origin.y = v285;
                    v341.size.width = v259;
                    v341.size.height = v258;
                    v274 = CGRectGetMaxX(v341) + 6.0;
                    v275 = v21 - v274;
                    v262 = v274;
                    v260 = v275 - v297;
                    goto LABEL_81;
                  }
                  v276 = v21 - v297 - v259;
                  v263 = floorf(v276);
                  v260 = v263 + -6.0 - v296;
                }
                v261 = v285;
                v262 = v281;
                goto LABEL_81;
              }
            }
          }
        }
      }
    }
    else
    {
      -[RemoteUITableViewCell editableTextField](self, "editableTextField");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "frame");
      v155 = v154;
      v157 = v156;
      v159 = v158;
      v161 = v160;

      -[RemoteUITableViewCell textLabel](self, "textLabel");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "frame");
      v164 = v163;
      v166 = v165;
      v168 = v167;
      v170 = v169;

      if (v24)
        v172 = v164 + -10.0;
      else
        v172 = v164;
      v320.origin.x = v155;
      v320.origin.y = v157;
      v320.size.width = v159;
      v320.size.height = v161;
      v173 = v166;
      v174 = v170;
      v171 = v168 + 10.0;
      v321 = CGRectIntersection(v320, *(CGRect *)&v172);
      v175 = v321.size.width;
      if (!CGRectIsNull(v321))
      {
        v176 = -0.0;
        if (!v24)
          v176 = v175;
        v177 = v155 + v176;
        -[RemoteUITableViewCell editableTextField](self, "editableTextField");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "setFrame:", v177, v157, v159 - v175, v161);

      }
    }
  }
  else
  {
    objc_msgSend(v84, "frame");
    v141 = v140;
    v143 = v142;
    v145 = v144;
    v147 = v146;
    -[RemoteUITableViewCell imageView](self, "imageView");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "size");
    v150 = v149;

    if (v150 == 0.0)
    {
      -[RemoteUITableViewCell contentView](self, "contentView");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "bounds");
      v152 = CGRectGetMaxX(v322);
    }
    else
    {
      -[RemoteUITableViewCell imageView](self, "imageView");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "frame");
      v152 = CGRectGetMinX(v319);
    }
    v179 = v152;

    if (v24)
    {
      v323.origin.x = v141;
      v323.origin.y = v143;
      v323.size.width = v145;
      v323.size.height = v147;
      v180 = v145 + v179 - CGRectGetMaxX(v323) - MinX;
      v324.origin.x = v141;
      v324.origin.y = v143;
      v324.size.width = v180;
      v324.size.height = v147;
      MinX = v179 - CGRectGetWidth(v324) - MinX;
    }
    else
    {
      v180 = v145 + v141 - MinX;
    }
    objc_msgSend(v85, "setFrame:", MinX, v143, v180, v147);

  }
LABEL_49:
  -[RemoteUITableViewCell webViewWidth](self, "webViewWidth");
  v182 = v181;
  -[RUIWebContainerView heightForWidth:](self->_webContainerView, "heightForWidth:");
  if (v298 >= v183)
    v184 = v183;
  else
    v184 = v298;
  -[RemoteUITableViewCell bounds](self, "bounds");
  v186 = (v185 - v184) * 0.5;
  -[RUIWebContainerView setFrame:](self->_webContainerView, "setFrame:", 10.0, floorf(v186), v182, v184);

}

uint64_t __39__RemoteUITableViewCell_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageSize");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "imageSize");
  return objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v4, v5);
}

- (double)webViewWidth
{
  void *v3;
  double v4;
  double v5;
  CGRect v7;

  -[RemoteUITableViewCell layoutManager](self, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemoteUITableViewCell frame](self, "frame");
  objc_msgSend(v3, "textRectForCell:rowWidth:forSizing:", self, 0, CGRectGetWidth(v7));
  v5 = v4;

  return v5;
}

- (void)setRowInvalid:(BOOL)a3
{
  UIImageView *invalidRowView;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *v9;
  id v10;

  invalidRowView = self->_invalidRowView;
  if (a3)
  {
    if (!invalidRowView)
    {
      v5 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("NotVerified"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v8 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v10);
      v9 = self->_invalidRowView;
      self->_invalidRowView = v8;

      -[RemoteUITableViewCell _accessoriesChanged](self, "_accessoriesChanged");
    }
  }
  else if (invalidRowView)
  {
    self->_invalidRowView = 0;

    -[RemoteUITableViewCell _accessoriesChanged](self, "_accessoriesChanged");
  }
}

- (BOOL)forceFullSizeDetailLabel
{
  return self->_forceFullSizeDetailLabel;
}

- (void)setForceFullSizeDetailLabel:(BOOL)a3
{
  self->_forceFullSizeDetailLabel = a3;
}

- (BOOL)leftAlignDetailLabel
{
  return self->_leftAlignDetailLabel;
}

- (void)setLeftAlignDetailLabel:(BOOL)a3
{
  self->_leftAlignDetailLabel = a3;
}

- (int64_t)remoteUIAccessoryType
{
  return self->_remoteUIAccessoryType;
}

- (UIView)remoteUIAccessoryView
{
  return self->_remoteUIAccessoryView;
}

- (BOOL)activityIndicatorVisible
{
  return self->_activityIndicatorVisible;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (RUIWebContainerView)webContainerView
{
  return self->_webContainerView;
}

- (void)setWebContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_webContainerView, a3);
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_webContainerView, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_accessoryColor, 0);
  objc_storeStrong(&self->_detailLinkHandler, 0);
  objc_storeStrong((id *)&self->_detailLinkButton, 0);
  objc_storeStrong((id *)&self->_remoteUIAccessoryView, 0);
  objc_storeStrong((id *)&self->_invalidRowView, 0);
}

@end
