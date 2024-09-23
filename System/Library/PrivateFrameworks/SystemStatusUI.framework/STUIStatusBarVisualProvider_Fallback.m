@implementation STUIStatusBarVisualProvider_Fallback

- (BOOL)supportsIndirectPointerTouchActions
{
  return 0;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  v4 = 40.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 0;
}

+ (BOOL)requiresIterativeOverflowLayout
{
  return 0;
}

- (UIFont)clockFont
{
  return 0;
}

- (id)setupInContainerView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  STUIStatusBarRegion *v6;
  STUIStatusBarRegionAxesLayout *v7;
  STUIStatusBarRegionAxisStackingLayout *v8;
  void *v9;
  id v10;
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
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("main"));
  v7 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v8 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v8, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v8, "setInterspace:", 6.0);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v7, "setHorizontalLayout:", v8);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v7, "setVerticalLayout:", v9);

  -[STUIStatusBarRegion setLayout:](v6, "setLayout:", v7);
  v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v11 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.75);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v13);

  -[STUIStatusBarRegion setContentView:](v6, "setContentView:", v11);
  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v21);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v25);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v29);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v30);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
  v33[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  NSArray *placements;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  placements = self->_placements;
  if (!placements)
  {
    +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 99, 3.0, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarFallbackItem, "defaultDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 100);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_placements;
    self->_placements = v8;

    placements = self->_placements;
  }
  return placements;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[STUIStatusBarVisualProvider_Fallback statusBar](self, "statusBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarStyleAttributes styleAttributesForStatusBar:style:](STUIStatusBarStyleAttributes, "styleAttributesForStatusBar:style:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 8.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  return v5;
}

- (STUIStatusBar)statusBar
{
  return (STUIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

- (NSArray)placements
{
  return self->_placements;
}

- (void)setPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_placements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placements, 0);
  objc_destroyWeak((id *)&self->_statusBar);
}

@end
