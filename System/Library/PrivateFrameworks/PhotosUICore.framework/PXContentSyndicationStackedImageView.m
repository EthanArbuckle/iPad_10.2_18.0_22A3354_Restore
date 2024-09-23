@implementation PXContentSyndicationStackedImageView

- (PXContentSyndicationStackedImageView)initWithFrame:(CGRect)a3
{
  PXContentSyndicationStackedImageView *v3;
  PXContentSyndicationStackedImageView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  UIImageView *imageView;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXContentSyndicationStackedImageView;
  v3 = -[PXContentSyndicationStackedImageView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXContentSyndicationStackedImageView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[PXContentSyndicationStackedImageView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 20.0);

    v6 = *MEMORY[0x1E0CD2A68];
    -[PXContentSyndicationStackedImageView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerCurve:", v6);

    -[PXContentSyndicationStackedImageView setAccessibilityIgnoresInvertColors:](v4, "setAccessibilityIgnoresInvertColors:", 1);
    v8 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PXContentSyndicationStackedImageView bounds](v4, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v9;

    -[UIImageView setAutoresizingMask:](v4->_imageView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_imageView, "setBackgroundColor:", v11);

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 2);
    -[PXContentSyndicationStackedImageView addSubview:](v4, "addSubview:", v4->_imageView);
  }
  return v4;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[PXContentSyndicationStackedImageView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXContentSyndicationStackedImageView imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (BOOL)isBlurred
{
  void *v3;
  void *v4;
  int v5;

  -[PXContentSyndicationStackedImageView visualEffectView](self, "visualEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXContentSyndicationStackedImageView visualEffectView](self, "visualEffectView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)setBlurred:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  if (a3
    && (-[PXContentSyndicationStackedImageView visualEffectView](self, "visualEffectView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[PXContentSyndicationStackedImageView bounds](self, "bounds");
    v13 = (id)objc_msgSend(v6, "initWithFrame:");
    objc_msgSend(v13, "setAutoresizingMask:", 18);
    +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "itemCellBlurStyle");
    v9 = 1;
    if (v8 == 1)
      v9 = 2;
    if (v8 == 2)
      v10 = 4;
    else
      v10 = v9;
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEffect:", v11);

    -[PXContentSyndicationStackedImageView imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationStackedImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v13, v12);

    -[PXContentSyndicationStackedImageView setVisualEffectView:](self, "setVisualEffectView:", v13);
  }
  else
  {
    -[PXContentSyndicationStackedImageView visualEffectView](self, "visualEffectView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", !v3);
  }

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[PXContentSyndicationStackedImageView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[PXContentSyndicationStackedImageView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)setDarkenedStyle:(unint64_t)a3
{
  unint64_t darkenedStyle;
  double v5;
  double v6;
  UIView *darkeningView;
  id v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  void *visualEffectView;
  UIView *v13;
  id v14;

  if (self->_darkenedStyle != a3)
  {
    self->_darkenedStyle = a3;
    +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    darkenedStyle = self->_darkenedStyle;
    switch(darkenedStyle)
    {
      case 3uLL:
        objc_msgSend(v14, "blackOverlayForThirdThumbnail");
        break;
      case 2uLL:
        objc_msgSend(v14, "blackOverlayForSecondThumbnail");
        break;
      case 1uLL:
        objc_msgSend(v14, "blackOverlayForFirstThumbnail");
        break;
      default:
        goto LABEL_14;
    }
    v6 = v5;
    if (v5 > 0.0)
    {
      darkeningView = self->_darkeningView;
      if (!darkeningView)
      {
        v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
        -[PXContentSyndicationStackedImageView bounds](self, "bounds");
        v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
        v10 = self->_darkeningView;
        self->_darkeningView = v9;

        -[UIView setAutoresizingMask:](self->_darkeningView, "setAutoresizingMask:", 18);
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->_darkeningView, "setBackgroundColor:", v11);

        visualEffectView = self->_visualEffectView;
        if (!visualEffectView)
          visualEffectView = self->_imageView;
        -[PXContentSyndicationStackedImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_darkeningView, visualEffectView);
        darkeningView = self->_darkeningView;
      }
      -[UIView setAlpha:](darkeningView, "setAlpha:", v6);
      goto LABEL_15;
    }
LABEL_14:
    -[UIView removeFromSuperview](self->_darkeningView, "removeFromSuperview");
    v13 = self->_darkeningView;
    self->_darkeningView = 0;

LABEL_15:
  }
}

- (void)setHasBottomDarkGradient:(BOOL)a3
{
  PXGradientView *bottomGradientView;
  PXGradientView *v5;
  PXGradientView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *darkeningView;
  PXGradientView *v12;
  _QWORD v13[4];
  CGRect v14;

  v13[3] = *MEMORY[0x1E0C80C00];
  if (self->_hasBottomDarkGradient != a3)
  {
    self->_hasBottomDarkGradient = a3;
    bottomGradientView = self->_bottomGradientView;
    if (a3)
    {
      if (!bottomGradientView)
      {
        -[PXContentSyndicationStackedImageView bounds](self, "bounds");
        v5 = -[PXGradientView initWithFrame:]([PXGradientView alloc], "initWithFrame:", v14.origin.x, CGRectGetMaxY(v14) + -32.0, v14.size.width, 32.0);
        v6 = self->_bottomGradientView;
        self->_bottomGradientView = v5;

        -[PXGradientView setAutoresizingMask:](self->_bottomGradientView, "setAutoresizingMask:", 10);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13[1] = v8;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGradientView setColors:](self->_bottomGradientView, "setColors:", v10);

        -[PXGradientView setLocations:](self->_bottomGradientView, "setLocations:", &unk_1E53E93D8);
        darkeningView = self->_darkeningView;
        if (!darkeningView)
        {
          darkeningView = self->_visualEffectView;
          if (!darkeningView)
            darkeningView = self->_imageView;
        }
        -[PXContentSyndicationStackedImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_bottomGradientView, darkeningView);
      }
    }
    else
    {
      -[PXGradientView removeFromSuperview](bottomGradientView, "removeFromSuperview");
      v12 = self->_bottomGradientView;
      self->_bottomGradientView = 0;

    }
  }
}

- (void)setOverlayTitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *overlayTitle;
  NSAttributedString *v6;
  NSAttributedString *v7;
  NSUInteger v8;
  UILabel *overlayTitleLabel;
  id v10;
  UILabel *v11;
  UILabel *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *bottomGradientView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v4 = (NSAttributedString *)a3;
  overlayTitle = self->_overlayTitle;
  if (overlayTitle != v4
    && !-[NSAttributedString isEqualToAttributedString:](overlayTitle, "isEqualToAttributedString:", v4))
  {
    v6 = (NSAttributedString *)-[NSAttributedString copy](v4, "copy");
    v7 = self->_overlayTitle;
    self->_overlayTitle = v6;

    v8 = -[NSAttributedString length](self->_overlayTitle, "length");
    overlayTitleLabel = self->_overlayTitleLabel;
    if (v8)
    {
      if (!overlayTitleLabel)
      {
        v10 = objc_alloc(MEMORY[0x1E0DC3990]);
        -[PXContentSyndicationStackedImageView bounds](self, "bounds");
        v11 = (UILabel *)objc_msgSend(v10, "initWithFrame:");
        v12 = self->_overlayTitleLabel;
        self->_overlayTitleLabel = v11;

        v13 = *MEMORY[0x1E0DC4AA0];
        objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AA0]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", 2);
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0DC1350];
        v35 = v14;
        objc_msgSend(v14, "pointSize");
        v34 = (void *)v15;
        objc_msgSend(v17, "fontWithDescriptor:size:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v16;
        objc_msgSend(v16, "scaledFontForFont:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](self->_overlayTitleLabel, "setFont:", v19);

        -[UILabel setMaximumContentSizeCategory:](self->_overlayTitleLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4918]);
        -[UILabel setAdjustsFontForContentSizeCategory:](self->_overlayTitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](self->_overlayTitleLabel, "setTextColor:", v20);

        -[UILabel setNumberOfLines:](self->_overlayTitleLabel, "setNumberOfLines:", 0);
        -[UILabel setLineBreakMode:](self->_overlayTitleLabel, "setLineBreakMode:", 0);
        bottomGradientView = self->_bottomGradientView;
        if (!bottomGradientView)
        {
          bottomGradientView = self->_darkeningView;
          if (!bottomGradientView)
          {
            bottomGradientView = self->_visualEffectView;
            if (!bottomGradientView)
              bottomGradientView = self->_imageView;
          }
        }
        -[PXContentSyndicationStackedImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_overlayTitleLabel, bottomGradientView);
        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_overlayTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UILabel bottomAnchor](self->_overlayTitleLabel, "bottomAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentSyndicationStackedImageView bottomAnchor](self, "bottomAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -12.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v30;
        -[UILabel leadingAnchor](self->_overlayTitleLabel, "leadingAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentSyndicationStackedImageView leadingAnchor](self, "leadingAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "constraintEqualToAnchor:constant:", v22, 12.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v23;
        -[UILabel trailingAnchor](self->_overlayTitleLabel, "trailingAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentSyndicationStackedImageView trailingAnchor](self, "trailingAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -12.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v36[2] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v27);
        overlayTitleLabel = self->_overlayTitleLabel;
      }
      -[UILabel setAttributedText:](overlayTitleLabel, "setAttributedText:", self->_overlayTitle);
    }
    else
    {
      -[UILabel removeFromSuperview](overlayTitleLabel, "removeFromSuperview");
      v28 = self->_overlayTitleLabel;
      self->_overlayTitleLabel = 0;

    }
  }

}

- (PXRegionOfInterest)regionOfInterestForOneUpTransition
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = objc_alloc((Class)off_1E50B4620);
  -[UIImageView bounds](self->_imageView, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithRect:inCoordinateSpace:", self->_imageView);
  -[UIImageView layer](self->_imageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsRect");
  objc_msgSend(v4, "setImageContentsRect:");

  v6 = objc_alloc_init((Class)off_1E50B5EE8);
  -[PXContentSyndicationStackedImageView cornerRadius](self, "cornerRadius");
  objc_msgSend(v6, "setCornerRadius:");
  -[PXContentSyndicationStackedImageView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cornerCurve");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerCurve:", v8);

  objc_msgSend(v4, "setImageViewSpec:", v6);
  return (PXRegionOfInterest *)v4;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (unint64_t)darkenedStyle
{
  return self->_darkenedStyle;
}

- (BOOL)hasBottomDarkGradient
{
  return self->_hasBottomDarkGradient;
}

- (NSAttributedString)overlayTitle
{
  return self->_overlayTitle;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UIView)darkeningView
{
  return self->_darkeningView;
}

- (void)setDarkeningView:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningView, a3);
}

- (PXGradientView)bottomGradientView
{
  return self->_bottomGradientView;
}

- (void)setBottomGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomGradientView, a3);
}

- (UILabel)overlayTitleLabel
{
  return self->_overlayTitleLabel;
}

- (void)setOverlayTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_overlayTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayTitleLabel, 0);
  objc_storeStrong((id *)&self->_bottomGradientView, 0);
  objc_storeStrong((id *)&self->_darkeningView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_overlayTitle, 0);
}

@end
