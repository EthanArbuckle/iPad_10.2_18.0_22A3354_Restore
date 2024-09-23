@implementation PXZoomableInlineHeaderView

- (PXZoomableInlineHeaderView)initWithFrame:(CGRect)a3
{
  PXZoomableInlineHeaderView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXZoomableInlineHeaderView;
  v3 = -[PXZoomableInlineHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomableInlineHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PXZoomableInlineHeaderView _setupViews](v3, "_setupViews");
  }
  return v3;
}

- (void)setUserData:(id)a3
{
  PXZoomableInlineHeaderViewConfiguration *v5;
  PXZoomableInlineHeaderViewConfiguration *v6;

  v5 = (PXZoomableInlineHeaderViewConfiguration *)a3;
  if (self->_userData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userData, a3);
    -[PXZoomableInlineHeaderView _updateConfiguration](self, "_updateConfiguration");
    v5 = v6;
  }

}

- (void)_updateConfiguration
{
  void *v3;

  -[PXZoomableInlineHeaderView _configureViews](self, "_configureViews");
  -[PXZoomableInlineHeaderView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomableInlineHeaderView _updateButtonWithConfiguration:](self, "_updateButtonWithConfiguration:", v3);

  -[PXZoomableInlineHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PXZoomableInlineHeaderView isHidden](self, "isHidden") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXZoomableInlineHeaderView;
    -[PXZoomableInlineHeaderView setHidden:](&v5, sel_setHidden_, v3);
    -[PXZoomableInlineHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setupViews
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
  UILabel *v12;
  void *v13;
  UILabel *titleLabel;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *subtitleLabel;
  UILabel *v19;

  -[PXZoomableInlineHeaderView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

  -[PXZoomableInlineHeaderView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXZoomableInlineHeaderView _setupBackgroundView](self, "_setupBackgroundView");
  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v7, v9, v11);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  -[UILabel setLineBreakMode:](v12, "setLineBreakMode:", 4);
  -[UILabel setTextAlignment:](v12, "setTextAlignment:", 0);
  -[UILabel setNumberOfLines:](v12, "setNumberOfLines:", 1);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;
  v15 = v12;

  -[PXZoomableInlineHeaderView addSubview:](self, "addSubview:", v15);
  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v7, v9, v11);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v16, "setTextColor:", v17);

  -[UILabel setLineBreakMode:](v16, "setLineBreakMode:", 4);
  -[UILabel setTextAlignment:](v16, "setTextAlignment:", 0);
  -[UILabel setNumberOfLines:](v16, "setNumberOfLines:", 1);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v16;
  v19 = v16;

  -[PXZoomableInlineHeaderView addSubview:](self, "addSubview:", v19);
  -[PXZoomableInlineHeaderView _platformSpecificViewSetup](self, "_platformSpecificViewSetup");
}

- (void)_configureViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_tintView)
  {
    -[PXZoomableInlineHeaderView _tintViewBackgroundColor](self, "_tintViewBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_tintView, "setBackgroundColor:", v3);

    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoomingHeaderTintOpacity");
    -[UIView setAlpha:](self->_tintView, "setAlpha:");

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v6);

}

- (void)_updateButtonWithConfiguration:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  UILabel **p_titleLabel;
  void *v8;
  UILabel **p_subtitleLabel;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (self->_effectView)
  {
    -[PXZoomableInlineHeaderView _setEffectViewCornerRadius:](self, "_setEffectViewCornerRadius:", 5.0);
  }
  else
  {
    -[UIView layer](self->_tintView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", 5.0);
    objc_msgSend(v4, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  }
  v5 = objc_msgSend(v15, "style");
  objc_msgSend((id)objc_opt_class(), "_titleFontForStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_titleLabel = &self->_titleLabel;
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  objc_msgSend((id)objc_opt_class(), "_subtitleFontForStyle:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_subtitleLabel = &self->_subtitleLabel;
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v8);

  objc_msgSend(v15, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHidden:](*p_subtitleLabel, "setHidden:", objc_msgSend(v10, "length") == 0);

  if (objc_msgSend(v15, "swapTitleAndSubtitle")
    && (-[UILabel isHidden](*p_subtitleLabel, "isHidden") & 1) == 0)
  {
    objc_msgSend(v15, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](*p_titleLabel, "setText:", v14);

    objc_msgSend(v15, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id *)p_titleLabel;
    p_titleLabel = p_subtitleLabel;
  }
  else
  {
    objc_msgSend(v15, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](*p_titleLabel, "setText:", v11);

    objc_msgSend(v15, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id *)p_subtitleLabel;
  }
  -[UILabel setText:](*p_subtitleLabel, "setText:", v12);

  objc_msgSend(*v13, "setAlpha:", 0.5);
  -[UILabel setAlpha:](*p_titleLabel, "setAlpha:", 1.0);

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  UILabel *v6;
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
  double v18;
  double v19;
  double v20;
  double MaxX;
  UIVisualEffectView *effectView;
  double v23;
  UIVisualEffectView *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
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
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  UIVisualEffectView *tintView;
  UILabel *v61;
  _BOOL4 v62;
  void *v63;
  uint64_t v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  UILabel *v74;
  double v75;
  double v76;
  double v77;
  objc_super v78;
  CGRect v79;
  CGRect v80;

  v78.receiver = self;
  v78.super_class = (Class)PXZoomableInlineHeaderView;
  -[PXZoomableInlineHeaderView layoutSubviews](&v78, sel_layoutSubviews);
  if ((-[PXZoomableInlineHeaderView isHidden](self, "isHidden") & 1) == 0)
  {
    -[PXZoomableInlineHeaderView userData](self, "userData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "style");
    v5 = -[PXZoomableInlineHeaderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v6 = self->_titleLabel;
    v74 = self->_subtitleLabel;
    -[PXZoomableInlineHeaderView bounds](self, "bounds");
    v8 = v7 + -20.0;
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], v10);
    v12 = v11;
    v14 = v13;
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v9, v10);
    if (v12 >= v8)
      v17 = v8;
    else
      v17 = v12;
    if (v15 >= v8)
      v15 = v8;
    v75 = v15;
    v76 = v16;
    objc_msgSend((id)objc_opt_class(), "_heightForStyle:", v4);
    v19 = v18;
    v20 = v18 * 0.5 - v14 * 0.5;
    v79.origin.x = 10.0;
    v79.origin.y = v20;
    v79.size.width = v17;
    v79.size.height = v14;
    MaxX = CGRectGetMaxX(v79);
    -[PXZoomableInlineHeaderView px_screenScale](self, "px_screenScale");
    effectView = self->_effectView;
    if (!effectView)
      effectView = (UIVisualEffectView *)self->_tintView;
    v23 = MaxX + 4.0;
    v24 = effectView;
    -[UILabel text](self->_subtitleLabel, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    v27 = v14;
    v28 = v17;
    v29 = v20;
    v30 = 10.0;
    if (v26)
    {
      v31 = v20;
      v32 = v17;
      v33 = v14;
      v80.origin.x = MaxX + 4.0;
      v80.origin.y = v20;
      v80.size.width = v75;
      v80.size.height = v76;
      *(CGRect *)&v30 = CGRectUnion(*(CGRect *)&v30, v80);
    }
    v34 = CGRectGetMaxX(*(CGRect *)&v30) + 10.0;
    v35 = PXRectRoundToPixel();
    if (v5 == 1)
    {
      v72 = v39;
      v73 = v36;
      v70 = v37;
      v71 = v38;
      v40 = MEMORY[0x1A85CD2B8](v35, 10.0, v20, v17, v14, 0.0, 0.0, v34, v19);
      v42 = v41;
      v44 = v43;
      v69 = v45;
      v77 = MEMORY[0x1A85CD2B8](v23, v20, v75, v76, 0.0, 0.0, v34, v19);
      v47 = v46;
      v67 = v49;
      v68 = v48;
      v50 = -[PXZoomableInlineHeaderView bounds](self, "bounds");
      v52 = v51;
      v54 = v53;
      v56 = v55;
      v58 = v57;
      MEMORY[0x1A85CD2B8](v50, v40, v42, v44, v69, v51, v53, v55, v57);
      MEMORY[0x1A85CD2B8](v77, v47, v68, v67, v52, v54, v56, v58);
      MEMORY[0x1A85CD2B8](v73, v70, v71, v72, v52, v54, v56, v58);
    }
    -[UIVisualEffectView setFrame:](v24, "setFrame:");
    PXRectRoundToPixel();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    PXRectRoundToPixel();
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
    -[UILabel text](v6, "text");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "length"))
    {

      tintView = self->_effectView;
      v61 = v74;
      if (tintView)
      {
        v62 = 0;
LABEL_17:
        v65 = (double)!v62;
LABEL_18:
        -[UIVisualEffectView setAlpha:](tintView, "setAlpha:", v65);
LABEL_21:

        return;
      }
    }
    else
    {
      v61 = v74;
      -[UILabel text](v74, "text");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "length");
      v62 = v64 == 0;

      tintView = self->_effectView;
      if (tintView)
        goto LABEL_17;
      if (!v64)
      {
        tintView = (UIVisualEffectView *)self->_tintView;
        v65 = 0.0;
        goto LABEL_18;
      }
    }
    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "zoomingHeaderTintOpacity");
    -[UIView setAlpha:](self->_tintView, "setAlpha:");

    goto LABEL_21;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXZoomableInlineHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[PXZoomableInlineHeaderView _updateConfiguration](self, "_updateConfiguration");
}

- (void)_setupBackgroundView
{
  void *v3;
  int v4;
  id v5;
  UIVisualEffectView *v6;
  void *v7;
  UIVisualEffectView *effectView;
  UIView *v9;
  id v10;
  UIView *v11;
  UIView *tintView;
  UIView *v13;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableHeaderBlur");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[PXZoomableInlineHeaderView bounds](self, "bounds");
    v6 = (UIVisualEffectView *)objc_msgSend(v5, "initWithFrame:");
    objc_msgSend(MEMORY[0x1E0DC3510], "_effectWithBlurRadius:scale:", 20.0, 0.25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](v6, "setEffect:", v7);

    -[UIVisualEffectView _setGroupName:](v6, "_setGroupName:", CFSTR("PXZoomableInlineHeaderGroupName"));
    effectView = self->_effectView;
    self->_effectView = v6;
    v9 = v6;

    v13 = v9;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PXZoomableInlineHeaderView bounds](self, "bounds");
    v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    tintView = self->_tintView;
    self->_tintView = v11;
    v13 = v11;

    v9 = self->_tintView;
  }
  -[PXZoomableInlineHeaderView addSubview:](self, "addSubview:", v9);

}

- (void)_setEffectViewCornerRadius:(double)a3
{
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_effectView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, a3);
}

- (id)_tintViewBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXZoomableInlineHeaderViewConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (id)_titleFontForStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  _QWORD *v9;

  if (PXTitleFontForInlineHeaderStyle_onceToken != -1)
    dispatch_once(&PXTitleFontForInlineHeaderStyle_onceToken, &__block_literal_global_102419);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)PXTitleFontForInlineHeaderStyle_fontCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    v9 = (_QWORD *)MEMORY[0x1E0DC48F0];
    if (!IsAccessibilityCategory)
      v9 = (_QWORD *)MEMORY[0x1E0DC4900];
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *v9, 32770);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)PXTitleFontForInlineHeaderStyle_fontCache, "setObject:forKey:", v5, v4);
  }

  return v5;
}

+ (CGSize)sizeWithConfiguration:(id)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "_heightForStyle:", objc_msgSend(a3, "style"));
  v4 = v3;
  v5 = 200.0;
  result.height = v4;
  result.width = v5;
  return result;
}

+ (double)_heightForStyle:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 == 1)
    return 34.0;
  if (a3)
  {
    v13 = v4;
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v6, v5, v13, v14, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXZoomableInlineHeaderView.m"), 136, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 28.0;
}

+ (double)_titleBaselineDistanceForFont:(id)a3
{
  double result;

  objc_msgSend(a3, "_scaledValueForValue:", 21.0);
  return result;
}

@end
