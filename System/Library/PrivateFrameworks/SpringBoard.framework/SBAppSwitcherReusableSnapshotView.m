@implementation SBAppSwitcherReusableSnapshotView

void __51__SBAppSwitcherReusableSnapshotView__allImageViews__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_imageViewForRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

- (void)setShowingIconOverlayView:(BOOL)a3
{
  if (self->_showingIconOverlayView != a3)
  {
    self->_showingIconOverlayView = a3;
    -[SBAppSwitcherReusableSnapshotView setClipsToBounds:](self, "setClipsToBounds:");
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[SBAppSwitcherReusableSnapshotView _updateTranslucency](self, "_updateTranslucency");
  }
}

- (void)setUsesNonuniformScaling:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_usesNonuniformScaling != a3)
  {
    v3 = a3;
    self->_usesNonuniformScaling = a3;
    -[SBSwitcherSnapshotImageView setUsesNonuniformScaling:](self->_firstImageView, "setUsesNonuniformScaling:");
    -[SBSwitcherSnapshotImageView setUsesNonuniformScaling:](self->_secondImageView, "setUsesNonuniformScaling:", v3);
    -[SBSwitcherSnapshotImageView setUsesNonuniformScaling:](self->_thirdImageView, "setUsesNonuniformScaling:", v3);
  }
}

- (void)setShouldStretchToBounds:(BOOL)a3
{
  if (self->_shouldStretchToBounds != a3)
  {
    self->_shouldStretchToBounds = a3;
    -[SBSwitcherSnapshotImageView setStretchToFillBounds:](self->_firstImageView, "setStretchToFillBounds:");
    -[SBSwitcherSnapshotImageView setStretchToFillBounds:](self->_secondImageView, "setStretchToFillBounds:", self->_shouldStretchToBounds);
    -[SBSwitcherSnapshotImageView setStretchToFillBounds:](self->_thirdImageView, "setStretchToFillBounds:", self->_shouldStretchToBounds);
  }
}

- (void)setShouldUseBrightMaterial:(BOOL)a3
{
  if (self->_shouldUseBrightMaterial != a3)
  {
    self->_shouldUseBrightMaterial = a3;
    -[SBAppSwitcherReusableSnapshotView _updateTranslucency](self, "_updateTranslucency");
  }
}

- (void)setOrientation:(int64_t)a3
{
  id v5;
  _QWORD v6[7];
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  v5 = -[SBSwitcherWallpaperPageContentView orientation](&v8, sel_orientation);
  v7.receiver = self;
  v7.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  -[SBSwitcherWallpaperPageContentView setOrientation:](&v7, sel_setOrientation_, a3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SBAppSwitcherReusableSnapshotView_setOrientation___block_invoke;
  v6[3] = &unk_1E8E9DF00;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = v5;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v6);
}

uint64_t __52__SBAppSwitcherReusableSnapshotView_setOrientation___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setContainerOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setContainerOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setContainerOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateContentOrientationForRole:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateContentOrientationForRole:", 2);
  result = objc_msgSend(*(id *)(a1 + 32), "_updateContentOrientationForRole:", 4);
  if (*(_QWORD *)(a1 + 48) != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
  return result;
}

- (void)_updateContentOrientationForRole:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;

  -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        v7 = -[SBSwitcherWallpaperPageContentView orientation](self, "orientation"),
        v6,
        v7))
  {
    v8 = -[SBAppSwitcherReusableSnapshotView _contentOrientationForSnapshotCacheEntry:](self, "_contentOrientationForSnapshotCacheEntry:", v12);
    -[SBAppSwitcherReusableSnapshotView _orientationWrapperForRole:](self, "_orientationWrapperForRole:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "contentOrientation") != v8)
      -[SBAppSwitcherReusableSnapshotView setNeedsLayout](self, "setNeedsLayout");
    v10 = v9;
    v11 = v8;
  }
  else
  {
    -[SBAppSwitcherReusableSnapshotView _orientationWrapperForRole:](self, "_orientationWrapperForRole:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBSwitcherWallpaperPageContentView orientation](self, "orientation");
    v10 = v9;
  }
  objc_msgSend(v10, "setContentOrientation:", v11);

}

- (void)setAppLayout:(id)a3
{
  SBAppLayout **p_appLayout;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  v13 = a3;
  p_appLayout = &self->_appLayout;
  v7 = objc_msgSend(v13, "isEqual:", self->_appLayout);
  v8 = v13;
  if ((v7 & 1) == 0)
  {
    if (v13)
    {
      if (*p_appLayout)
      {
        objc_msgSend(v13, "allItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBAppLayout allItems](*p_appLayout, "allItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToArray:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherReusableSnapshotView.m"), 217, CFSTR("Does not support setting new appLayout without recycling first (unless both app layouts have the same items)."));

        }
      }
    }
    objc_storeStrong((id *)&self->_appLayout, a3);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__SBAppSwitcherReusableSnapshotView_setAppLayout___block_invoke;
    v14[3] = &unk_1E8EA2880;
    v14[4] = self;
    SBSnapshotViewEnumerateSupportedRoles(v14);
    -[SBAppSwitcherReusableSnapshotView _requestFreshImages](self, "_requestFreshImages");
    v8 = v13;
  }

}

- (void)_requestFreshImages
{
  SBAppLayout *v3;
  SBAppLayout *v4;
  _QWORD v5[5];
  SBAppLayout *v6;
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = self->_appLayout;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SBAppSwitcherReusableSnapshotView__requestFreshImages__block_invoke;
  v5[3] = &unk_1E8EBEDB8;
  objc_copyWeak(&v7, &location);
  v5[4] = self;
  v4 = v3;
  v6 = v4;
  -[SBAppLayout enumerate:](v4, "enumerate:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_visible != a3)
  {
    v3 = a3;
    self->_visible = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[SBAppSwitcherReusableSnapshotView _updateTranslucency](self, "_updateTranslucency");
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleInstalledAppsChanged_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SBAppSwitcherReusableSnapshotView_setVisible___block_invoke;
    v7[3] = &unk_1E8EBED90;
    v8 = v3;
    v7[4] = self;
    SBSnapshotViewEnumerateSupportedRoles(v7);

  }
}

- (void)layoutSubviews
{
  UIView *solidColorBackstopView;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  -[SBSwitcherWallpaperPageContentView layoutSubviews](&v5, sel_layoutSubviews);
  solidColorBackstopView = self->_solidColorBackstopView;
  -[SBAppSwitcherReusableSnapshotView _frameForBackstopLayer](self, "_frameForBackstopLayer");
  -[UIView setFrame:](solidColorBackstopView, "setFrame:");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SBAppSwitcherReusableSnapshotView_layoutSubviews__block_invoke;
  v4[3] = &unk_1E8EA2880;
  v4[4] = self;
  SBSnapshotViewEnumerateSupportedRoles(v4);
  -[SBAppSwitcherReusableSnapshotView _updateDivider](self, "_updateDivider");
}

- (void)_updateDivider
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id *v20;
  uint64_t v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double MinX;
  double Height;
  double MinY;
  void *v33;
  CAShapeLayer *medusaDividerLayer;
  id v35;
  CAShapeLayer *v36;
  double MaxX;
  id v38;
  CGRect v39;
  CGRect v40;

  -[SBAppSwitcherReusableSnapshotView appLayout](self, "appLayout");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "itemForLayoutRole:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAShapeLayer setHidden:](self->_medusaDividerLayer, "setHidden:", v3 == 0);
  if (v3)
  {
    -[SBAppSwitcherReusableSnapshotView _frameInLayoutSpaceForRole:inAppLayout:inOrientation:](self, "_frameInLayoutSpaceForRole:inAppLayout:inOrientation:", 1, v38, -[SBSwitcherWallpaperPageContentView orientation](self, "orientation"));
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[SBAppSwitcherReusableSnapshotView _frameInLayoutSpaceForRole:inAppLayout:inOrientation:](self, "_frameInLayoutSpaceForRole:inAppLayout:inOrientation:", 2, v38, -[SBSwitcherWallpaperPageContentView orientation](self, "orientation"));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (id *)MEMORY[0x1E0CEB258];
    v21 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    if (v21 == 1)
      v22 = v13;
    else
      v22 = v5;
    if (v21 == 1)
      v23 = v15;
    else
      v23 = v7;
    if (v21 == 1)
      v24 = v17;
    else
      v24 = v9;
    if (v21 == 1)
      v25 = v19;
    else
      v25 = v11;
    MaxX = CGRectGetMaxX(*(CGRect *)&v22);
    if (objc_msgSend(*v20, "userInterfaceLayoutDirection") == 1)
    {
      v26 = v5;
      v27 = v7;
      v28 = v9;
      v29 = v11;
    }
    else
    {
      v26 = v13;
      v27 = v15;
      v28 = v17;
      v29 = v19;
    }
    MinX = CGRectGetMinX(*(CGRect *)&v26);
    v39.origin.x = v5;
    v39.origin.y = v7;
    v39.size.width = v9;
    v39.size.height = v11;
    Height = CGRectGetHeight(v39);
    v40.origin.x = v5;
    v40.origin.y = v7;
    v40.size.width = v9;
    v40.size.height = v11;
    MinY = CGRectGetMinY(v40);
    -[SBAppSwitcherReusableSnapshotView _separatorViewBezierPathWithWidth:height:](self, "_separatorViewBezierPathWithWidth:height:", MinX - MaxX, Height);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    medusaDividerLayer = self->_medusaDividerLayer;
    v35 = objc_retainAutorelease(v33);
    -[CAShapeLayer setPath:](medusaDividerLayer, "setPath:", objc_msgSend(v35, "CGPath"));
    v36 = self->_medusaDividerLayer;
    objc_msgSend(v35, "bounds");
    -[CAShapeLayer setBounds:](v36, "setBounds:");
    -[CAShapeLayer setPosition:](self->_medusaDividerLayer, "setPosition:", (MaxX + MinX) * 0.5, MinY + Height * 0.5);

  }
}

- (CGRect)_frameForBackstopLayer
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");

  -[SBAppSwitcherReusableSnapshotView bounds](self, "bounds");
  UIRectInset();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

void __48__SBAppSwitcherReusableSnapshotView_setVisible___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemForLayoutRole:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v17;
    if (v17)
    {
      v8 = objc_msgSend(v17, "type");
      v7 = v17;
      if (!v8)
      {
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 536));
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v10, "appLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(WeakRetained, "snapshotView:shouldShowAppClipOverlayForLayout:", v10, v11);

        v7 = v17;
        if ((_DWORD)v10)
        {
          objc_msgSend(v17, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sceneStoreForIdentifier:creatingIfNecessary:", v13, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("appClipIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
            objc_msgSend(*(id *)(a1 + 32), "_addAppClipOverlayForRole:bundleIdentifier:sceneIdentifier:", a2, v12, v13);

          v7 = v17;
        }
      }
    }

  }
  else
  {
    objc_msgSend(v5, "_removeAppClipOverlayForRole:", a2);
  }
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)_updateTranslucency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void *v29;
  uint64_t v30;
  _BOOL8 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[SBAppSwitcherReusableSnapshotView _imageViewForRole:](self, "_imageViewForRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBAppSwitcherReusableSnapshotView _imageViewForRole:](self, "_imageViewForRole:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

  }
  else
  {
    v8 = 0;
  }

  -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SBAppSwitcherReusableSnapshotView _imageViewForRole:](self, "_imageViewForRole:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

  }
  else
  {
    v12 = 0;
  }

  v13 = -[SBAppSwitcherSettings shouldSimplifyForOptions:](self->_settings, "shouldSimplifyForOptions:", 128);
  -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:", 1);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_62;
  v15 = (void *)v14;
  -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:", 1);
  v45 = v4;
  v16 = v8;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "snapshot");
  v18 = v12;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "backgroundStyle");

  v12 = v18;
  v8 = v16;
  v4 = v45;

  if (!v20)
  {
LABEL_62:
    -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "snapshot");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v22, "backgroundStyle");

    }
  }
  -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isClassic");
  if (v4)
    v25 = v8;
  else
    v25 = 1;
  v26 = (v20 != 0) & ~(v25 | v12) & !v13;
  if (v4)
    v27 = v13;
  else
    v27 = 1;
  if (v27 == 1)
  {
    if (objc_msgSend(v23, "classicAppPhoneAppRunningOnPad"))
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if ((v26 ^ 1 | v24) != 1 || (v24 | v8 | v12) == 0)
  {
LABEL_34:
    -[UIView setHidden:](self->_solidColorBackstopView, "setHidden:", 1);
    if (!v26)
      goto LABEL_33;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_31;
    }
LABEL_56:
    if (self->_shouldUseBrightMaterial)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v44 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v44;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "userInterfaceIdiom"))
  {

    goto LABEL_31;
  }
  v43 = SBFEffectiveHomeButtonType();

  if (v43 == 2)
    goto LABEL_56;
LABEL_31:
  if (!v29)
    goto LABEL_34;
  -[UIView setHidden:](self->_solidColorBackstopView, "setHidden:", 0);
  -[UIView setBackgroundColor:](self->_solidColorBackstopView, "setBackgroundColor:", v29);

  if (!v26)
  {
LABEL_33:
    v30 = 1;
    goto LABEL_36;
  }
LABEL_35:
  v30 = _WallpaperStyleForBackgroundStyle();
LABEL_36:
  -[SBAppSwitcherReusableSnapshotView setWallpaperStyle:](self, "setWallpaperStyle:", v30);
  v31 = -[SBAppSwitcherReusableSnapshotView contentRequiresGroupOpacity](self, "contentRequiresGroupOpacity");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[SBAppSwitcherReusableSnapshotView _allImageViews](self, "_allImageViews");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v47 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v37, "setHasOpaqueContents:", v31 ^ 1);
        if (__sb__runningInSpringBoard())
        {
          if (SBFEffectiveDeviceClass() == 2)
          {
            v38 = v37;
            v39 = 0;
          }
          else
          {
            v38 = v37;
            v39 = v31;
          }
          objc_msgSend(v38, "setAllowsEdgeAntialiasing:", v39);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "userInterfaceIdiom") != 1 && v31;
          objc_msgSend(v37, "setAllowsEdgeAntialiasing:", v41);

        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v34);
  }

}

- (id)_cacheEntryForRole:(int64_t)a3
{
  NSMutableDictionary *snapshotViewStateByRole;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;

  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](snapshotViewStateByRole, "objectForKey:", v4);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v5 = (_QWORD *)v5[3];
  v7 = v5;

  return v7;
}

- (void)_configureSnapshotImageView:(id)a3 cacheEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    v10 = v6;
    v7 = a4;
    -[SBAppSwitcherReusableSnapshotView _sceneHandleForRole:](self, "_sceneHandleForRole:", objc_msgSend(v7, "role"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherReusableSnapshotView _updateCornerRadiusIfNecessaryForSnapshotImageView:cacheEntry:](self, "_updateCornerRadiusIfNecessaryForSnapshotImageView:cacheEntry:", v10, v7);

    if (-[SBSwitcherWallpaperPageContentView wallpaperStyle](self, "wallpaperStyle") == 1)
      v9 = objc_msgSend(v8, "isTranslucent") ^ 1;
    else
      v9 = 0;
    objc_msgSend(v10, "setHasOpaqueContents:", v9);

    v6 = v10;
  }

}

- (void)setWallpaperStyle:(int64_t)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  -[SBSwitcherWallpaperPageContentView setWallpaperStyle:](&v5, sel_setWallpaperStyle_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SBAppSwitcherReusableSnapshotView_setWallpaperStyle___block_invoke;
  v4[3] = &unk_1E8EA2880;
  v4[4] = self;
  SBSnapshotViewEnumerateSupportedRoles(v4);
}

- (BOOL)contentRequiresGroupOpacity
{
  if (-[SBSwitcherWallpaperPageContentView wallpaperStyle](self, "wallpaperStyle") == 1)
    return !-[UIView isHidden](self->_solidColorBackstopView, "isHidden");
  else
    return 1;
}

- (id)_allImageViews
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SBAppSwitcherReusableSnapshotView__allImageViews__block_invoke;
  v8[3] = &unk_1E8EABFB0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  SBSnapshotViewEnumerateSupportedRoles(v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __51__SBAppSwitcherReusableSnapshotView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  objc_msgSend(*(id *)(a1 + 32), "_cacheEntryForRole:", a2);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_snapshotImageFrameForCacheEntry:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "_orientationWrapperForRole:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 32), "_sceneHandleForRole:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "_supportsMixedOrientation") & 1) != 0)
  {
    objc_msgSend(v32, "snapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "interfaceOrientation");
    v16 = objc_msgSend(*(id *)(a1 + 32), "orientation");

    if (v15 != v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "center");
      objc_msgSend(v12, "setCenter:");
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "_imageViewForRole:", a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 != 1)
    objc_msgSend(v17, "setHidden:", v32 == 0);
  v18 = *(void **)(a1 + 32);
  objc_msgSend(v18, "_applicationForRole:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v18, "_doNonUniformScalingForApplication:", v19);

  if ((_DWORD)v18)
  {
    objc_msgSend(v17, "setStretchToFillBounds:", 1);
    objc_msgSend(v17, "setUsesNonuniformScaling:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusIfNecessaryForSnapshotImageView:cacheEntry:", v17, v32);
  v20 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v23, v17);
  v24 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v12, "bringContentSubviewToFront:", v27);
    objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v27, v17);
  }
  v28 = *(void **)(*(_QWORD *)(a1 + 32) + 560);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v31, v17);
}

- (id)_applicationForRole:(int64_t)a3
{
  void *v3;
  void *v4;

  -[SBAppSwitcherReusableSnapshotView _sceneHandleForRole:](self, "_sceneHandleForRole:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sceneHandleForRole:(int64_t)a3
{
  NSMutableDictionary *snapshotViewStateByRole;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;

  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](snapshotViewStateByRole, "objectForKey:", v4);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v5 = (_QWORD *)v5[2];
  v7 = v5;

  return v7;
}

void __56__SBAppSwitcherReusableSnapshotView__updateCornerRadius__block_invoke(uint64_t a1, uint64_t a2)
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "_imageViewForRole:", a2);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "_cacheEntryForRole:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateCornerRadiusIfNecessaryForSnapshotImageView:cacheEntry:", v18, v9);

  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v7, v18);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v13, v18);
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 560);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v17, v18);
}

- (id)_imageViewForRole:(int64_t)a3
{
  int *v3;

  switch(a3)
  {
    case 1:
      v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__firstImageView;
      break;
    case 2:
      v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__secondImageView;
      break;
    case 4:
      v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__thirdImageView;
      break;
    default:
      return 0;
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v3);
}

- (void)_updateCornerRadiusIfNecessaryForOverlayView:(id)a3 matchingSnapshotImage:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if (v9)
  {
    objc_msgSend(v5, "cornerRadius");
    objc_msgSend(v9, "_setContinuousCornerRadius:");
    objc_msgSend(v9, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "maskedCorners");
    v8 = v6;
  }
  else
  {
    objc_msgSend(0, "_setContinuousCornerRadius:", 0.0);
    objc_msgSend(0, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    v7 = 0;
  }
  objc_msgSend(v8, "setMaskedCorners:", v7);

}

- (void)_updateCornerRadiusIfNecessaryForSnapshotImageView:(id)a3 cacheEntry:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v7 = a4;
  if (v26 && v7)
  {
    -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:", objc_msgSend(v7, "role"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBAppSwitcherReusableSnapshotView _isSnapshotSuspendSnapshot:](self, "_isSnapshotSuspendSnapshot:", v9);

    if (!objc_msgSend(v8, "isClassic")
      || (objc_msgSend(v8, "classicAppFullScreen") & 1) != 0
      || self->_isChamoisWindowingEnabled)
    {
      -[SBSwitcherWallpaperPageContentView cornerRadius](self, "cornerRadius");
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
    if (v10)
    {
      v11 = 0;
    }
    else
    {
      if (objc_msgSend(v8, "classicAppNonFullScreenWithHomeAffordance")
        && objc_msgSend(v8, "classicAppWithRoundedCorners"))
      {
        SBScreenDisplayCornerRadius();
        goto LABEL_7;
      }
      if (objc_msgSend(v8, "classicAppNonFullScreenWithHomeAffordance")
        && (objc_msgSend(v8, "classicAppPhoneAppRunningOnPad") & 1) == 0)
      {
        objc_msgSend(v7, "snapshot");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v23, "interfaceOrientation");

      }
      else
      {
        v11 = 0;
        objc_msgSend(v8, "classicAppPhoneAppRunningOnPad");
      }
    }
LABEL_8:
    objc_msgSend(v26, "setCornerRadius:");
    objc_msgSend(v7, "appLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 2;
    objc_msgSend(v12, "itemForLayoutRole:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v18 = 15;
LABEL_25:
      objc_msgSend(v26, "setMaskedCorners:", v18);
      objc_msgSend(v26, "setAllowStatusBarToOverlap:", objc_msgSend(v8, "includesStatusBarInClassicJailForInterfaceOrientation:", v11));
      objc_msgSend(v26, "setOrientationForClassicLayout:", v11);

      goto LABEL_26;
    }
    v15 = (id *)MEMORY[0x1E0CEB258];
    v16 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    if (v16 == 1)
    {
      objc_msgSend(v7, "displayItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "itemForLayoutRole:", 2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqual:", v13))
      {

LABEL_24:
        v18 = 5;
        goto LABEL_25;
      }
      if (objc_msgSend(*v15, "userInterfaceLayoutDirection") == 1)
      {

LABEL_22:
        v18 = 10;
        goto LABEL_25;
      }
      v24 = v17;
    }
    else if (objc_msgSend(*v15, "userInterfaceLayoutDirection") == 1)
    {
      goto LABEL_22;
    }
    objc_msgSend(v7, "displayItem", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "itemForLayoutRole:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqual:", v21);

    if (v16 == 1)
    {

      if ((v22 & 1) != 0)
        goto LABEL_24;
    }
    else if (v22)
    {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
LABEL_26:

}

- (void)_updateCornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  -[SBSwitcherWallpaperPageContentView _updateCornerRadius](&v7, sel__updateCornerRadius);
  -[SBSwitcherWallpaperPageContentView cornerRadius](self, "cornerRadius");
  -[SBAppSwitcherReusableSnapshotView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  -[SBAppSwitcherReusableSnapshotView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", -[SBSwitcherWallpaperPageContentView maskedCorners](self, "maskedCorners"));

  -[UIView layer](self->_solidColorBackstopView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherWallpaperPageContentView cornerRadius](self, "cornerRadius");
  objc_msgSend(v4, "setCornerRadius:");

  -[UIView layer](self->_solidColorBackstopView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", -[SBSwitcherWallpaperPageContentView maskedCorners](self, "maskedCorners"));

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBAppSwitcherReusableSnapshotView__updateCornerRadius__block_invoke;
  v6[3] = &unk_1E8EA2880;
  v6[4] = self;
  SBSnapshotViewEnumerateSupportedRoles(v6);
}

- (id)_orientationWrapperForRole:(int64_t)a3
{
  int *v3;

  switch(a3)
  {
    case 1:
      v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__firstOrientationWrapper;
      break;
    case 2:
      v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__secondOrientationWrapper;
      break;
    case 4:
      v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__thirdOrientationWrapper;
      break;
    default:
      return 0;
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v3);
}

- (CGRect)_snapshotImageFrameForCacheEntry:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 isChamoisWindowingEnabled;
  BOOL v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  char v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  __int128 v71;
  CGRect v72;
  CGRect v73;
  CGRect result;

  v4 = (void *)MEMORY[0x1E0CEA950];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  v68 = v7;
  v9 = v8;
  v11 = v10;
  v70 = v12;

  objc_msgSend(v5, "snapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentFrame");
  v15 = v14;
  v17 = v16;
  v18 = -[SBSwitcherWallpaperPageContentView orientation](self, "orientation");
  v19 = objc_msgSend(v13, "interfaceOrientation");
  -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:", objc_msgSend(v5, "role"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SBAppSwitcherReusableSnapshotView _isSnapshotSuspendSnapshot:](self, "_isSnapshotSuspendSnapshot:", v13);
  v22 = objc_msgSend(v20, "classicAppPhoneAppRunningOnPad");
  objc_msgSend(v5, "appLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppSwitcherReusableSnapshotView _frameInLayoutSpaceForRole:inAppLayout:inOrientation:](self, "_frameInLayoutSpaceForRole:inAppLayout:inOrientation:", objc_msgSend(v23, "layoutRoleForItem:", v24), v23, -[SBSwitcherWallpaperPageContentView orientation](self, "orientation"));
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  isChamoisWindowingEnabled = self->_isChamoisWindowingEnabled;
  v34 = -[SBAppSwitcherReusableSnapshotView _doNonUniformScalingForApplication:](self, "_doNonUniformScalingForApplication:", v20);
  if (v21 || isChamoisWindowingEnabled || v34 || !objc_msgSend(v20, "isClassic"))
    goto LABEL_24;
  v65 = v28;
  v66 = v30;
  v67 = v32;
  v71 = SBUICUnitScaleFactor;
  objc_msgSend(v20, "snapshotFrameForClassicInsideBounds:forOrientation:scaleFactor:inReferenceSpace:", v18, &v71, 1, v68, v9, v11, v70);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  if (v22 && objc_msgSend(v20, "classicAppZoomedInOrRequiresHiDPI"))
  {
    *(_QWORD *)&v71 = SBClassicUtilitiesScaleFactorForPhoneAppZoomedIn(v19, v15, v17);
    *((_QWORD *)&v71 + 1) = v71;
  }
  SBUICScaledRectWithOffset();
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v69 = v49;
  v72.origin.x = v36;
  v72.origin.y = v38;
  v72.size.width = v40;
  v72.size.height = v42;
  v50 = CGRectGetMinX(v72) + v44;
  v73.origin.x = v36;
  v73.origin.y = v38;
  v73.size.width = v40;
  v73.size.height = v42;
  v51 = v46 + CGRectGetMinY(v73);
  if (v18 == 1)
  {
    if ((unint64_t)(v19 - 3) < 2)
      v52 = v22;
    else
      v52 = 0;
    v53 = v65;
    if ((v52 & 1) == 0)
      goto LABEL_17;
LABEL_16:
    _UIWindowConvertRectFromOrientationToOrientation();
    v50 = v54;
    v51 = v55;
    v48 = v56;
    v58 = v57;
    v60 = v66;
    v59 = v67;
    goto LABEL_18;
  }
  v53 = v65;
  if (!v22 || (unint64_t)(v19 - 3) <= 1)
    goto LABEL_16;
LABEL_17:
  v60 = v66;
  v59 = v67;
  v58 = v69;
LABEL_18:
  if (!CGFloatIsValid()
    || !CGFloatIsValid()
    || !CGFloatIsValid()
    || (CGFloatIsValid() & 1) == 0)
  {
    v58 = v59;
    v48 = v60;
    v51 = v53;
    v50 = v26;
  }
  v32 = v58;
  v30 = v48;
  v28 = v51;
  v26 = v50;
LABEL_24:

  v61 = v26;
  v62 = v28;
  v63 = v30;
  v64 = v32;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (BOOL)_doNonUniformScalingForApplication:(id)a3
{
  id v3;
  char v4;
  uint64_t v5;

  v3 = a3;
  v4 = 0;
  v5 = SBFEffectiveArtworkSubtype();
  if (v5 <= 2795)
  {
    if (v5 != 2556 && v5 != 2622)
      goto LABEL_10;
LABEL_7:
    if (objc_msgSend(v3, "classicAppScaled"))
      v4 = objc_msgSend(v3, "classicAppFullScreen");
    else
      v4 = 0;
    goto LABEL_10;
  }
  if (v5 == 2868 || v5 == 2796)
    goto LABEL_7;
LABEL_10:

  return v4;
}

- (BOOL)_isSnapshotSuspendSnapshot:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SBSuspendSnapshot"));

  return v4;
}

- (CGRect)_frameInLayoutSpaceForRole:(int64_t)a3 inAppLayout:(id)a4 inOrientation:(int64_t)a5
{
  SBAppSwitcherReusableSnapshotViewDelegate **p_delegate;
  id v9;
  id WeakRetained;
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
  double v21;
  double v22;
  CGRect result;

  p_delegate = &self->_delegate;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "layoutFrameForItemWithRole:inAppLayout:interfaceOrientation:forSnapshotView:", a3, v9, a5, self);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

void __50__SBAppSwitcherReusableSnapshotView_setAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_updateSceneHandleForRole:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_sceneHandleForRole:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_imageViewForRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "_cacheEntryForRole:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configureSnapshotImageView:cacheEntry:", v4, v6);

  objc_msgSend(v11, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBlockedForScreenTimeExpiration");

  v10 = *(void **)(a1 + 32);
  if (v9)
    objc_msgSend(v10, "_addAppLockoutOverlayIfNecessaryForRole:", a2);
  else
    objc_msgSend(v10, "_removeAppLockoutOverlayForRole:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_addOrRemoveAppProtectionShieldForApplication:role:", v7, a2);

}

void __55__SBAppSwitcherReusableSnapshotView_setWallpaperStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_imageViewForRole:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "_cacheEntryForRole:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_configureSnapshotImageView:cacheEntry:", v6, v5);

}

- (void)_updateSceneHandleForRole:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  -[SBAppLayout itemForLayoutRole:](self->_appLayout, "itemForLayoutRole:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  if (!v5)
    goto LABEL_5;
  if (!objc_msgSend(v5, "type"))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationWithBundleIdentifier:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (objc_msgSend(v18, "type") != 5)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_8;
  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sceneHandleProviderForSnapshotView:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "displayIdentityForSnapshotView:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v13 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v18, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneIdentityForApplication:uniqueIdentifier:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v7, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  objc_msgSend(v10, "fetchOrCreateApplicationSceneHandleForRequest:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  -[SBAppSwitcherReusableSnapshotView _setSceneHandle:forRole:](self, "_setSceneHandle:forRole:", v17, a3);

}

- (void)_setSceneHandle:(id)a3 forRole:(int64_t)a4
{
  NSMutableDictionary *snapshotViewStateByRole;
  void *v6;
  id v7;
  void *v8;
  id v9;

  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](snapshotViewStateByRole, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v8, v7);

}

- (void)_removeAppLockoutOverlayForRole:(int64_t)a3
{
  NSMutableDictionary *blockingViewControllerByRole;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  SBAppSwitcherReusableSnapshotView *v10;
  int64_t v11;

  blockingViewControllerByRole = self->_blockingViewControllerByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](blockingViewControllerByRole, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__SBAppSwitcherReusableSnapshotView__removeAppLockoutOverlayForRole___block_invoke;
    v8[3] = &unk_1E8EA0AF0;
    v9 = v7;
    v10 = self;
    v11 = a3;
    objc_msgSend(v9, "hideWithAnimation:completionHandler:", 0, v8);

  }
}

void __56__SBAppSwitcherReusableSnapshotView__requestFreshImages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (SBLayoutRoleIsValidForSplitView(a2) || a2 == 4)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 584));
    objc_msgSend(v6, "addSnapshotUpdateObserver:forDisplayItem:inAppLayout:", WeakRetained, v7, *(_QWORD *)(a1 + 40));

  }
}

- (SBAppSwitcherReusableSnapshotView)initWithDelegate:(id)a3 snapshotCache:(id)a4 lockoutVCProvider:(id)a5 appClipOverlayCoordinator:(id)a6 containerViewController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SBAppSwitcherReusableSnapshotView *v18;
  SBAppSwitcherReusableSnapshotView *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  SBAppSwitcherSettings *settings;
  uint64_t v25;
  SBMedusaSettings *medusaSettings;
  uint64_t v27;
  NSMutableArray *deferredSnapshotCrossfadeQueue;
  uint64_t v29;
  NSMutableDictionary *snapshotViewStateByRole;
  UIView *v31;
  UIView *solidColorBackstopView;
  void *v33;
  id v34;
  uint64_t v35;
  BSUIOrientationTransformWrapperView *firstOrientationWrapper;
  SBSwitcherSnapshotImageView *v37;
  SBSwitcherSnapshotImageView *firstImageView;
  NSMutableDictionary *v39;
  SBAppSwitcherSnapshotViewState *v40;
  void *v41;
  id v42;
  uint64_t v43;
  BSUIOrientationTransformWrapperView *secondOrientationWrapper;
  SBSwitcherSnapshotImageView *v45;
  SBSwitcherSnapshotImageView *secondImageView;
  uint64_t v47;
  CAShapeLayer *medusaDividerLayer;
  CAShapeLayer *v49;
  id v50;
  void *v51;
  NSMutableDictionary *v52;
  SBAppSwitcherSnapshotViewState *v53;
  void *v54;
  id v55;
  uint64_t v56;
  BSUIOrientationTransformWrapperView *thirdOrientationWrapper;
  SBSwitcherSnapshotImageView *v58;
  SBSwitcherSnapshotImageView *thirdImageView;
  NSMutableDictionary *v60;
  SBAppSwitcherSnapshotViewState *v61;
  void *v62;
  uint64_t v63;
  NSMutableDictionary *blockingViewControllerByRole;
  void *v65;
  void *v67;
  id v68;
  objc_super v69;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherReusableSnapshotView.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotCache != nil"));

  }
  v69.receiver = self;
  v69.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  v18 = -[SBAppSwitcherReusableSnapshotView init](&v69, sel_init);
  v19 = v18;
  if (v18)
  {
    v68 = v13;
    objc_storeWeak((id *)&v18->_delegate, v13);
    objc_storeWeak((id *)&v19->_snapshotCache, v14);
    objc_storeStrong((id *)&v19->_lockoutVCProvider, a5);
    objc_storeStrong((id *)&v19->_appClipOverlayCoordinator, a6);
    objc_storeWeak((id *)&v19->_containerViewController, v17);
    objc_msgSend(v17, "_sbWindowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "switcherController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "windowManagementStyle");

    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v23 = objc_claimAutoreleasedReturnValue();
    settings = v19->_settings;
    v19->_settings = (SBAppSwitcherSettings *)v23;

    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v25 = objc_claimAutoreleasedReturnValue();
    medusaSettings = v19->_medusaSettings;
    v19->_medusaSettings = (SBMedusaSettings *)v25;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = objc_claimAutoreleasedReturnValue();
    deferredSnapshotCrossfadeQueue = v19->_deferredSnapshotCrossfadeQueue;
    v19->_deferredSnapshotCrossfadeQueue = (NSMutableArray *)v27;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v29 = objc_claimAutoreleasedReturnValue();
    snapshotViewStateByRole = v19->_snapshotViewStateByRole;
    v19->_snapshotViewStateByRole = (NSMutableDictionary *)v29;

    v31 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    solidColorBackstopView = v19->_solidColorBackstopView;
    v19->_solidColorBackstopView = v31;

    -[UIView layer](v19->_solidColorBackstopView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    -[SBAppSwitcherReusableSnapshotView insertSubview:atIndex:](v19, "insertSubview:atIndex:", v19->_solidColorBackstopView, 0);
    v34 = objc_alloc(MEMORY[0x1E0D01940]);
    -[SBAppSwitcherReusableSnapshotView bounds](v19, "bounds");
    v35 = objc_msgSend(v34, "initWithFrame:");
    firstOrientationWrapper = v19->_firstOrientationWrapper;
    v19->_firstOrientationWrapper = (BSUIOrientationTransformWrapperView *)v35;

    -[SBAppSwitcherReusableSnapshotView addSubview:](v19, "addSubview:", v19->_firstOrientationWrapper);
    v37 = -[SBSwitcherSnapshotImageView initWithImage:]([SBSwitcherSnapshotImageView alloc], "initWithImage:", 0);
    firstImageView = v19->_firstImageView;
    v19->_firstImageView = v37;

    -[BSUIOrientationTransformWrapperView addContentView:](v19->_firstOrientationWrapper, "addContentView:", v19->_firstImageView);
    v39 = v19->_snapshotViewStateByRole;
    v40 = objc_alloc_init(SBAppSwitcherSnapshotViewState);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v39, "setObject:forKey:", v40, v41);

    if (v22)
    {
      v42 = objc_alloc(MEMORY[0x1E0D01940]);
      -[SBAppSwitcherReusableSnapshotView bounds](v19, "bounds");
      v43 = objc_msgSend(v42, "initWithFrame:");
      secondOrientationWrapper = v19->_secondOrientationWrapper;
      v19->_secondOrientationWrapper = (BSUIOrientationTransformWrapperView *)v43;

      -[SBAppSwitcherReusableSnapshotView addSubview:](v19, "addSubview:", v19->_secondOrientationWrapper);
      v45 = -[SBSwitcherSnapshotImageView initWithImage:]([SBSwitcherSnapshotImageView alloc], "initWithImage:", 0);
      secondImageView = v19->_secondImageView;
      v19->_secondImageView = v45;

      -[BSUIOrientationTransformWrapperView addContentView:](v19->_secondOrientationWrapper, "addContentView:", v19->_secondImageView);
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v47 = objc_claimAutoreleasedReturnValue();
      medusaDividerLayer = v19->_medusaDividerLayer;
      v19->_medusaDividerLayer = (CAShapeLayer *)v47;

      v49 = v19->_medusaDividerLayer;
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](v49, "setFillColor:", objc_msgSend(v50, "CGColor"));

      -[CAShapeLayer setHidden:](v19->_medusaDividerLayer, "setHidden:", 1);
      -[SBAppSwitcherReusableSnapshotView layer](v19, "layer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addSublayer:", v19->_medusaDividerLayer);

      v52 = v19->_snapshotViewStateByRole;
      v53 = objc_alloc_init(SBAppSwitcherSnapshotViewState);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v52, "setObject:forKey:", v53, v54);

      v55 = objc_alloc(MEMORY[0x1E0D01940]);
      -[SBAppSwitcherReusableSnapshotView bounds](v19, "bounds");
      v56 = objc_msgSend(v55, "initWithFrame:");
      thirdOrientationWrapper = v19->_thirdOrientationWrapper;
      v19->_thirdOrientationWrapper = (BSUIOrientationTransformWrapperView *)v56;

      -[SBAppSwitcherReusableSnapshotView addSubview:](v19, "addSubview:", v19->_thirdOrientationWrapper);
      v58 = -[SBSwitcherSnapshotImageView initWithImage:]([SBSwitcherSnapshotImageView alloc], "initWithImage:", 0);
      thirdImageView = v19->_thirdImageView;
      v19->_thirdImageView = v58;

      -[BSUIOrientationTransformWrapperView addContentView:](v19->_thirdOrientationWrapper, "addContentView:", v19->_thirdImageView);
      v60 = v19->_snapshotViewStateByRole;
      v61 = objc_alloc_init(SBAppSwitcherSnapshotViewState);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v60, "setObject:forKey:", v61, v62);

    }
    v63 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    blockingViewControllerByRole = v19->_blockingViewControllerByRole;
    v19->_blockingViewControllerByRole = (NSMutableDictionary *)v63;

    -[SBAppSwitcherReusableSnapshotView setClipsToBounds:](v19, "setClipsToBounds:", 0);
    v19->_isChamoisWindowingEnabled = v22 == 2;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObserver:selector:name:object:", v19, sel__windowManagementStyleDidChange_, CFSTR("SBSwitcherControllerWindowManagementStyleDidChangeNotification"), 0);

    v13 = v68;
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  -[SBAppSwitcherReusableSnapshotView dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  SBAppSwitcherReusableSnapshotView *v15;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("App Layout"));

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __48__SBAppSwitcherReusableSnapshotView_description__block_invoke;
  v13 = &unk_1E8EABFB0;
  v14 = v3;
  v15 = self;
  v6 = v3;
  SBSnapshotViewEnumerateSupportedRoles(&v10);
  v7 = (id)objc_msgSend(v6, "appendSuper", v10, v11, v12, v13);
  objc_msgSend(v6, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

void __48__SBAppSwitcherReusableSnapshotView_description__block_invoke(uint64_t a1, uint64_t a2)
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;

  if (a2 == 1)
    v4 = CFSTR("Cache Entry for Role Primary");
  else
    v4 = CFSTR("Cache Entry for Role Side");
  v8 = v4;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_cacheEntryForRole:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, v8);

}

- (void)prepareForReuse
{
  uint64_t v3;
  void *v4;
  SBAppLayout *appLayout;
  id WeakRetained;
  void *v7;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (self->_active)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherReusableSnapshotView.m"), 314, CFSTR("Can't recycle active view"));

  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__116;
  v16 = __Block_byref_object_dispose__116;
  v17 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SBAppSwitcherReusableSnapshotView_prepareForReuse__block_invoke;
  v11[3] = &unk_1E8EA6CA0;
  v11[4] = self;
  v11[5] = &v12;
  SBSnapshotViewEnumerateSupportedRoles(v11);
  v4 = (void *)v13[5];
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __52__SBAppSwitcherReusableSnapshotView_prepareForReuse__block_invoke_2;
  v10[3] = &unk_1E8EBED68;
  v10[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  -[UIView setBackgroundColor:](self->_solidColorBackstopView, "setBackgroundColor:", 0);
  -[UIView setHidden:](self->_solidColorBackstopView, "setHidden:", 1);
  appLayout = self->_appLayout;
  self->_appLayout = 0;

  self->_usesNonuniformScaling = 0;
  self->_shouldStretchToBounds = 0;
  self->_showingIconOverlayView = 0;
  self->_shouldUseBrightMaterial = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotCache);
  objc_msgSend(WeakRetained, "removeSnapshotObserver:", self);

  -[NSMutableArray removeAllObjects](self->_deferredSnapshotCrossfadeQueue, "removeAllObjects");
  -[SBAppSwitcherReusableSnapshotView setWallpaperStyle:](self, "setWallpaperStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

  _Block_object_dispose(&v12, 8);
}

void __52__SBAppSwitcherReusableSnapshotView_prepareForReuse__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_imageViewForRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");
  objc_msgSend(*(id *)(a1 + 32), "_setCacheEntry:forRole:", 0, a2);
  objc_msgSend(*(id *)(a1 + 32), "_setSceneHandle:forRole:", 0, a2);
  objc_msgSend(*(id *)(a1 + 32), "_setAnimatingTransition:forRole:", 0, a2);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_orientationWrapperForRole:", a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "_imageViewForRole:", a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v12)
          objc_msgSend(v11, "removeFromSuperview");
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "_removeAppLockoutOverlayForRole:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_removeAppClipOverlayForRole:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_removeAppProtectionShieldForRole:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_applicationForRole:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v14, "addObject:", v13);
  }

}

void __52__SBAppSwitcherReusableSnapshotView_prepareForReuse__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "appProtectionAssistant");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  -[SBSwitcherWallpaperPageContentView invalidate](&v2, sel_invalidate);
}

- (BOOL)hasSceneOverlayView
{
  return -[NSMutableDictionary count](self->_blockingViewControllerByRole, "count")
      || -[NSMutableDictionary count](self->_appClipOverlayByRole, "count")
      || -[NSMutableDictionary count](self->_appProtectionShieldViewControllerByRole, "count") != 0;
}

- (void)didUpdateCacheEntry:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    -[SBAppSwitcherReusableSnapshotView _updateToNewSnapshotImageUsingCacheEntry:](self, "_updateToNewSnapshotImageUsingCacheEntry:");
  }
  else
  {
    v7 = v3;
    v8 = v4;
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "[switcher snapshot view] Got called back with nil cacheEntry", v6, 2u);
    }

  }
}

- (void)appProtectionAssistantShouldShieldDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__SBAppSwitcherReusableSnapshotView_appProtectionAssistantShouldShieldDidChange___block_invoke;
  v3[3] = &unk_1E8EA2880;
  v3[4] = self;
  SBSnapshotViewEnumerateSupportedRoles(v3);
}

void __81__SBAppSwitcherReusableSnapshotView_appProtectionAssistantShouldShieldDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_applicationForRole:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_addOrRemoveAppProtectionShieldForApplication:role:", v4, a2);

}

- (void)_addOrRemoveAppProtectionShieldForApplication:(id)a3 role:(int64_t)a4
{
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "appProtectionAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldShield");

  if (v7)
    -[SBAppSwitcherReusableSnapshotView _addAppProtectionShieldIfNeededForRole:](self, "_addAppProtectionShieldIfNeededForRole:", a4);
  else
    -[SBAppSwitcherReusableSnapshotView _removeAppProtectionShieldForRole:](self, "_removeAppProtectionShieldForRole:", a4);
  -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8 == v11)
  {
    objc_msgSend(v11, "appProtectionAssistant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", self);

    v9 = v11;
  }

}

- (void)_handleInstalledAppsChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v10 = a3;
  objc_msgSend(v10, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBInstalledApplicationsAddedBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__SBAppSwitcherReusableSnapshotView__handleInstalledAppsChanged___block_invoke;
    v13[3] = &unk_1E8EA2880;
    v13[4] = self;
    SBSnapshotViewEnumerateSupportedRoles(v13);
  }
  objc_msgSend(v10, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("SBInstalledApplicationsUpdatedBundleIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __65__SBAppSwitcherReusableSnapshotView__handleInstalledAppsChanged___block_invoke_2;
    v11[3] = &unk_1E8EABFB0;
    v11[4] = self;
    v12 = v9;
    SBSnapshotViewEnumerateSupportedRoles(v11);

  }
}

void __65__SBAppSwitcherReusableSnapshotView__handleInstalledAppsChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_applicationForRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateSceneHandleForRole:", a2);
    v4 = 0;
  }

}

void __65__SBAppSwitcherReusableSnapshotView__handleInstalledAppsChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_applicationForRole:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBlockedForScreenTimeExpiration");

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4);
  if (v9)
  {
    if (((v10 ^ 1 | v6) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_removeAppLockoutOverlayForRole:", a2);
  }
  else if ((v10 & v6) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addAppLockoutOverlayIfNecessaryForRole:", a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "_addOrRemoveAppProtectionShieldForApplication:role:", v11, a2);

}

- (void)_setCacheEntry:(id)a3 forRole:(int64_t)a4
{
  NSMutableDictionary *snapshotViewStateByRole;
  void *v6;
  id v7;
  void *v8;
  id v9;

  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](snapshotViewStateByRole, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCameraHardwareButton setDispatchingRuleAssertion:]((uint64_t)v8, v7);

}

- (BOOL)_isAnimatingTransitionForRole:(int64_t)a3
{
  NSMutableDictionary *snapshotViewStateByRole;
  void *v4;
  _BYTE *v5;
  BOOL v6;

  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](snapshotViewStateByRole, "objectForKey:", v4);
  v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5[8] != 0;
  else
    v6 = 0;

  return v6;
}

- (void)_setAnimatingTransition:(BOOL)a3 forRole:(int64_t)a4
{
  NSMutableDictionary *snapshotViewStateByRole;
  _BYTE *v6;
  id v7;

  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](snapshotViewStateByRole, "objectForKey:");
  v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[8] = a3;

}

- (void)_updateToNewSnapshotImageUsingCacheEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSMutableDictionary *blockingViewControllerByRole;
  void *v10;
  void *v11;
  NSMutableDictionary *appProtectionShieldViewControllerByRole;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 shouldStretchToBounds;
  double v18;
  double v19;
  int64_t v20;
  NSMutableArray *deferredSnapshotCrossfadeQueue;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[6];
  _QWORD v67[4];
  id v68;
  _QWORD v69[5];
  _QWORD v70[5];
  id v71;
  uint64_t v72;
  _QWORD v73[4];
  id v74;
  SBAppSwitcherReusableSnapshotView *v75;
  uint64_t v76;
  _QWORD v77[5];
  _QWORD v78[4];
  id v79;

  v4 = a3;
  v5 = objc_msgSend(v4, "role");
  -[SBAppSwitcherReusableSnapshotView _imageViewForRole:](self, "_imageViewForRole:", v5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "snapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBAppSwitcherReusableSnapshotView _isSnapshotSuspendSnapshot:](self, "_isSnapshotSuspendSnapshot:", v7)
      || -[SBAppSwitcherSettings shouldSimplifyForOptions:](self->_settings, "shouldSimplifyForOptions:", 2))
    {
      v8 = 1;
    }
    else
    {
      blockingViewControllerByRole = self->_blockingViewControllerByRole;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](blockingViewControllerByRole, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v8 = 1;
      }
      else
      {
        appProtectionShieldViewControllerByRole = self->_appProtectionShieldViewControllerByRole;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](appProtectionShieldViewControllerByRole, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v14 != 0;

      }
    }

  }
  else
  {
    v8 = 1;
  }
  objc_msgSend(v6, "snapshotImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    && ((objc_msgSend(v15, "size"), v18 == 0.0)
     || (objc_msgSend(v16, "size"), v19 == 0.0)
     || (objc_msgSend(v15, "size"),
         objc_msgSend(v15, "size"),
         objc_msgSend(v16, "size"),
         objc_msgSend(v16, "size"),
         BSFloatApproximatelyEqualToFloat())))
  {
    shouldStretchToBounds = self->_shouldStretchToBounds;
    if (!self->_shouldStretchToBounds)
    {
      v20 = -[SBAppSwitcherReusableSnapshotView _contentOrientationForSnapshotCacheEntry:](self, "_contentOrientationForSnapshotCacheEntry:", v6);
      shouldStretchToBounds = v20 != -[SBAppSwitcherReusableSnapshotView _contentOrientationForSnapshotCacheEntry:](self, "_contentOrientationForSnapshotCacheEntry:", v4);
    }
  }
  else
  {
    shouldStretchToBounds = 1;
  }
  deferredSnapshotCrossfadeQueue = self->_deferredSnapshotCrossfadeQueue;
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke;
  v78[3] = &unk_1E8EBEDE0;
  v22 = v4;
  v79 = v22;
  -[NSMutableArray bs_filter:](deferredSnapshotCrossfadeQueue, "bs_filter:", v78);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInArray:](deferredSnapshotCrossfadeQueue, "removeObjectsInArray:", v23);

  v24 = v41;
  if (self->_active)
  {
    v25 = !self->_visible || shouldStretchToBounds;
    if (v25 == 1)
    {
      -[SBAppSwitcherReusableSnapshotView _setCacheEntry:forRole:](self, "_setCacheEntry:forRole:", v22, v5);
      objc_msgSend(v41, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeAllAnimations");

      objc_msgSend(v41, "setImage:", v16);
      v27 = MEMORY[0x1E0C809B0];
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_2;
      v77[3] = &unk_1E8E9DED8;
      v77[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v77);
      v28 = (void *)MEMORY[0x1E0CEABB0];
      v73[0] = v27;
      v73[1] = 3221225472;
      v73[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_3;
      v73[3] = &unk_1E8EA0AF0;
      v74 = v41;
      v75 = self;
      v76 = v5;
      objc_msgSend(v28, "performWithoutAnimation:", v73);
      v29 = v74;
    }
    else
    {
      if (-[SBAppSwitcherReusableSnapshotView _isAnimatingTransitionForRole:](self, "_isAnimatingTransitionForRole:", v5))
      {
        -[NSMutableArray _sb_enqueue:](self->_deferredSnapshotCrossfadeQueue, "_sb_enqueue:", v22);
        goto LABEL_29;
      }
      -[SBAppSwitcherReusableSnapshotView _setCacheEntry:forRole:](self, "_setCacheEntry:forRole:", v22, v5);
      -[SBAppSwitcherReusableSnapshotView setNeedsLayout](self, "setNeedsLayout");
      objc_msgSend(v41, "image");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v64[0] = 0;
        v64[1] = v64;
        v64[2] = 0x3032000000;
        v64[3] = __Block_byref_object_copy__116;
        v64[4] = __Block_byref_object_dispose__116;
        v65 = 0;
        v62[0] = 0;
        v62[1] = v62;
        v62[2] = 0x3032000000;
        v62[3] = __Block_byref_object_copy__116;
        v62[4] = __Block_byref_object_dispose__116;
        v63 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x3032000000;
        v59 = __Block_byref_object_copy__116;
        v60 = __Block_byref_object_dispose__116;
        v61 = 0;
        v31 = (void *)MEMORY[0x1E0CEABB0];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_8;
        v46[3] = &unk_1E8EBEE08;
        v55 = v5;
        v46[4] = self;
        v52 = v64;
        v47 = v15;
        v48 = v6;
        v53 = v62;
        v49 = v16;
        v50 = v22;
        v32 = v41;
        v51 = v32;
        v54 = &v56;
        objc_msgSend(v31, "_performWithoutRetargetingAnimations:", v46);
        v33 = (void *)v57[5];
        objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.35);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setAnimationFactory:", v34);

        v35 = (void *)v57[5];
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_9;
        v42[3] = &unk_1E8E9FD80;
        v44 = &v56;
        v42[4] = self;
        v43 = v32;
        v45 = v5;
        objc_msgSend(v35, "crossfadeWithCompletion:", v42);

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(v62, 8);

        _Block_object_dispose(v64, 8);
        v24 = v41;
        goto LABEL_29;
      }
      -[SBAppSwitcherReusableSnapshotView _setAnimatingTransition:forRole:](self, "_setAnimatingTransition:forRole:", 1, v5);
      v36 = (void *)MEMORY[0x1E0CEABB0];
      v37 = MEMORY[0x1E0C809B0];
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_4;
      v70[3] = &unk_1E8EA0AF0;
      v70[4] = self;
      v72 = v5;
      v38 = v41;
      v71 = v38;
      objc_msgSend(v36, "performWithoutAnimation:", v70);
      objc_msgSend(v38, "setImage:", v16);
      v69[0] = v37;
      v69[1] = 3221225472;
      v69[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_5;
      v69[3] = &unk_1E8E9DED8;
      v69[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v69);
      v39 = (void *)MEMORY[0x1E0CEABB0];
      v67[0] = v37;
      v67[1] = 3221225472;
      v67[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_6;
      v67[3] = &unk_1E8E9DED8;
      v40 = v38;
      v24 = v41;
      v68 = v40;
      v66[0] = v37;
      v66[1] = 3221225472;
      v66[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_7;
      v66[3] = &unk_1E8EAAB58;
      v66[4] = self;
      v66[5] = v5;
      objc_msgSend(v39, "animateWithDuration:animations:completion:", v67, v66, 0.1);

      v29 = v71;
    }

  }
LABEL_29:

}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "displayItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "_updateTranslucency");
  return objc_msgSend(*(id *)(a1 + 40), "_updateContentOrientationForRole:", *(_QWORD *)(a1 + 48));
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateContentOrientationForRole:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateTranslucency");
  objc_msgSend(*(id *)(a1 + 32), "_setAnimatingTransition:forRole:", 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_performDeferredSnapshotUpdatesIfNecessaryForRole:", *(_QWORD *)(a1 + 40));
}

void __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_8(uint64_t a1)
{
  SBSwitcherSnapshotImageView *v2;
  uint64_t v3;
  void *v4;
  SBSwitcherSnapshotImageView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_setAnimatingTransition:forRole:", 1, *(_QWORD *)(a1 + 104));
  v2 = -[SBSwitcherSnapshotImageView initWithImage:]([SBSwitcherSnapshotImageView alloc], "initWithImage:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_configureSnapshotImageView:cacheEntry:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 48));
  v5 = -[SBSwitcherSnapshotImageView initWithImage:]([SBSwitcherSnapshotImageView alloc], "initWithImage:", *(_QWORD *)(a1 + 56));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_configureSnapshotImageView:cacheEntry:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setUsesNonuniformScaling:", objc_msgSend(*(id *)(a1 + 72), "usesNonuniformScaling"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setStretchToFillBounds:", objc_msgSend(*(id *)(a1 + 72), "stretchToFillBounds"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setUsesNonuniformScaling:", objc_msgSend(*(id *)(a1 + 72), "usesNonuniformScaling"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setStretchToFillBounds:", objc_msgSend(*(id *)(a1 + 72), "stretchToFillBounds"));
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 72), "frame");
  objc_msgSend(v8, "setFrame:");
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 72), "frame");
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "_sceneHandleForRole:", *(_QWORD *)(a1 + 104));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isTranslucent");

  objc_msgSend(MEMORY[0x1E0DAC218], "crossfadeViewWithStartView:endView:translucent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 72), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 72), "_removeAllRetargetableAnimations:", 1);
  objc_msgSend(*(id *)(a1 + 72), "setImage:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_orientationWrapperForRole:", *(_QWORD *)(a1 + 104));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addContentView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));

}

void __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_9(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateTranslucency");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setAnimatingTransition:forRole:", 0, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_performDeferredSnapshotUpdatesIfNecessaryForRole:", *(_QWORD *)(a1 + 56));
  }
}

- (void)_performDeferredSnapshotUpdatesIfNecessaryForRole:(int64_t)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[SBAppSwitcherReusableSnapshotView _isAnimatingTransitionForRole:](self, "_isAnimatingTransitionForRole:"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_deferredSnapshotCrossfadeQueue;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (objc_msgSend(v10, "role", (_QWORD)v12) == a3)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_13;
        }
      }
      v11 = v10;

      if (!v11)
        return;
      -[SBAppSwitcherReusableSnapshotView _updateToNewSnapshotImageUsingCacheEntry:](self, "_updateToNewSnapshotImageUsingCacheEntry:", v11);
      -[NSMutableArray removeObject:](self->_deferredSnapshotCrossfadeQueue, "removeObject:", v11);
      v5 = v11;
    }
LABEL_13:

  }
}

- (int64_t)_contentOrientationForSnapshotCacheEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  -[SBAppSwitcherReusableSnapshotView _sceneHandleForRole:](self, "_sceneHandleForRole:", objc_msgSend(v4, "role"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_supportsMixedOrientation");

  objc_msgSend(v4, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation");

  v9 = -[SBSwitcherWallpaperPageContentView orientation](self, "orientation");
  if (v9 == XBOppositeInterfaceOrientation())
    v10 = v9;
  else
    v10 = v8;
  if (v6)
  {
    if (self->_isChamoisWindowingEnabled)
    {
      objc_msgSend(v4, "appLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutAttributesForItemInRole:", objc_msgSend(v4, "role"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "contentOrientation");

      if (v13 != v9 && v13 == v8)
        v10 = v9;
    }
    else
    {
      v10 = v9;
    }
  }

  return v10;
}

- (id)_separatorViewBezierPathWithWidth:(double)a3 height:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  SBScreenDisplayCornerRadius();
  if (BSFloatIsZero())
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, 0.0, a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cornerRadiusForInnerCorners");
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, 0.0, a3 + v9 * 4.0 * 2.0, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 10, 0.0, 0.0, v9 * 4.0, a4, v9, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 5, v9 * 4.0 + a3, 0.0, v9 * 4.0, a4, v9, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bezierPathByReversingPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendPath:", v12);

    objc_msgSend(v11, "bezierPathByReversingPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendPath:", v13);

  }
  return v6;
}

- (void)_addOverlayViewController:(id)a3 toOrientationWrapperForRole:(int64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  objc_msgSend(v6, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClipsToBounds:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, 0);
  objc_msgSend(WeakRetained, "addChildViewController:", v6);
  -[SBAppSwitcherReusableSnapshotView _orientationWrapperForRole:](self, "_orientationWrapperForRole:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addContentView:", v10);

  objc_msgSend(v10, "layoutIfNeeded");
  objc_msgSend(v6, "didMoveToParentViewController:", WeakRetained);
  objc_msgSend(v6, "endAppearanceTransition");

  -[SBAppSwitcherReusableSnapshotView _imageViewForRole:](self, "_imageViewForRole:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherReusableSnapshotView _updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:](self, "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v10, v9);

}

- (void)_addAppLockoutOverlayIfNecessaryForRole:(int64_t)a3
{
  NSMutableDictionary *blockingViewControllerByRole;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SBAppSwitcherSnapshotLockoutViewControllerProvider *lockoutVCProvider;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;

  blockingViewControllerByRole = self->_blockingViewControllerByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](blockingViewControllerByRole, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "screenTimePolicy");

    lockoutVCProvider = self->_lockoutVCProvider;
    objc_msgSend(v8, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherSnapshotLockoutViewControllerProvider blockingViewControllerForBundleIdentifier:screenTimePolicy:](lockoutVCProvider, "blockingViewControllerForBundleIdentifier:screenTimePolicy:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = self->_blockingViewControllerByRole;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

    objc_msgSend(v13, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClipsToBounds:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v13, "beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(WeakRetained, "addChildViewController:", v13);
    -[SBAppSwitcherReusableSnapshotView _orientationWrapperForRole:](self, "_orientationWrapperForRole:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addContentView:", v16);

    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __77__SBAppSwitcherReusableSnapshotView__addAppLockoutOverlayIfNecessaryForRole___block_invoke;
    v25 = &unk_1E8E9E820;
    v26 = v13;
    v27 = WeakRetained;
    v19 = WeakRetained;
    v20 = v13;
    objc_msgSend(v20, "showWithAnimation:completionHandler:", 0, &v22);
    -[SBAppSwitcherReusableSnapshotView _imageViewForRole:](self, "_imageViewForRole:", a3, v22, v23, v24, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherReusableSnapshotView _updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:](self, "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v16, v21);

  }
}

uint64_t __77__SBAppSwitcherReusableSnapshotView__addAppLockoutOverlayIfNecessaryForRole___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
}

uint64_t __69__SBAppSwitcherReusableSnapshotView__removeAppLockoutOverlayForRole___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "beginAppearanceTransition:animated:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 552);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v4);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 592), "recycleBlockingViewController:", *(_QWORD *)(a1 + 32));
}

- (void)_addAppClipOverlayForRole:(int64_t)a3 bundleIdentifier:(id)a4 sceneIdentifier:(id)a5
{
  id v8;
  NSMutableDictionary *appClipOverlayByRole;
  void *v10;
  void *v11;
  SBAppClipOverlayViewController *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  id v20;

  v20 = a4;
  v8 = a5;
  appClipOverlayByRole = self->_appClipOverlayByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](appClipOverlayByRole, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = -[SBAppClipOverlayViewController initWithCoordinator:bundleIdentifier:sceneIdentifier:]([SBAppClipOverlayViewController alloc], "initWithCoordinator:bundleIdentifier:sceneIdentifier:", self->_appClipOverlayCoordinator, v20, v8);
    -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 == 0;
    if (v13)
      v15 = 2;
    else
      v15 = -1;
    -[SBAppClipOverlayViewController setDisplayedOverPlaceholder:animated:](v12, "setDisplayedOverPlaceholder:animated:", v14, 0);
    -[SBAppClipOverlayViewController setSceneActivationState:animated:](v12, "setSceneActivationState:animated:", v15, 0);
    v16 = self->_appClipOverlayByRole;
    if (!v16)
    {
      v17 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      v18 = self->_appClipOverlayByRole;
      self->_appClipOverlayByRole = v17;

      v16 = self->_appClipOverlayByRole;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v12, v19);

    -[SBAppSwitcherReusableSnapshotView _addOverlayViewController:toOrientationWrapperForRole:](self, "_addOverlayViewController:toOrientationWrapperForRole:", v12, a3);
  }

}

- (void)_removeAppClipOverlayForRole:(int64_t)a3
{
  NSMutableDictionary *appClipOverlayByRole;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  id v12;

  appClipOverlayByRole = self->_appClipOverlayByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](appClipOverlayByRole, "objectForKeyedSubscript:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  if (v12)
  {
    objc_msgSend(v12, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherReusableSnapshotView _updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:](self, "_updateCornerRadiusIfNecessaryForOverlayView:matchingSnapshotImage:", v8, 0);
    objc_msgSend(v12, "beginAppearanceTransition:animated:", 0, 0);
    objc_msgSend(v12, "willMoveToParentViewController:", 0);
    objc_msgSend(v8, "removeFromSuperview");
    objc_msgSend(v12, "removeFromParentViewController");
    objc_msgSend(v12, "endAppearanceTransition");
    v9 = self->_appClipOverlayByRole;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

    if (!-[NSMutableDictionary count](self->_appClipOverlayByRole, "count"))
    {
      v11 = self->_appClipOverlayByRole;
      self->_appClipOverlayByRole = 0;

    }
    v7 = v12;
  }

}

- (void)_addAppProtectionShieldIfNeededForRole:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *appProtectionShieldViewControllerByRole;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    appProtectionShieldViewControllerByRole = self->_appProtectionShieldViewControllerByRole;
    v15 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](appProtectionShieldViewControllerByRole, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v15;
    if (!v8)
    {
      objc_msgSend(v15, "appProtectionAssistant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createShieldUIViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = self->_appProtectionShieldViewControllerByRole;
      if (!v11)
      {
        v12 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        v13 = self->_appProtectionShieldViewControllerByRole;
        self->_appProtectionShieldViewControllerByRole = v12;

        v11 = self->_appProtectionShieldViewControllerByRole;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v14);

      -[SBAppSwitcherReusableSnapshotView _addOverlayViewController:toOrientationWrapperForRole:](self, "_addOverlayViewController:toOrientationWrapperForRole:", v10, a3);
      v5 = v15;
    }
  }

}

- (void)_removeAppProtectionShieldForRole:(int64_t)a3
{
  NSMutableDictionary *appProtectionShieldViewControllerByRole;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  id v12;

  appProtectionShieldViewControllerByRole = self->_appProtectionShieldViewControllerByRole;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](appProtectionShieldViewControllerByRole, "objectForKeyedSubscript:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  if (v12)
  {
    objc_msgSend(v12, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginAppearanceTransition:animated:", 0, 0);
    objc_msgSend(v12, "willMoveToParentViewController:", 0);
    objc_msgSend(v8, "removeFromSuperview");
    objc_msgSend(v12, "removeFromParentViewController");
    objc_msgSend(v12, "endAppearanceTransition");
    v9 = self->_appProtectionShieldViewControllerByRole;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

    if (!-[NSMutableDictionary count](self->_appProtectionShieldViewControllerByRole, "count"))
    {
      v11 = self->_appProtectionShieldViewControllerByRole;
      self->_appProtectionShieldViewControllerByRole = 0;

    }
    v7 = v12;
  }

}

- (void)_windowManagementStyleDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  -[UIView _sbWindowScene](self, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isChamoisWindowingUIEnabled");

  if (self->_isChamoisWindowingEnabled != v6)
  {
    self->_isChamoisWindowingEnabled = v6;
    -[SBAppSwitcherReusableSnapshotView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)shouldUseBrightMaterial
{
  return self->_shouldUseBrightMaterial;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_deferredSnapshotCrossfadeQueue, 0);
  objc_storeStrong((id *)&self->_chamoisWindowingUIEnabledObserver, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_appClipOverlayByRole, 0);
  objc_storeStrong((id *)&self->_appClipOverlayCoordinator, 0);
  objc_storeStrong((id *)&self->_lockoutVCProvider, 0);
  objc_destroyWeak((id *)&self->_snapshotCache);
  objc_storeStrong((id *)&self->_solidColorBackstopView, 0);
  objc_storeStrong((id *)&self->_medusaDividerLayer, 0);
  objc_storeStrong((id *)&self->_appProtectionShieldViewControllerByRole, 0);
  objc_storeStrong((id *)&self->_blockingViewControllerByRole, 0);
  objc_storeStrong((id *)&self->_snapshotViewStateByRole, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_thirdImageView, 0);
  objc_storeStrong((id *)&self->_secondImageView, 0);
  objc_storeStrong((id *)&self->_firstImageView, 0);
  objc_storeStrong((id *)&self->_thirdOrientationWrapper, 0);
  objc_storeStrong((id *)&self->_secondOrientationWrapper, 0);
  objc_storeStrong((id *)&self->_firstOrientationWrapper, 0);
}

@end
