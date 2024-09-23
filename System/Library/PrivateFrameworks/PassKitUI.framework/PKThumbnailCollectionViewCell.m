@implementation PKThumbnailCollectionViewCell

- (PKThumbnailCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKThumbnailCollectionViewCell *v3;
  PKThumbnailCollectionViewCell *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *imageView;
  UILabel *v8;
  UILabel *labelTitle;
  double v10;
  uint64_t v11;
  CNAvatarView *avatarView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKThumbnailCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKThumbnailCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    -[PKThumbnailCollectionViewCell _setupImageView:](v4, "_setupImageView:", v4->_imageView);
    objc_msgSend(v5, "addSubview:", v4->_imageView);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    labelTitle = v4->_labelTitle;
    v4->_labelTitle = v8;

    -[UILabel setNumberOfLines:](v4->_labelTitle, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v4->_labelTitle, "setTextAlignment:", 1);
    LODWORD(v10) = 1036831949;
    -[UILabel _setHyphenationFactor:](v4->_labelTitle, "_setHyphenationFactor:", v10);
    -[UILabel setAccessibilityIdentifier:](v4->_labelTitle, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v5, "addSubview:", v4->_labelTitle);
    v11 = objc_msgSend(objc_alloc(getCNAvatarViewClass_2()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    avatarView = v4->_avatarView;
    v4->_avatarView = (CNAvatarView *)v11;

    -[CNAvatarView setUserInteractionEnabled:](v4->_avatarView, "setUserInteractionEnabled:", 0);
    -[CNAvatarView setAsynchronousRendering:](v4->_avatarView, "setAsynchronousRendering:", 1);
    -[CNAvatarView setShowsContactOnTap:](v4->_avatarView, "setShowsContactOnTap:", 0);
    -[CNAvatarView setHidden:](v4->_avatarView, "setHidden:", 1);
    objc_msgSend(v5, "addSubview:", v4->_avatarView);
    -[PKThumbnailCollectionViewCell _resetFonts](v4, "_resetFonts");
    -[PKThumbnailCollectionViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A30]);

  }
  return v4;
}

- (void)prepareForReuse
{
  NSString *identifier;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKThumbnailCollectionViewCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  identifier = self->_identifier;
  self->_identifier = 0;

}

- (void)_resetFonts
{
  UILabel *labelTitle;
  id v3;

  labelTitle = self->_labelTitle;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0CA8670], (NSString *)*MEMORY[0x1E0DC48F8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](labelTitle, "setFont:", v3);

}

- (void)_setupImageView:(id)a3
{
  id v4;
  id v5;
  double v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setContentMode:", 1);
  objc_msgSend(v4, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(v7, "setCornerRadius:", 6.0);
  objc_msgSend(v7, "setMasksToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  if (self->_strokeImage)
    v6 = PKUIPixelLength();
  else
    v6 = 0.0;
  objc_msgSend(v7, "setBorderWidth:", v6);

}

- (void)setStrokeImage:(BOOL)a3
{
  UIImageView *imageView;
  double v5;
  id v6;

  if (((!self->_strokeImage ^ a3) & 1) == 0)
  {
    self->_strokeImage = a3;
    imageView = self->_imageView;
    if (imageView)
    {
      -[UIImageView layer](imageView, "layer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (self->_strokeImage)
        v5 = PKUIPixelLength();
      else
        v5 = 0.0;
      objc_msgSend(v6, "setBorderWidth:", v5);

    }
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKThumbnailCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKThumbnailCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[CNAvatarView setFrame:](self->_avatarView, "setFrame:", v4, v6, v8, v8);
  -[UILabel sizeThatFits:](self->_labelTitle, "sizeThatFits:", v8, v10 - v8 + -6.0);
  -[UILabel setFrame:](self->_labelTitle, "setFrame:", v4, v6 + v8 + 6.0, v8, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel font](self->_labelTitle, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v7 = width + 6.0 + v6 * 2.0;

  v8 = fmin(v7, height);
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)showAvatarView:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CNAvatarView setHidden:](self->_avatarView, "setHidden:", !a3);
  -[UIImageView setHidden:](self->_imageView, "setHidden:", v3);
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  UIImage **p_image;
  UIImageView *imageView;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;
  uint64_t v13;
  void *v14;
  UIImageView *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  UIImageView *v19;
  UIImageView *v20;
  UIImageView *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  UIImageView *v25;
  _QWORD v26[5];
  UIImageView *v27;

  v4 = a4;
  v7 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v7)
  {
    objc_storeStrong((id *)&self->_image, a3);
    if (*p_image)
    {
      -[PKThumbnailCollectionViewCell showAvatarView:](self, "showAvatarView:", 0);
      imageView = self->_imageView;
      if (imageView)
      {
        if (v4)
        {
          v10 = imageView;
          v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_image);
          v12 = self->_imageView;
          self->_imageView = v11;

          -[PKThumbnailCollectionViewCell _setupImageView:](self, "_setupImageView:", self->_imageView);
          -[UIImageView setImage:](self->_imageView, "setImage:", *p_image);
          -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.0);
          v13 = MEMORY[0x1E0C809B0];
          v14 = (void *)MEMORY[0x1E0DC3F10];
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __51__PKThumbnailCollectionViewCell_setImage_animated___block_invoke;
          v26[3] = &unk_1E3E61388;
          v26[4] = self;
          v27 = v10;
          v24[0] = v13;
          v24[1] = 3221225472;
          v24[2] = __51__PKThumbnailCollectionViewCell_setImage_animated___block_invoke_2;
          v24[3] = &unk_1E3E62288;
          v25 = v27;
          v15 = v27;
          objc_msgSend(v14, "pkui_animateUsingOptions:animations:completion:", 4, v26, v24);

        }
        else
        {
          -[UIImageView image](imageView, "image");
          v15 = (UIImageView *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](self->_imageView, "setImage:", *p_image);
          -[UIImageView image](self->_imageView, "image");
          v19 = (UIImageView *)objc_claimAutoreleasedReturnValue();

          if (v19 == v15)
          {
            v20 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_image);
            v21 = self->_imageView;
            self->_imageView = v20;

            -[PKThumbnailCollectionViewCell _setupImageView:](self, "_setupImageView:", self->_imageView);
          }
        }

      }
      else
      {
        v17 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_image);
        v18 = self->_imageView;
        self->_imageView = v17;

        -[PKThumbnailCollectionViewCell _setupImageView:](self, "_setupImageView:", self->_imageView);
      }
      -[UIImageView superview](self->_imageView, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        -[PKThumbnailCollectionViewCell contentView](self, "contentView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addSubview:", self->_imageView);

        goto LABEL_14;
      }
    }
    else
    {
      -[UIImageView superview](self->_imageView, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
LABEL_14:
        -[PKThumbnailCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }

}

uint64_t __51__PKThumbnailCollectionViewCell_setImage_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __51__PKThumbnailCollectionViewCell_setImage_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_title;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_labelTitle, "setText:", v9);
    -[PKThumbnailCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKThumbnailCollectionViewCell;
  -[PKThumbnailCollectionViewCell traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKThumbnailCollectionViewCell traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
        -[PKThumbnailCollectionViewCell _resetFonts](self, "_resetFonts");
    }
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelTitle, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
