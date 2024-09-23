@implementation _UIBannerContainerView

- (_UIBannerContainerView)initWithFrame:(CGRect)a3
{
  _UIBannerContainerView *v3;
  uint64_t v4;
  NSMutableArray *banners;
  uint64_t v6;
  NSMutableArray *constraints;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIBannerContainerView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    banners = v3->_banners;
    v3->_banners = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_statusBarFrameDidChange_, CFSTR("UIApplicationDidChangeStatusBarFrameNotification"), UIApp);

  }
  return v3;
}

- (void)_presentBanner:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
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
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double y;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;
  CGAffineTransform v44;
  CGAffineTransform v45;
  _QWORD v46[2];
  CGRect v47;

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NSMutableArray addObject:](self->_banners, "addObject:", v6);
  -[UIView addSubview:](self, "addSubview:", v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11, 8.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  objc_msgSend(v8, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v15);

  objc_msgSend(v8, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintLessThanOrEqualToConstant:", 480.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v17);

  objc_msgSend(v8, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", 480.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 1147207680;
  objc_msgSend(v19, "_ui_constraintWithPriority:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v21);

  objc_msgSend(v8, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 1147207680;
  objc_msgSend(v24, "_ui_constraintWithPriority:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVisibleConstraint:", v26);

  objc_msgSend(v8, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHiddenConstraint:", v29);

  objc_msgSend(v6, "hiddenConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v30);

  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v9);
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  objc_msgSend(v8, "_screen");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47.origin.x = _UIScreenNativeDisplayExclusionRectForType(objc_msgSend(v31, "_screenType"));
  y = v47.origin.y;
  LOBYTE(v28) = CGRectIsNull(v47);

  if ((v28 & 1) == 0 && y > 0.0)
  {
    objc_msgSend(v8, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "filters");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (!v35)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setValue:forKey:", &unk_1E1A95DA0, CFSTR("inputRadius"));
      objc_msgSend(v36, "setName:", CFSTR("gaussianBlur"));
      v46[0] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFilters:", v37);

    }
    CGAffineTransformMakeScale(&v45, 0.8, 0.8);
    v44 = v45;
    objc_msgSend(v8, "setTransform:", &v44);
  }
  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __52___UIBannerContainerView__presentBanner_completion___block_invoke;
  v40[3] = &unk_1E16C3080;
  objc_copyWeak(&v42, &location);
  v39 = v7;
  v41 = v39;
  -[_UIBannerContainerView _setBanner:visible:alongsideAnimations:completion:](self, "_setBanner:visible:alongsideAnimations:completion:", v6, 1, 0, v40);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_UIBannerContainerView;
  -[UIView updateConstraints](&v18, sel_updateConstraints);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarHeight");
  v6 = v5;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_banners;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = v6 + 8.0;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "visibleConstraint", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setConstant:", v10);

        ++v12;
      }
      while (v9 != v12);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (void)_dismissBanner:(id)a3 alongsideAnimations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72___UIBannerContainerView__dismissBanner_alongsideAnimations_completion___block_invoke;
  v13[3] = &unk_1E16C90E8;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  -[_UIBannerContainerView _setBanner:visible:alongsideAnimations:completion:](self, "_setBanner:visible:alongsideAnimations:completion:", v11, 0, v9, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (id)_bannerAnimationToVisible:(BOOL)a3 hiddenValue:(id)a4 visibleValue:(id)a5 withKeyPath:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  double v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDuration:", 0.5);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  if (v8)
    v12 = v9;
  else
    v12 = v10;
  if (v8)
    v13 = v10;
  else
    v13 = v9;
  objc_msgSend(v11, "setFromValue:", v12);
  objc_msgSend(v11, "setToValue:", v13);
  *(float *)&v14 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v11, "setSpeed:", v14);

  return v11;
}

- (void)_setBanner:(id)a3 visible:(BOOL)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double y;
  uint64_t v18;
  id *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[2];
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  _UIBannerContainerView *v31;
  BOOL v32;
  CGRect v33;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "visibleConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", v7);

  objc_msgSend(v12, "hiddenConstraint");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14, "setActive:", v7 ^ 1);

  objc_msgSend(v12, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33.origin.x = _UIScreenNativeDisplayExclusionRectForType(objc_msgSend(v16, "_screenType"));
  y = v33.origin.y;
  LOBYTE(v14) = CGRectIsNull(v33);

  if ((v14 & 1) != 0 || y <= 0.0)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke_2;
    v24[3] = &unk_1E16B1B50;
    v19 = (id *)v25;
    v25[0] = v10;
    v25[1] = self;
    v23 = v10;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v24, v11, 0.5);
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke;
    aBlock[3] = &unk_1E16B4030;
    v19 = &v29;
    v29 = v10;
    v20 = v15;
    v32 = v7;
    v30 = v20;
    v31 = self;
    v21 = v10;
    v22 = _Block_copy(aBlock);
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke_140;
    v26[3] = &unk_1E16C0E38;
    v27 = v11;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v22, v26, 1.0, 0.5, 0.08, 1.0, 0.0, 0.0);

  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_banners;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "view", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        v19.x = x;
        v19.y = y;
        v11 = CGRectContainsPoint(v20, v19);

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSMutableArray)banners
{
  return self->_banners;
}

- (void)setBanners:(id)a3
{
  objc_storeStrong((id *)&self->_banners, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_banners, 0);
}

@end
