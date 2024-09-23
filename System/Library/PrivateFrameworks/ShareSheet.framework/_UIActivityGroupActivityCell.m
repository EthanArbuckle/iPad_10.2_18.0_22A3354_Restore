@implementation _UIActivityGroupActivityCell

- (_UIActivityGroupActivityCell)initWithFrame:(CGRect)a3
{
  _UIActivityGroupActivityCell *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _UIActivityGroupActivityCell *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_UIActivityGroupActivityCell;
  v3 = -[_UIActivityGroupActivityCell initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v4, "setContentMode:", 2);
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 10.0);

    objc_msgSend(v4, "setClipsToBounds:", 1);
    -[_UIActivityGroupActivityCell setImageView:](v3, "setImageView:", v4);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v6, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.25);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    objc_msgSend(v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowColor:", v9);

    objc_msgSend(v6, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1058642330;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v6, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowOffset:", v13, v14);

    objc_msgSend(v6, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowRadius:", 5.0);

    objc_msgSend(v6, "setAlpha:", 0.4);
    -[_UIActivityGroupActivityCell setShadowView:](v3, "setShadowView:", v6);
    v17 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 12.0);

    -[_UIActivityGroupActivityCell setImageSlot:](v3, "setImageSlot:", v17);
    v19 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[_UIActivityGroupActivityCell setTitleSlot:](v3, "setTitleSlot:", v19);
    -[_UIActivityGroupActivityCell contentView](v3, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v6);

    -[_UIActivityGroupActivityCell contentView](v3, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v4);

    -[_UIActivityGroupActivityCell contentView](v3, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v17);

    -[_UIActivityGroupActivityCell contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v19);

    createTitleLabel();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityGroupActivityCell setTitleLabel:](v3, "setTitleLabel:", v24);
    -[_UIActivityGroupActivityCell contentView](v3, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v24);

    v26 = v3;
  }

  return v3;
}

- (void)prepareForReuse
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
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIActivityGroupActivityCell;
  -[_UIActivityGroupActivityCell prepareForReuse](&v14, sel_prepareForReuse);
  -[_UIActivityGroupActivityCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[_UIActivityGroupActivityCell highlightedImageView](self, "highlightedImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[_UIActivityGroupActivityCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", 0);

  -[_UIActivityGroupActivityCell setShadowView:](self, "setShadowView:", 0);
  -[_UIActivityGroupActivityCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", 0);

  -[_UIActivityGroupActivityCell imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContents:", 0);

  -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContents:", 0);

  -[_UIActivityGroupActivityCell titleSlot](self, "titleSlot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContents:", 0);

}

+ (void)invalidatePreferredSizes
{
  objc_msgSend((id)sCachedPreferredSizesBySheetParams, "removeAllObjects");
}

+ (CGSize)preferredSizeForSheetWidth:(double)a3 sizeCategory:(id)a4 titleLabelText:(id)a5 screenScale:(double)a6
{
  NSString *v8;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double ChickletSize;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  double v27;
  void *v28;
  id v29;
  NSString *v30;
  NSString *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  uint64_t v38;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  _QWORD v48[2];
  CGSize result;

  v8 = (NSString *)a4;
  v9 = a5;
  if (sCachedPreferredSizesBySheetParams)
  {
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v11 = (void *)sCachedPreferredSizesBySheetParams;
    sCachedPreferredSizesBySheetParams = (uint64_t)v10;

    if (!v8)
      goto LABEL_7;
  }
  if (UIContentSizeCategoryIsAccessibilityCategory(v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), v9, (uint64_t)a3);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = 1;
    goto LABEL_8;
  }
LABEL_7:
  v13 = 0;
  v12 = CFSTR("~");
LABEL_8:
  objc_msgSend((id)sCachedPreferredSizesBySheetParams, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "CGSizeValue");
    v17 = v16;
    v19 = v18;
  }
  else
  {
    ChickletSize = getChickletSize();
    if (v13)
    {
      if (!sCachedCellWidthBySheetWidth)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C99D38]);
        v22 = (void *)sCachedCellWidthBySheetWidth;
        sCachedCellWidthBySheetWidth = (uint64_t)v21;

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)sCachedCellWidthBySheetWidth, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "floatValue");
        v27 = v26;
      }
      else
      {
        v27 = 240.0;
        v37 = a3 / 240.0 - floor(a3 / 240.0);
        v38 = 10;
        do
        {
          if (v37 >= 0.25 && v37 <= 0.5)
            break;
          v27 = v27 + 10.0;
          v37 = a3 / v27 - floor(a3 / v27);
          --v38;
        }
        while (v38);
        v40 = (void *)sCachedCellWidthBySheetWidth;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27, 0.5, 10.0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKey:", v41, v23);

      }
      getTitleLabelHeightForWidthTextAndSizeCategory(v9, v8, v27 + -1.0 - ChickletSize);
    }
    else
    {
      objc_msgSend((id)sTitleLabel, "_screen");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _UIActivityGroupActivityCellFont(v8, v28);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v8;
      v31 = v30;
      v32 = 1.0;
      if (v8
        && UIContentSizeCategoryCompareToCategory(v30, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) != NSOrderedAscending)
      {
        objc_msgSend(v29, "pointSize");
        v34 = v33 / 11.0;
        if (v34 <= 2.0)
          v32 = v34;
        else
          v32 = 2.0;
      }

      v35 = ChickletSize * v32 + 0.0;
      getTitleLabelFontForWidthTextAndSizeCategory(v31, v35 + -1.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "ascender");
      getTitleLabelHeightForWidthTextAndSizeCategory(CFSTR("\n"), v31, v35);
      objc_msgSend(v36, "descender");

    }
    UIRectIntegralWithScale();
    v17 = v42;
    v19 = v43;
    v44 = (void *)sCachedPreferredSizesBySheetParams;
    *(double *)v48 = v42;
    *(double *)&v48[1] = v43;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v48, "{CGSize=dd}");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKey:", v45, v12);

  }
  v46 = v17;
  v47 = v19;
  result.height = v47;
  result.width = v46;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_opt_class();
  -[_UIActivityGroupActivityCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupActivityCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupActivityCell traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  objc_msgSend(v5, "preferredSizeForSheetWidth:sizeCategory:titleLabelText:screenScale:", v7, v9, width, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  NSString *v4;
  int v5;
  _BOOL4 IsAccessibilityCategory;
  void *v7;
  void *v8;
  void *v9;
  double ChickletSize;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double Width;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  objc_super v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v81.receiver = self;
  v81.super_class = (Class)_UIActivityGroupActivityCell;
  -[_UIActivityGroupActivityCell layoutSubviews](&v81, sel_layoutSubviews);
  -[_UIActivityGroupActivityCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = -[_UIActivityGroupActivityCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);
  -[_UIActivityGroupActivityCell traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");

  -[_UIActivityGroupActivityCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  CGRectGetMidX(v82);

  -[_UIActivityGroupActivityCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  CGRectGetMidY(v83);

  ChickletSize = getChickletSize();
  if (IsAccessibilityCategory)
  {
    if (v5)
    {
      -[_UIActivityGroupActivityCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      CGRectGetMaxX(v84);

    }
    UIRoundToScale();
  }
  UIRectIntegralWithScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_UIActivityGroupActivityCell shadowView](self, "shadowView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  v21 = (void *)MEMORY[0x1E0DC3508];
  -[_UIActivityGroupActivityCell shadowView](self, "shadowView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  objc_msgSend(v21, "bezierPathWithRoundedRect:cornerRadius:");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = objc_msgSend(v23, "CGPath");
  -[_UIActivityGroupActivityCell shadowView](self, "shadowView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShadowPath:", v24);

  UIRectIntegralWithScale();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[_UIActivityGroupActivityCell imageView](self, "imageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v32;
  v37 = ChickletSize;
  objc_msgSend(v35, "setFrame:", v28, v30, v36, v34);

  UIRectIntegralWithScale();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  -[_UIActivityGroupActivityCell contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  Width = CGRectGetWidth(v85);

  if (IsAccessibilityCategory)
  {
    -[_UIActivityGroupActivityCell titleLabel](self, "titleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "text");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    getTitleLabelHeightForWidthTextAndSizeCategory(v50, v4, Width - (v37 + 1.0 + 10.0));

    if ((v5 & 1) == 0)
    {
      -[_UIActivityGroupActivityCell imageView](self, "imageView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "frame");
      CGRectGetMaxX(v86);

    }
  }
  else
  {
    getTitleLabelHeightForWidthTextAndSizeCategory(CFSTR("\n"), v4, Width + -1.0);
    getTitleLabelFontForWidthTextAndSizeCategory(v4, Width + -1.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "ascender");
    -[_UIActivityGroupActivityCell imageView](self, "imageView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "frame");
    CGRectGetMaxY(v87);

  }
  UIRectIntegralWithScale();
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;
  -[_UIActivityGroupActivityCell titleLabel](self, "titleLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", v55, v57, v59, v61);

  -[_UIActivityGroupActivityCell titleLabel](self, "titleLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "frame");
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;
  -[_UIActivityGroupActivityCell titleSlot](self, "titleSlot");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[_UIActivityGroupActivityCell contentView](self, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "frame");
    v75 = v74;
    v77 = v76;
    v79 = v78;

    -[_UIActivityGroupActivityCell contentView](self, "contentView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setFrame:", v75, 0.0, v77, v79);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  BOOL IsAccessibilityCategory;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIActivityGroupActivityCell;
  v4 = a3;
  -[_UIActivityGroupActivityCell traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[_UIActivityGroupActivityCell traitCollection](self, "traitCollection", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
  {
    -[_UIActivityGroupActivityCell traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC4938]) & 1) == 0)
    {
      -[_UIActivityGroupActivityCell traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredContentSizeCategory");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

      if (!IsAccessibilityCategory)
        objc_msgSend((id)sCachedCellWidthBySheetWidth, "removeAllObjects");
    }

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
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
  objc_super v16;

  v3 = a3;
  -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIActivityGroupActivityCell titleSlot](self, "titleSlot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)_UIActivityGroupActivityCell;
  -[_UIActivityGroupActivityCell setHighlighted:](&v16, sel_setHighlighted_, v3);
  -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContents:", v7);

  -[_UIActivityGroupActivityCell titleSlot](self, "titleSlot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContents:", v10);

  -[_UIActivityGroupActivityCell initHighlightLayerIfNeeded](self, "initHighlightLayerIfNeeded");
  -[_UIActivityGroupActivityCell highlightLayer](self, "highlightLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", v3 ^ 1);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
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
  objc_super v15;

  v3 = a3;
  -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIActivityGroupActivityCell titleSlot](self, "titleSlot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)_UIActivityGroupActivityCell;
  -[_UIActivityGroupActivityCell setSelected:](&v15, sel_setSelected_, v3);
  -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContents:", v7);

  -[_UIActivityGroupActivityCell titleSlot](self, "titleSlot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContents:", v10);

}

- (void)initHighlightLayerIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UIActivityGroupActivityCell highlightLayer](self, "highlightLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.466666667);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

    objc_msgSend(v9, "setCornerRadius:", 12.0);
    -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v9, "setFrame:");

    objc_msgSend(v9, "setHidden:", 1);
    -[_UIActivityGroupActivityCell setHighlightLayer:](self, "setHighlightLayer:", v9);
    -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSublayer:atIndex:", v9, 0);

  }
}

- (void)updateHighlightedImageViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[_UIActivityGroupActivityCell initHighlightedImageViewIfNeeded](self, "initHighlightedImageViewIfNeeded");
  -[_UIActivityGroupActivityCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupActivityCell highlightedImageView](self, "highlightedImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

- (void)initHighlightedImageViewIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[_UIActivityGroupActivityCell highlightedImageView](self, "highlightedImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __64___UIActivityGroupActivityCell_initHighlightedImageViewIfNeeded__block_invoke;
    v4[3] = &unk_1E4001608;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
  }
}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unint64_t)a3
{
  self->_sequence = a3;
}

- (_UIActivityGroupActivityCellTitleLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)imageSlot
{
  return self->_imageSlot;
}

- (void)setImageSlot:(id)a3
{
  objc_storeStrong((id *)&self->_imageSlot, a3);
}

- (UIView)titleSlot
{
  return self->_titleSlot;
}

- (void)setTitleSlot:(id)a3
{
  objc_storeStrong((id *)&self->_titleSlot, a3);
}

- (_UIHostActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (void)setActivityProxy:(id)a3
{
  objc_storeStrong((id *)&self->_activityProxy, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIImageView)highlightedImageView
{
  return self->_highlightedImageView;
}

- (void)setHighlightedImageView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedImageView, a3);
}

- (CALayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_highlightedImageView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_titleSlot, 0);
  objc_storeStrong((id *)&self->_imageSlot, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (id)draggingView
{
  double v3;
  double v4;
  double v5;
  double v6;
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

  -[_UIActivityGroupActivityCell frame](self, "frame");
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", v3, v4, v5, v6);
  -[_UIActivityGroupActivityCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[_UIActivityGroupActivityCell imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v12);

  -[_UIActivityGroupActivityCell shadowView](self, "shadowView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowView:", v14);

  objc_msgSend(v7, "setHighlighted:", -[_UIActivityGroupActivityCell isHighlighted](self, "isHighlighted"));
  -[_UIActivityGroupActivityCell imageSlot](self, "imageSlot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageSlot:", v15);

  -[_UIActivityGroupActivityCell titleSlot](self, "titleSlot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleSlot:", v16);

  objc_msgSend(v7, "setUserInteractionEnabled:", 0);
  return v7;
}

@end
