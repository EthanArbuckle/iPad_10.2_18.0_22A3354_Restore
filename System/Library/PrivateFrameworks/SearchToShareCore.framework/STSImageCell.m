@implementation STSImageCell

- (STSImageCell)initWithFrame:(CGRect)a3
{
  STSImageCell *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIImageView *imageView;
  UIImageView *v11;
  void *v12;
  uint64_t v13;
  UILabel *labelView;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  UIView *labelBackgroundView;
  UIView *v21;
  void *v22;
  uint64_t v23;
  UIView *placeholderColorView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)STSImageCell;
  v3 = -[STSImageCell initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD668]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v9;

    v11 = v3->_imageView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    -[UIImageView setAlpha:](v3->_imageView, "setAlpha:", 0.0);
    -[UIImageView setOpaque:](v3->_imageView, "setOpaque:", 1);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v5, v6, v7, v8);
    labelView = v3->_labelView;
    v3->_labelView = (UILabel *)v13;

    v15 = v3->_labelView;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    v17 = v3->_labelView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setTextAlignment:](v3->_labelView, "setTextAlignment:", 0);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v5, v6, v7, v8);
    labelBackgroundView = v3->_labelBackgroundView;
    v3->_labelBackgroundView = (UIView *)v19;

    v21 = v3->_labelBackgroundView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v5, v6, v7, v8);
    placeholderColorView = v3->_placeholderColorView;
    v3->_placeholderColorView = (UIView *)v23;

    -[UIView setAlpha:](v3->_placeholderColorView, "setAlpha:", 0.0);
    -[STSImageCell contentView](v3, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v3->_imageView);

    -[STSImageCell contentView](v3, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v3->_placeholderColorView);

    -[STSImageCell contentView](v3, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v3->_labelBackgroundView);

    -[STSImageCell contentView](v3, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v3->_labelView);

  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSImageCell;
  -[STSImageCell prepareForReuse](&v3, sel_prepareForReuse);
  -[STSImageCell setShowDownloadIndicator:animated:](self, "setShowDownloadIndicator:animated:", 0, 0.0);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Width;
  double Height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24.receiver = self;
  v24.super_class = (Class)STSImageCell;
  -[STSImageCell layoutSubviews](&v24, sel_layoutSubviews);
  -[STSImageCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  Width = CGRectGetWidth(v25);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  Height = CGRectGetHeight(v26);
  -[STSImageCell imageAspectRatio](self, "imageAspectRatio");
  UIFloorToViewScale();
  v15 = v14;
  -[UIImageView sizeThatFits:](self->_badgeView, "sizeThatFits:", v9, v11);
  v17 = v16;
  v23 = v18;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  v22 = CGRectGetMaxX(v27) - v17 + -5.0;
  v19 = Height + -24.0;
  -[STSCellDownloadOverlayView setFrame:](self->_downloadProgressView, "setFrame:", v5, v7, v9, v11);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, Width, v15);
  -[UIView setFrame:](self->_placeholderColorView, "setFrame:", 0.0, 0.0, Width, v15);
  -[UIImageView setFrame:](self->_badgeView, "setFrame:", v22, 5.0, v17, v23);
  -[UIView setFrame:](self->_labelBackgroundView, "setFrame:", 0.0, v19, Width, 24.0);
  -[UILabel setFrame:](self->_labelView, "setFrame:", 6.0, v19, Width + -12.0, 24.0);
  if (STSIsInternalInstall())
  {
    -[UIImageView sizeThatFits:](self->_debugBadgeView, "sizeThatFits:", v9, v11);
    -[UIImageView setFrame:](self->_debugBadgeView, "setFrame:", 5.0, 5.0, v20, v21);
  }
}

- (double)imageAspectRatio
{
  return 1.0;
}

- (CGRect)imageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIImageView frame](self->_imageView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)imageInsets
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  UIEdgeInsets result;

  -[STSImageCell bounds](self, "bounds");
  v4 = v3;
  rect = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView frame](self->_imageView, "frame");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  rect_16 = CGRectGetMinY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  rect_8 = CGRectGetMinX(v26);
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v15 = CGRectGetHeight(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v16 = v15 - CGRectGetMaxY(v28);
  v29.origin.x = rect;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  v17 = CGRectGetWidth(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v18 = v17 - CGRectGetMaxX(v30);
  v20 = rect_8;
  v19 = rect_16;
  v21 = v16;
  result.right = v18;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)setCategory:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  UILabel *labelView;
  void *v10;
  UIView *labelBackgroundView;
  void *category;
  void *v13;

  v4 = a3;
  v13 = v4;
  if (!v4)
  {
    -[UILabel setHidden:](self->_labelView, "setHidden:", 1);
    -[UIView setHidden:](self->_labelBackgroundView, "setHidden:", 1);
    category = self->_category;
    self->_category = 0;
    goto LABEL_5;
  }
  v5 = -[NSString isEqualToString:](self->_category, "isEqualToString:", v4);
  v6 = v13;
  if (!v5)
  {
    v7 = (NSString *)objc_msgSend(v13, "copy");
    v8 = self->_category;
    self->_category = v7;

    -[UILabel setText:](self->_labelView, "setText:", self->_category);
    labelView = self->_labelView;
    -[STSImageCell image](self, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHidden:](labelView, "setHidden:", v10 == 0);

    labelBackgroundView = self->_labelBackgroundView;
    -[STSImageCell image](self, "image");
    category = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setHidden:](labelBackgroundView, "setHidden:", category == 0);
LABEL_5:

    v6 = v13;
  }

}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  -[STSImageCell setImage:animated:](self, "setImage:animated:", a3, 0);
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  -[UIImageView image](self->_imageView, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v13);

  v8 = v13;
  if ((v7 & 1) == 0)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v13);
    v9 = 1.0;
    if (!v13)
      v9 = 0.0;
    -[UIImageView setAlpha:](self->_imageView, "setAlpha:", v9);
    -[STSImageCell category](self, "category");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[UIImageView image](self->_imageView, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[UILabel setHidden:](self->_labelView, "setHidden:", 0);
        -[UIView setHidden:](self->_labelBackgroundView, "setHidden:", 0);
      }
    }
    -[STSImageCell _updateBadgeAnimated:](self, "_updateBadgeAnimated:", v4);
    -[STSImageCell _updatePlaceholderViewAnimated:](self, "_updatePlaceholderViewAnimated:", v4);
    v8 = v13;
  }

}

- (void)setPlaceholderColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_placeholderColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    -[STSImageCell _updatePlaceholderViewAnimated:](self, "_updatePlaceholderViewAnimated:", 0);
    v5 = v6;
  }

}

- (UIImage)badge
{
  return -[UIImageView image](self->_badgeView, "image");
}

- (void)setBadge:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UIImageView *badgeView;
  id v8;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  UIImageView *v12;
  id v13;

  v13 = a3;
  -[UIImageView image](self->_badgeView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v13, "isEqual:", v4);

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    badgeView = self->_badgeView;
    if (v13)
    {
      if (!badgeView)
      {
        v8 = objc_alloc(MEMORY[0x24BEBD668]);
        v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        v10 = self->_badgeView;
        self->_badgeView = v9;

        -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[STSImageCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertSubview:aboveSubview:", self->_badgeView, self->_imageView);

        v6 = v13;
        badgeView = self->_badgeView;
      }
      -[UIImageView setImage:](badgeView, "setImage:", v6);
      -[STSImageCell setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIImageView removeFromSuperview](badgeView, "removeFromSuperview");
      v12 = self->_badgeView;
      self->_badgeView = 0;

    }
    -[STSImageCell _updateBadgeAnimated:](self, "_updateBadgeAnimated:", 0);
    v6 = v13;
  }

}

- (UIImage)debugBadge
{
  return -[UIImageView image](self->_debugBadgeView, "image");
}

- (void)setDebugBadge:(id)a3
{
  void *v4;
  char v5;
  UIImageView *debugBadgeView;
  id v7;
  id v8;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  UIImageView *v12;
  id v13;

  v13 = a3;
  if (STSIsInternalInstall())
  {
    -[UIImageView image](self->_debugBadgeView, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v13, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      debugBadgeView = self->_debugBadgeView;
      v7 = v13;
      if (v13)
      {
        if (!debugBadgeView)
        {
          v8 = objc_alloc(MEMORY[0x24BEBD668]);
          v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
          v10 = self->_debugBadgeView;
          self->_debugBadgeView = v9;

          -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_debugBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[STSImageCell contentView](self, "contentView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "insertSubview:aboveSubview:", self->_debugBadgeView, self->_placeholderColorView);

          v7 = v13;
          debugBadgeView = self->_debugBadgeView;
        }
        -[UIImageView setImage:](debugBadgeView, "setImage:", v7);
        -[STSImageCell setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {
        -[UIImageView removeFromSuperview](debugBadgeView, "removeFromSuperview");
        v12 = self->_debugBadgeView;
        self->_debugBadgeView = 0;

      }
    }
  }

}

- (void)setShowDownloadIndicator:(BOOL)a3
{
  -[STSImageCell setShowDownloadIndicator:animated:](self, "setShowDownloadIndicator:animated:", 0, (double)a3);
}

- (void)setShowDownloadIndicator:(double)a3 animated:(BOOL)a4
{
  unint64_t v4;
  _BOOL4 v6;
  STSCellDownloadOverlayView *v7;
  STSCellDownloadOverlayView *v8;
  STSCellDownloadOverlayView *downloadProgressView;
  void *v10;
  void *v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD, _QWORD);
  double v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  LOBYTE(v4) = self->_showDownloadIndicator;
  if ((double)v4 == a3)
  {
    -[STSCellDownloadOverlayView progressView](self->_downloadProgressView, "progressView", a4);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProgress:", self->_downloadProgress);

    return;
  }
  v6 = a4;
  self->_showDownloadIndicator = a3 != 0.0;
  if (a3 != 0.0)
  {
    if (!self->_downloadProgressView)
    {
      v7 = [STSCellDownloadOverlayView alloc];
      v8 = -[STSCellDownloadOverlayView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      downloadProgressView = self->_downloadProgressView;
      self->_downloadProgressView = v8;

      -[STSCellDownloadOverlayView setTranslatesAutoresizingMaskIntoConstraints:](self->_downloadProgressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[STSCellDownloadOverlayView setAlpha:](self->_downloadProgressView, "setAlpha:", 0.0);
      -[STSImageCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_downloadProgressView);

    }
    -[STSImageCell setNeedsLayout](self, "setNeedsLayout");
    -[STSCellDownloadOverlayView progressView](self->_downloadProgressView, "progressView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProgress:", self->_downloadProgress);

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke;
    v19[3] = &unk_24E7457A8;
    v19[4] = self;
    v12 = (void (**)(_QWORD))MEMORY[0x227672A18](v19);
    v13 = 0;
    v14 = 0.2;
    if (v6)
      goto LABEL_7;
LABEL_9:
    if (v12)
      v12[2](v12);
    if (v13)
      v13[2](v13, 1);
    goto LABEL_13;
  }
  v15 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke_2;
  v18[3] = &unk_24E7457A8;
  v18[4] = self;
  v12 = (void (**)(_QWORD))MEMORY[0x227672A18](v18, a2);
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke_3;
  v17[3] = &unk_24E745B78;
  v17[4] = self;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x227672A18](v17);
  v14 = 0.0;
  if (!v6)
    goto LABEL_9;
LABEL_7:
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 4, v12, v13, 0.2, v14);
LABEL_13:

}

uint64_t __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "setAlpha:", 1.0);
}

uint64_t __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "setAlpha:", 0.0);
}

void __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 704))
  {
    objc_msgSend(*(id *)(v1 + 672), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 672);
    *(_QWORD *)(v3 + 672) = 0;

  }
}

- (void)setDownloadProgress:(double)a3
{
  id v4;

  self->_downloadProgress = a3;
  -[STSCellDownloadOverlayView progressView](self->_downloadProgressView, "progressView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgress:", a3);

}

- (void)_updateBadgeAnimated:(BOOL)a3
{
  void *v4;
  double v5;
  void *v6;

  -[STSImageCell image](self, "image", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1.0;
  if (!v4)
  {
    -[STSImageCell imageInfo](self, "imageInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v5 = 1.0;
    else
      v5 = 0.0;

  }
  -[UIImageView setAlpha:](self->_badgeView, "setAlpha:", v5);
}

- (void)_updatePlaceholderViewAnimated:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  UIColor *placeholderColor;
  void *v8;

  if (self->_placeholderColor)
  {
    -[UIImageView image](self->_imageView, "image", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
    if (!v4)
    {
      if (self->_imageInfo)
        v5 = 0.0;
      else
        v5 = 1.0;
    }

  }
  else
  {
    v5 = 0.0;
  }
  -[UIView alpha](self->_placeholderColorView, "alpha");
  if (v5 != v6
    || (placeholderColor = self->_placeholderColor,
        -[UIView backgroundColor](self->_placeholderColorView, "backgroundColor"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(placeholderColor) = -[UIColor isEqual:](placeholderColor, "isEqual:", v8),
        v8,
        (placeholderColor & 1) == 0))
  {
    -[UIView setBackgroundColor:](self->_placeholderColorView, "setBackgroundColor:", self->_placeholderColor);
    -[UIView setAlpha:](self->_placeholderColorView, "setAlpha:", v5);
  }
}

- (STSAnimatedImageInfo)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
  objc_storeStrong((id *)&self->_imageInfo, a3);
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (BOOL)showDownloadIndicator
{
  return self->_showDownloadIndicator;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_imageInfo, 0);
  objc_storeStrong((id *)&self->_debugBadgeView, 0);
  objc_storeStrong((id *)&self->_labelBackgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_downloadProgressView, 0);
  objc_storeStrong((id *)&self->_placeholderColorView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
