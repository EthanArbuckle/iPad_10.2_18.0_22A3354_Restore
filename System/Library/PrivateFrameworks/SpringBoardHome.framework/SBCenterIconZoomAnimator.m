@implementation SBCenterIconZoomAnimator

- (SBCenterIconZoomAnimator)initWithFolderController:(id)a3
{
  SBCenterIconZoomAnimator *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCenterIconZoomAnimator;
  result = -[SBIconZoomAnimator initWithAnimationContainer:](&v4, sel_initWithAnimationContainer_, a3);
  if (result)
    result->_iconZoomedZ = 0.0;
  return result;
}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *folderView;
  void *v7;
  void *v8;
  void *v9;
  SBHTouchPassThroughView *v10;
  UIView *v11;
  UIView *zoomView;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
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
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _OWORD v34[5];
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)SBCenterIconZoomAnimator;
  -[SBIconZoomAnimator _prepareAnimation](&v39, sel__prepareAnimation);
  self->_iconZoomedZ = SBHZPositionForScale(80.0, -0.00333333333);
  -[SBCenterIconZoomAnimator folderController](self, "folderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "innerFolderController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "view");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    folderView = self->_folderView;
    self->_folderView = v5;

  }
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOverridingLayoutDelegate:reason:", self, CFSTR("CenterIconZoom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCenterIconZoomAnimator setIconListViewOverridingLayoutDelegateAssertion:](self, "setIconListViewOverridingLayoutDelegateAssertion:", v8);

  objc_msgSend(v7, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addListObserver:", self);

  v10 = [SBHTouchPassThroughView alloc];
  objc_msgSend(v7, "bounds");
  v11 = -[SBHTouchPassThroughView initWithFrame:](v10, "initWithFrame:");
  zoomView = self->_zoomView;
  self->_zoomView = v11;

  objc_msgSend(v7, "addSubview:", self->_zoomView);
  -[UIView layer](self->_zoomView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v34[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v34[3] = v14;
  v34[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v15 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
  v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v34[0] = *MEMORY[0x1E0CD2610];
  v34[1] = v16;
  v35 = v15;
  v36 = 0xBF6B4E81B4E81B4FLL;
  v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v37 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v38 = v17;
  objc_msgSend(v13, "setSublayerTransform:", v34);

  -[SBCenterIconZoomAnimator _calculateCentersAndCameraPosition](self, "_calculateCentersAndCameraPosition");
  -[UIView frame](self->_zoomView, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[UIView bounds](self->_zoomView, "bounds");
  v28 = 0.5;
  v29 = 0.5;
  if (v26 != 0.0)
    v29 = self->_cameraPosition.x / v26;
  if (v27 != 0.0)
    v28 = self->_cameraPosition.y / v27;
  -[UIView layer](self->_zoomView, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAnchorPoint:", v29, v28);

  -[UIView setFrame:](self->_zoomView, "setFrame:", v19, v21, v23, v25);
  -[SBCenterIconZoomAnimator folderController](self, "folderController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "beginModifyingDockOffscreenFractionForReason:", CFSTR("SBCenterIconZoomDockFractionAnimatorReason"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBCenterIconZoomAnimator setDockOffscreenFractionModifier:](self, "setDockOffscreenFractionModifier:", v32);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __45__SBCenterIconZoomAnimator__prepareAnimation__block_invoke;
  v33[3] = &unk_1E8D869C8;
  v33[4] = self;
  -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v33);
  self->_animatingIcons = 1;

}

void __45__SBCenterIconZoomAnimator__prepareAnimation__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  void *v6;
  id v7;
  id v8;

  if ((a4 & 1) == 0)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v7 = a3;
    v8 = a2;
    objc_msgSend(v6, "addSubview:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_positionView:forIcon:", v7, v8);

  }
}

- (void)_setAnimationFraction:(double)a3
{
  -[SBCenterIconZoomAnimator _setAnimationFraction:withCenter:](self, "_setAnimationFraction:withCenter:", a3, self->_centerCol, self->_centerRow);
}

- (void)_setAnimationFraction:(double)a3 withCenter:(CGPoint)a4
{
  _QWORD v6[5];
  CGPoint v7;
  double v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBCenterIconZoomAnimator__setAnimationFraction_withCenter___block_invoke;
  v6[3] = &unk_1E8D869F0;
  v6[4] = self;
  v7 = a4;
  v8 = a3;
  -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v6);
  -[UIView setAlpha:](self->_folderView, "setAlpha:", 1.0 - a3);
  -[SBCenterIconZoomAnimator _updateDockForFraction:](self, "_updateDockForFraction:", a3);
}

void __61__SBCenterIconZoomAnimator__setAnimationFraction_withCenter___block_invoke(double *a1, uint64_t a2, void *a3, char a4)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  id v12;

  if ((a4 & 1) == 0)
  {
    v5 = (void *)*((_QWORD *)a1 + 4);
    v7 = a1[6];
    v6 = a1[7];
    v8 = a1[5];
    v9 = a3;
    objc_msgSend(v5, "_zPositionForView:center:andFraction:", v9, v8, v7, v6);
    v11 = v10;
    objc_msgSend(v9, "layer");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setZPosition:", v11 * *(double *)(*((_QWORD *)a1 + 4) + 168));
  }
}

- (void)_updateDockForFraction:(double)a3
{
  id v4;

  -[SBCenterIconZoomAnimator dockOffscreenFractionModifier](self, "dockOffscreenFractionModifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDockOffscreenFraction:", a3);

}

- (double)_zPositionForView:(id)a3 center:(CGPoint)a4 andFraction:(double)a5
{
  return a5;
}

- (void)_cleanupAnimation
{
  objc_super v3;

  -[SBCenterIconZoomAnimator _cleanupAnimationIncludingDock:](self, "_cleanupAnimationIncludingDock:", 1);
  v3.receiver = self;
  v3.super_class = (Class)SBCenterIconZoomAnimator;
  -[SBIconZoomAnimator _cleanupAnimation](&v3, sel__cleanupAnimation);
}

- (void)_cleanupAnimationIncludingDock:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  UIView *zoomView;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__SBCenterIconZoomAnimator__cleanupAnimationIncludingDock___block_invoke;
  v10[3] = &unk_1E8D869C8;
  v9 = v5;
  v11 = v9;
  -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v10);
  -[SBCenterIconZoomAnimator iconListViewOverridingLayoutDelegateAssertion](self, "iconListViewOverridingLayoutDelegateAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SBCenterIconZoomAnimator setIconListViewOverridingLayoutDelegateAssertion:](self, "setIconListViewOverridingLayoutDelegateAssertion:", 0);
  -[UIView removeFromSuperview](self->_zoomView, "removeFromSuperview");
  zoomView = self->_zoomView;
  self->_zoomView = 0;

  if (v3)
  {
    -[SBCenterIconZoomAnimator dockOffscreenFractionModifier](self, "dockOffscreenFractionModifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[SBCenterIconZoomAnimator setDockOffscreenFractionModifier:](self, "setDockOffscreenFractionModifier:", 0);
  }
  self->_animatingIcons = 0;

}

void __59__SBCenterIconZoomAnimator__cleanupAnimationIncludingDock___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v7 = a3;
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setZPosition:", 0.0);

  if ((a4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "displayedIconViewForIcon:", v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v7)
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", v7);
  }

}

- (unint64_t)_numberOfSignificantAnimations
{
  char *v3;
  char *v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCenterIconZoomAnimator;
  v3 = -[SBIconZoomAnimator _numberOfSignificantAnimations](&v8, sel__numberOfSignificantAnimations);
  v4 = &v3[-[SBIconZoomAnimator listIconCount](self, "listIconCount")];
  -[SBCenterIconZoomAnimator folderController](self, "folderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)&v4[objc_msgSend(v5, "hasDock")];

  return v6;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  _BOOL8 v7;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[5];
  id v28;
  double v29;
  uint64_t v30;
  double v31;
  objc_super v32;

  v7 = a6;
  v12 = a7;
  v32.receiver = self;
  v32.super_class = (Class)SBCenterIconZoomAnimator;
  -[SBIconZoomAnimator _performAnimationToFraction:withCentralAnimationSettings:delay:alreadyAnimating:sharedCompletion:](&v32, sel__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion_, a4, v7, v12, a3, a5);
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    -[SBCenterIconZoomAnimator _iconZoomDelay](self, "_iconZoomDelay");
    v14 = v13 + a5;
    v15 = MEMORY[0x1E0C809B0];
    if (v7)
      v16 = 0.0;
    else
      v16 = v14;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
    v27[3] = &unk_1E8D86A18;
    v27[4] = self;
    if (v7)
      v17 = 6;
    else
      v17 = 2;
    v29 = v16;
    v30 = v17;
    v31 = a3;
    v18 = v12;
    v28 = v18;
    -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v27);
    -[SBCenterIconZoomAnimator folderController](self, "folderController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hasDock");

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0D01908];
      -[SBCenterIconZoomAnimator _animationFactoryForDock](self, "_animationFactoryForDock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v15;
      v26[1] = 3221225472;
      v26[2] = __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
      v26[3] = &unk_1E8D84C78;
      v26[4] = self;
      *(double *)&v26[5] = a3;
      objc_msgSend(v21, "animateWithFactory:additionalDelay:options:actions:completion:", v22, v17, v26, v18, v16);

    }
    if (self->_folderView)
    {
      v23 = (void *)MEMORY[0x1E0D01908];
      -[SBCenterIconZoomAnimator _animationFactoryForFolderView](self, "_animationFactoryForFolderView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v15;
      v25[1] = 3221225472;
      v25[2] = __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4;
      v25[3] = &unk_1E8D84C78;
      v25[4] = self;
      *(double *)&v25[5] = a3;
      objc_msgSend(v23, "animateWithFactory:additionalDelay:options:actions:", v24, v17, v25, v16);

    }
  }

}

void __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  if ((a4 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0D01908];
    v15 = v7;
    objc_msgSend(*(id *)(a1 + 32), "_animationFactoryForIcon:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(double *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
    v16[3] = &unk_1E8D865D8;
    v12 = v15;
    v19 = *(_QWORD *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v17 = v12;
    v18 = v14;
    objc_msgSend(v8, "animateWithFactory:additionalDelay:options:actions:completion:", v9, v11, v16, v13, v10);

    v7 = v15;
  }

}

void __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setZPosition:", *(double *)(a1 + 48) * *(double *)(*(_QWORD *)(a1 + 40) + 168));

}

void __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dockOffscreenFractionModifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDockOffscreenFraction:", *(double *)(a1 + 40));

}

uint64_t __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setAlpha:", 1.0 - *(double *)(a1 + 40));
}

- (double)_iconZoomDelay
{
  return 0.0;
}

- (CGPoint)iconListView:(id)a3 originForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedOrigin:(CGPoint)a6
{
  double y;
  double x;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v9 = a3;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[UIView convertPoint:fromView:](self->_zoomView, "convertPoint:fromView:", v9, x, y);
    x = v11;
    y = v12;
  }

  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)iconListView:(id)a3 centerForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedCenter:(CGPoint)a6
{
  double y;
  double x;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v9 = a3;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[UIView convertPoint:fromView:](self->_zoomView, "convertPoint:fromView:", v9, x, y);
    x = v11;
    y = v12;
  }

  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "model");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[SBIconZoomAnimator iconViewForIcon:](self, "iconViewForIcon:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCenterIconZoomAnimator _positionView:forIcon:](self, "_positionView:forIcon:", v9, v10);

  }
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a5;
  v7 = a3;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "model");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    -[SBIconZoomAnimator iconViewForIcon:](self, "iconViewForIcon:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCenterIconZoomAnimator _positionView:forIcon:](self, "_positionView:forIcon:", v10, v11);

  }
}

- (void)_positionView:(id)a3 forIcon:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerForIcon:", v6);
  v9 = v8;
  v11 = v10;

  -[UIView convertPoint:fromView:](self->_zoomView, "convertPoint:fromView:", v7, v9, v11);
  objc_msgSend(v12, "setCenter:");

}

- (id)_animationFactoryForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  -[SBIconAnimator settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centralAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "distanceEffect"))
  {
    -[SBIconZoomAnimator iconListView](self, "iconListView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "coordinateForIcon:", v4);
    v10 = v9;

    if (SBIconCoordinateIsNotFound(v8, v10))
      v11 = 0;
    else
      v11 = (unint64_t)(floor(vabdd_f64((double)v10, self->_centerRow))
                             + floor(vabdd_f64((double)v8, self->_centerCol)));
    objc_msgSend(v6, "mass");
    v13 = v12;
    objc_msgSend(v5, "firstHopIncrement");
    if (v11)
    {
      v15 = v14;
      if (v14 > 0.0)
      {
        v16 = 1;
        do
        {
          v13 = v13 + v15 * (double)objc_msgSend(v5, "distanceEffect");
          objc_msgSend(v5, "hopIncrementAcceleration");
          if (v16 >= v11)
            break;
          v15 = v15 + v17;
          ++v16;
        }
        while (v15 > 0.0);
      }
    }
    if (v13 < 0.1)
      v13 = 0.1;
    objc_msgSend(v6, "mass");
    if (v13 != v18)
    {
      v19 = (void *)objc_msgSend(v6, "copy");

      objc_msgSend(v19, "setMass:", v13);
      v6 = v19;
    }
  }
  v20 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v6, "BSAnimationSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "factoryWithSettings:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setAllowsAdditiveAnimations:", 1);
  return v22;
}

- (id)_animationFactoryForDock
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBIconAnimator settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dockMass");
  v5 = v4;
  objc_msgSend(v3, "mass");
  if (v6 != v5)
  {
    v7 = (void *)objc_msgSend(v3, "copy");

    objc_msgSend(v7, "setMass:", v5);
    v3 = v7;
  }
  v8 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v3, "BSAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "factoryWithSettings:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAllowsAdditiveAnimations:", 1);
  return v10;
}

- (id)_animationFactoryForFolderView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D01908];
  -[SBIconAnimator settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BSAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "factoryWithSettings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAllowsAdditiveAnimations:", 1);
  return v6;
}

- (void)_calculateCenters
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char v24;
  void *v25;
  double v26;
  _BOOL4 v27;
  void *v28;
  double centerRow;
  id v30;

  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v30, "iconColumnsForCurrentOrientation");
  v4 = objc_msgSend(v30, "iconRowsForCurrentOrientation");
  -[SBIconAnimator settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preferCenterOfIconGrid");

  if (v6)
  {
    if ((v3 & 1) != 0)
      v7 = 1.0;
    else
      v7 = 0.5;
    self->_centerCol = v7 + (double)(v3 >> 1);
    v8 = (double)(v4 >> 1);
    v9 = 176;
    v10 = v8 + 1.0;
    v11 = v8 + 0.5;
    if ((v4 & 1) != 0)
      v12 = v10;
    else
      v12 = v11;
  }
  else
  {
    objc_msgSend(v30, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "center");
    v15 = v14;
    v17 = v16;

    objc_msgSend(v30, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertPoint:fromView:", v18, v15, v17);
    v20 = v19;
    v22 = v21;

    objc_msgSend(v30, "fractionalCoordinateAtPoint:", v20, v22);
    v12 = round(v23 + v23) * 0.5;
    v24 = BSFloatEqualToFloat();
    -[SBIconAnimator settings](self, "settings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerRowCoordinate");
    if ((v24 & 1) != 0)
    {
      self->_centerRow = floor(v26) + 0.5;

      if (__sb__runningInSpringBoard())
      {
        v27 = SBFEffectiveDeviceClass() == 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v28, "userInterfaceIdiom") == 1;

      }
      if (v27)
        v12 = v12 + -0.25;
    }
    else
    {
      self->_centerRow = v26;

    }
    v9 = 184;
  }
  *(double *)((char *)&self->super.super.super.isa + v9) = v12;
  centerRow = self->_centerRow;
  if (centerRow >= (double)v4)
  {
    do
      centerRow = centerRow + -1.0;
    while (centerRow >= (double)v4);
    self->_centerRow = centerRow;
  }

}

- (void)_calculateCentersAndCameraPosition
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  id v20;

  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCenterIconZoomAnimator _calculateCenters](self, "_calculateCenters");
  v3 = vcvtmd_s64_f64(self->_centerCol);
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;
  objc_msgSend(v20, "centerForIconCoordinate:", v4, 1);
  v6 = v5;
  v7 = vcvtpd_s64_f64(self->_centerCol);
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  objc_msgSend(v20, "centerForIconCoordinate:", v8, 1);
  v10 = (v6 + v9) * 0.5;
  v11 = vcvtmd_s64_f64(self->_centerRow);
  if (v11 <= 1)
    v12 = 1;
  else
    v12 = v11;
  objc_msgSend(v20, "centerForIconCoordinate:", 1, v12);
  v14 = v13;
  v15 = vcvtpd_s64_f64(self->_centerRow);
  if (v15 <= 1)
    v16 = 1;
  else
    v16 = v15;
  objc_msgSend(v20, "centerForIconCoordinate:", 1, v16);
  objc_msgSend(v20, "convertPoint:toView:", self->_zoomView, v10, (v14 + v17) * 0.5);
  self->_cameraPosition.x = v18;
  self->_cameraPosition.y = v19;

}

- (SBDockOffscreenFractionModifying)dockOffscreenFractionModifier
{
  return self->_dockOffscreenFractionModifier;
}

- (void)setDockOffscreenFractionModifier:(id)a3
{
  objc_storeStrong((id *)&self->_dockOffscreenFractionModifier, a3);
}

- (BSInvalidatable)iconListViewOverridingLayoutDelegateAssertion
{
  return self->_iconListViewOverridingLayoutDelegateAssertion;
}

- (void)setIconListViewOverridingLayoutDelegateAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_iconListViewOverridingLayoutDelegateAssertion, a3);
}

- (UIView)zoomView
{
  return self->_zoomView;
}

- (CGPoint)cameraPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_cameraPosition.x;
  y = self->_cameraPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)centerRow
{
  return self->_centerRow;
}

- (double)centerCol
{
  return self->_centerCol;
}

- (BOOL)animatingIcons
{
  return self->_animatingIcons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconListViewOverridingLayoutDelegateAssertion, 0);
  objc_storeStrong((id *)&self->_dockOffscreenFractionModifier, 0);
  objc_storeStrong((id *)&self->_folderView, 0);
  objc_storeStrong((id *)&self->_zoomView, 0);
}

@end
