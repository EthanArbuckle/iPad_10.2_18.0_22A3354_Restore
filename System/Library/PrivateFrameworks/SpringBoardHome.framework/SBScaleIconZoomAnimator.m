@implementation SBScaleIconZoomAnimator

+ (BOOL)validateAnimationContainer:(id)a3 targetIcon:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "currentIconListView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedIconViewForIcon:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v8 = 1;
    }
    else
    {
      objc_msgSend(v5, "dockIconListView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayedIconViewForIcon:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12 != 0;

    }
  }

  return v8;
}

- (SBScaleIconZoomAnimator)initWithAnimationContainer:(id)a3 targetIcon:(id)a4
{
  id v7;
  SBScaleIconZoomAnimator *v8;
  SBScaleIconZoomAnimator *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *animationCompletions;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBScaleIconZoomAnimator;
  v8 = -[SBIconZoomAnimator initWithAnimationContainer:](&v15, sel_initWithAnimationContainer_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_targetIcon, a4);
    -[SBIcon nodeIdentifier](v9->_targetIcon, "nodeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconZoomAnimator setCriticalIconNodeIdentifiers:](v9, "setCriticalIconNodeIdentifiers:", v11);

    }
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    animationCompletions = v9->_animationCompletions;
    v9->_animationCompletions = v12;

  }
  return v9;
}

- (double)zoomScale
{
  double result;

  result = self->_zoomScaleDimension.x;
  if (result >= self->_zoomScaleDimension.y)
    return self->_zoomScaleDimension.y;
  return result;
}

- (double)maxHomeScreenZoomScale
{
  return 1.0;
}

- (UIView)targetIconContainerView
{
  void *v3;
  void *v4;

  -[SBIconAnimator animationContainer](self, "animationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "targetIconContainerView"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SBScaleIconZoomAnimator defaultTargetIconContainerView](self, "defaultTargetIconContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIView *)v4;
}

- (BOOL)fadesHomeScreen
{
  return 0;
}

- (BOOL)_forceSquareZoomDimension
{
  return 1;
}

- (void)_setZoomScale:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  double v7;
  double v8;

  y = a3.y;
  x = a3.x;
  v6 = -[SBScaleIconZoomAnimator _forceSquareZoomDimension](self, "_forceSquareZoomDimension");
  if (x >= y)
    v7 = y;
  else
    v7 = x;
  if (v6)
    v8 = v7;
  else
    v8 = x;
  if (!v6)
    v7 = y;
  self->_zoomScaleDimension.x = v8;
  self->_zoomScaleDimension.y = v7;
}

- (SBIconView)targetIconView
{
  SBIconView *targetIconView;
  void *v4;
  SBIconView *v5;
  SBIconView *v6;

  targetIconView = self->_targetIconView;
  if (!targetIconView)
  {
    -[SBScaleIconZoomAnimator referenceIconView](self, "referenceIconView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchingIconViewByAddingConfigurationOptions:removingConfigurationOptions:", 12, 0);
    v5 = (SBIconView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_targetIconView;
    self->_targetIconView = v5;

    targetIconView = self->_targetIconView;
  }
  return targetIconView;
}

- (SBIconView)referenceIconView
{
  return (SBIconView *)-[SBIconZoomAnimator iconViewForIcon:](self, "iconViewForIcon:", self->_targetIcon);
}

- (BOOL)shouldMatchMoveWithDock
{
  return 0;
}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UIView *v17;
  UIView *scalingView;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  int v29;
  _BOOL4 v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
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
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
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
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  SBHTouchPassThroughView *v77;
  UIView *v78;
  UIView *targetIconPositioningView;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  UIView *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  CGFloat v95;
  CGFloat v96;
  void *v97;
  CGFloat v98;
  CGFloat v99;
  double y;
  double x;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double width;
  double height;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  uint64_t v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  id v129;
  CATransform3D v130;
  objc_super v131;
  CGRect v132;
  CGRect v133;

  -[SBIconAnimator animationContainer](self, "animationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBScaleIconZoomAnimator targetIcon](self, "targetIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "prepareForAnimation:withTargetIcon:", self, v4);

  }
  v131.receiver = self;
  v131.super_class = (Class)SBScaleIconZoomAnimator;
  -[SBIconZoomAnimator _prepareAnimation](&v131, sel__prepareAnimation);
  -[SBScaleIconZoomAnimator targetIconView](self, "targetIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScaleIconZoomAnimator referenceIconView](self, "referenceIconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(v5, "setLabelAccessoryHidden:", 1);
  -[SBScaleIconZoomAnimator _zoomedFrame](self, "_zoomedFrame");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v5, "iconImageVisibleSize");
  if (v12 <= 0.0)
    v14 = 1.0;
  else
    v14 = v9 / v12;
  if (v13 <= 0.0)
    v15 = 1.0;
  else
    v15 = v11 / v13;
  -[SBScaleIconZoomAnimator _setZoomScale:](self, "_setZoomScale:", v14, v15);
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "borrowScalingView");
  v17 = (UIView *)objc_claimAutoreleasedReturnValue();
  scalingView = self->_scalingView;
  self->_scalingView = v17;

  v19 = -[SBScaleIconZoomAnimator shouldMatchMoveWithDock](self, "shouldMatchMoveWithDock");
  objc_msgSend(v6, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentationLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentationLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && v19)
  {
    v25 = v21;
  }
  else
  {
    objc_msgSend(v6, "layer");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;
  if (v24)
    v27 = v19;
  else
    v27 = 0;
  v128 = v6;
  if (v27)
  {
    v129 = v24;
  }
  else
  {
    objc_msgSend(v6, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v129 = (id)objc_claimAutoreleasedReturnValue();

  }
  v29 = 0;
  if (v24)
    v30 = v19;
  else
    v30 = 0;
  v31 = v26;
  if (v21)
  {
    if (v30)
    {
      objc_msgSend(v21, "transform");
      v32 = CATransform3DIsIdentity(&v130);
      v29 = !v32;
      v31 = v129;
      if (v32)
        v31 = v26;
    }
  }
  v33 = v31;
  objc_msgSend(v26, "bounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  objc_msgSend(v26, "position");
  v43 = v42;
  v45 = v44;
  -[SBScaleIconZoomAnimator _referenceIconImageCenter](self, "_referenceIconImageCenter");
  v48 = v46;
  v49 = v47;
  v126 = v41;
  v120 = v35;
  v121 = v39;
  v118 = v37;
  if (v39 <= 0.0 || v41 <= 0.0)
  {
    v51 = *MEMORY[0x1E0C9D538];
    v53 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v50 = v39 * 0.5;
    v52 = v41 * 0.5;
  }
  else
  {
    v50 = v39 * 0.5;
    v51 = v43 + v46 - v50;
    v52 = v41 * 0.5;
    v53 = v45 + v47 - v52;
  }
  -[UIView layer](self->_scalingView, "layer", v118);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    v55 = v51;
  else
    v55 = v48;
  if (v29)
    v56 = v53;
  else
    v56 = v49;
  v122 = v56;
  v124 = v55;
  if (v29)
    v57 = v45 - v52;
  else
    v57 = v119;
  if (v29)
    v58 = v43 - v50;
  else
    v58 = v120;
  objc_msgSend(v33, "convertPoint:toLayer:", v54);
  v60 = v59;
  v62 = v61;

  -[UIView frame](self->_scalingView, "frame");
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;
  -[UIView bounds](self->_scalingView, "bounds");
  if (v71 <= 0.0)
    v73 = 0.0;
  else
    v73 = v60 / v71;
  if (v72 <= 0.0)
    v74 = 0.0;
  else
    v74 = v62 / v72;
  -[UIView layer](self->_scalingView, "layer");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setAnchorPoint:", v73, v74);

  -[UIView setFrame:](self->_scalingView, "setFrame:", v64, v66, v68, v70);
  objc_msgSend(v5, "_visualAltitude");
  self->_naturalVisualAltitude = v76;
  v77 = [SBHTouchPassThroughView alloc];
  v78 = -[SBHTouchPassThroughView initWithFrame:](v77, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  targetIconPositioningView = self->_targetIconPositioningView;
  self->_targetIconPositioningView = v78;

  -[SBScaleIconZoomAnimator _configureTargetIconPositioningView:](self, "_configureTargetIconPositioningView:", self->_targetIconPositioningView);
  -[UIView addSubview:](self->_targetIconPositioningView, "addSubview:", v5);
  -[UIView layer](self->_targetIconPositioningView, "layer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "convertRect:toLayer:", v80, v58, v57, v121, v126);
  v82 = v81;
  v84 = v83;
  v86 = v85;
  v88 = v87;

  objc_msgSend(v5, "setFrame:", v82, v84, v86, v88);
  v89 = self->_targetIconPositioningView;
  -[SBScaleIconZoomAnimator _zoomedIconCenter](self, "_zoomedIconCenter");
  v91 = v90;
  v93 = v92;
  -[SBIconAnimator referenceView](self, "referenceView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](v89, "convertPoint:fromView:", v94, v91, v93);
  self->_zoomedTargetIconCenter.x = v95;
  self->_zoomedTargetIconCenter.y = v96;

  -[UIView layer](self->_targetIconPositioningView, "layer");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "convertPoint:toLayer:", v97, v124, v122);
  self->_targetIconCenter.x = v98;
  self->_targetIconCenter.y = v99;

  x = self->_zoomScaleDimension.x;
  y = self->_zoomScaleDimension.y;
  v102 = 1.0;
  v103 = 1.0;
  if (x > 1.0)
    v103 = -(self->_zoomedTargetIconCenter.x - x * self->_targetIconCenter.x) / (x + -1.0);
  if (y > 1.0)
    v102 = -(self->_zoomedTargetIconCenter.y - y * self->_targetIconCenter.y) / (y + -1.0);
  -[UIView frame](self->_targetIconPositioningView, "frame");
  v125 = v105;
  v127 = v104;
  v123 = v106;
  v108 = v107;
  -[UIView bounds](self->_targetIconPositioningView, "bounds");
  v109 = v132.origin.x;
  v110 = v132.origin.y;
  width = v132.size.width;
  height = v132.size.height;
  v113 = CGRectGetWidth(v132);
  v133.origin.x = v109;
  v133.origin.y = v110;
  v133.size.width = width;
  v133.size.height = height;
  v114 = CGRectGetHeight(v133);
  if (v113 <= 0.0)
    v115 = 0.0;
  else
    v115 = v103 / v113;
  if (v114 <= 0.0)
    v116 = 0.0;
  else
    v116 = v102 / v114;
  -[UIView layer](self->_targetIconPositioningView, "layer");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setAnchorPoint:", v115, v116);

  -[UIView setCenter:](self->_targetIconPositioningView, "setCenter:", v127 + v123 * v115, v125 + v108 * v116);
  -[UIView setBounds:](self->_targetIconPositioningView, "setBounds:", v109, v110, width, height);

}

- (void)_configureTargetIconPositioningView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBScaleIconZoomAnimator targetIconContainerView](self, "targetIconContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(v5, "addSubview:", self->_targetIconPositioningView);
}

- (void)_setAnimationFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBScaleIconZoomAnimator;
  -[SBIconZoomAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  -[SBScaleIconZoomAnimator _applyZoomFraction:](self, "_applyZoomFraction:", a3);
  -[SBScaleIconZoomAnimator _applyVisualAltitudeFraction:](self, "_applyVisualAltitudeFraction:", a3);
  -[SBScaleIconZoomAnimator _applyIconGridFadeFraction:](self, "_applyIconGridFadeFraction:", a3);
}

- (void)_cleanupAnimation
{
  void *v3;
  void *v4;
  UIView *scalingView;
  UIView *targetIconPositioningView;
  SBIconView *targetIconView;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[UIView layer](self->_scalingView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.5);

  -[SBIconAnimator animationContainer](self, "animationContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnScalingView");

  scalingView = self->_scalingView;
  self->_scalingView = 0;

  -[UIView removeFromSuperview](self->_targetIconPositioningView, "removeFromSuperview");
  targetIconPositioningView = self->_targetIconPositioningView;
  self->_targetIconPositioningView = 0;

  targetIconView = self->_targetIconView;
  self->_targetIconView = 0;

  -[SBScaleIconZoomAnimator animationCompletions](self, "animationCompletions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (objc_msgSend(v9, "count"))
  {
    -[SBScaleIconZoomAnimator animationCompletions](self, "animationCompletions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++) + 16))();
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
  -[SBReversibleLayerPropertyAnimator invalidate](self->_homeScreenScaleAnimator, "invalidate");
  -[SBScaleIconZoomAnimator setHomeScreenScaleAnimator:](self, "setHomeScreenScaleAnimator:", 0);
  -[SBReversibleLayerPropertyAnimator invalidate](self->_targetIconScaleXAnimator, "invalidate");
  -[SBScaleIconZoomAnimator setTargetIconScaleXAnimator:](self, "setTargetIconScaleXAnimator:", 0);
  -[SBReversibleLayerPropertyAnimator invalidate](self->_targetIconScaleYAnimator, "invalidate");
  -[SBScaleIconZoomAnimator setTargetIconScaleYAnimator:](self, "setTargetIconScaleYAnimator:", 0);
  if (-[SBScaleIconZoomAnimator fadesHomeScreen](self, "fadesHomeScreen"))
    -[SBScaleIconZoomAnimator _setIconAlpha:](self, "_setIconAlpha:", 1.0);
  v16.receiver = self;
  v16.super_class = (Class)SBScaleIconZoomAnimator;
  -[SBIconZoomAnimator _cleanupAnimation](&v16, sel__cleanupAnimation);

}

- (unint64_t)_numberOfSignificantAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBScaleIconZoomAnimator;
  return -[SBIconZoomAnimator _numberOfSignificantAnimations](&v3, sel__numberOfSignificantAnimations) + 3;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t (*__ptr32 *v23)();
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  SBReversibleLayerPropertyAnimator *v29;
  void *v30;
  SBReversibleLayerPropertyAnimator *v31;
  void *v32;
  SBReversibleLayerPropertyAnimator *v33;
  void *v34;
  SBReversibleLayerPropertyAnimator *v35;
  SBReversibleLayerPropertyAnimator *v36;
  void *v37;
  SBReversibleLayerPropertyAnimator *v38;
  uint64_t v39;
  SBReversibleLayerPropertyAnimator *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[6];
  _QWORD v59[6];
  _QWORD v60[4];
  NSObject *v61;
  _QWORD aBlock[4];
  SBReversibleLayerPropertyAnimator *v63;
  id v64;
  id location;
  objc_super v66;

  v8 = a6;
  v12 = a4;
  v13 = a7;
  v66.receiver = self;
  v66.super_class = (Class)SBScaleIconZoomAnimator;
  -[SBIconZoomAnimator _performAnimationToFraction:withCentralAnimationSettings:delay:alreadyAnimating:sharedCompletion:](&v66, sel__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion_, v12, v8, v13, a3, a5);
  v54 = v8;
  if (v8)
    v14 = 6;
  else
    v14 = 2;
  if (v8)
    a5 = 0.0;
  objc_msgSend(v12, "BSAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v16, "delay");
  objc_msgSend(v16, "setDelay:", a5 + v17);
  if (v13)
  {
    -[SBScaleIconZoomAnimator animationCompletions](self, "animationCompletions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v13, "copy");
    v20 = _Block_copy(v19);
    objc_msgSend(v18, "addObject:", v20);

  }
  v57 = v13;
  -[SBScaleIconZoomAnimator homeScreenScaleAnimator](self, "homeScreenScaleAnimator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x1E0C809B0];
  v23 = &off_1D0190000;
  v56 = v15;
  v55 = v16;
  if (v21)
  {
    -[SBScaleIconZoomAnimator homeScreenScaleAnimator](self, "homeScreenScaleAnimator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reverse");

    -[SBScaleIconZoomAnimator targetIconScaleXAnimator](self, "targetIconScaleXAnimator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "reverse");

    -[SBScaleIconZoomAnimator targetIconScaleYAnimator](self, "targetIconScaleYAnimator");
    v26 = objc_claimAutoreleasedReturnValue();
    -[NSObject reverse](v26, "reverse");
  }
  else
  {
    v53 = v14;
    v27 = dispatch_group_create();
    dispatch_group_enter(v27);
    -[SBScaleIconZoomAnimator _homeScreenScaleForZoomFraction:](self, "_homeScreenScaleForZoomFraction:", a3);
    -[UIView layer](self->_scalingView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = [SBReversibleLayerPropertyAnimator alloc];
    objc_msgSend(v28, "valueForKeyPath:", CFSTR("transform.scale.xy"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v52 = v28;
    v31 = -[SBReversibleLayerPropertyAnimator initWithLayer:keyPath:initialValue:targetValue:](v29, "initWithLayer:keyPath:initialValue:targetValue:", v28, CFSTR("transform.scale.xy"));

    -[SBScaleIconZoomAnimator setHomeScreenScaleAnimator:](self, "setHomeScreenScaleAnimator:", v31);
    dispatch_group_enter(v27);
    -[SBScaleIconZoomAnimator _targetIconScaleForZoomFraction:](self, "_targetIconScaleForZoomFraction:", a3);
    -[UIView layer](self->_targetIconPositioningView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = [SBReversibleLayerPropertyAnimator alloc];
    objc_msgSend(v32, "valueForKeyPath:", CFSTR("transform.scale.x"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v35 = -[SBReversibleLayerPropertyAnimator initWithLayer:keyPath:initialValue:targetValue:](v33, "initWithLayer:keyPath:initialValue:targetValue:", v32, CFSTR("transform.scale.x"));

    -[SBScaleIconZoomAnimator setTargetIconScaleXAnimator:](self, "setTargetIconScaleXAnimator:", v35);
    dispatch_group_enter(v27);
    v36 = [SBReversibleLayerPropertyAnimator alloc];
    objc_msgSend(v32, "valueForKeyPath:", CFSTR("transform.scale.y"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v38 = -[SBReversibleLayerPropertyAnimator initWithLayer:keyPath:initialValue:targetValue:](v36, "initWithLayer:keyPath:initialValue:targetValue:", v32, CFSTR("transform.scale.y"));

    -[SBScaleIconZoomAnimator setTargetIconScaleYAnimator:](self, "setTargetIconScaleYAnimator:", v38);
    objc_initWeak(&location, self);
    v39 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
    aBlock[3] = &unk_1E8D88E90;
    objc_copyWeak(&v64, &location);
    v40 = v31;
    v63 = v40;
    v41 = _Block_copy(aBlock);
    dispatch_group_notify(v27, MEMORY[0x1E0C80D38], v41);
    v60[0] = v39;
    v60[1] = 3221225472;
    v60[2] = __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
    v60[3] = &unk_1E8D84F68;
    v26 = v27;
    v61 = v26;
    v42 = _Block_copy(v60);
    -[SBReversibleLayerPropertyAnimator animateWithSettings:completion:](v40, "animateWithSettings:completion:", v16, v42);
    -[SBReversibleLayerPropertyAnimator animateWithSettings:completion:](v35, "animateWithSettings:completion:", v16, v42);
    -[SBReversibleLayerPropertyAnimator animateWithSettings:completion:](v38, "animateWithSettings:completion:", v16, v42);

    objc_destroyWeak(&v64);
    objc_destroyWeak(&location);

    v15 = v56;
    v14 = v53;
    v22 = MEMORY[0x1E0C809B0];
    v23 = &off_1D0190000;
  }

  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v15);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAllowsAdditiveAnimations:", 1);
  v44 = v22;
  v59[0] = v22;
  v45 = *((_QWORD *)v23 + 254);
  v59[1] = v45;
  v59[2] = __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
  v59[3] = &unk_1E8D84C78;
  v59[4] = self;
  *(double *)&v59[5] = a3;
  v46 = v14;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:completion:", v43, v14, v59, v57, a5);
  -[SBIconAnimator settings](self, "settings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "iconGridFadeSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "BSAnimationSettings");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "mutableCopy");

  if (v54)
    objc_msgSend(v50, "setDelay:", 0.0);
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v54 || BSFloatIsZero())
    objc_msgSend(v51, "setAllowsAdditiveAnimations:", 1);
  v58[0] = v44;
  v58[1] = v45;
  v58[2] = __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4;
  v58[3] = &unk_1E8D84C78;
  v58[4] = self;
  *(double *)&v58[5] = a3;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:completion:", v51, v46, v58, v57, a5);

}

void __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "homeScreenScaleAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = objc_msgSend(v3, "isEqual:", *(_QWORD *)(v1 + 32));

  if ((_DWORD)v1)
  {
    objc_msgSend(WeakRetained, "setHomeScreenScaleAnimator:", 0);
    objc_msgSend(WeakRetained, "setTargetIconScaleXAnimator:", 0);
    objc_msgSend(WeakRetained, "setTargetIconScaleYAnimator:", 0);
    objc_msgSend(WeakRetained, "animationCompletions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(WeakRetained, "animationCompletions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAllObjects");

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
  }

}

void __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyVisualAltitudeFraction:", *(double *)(a1 + 40));
}

uint64_t __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyIconGridFadeFraction:", *(double *)(a1 + 40));
}

- (CGRect)_zoomedFrame
{
  void *v2;
  double v3;
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
  CGRect result;

  -[SBIconAnimator referenceView](self, "referenceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)_zoomedIconCenter
{
  double v2;
  double v3;
  CGPoint result;

  -[SBScaleIconZoomAnimator _zoomedFrame](self, "_zoomedFrame");
  UIRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)_zoomedVisualAltitude
{
  return 0.0;
}

- (CGPoint)_referenceIconImageCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SBScaleIconZoomAnimator referenceIconView](self, "referenceIconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageCenter");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)_setIconAlpha:(double)a3
{
  id v4;

  -[SBIconAnimator animationContainer](self, "animationContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setContentAlpha:", a3);

}

- (void)_applyZoomFraction:(double)a3
{
  double v5;
  CGFloat v6;
  UIView *scalingView;
  UIView *targetIconPositioningView;
  CGFloat v9;
  CGFloat v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  -[SBScaleIconZoomAnimator _homeScreenScaleForZoomFraction:](self, "_homeScreenScaleForZoomFraction:");
  v6 = v5;
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    scalingView = self->_scalingView;
    CGAffineTransformMakeScale(&v12, v6, v6);
    -[UIView setTransform:](scalingView, "setTransform:", &v12);
  }
  -[SBScaleIconZoomAnimator _targetIconScaleForZoomFraction:](self, "_targetIconScaleForZoomFraction:", a3);
  targetIconPositioningView = self->_targetIconPositioningView;
  CGAffineTransformMakeScale(&v11, v9, v10);
  -[UIView setTransform:](targetIconPositioningView, "setTransform:", &v11);
}

- (double)_homeScreenScaleForZoomFraction:(double)a3
{
  double v4;
  double v5;
  int v6;
  double result;

  -[SBScaleIconZoomAnimator maxHomeScreenZoomScale](self, "maxHomeScreenZoomScale");
  v5 = v4;
  v6 = BSFloatGreaterThanFloat();
  result = 1.0 - (1.0 - v5) * a3;
  if (!v6)
    return 1.0;
  return result;
}

- (CGPoint)_targetIconScaleForZoomFraction:(double)a3
{
  float64x2_t v8;
  double v9;
  CGPoint result;

  __asm { FMOV            V2.2D, #1.0 }
  v8 = vsubq_f64(_Q2, vmulq_n_f64(vsubq_f64(_Q2, (float64x2_t)self->_zoomScaleDimension), a3));
  v9 = v8.f64[1];
  result.x = v8.f64[0];
  result.y = v9;
  return result;
}

- (void)_applyVisualAltitudeFraction:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  _OWORD v13[3];
  CGAffineTransform v14;

  -[SBScaleIconZoomAnimator targetIconView](self, "targetIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScaleIconZoomAnimator _zoomedVisualAltitude](self, "_zoomedVisualAltitude");
  v8 = v7;
  objc_msgSend(v5, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_convertVisualAltitude:fromView:", v9, v8);
  v11 = v10;

  objc_msgSend(v5, "_setVisualAltitude:", self->_naturalVisualAltitude + (v11 - self->_naturalVisualAltitude) * a3);
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&v14, 0, sizeof(v14));
  if (!CGAffineTransformIsIdentity(&v14))
  {
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13[0] = *MEMORY[0x1E0C9BAA8];
    v13[1] = v12;
    v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v5, "setTransform:", v13);
  }

}

- (void)_applyIconGridFadeFraction:(double)a3
{
  void *v5;
  int v6;

  if ((BSFloatIsOne() & 1) != 0 || BSFloatIsZero())
  {
    -[SBIconAnimator settings](self, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fadesIconGrid");

    if (v6)
      -[SBScaleIconZoomAnimator _setIconAlpha:](self, "_setIconAlpha:", 1.0 - a3);
  }
}

- (SBReversibleLayerPropertyAnimator)homeScreenScaleAnimator
{
  return self->_homeScreenScaleAnimator;
}

- (void)setHomeScreenScaleAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenScaleAnimator, a3);
}

- (SBReversibleLayerPropertyAnimator)targetIconScaleXAnimator
{
  return self->_targetIconScaleXAnimator;
}

- (void)setTargetIconScaleXAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_targetIconScaleXAnimator, a3);
}

- (SBReversibleLayerPropertyAnimator)targetIconScaleYAnimator
{
  return self->_targetIconScaleYAnimator;
}

- (void)setTargetIconScaleYAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_targetIconScaleYAnimator, a3);
}

- (NSMutableArray)animationCompletions
{
  return self->_animationCompletions;
}

- (void)setAnimationCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_animationCompletions, a3);
}

- (SBIcon)targetIcon
{
  return self->_targetIcon;
}

- (UIView)targetIconPositioningView
{
  return self->_targetIconPositioningView;
}

- (CGPoint)zoomScaleDimension
{
  double x;
  double y;
  CGPoint result;

  x = self->_zoomScaleDimension.x;
  y = self->_zoomScaleDimension.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)zoomedTargetIconCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_zoomedTargetIconCenter.x;
  y = self->_zoomedTargetIconCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)targetIconCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetIconCenter.x;
  y = self->_targetIconCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIconPositioningView, 0);
  objc_storeStrong((id *)&self->_targetIcon, 0);
  objc_storeStrong((id *)&self->_animationCompletions, 0);
  objc_storeStrong((id *)&self->_targetIconScaleYAnimator, 0);
  objc_storeStrong((id *)&self->_targetIconScaleXAnimator, 0);
  objc_storeStrong((id *)&self->_homeScreenScaleAnimator, 0);
  objc_storeStrong((id *)&self->_targetIconView, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
}

@end
