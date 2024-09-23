@implementation PXStoryChromeButton

- (PXStoryChromeButton)initWithFrame:(CGRect)a3
{
  PXStoryChromeButton *v3;
  objc_class *v4;
  id v5;
  const char *v6;
  os_log_t v7;
  OS_os_log *log;
  uint64_t v9;
  PXUpdater *updater;
  uint64_t v11;
  UIImageView *assetImageView;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  UIImageView *systemImageView;
  uint64_t v25;
  UIImageView *badgeSystemImageView;
  uint64_t v27;
  UIVisualEffectView *systemImageVisualEffectView;
  uint64_t v29;
  UILabel *label;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)PXStoryChromeButton;
  v3 = -[PXStoryChromeButton initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");

    v7 = os_log_create((const char *)*MEMORY[0x1E0D744D8], v6);
    log = v3->_log;
    v3->_log = (OS_os_log *)v7;

    v9 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v3, sel__setNeedsUpdate);
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v9;

    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateAssetImage);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateAppearance);
    -[PXStoryChromeButton _createAssetImageView](v3, "_createAssetImageView");
    v11 = objc_claimAutoreleasedReturnValue();
    assetImageView = v3->_assetImageView;
    v3->_assetImageView = (UIImageView *)v11;

    -[PXStoryChromeButton addSubview:](v3, "addSubview:", v3->_assetImageView);
    if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton setConfiguration:](v3, "setConfiguration:", v13);

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_assetImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v35 = (void *)MEMORY[0x1E0CB3718];
      -[UIImageView leadingAnchor](v3->_assetImageView, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton leadingAnchor](v3, "leadingAnchor");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v38;
      -[UIImageView trailingAnchor](v3->_assetImageView, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton trailingAnchor](v3, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v36);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v34;
      -[UIImageView topAnchor](v3->_assetImageView, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton topAnchor](v3, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2] = v18;
      -[UIImageView bottomAnchor](v3->_assetImageView, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton bottomAnchor](v3, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v40[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "activateConstraints:", v22);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_createSystemImageView");
      v23 = objc_claimAutoreleasedReturnValue();
      systemImageView = v3->_systemImageView;
      v3->_systemImageView = (UIImageView *)v23;

      objc_msgSend((id)objc_opt_class(), "_createBadgeSystemImageView");
      v25 = objc_claimAutoreleasedReturnValue();
      badgeSystemImageView = v3->_badgeSystemImageView;
      v3->_badgeSystemImageView = (UIImageView *)v25;

      -[PXStoryChromeButton addSubview:](v3, "addSubview:", v3->_systemImageView);
      objc_msgSend((id)objc_opt_class(), "_createSystemImageVisualEffectView");
      v27 = objc_claimAutoreleasedReturnValue();
      systemImageVisualEffectView = v3->_systemImageVisualEffectView;
      v3->_systemImageVisualEffectView = (UIVisualEffectView *)v27;

      -[PXStoryChromeButton addSubview:](v3, "addSubview:", v3->_systemImageVisualEffectView);
      -[PXStoryChromeButton addSubview:](v3, "addSubview:", v3->_badgeSystemImageView);
      -[PXStoryChromeButton _createLabel](v3, "_createLabel");
      v29 = objc_claimAutoreleasedReturnValue();
      label = v3->_label;
      v3->_label = (UILabel *)v29;

      -[PXStoryChromeButton addSubview:](v3, "addSubview:", v3->_label);
      -[PXStoryChromeButton layer](v3, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAllowsGroupOpacity:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "setShadowColor:", objc_msgSend(v15, "CGColor"));
    }

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[PXStoryChromeButton setPointerInteraction:](v3, "setPointerInteraction:", v31);

    -[PXStoryChromeButton pointerInteraction](v3, "pointerInteraction");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButton addInteraction:](v3, "addInteraction:", v32);

  }
  return v3;
}

- (void)setAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryChromeButton;
  -[PXStoryChromeButton setAlpha:](&v5, sel_setAlpha_);
  -[PXStoryChromeButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:", a3 > 0.0);
}

- (void)setIsMenuOpen:(BOOL)a3
{
  if (self->_isMenuOpen != a3)
  {
    self->_isMenuOpen = a3;
    -[PXStoryChromeButton _invalidateAppearance](self, "_invalidateAppearance");
  }
}

- (void)layoutSubviews
{
  void *v3;
  BOOL v4;
  double v5;
  double x;
  double v7;
  double y;
  double v9;
  double width;
  double v11;
  double height;
  void (**v13)(_QWORD, double, double, double, double);
  void (**v14)(void *, void *, double, double, double, double);
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  CGRect remainder;
  CGRect slice;
  _QWORD v54[5];
  id v55;
  _QWORD aBlock[8];
  BOOL v57;
  objc_super v58;
  CGRect v59;
  CGRect v60;

  -[PXStoryChromeButton updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  v58.receiver = self;
  v58.super_class = (Class)PXStoryChromeButton;
  -[PXStoryChromeButton layoutSubviews](&v58, sel_layoutSubviews);
  if ((objc_msgSend((id)objc_opt_class(), "usesButtonSystem") & 1) == 0)
  {
    v4 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXStoryChromeButton semanticContentAttribute](self, "semanticContentAttribute")) == 1;
    -[PXStoryChromeButton bounds](self, "bounds");
    x = v5;
    y = v7;
    width = v9;
    height = v11;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__PXStoryChromeButton_layoutSubviews__block_invoke;
    aBlock[3] = &__block_descriptor_65_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    v57 = v4;
    *(double *)&aBlock[4] = v5;
    *(double *)&aBlock[5] = v7;
    *(double *)&aBlock[6] = v9;
    *(double *)&aBlock[7] = v11;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __37__PXStoryChromeButton_layoutSubviews__block_invoke_2;
    v54[3] = &unk_1E5145BE0;
    v13 = _Block_copy(aBlock);
    v54[4] = self;
    v55 = v13;
    v14 = (void (**)(void *, void *, double, double, double, double))_Block_copy(v54);
    -[PXStoryChromeButton userData](self, "userData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "spec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentEdgeInsets");
    PXEdgeInsetsInsetRect();
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    if (objc_msgSend(v15, "hasPrimaryImageContent"))
    {
      objc_msgSend(v16, "defaultImageSize");
      PXSizeGetAspectRatio();
      v51 = v25;
      v59.origin.x = v18;
      v59.origin.y = v20;
      v59.size.width = v22;
      v59.size.height = v24;
      v26 = v51 * CGRectGetHeight(v59);
      v60.origin.x = v18;
      v60.origin.y = v20;
      v60.size.width = v22;
      v60.size.height = v24;
      CGRectDivide(v60, &slice, &remainder, v26, CGRectMinXEdge);
      objc_msgSend(v16, "labelPadding");
      PXEdgeInsetsInsetRect();
    }
    else
    {
      slice.origin.x = v18;
      slice.origin.y = v20;
      v27 = v18;
      v28 = v20;
      v29 = v22;
      v30 = v24;
      slice.size.width = v22;
      slice.size.height = v24;
    }
    remainder.origin.x = v27;
    remainder.origin.y = v28;
    remainder.size.width = v29;
    remainder.size.height = v30;
    if ((objc_msgSend(v15, "backgroundExtendsUnderLabel") & 1) == 0)
    {
      x = slice.origin.x;
      y = slice.origin.y;
      width = slice.size.width;
      height = slice.size.height;
    }
    v13[2](v13, x, y, width, height);
    -[PXStoryChromeButton _setEffectViewFrame:](self, "_setEffectViewFrame:");
    -[PXStoryChromeButton backgroundView](self, "backgroundView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v31, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

    -[PXStoryChromeButton assetImageView](self, "assetImageView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v32, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

    -[PXStoryChromeButton label](self, "label");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v33, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);

    -[PXStoryChromeButton systemImageView](self, "systemImageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v34, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

    -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PXEdgeInsetsMakeAll();
    PXEdgeInsetsInsetRect();
    ((void (*)(void (**)(void *, void *, double, double, double, double), void *))v14[2])(v14, v35);

    -[PXStoryChromeButton backgroundView](self, "backgroundView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[PXStoryChromeButton backgroundView](self, "backgroundView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton sendSubviewToBack:](self, "sendSubviewToBack:", v37);

    }
    -[PXStoryChromeButton _updateBackgroundViewCornerRadius](self, "_updateBackgroundViewCornerRadius");
    if (objc_msgSend(v15, "hasBadgeImageContent"))
    {
      -[PXStoryChromeButton systemImageView](self, "systemImageView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "image");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        -[PXStoryChromeButton systemImageView](self, "systemImageView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "image");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "size");

        PXRectGetCenter();
        PXRectWithCenterAndSize();
      }
      objc_msgSend(v16, "badgeImageSize");
      objc_msgSend(v15, "badgeEdges");
      objc_msgSend(v15, "badgePadding");
      PXRectWithSizeAlignedToRectEdgesWithPadding();
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v49 = v48;
      -[PXStoryChromeButton badgeSystemImageView](self, "badgeSystemImageView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v50, v43, v45, v47, v49);

    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PXStoryChromeButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryChromeButton;
    -[PXStoryChromeButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[PXStoryChromeButton _invalidateAppearance](self, "_invalidateAppearance");
  }
}

- (void)setIsHovered:(BOOL)a3
{
  if (self->_isHovered != a3)
  {
    self->_isHovered = a3;
    -[PXStoryChromeButton _invalidateAppearance](self, "_invalidateAppearance");
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  unsigned __int8 v7;
  uint64_t v8;
  BOOL v12;
  void *v13;
  objc_super v15;
  CGPoint v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryChromeButton;
  v7 = -[PXStoryChromeButton pointInside:withEvent:](&v15, sel_pointInside_withEvent_, a4);
  -[PXStoryChromeButton bounds](self, "bounds");
  if ((v7 & 1) != 0)
    return 1;
  if (CGRectIsEmpty(*(CGRect *)&v8))
    return 0;
  -[PXStoryChromeButton userData](self, "userData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTestEdgeOutsets");
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v16.x = x;
  v16.y = y;
  v12 = CGRectContainsPoint(v17, v16);

  return v12;
}

- (void)_invalidateAssetImage
{
  id v2;

  -[PXStoryChromeButton updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssetImage);

}

- (void)_updateAssetImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  id location;

  -[PXStoryChromeButton userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v5, "defaultImageSize");
    objc_msgSend(v5, "extendedTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    PXSizeScale();
    v8 = v7;
    v10 = v9;

    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    objc_msgSend(off_1E50B3348, "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageProviderForAsset:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__PXStoryChromeButton__updateAssetImage__block_invoke;
    v14[3] = &unk_1E5145C08;
    objc_copyWeak(&v18, &location);
    v15 = v4;
    v16 = &v19;
    v17 = &v23;
    v13 = objc_msgSend(v12, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, 0, 0, v14, v8, v10);

    v20[3] = v13;
    *((_BYTE *)v24 + 24) = 0;
    -[PXStoryChromeButton setImageRequestID:](self, "setImageRequestID:", v13);
    _Block_object_dispose(&v19, 8);

    objc_destroyWeak(&v18);
    _Block_object_dispose(&v23, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PXStoryChromeButton setAssetImage:](self, "setAssetImage:", 0);
  }

}

- (void)_invalidateAppearance
{
  id v2;

  -[PXStoryChromeButton updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAppearance);

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[3];
  __int128 v31;
  __int128 v32;
  __int128 v33;

  -[PXStoryChromeButton userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXStoryChromeButton setEnabled:](self, "setEnabled:", objc_msgSend(v3, "enabled"));
    v5 = -[PXStoryChromeButton isFocused](self, "isFocused");
    if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v7);

      objc_msgSend(v3, "systemImageName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[PXStoryChromeButton _imageWithSystemName:](self, "_imageWithSystemName:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v6, "setImage:", v9);
      -[PXStoryChromeButton setConfiguration:](self, "setConfiguration:", v6);
      if (v3)
      {
        objc_msgSend(v3, "transform");
      }
      else
      {
        v32 = 0u;
        v33 = 0u;
        v31 = 0u;
      }
      v30[0] = v31;
      v30[1] = v32;
      v30[2] = v33;
      -[PXStoryChromeButton setTransform:](self, "setTransform:", v30);
      -[PXStoryChromeButton _updateAssetImageView](self, "_updateAssetImageView");

    }
    else
    {
      objc_msgSend(v3, "tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(v4, "defaultTintColor");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v12;

      if (v5)
      {
        objc_msgSend(v3, "focusedTintColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v4, "defaultFocusedTintColor");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        v6 = v16;
      }
      if ((objc_msgSend(v3, "enabled") & 1) == 0)
      {
        objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
        v17 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v17;
      }
      if (-[PXStoryChromeButton isMenuOpen](self, "isMenuOpen"))
      {
        objc_msgSend(v3, "focusedTintColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(v4, "defaultFocusedTintColor");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v20;

        v6 = v21;
      }
      -[PXStoryChromeButton setTintColor:](self, "setTintColor:", v6);
      -[PXStoryChromeButton layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shadowRadius");
      objc_msgSend(v9, "setShadowRadius:");
      if (v5)
      {
        objc_msgSend(v4, "focusedShadowOpacity");
        *(float *)&v23 = v23;
        objc_msgSend(v9, "setShadowOpacity:", v23);
        objc_msgSend(v4, "focusedShadowOffset");
      }
      else
      {
        LODWORD(v22) = 0;
        objc_msgSend(v9, "setShadowOpacity:", v22);
        v24 = *MEMORY[0x1E0C9D820];
        v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      objc_msgSend(v9, "setShadowOffset:", v24, v25);
      if (v3)
      {
        objc_msgSend(v3, "transform");
      }
      else
      {
        v28 = 0u;
        v29 = 0u;
        v27 = 0u;
      }
      v26[0] = v27;
      v26[1] = v28;
      v26[2] = v29;
      -[PXStoryChromeButton setTransform:](self, "setTransform:", v26);
      -[PXStoryChromeButton _updateLabel](self, "_updateLabel");
      -[PXStoryChromeButton _updateAssetImageView](self, "_updateAssetImageView");
      -[PXStoryChromeButton _updateSystemImageView](self, "_updateSystemImageView");
      -[PXStoryChromeButton _updateSystemImageVisualEffectView](self, "_updateSystemImageVisualEffectView");
      -[PXStoryChromeButton _updateBadgeSystemImageView](self, "_updateBadgeSystemImageView");
      -[PXStoryChromeButton _updateVisualEffectView](self, "_updateVisualEffectView");
      -[PXStoryChromeButton _updateBackgroundView](self, "_updateBackgroundView");
      -[PXStoryChromeButton _updateEffectViewCornerRadius](self, "_updateEffectViewCornerRadius");
      -[PXStoryChromeButton _updateBackgroundViewCornerRadius](self, "_updateBackgroundViewCornerRadius");
    }

    -[PXStoryChromeButton _configureActions](self, "_configureActions");
  }

}

- (void)_px_invalidatePointerInteraction
{
  id v2;

  -[PXStoryChromeButton pointerInteraction](self, "pointerInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)setAssetImage:(id)a3
{
  UIImage *v5;
  char v6;
  UIImage *v7;

  v7 = (UIImage *)a3;
  v5 = self->_assetImage;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIImage isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetImage, a3);
      -[PXStoryChromeButton _invalidateAppearance](self, "_invalidateAppearance");
    }
  }

}

- (id)_createAssetImageView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v2, "setContentMode:", 2);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)_createLabel
{
  return objc_alloc_init(MEMORY[0x1E0DC3990]);
}

- (void)_updateLabel
{
  void *v2;
  void *v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXStoryChromeButton userData](self, "userData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v10, "spec");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "labelAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v3);
  }
  else
  {
    v7 = 0;
  }
  -[PXStoryChromeButton label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v7);

  if (v5)
  {

  }
  -[PXStoryChromeButton label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v5 == 0);

}

- (void)_updateSystemImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  id v13;

  -[PXStoryChromeButton userData](self, "userData");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButton userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXStoryChromeButton _imageWithSystemName:](self, "_imageWithSystemName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[PXStoryChromeButton systemImageView](self, "systemImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "symbolTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v13, "symbolTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSymbolImage:withContentTransition:", v6, v9);

  }
  else
  {
    objc_msgSend(v7, "setImage:", v6);
  }
  objc_msgSend(v7, "setHidden:", v6 == 0);
  objc_msgSend(v3, "extendedTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (-[PXStoryChromeButton isMenuOpen](self, "isMenuOpen") && v11 != 5
    || (v12 = 1.0, -[PXStoryChromeButton isHighlighted](self, "isHighlighted"))
    && objc_msgSend(v3, "shouldDimWhenHighlighted"))
  {
    v12 = 0.5;
  }
  objc_msgSend(v7, "setAlpha:", v12);

}

- (void)_updateSystemImageVisualEffectView
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[PXStoryChromeButton userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "systemImageStyle");

  -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEffect:", v8);

    }
    -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maskView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[PXStoryChromeButton systemImageView](self, "systemImageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton systemImageView](self, "systemImageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v15);

      -[PXStoryChromeButton systemImageView](self, "systemImageView");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMaskView:", v22);
LABEL_10:

    }
  }
  else
  {
    if (v7)
    {
      -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setEffect:", 0);

    }
    -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "maskView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[PXStoryChromeButton systemImageVisualEffectView](self, "systemImageVisualEffectView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMaskView:", 0);

      -[PXStoryChromeButton systemImageView](self, "systemImageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");

      -[PXStoryChromeButton systemImageView](self, "systemImageView");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton assetImageView](self, "assetImageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v22, v16);
      goto LABEL_10;
    }
  }
}

- (void)_updateBadgeSystemImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXStoryChromeButton userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeSystemImageName");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXStoryChromeButton _badgeImageWithSystemName:](self, "_badgeImageWithSystemName:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[PXStoryChromeButton badgeSystemImageView](self, "badgeSystemImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  -[PXStoryChromeButton badgeSystemImageView](self, "badgeSystemImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 == 0);

}

- (void)_updateAssetImageView
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryChromeButton assetImage](self, "assetImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButton assetImageView](self, "assetImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v5);

  -[PXStoryChromeButton assetImageView](self, "assetImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v5 == 0);

}

- (void)_updateVisualEffectView
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[PXStoryChromeButton userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "backgroundStyle") == 1)
  {

  }
  else
  {
    -[PXStoryChromeButton userData](self, "userData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "backgroundStyle");

    if (v5 != 2)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }
  -[PXStoryChromeButton effectView](self, "effectView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
  v8 = v6;
  -[PXStoryChromeButton _configureVisualEffectView:](self, "_configureVisualEffectView:", v6);
  v7 = v8;
LABEL_8:
  v9 = v7;
  -[PXStoryChromeButton setEffectView:](self, "setEffectView:", v7);

}

- (void)setEffectView:(id)a3
{
  UIVisualEffectView *v5;
  UIVisualEffectView **p_effectView;
  UIVisualEffectView *effectView;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (UIVisualEffectView *)a3;
  p_effectView = &self->_effectView;
  effectView = self->_effectView;
  if (effectView != v5)
  {
    if (effectView)
    {
      -[UIVisualEffectView contentView](effectView, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subviews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            -[PXStoryChromeButton addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        }
        while (v13);
      }

      -[UIVisualEffectView removeFromSuperview](*p_effectView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_effectView, a3);
    if (*p_effectView)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[PXStoryChromeButton assetImageView](self, "assetImageView", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v16;
      -[PXStoryChromeButton systemImageView](self, "systemImageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
            -[UIVisualEffectView contentView](v5, "contentView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addSubview:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        }
        while (v20);
      }

      -[PXStoryChromeButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v5, 0);
    }
    -[PXStoryChromeButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setEffectViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXStoryChromeButton effectView](self, "effectView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    -[PXStoryChromeButton effectView](self, "effectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFrame:", x, y, width, height);

    -[PXStoryChromeButton _updateEffectViewCornerRadius](self, "_updateEffectViewCornerRadius");
  }

}

- (void)_updateBackgroundView
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;

  -[PXStoryChromeButton userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backgroundStyle");

  if ((unint64_t)(v4 - 3) > 1)
  {
    v6 = 0;
  }
  else
  {
    -[PXStoryChromeButton backgroundView](self, "backgroundView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v7 = v5;
    -[PXStoryChromeButton _configureBackgroundView:](self, "_configureBackgroundView:", v5);
    v6 = v7;
  }
  v8 = v6;
  -[PXStoryChromeButton setBackgroundView:](self, "setBackgroundView:", v6);

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
    if (self->_backgroundView)
      -[PXStoryChromeButton addSubview:](self, "addSubview:");
  }

}

- (void)_configureBackgroundView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;

  v13 = a3;
  -[PXStoryChromeButton userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "backgroundStyle");
  objc_msgSend(v4, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryChromeButton isFocused](self, "isFocused");
  if (v5 == 4)
  {
    if (v7)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v11);

    v12 = -[PXStoryChromeButton isHighlighted](self, "isHighlighted") == 0;
    v10 = v13;
    v9 = 0.7;
    if (v12)
      v9 = 1.0;
  }
  else
  {
    objc_msgSend(v4, "solidBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v8);

    v9 = 1.0;
    v10 = v13;
  }
  objc_msgSend(v10, "setAlpha:", v9);
  objc_msgSend(v13, "setUserInteractionEnabled:", 0);

}

- (void)_updateBackgroundViewCornerRadius
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  CGRect v9;

  -[PXStoryChromeButton backgroundView](self, "backgroundView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButton userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "backgroundStyle");
  v6 = 0;
  switch(v5)
  {
    case 0:
      goto LABEL_5;
    case 1:
    case 3:
    case 4:
      objc_msgSend(v3, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
      objc_msgSend(v8, "bounds");
      objc_msgSend(v3, "setCornerRadius:", CGRectGetHeight(v9) * 0.5);
      goto LABEL_4;
    case 2:
      objc_msgSend(v3, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
      objc_msgSend(v4, "spec");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "roundedRectCornerRadius");
      objc_msgSend(v3, "setCornerRadius:");

LABEL_4:
      v6 = 1;
LABEL_5:
      objc_msgSend(v3, "setShadowPathIsBounds:", v6);
      break;
    default:
      break;
  }

}

- (void)_handleImageResult:(id)a3 info:(id)a4 forDisplayAsset:(id)a5 requestID:(int64_t)a6 synchronous:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  if (a7 || -[PXStoryChromeButton imageRequestID](self, "imageRequestID") == a6)
  {
    -[PXStoryChromeButton userData](self, "userData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayAsset");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v13)
    {

    }
    else
    {
      v16 = v15;
      v17 = objc_msgSend(v13, "isEqual:", v15);

      if ((v17 & 1) == 0)
        goto LABEL_8;
    }
    -[PXStoryChromeButton setAssetImage:](self, "setAssetImage:", v18);
  }
LABEL_8:

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a5;
  -[PXStoryChromeButton userData](self, "userData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3B28];
  objc_msgSend(v6, "rect");

  objc_msgSend(v7, "hitTestEdgeOutsets");
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  objc_msgSend(v8, "regionWithRect:identifier:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
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
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v27;
  CGRect v28;

  -[PXStoryChromeButton userData](self, "userData", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButton frame](self, "frame");
  objc_msgSend(v5, "pointerShapeInsets");
  PXEdgeInsetsInsetRect();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v5, "pointerShape");
  if (v15 == 1)
  {
LABEL_4:
    v16 = (void *)MEMORY[0x1E0DC3B30];
    v28.origin.x = v8;
    v28.origin.y = v10;
    v28.size.width = v12;
    v28.size.height = v14;
    v17 = CGRectGetHeight(v28) * 0.5;
LABEL_5:
    objc_msgSend(v16, "shapeWithRoundedRect:cornerRadius:", v8, v10, v12, v14, v17);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v19 = (void *)v18;
  }
  else
  {
    if (!v15)
    {
      switch(objc_msgSend(v5, "backgroundStyle"))
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:", v8, v10, v12, v14);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        case 1:
        case 3:
        case 4:
          goto LABEL_4;
        case 2:
          v16 = (void *)MEMORY[0x1E0DC3B30];
          objc_msgSend(v6, "roundedRectCornerRadius");
          v17 = v27;
          goto LABEL_5;
        default:
          break;
      }
    }
    v19 = 0;
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v5, "backgroundStyle");
  v24 = v21;
  if ((unint64_t)(v23 - 1) >= 4)
  {
    if (v23)
    {
      v25 = 0;
      goto LABEL_12;
    }
    v24 = v22;
  }
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v24, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v25;
}

- (void)_configureVisualEffectView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[PXStoryChromeButton userData](self, "userData");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hasPrimaryImageContent"))
  {
    if (-[PXStoryChromeButton isHighlighted](self, "isHighlighted"))
      v6 = objc_msgSend(v5, "highlightedBlurEffectStyle");
    else
      v6 = objc_msgSend(v5, "blurEffectStyle");
    v7 = v6;
    v9 = -[PXStoryChromeButton isHighlighted](self, "isHighlighted");
    v10 = CFSTR("PXStoryChromeButton");
    if (v9)
      v10 = CFSTR("PXStoryChromeButton-highlighted");
    v8 = v10;
  }
  else
  {
    v7 = objc_msgSend(v5, "textOnlyBlurEffectStyle");
    v8 = CFSTR("PXStoryChromeButton-textOnly");
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffect:", v12);

  objc_msgSend(v4, "_setGroupName:", v8);
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

}

- (void)_updateEffectViewCornerRadius
{
  void *v3;
  uint64_t v4;
  void *v6;
  id v7;
  CGRect v8;

  -[PXStoryChromeButton effectView](self, "effectView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButton userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backgroundStyle");
  if ((unint64_t)(v4 - 3) < 2 || v4 == 1)
  {
    objc_msgSend(v7, "bounds");
    objc_msgSend(v7, "_setCornerRadius:continuous:maskedCorners:", 0, 15, CGRectGetHeight(v8) * 0.5);
  }
  else if (v4 == 2)
  {
    objc_msgSend(v3, "spec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "roundedRectCornerRadius");
    objc_msgSend(v7, "_setCornerRadius:continuous:maskedCorners:", 1, 15);

  }
}

- (id)_imageWithSystemName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  -[PXStoryChromeButton userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSystemImagePointSize");
  v8 = v7;
  v9 = objc_msgSend(v5, "preferredSystemImageWeight");
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", v9, -1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "applyTintColorAsHierarchicalColor"))
  {
    v11 = (void *)MEMORY[0x1E0DC3888];
    -[PXStoryChromeButton tintColor](self, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationWithHierarchicalColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationByApplyingConfiguration:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  -[PXStoryChromeButton _imageWithSystemName:symbolConfiguration:](self, "_imageWithSystemName:symbolConfiguration:", v4, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_badgeImageWithSystemName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[PXStoryChromeButton userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", objc_msgSend(v6, "badgeSystemImageWeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "badgeSystemImageColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v5, "badgeSystemImageColors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_configurationWithHierarchicalColors:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "configurationByApplyingConfiguration:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  -[PXStoryChromeButton _imageWithSystemName:symbolConfiguration:](self, "_imageWithSystemName:symbolConfiguration:", v4, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_imageWithSystemName:(id)a3 symbolConfiguration:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "px_systemImageNamed:withConfiguration:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PXStoryChromeButton log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Unable to find system image for name: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

- (void)_configureActions
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  -[PXStoryChromeButton userData](self, "userData");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButton removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", 0, 0, 0x2000);
  objc_msgSend(v14, "target");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(v14, "action");

    if (v5)
    {
      objc_msgSend(v14, "target");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", v6, objc_msgSend(v14, "action"), 0x2000);

    }
  }
  objc_msgSend(v14, "menu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButton setMenu:](self, "setMenu:", v7);

  -[PXStoryChromeButton menu](self, "menu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", v8 != 0);

  objc_msgSend(v14, "customContextMenuInteractionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EE9C1CB0);

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0DC36C0]);
    objc_msgSend(v14, "customContextMenuInteractionDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithDelegate:", v12);

  }
  else
  {
    v13 = 0;
  }
  -[PXStoryChromeButton setCustomContextMenuInteraction:](self, "setCustomContextMenuInteraction:", v13);

}

- (void)setCustomContextMenuInteraction:(id)a3
{
  UIContextMenuInteraction *v5;
  UIContextMenuInteraction *customContextMenuInteraction;
  UIContextMenuInteraction *v7;

  v5 = (UIContextMenuInteraction *)a3;
  customContextMenuInteraction = self->_customContextMenuInteraction;
  v7 = v5;
  if (customContextMenuInteraction != v5)
  {
    if (customContextMenuInteraction)
      -[PXStoryChromeButton removeInteraction:](self, "removeInteraction:");
    objc_storeStrong((id *)&self->_customContextMenuInteraction, a3);
    if (self->_customContextMenuInteraction)
      -[PXStoryChromeButton addInteraction:](self, "addInteraction:");
  }

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryChromeButton;
  -[PXStoryChromeButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v7, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, a5);
  -[PXStoryChromeButton menu](self, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willOpen");

  -[PXStoryChromeButton setIsMenuOpen:](self, "setIsMenuOpen:", 1);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryChromeButton;
  -[PXStoryChromeButton contextMenuInteraction:willEndForConfiguration:animator:](&v7, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, a5);
  -[PXStoryChromeButton menu](self, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didClose");

  -[PXStoryChromeButton setIsMenuOpen:](self, "setIsMenuOpen:", 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  PXStoryChromeButton *v8;
  PXStoryChromeButton *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryChromeButton;
  -[PXStoryChromeButton didUpdateFocusInContext:withAnimationCoordinator:](&v14, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, v7);
  objc_msgSend(v6, "nextFocusedView");
  v8 = (PXStoryChromeButton *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
  {
    v13 = MEMORY[0x1E0C809B0];
    v10 = __72__PXStoryChromeButton_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    v11 = &v13;
    goto LABEL_5;
  }
  objc_msgSend(v6, "previouslyFocusedView");
  v9 = (PXStoryChromeButton *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    v12 = MEMORY[0x1E0C809B0];
    v10 = __72__PXStoryChromeButton_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2;
    v11 = &v12;
LABEL_5:
    v11[1] = 3221225472;
    v11[2] = (uint64_t)v10;
    v11[3] = (uint64_t)&unk_1E5149198;
    v11[4] = (uint64_t)self;
    objc_msgSend(v7, "addCoordinatedAnimations:completion:", v12);
  }

}

- (void)setUserData:(id)a3
{
  PXStoryChromeButtonConfiguration *v4;
  BOOL v5;
  PXStoryChromeButtonConfiguration *v6;
  PXStoryChromeButtonConfiguration *userData;
  PXStoryChromeButtonConfiguration *v8;

  v8 = (PXStoryChromeButtonConfiguration *)a3;
  v4 = self->_userData;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXStoryChromeButtonConfiguration isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXStoryChromeButtonConfiguration *)-[PXStoryChromeButtonConfiguration copy](v8, "copy");
      userData = self->_userData;
      self->_userData = v6;

      -[PXStoryChromeButton _invalidateAssetImage](self, "_invalidateAssetImage");
      -[PXStoryChromeButton _invalidateAppearance](self, "_invalidateAppearance");
      -[PXStoryChromeButton _px_invalidatePointerInteraction](self, "_px_invalidatePointerInteraction");
    }
  }

}

- (void)prepareForReuse
{
  -[PXStoryChromeButton setUserData:](self, "setUserData:", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PXStoryChromeButton userData](self, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

- (PXStoryChromeButtonConfiguration)userData
{
  return self->_userData;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIImageView)systemImageView
{
  return self->_systemImageView;
}

- (UIVisualEffectView)systemImageVisualEffectView
{
  return self->_systemImageVisualEffectView;
}

- (UIImageView)badgeSystemImageView
{
  return self->_badgeSystemImageView;
}

- (UIImageView)assetImageView
{
  return self->_assetImageView;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImage)assetImage
{
  return self->_assetImage;
}

- (int64_t)imageRequestID
{
  return self->_imageRequestID;
}

- (void)setImageRequestID:(int64_t)a3
{
  self->_imageRequestID = a3;
}

- (BOOL)isMenuOpen
{
  return self->_isMenuOpen;
}

- (BOOL)isHovered
{
  return self->_isHovered;
}

- (UIContextMenuInteraction)customContextMenuInteraction
{
  return self->_customContextMenuInteraction;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_customContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_assetImage, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_assetImageView, 0);
  objc_storeStrong((id *)&self->_badgeSystemImageView, 0);
  objc_storeStrong((id *)&self->_systemImageVisualEffectView, 0);
  objc_storeStrong((id *)&self->_systemImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

uint64_t __72__PXStoryChromeButton_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppearance");
}

uint64_t __72__PXStoryChromeButton_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppearance");
}

void __40__PXStoryChromeButton__updateAssetImage__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 7);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleImageResult:info:forDisplayAsset:requestID:synchronous:", v7, v6, a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));

}

uint64_t __37__PXStoryChromeButton_layoutSubviews__block_invoke(uint64_t result, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  if (*(_BYTE *)(result + 64))
    return MEMORY[0x1A85CD2B8](a2, a3, a4, a5, *(double *)(result + 32), *(double *)(result + 40), *(double *)(result + 48), *(double *)(result + 56));
  return result;
}

void __37__PXStoryChromeButton_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  id v12;

  v11 = a2;
  objc_msgSend(v11, "superview");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(a3, a4, a5, a6);
  objc_msgSend(v12, "convertRect:fromView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "setFrame:");

}

+ (BOOL)usesButtonSystem
{
  return 0;
}

+ (CGSize)sizeWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  PXStoryChromeButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  v4 = a3;
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    v8 = objc_alloc_init(PXStoryChromeButton);
    -[PXStoryChromeButton setUserData:](v8, "setUserData:", v4);
    -[PXStoryChromeButton sizeThatFits:](v8, "sizeThatFits:", v7, v6);
    v7 = v9;
    v6 = v10;
  }
  else
  {
    if (objc_msgSend(v4, "hasPrimaryImageContent"))
    {
      objc_msgSend(v5, "defaultImageSize");
      v7 = v11;
      v6 = v12;
    }
    objc_msgSend(v4, "label");
    v8 = (PXStoryChromeButton *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v5, "labelAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v8, v14);

      objc_msgSend(a1, "_sizeForAttributedLabel:", v15);
      v17 = v16;
      v19 = v18;
      objc_msgSend(v5, "labelPadding");
      v7 = v7 + v21 + v17 + v20;
      v24 = v23 + v19 + v22;
      if (v6 < v24)
        v6 = v24;

    }
  }

  objc_msgSend(v4, "contentEdgeInsets");
  v27 = v7 + v25 + v26;
  v30 = v6 + v28 + v29;

  v31 = v27;
  v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

+ (CGSize)_sizeForAttributedLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CGSize result;

  v3 = a3;
  if (_sizeForAttributedLabel__onceToken != -1)
    dispatch_once(&_sizeForAttributedLabel__onceToken, &__block_literal_global_288365);
  objc_msgSend((id)_sizeForAttributedLabel__cachedSizes, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "CGSizeValue");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v10, "setAttributedText:", v3);
    objc_msgSend(v10, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    PXSizeCeilingToPixel();
    v7 = v11;
    v9 = v12;
    v13 = (void *)_sizeForAttributedLabel__cachedSizes;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, v3);

  }
  v15 = v7;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (id)_createSystemImageView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v2, "setContentMode:", 4);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

+ (id)_createSystemImageVisualEffectView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  return v2;
}

+ (id)_createBadgeSystemImageView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v2, "setContentMode:", 1);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

void __47__PXStoryChromeButton__sizeForAttributedLabel___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_sizeForAttributedLabel__cachedSizes;
  _sizeForAttributedLabel__cachedSizes = (uint64_t)v0;

}

@end
