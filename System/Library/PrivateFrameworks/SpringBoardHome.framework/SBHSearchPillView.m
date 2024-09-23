@implementation SBHSearchPillView

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[SBHSearchPillView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[SBHSearchPillView searchLabel](self, "searchLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E0C9D820], v8);
  v10 = v9;

  -[SBHSearchPillView searchGlyphImageView](self, "searchGlyphImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v7, v8);
  v13 = v10 + v12 + 3.0 + 11.5 + 11.5;

  -[SBHSearchPillView halfFloatRoundForScale:scale:](self, "halfFloatRoundForScale:scale:", v13, v5);
  v15 = 30.0;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UILabel)searchLabel
{
  return self->_searchLabel;
}

- (UIImageView)searchGlyphImageView
{
  return self->_searchGlyphImageView;
}

- (double)halfFloatRoundForScale:(double)a3 scale:(double)a4
{
  double v4;

  BSFloatRoundForScale();
  return v4 + v4;
}

+ (id)searchPillViewWithSystemDefaultBackground
{
  return -[SBHSearchPillView initWithBackgroundViewProvider:]([SBHSearchPillView alloc], "initWithBackgroundViewProvider:", &__block_literal_global);
}

uint64_t __62__SBHSearchPillView_searchPillViewWithSystemDefaultBackground__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
}

- (SBHSearchPillView)initWithBackgroundViewProvider:(id)a3
{
  void (**v4)(_QWORD);
  SBHSearchPillView *v5;
  uint64_t v6;
  id backgroundViewProvider;
  void *v8;
  void *v9;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[SBHSearchPillView init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    backgroundViewProvider = v5->_backgroundViewProvider;
    v5->_backgroundViewProvider = (id)v6;

    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHSearchPillView _backdropGroupNameBase](v5, "_backdropGroupNameBase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupNameBase:", v9);

    -[SBHSearchPillView setBackgroundView:](v5, "setBackgroundView:", v8);
  }

  return v5;
}

- (SBHSearchPillView)init
{
  SBHSearchPillView *v2;
  UILabel *v3;
  UILabel *searchLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *searchGlyphImageView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *contentContainerView;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SBHSearchPillView;
  v2 = -[SBHSearchPillView init](&v27, sel_init);
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    searchLabel = v2->_searchLabel;
    v2->_searchLabel = v3;

    SBHBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCH_LABEL"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](v2->_searchLabel, "setText:", v6);
    objc_msgSend(MEMORY[0x1E0DC1358], "_preferredFontDescriptorWithTextStyle:weight:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC1438]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 12.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_searchLabel, "setFont:", v8);
    -[UILabel sizeToFit](v2->_searchLabel, "sizeToFit");
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    searchGlyphImageView = v2->_searchGlyphImageView;
    v2->_searchGlyphImageView = v9;

    v11 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v8, "pointSize");
    objc_msgSend(v11, "configurationWithPointSize:weight:scale:", 6, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageByApplyingSymbolConfiguration:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](v2->_searchGlyphImageView, "setImage:", v14);
    -[UIImageView sizeToFit](v2->_searchGlyphImageView, "sizeToFit");
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentContainerView = v2->_contentContainerView;
    v2->_contentContainerView = v15;

    -[UIView layer](v2->_contentContainerView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsGroupBlending:", 0);

    -[SBHSearchPillView addSubview:](v2, "addSubview:", v2->_contentContainerView);
    -[UIView addSubview:](v2->_contentContainerView, "addSubview:", v2->_searchGlyphImageView);
    -[UIView addSubview:](v2->_contentContainerView, "addSubview:", v2->_searchLabel);
    -[SBHSearchPillView intrinsicContentSize](v2, "intrinsicContentSize");
    BSRectWithSize();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[SBHSearchPillView setBounds:](v2, "setBounds:");
    -[UIView setFrame:](v2->_contentContainerView, "setFrame:", v19, v21, v23, v25);

  }
  return v2;
}

- (void)setLegibilitySettings:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;
  UILabel *searchLabel;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v5 = objc_msgSend(v13, "style");
    objc_msgSend(v13, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setTextColor:](self->_searchLabel, "setTextColor:", v7);
    -[UIImageView setTintColor:](self->_searchGlyphImageView, "setTintColor:", v7);
    v8 = (id *)MEMORY[0x1E0CD2EA0];
    if (v5 != 1)
      v8 = (id *)MEMORY[0x1E0CD2E98];
    searchLabel = self->_searchLabel;
    v10 = *v8;
    -[UILabel layer](searchLabel, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompositingFilter:", v10);

    -[UIImageView layer](self->_searchGlyphImageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCompositingFilter:", v10);

  }
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  v7 = v5;
  if (backgroundView != v5)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[SBHSearchPillView addSubview:](self, "addSubview:", v7);
    -[SBHSearchPillView sendSubviewToBack:](self, "sendSubviewToBack:", v7);
  }

}

- (void)setLabelAlignment:(int64_t)a3
{
  if (self->_labelAlignment != a3)
  {
    self->_labelAlignment = a3;
    -[SBHSearchPillView setNeedsLayout](self, "setNeedsLayout");
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
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  UILabel *v22;
  UIImageView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id *v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  void *v48;
  double v49;
  double v50;
  double MaxY;
  double v52;
  double v53;
  double v54;
  __int128 v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double width;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double rect;
  double v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  objc_super v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v71.receiver = self;
  v71.super_class = (Class)SBHSearchPillView;
  -[SBHSearchPillView layoutSubviews](&v71, sel_layoutSubviews);
  -[SBHSearchPillView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBHSearchPillView backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v8;
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  v63 = v10;
  if (-[SBHSearchPillView appliesSearchAffordanceCornerRadius](self, "appliesSearchAffordanceCornerRadius"))
    -[SBHSearchPillView searchAffordanceCornerRadius](self, "searchAffordanceCornerRadius");
  else
    v12 = v10 * 0.5;
  objc_msgSend(v11, "_setContinuousCornerRadius:", v12);
  -[SBHSearchPillView contentContainerView](self, "contentContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v65 = v14;
  v66 = v15;
  v17 = v16;
  v68 = v18;
  -[SBHSearchPillView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayScale");
  v21 = v20;

  v22 = self->_searchLabel;
  -[UILabel sizeToFit](v22, "sizeToFit");
  v23 = self->_searchGlyphImageView;
  -[UIImageView sizeToFit](v23, "sizeToFit");
  -[UIImageView bounds](v23, "bounds");
  v25 = v24;
  v27 = v26;
  rect = v28;
  BSFloatRoundForScale();
  v30 = v29;
  v31 = (id *)MEMORY[0x1E0DC4730];
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    v30 = v17 - v30 - v27;
  -[UILabel bounds](v22, "bounds");
  v32 = objc_msgSend(*v31, "userInterfaceLayoutDirection");
  v62 = v30;
  v33 = v30;
  v34 = v25;
  v35 = v25;
  v36 = v27;
  v37 = rect;
  if (v32 == 1)
    CGRectGetMinX(*(CGRect *)&v33);
  else
    CGRectGetMaxX(*(CGRect *)&v33);
  UIRectCenteredYInRectScale();
  v39 = v38;
  v61 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  BSFloatRoundForScale();
  v47 = v46 + v41;
  -[UIImageView image](v23, "image", v21);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "baselineOffsetFromBottom");
  v50 = v49;
  v72.origin.x = v39;
  v72.origin.y = v47;
  v72.size.width = v43;
  v72.size.height = v45;
  MaxY = CGRectGetMaxY(v72);
  v73.origin.x = v62;
  v73.origin.y = v34;
  v73.size.width = v27;
  v73.size.height = rect;
  v52 = v50 + MaxY - CGRectGetHeight(v73);
  -[UILabel _baselineOffsetFromBottom](v22, "_baselineOffsetFromBottom");
  -[UIImageView setFrame:](v23, "setFrame:", v62, v52 - v53, v27, rect);
  -[UILabel setFrame:](v22, "setFrame:", v61, v47, v43, v45);
  if (v64 / v17 >= v63 / v68)
    v54 = v63 / v68;
  else
    v54 = v64 / v17;
  if (BSFloatEqualToFloat())
  {
    v55 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v70.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v70.c = v55;
    *(_OWORD *)&v70.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v13, "setTransform:", &v70);
    objc_msgSend(v13, "setFrame:", v65, v66, v17, v68);
  }
  else
  {
    memset(&v70, 0, sizeof(v70));
    CGAffineTransformMakeScale(&v70, v54, v54);
    v69 = v70;
    objc_msgSend(v13, "setTransform:", &v69);
    UIRectGetCenter();
    v57 = v56;
    v59 = v58;
    if (-[SBHSearchPillView labelAlignment](self, "labelAlignment") != 1)
    {
      v69 = v70;
      v74.origin.x = v65;
      v74.origin.y = v66;
      v74.size.width = v17;
      v74.size.height = v68;
      v75 = CGRectApplyAffineTransform(v74, &v69);
      width = v75.size.width;
      if (objc_msgSend(*v31, "userInterfaceLayoutDirection", v75.origin.x, v75.origin.y) == 1)
        v57 = v64 - width * 0.5;
      else
        v57 = width * 0.5;
    }
    objc_msgSend(v13, "setCenter:", v57, v59);
  }

}

- (id)makeSearchAffordanceBackgroundCapturingView
{
  void (**backgroundViewProvider)(id, SEL);
  void *v4;
  void *v5;

  backgroundViewProvider = (void (**)(id, SEL))self->_backgroundViewProvider;
  if (backgroundViewProvider)
  {
    backgroundViewProvider[2](backgroundViewProvider, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHSearchPillView _backdropGroupNameBase](self, "_backdropGroupNameBase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGroupNameBase:", v5);

    objc_msgSend(v4, "setCaptureOnly:", 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CGRect)searchAffordanceReferenceFrame
{
  UIView *searchAffordanceReferenceView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  CGFloat x;
  double v15;
  CGFloat y;
  double v17;
  CGFloat width;
  double v19;
  CGFloat height;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
  if (searchAffordanceReferenceView)
  {
    -[UIView bounds](self->_searchAffordanceReferenceView, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchAffordanceReferenceContainerView);
    -[UIView convertRect:toView:](searchAffordanceReferenceView, "convertRect:toView:", WeakRetained, v5, v7, v9, v11);
    x = v13;
    y = v15;
    width = v17;
    height = v19;

  }
  else
  {
    x = self->_clientReferenceFrame.origin.x;
    y = self->_clientReferenceFrame.origin.y;
    width = self->_clientReferenceFrame.size.width;
    height = self->_clientReferenceFrame.size.height;
  }
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)setSearchAffordanceReferenceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_clientReferenceFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_clientReferenceFrame = &self->_clientReferenceFrame;
  if (!CGRectEqualToRect(self->_clientReferenceFrame, a3))
  {
    p_clientReferenceFrame->origin.x = x;
    p_clientReferenceFrame->origin.y = y;
    p_clientReferenceFrame->size.width = width;
    p_clientReferenceFrame->size.height = height;
  }
}

- (void)setAppliesSearchAffordanceCornerRadius:(BOOL)a3
{
  if (self->_appliesSearchAffordanceCornerRadius != a3)
  {
    self->_appliesSearchAffordanceCornerRadius = a3;
    -[SBHSearchPillView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSearchAffordanceCornerRadius:(double)a3
{
  if (self->_searchAffordanceCornerRadius != a3)
  {
    self->_searchAffordanceCornerRadius = a3;
    -[SBHSearchPillView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_backdropGroupNameBase
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBHSearchPillView::%p"), self);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)labelAlignment
{
  return self->_labelAlignment;
}

- (UIView)searchAffordanceReferenceView
{
  return self->_searchAffordanceReferenceView;
}

- (void)setSearchAffordanceReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_searchAffordanceReferenceView, a3);
}

- (UIView)searchAffordanceReferenceBackgroundView
{
  return self->_searchAffordanceReferenceBackgroundView;
}

- (void)setSearchAffordanceReferenceBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundView, a3);
}

- (UIView)searchAffordanceReferenceContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_searchAffordanceReferenceContainerView);
}

- (void)setSearchAffordanceReferenceContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_searchAffordanceReferenceContainerView, a3);
}

- (BOOL)appliesSearchAffordanceCornerRadius
{
  return self->_appliesSearchAffordanceCornerRadius;
}

- (double)searchAffordanceCornerRadius
{
  return self->_searchAffordanceCornerRadius;
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (CGRect)clientReferenceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clientReferenceFrame.origin.x;
  y = self->_clientReferenceFrame.origin.y;
  width = self->_clientReferenceFrame.size.width;
  height = self->_clientReferenceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClientReferenceFrame:(CGRect)a3
{
  self->_clientReferenceFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_searchGlyphImageView, 0);
  objc_storeStrong((id *)&self->_searchLabel, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_destroyWeak((id *)&self->_searchAffordanceReferenceContainerView);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
