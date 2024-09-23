@implementation SBFluidSwitcherSheetMetricsCache

- (id)_displayEdgeInfo
{
  if (_displayEdgeInfo_sOnceToken != -1)
    dispatch_once(&_displayEdgeInfo_sOnceToken, &__block_literal_global_62);
  return (id)_displayEdgeInfo_sDisplayEdgeInfo;
}

void __52__SBFluidSwitcherSheetMetricsCache__displayEdgeInfo__block_invoke()
{
  double v0;
  double v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
  v1 = v0;
  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_displayEdgeInfo_sDisplayEdgeInfo;
  _displayEdgeInfo_sDisplayEdgeInfo = v2;

}

- (CGAffineTransform)transformForCardUnderSheetForBoundsSize:(SEL)a3
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  NSMutableDictionary *boundsToTransformMap;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  __int128 v19;
  void *v20;
  CGAffineTransform *result;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_boundsToTransformMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "CGAffineTransformValue");
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0CEABB0]);
    BSRectWithSize();
    v10 = (void *)objc_msgSend(v9, "initWithFrame:");
    _UISheetMinimumTopInset();
    v12 = v11;
    v13 = MEMORY[0x1E0C9BAA8];
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v13 + 32);
    BSRectWithSize();
    BSRectWithSize();
    _UISheetTransform();
    v15 = v23;
    *(_OWORD *)&retstr->a = v22;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tx = v24;
    boundsToTransformMap = self->_boundsToTransformMap;
    if (!boundsToTransformMap)
    {
      v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = self->_boundsToTransformMap;
      self->_boundsToTransformMap = v17;

      boundsToTransformMap = self->_boundsToTransformMap;
    }
    v19 = *(_OWORD *)&retstr->c;
    v22 = *(_OWORD *)&retstr->a;
    v23 = v19;
    v24 = *(_OWORD *)&retstr->tx;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", &v22, v12, 0x3FF0000000000000);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](boundsToTransformMap, "setObject:forKey:", v20, v6);

  }
  return result;
}

- (CGSize)pageSheetMetricsForBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5
{
  double height;
  double width;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBFluidSwitcherSheetMetricsCache _displayEdgeInfo](self, "_displayEdgeInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherSheetMetricsCache pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:](self, "pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, a5, objc_msgSend(v11, "userInterfaceIdiom"), v10, width, height, SBScreenScale());
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)pageSheetMetricsForBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8
{
  double height;
  double width;
  id v15;
  _SBFluidSwitcherSheetMetricsCacheKey *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  _SBFluidSwitcherSheetMetricsView *v21;
  _SBFluidSwitcherSheetMetricsView *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  NSMutableDictionary *cacheKeyToSizeValueMap;
  NSMutableDictionary *v40;
  NSMutableDictionary *v41;
  double v42;
  double v43;
  _QWORD v44[8];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v15 = a8;
  v16 = -[_SBFluidSwitcherSheetMetricsCacheKey initWithBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:]([_SBFluidSwitcherSheetMetricsCacheKey alloc], "initWithBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, a5, a6, v15, width, height, a7);
  -[NSMutableDictionary objectForKey:](self->_cacheKeyToSizeValueMap, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, "CGSizeValue");
    width = v19;
    height = v20;
  }
  else
  {
    v21 = [_SBFluidSwitcherSheetMetricsView alloc];
    BSRectWithSize();
    v22 = -[_SBFluidSwitcherSheetMetricsView initWithFrame:](v21, "initWithFrame:");
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __149__SBFluidSwitcherSheetMetricsCache_pageSheetMetricsForBoundsSize_interfaceOrientation_configuration_userInterfaceIdiom_displayScale_displayEdgeInfo___block_invoke;
    v44[3] = &__block_descriptor_64_e27_v16__0___UIMutableTraits__8l;
    v44[4] = a6;
    *(double *)&v44[5] = a7;
    *(double *)&v44[6] = width;
    *(double *)&v44[7] = height;
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithTraits:", v44);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", a4, v23);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[_SBFluidSwitcherSheetMetricsView _setLocalOverrideTraitCollection:](v22, "_setLocalOverrideTraitCollection:", v23);
    -[_SBFluidSwitcherSheetMetricsView setOverrideSafeAreaInsets:](v22, "setOverrideSafeAreaInsets:", v25, v27, v29, v31);
    -[_SBFluidSwitcherSheetMetricsView _setSafeAreaInsetsFrozen:](v22, "_setSafeAreaInsetsFrozen:", 1);
    -[_SBFluidSwitcherSheetMetricsView _setSafeAreaInsetsFrozen:](v22, "_setSafeAreaInsetsFrozen:", 0);
    -[_SBFluidSwitcherSheetMetricsView _setSafeAreaInsetsFrozen:](v22, "_setSafeAreaInsetsFrozen:", 1);
    if (a5 == 1)
    {
      +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "centerWindowSizingSettings");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v35, "useCustomSizingForNewWindows"))
      {
        objc_msgSend(v35, "fullWidthScaleFactor");
        v37 = v36;
        objc_msgSend(v35, "fullHeightScaleFactor");
        width = width * v37;
        height = height * v38;
      }

    }
    else
    {
      if (a5)
        _UISheetFormSize();
      else
        _UISheetPageSize();
      width = v32;
      height = v33;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    cacheKeyToSizeValueMap = self->_cacheKeyToSizeValueMap;
    if (!cacheKeyToSizeValueMap)
    {
      v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v41 = self->_cacheKeyToSizeValueMap;
      self->_cacheKeyToSizeValueMap = v40;

      cacheKeyToSizeValueMap = self->_cacheKeyToSizeValueMap;
    }
    -[NSMutableDictionary setObject:forKey:](cacheKeyToSizeValueMap, "setObject:forKey:", v18, v16);

  }
  v42 = width;
  v43 = height;
  result.height = v43;
  result.width = v42;
  return result;
}

void __149__SBFluidSwitcherSheetMetricsCache_pageSheetMetricsForBoundsSize_interfaceOrientation_configuration_userInterfaceIdiom_displayScale_displayEdgeInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setUserInterfaceIdiom:", v3);
  objc_msgSend(v4, "setDisplayScale:", *(double *)(a1 + 40));
  objc_msgSend(v4, "setHorizontalSizeClass:", _UIUserInterfaceSizeClassForWidth());
  objc_msgSend(v4, "setVerticalSizeClass:", _UIUserInterfaceSizeClassForHeight());

}

- (CGRect)pageSheetFrameForBounds:(CGRect)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  double v14;
  double v15;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBFluidSwitcherSheetMetricsCache _displayEdgeInfo](self, "_displayEdgeInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherSheetMetricsCache pageSheetFrameForBounds:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:](self, "pageSheetFrameForBounds:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, a5, objc_msgSend(v13, "userInterfaceIdiom"), v12, x, y, width, height, SBScreenScale());
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)pageSheetFrameForBounds:(CGRect)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
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
  CGRect result;

  if (a5 == 1)
  {
    -[SBFluidSwitcherSheetMetricsCache pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:](self, "pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, 1, a6, a8, a3.size.width, a3.size.height, a7);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerWindowSizingSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "useCustomSizingForNewWindows"))
    {
      objc_msgSend(v17, "topInset");
      UIRectInsetEdges();
      objc_msgSend(v17, "bottomInset");
      UIRectInsetEdges();
      objc_msgSend(v17, "leftInset");
      UIRectInsetEdges();
      objc_msgSend(v17, "rightInset");
      UIRectInsetEdges();
      v9 = v18;
      v11 = v19;
      v13 = v20;
      v15 = v21;
    }

  }
  else
  {
    -[SBFluidSwitcherSheetMetricsCache pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:](self, "pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, a5, a6, a8, a3.size.width, a3.size.height, a7);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    v9 = v22;
    v11 = v23;
    v13 = v24;
    v15 = v25;
  }
  v26 = v9;
  v27 = v11;
  v28 = v13;
  v29 = v15;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundsToTransformMap, 0);
  objc_storeStrong((id *)&self->_cacheKeyToSizeValueMap, 0);
}

@end
