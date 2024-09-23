@implementation TUNavigationBarDefaultCompressionAnimation

- (TUNavigationBarDefaultCompressionAnimation)initWithNavigationBar:(id)a3
{
  return -[TUNavigationBarDefaultCompressionAnimation initWithNavigationBar:tabBarController:](self, "initWithNavigationBar:tabBarController:", a3, 0);
}

- (TUNavigationBarDefaultCompressionAnimation)initWithNavigationBar:(id)a3 tabBarController:(id)a4
{
  id v7;
  id v8;
  TUNavigationBarDefaultCompressionAnimation *v9;
  TUNavigationBarDefaultCompressionAnimation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUNavigationBarDefaultCompressionAnimation;
  v9 = -[TUNavigationBarDefaultCompressionAnimation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationBar, a3);
    v10->_compressTitleView = 1;
    v10->_translationOffset = -3.5;
    objc_storeStrong((id *)&v10->_tabBarController, a4);
  }

  return v10;
}

- (void)prepareForUpdates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ts_fetchCompressibleTitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUNavigationBarDefaultCompressionAnimation setCompressibleTitleView:](self, "setCompressibleTitleView:", v4);

  -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ts_barButtonViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUNavigationBarDefaultCompressionAnimation setBarButtonItemViews:](self, "setBarButtonItemViews:", v5);

}

- (void)updateWithPercentage:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  __int128 v49;
  CGAffineTransform *v50;
  __int128 v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CATransform3D v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;

  v60 = *MEMORY[0x1E0C80C00];
  -[TUNavigationBarDefaultCompressionAnimation compressibleTitleView](self, "compressibleTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ts_fetchCompressibleTitleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUNavigationBarDefaultCompressionAnimation setCompressibleTitleView:](self, "setCompressibleTitleView:", v7);

  }
  -[TUNavigationBarDefaultCompressionAnimation opacityFunction](self, "opacityFunction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "solveForTime:", a3);
  v10 = v9;

  -[TUNavigationBarDefaultCompressionAnimation scaleFunction](self, "scaleFunction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "solveForTime:", a3);
  v13 = v12;

  -[TUNavigationBarDefaultCompressionAnimation translateFunction](self, "translateFunction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "solveForTime:", a3);
  v16 = v15;

  if (-[TUNavigationBarDefaultCompressionAnimation compressTitleView](self, "compressTitleView"))
  {
    -[TUNavigationBarDefaultCompressionAnimation compressibleTitleView](self, "compressibleTitleView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentAlpha:", v10);

  }
  -[TUNavigationBarDefaultCompressionAnimation barButtonItemViews](self, "barButtonItemViews");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18
    || (v19 = (void *)v18,
        -[TUNavigationBarDefaultCompressionAnimation barButtonItemViews](self, "barButtonItemViews"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "count"),
        v20,
        v19,
        !v21))
  {
    -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ts_barButtonViews");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUNavigationBarDefaultCompressionAnimation setBarButtonItemViews:](self, "setBarButtonItemViews:", v23);

  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[TUNavigationBarDefaultCompressionAnimation barButtonItemViews](self, "barButtonItemViews");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v56 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v29, "setContentAlpha:", v10);
        objc_msgSend(v29, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        CATransform3DMakeTranslation(&v54, 0.0, v16, 0.0);
        objc_msgSend(v30, "setTransform3D:", &v54);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v26);
  }

  -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "items");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_bottomPalette");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "conformsToProtocol:", &unk_1EEFC10F8);

  v37 = 0.0;
  if (v36)
  {
    -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "items");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_bottomPalette");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "compressWithScale:opacity:", v13, v10);
    objc_msgSend(v42, "paletteHeight");
    v37 = v43;

  }
  -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (a3 <= 0.0)
  {
    v51 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v52.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v52.c = v51;
    *(_OWORD *)&v52.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v50 = &v52;
  }
  else
  {
    objc_msgSend(v44, "bounds");
    v46 = v37 + CGRectGetHeight(v61);
    -[TUNavigationBarDefaultCompressionAnimation translationOffset](self, "translationOffset");
    v48 = v46 + v47;

    -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v52.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v52.c = v49;
    *(_OWORD *)&v52.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformTranslate(&v53, &v52, 0.0, -(v48 * a3));
    v50 = &v53;
  }
  objc_msgSend(v45, "setTransform:", v50, *(_OWORD *)&v52.a, *(_OWORD *)&v52.c, *(_OWORD *)&v52.tx);

  -[TUNavigationBarDefaultCompressionAnimation animateFloatingTabBarHiddenIfNeeded:](self, "animateFloatingTabBarHiddenIfNeeded:", a3 > 0.0);
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  void *v3;
  double Height;
  CGRect v6;

  -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v6);

  return Height;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;
  double v13;
  double v14;

  v5 = a3;
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;
  objc_msgSend(v5, "contentOffset");
  v10 = v9;
  objc_msgSend(v5, "contentInset");
  if (v10 >= -v11)
  {
    objc_msgSend(v5, "contentOffset");
    v14 = v13;

    v12 = v14 < -v8 || !a4;
  }
  else
  {
    v12 = objc_msgSend(v5, "isDragging");

  }
  return v12;
}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  _BOOL4 v4;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 IsIdentity;
  void *v11;
  CGAffineTransform v12;

  v4 = a3;
  if (-[TUNavigationBarDefaultCompressionAnimation hideTitleOnTop](self, "hideTitleOnTop", a4))
  {
    v6 = !v4;
    -[TUNavigationBarDefaultCompressionAnimation setCompressTitleView:](self, "setCompressTitleView:", v6);
    if (v6)
    {
      -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "transform");
      else
        memset(&v12, 0, sizeof(v12));
      IsIdentity = CGAffineTransformIsIdentity(&v12);

      if (IsIdentity)
      {
        -[TUNavigationBarDefaultCompressionAnimation compressibleTitleView](self, "compressibleTitleView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setContentAlpha:", 1.0);

        -[TUNavigationBarDefaultCompressionAnimation animateFloatingTabBarHiddenIfNeeded:](self, "animateFloatingTabBarHiddenIfNeeded:", 0);
      }
    }
    else
    {
      -[TUNavigationBarDefaultCompressionAnimation compressibleTitleView](self, "compressibleTitleView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContentAlpha:", 0.0);

      -[TUNavigationBarDefaultCompressionAnimation animateFloatingTabBarHiddenIfNeeded:](self, "animateFloatingTabBarHiddenIfNeeded:", 1);
    }
  }
}

- (void)setHideTitleOnTop:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  void *v6;

  v3 = a3;
  v5 = -[TUNavigationBarDefaultCompressionAnimation hideTitleOnTop](self, "hideTitleOnTop");
  self->_hideTitleOnTop = v3;
  if (v3 && !v5)
  {
    -[TUNavigationBarDefaultCompressionAnimation compressibleTitleView](self, "compressibleTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentAlpha:", 0.0);

    -[TUNavigationBarDefaultCompressionAnimation animateFloatingTabBarHiddenIfNeeded:](self, "animateFloatingTabBarHiddenIfNeeded:", 1);
  }
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 1;
}

- (void)reloadWithTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ts_fetchCompressibleTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUNavigationBarDefaultCompressionAnimation setCompressibleTitleView:](self, "setCompressibleTitleView:", v5);

  -[TUNavigationBarDefaultCompressionAnimation compressibleTitleView](self, "compressibleTitleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskView:", 0);

  -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ts_barButtonViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUNavigationBarDefaultCompressionAnimation setBarButtonItemViews:](self, "setBarButtonItemViews:", v9);

  -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ts_resetButtonTransforms");

}

- (TUAnimationFloatFunction)opacityFunction
{
  TUAnimationFloatFunction *opacityFunction;
  TUAnimationFloatFunction *v4;
  void *v5;
  TUAnimationFloatFunction *v6;

  opacityFunction = self->_opacityFunction;
  if (!opacityFunction)
  {
    v4 = objc_alloc_init(TUAnimationFloatFunction);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUAnimationFloatFunction setTimingFunction:](v4, "setTimingFunction:", v5);

    -[TUAnimationFloatFunction setSpeed:](v4, "setSpeed:", 2.0);
    -[TUAnimationFloatFunction setStartValue:](v4, "setStartValue:", 1.0);
    -[TUAnimationFloatFunction setEndValue:](v4, "setEndValue:", 0.0);
    v6 = self->_opacityFunction;
    self->_opacityFunction = v4;

    opacityFunction = self->_opacityFunction;
  }
  return opacityFunction;
}

- (TUAnimationFloatFunction)scaleFunction
{
  TUAnimationFloatFunction *scaleFunction;
  TUAnimationFloatFunction *v4;
  void *v5;
  TUAnimationFloatFunction *v6;

  scaleFunction = self->_scaleFunction;
  if (!scaleFunction)
  {
    v4 = objc_alloc_init(TUAnimationFloatFunction);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUAnimationFloatFunction setTimingFunction:](v4, "setTimingFunction:", v5);

    -[TUAnimationFloatFunction setSpeed:](v4, "setSpeed:", 1.38);
    -[TUAnimationFloatFunction setStartValue:](v4, "setStartValue:", 1.0);
    -[TUAnimationFloatFunction setEndValue:](v4, "setEndValue:", 0.7);
    v6 = self->_scaleFunction;
    self->_scaleFunction = v4;

    scaleFunction = self->_scaleFunction;
  }
  return scaleFunction;
}

- (TUAnimationFloatFunction)translateFunction
{
  TUAnimationFloatFunction *translateFunction;
  TUAnimationFloatFunction *v4;
  void *v5;
  void *v6;
  TUAnimationFloatFunction *v7;
  CGRect v9;

  translateFunction = self->_translateFunction;
  if (!translateFunction)
  {
    v4 = objc_alloc_init(TUAnimationFloatFunction);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUAnimationFloatFunction setTimingFunction:](v4, "setTimingFunction:", v5);

    -[TUAnimationFloatFunction setStartValue:](v4, "setStartValue:", 0.0);
    -[TUNavigationBarDefaultCompressionAnimation navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    -[TUAnimationFloatFunction setEndValue:](v4, "setEndValue:", CGRectGetHeight(v9) * 0.5);

    v7 = self->_translateFunction;
    self->_translateFunction = v4;

    translateFunction = self->_translateFunction;
  }
  return translateFunction;
}

- (void)animateFloatingTabBarHiddenIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;

  v3 = a3;
  -[TUNavigationBarDefaultCompressionAnimation tabBarController](self, "tabBarController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = (id)v5;
    -[TUNavigationBarDefaultCompressionAnimation tabBarController](self, "tabBarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_uip_sidebar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_isVisible"))
    {

LABEL_7:
      return;
    }
    -[TUNavigationBarDefaultCompressionAnimation tabBarController](self, "tabBarController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "horizontalSizeClass");

    if (v10 == 2)
    {
      -[TUNavigationBarDefaultCompressionAnimation tabBarController](self, "tabBarController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_uip_isTabBarHidden");

      if (v12 != v3)
      {
        -[TUNavigationBarDefaultCompressionAnimation tabBarController](self, "tabBarController");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_uip_setTabBarHidden:animated:", v3, objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));
        goto LABEL_7;
      }
    }
  }
}

- (double)topOffset
{
  return self->topOffset;
}

- (BOOL)hideTitleOnTop
{
  return self->_hideTitleOnTop;
}

- (double)translationOffset
{
  return self->_translationOffset;
}

- (void)setTranslationOffset:(double)a3
{
  self->_translationOffset = a3;
}

- (TUNavigationBarCompressibleTitleView)compressibleTitleView
{
  return self->_compressibleTitleView;
}

- (void)setCompressibleTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_compressibleTitleView, a3);
}

- (NSArray)barButtonItemViews
{
  return self->_barButtonItemViews;
}

- (void)setBarButtonItemViews:(id)a3
{
  objc_storeStrong((id *)&self->_barButtonItemViews, a3);
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (UITabBarController)tabBarController
{
  return self->_tabBarController;
}

- (void)setOpacityFunction:(id)a3
{
  objc_storeStrong((id *)&self->_opacityFunction, a3);
}

- (void)setScaleFunction:(id)a3
{
  objc_storeStrong((id *)&self->_scaleFunction, a3);
}

- (void)setTranslateFunction:(id)a3
{
  objc_storeStrong((id *)&self->_translateFunction, a3);
}

- (BOOL)compressTitleView
{
  return self->_compressTitleView;
}

- (void)setCompressTitleView:(BOOL)a3
{
  self->_compressTitleView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translateFunction, 0);
  objc_storeStrong((id *)&self->_scaleFunction, 0);
  objc_storeStrong((id *)&self->_opacityFunction, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_barButtonItemViews, 0);
  objc_storeStrong((id *)&self->_compressibleTitleView, 0);
}

@end
