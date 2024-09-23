@implementation PLExpandedPlatterHeaderContentView

- (double)_iconDimension
{
  return 20.0;
}

- (double)_iconLeadingPadding
{
  return 16.0;
}

- (double)_iconTrailingPadding
{
  return 8.0;
}

- (double)_headerHeightForWidth:(double)a3
{
  _BOOL4 v5;
  double v7;
  void *v8;
  double v9;
  double v10;

  v5 = -[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout");
  if (a3 <= 0.0 || !v5)
  {
    -[PLPlatterHeaderContentView _titleLabelFont](self, "_titleLabelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_scaledValueForValue:", 16.0);
    v10 = v7 * 2.0 + 20.0;
  }
  else
  {
    -[PLExpandedPlatterHeaderContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[PLExpandedPlatterHeaderContentView _titleLabelBoundsForSize:](self, "_titleLabelBoundsForSize:", a3 + -16.0 + -56.0, 1.79769313e308);
    -[PLExpandedPlatterHeaderContentView _largeTextLabelBaselineOffsetFromBottom](self, "_largeTextLabelBaselineOffsetFromBottom");
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    UIRoundToScale();
    v10 = v9;
  }

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  if (a3.width <= 0.0)
  {
    width = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    width = a3.width;
    -[PLExpandedPlatterHeaderContentView _headerHeightForWidth:](self, "_headerHeightForWidth:");
    v5 = v4;
  }
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLExpandedPlatterHeaderContentView;
  -[PLExpandedPlatterHeaderContentView _dynamicUserInterfaceTraitDidChange](&v10, sel__dynamicUserInterfaceTraitDidChange);
  +[PLMappedImageCache sharedCache](PLMappedImageCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.ellipsesHighlightImage"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeImageForKey:", v7);

  -[PLPlatterHeaderContentView _utilityButton](self, "_utilityButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLExpandedPlatterHeaderContentView _ellipsisHighlightedBackgroundImage](self, "_ellipsisHighlightedBackgroundImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundImage:forState:", v9, 1);

  -[PLExpandedPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_newIconButton
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLExpandedPlatterHeaderContentView;
  v3 = -[PLPlatterHeaderContentView _newIconButton](&v8, sel__newIconButton);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v3, "setPointerInteractionEnabled:", 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__PLExpandedPlatterHeaderContentView__newIconButton__block_invoke;
    v7[3] = &unk_1E91D38A0;
    v7[4] = self;
    objc_msgSend(v3, "setPointerStyleProvider:", v7);
  }
  return v3;
}

id __52__PLExpandedPlatterHeaderContentView__newIconButton__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0CEAA98]);
  objc_msgSend(*(id *)(a1 + 32), "iconButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithView:", v5);

  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_configureIconButton:(id)a3 withIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[PLExpandedPlatterHeaderContentView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mt_imageWithDefaultShadowAttributesForUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)PLExpandedPlatterHeaderContentView;
  -[PLPlatterHeaderContentView _configureIconButton:withIcon:](&v10, sel__configureIconButton_withIcon_, v7, v9);

}

- (void)_updateStylingForTitleLabel:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CEA478];
  v4 = a3;
  objc_msgSend(v3, "_secondaryLabelColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)_updateUtilityButtonFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PLPlatterHeaderContentView _utilityButton](self, "_utilityButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLPlatterHeaderContentView utilityButton](self, "utilityButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterHeaderContentView _fontProvider](self, "_fontProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB558], 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v6);

  }
}

- (id)_ellipsisHighlightedBackgroundImage
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PLMappedImageCache sharedCache](PLMappedImageCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.ellipsesHighlightImage"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageForKey:generatingIfNecessaryWithBlock:", v6, &__block_literal_global_5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __73__PLExpandedPlatterHeaderContentView__ellipsisHighlightedBackgroundImage__block_invoke()
{
  id v0;
  id v1;
  double v2;
  void *v3;
  CGSize v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  BSRectWithSize();
  objc_msgSend(v0, "setBounds:");
  objc_msgSend(MEMORY[0x1E0CEA478], "_tertiaryLabelColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v0, "setBackgroundColor:", objc_msgSend(v1, "CGColor"));

  objc_msgSend(v0, "setCornerRadius:", 15.0);
  v2 = PLMainScreenScale();
  v5.height = 30.0;
  v5.width = 40.0;
  UIGraphicsBeginImageContextWithOptions(v5, 0, v2);
  objc_msgSend(v0, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureUtilityButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PLExpandedPlatterHeaderContentView;
  -[PLPlatterHeaderContentView _configureUtilityButton](&v16, sel__configureUtilityButton);
  v3 = (void *)MEMORY[0x1E0CEA638];
  PlatterKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("ellipsis"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "_secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_flatImageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPlatterHeaderContentView utilityButton](self, "utilityButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:forState:", v7, 0);

  -[PLPlatterHeaderContentView utilityButton](self, "utilityButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLExpandedPlatterHeaderContentView _ellipsisHighlightedBackgroundImage](self, "_ellipsisHighlightedBackgroundImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundImage:forState:", v10, 1);

  -[PLPlatterHeaderContentView utilityButton](self, "utilityButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdjustsImageWhenHighlighted:", 0);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[PLPlatterHeaderContentView utilityButton](self, "utilityButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPointerInteractionEnabled:", 1);

    -[PLPlatterHeaderContentView utilityButton](self, "utilityButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPointerStyleProvider:", &__block_literal_global_19);

  }
  -[PLExpandedPlatterHeaderContentView _updateUtilityButtonVibrantStyling](self, "_updateUtilityButtonVibrantStyling");

}

id __61__PLExpandedPlatterHeaderContentView__configureUtilityButton__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v2 = (objc_class *)MEMORY[0x1E0CEAA98];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithView:", v3);
  objc_msgSend(MEMORY[0x1E0CEA848], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithRoundedRect:cornerRadius:", v7, v9, v11, v13, 13.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_layoutTitleLabelWithScale:(double)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  _BOOL4 v13;
  int v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  void *v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  -[PLPlatterHeaderContentView _titleLabel](self, "_titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v49 = v4;
    -[PLExpandedPlatterHeaderContentView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout");
    v14 = -[PLExpandedPlatterHeaderContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    if (v13)
    {
      -[PLExpandedPlatterHeaderContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      v50.origin.x = v6;
      v50.origin.y = v8;
      v50.size.width = v10;
      v50.size.height = v12;
      -[PLExpandedPlatterHeaderContentView _titleLabelBoundsForSize:](self, "_titleLabelBoundsForSize:", CGRectGetWidth(v50) + -16.0 + -56.0, 1.79769313e308);
      objc_msgSend(v49, "setBounds:");
      objc_msgSend(v49, "frame");
      v46 = v16;
      v48 = v15;
      v18 = v17;
      v20 = v19;
      -[PLPlatterHeaderContentView iconButtons](self, "iconButtons");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "count");

      if (v14)
      {
        v51.origin.x = v6;
        v51.origin.y = v8;
        v51.size.width = v10;
        v51.size.height = v12;
        CGRectGetWidth(v51);
        v52.origin.y = v46;
        v52.origin.x = v48;
        v52.size.width = v18;
        v52.size.height = v20;
        CGRectGetWidth(v52);
      }
      -[PLExpandedPlatterHeaderContentView _largeTextTitleLabelBaselineOffset](self, "_largeTextTitleLabelBaselineOffset");
      objc_msgSend(v49, "_firstLineBaselineOffsetFromBoundsTop");
    }
    else
    {
      objc_msgSend(v49, "sizeToFit");
      objc_msgSend(v49, "frame");
      v45 = v22;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      -[PLPlatterHeaderContentView _dateLabel](self, "_dateLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = 72.0;
      }
      else
      {
        -[PLPlatterHeaderContentView _utilityButton](self, "_utilityButton");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          v30 = 72.0;
        else
          v30 = 0.0;

      }
      v47 = v28;
      v32 = v24;
      v33 = v26;
      v34 = v6;
      if ((v14 & 1) != 0)
      {
        v35 = v8;
      }
      else
      {
        v53.origin.x = v6;
        v35 = v8;
        v53.origin.y = v8;
        v53.size.width = v10;
        v53.size.height = v12;
        v30 = CGRectGetMaxX(v53) - v30;
      }
      -[PLPlatterHeaderContentView iconButtons](self, "iconButtons");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "count"))
        v37 = 16.0;
      else
        v37 = 17.0;

      if (v14)
      {
        v54.origin.x = v34;
        v54.origin.y = v35;
        v54.size.width = v10;
        v54.size.height = v12;
        v43 = v10;
        v44 = v12;
        v38 = CGRectGetWidth(v54) - v37;
        v55.origin.y = v32;
        v55.size.width = v33;
        v55.origin.x = v45;
        v55.size.height = v47;
        v39 = v38 - CGRectGetWidth(v55);
        if (v30 >= v39)
          v40 = v30;
        else
          v40 = v39;
        v56.origin.x = v40;
        v56.origin.y = v32;
        v56.size.width = v33;
        v56.size.height = v47;
        CGRectGetWidth(v56);
        v57.origin.x = v34;
        v57.origin.y = v35;
        v57.size.width = v10;
        v57.size.height = v44;
        CGRectGetMaxX(v57);
        v58.origin.x = v40;
        v58.origin.y = v32;
        v58.size.width = v33;
        v58.size.height = v47;
        CGRectGetMinX(v58);
      }
      else
      {
        v59.origin.x = v37;
        v59.origin.y = v32;
        v59.size.width = v33;
        v59.size.height = v47;
        CGRectGetWidth(v59);
        v60.origin.x = v37;
        v60.origin.y = v32;
        v60.size.width = v33;
        v60.size.height = v47;
        CGRectGetMinX(v60);
      }
      objc_msgSend(v49, "font", *(_QWORD *)&v43, *(_QWORD *)&v44);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "capHeight");
      objc_msgSend(v49, "font");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_scaledValueForValue:", 16.0);
      objc_msgSend(v49, "_firstLineBaselineOffsetFromBoundsTop");

    }
    UIRectIntegralWithScale();
    objc_msgSend(v49, "setFrame:");
    v4 = v49;
  }

}

- (void)_layoutUtilityButtonWithScale:(double)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Width;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[PLPlatterHeaderContentView utilityButton](self, "utilityButton");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  BSRectWithSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PLPlatterHeaderContentView _utilityButtonHorizontalLayoutReference](self, "_utilityButtonHorizontalLayoutReference");
  if (v12 <= 0.0)
  {
    v26.origin.x = v5;
    v26.origin.y = v7;
    v26.size.width = v9;
    v26.size.height = v11;
    Width = CGRectGetWidth(v26);
    objc_msgSend(v24, "imageForState:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v21 = (Width - v20) * 0.5;

    if (-[PLExpandedPlatterHeaderContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[PLExpandedPlatterHeaderContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      v14 = 16.0 - v21;
    }
    else
    {
      -[PLExpandedPlatterHeaderContentView bounds](self, "bounds");
      v22 = CGRectGetWidth(v27);
      -[PLExpandedPlatterHeaderContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      v14 = v21 + v22 + -16.0 + -40.0;
    }
  }
  else
  {
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    CGRectGetMidY(v25);
    UIRectCenteredAboutPoint();
    v14 = v13;
    v7 = v15;
    v9 = v16;
    v11 = v17;
  }
  -[PLExpandedPlatterHeaderContentView frame](self, "frame");
  -[PLExpandedPlatterHeaderContentView _headerHeightForWidth:](self, "_headerHeightForWidth:", v23);
  if (-[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout"))
  {
    -[PLExpandedPlatterHeaderContentView _titleFirstLineCenterY](self, "_titleFirstLineCenterY");
  }
  else
  {
    v28.origin.x = v14;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    CGRectGetHeight(v28);
  }
  UIRectIntegralWithScale();
  objc_msgSend(v24, "setFrame:");

}

- (double)_titleFirstLineCenterY
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[PLPlatterHeaderContentView _titleLabelFont](self, "_titleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capHeight");
  v5 = v4;

  -[PLExpandedPlatterHeaderContentView _largeTextTitleLabelBaselineOffset](self, "_largeTextTitleLabelBaselineOffset");
  return v6 + v5 * -0.5;
}

- (CGRect)_titleLabelBoundsForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[PLPlatterHeaderContentView _titleLabel](self, "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  BSRectWithSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)_largeTextTitleLabelBaselineOffset
{
  void *v2;
  double v3;
  double v4;

  -[PLPlatterHeaderContentView _titleLabelFont](self, "_titleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 16.5);
  v4 = v3;

  return v4;
}

- (double)_largeTextLabelBaselineOffsetFromBottom
{
  void *v2;
  double v3;
  double v4;

  -[PLPlatterHeaderContentView _titleLabelFont](self, "_titleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 6.5);
  v4 = v3;

  return v4;
}

@end
