@implementation VKImageAnalysisButton

- (void)setHighlightedGlyphScaleFactor:(double)a3 animation:(id)a4
{
  id v6;

  v6 = a4;
  -[VKImageAnalysisButton set_highlightedGlyphScaleFactor:](self, "set_highlightedGlyphScaleFactor:", a3);
  -[VKImageAnalysisButton set_highlightedGlyphAnimation:](self, "set_highlightedGlyphAnimation:", v6);

}

- (void)set_highlightedGlyphScaleFactor:(double)a3
{
  self->__highlightedGlyphScaleFactor = a3;
}

- (void)set_highlightedGlyphAnimation:(id)a3
{
  objc_storeStrong((id *)&self->__highlightedGlyphAnimation, a3);
}

- (VKImageAnalysisButton)initWithFrame:(CGRect)a3
{
  VKImageAnalysisButton *v3;
  VKImageAnalysisButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKImageAnalysisButton;
  v3 = -[VKImageAnalysisButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VKImageAnalysisButton _commonVKImageAnalysisButtonInitialization](v3, "_commonVKImageAnalysisButtonInitialization");
  return v4;
}

- (void)_commonVKImageAnalysisButtonInitialization
{
  UIColor *v3;
  UIColor *cameraModeBackgroundColor;
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;
  UIView *selectedBackgroundView;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[VKImageAnalysisButton setPreferredBehavioralStyle:](self, "setPreferredBehavioralStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.3);
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  cameraModeBackgroundColor = self->_cameraModeBackgroundColor;
  self->_cameraModeBackgroundColor = v3;

  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  backgroundView = self->__backgroundView;
  self->__backgroundView = v5;

  -[UIView setUserInteractionEnabled:](self->__backgroundView, "setUserInteractionEnabled:", 0);
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  selectedBackgroundView = self->__selectedBackgroundView;
  self->__selectedBackgroundView = v7;

  v9 = objc_alloc_init(MEMORY[0x1E0CEABE8]);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_storeStrong((id *)&self->__selectedBackgroundVisualEffectView, v9);
  -[UIView addSubview:](self->__selectedBackgroundView, "addSubview:", v9);
  v10 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v10, "setAutoresizingMask:", 18);
  objc_msgSend(v9, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  -[VKImageAnalysisButton set_selectedBackgroundColorView:](self, "set_selectedBackgroundColorView:", v10);
  v12 = objc_alloc_init(MEMORY[0x1E0CEABE8]);
  objc_msgSend(v12, "setAutoresizingMask:", 18);
  objc_storeStrong((id *)&self->__backgroundVisualEffectView, v12);
  -[UIView addSubview:](self->__backgroundView, "addSubview:", v12);
  -[UIView setUserInteractionEnabled:](self->__selectedBackgroundView, "setUserInteractionEnabled:", 0);
  -[UIView setAlpha:](self->__selectedBackgroundView, "setAlpha:", 0.0);
  self->_function = 0;
  self->_glyphConfiguration = 0;
  -[VKImageAnalysisButton _updateForTraitCollection](self, "_updateForTraitCollection");
  self->__highlightedGlyphScaleFactor = 1.0;
  -[UIView setClipsToBounds:](self->__selectedBackgroundView, "setClipsToBounds:", 1);
  -[UIView setClipsToBounds:](self->__backgroundView, "setClipsToBounds:", 1);
  -[VKImageAnalysisButton setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[VKImageAnalysisButton addSubview:](self, "addSubview:", self->__backgroundView);
  -[VKImageAnalysisButton addSubview:](self, "addSubview:", self->__selectedBackgroundView);
  -[VKImageAnalysisButton _updateBackgroundColors](self, "_updateBackgroundColors");
  -[VKImageAnalysisButton _updateGlyph](self, "_updateGlyph");
  v19[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)-[VKImageAnalysisButton registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v13, self, sel__updateForTraitCollection);

  -[VKImageAnalysisButton setPointerInteractionEnabled:](self, "setPointerInteractionEnabled:", 1);
  -[VKImageAnalysisButton setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", *MEMORY[0x1E0CEB3E0]);
  -[VKImageAnalysisButton setShowsLargeContentViewer:](self, "setShowsLargeContentViewer:", 1);
  v15 = objc_alloc_init(MEMORY[0x1E0CEA708]);
  -[VKImageAnalysisButton addInteraction:](self, "addInteraction:", v15);

  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)-[VKImageAnalysisButton registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v16, sel__updateForTraitCollection, v18[0]);

}

- (void)set_selectedBackgroundColorView:(id)a3
{
  objc_storeStrong((id *)&self->__selectedBackgroundColorView, a3);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKImageAnalysisButton;
  -[VKImageAnalysisButton setMaximumContentSizeCategory:](&v4, sel_setMaximumContentSizeCategory_, a3);
  -[VKImageAnalysisButton _updateForTraitCollection](self, "_updateForTraitCollection");
  -[VKImageAnalysisButton _updateGlyph](self, "_updateGlyph");
}

- (void)setGlyphRotation:(double)a3
{
  void *v4;
  _OWORD v5[6];

  if (self->_glyphRotation != a3)
  {
    self->_glyphRotation = a3;
    -[VKImageAnalysisButton _glyphTransformForRotation:highlighted:](self, "_glyphTransformForRotation:highlighted:", -[VKImageAnalysisButton isHighlighted](self, "isHighlighted"), a3);
    -[VKImageAnalysisButton imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v5[3];
    v5[1] = v5[4];
    v5[2] = v5[5];
    objc_msgSend(v4, "setTransform:", v5);

  }
}

- (void)_updateBackgroundColors
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[VKImageAnalysisButton function](self, "function");
  if (v3 - 1 >= 2)
  {
    if (v3)
    {
      v8 = 0;
      v5 = 0;
    }
    else
    {
      -[VKImageAnalysisButton tintColor](self, "tintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKImageAnalysisButton cameraModeBackgroundColor](self, "cameraModeBackgroundColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[VKImageAnalysisButton tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.85);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }
  -[VKImageAnalysisButton _selectedBackgroundColorView](self, "_selectedBackgroundColorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[VKImageAnalysisButton _backgroundView](self, "_backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

}

- (void)layoutSubviews
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _OWORD v25[6];
  objc_super v26;
  _OWORD v27[3];

  -[VKImageAnalysisButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v27[0] = *MEMORY[0x1E0C9BAA8];
  v27[1] = v4;
  v27[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v27);
  v26.receiver = self;
  v26.super_class = (Class)VKImageAnalysisButton;
  -[VKImageAnalysisButton layoutSubviews](&v26, sel_layoutSubviews);
  -[VKImageAnalysisButton _backgroundView](self, "_backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalysisButton _selectedBackgroundView](self, "_selectedBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v8, v10);
  -[VKImageAnalysisButton glyphRotation](self, "glyphRotation");
  -[VKImageAnalysisButton _glyphTransformForRotation:highlighted:](self, "_glyphTransformForRotation:highlighted:", -[VKImageAnalysisButton isHighlighted](self, "isHighlighted"), v11);
  v25[0] = v25[3];
  v25[1] = v25[4];
  v25[2] = v25[5];
  objc_msgSend(v3, "setTransform:", v25);
  -[VKImageAnalysisButton _selectedIndicatorBounds](self, "_selectedIndicatorBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v6, "setFrame:", v13, v15, v17, v19);
  objc_msgSend(v5, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerRadius:", v17 * 0.5);

  objc_msgSend(v6, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerRadius:", v17 * 0.5);

  -[VKImageAnalysisButton layer](self, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", v17 * 0.5);

  -[VKImageAnalysisButton _selectedBackgroundView](self, "_selectedBackgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalysisButton bringSubviewToFront:](self, "bringSubviewToFront:", v23);

  -[VKImageAnalysisButton imageView](self, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalysisButton bringSubviewToFront:](self, "bringSubviewToFront:", v24);

}

- (UIView)_selectedBackgroundView
{
  return self->__selectedBackgroundView;
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (double)glyphRotation
{
  return self->_glyphRotation;
}

- (unint64_t)function
{
  return self->_function;
}

- (UIColor)cameraModeBackgroundColor
{
  return self->_cameraModeBackgroundColor;
}

- (CGRect)_selectedIndicatorBounds
{
  void *v3;
  void *v4;
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
  double v16;
  CGRect result;

  -[VKImageAnalysisButton intrinsicContentSize](self, "intrinsicContentSize");
  -[VKImageAnalysisButton bounds](self, "bounds");
  -[VKImageAnalysisButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  UIRectCenteredIntegralRectScale();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UIView)_selectedBackgroundColorView
{
  return self->__selectedBackgroundColorView;
}

- (void)_updateForTraitCollection
{
  double v3;
  int v4;
  id v5;

  if (-[VKImageAnalysisButton supportsDynamicType](self, "supportsDynamicType"))
    -[VKImageAnalysisButton _updateGlyph](self, "_updateGlyph");
  if (!-[VKImageAnalysisButton didManuallySetBackgroundDiameter](self, "didManuallySetBackgroundDiameter"))
  {
    -[VKImageAnalysisButton traitCollection](self, "traitCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "vk_shouldUseLargeButtons") & 1) != 0)
    {
      v3 = 50.0;
    }
    else if (objc_msgSend(MEMORY[0x1E0CEA508], "vk_isiPad"))
    {
      v4 = objc_msgSend(v5, "vk_hasCompactWidth");
      v3 = 40.0;
      if (v4)
        v3 = 37.0;
    }
    else
    {
      v3 = 37.0;
    }
    if (self->_backgroundDiameter != v3)
    {
      self->_backgroundDiameter = v3;
      -[VKImageAnalysisButton setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

- (CGAffineTransform)_glyphTransformForRotation:(SEL)a3 highlighted:(double)a4
{
  _BOOL4 v5;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v5 = a5;
  -[VKImageAnalysisButton _highlightedGlyphScaleFactor](self, "_highlightedGlyphScaleFactor");
  v10 = v9;
  if (v5)
    v11 = v9;
  else
    v11 = 1.0;
  if (objc_msgSend(MEMORY[0x1E0CEA508], "vk_isiPad"))
  {
    -[VKImageAnalysisButton backgroundDiameter](self, "backgroundDiameter");
    if (v10 == 1.0 && v12 != 37.0)
      v11 = v11 * 1.08108108;
  }
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeRotation(&v18, a4);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, v11, v11);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v18;
  v15 = v17;
  return CGAffineTransformConcat(retstr, &t1, &v15);
}

- (double)_highlightedGlyphScaleFactor
{
  return self->__highlightedGlyphScaleFactor;
}

- (BOOL)didManuallySetBackgroundDiameter
{
  return self->_didManuallySetBackgroundDiameter;
}

- (void)_updateGlyph
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  const __CFString *v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VKImageAnalysisButton prefersDarkGlyphWhenSelected](self, "prefersDarkGlyphWhenSelected"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
  v6 = -[VKImageAnalysisButton glyphConfiguration](self, "glyphConfiguration");
  if (v6 == 1)
  {
    v7 = (_QWORD *)MEMORY[0x1E0CEB590];
    goto LABEL_8;
  }
  if (!v6)
  {
    v7 = (_QWORD *)MEMORY[0x1E0CEB538];
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *v7, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:
  -[VKImageAnalysisButton customSymbolFont](self, "customSymbolFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[VKImageAnalysisButton customSymbolFont](self, "customSymbolFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "defaultFontSize");
    objc_msgSend(v10, "fontWithSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  v13 = -[VKImageAnalysisButton mode](self, "mode");
  if (v13 == 2)
  {
    v15 = CFSTR("appclip");
    v14 = 1;
  }
  else if (v13 == 1)
  {
    v14 = 0;
    v15 = CFSTR("qrcode.viewfinder");
  }
  else
  {
    v14 = 0;
    if (v13)
      v15 = 0;
    else
      v15 = CFSTR("text.viewfinder");
  }
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__19;
  v43 = __Block_byref_object_dispose__19;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__19;
  v37 = __Block_byref_object_dispose__19;
  v38 = 0;
  if (!-[VKImageAnalysisButton supportsDynamicType](self, "supportsDynamicType"))
  {
    -[VKImageAnalysisButton traitCollection](self, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "vk_traitCollectionWithContentSize:", *MEMORY[0x1E0CEB420]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_21;
LABEL_23:
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __37__VKImageAnalysisButton__updateGlyph__block_invoke;
    v26[3] = &unk_1E94658A0;
    v27 = v15;
    v18 = v8;
    v28 = v18;
    v31 = &v39;
    v29 = v3;
    v32 = &v33;
    v30 = v5;
    objc_msgSend(v16, "vk_performAsCurrent:", v26);

    v22 = (void *)v27;
    goto LABEL_24;
  }
  -[VKImageAnalysisButton traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_23;
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithHierarchicalColor:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationByApplyingConfiguration:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v15, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v40[5];
  v40[5] = v19;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithHierarchicalColor:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configurationByApplyingConfiguration:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v15, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v34[5];
  v34[5] = v23;

LABEL_24:
  -[VKImageAnalysisButton setImage:forState:](self, "setImage:forState:", v40[5], 0);
  -[VKImageAnalysisButton setImage:forState:](self, "setImage:forState:", v34[5], 4);
  -[VKImageAnalysisButton setImage:forState:](self, "setImage:forState:", v34[5], 5);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[VKImageAnalysisButton backgroundDiameter](self, "backgroundDiameter");
  v4 = v3;
  -[VKImageAnalysisButton backgroundDiameter](self, "backgroundDiameter");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)backgroundDiameter
{
  double backgroundDiameter;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  backgroundDiameter = self->_backgroundDiameter;
  if (vk_isSeedBuild())
  {
    -[VKImageAnalysisButton traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "vk_isOptimizedForMac");

    if (v5)
      return 26.0;
  }
  if (-[VKImageAnalysisButton supportsDynamicType](self, "supportsDynamicType"))
  {
    -[VKImageAnalysisButton imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intrinsicContentSize");
    v8 = v7;
    v10 = v9;

    if (v8 >= v10)
      v11 = v8;
    else
      v11 = v10;
    return v11 + 12.0;
  }
  return backgroundDiameter;
}

- (BOOL)supportsDynamicType
{
  return self->_supportsDynamicType;
}

- (BOOL)prefersDarkGlyphWhenSelected
{
  return self->_prefersDarkGlyphWhenSelected;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)glyphConfiguration
{
  return self->_glyphConfiguration;
}

- (UIFont)customSymbolFont
{
  return self->_customSymbolFont;
}

- (void)setCameraModeBackgroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_cameraModeBackgroundColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cameraModeBackgroundColor, a3);
    -[VKImageAnalysisButton _updateBackgroundColors](self, "_updateBackgroundColors");
  }

}

void __37__VKImageAnalysisButton__updateGlyph__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", a1[4], a1[5]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:renderingMode:", a1[6], 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(v8, "imageWithTintColor:renderingMode:", a1[7], 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[9] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)setBackgroundDiameter:(double)a3
{
  if (self->_backgroundDiameter != a3)
  {
    self->_backgroundDiameter = a3;
    -[VKImageAnalysisButton setDidManuallySetBackgroundDiameter:](self, "setDidManuallySetBackgroundDiameter:", 1);
    -[VKImageAnalysisButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPrefersDarkGlyphWhenSelected:(BOOL)a3
{
  if (self->_prefersDarkGlyphWhenSelected != a3)
  {
    self->_prefersDarkGlyphWhenSelected = a3;
    -[VKImageAnalysisButton _updateGlyph](self, "_updateGlyph");
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_traitChangeObserver)
    -[VKImageAnalysisButton unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
  v3.receiver = self;
  v3.super_class = (Class)VKImageAnalysisButton;
  -[VKImageAnalysisButton dealloc](&v3, sel_dealloc);
}

- (VKImageAnalysisButton)initWithCoder:(id)a3
{
  VKImageAnalysisButton *v3;
  VKImageAnalysisButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKImageAnalysisButton;
  v3 = -[VKImageAnalysisButton initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[VKImageAnalysisButton _commonVKImageAnalysisButtonInitialization](v3, "_commonVKImageAnalysisButtonInitialization");
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = -[VKImageAnalysisButton isSelected](self, "isSelected");
  v7.receiver = self;
  v7.super_class = (Class)VKImageAnalysisButton;
  -[VKImageAnalysisButton setSelected:](&v7, sel_setSelected_, v3);
  if (v5 != v3)
  {
    -[VKImageAnalysisButton _selectedBackgroundView](self, "_selectedBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", (double)v3);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_super v19;

  v3 = a3;
  v5 = -[VKImageAnalysisButton isHighlighted](self, "isHighlighted");
  if (-[VKImageAnalysisButton function](self, "function") != 2
    || -[VKImageAnalysisButton mode](self, "mode") != 1 && -[VKImageAnalysisButton mode](self, "mode") != 2)
  {
    v19.receiver = self;
    v19.super_class = (Class)VKImageAnalysisButton;
    -[VKImageAnalysisButton setHighlighted:](&v19, sel_setHighlighted_, v3);
  }
  -[VKImageAnalysisButton _highlightedGlyphScaleFactor](self, "_highlightedGlyphScaleFactor");
  if (v5 != v3)
  {
    v7 = v6;
    if (v6 != 1.0)
    {
      -[VKImageAnalysisButton imageView](self, "imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[VKImageAnalysisButton _highlightedGlyphAnimation](self, "_highlightedGlyphAnimation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");

      if (v3)
        v12 = v7;
      else
        v12 = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v9, "presentationLayer");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (void *)v14;
        else
          v16 = v9;
        v17 = v16;

        objc_msgSend(v11, "setKeyPath:", CFSTR("transform.scale.xy"));
        objc_msgSend(v17, "valueForKeyPath:", CFSTR("transform.scale.xy"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFromValue:", v18);

        objc_msgSend(v11, "setToValue:", v13);
        objc_msgSend(v9, "addAnimation:forKey:", v11, CFSTR("VKImageAnalysisButtonHighlightScale"));

      }
      objc_msgSend(v9, "setValue:forKeyPath:", v13, CFSTR("transform.scale.xy"));

    }
  }
}

- (double)_selectedIndicatorAlpha
{
  return 1.0;
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[VKImageAnalysisButton _updateGlyph](self, "_updateGlyph");
    -[VKImageAnalysisButton _updateBackgroundColors](self, "_updateBackgroundColors");
  }
}

- (void)setFunction:(unint64_t)a3
{
  self->_function = a3;
  -[VKImageAnalysisButton setupForFunction:](self, "setupForFunction:");
}

- (void)setupForFunction:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[VKImageAnalysisButton _updateGlyph](self, "_updateGlyph");
  if (a3 - 1 > 1)
  {
    v8 = 0;
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 17);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[VKImageAnalysisButton _backgroundVisualEffectView](self, "_backgroundVisualEffectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEffect:", v8);

  -[VKImageAnalysisButton _selectedBackgroundVisualEffectView](self, "_selectedBackgroundVisualEffectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEffect:", v5);

  -[VKImageAnalysisButton _updateBackgroundColors](self, "_updateBackgroundColors");
  -[VKImageAnalysisButton setNeedsLayout](self, "setNeedsLayout");

}

- (void)setCustomSymbolFont:(id)a3
{
  objc_storeStrong((id *)&self->_customSymbolFont, a3);
  -[VKImageAnalysisButton _updateGlyph](self, "_updateGlyph");
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
  v6 = (void *)MEMORY[0x1E0CEA390];
  -[VKImageAnalysisButton _selectedIndicatorBounds](self, "_selectedIndicatorBounds");
  objc_msgSend(v6, "bezierPathWithOvalInRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setGlyphConfiguration:(unint64_t)a3
{
  self->_glyphConfiguration = a3;
}

- (void)setSupportsDynamicType:(BOOL)a3
{
  self->_supportsDynamicType = a3;
}

- (UIVisualEffectView)_selectedBackgroundVisualEffectView
{
  return self->__selectedBackgroundVisualEffectView;
}

- (void)set_selectedBackgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->__selectedBackgroundVisualEffectView, a3);
}

- (UIVisualEffectView)_backgroundVisualEffectView
{
  return self->__backgroundVisualEffectView;
}

- (void)set_backgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundVisualEffectView, a3);
}

- (CABasicAnimation)_highlightedGlyphAnimation
{
  return self->__highlightedGlyphAnimation;
}

- (void)setDidManuallySetBackgroundDiameter:(BOOL)a3
{
  self->_didManuallySetBackgroundDiameter = a3;
}

- (id)traitChangeObserver
{
  return self->_traitChangeObserver;
}

- (void)setTraitChangeObserver:(id)a3
{
  objc_storeStrong(&self->_traitChangeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraModeBackgroundColor, 0);
  objc_storeStrong(&self->_traitChangeObserver, 0);
  objc_storeStrong((id *)&self->__highlightedGlyphAnimation, 0);
  objc_storeStrong((id *)&self->__backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->__selectedBackgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->__selectedBackgroundColorView, 0);
  objc_storeStrong((id *)&self->__selectedBackgroundView, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->_customSymbolFont, 0);
}

@end
