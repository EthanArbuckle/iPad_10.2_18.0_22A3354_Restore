@implementation TUIKeyPopupView

- (TUIKeyPopupView)initWithKey:(id)a3 renderTraits:(id)a4
{
  id v6;
  id v7;
  TUIKeyPopupView *v8;
  UILayoutGuide *v9;
  UILayoutGuide *baseKeyLayoutGuide;
  uint64_t v11;
  UIKBTree *backingTree;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIKeyPopupView;
  v8 = -[TUIKeyPopupView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    v9 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    baseKeyLayoutGuide = v8->_baseKeyLayoutGuide;
    v8->_baseKeyLayoutGuide = v9;

    -[UILayoutGuide setIdentifier:](v8->_baseKeyLayoutGuide, "setIdentifier:", CFSTR("TUIVariantSelectorBaseGuide"));
    -[TUIKeyPopupView addLayoutGuide:](v8, "addLayoutGuide:", v8->_baseKeyLayoutGuide);
    objc_msgSend(v6, "backingTree");
    v11 = objc_claimAutoreleasedReturnValue();
    backingTree = v8->_backingTree;
    v8->_backingTree = (UIKBTree *)v11;

    v8->_layoutStyle = objc_msgSend(v6, "style");
    objc_storeStrong((id *)&v8->_renderTraits, a4);
    if (-[UIKBTree state](v8->_backingTree, "state") == 16)
    {
      v8->_needsPopup = 1;
      -[TUIKeyPopupView setVariantViewRows:](v8, "setVariantViewRows:", 1);
    }
    else
    {
      v8->_needsPopup = objc_msgSend(v6, "style") == 1;
    }
    -[TUIKeyPopupView _addShadowsAndBackgroundsIfNeeded](v8, "_addShadowsAndBackgroundsIfNeeded");
    -[TUIKeyPopupView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", -[TUIKeyPopupView wantsUserInteractionEnabled](v8, "wantsUserInteractionEnabled"));
  }

  return v8;
}

- (void)_addShadowsAndBackgroundsIfNeeded
{
  _BOOL4 v3;
  double *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *v10;
  UIView *deepShadowView;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  UIView *v20;
  UIView *keyShadowView;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIKBVisualEffectView *v35;
  UIKBVisualEffectView *backdropView;
  TUIDrawingView *v37;
  TUIDrawingView *backgroundMaskView;
  TUIDrawingView *v39;
  TUIDrawingView *borderView;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  void *v49;

  v3 = -[TUIKeyPopupView drawsShadows](self, "drawsShadows");
  v4 = (double *)MEMORY[0x1E0C9D648];
  if (v3)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = *v4;
    v7 = v4[1];
    v8 = v4[2];
    v9 = v4[3];
    v10 = (UIView *)objc_msgSend(v5, "initWithFrame:", *v4, v7, v8, v9);
    deepShadowView = self->_deepShadowView;
    self->_deepShadowView = v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_deepShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_deepShadowView, "setUserInteractionEnabled:", 0);
    -[UIView layer](self->_deepShadowView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1045220557;
    objc_msgSend(v12, "setShadowOpacity:", v13);

    -[UIView layer](self->_deepShadowView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowRadius:", 7.0);

    -[UIView layer](self->_deepShadowView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowOffset:", 0.0, 6.0);

    -[UIView layer](self->_deepShadowView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMasksToBounds:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    -[UIView layer](self->_deepShadowView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowColor:", v18);

    -[TUIKeyPopupView addSubview:](self, "addSubview:", self->_deepShadowView);
    v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
    keyShadowView = self->_keyShadowView;
    self->_keyShadowView = v20;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_keyShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_keyShadowView, "setUserInteractionEnabled:", 0);
    -[UIView layer](self->_keyShadowView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1045220557;
    objc_msgSend(v22, "setShadowOpacity:", v23);

    -[UIView layer](self->_keyShadowView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShadowRadius:", 0.0);

    -[UIView layer](self->_keyShadowView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShadowOffset:", 0.0, 1.0);

    -[UIView layer](self->_keyShadowView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMasksToBounds:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = objc_msgSend(v27, "CGColor");
    -[UIView layer](self->_keyShadowView, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setShadowColor:", v28);

    -[TUIKeyPopupView addSubview:](self, "addSubview:", self->_keyShadowView);
  }
  if (-[TUIKeyPopupView drawsBackground](self, "drawsBackground"))
  {
    v30 = objc_alloc(MEMORY[0x1E0DC3928]);
    v31 = *v4;
    v32 = v4[1];
    v33 = v4[2];
    v34 = v4[3];
    v35 = (UIKBVisualEffectView *)objc_msgSend(v30, "initWithFrame:style:", 3903, *v4, v32, v33, v34);
    backdropView = self->_backdropView;
    self->_backdropView = v35;

    -[UIKBVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIKBVisualEffectView setUserInteractionEnabled:](self->_backdropView, "setUserInteractionEnabled:", 0);
    -[TUIKeyPopupView addSubview:](self, "addSubview:", self->_backdropView);
    v37 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v31, v32, v33, v34);
    backgroundMaskView = self->_backgroundMaskView;
    self->_backgroundMaskView = v37;

    -[TUIDrawingView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundMaskView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TUIDrawingView setUserInteractionEnabled:](self->_backgroundMaskView, "setUserInteractionEnabled:", 0);
    -[UIKBVisualEffectView setMaskView:](self->_backdropView, "setMaskView:", self->_backgroundMaskView);
    v39 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v31, v32, v33, v34);
    borderView = self->_borderView;
    self->_borderView = v39;

    -[TUIDrawingView setTranslatesAutoresizingMaskIntoConstraints:](self->_borderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TUIDrawingView setUserInteractionEnabled:](self->_borderView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = objc_msgSend(v41, "CGColor");
    -[TUIDrawingView shapeLayer](self->_borderView, "shapeLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFillColor:", v42);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v45 = objc_msgSend(v44, "CGColor");
    -[TUIDrawingView shapeLayer](self->_borderView, "shapeLayer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setStrokeColor:", v45);

    -[TUIKeyPopupView borderViewLineWidth](self, "borderViewLineWidth");
    v48 = v47;
    -[TUIDrawingView shapeLayer](self->_borderView, "shapeLayer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setLineWidth:", v48);

    -[TUIKeyPopupView addSubview:](self, "addSubview:", self->_borderView);
  }
}

- (UIKBTree)associatedTree
{
  return self->_backingTree;
}

- (void)updateBackgroundMaterialsForRenderConfig:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  -[TUIKeyPopupView renderTraits](self, "renderTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layeredBackgroundGradient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyPopupView renderTraits](self, "renderTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "layeredBackgroundGradient");
  else
    objc_msgSend(v6, "backgroundGradient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flatColorName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = UIKBGetNamedColor();
    -[TUIKeyPopupView borderView](self, "borderView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shapeLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFillColor:", v10);
  }
  else
  {
    if (objc_msgSend(v32, "lightKeyboard"))
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v11, "CGColor");
    -[TUIKeyPopupView borderView](self, "borderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shapeLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFillColor:", v13);

  }
  v15 = objc_opt_respondsToSelector();
  -[TUIKeyPopupView backdropView](self, "backdropView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v15 & 1) != 0)
  {
    v17 = objc_msgSend(v32, "keyBackdropStyle");
  }
  else
  {
    if ((objc_msgSend(v32, "animatedBackground") & 1) != 0)
    {
      v18 = 3905;
      goto LABEL_16;
    }
    v17 = objc_msgSend(v32, "backdropStyle");
  }
  v18 = v17;
LABEL_16:
  objc_msgSend(v16, "transitionToStyle:", v18);

  if (objc_msgSend(v32, "animatedBackground"))
  {
    -[TUIKeyPopupView renderTraits](self, "renderTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setControlOpacities:", 1);

    -[TUIKeyPopupView borderView](self, "borderView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCompositingFilter:", 0);

    -[TUIKeyPopupView borderView](self, "borderView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView renderTraits](self, "renderTraits");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "extraFiltersForType:", *MEMORY[0x1E0CD2F08]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFilters:", v25);

    if (objc_msgSend(v32, "lightKeyboard"))
    {
      -[TUIKeyPopupView keyShadowView](self, "keyShadowView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x1E0CD2E98];
      objc_msgSend(v27, "setCompositingFilter:", *MEMORY[0x1E0CD2E98]);

      -[TUIKeyPopupView deepShadowView](self, "deepShadowView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setCompositingFilter:", v28);
LABEL_21:

    }
  }
  else if (objc_msgSend(v32, "lightKeyboard"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BC0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView backdropView](self, "backdropView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCompositingFilter:", v29);

    goto LABEL_21;
  }

}

- (void)setRenderTraits:(id)a3
{
  UIKBRenderTraits *v5;
  UIKBRenderTraits *v6;

  v5 = (UIKBRenderTraits *)a3;
  if (self->_renderTraits != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_renderTraits, a3);
    v5 = v6;
  }

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_needsPopup)
  {
    -[TUIKeyPopupView variantView](self, "variantView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[TUIKeyPopupView backingTree](self, "backingTree");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyPopupView popupConstructorForKey:](self, "popupConstructorForKey:", v4);

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)TUIKeyPopupView;
  -[TUIKeyPopupView updateConstraints](&v5, sel_updateConstraints);
}

- (void)popupConstructorForKey:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  unint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") && objc_msgSend(v4, "state") == 16)
    v6 = 0;
  else
    v6 = objc_msgSend(v4, "interactionType") == 2
      || objc_msgSend(v4, "interactionType") == 16;

  -[TUIKeyPopupView updateVariantViewPropertiesForKey:isNonVariantPaddle:](self, "updateVariantViewPropertiesForKey:isNonVariantPaddle:", v4, v6);
  -[TUIKeyPopupView variantView](self, "variantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[TUIKeyPopupView variantView](self, "variantView", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrangedSubviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v67 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "removeFromSuperview");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v11);
    }
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    -[TUIKeyPopupView setVariantView:](self, "setVariantView:", v14);

    -[TUIKeyPopupView variantView](self, "variantView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAxis:", 1);

    -[TUIKeyPopupView variantView](self, "variantView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDistribution:", 1);

    v17 = -[TUIKeyPopupView variantViewAlignment](self, "variantViewAlignment");
    -[TUIKeyPopupView variantView](self, "variantView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlignment:", v17);

    -[TUIKeyPopupView variantView](self, "variantView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v20 = -[TUIKeyPopupView wantsUserInteractionEnabled](self, "wantsUserInteractionEnabled");
    -[TUIKeyPopupView variantView](self, "variantView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUserInteractionEnabled:", v20);

    -[TUIKeyPopupView variantView](self, "variantView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLayoutMarginsRelativeArrangement:", 1);

    -[TUIKeyPopupView stackLayoutMargins](self, "stackLayoutMargins");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[TUIKeyPopupView variantView](self, "variantView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLayoutMargins:", v24, v26, v28, v30);

    -[TUIKeyPopupView itemSpacing](self, "itemSpacing");
    v33 = v32;
    -[TUIKeyPopupView variantView](self, "variantView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setSpacing:", v33);

    -[TUIKeyPopupView decorateVariantView](self, "decorateVariantView");
    -[TUIKeyPopupView variantView](self, "variantView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView addSubview:](self, "addSubview:", v9);
  }

  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TUIKeyPopupView arrangedVariantRows](self, "arrangedVariantRows");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36
    && (v37 = (void *)v36,
        -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        v38,
        v37,
        v38))
  {
    -[TUIKeyPopupView arrangedVariantRows](self, "arrangedVariantRows");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "removeAllObjects");

    -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "removeAllObjects");
  }
  else
  {
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TUIKeyPopupView setArrangedVariantRows:](self, "setArrangedVariantRows:", v41);

    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TUIKeyPopupView setArrangedVariantCells:](self, "setArrangedVariantCells:", v40);
  }

  if (-[TUIKeyPopupView variantViewRows](self, "variantViewRows"))
  {
    v42 = 0;
    do
    {
      v43 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
      objc_msgSend(v43, "setAxis:", 0);
      objc_msgSend(v43, "setDistribution:", 1);
      objc_msgSend(v43, "setAlignment:", 5);
      objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v43, "setUserInteractionEnabled:", -[TUIKeyPopupView wantsUserInteractionEnabled](self, "wantsUserInteractionEnabled"));
      -[TUIKeyPopupView itemSpacing](self, "itemSpacing");
      objc_msgSend(v43, "setSpacing:");
      -[TUIKeyPopupView variantView](self, "variantView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addArrangedSubview:", v43);

      -[TUIKeyPopupView arrangedVariantRows](self, "arrangedVariantRows");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObject:", v43);

      ++v42;
    }
    while (-[TUIKeyPopupView variantViewRows](self, "variantViewRows") > v42);
  }
  if (-[TUIKeyPopupView drawsBackground](self, "drawsBackground")
    && !-[TUIKeyPopupView hasConstrainedBackground](self, "hasConstrainedBackground"))
  {
    -[TUIKeyPopupView backdropView](self, "backdropView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x1E0DC49E8];
    v48 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v49 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v50 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[TUIKeyPopupView constraintsToMatchInnerView:toOuterView:withInsets:](self, "constraintsToMatchInnerView:toOuterView:withInsets:", v46, self, *MEMORY[0x1E0DC49E8], v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v51);

    -[TUIKeyPopupView borderView](self, "borderView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView constraintsToMatchInnerView:toOuterView:withInsets:](self, "constraintsToMatchInnerView:toOuterView:withInsets:", v52, self, v47, v48, v49, v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v53);

  }
  if (-[TUIKeyPopupView drawsShadows](self, "drawsShadows")
    && !-[TUIKeyPopupView hasConstrainedBackground](self, "hasConstrainedBackground"))
  {
    -[TUIKeyPopupView deepShadowView](self, "deepShadowView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView variantView](self, "variantView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView constraintsToMatchInnerView:toOuterView:withInsets:](self, "constraintsToMatchInnerView:toOuterView:withInsets:", v54, v55, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v56);

    -[TUIKeyPopupView keyShadowView](self, "keyShadowView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView constraintsToMatchView:toLayoutGuide:withInsets:](self, "constraintsToMatchView:toLayoutGuide:withInsets:", v57, v58, 0.0, 3.0, 3.0, 3.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v59);

  }
  -[TUIKeyPopupView alignmentConstraintsForKey:](self, "alignmentConstraintsForKey:", v4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "count"))
  {
    -[TUIKeyPopupView subclassAdditionalConstraints](self, "subclassAdditionalConstraints");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      v62 = (void *)MEMORY[0x1E0CB3718];
      -[TUIKeyPopupView subclassAdditionalConstraints](self, "subclassAdditionalConstraints");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "deactivateConstraints:", v63);

    }
    objc_msgSend(v35, "addObjectsFromArray:", v60);
    -[TUIKeyPopupView setSubclassAdditionalConstraints:](self, "setSubclassAdditionalConstraints:", v60);
  }
  if (objc_msgSend(v35, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v35);
  -[TUIKeyPopupView backingTree](self, "backingTree");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyPopupView variantView](self, "variantView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyPopupView addVariantsForKey:toView:isNonVariantPaddle:](self, "addVariantsForKey:toView:isNonVariantPaddle:", v64, v65, v6);

}

- (id)alignmentConstraintsForKey:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)updateVariantsIfNeededForKey:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_backingTree, a3);
  v5 = a3;
  -[TUIKeyPopupView popupConstructorForKey:](self, "popupConstructorForKey:", v5);

}

- (id)backgroundBezierPath
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutFrame");
  v4 = v3;
  v6 = v5;

  return (id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 0.0, 0.0, v4, v6);
}

- (void)layoutSubviews
{
  void *v3;
  CGPathRef v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)TUIKeyPopupView;
  -[TUIKeyPopupView layoutSubviews](&v13, sel_layoutSubviews);
  if (-[TUIKeyPopupView layoutStyle](self, "layoutStyle") == 1 && -[TUIKeyPopupView drawsShadows](self, "drawsShadows"))
  {
    -[TUIKeyPopupView keyShadowView](self, "keyShadowView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v4 = CGPathCreateWithRoundedRect(v14, 6.0, 6.0, 0);
    -[TUIKeyPopupView keyShadowView](self, "keyShadowView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShadowPath:", v4);

  }
  if (self->_needsPopup)
  {
    -[TUIKeyPopupView backgroundBezierPath](self, "backgroundBezierPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (-[TUIKeyPopupView drawsBackground](self, "drawsBackground"))
      {
        -[TUIKeyPopupView backgroundMaskView](self, "backgroundMaskView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPath:", v7);

        -[TUIKeyPopupView borderView](self, "borderView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPath:", v7);

      }
      if (-[TUIKeyPopupView drawsShadows](self, "drawsShadows"))
      {
        v10 = objc_msgSend(objc_retainAutorelease(v7), "CGPath");
        -[TUIKeyPopupView deepShadowView](self, "deepShadowView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setShadowPath:", v10);

      }
    }

  }
}

- (unint64_t)indexOfHighlightedVariant
{
  return self->_selectedVariant;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIKeyPopupView;
  v8 = -[TUIKeyPopupView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  -[TUIKeyPopupView backingTree](self, "backingTree");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "interactionType") != 9)
    goto LABEL_4;
  -[TUIKeyPopupView backingTree](self, "backingTree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state");

  if (v11 == 16)
  {
    -[TUIKeyPopupView variantView](self, "variantView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "pointInside:withEvent:", v7, x, y);
LABEL_4:

  }
  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  -[TUIKeyPopupView finishVariantSelection](self, "finishVariantSelection", a4, a3.x, a3.y);
  return -[TUIKeyPopupView touchesForwardingView](self, "touchesForwardingView");
}

- (void)updateSelectorForPoint:(CGPoint)a3
{
  -[TUIKeyPopupView highlightCellAtLocation:](self, "highlightCellAtLocation:", a3.x, a3.y);
  -[UIKBTree setSelectedVariantIndex:](self->_backingTree, "setSelectedVariantIndex:", -[TUIKeyPopupView indexOfHighlightedVariant](self, "indexOfHighlightedVariant"));
}

- (void)updateSelectorForTouch:(id)a3 event:(id)a4
{
  objc_msgSend(a3, "locationInView:", self, a4);
  -[TUIKeyPopupView highlightCellAtLocation:](self, "highlightCellAtLocation:");
}

- (void)finishVariantSelection
{
  -[UIKBTree setSelectedVariantIndex:](self->_backingTree, "setSelectedVariantIndex:", -[TUIKeyPopupView indexOfHighlightedVariant](self, "indexOfHighlightedVariant"));
}

- (void)unhighlightAllViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setHighlighted:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->_selectedVariant = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setInitialHighlight
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9++), "setHighlighted:", 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    self->_selectedVariant = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    self->_selectedVariant = 0x7FFFFFFFFFFFFFFFLL;
    -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = 0;
      do
      {
        -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setHighlighted:", objc_msgSend(v14, "isPrimaryVariant"));
        if (objc_msgSend(v14, "isPrimaryVariant"))
          self->_selectedVariant = objc_msgSend(v14, "indexNumber");

        ++v12;
        -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

      }
      while (v12 < v16);
    }
  }
}

- (id)variantCellAtLocation:(CGPoint)a3
{
  id v3;
  double y;
  double x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *k;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;
  CGPoint v56;
  CGPoint v57;
  CGRect v58;
  CGRect v59;

  y = a3.y;
  x = a3.x;
  v55 = *MEMORY[0x1E0C80C00];
  -[TUIKeyPopupView variantView](self, "variantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyPopupView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend((id)objc_opt_class(), "hitTestingMode");
  if (v12 == 1)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells", 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v18)
    {
      v19 = v18;
      v3 = 0;
      v20 = *(_QWORD *)v41;
      v21 = 1.79769313e308;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v14);
          v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v23, "superview");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "center");
          v26 = v25;
          v28 = v27;
          -[TUIKeyPopupView variantView](self, "variantView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "convertPoint:toView:", v29, v26, v28);

          UIDistanceBetweenPoints();
          if (v30 < v21)
          {
            v31 = v30;
            v32 = v23;

            v3 = v32;
            v21 = v31;
          }
        }
        v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v19);
    }
    else
    {
      v3 = 0;
    }
LABEL_35:

    return v3;
  }
  if (!v12)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[TUIKeyPopupView arrangedVariantRows](self, "arrangedVariantRows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v49;
      while (2)
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v17, "frame");
          v56.x = v9;
          v56.y = v11;
          if (CGRectContainsPoint(v58, v56))
          {
            -[TUIKeyPopupView convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
            x = v33;
            y = v34;
            objc_msgSend(v17, "frame");
            UIRectGetCenter();
            v14 = v17;
            goto LABEL_23;
          }
        }
        v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_23:

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v14, "arrangedSubviews");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v3)
    {
      v36 = *(_QWORD *)v45;
      while (2)
      {
        for (k = 0; k != v3; k = (char *)k + 1)
        {
          if (*(_QWORD *)v45 != v36)
            objc_enumerationMutation(v35);
          v38 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)k);
          objc_msgSend(v38, "frame");
          v57.x = x;
          v57.y = y;
          if (CGRectContainsPoint(v59, v57))
          {
            v3 = v38;
            goto LABEL_33;
          }
        }
        v3 = (id)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_33:

    goto LABEL_35;
  }
  return v3;
}

- (BOOL)highlightCellAtLocation:(CGPoint)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[TUIKeyPopupView variantCellAtLocation:](self, "variantCellAtLocation:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setHighlighted:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i) == (_QWORD)v4);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    v10 = objc_msgSend(v4, "indexNumber");
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_selectedVariant = v10;

  return v4 != 0;
}

- (BOOL)wantsUserInteractionEnabled
{
  return 0;
}

- (BOOL)shouldProvideDefaultSelection
{
  return 1;
}

- (double)itemSpacing
{
  return 0.0;
}

- (double)variantViewBottomSpacing
{
  return 4.0;
}

- (double)roundRectRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[TUIKeyPopupView renderTraits](self, "renderTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roundRectRadius");
  v5 = v4;

  return v5;
}

- (id)constraintsToMatchView:(id)a3 toLayoutGuide:(id)a4 withInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;
  id v11;
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
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v26[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, top);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, left);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v14;
  objc_msgSend(v10, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, bottom);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v17;
  objc_msgSend(v10, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, right);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)constraintsToMatchInnerView:(id)a3 toOuterView:(id)a4 withInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;
  id v11;
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
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v26[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, top);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, left);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v14;
  objc_msgSend(v10, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, bottom);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v17;
  objc_msgSend(v10, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, right);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)drawsBackground
{
  return 1;
}

- (BOOL)drawsShadows
{
  return 1;
}

- (double)borderViewLineWidth
{
  return 1.0;
}

- (UIEdgeInsets)stackLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 10.0;
  v4 = 0.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)variantViewAlignment
{
  return 3;
}

- (unint64_t)variantRowLimitForLayout
{
  void *v2;
  int v3;

  if (self->_layoutStyle != 1)
    return 5;
  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayType");

  if (v3 == 27)
    return 6;
  else
    return 10;
}

- (unint64_t)maxVariantsPerRowForKey:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int64_t layoutStyle;

  v4 = a3;
  v5 = -[TUIKeyPopupView variantRowLimitForLayout](self, "variantRowLimitForLayout");
  if (v4)
  {
    objc_msgSend(v4, "subtrees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") <= v5)
    {
LABEL_5:

      goto LABEL_6;
    }
    layoutStyle = self->_layoutStyle;

    if (layoutStyle == 1)
    {
      objc_msgSend(v4, "subtrees");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(v6, "count") / (double)-[TUIKeyPopupView maxRows](self, "maxRows"));
      goto LABEL_5;
    }
  }
LABEL_6:

  return v5;
}

- (unint64_t)maxRows
{
  void *v2;
  int v3;

  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayType");

  if (v3 == 27)
    return 4;
  else
    return 2;
}

- (void)updateVariantViewPropertiesForKey:(id)a3 isNonVariantPaddle:(BOOL)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  id v11;

  v6 = a3;
  v11 = v6;
  if (a4)
  {
    v7 = 1;
  }
  else
  {
    v8 = -[TUIKeyPopupView maxVariantsPerRowForKey:](self, "maxVariantsPerRowForKey:", v6);
    objc_msgSend(v11, "subtrees");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v7 = vcvtps_u32_f32((float)v10 / (float)v8);
  }
  -[TUIKeyPopupView setVariantViewRows:](self, "setVariantViewRows:", v7);

}

- (TUIKeyPopupDelegate)popupDelegate
{
  return (TUIKeyPopupDelegate *)objc_loadWeakRetained((id *)&self->_popupDelegate);
}

- (void)setPopupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_popupDelegate, a3);
}

- (UIKBRenderTraits)renderTraits
{
  return self->_renderTraits;
}

- (UILayoutGuide)baseKeyLayoutGuide
{
  return self->_baseKeyLayoutGuide;
}

- (UIView)touchesForwardingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_touchesForwardingView);
}

- (void)setTouchesForwardingView:(id)a3
{
  objc_storeWeak((id *)&self->_touchesForwardingView, a3);
}

- (unint64_t)variantViewRows
{
  return self->_variantViewRows;
}

- (void)setVariantViewRows:(unint64_t)a3
{
  self->_variantViewRows = a3;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (BOOL)needsPopup
{
  return self->_needsPopup;
}

- (void)setNeedsPopup:(BOOL)a3
{
  self->_needsPopup = a3;
}

- (UIStackView)variantView
{
  return self->_variantView;
}

- (void)setVariantView:(id)a3
{
  objc_storeStrong((id *)&self->_variantView, a3);
}

- (NSMutableArray)arrangedVariantRows
{
  return self->_arrangedVariantRows;
}

- (void)setArrangedVariantRows:(id)a3
{
  objc_storeStrong((id *)&self->_arrangedVariantRows, a3);
}

- (NSMutableArray)arrangedVariantCells
{
  return self->_arrangedVariantCells;
}

- (void)setArrangedVariantCells:(id)a3
{
  objc_storeStrong((id *)&self->_arrangedVariantCells, a3);
}

- (UIKBTree)backingTree
{
  return self->_backingTree;
}

- (void)setBackingTree:(id)a3
{
  objc_storeStrong((id *)&self->_backingTree, a3);
}

- (UIView)deepShadowView
{
  return self->_deepShadowView;
}

- (void)setDeepShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_deepShadowView, a3);
}

- (UIView)keyShadowView
{
  return self->_keyShadowView;
}

- (void)setKeyShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_keyShadowView, a3);
}

- (UIKBVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (TUIDrawingView)backgroundMaskView
{
  return self->_backgroundMaskView;
}

- (void)setBackgroundMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMaskView, a3);
}

- (TUIDrawingView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (unint64_t)selectedVariant
{
  return self->_selectedVariant;
}

- (BOOL)hasConstrainedBackground
{
  return self->_hasConstrainedBackground;
}

- (void)setHasConstrainedBackground:(BOOL)a3
{
  self->_hasConstrainedBackground = a3;
}

- (NSArray)subclassAdditionalConstraints
{
  return self->_subclassAdditionalConstraints;
}

- (void)setSubclassAdditionalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_subclassAdditionalConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subclassAdditionalConstraints, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_keyShadowView, 0);
  objc_storeStrong((id *)&self->_deepShadowView, 0);
  objc_storeStrong((id *)&self->_backingTree, 0);
  objc_storeStrong((id *)&self->_arrangedVariantCells, 0);
  objc_storeStrong((id *)&self->_arrangedVariantRows, 0);
  objc_storeStrong((id *)&self->_variantView, 0);
  objc_destroyWeak((id *)&self->_touchesForwardingView);
  objc_storeStrong((id *)&self->_baseKeyLayoutGuide, 0);
  objc_storeStrong((id *)&self->_renderTraits, 0);
  objc_destroyWeak((id *)&self->_popupDelegate);
}

+ (int64_t)hitTestingMode
{
  return 0;
}

@end
