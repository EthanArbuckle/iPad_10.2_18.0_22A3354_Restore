@implementation PXSecondaryToolbarController

- (void)setPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    self->_padding.top = top;
    self->_padding.left = left;
    self->_padding.bottom = bottom;
    self->_padding.right = right;
    -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (self->_contentView)
    {
      -[PXSecondaryToolbarController secondaryToolbar](self, "secondaryToolbar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_contentView);

    }
    -[PXSecondaryToolbarController _invalidateContentLayout](self, "_invalidateContentLayout");
    -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
    v5 = v8;
  }

}

- (UIEdgeInsets)containerViewAdditionalEdgeInsets
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[PXSecondaryToolbarController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (!-[PXSecondaryToolbarController isAtTop](self, "isAtTop")
    && -[PXSecondaryToolbarController isSecondaryToolbarVisible](self, "isSecondaryToolbarVisible"))
  {
    -[PXSecondaryToolbarController padding](self, "padding");
    v9 = v8;
    v11 = v10;
    -[PXSecondaryToolbarController height](self, "height");
    v7 = v11 + v12 + v9;
  }
  v13 = v4;
  v14 = v5;
  v15 = v7;
  v16 = v6;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)_updateSecondaryToolbarLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  id WeakRetained;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  CGRect *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (**v38)(void *, void *, _QWORD);
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double MinX;
  double v46;
  id v47;
  double v48;
  double v49;
  double MidX;
  id v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  void (**v59)(void *, void *);
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  double MinY;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CGFloat x;
  _QWORD v80[8];
  _QWORD aBlock[14];
  BOOL v82;
  uint64_t v83;
  CGRect *v84;
  uint64_t v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  CGRect *v90;
  uint64_t v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  -[PXSecondaryToolbarController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSecondaryToolbarController secondaryToolbar](self, "secondaryToolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSecondaryToolbarController padding](self, "padding");
  v6 = v5;
  objc_msgSend(v3, "safeAreaInsets");
  objc_msgSend(v3, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v3, "bringSubviewToFront:", v4);
  -[PXSecondaryToolbarController height](self, "height");
  v16 = v15;
  v78 = v15;
  if (-[PXSecondaryToolbarController isAtTop](self, "isAtTop"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
    objc_msgSend(WeakRetained, "secondaryToolbarControllerToolbarContentInsets:", self);
    v19 = v18;

    v20 = v19 - v16;
  }
  else
  {
    v95.origin.x = v8;
    v95.origin.y = v10;
    v95.size.width = v12;
    v95.size.height = v14;
    MaxY = CGRectGetMaxY(v95);
    objc_msgSend(v3, "layoutMargins");
    v23 = MaxY - v22;
    -[PXSecondaryToolbarController height](self, "height");
    v20 = v23 - v24 - v6;
  }
  v77 = v20;
  v89 = 0;
  v90 = (CGRect *)&v89;
  v91 = 0x4010000000;
  v92 = &unk_1A7E74EE7;
  v93 = 0u;
  v94 = 0u;
  PXEdgeInsetsInsetRect();
  PXEdgeInsetsInsetRect();
  *(_QWORD *)&v93 = v25;
  *((_QWORD *)&v93 + 1) = v26;
  *(_QWORD *)&v94 = v27;
  *((_QWORD *)&v94 + 1) = v28;
  y = v90[1].origin.y;
  x = v90[1].origin.x;
  width = v90[1].size.width;
  height = v90[1].size.height;
  v83 = 0;
  v84 = (CGRect *)&v83;
  v85 = 0x4010000000;
  v86 = &unk_1A7E74EE7;
  v32 = (CGRect *)MEMORY[0x1E0C9D628];
  v33 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v87 = *MEMORY[0x1E0C9D628];
  v88 = v33;
  v34 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");
  v35 = *MEMORY[0x1E0C9D648];
  v36 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
  v37 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PXSecondaryToolbarController__updateSecondaryToolbarLayout__block_invoke;
  aBlock[3] = &unk_1E513CF18;
  v82 = v34 == 1;
  *(CGFloat *)&aBlock[6] = v8;
  *(CGFloat *)&aBlock[7] = v10;
  *(CGFloat *)&aBlock[8] = v12;
  *(CGFloat *)&aBlock[9] = v14;
  aBlock[10] = v35;
  *(double *)&aBlock[11] = v77;
  aBlock[12] = v36;
  *(double *)&aBlock[13] = v78;
  aBlock[4] = &v89;
  aBlock[5] = &v83;
  v38 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  -[PXSecondaryToolbarController leadingAccessoryView](self, "leadingAccessoryView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2](v38, v39, 0);

  -[PXSecondaryToolbarController trailingAccessoryView](self, "trailingAccessoryView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2](v38, v40, 2);

  v96.origin.x = x;
  v96.origin.y = y;
  v96.size.width = width;
  v96.size.height = height;
  if (!CGRectEqualToRect(v96, v90[1]))
  {
    PXEdgeInsetsBetweenRects();
    if (v41 >= v42)
      v43 = v41;
    else
      v43 = v42;
    v44 = v43 + 12.0;
    v97.origin.x = x;
    v97.origin.y = y;
    v97.size.width = width;
    v97.size.height = height;
    v98 = CGRectInset(v97, v44, 0.0);
    v90[1] = v98;
  }
  if (-[PXSecondaryToolbarController stretched](self, "stretched"))
  {
    MinX = CGRectGetMinX(v90[1]);
    v46 = CGRectGetMaxX(v90[1]) - MinX;
  }
  else
  {
    v47 = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
    objc_msgSend(v47, "secondaryToolbarControllerToolbarSize:", self);
    v49 = v48;

    v46 = CGRectGetWidth(v90[1]);
    MidX = CGRectGetMidX(v90[1]);
    if (v49 < v46)
      v46 = v49;
    MinX = MidX + v46 * -0.5;
  }
  v51 = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
  if (objc_msgSend(v51, "secondaryToolbarControllerWantsToolbarVisible:", self))
  {
    -[PXSecondaryToolbarController contentView](self, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52 != 0;

  }
  else
  {
    v53 = 0;
  }

  objc_msgSend(v4, "setFrame:", MinX, v77, v46, v78);
  v103.origin.x = MinX;
  v103.origin.y = v77;
  v103.size.width = v46;
  v103.size.height = v78;
  v99 = CGRectUnion(v84[1], v103);
  v84[1] = v99;
  -[PXSecondaryToolbarController toolbarContainerView](self, "toolbarContainerView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v84[1].origin.x;
  v56 = v84[1].origin.y;
  v57 = v84[1].size.width;
  v58 = v84[1].size.height;
  PXRectGetCenter();
  objc_msgSend(v54, "setCenter:");
  PXRectWithSize();
  objc_msgSend(v54, "setBounds:");
  objc_msgSend(v54, "frame");
  if (!CGRectEqualToRect(v100, *v32))
    objc_msgSend(v3, "bringSubviewToFront:", v54);
  v80[0] = v37;
  v80[1] = 3221225472;
  v80[2] = __61__PXSecondaryToolbarController__updateSecondaryToolbarLayout__block_invoke_2;
  v80[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  *(CGFloat *)&v80[4] = v55;
  *(CGFloat *)&v80[5] = v56;
  *(CGFloat *)&v80[6] = v57;
  *(CGFloat *)&v80[7] = v58;
  v59 = (void (**)(void *, void *))_Block_copy(v80);
  -[PXSecondaryToolbarController secondaryToolbar](self, "secondaryToolbar");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2](v59, v60);

  -[PXSecondaryToolbarController leadingAccessoryView](self, "leadingAccessoryView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2](v59, v61);

  -[PXSecondaryToolbarController trailingAccessoryView](self, "trailingAccessoryView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2](v59, v62);

  -[PXSecondaryToolbarController containerView](self, "containerView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bounds");
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;

  v101.origin.x = v55;
  v101.origin.y = v56;
  v101.size.width = v57;
  v101.size.height = v58;
  MinY = CGRectGetMinY(v101);
  -[PXSecondaryToolbarController padding](self, "padding");
  v74 = v73;
  v102.origin.x = v65;
  v102.origin.y = v67;
  v102.size.width = v69;
  v102.size.height = v71;
  v75 = MinY - v74 + -50.0;
  v76 = CGRectGetMaxY(v102) - v75;
  if (PXRectIsValid())
    -[UIView setFrame:](self->_gradientView, "setFrame:", 0.0, v75, v69, v76);
  objc_msgSend(v54, "setHidden:", !v53);
  -[UIView setHidden:](self->_gradientView, "setHidden:", !v53);
  -[PXSecondaryToolbarController _invalidateContentLayout](self, "_invalidateContentLayout");

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v89, 8);

}

- (double)height
{
  return self->_height;
}

void __61__PXSecondaryToolbarController__updateSecondaryToolbarLayout__block_invoke(uint64_t a1, void *a2, CGRectEdge a3)
{
  id v5;
  CGFloat v6;
  CGRect *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  CGSize size;
  CGRect v14;
  CGRect slice;
  CGRect v16;

  v5 = a2;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 112))
      a3 = PXRectEdgeFlippedHorizontally();
    objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    memset(&slice, 0, sizeof(slice));
    memset(&v14, 0, sizeof(v14));
    CGRectDivide(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), &slice, &v14, v6, a3);
    CGRectGetMidX(slice);
    CGRectGetMidY(*(CGRect *)(a1 + 80));
    PXRectWithCenterAndSize();
    objc_msgSend(v5, "setFrame:");
    v7 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(v5, "frame");
    v16.origin.x = v8;
    v16.origin.y = v9;
    v16.size.width = v10;
    v16.size.height = v11;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectUnion(v7[1], v16);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    size = v14.size;
    *(CGPoint *)(v12 + 32) = v14.origin;
    *(CGSize *)(v12 + 48) = size;
  }

}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isAtTop
{
  return self->_isAtTop;
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)_invalidateContentLayout
{
  id v2;

  -[PXSecondaryToolbarController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateContentLayout);

}

- (BOOL)stretched
{
  return self->_stretched;
}

- (void)_updateContentLayout
{
  void *v3;
  id v4;

  -[PXSecondaryToolbarController contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSecondaryToolbarController secondaryToolbar](self, "secondaryToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  PXRectGetCenter();
  PXRectWithCenterAndSize();
  objc_msgSend(v4, "setFrame:");
  -[PXSecondaryToolbarController _invalidateAccessoryViewsLayout](self, "_invalidateAccessoryViewsLayout");

}

- (BOOL)isSecondaryToolbarVisible
{
  void *v3;
  double v4;
  void *v5;
  id WeakRetained;
  char v7;
  BOOL v8;

  -[PXSecondaryToolbarController secondaryToolbar](self, "secondaryToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v8 = v4 > 0.0
    && (objc_msgSend(v3, "isHidden") & 1) == 0
    && (-[PXSecondaryToolbarController contentView](self, "contentView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5)
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider),
        v7 = objc_msgSend(WeakRetained, "secondaryToolbarControllerToolbarRenderedExternally:", self),
        WeakRetained,
        (v7 & 1) != 0)
    || -[PXSecondaryToolbarController shouldAlwaysBeConsideredVisibleForLayoutPurpose](self, "shouldAlwaysBeConsideredVisibleForLayoutPurpose");

  return v8;
}

- (UIView)secondaryToolbar
{
  return self->_secondaryToolbar;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)updateIfNeeded
{
  void *v4;
  id v5;

  if (self->_willUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSecondaryToolbarController.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_willUpdate"));

  }
  self->_willUpdate = 1;
  -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
  self->_willUpdate = 0;
  -[PXSecondaryToolbarController updater](self, "updater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateIfNeeded");

}

- (void)invalidateSecondaryToolbarLayout
{
  id v2;

  -[PXSecondaryToolbarController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSecondaryToolbarLayout);

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setNeedsUpdate
{
  id v2;

  if (!self->_willUpdate)
  {
    -[PXSecondaryToolbarController containerView](self, "containerView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

  }
}

- (void)_updateViewOpacity
{
  double v3;
  double v4;
  id v5;

  -[PXSecondaryToolbarController alpha](self, "alpha");
  v4 = v3;
  -[PXSecondaryToolbarController toolbarContainerView](self, "toolbarContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (double)alpha
{
  return self->_alpha;
}

- (PXSecondaryToolbarController)initWithContainerView:(id)a3 styleGuideProvider:(id)a4
{
  id v7;
  id v8;
  PXSecondaryToolbarController *v9;
  PXSecondaryToolbarController *v10;
  PXHitTestTransparentView *v11;
  UIView *toolbarContainerView;
  uint64_t v13;
  PXUpdater *updater;
  uint64_t v15;
  UIView *secondaryToolbar;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXSecondaryToolbarController;
  v9 = -[PXSecondaryToolbarController init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerView, a3);
    objc_storeStrong((id *)&v10->_legibilityContainerView, a3);
    v11 = objc_alloc_init(PXHitTestTransparentView);
    toolbarContainerView = v10->_toolbarContainerView;
    v10->_toolbarContainerView = &v11->super;

    -[UIView addSubview:](v10->_containerView, "addSubview:", v10->_toolbarContainerView);
    objc_storeWeak((id *)&v10->_styleGuideProvider, v8);
    v10->_alpha = 1.0;
    v13 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v10, sel_setNeedsUpdate);
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v13;

    -[PXUpdater addUpdateSelector:needsUpdate:](v10->_updater, "addUpdateSelector:needsUpdate:", sel__updatePositioning, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v10->_updater, "addUpdateSelector:needsUpdate:", sel__updateSecondaryToolbarLayout, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v10->_updater, "addUpdateSelector:needsUpdate:", sel__updateContentLayout, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v10->_updater, "addUpdateSelector:needsUpdate:", sel__updateAccessoryViewsLayout, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v10->_updater, "addUpdateSelector:needsUpdate:", sel__updateViewOpacity, 1);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    secondaryToolbar = v10->_secondaryToolbar;
    v10->_secondaryToolbar = (UIView *)v15;

    -[UIView addSubview:](v10->_toolbarContainerView, "addSubview:", v10->_secondaryToolbar);
  }

  return v10;
}

- (void)_updatePositioning
{
  PXSecondaryToolbarStyleGuideProvider **p_styleGuideProvider;
  id WeakRetained;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;

  p_styleGuideProvider = &self->_styleGuideProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
  objc_msgSend(WeakRetained, "secondaryToolbarControllerToolbarSize:", self);
  v7 = v6;

  v8 = objc_loadWeakRetained((id *)p_styleGuideProvider);
  v9 = objc_msgSend(v8, "secondaryToolbarControllerToolbarPlacement:", self);

  switch(v9)
  {
    case 1:
      v10 = 1;
      break;
    case 3:
      v10 = 0;
      v13 = *(double *)off_1E50B8020;
      v15 = *((double *)off_1E50B8020 + 1);
      v17 = *((double *)off_1E50B8020 + 2);
      v19 = *((double *)off_1E50B8020 + 3);
      v20 = 1;
      goto LABEL_8;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSecondaryToolbarController.m"), 260, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v10 = 0;
      break;
  }
  v11 = objc_loadWeakRetained((id *)p_styleGuideProvider);
  objc_msgSend(v11, "secondaryToolbarControllerToolbarPadding:", self);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = 0;
LABEL_8:
  -[PXSecondaryToolbarController setIsAtTop:](self, "setIsAtTop:", v20);
  -[PXSecondaryToolbarController setStretched:](self, "setStretched:", v10);
  -[PXSecondaryToolbarController setHeight:](self, "setHeight:", v7);
  -[PXSecondaryToolbarController setPadding:](self, "setPadding:", v13, v15, v17, v19);
}

- (void)setStretched:(BOOL)a3
{
  if (self->_stretched != a3)
  {
    self->_stretched = a3;
    -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
  }
}

- (void)setIsAtTop:(BOOL)a3
{
  if (self->_isAtTop != a3)
  {
    self->_isAtTop = a3;
    -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
  }
}

- (void)setHeight:(double)a3
{
  if (self->_height != a3)
  {
    self->_height = a3;
    -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
  }
}

- (PXSecondaryToolbarController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSecondaryToolbarController.m"), 42, CFSTR("%s is not available as initializer"), "-[PXSecondaryToolbarController init]");

  abort();
}

- (void)removeFromContainerView
{
  void *v3;
  UIView *gradientView;

  -[PXSecondaryToolbarController toolbarContainerView](self, "toolbarContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UIView removeFromSuperview](self->_gradientView, "removeFromSuperview");
  gradientView = self->_gradientView;
  self->_gradientView = 0;

}

- (void)setLeadingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *leadingAccessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  leadingAccessoryView = self->_leadingAccessoryView;
  if (leadingAccessoryView != v5)
  {
    v7 = v5;
    -[PXSecondaryToolbarController _replaceAccessoryView:with:](self, "_replaceAccessoryView:with:", leadingAccessoryView, v5);
    objc_storeStrong((id *)&self->_leadingAccessoryView, a3);
    v5 = v7;
  }

}

- (void)setTrailingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *trailingAccessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  trailingAccessoryView = self->_trailingAccessoryView;
  if (trailingAccessoryView != v5)
  {
    v7 = v5;
    -[PXSecondaryToolbarController _replaceAccessoryView:with:](self, "_replaceAccessoryView:with:", trailingAccessoryView, v5);
    objc_storeStrong((id *)&self->_trailingAccessoryView, a3);
    v5 = v7;
  }

}

- (void)_replaceAccessoryView:(id)a3 with:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "removeFromSuperview");
  if (v7)
  {
    -[PXSecondaryToolbarController toolbarContainerView](self, "toolbarContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    objc_msgSend(v7, "setHitTestDirectionalInsets:", -20.0, -20.0, -20.0, -20.0);
  }
  -[PXSecondaryToolbarController invalidatePositioning](self, "invalidatePositioning");
  -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
  -[PXSecondaryToolbarController invalidateViewOpacity](self, "invalidateViewOpacity");

}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    -[PXSecondaryToolbarController invalidateViewOpacity](self, "invalidateViewOpacity");
  }
}

- (void)setContentScrollViewController:(id)a3
{
  PXScrollViewController *v5;
  PXScrollViewController *contentScrollViewController;
  PXScrollViewController *v7;

  v5 = (PXScrollViewController *)a3;
  contentScrollViewController = self->_contentScrollViewController;
  if (contentScrollViewController != v5)
  {
    v7 = v5;
    -[PXScrollViewController unregisterObserver:](contentScrollViewController, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_contentScrollViewController, a3);
    -[PXScrollViewController registerObserver:](self->_contentScrollViewController, "registerObserver:", self);
    -[PXSecondaryToolbarController _updateLegibilityGradient](self, "_updateLegibilityGradient");
    v5 = v7;
  }

}

- (void)setLegibilityGradientEnabled:(BOOL)a3
{
  if (self->_legibilityGradientEnabled != a3)
  {
    self->_legibilityGradientEnabled = a3;
    -[PXSecondaryToolbarController _updateLegibilityGradient](self, "_updateLegibilityGradient");
  }
}

- (void)setIsShowingGradient:(BOOL)a3
{
  if (self->_isShowingGradient != a3)
  {
    self->_isShowingGradient = a3;
    -[PXSecondaryToolbarController isShowingGradientDidChange](self, "isShowingGradientDidChange");
  }
}

- (void)setBackdropGroupName:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *backdropGroupName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_backdropGroupName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      backdropGroupName = self->_backdropGroupName;
      self->_backdropGroupName = v6;

      -[PXSecondaryToolbarController backdropGroupNameDidChange](self, "backdropGroupNameDidChange");
    }
  }

}

- (void)invalidatePositioning
{
  id v2;

  -[PXSecondaryToolbarController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePositioning);

}

- (void)_invalidateAccessoryViewsLayout
{
  id v2;

  -[PXSecondaryToolbarController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAccessoryViewsLayout);

}

- (void)_updateAccessoryViewsLayout
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void *, void *, _QWORD);
  void *v18;
  void *v19;
  _QWORD v20[9];
  BOOL v21;

  -[PXSecondaryToolbarController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");
  -[PXSecondaryToolbarController secondaryToolbar](self, "secondaryToolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
  objc_msgSend(WeakRetained, "secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:", self);
  v16 = v15;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__PXSecondaryToolbarController__updateAccessoryViewsLayout__block_invoke;
    v20[3] = &__block_descriptor_73_e19_v20__0__UIView_8I16l;
    v21 = v4 == 1;
    v20[4] = v7;
    v20[5] = v9;
    v20[6] = v11;
    v20[7] = v13;
    v20[8] = v16;
    v17 = (void (**)(void *, void *, _QWORD))_Block_copy(v20);
    -[PXSecondaryToolbarController leadingAccessoryView](self, "leadingAccessoryView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v18, 0);

    -[PXSecondaryToolbarController trailingAccessoryView](self, "trailingAccessoryView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v19, 2);

  }
}

- (void)_invalidateLegibilityGradient
{
  id v2;
  id location;

  if (!self->_hasScheduledGradientUpdate)
  {
    self->_hasScheduledGradientUpdate = 1;
    objc_initWeak(&location, self);
    objc_copyWeak(&v2, &location);
    px_perform_on_main_runloop();
    objc_destroyWeak(&v2);
    objc_destroyWeak(&location);
  }
}

- (void)_handleScheduledLegibilityGradientUpdate
{
  self->_hasScheduledGradientUpdate = 0;
  -[PXSecondaryToolbarController _updateLegibilityGradient](self, "_updateLegibilityGradient");
}

- (void)_updateLegibilityGradient
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  double v18;
  double v19;
  id WeakRetained;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t *v25;
  id v26;
  UIView *v27;
  void *v28;
  void *v29;
  UIView *gradientView;
  UIView *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  PXSecondaryToolbarController *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  PXSecondaryToolbarController *v44;
  CGRect v45;
  CGRect v46;

  -[PXSecondaryToolbarController contentScrollViewController](self, "contentScrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constrainedVisibleRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "contentBounds");
  v46.origin.x = v12;
  v46.origin.y = v13;
  v46.size.width = v14;
  v46.size.height = v15;
  v45.origin.x = v5;
  v45.origin.y = v7;
  v45.size.width = v9;
  v45.size.height = v11;
  v16 = CGRectContainsRect(v45, v46);
  objc_msgSend(v3, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "px_scrollDistanceFromEdge:", 3);
  v19 = v18;
  WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
  objc_msgSend(WeakRetained, "secondaryToolbarControllerScrollableContentPadding:", self);
  v22 = v21;

  if (-[PXSecondaryToolbarController legibilityGradientEnabled](self, "legibilityGradientEnabled")
    && !v16
    && (-[PXSecondaryToolbarController padding](self, "padding"), v19 >= v22 + v23))
  {
    if (!-[PXSecondaryToolbarController isShowingGradient](self, "isShowingGradient"))
    {
      -[PXSecondaryToolbarController setIsShowingGradient:](self, "setIsShowingGradient:", 1);
      if (!self->_gradientView)
      {
        v26 = objc_alloc(MEMORY[0x1E0DC3890]);
        v27 = (UIView *)objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXSecondaryToolbarGradient"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 1.0, 0.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIView setImage:](v27, "setImage:", v29);
        -[UIView setAlpha:](v27, "setAlpha:", 0.0);
        gradientView = self->_gradientView;
        self->_gradientView = v27;
        v31 = v27;

        -[PXSecondaryToolbarController legibilityContainerView](self, "legibilityContainerView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addSubview:", self->_gradientView);

        -[PXSecondaryToolbarController containerView](self, "containerView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSecondaryToolbarController toolbarContainerView](self, "toolbarContainerView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "bringSubviewToFront:", v34);

      }
      v24 = (void *)MEMORY[0x1E0DC3F10];
      v40 = MEMORY[0x1E0C809B0];
      v41 = 3221225472;
      v42 = __57__PXSecondaryToolbarController__updateLegibilityGradient__block_invoke;
      v43 = &unk_1E5149198;
      v44 = self;
      v25 = &v40;
      goto LABEL_10;
    }
  }
  else if (-[PXSecondaryToolbarController isShowingGradient](self, "isShowingGradient"))
  {
    -[PXSecondaryToolbarController setIsShowingGradient:](self, "setIsShowingGradient:", 0);
    v24 = (void *)MEMORY[0x1E0DC3F10];
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __57__PXSecondaryToolbarController__updateLegibilityGradient__block_invoke_2;
    v38 = &unk_1E5149198;
    v39 = self;
    v25 = &v35;
LABEL_10:
    objc_msgSend(v24, "animateWithDuration:delay:options:animations:completion:", 4, v25, 0, 0.2, 0.0, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44);
    -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
  }

}

- (void)invalidateViewOpacity
{
  id v2;

  -[PXSecondaryToolbarController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewOpacity);

}

- (UIView)legibilityContainerView
{
  return self->_legibilityContainerView;
}

- (void)setLegibilityContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_legibilityContainerView, a3);
}

- (UIView)toolbarContainerView
{
  return self->_toolbarContainerView;
}

- (BOOL)shouldAlwaysBeConsideredVisibleForLayoutPurpose
{
  return self->_shouldAlwaysBeConsideredVisibleForLayoutPurpose;
}

- (void)setShouldAlwaysBeConsideredVisibleForLayoutPurpose:(BOOL)a3
{
  self->_shouldAlwaysBeConsideredVisibleForLayoutPurpose = a3;
}

- (PXSecondaryToolbarActionHandler)actionHandler
{
  return (PXSecondaryToolbarActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (BOOL)legibilityGradientEnabled
{
  return self->_legibilityGradientEnabled;
}

- (BOOL)isShowingGradient
{
  return self->_isShowingGradient;
}

- (PXScrollViewController)contentScrollViewController
{
  return self->_contentScrollViewController;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryToolbar, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_contentScrollViewController, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_toolbarContainerView, 0);
  objc_storeStrong((id *)&self->_legibilityContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_destroyWeak((id *)&self->_styleGuideProvider);
}

uint64_t __57__PXSecondaryToolbarController__updateLegibilityGradient__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 0.5);
}

uint64_t __57__PXSecondaryToolbarController__updateLegibilityGradient__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 0.0);
}

void __61__PXSecondaryToolbarController__invalidateLegibilityGradient__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleScheduledLegibilityGradientUpdate");

}

void __59__PXSecondaryToolbarController__updateAccessoryViewsLayout__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a2;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 72))
      a3 = PXRectEdgeFlippedHorizontally();
    objc_msgSend(v5, "frame");
    v8 = v6;
    v9 = v7;
    PXRectEdgeAxis();
    objc_msgSend(v5, "frame", v8, v9);
    PXSizeValueForAxis();
    if (a3)
      PXRectGetMaxForAxis();
    else
      PXRectGetMinForAxis();
    PXPointValueForAxis();
    PXPointSetValueForAxis();
    objc_msgSend(v5, "frame");
    PXRectWithOriginAndSize();
    objc_msgSend(v5, "setFrame:");
  }

}

void __61__PXSecondaryToolbarController__updateSecondaryToolbarLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    v2 = a2;
    objc_msgSend(v2, "frame");
    PXPointSubtract();
    objc_msgSend(v2, "setFrame:");

  }
}

@end
