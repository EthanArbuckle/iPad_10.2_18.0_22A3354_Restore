@implementation TPIncomingCallMetricsProvider

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  +[TPIncomingCallMetricsProvider horizontalNameLabelBoundingRectForName:caption:window:preferredTitleFont:](TPIncomingCallMetricsProvider, "horizontalNameLabelBoundingRectForName:caption:window:preferredTitleFont:", a3, 0, a4, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;
  CGRect v39;
  CGRect result;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)getPRIncomingCallTextViewAdapterWrapperClass()), "initWithName:status:", v13, v12);

  objc_msgSend(v14, "setPreferredLayout:", 0);
  if (v11)
    objc_msgSend(v14, "setEmphasizedNameFont:", v11);
  v15 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v17 = (void *)objc_msgSend(v15, "initWithFrame:");

  objc_msgSend(v14, "viewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addSubview:", v19);
  objc_msgSend(a1, "constraintIncomingCallTextViewAdapterWrapper:toView:", v14, v17);
  objc_msgSend(v17, "setNeedsLayout");
  objc_msgSend(v17, "layoutIfNeeded");
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  TPDefaultLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v39.origin.x = v21;
    v39.origin.y = v23;
    v39.size.width = v25;
    v39.size.height = v27;
    NSStringFromCGRect(v39);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138412546;
    v35 = v29;
    v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_1BCFA3000, v28, OS_LOG_TYPE_DEFAULT, "Returning horizontalNameLabelBoundingRect: %@ using window: %@", (uint8_t *)&v34, 0x16u);

  }
  v30 = v21;
  v31 = v23;
  v32 = v25;
  v33 = v27;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  +[TPIncomingCallMetricsProvider verticalNameLabelBoundingRectForName:caption:window:preferredTitleFont:](TPIncomingCallMetricsProvider, "verticalNameLabelBoundingRectForName:caption:window:preferredTitleFont:", a3, 0, a4, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v34;
  void *v35;
  uint64_t v36;
  CGRect v37;
  CGRect result;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)getPRIncomingCallTextViewAdapterWrapperClass()), "initWithName:status:", v11, v10);

  objc_msgSend(v12, "setPreferredLayout:", 1);
  if (v9)
    objc_msgSend(v12, "setEmphasizedNameFont:", v9);
  v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v15 = (void *)objc_msgSend(v13, "initWithFrame:");

  objc_msgSend(v12, "viewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addSubview:", v17);
  objc_msgSend(a1, "constraintIncomingCallTextViewAdapterWrapper:toView:", v12, v15);
  objc_msgSend(v15, "setNeedsLayout");
  objc_msgSend(v15, "layoutIfNeeded");
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(getPRIncomingCallMetricsProviderClass(), "maxVerticalTextHeight");
  if (v25 > v26)
  {
    objc_msgSend(getPRIncomingCallMetricsProviderClass(), "maxVerticalTextHeight");
    v25 = v27;
  }
  TPDefaultLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v37.origin.x = v19;
    v37.origin.y = v21;
    v37.size.width = v23;
    v37.size.height = v25;
    NSStringFromCGRect(v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138412290;
    v35 = v29;
    _os_log_impl(&dword_1BCFA3000, v28, OS_LOG_TYPE_DEFAULT, "Returning verticalNameLabelBoundingRect: %@", (uint8_t *)&v34, 0xCu);

  }
  v30 = v19;
  v31 = v21;
  v32 = v23;
  v33 = v25;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

+ (id)appropriateCallerNameViewForContact:(id)a3 callStatus:(id)a4 callIsActive:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v5 = a5;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0DC3708];
  v9 = a4;
  objc_msgSend(v8, "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (!v7 || v11 == 1)
  {
    +[TPIncomingCallMetricsProvider posterDisplayNameForContact:](TPIncomingCallMetricsProvider, "posterDisplayNameForContact:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc((Class)getPRIncomingCallTextViewAdapterWrapperClass()), "initWithName:status:callIsActive:", v13, v9, v5);

    v9 = (id)v13;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)getPRIncomingCallTextViewAdapterWrapperClass()), "initWithContact:status:callIsActive:", v7, v9, v5);
  }

  if (_AXSPrefersHorizontalTextLayout())
    objc_msgSend(v12, "overrideTitleLayoutWith:", 0);

  return v12;
}

+ (void)addCallerNameView:(id)a3 toViewController:(id)a4
{
  id v5;
  id v6;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "contentViewCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vibrantObscurableContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  objc_msgSend(v31, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "willMoveToParentViewController:", v6);
  objc_msgSend(v6, "addChildViewController:", v9);
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v10);

  objc_msgSend(v9, "didMoveToParentViewController:", v6);
  objc_msgSend(v6, "registerPosterAppearanceObserver:", v31);
  objc_msgSend(v6, "obscurableContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPIncomingCallMetricsProvider constraintIncomingCallTextViewAdapterWrapper:toView:](TPIncomingCallMetricsProvider, "constraintIncomingCallTextViewAdapterWrapper:toView:", v31, v11);

  objc_msgSend(v31, "emojiViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "obscurableOverlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "emojiViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willMoveToParentViewController:", v6);
    objc_msgSend(v6, "addChildViewController:", v14);
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v15);

    objc_msgSend(v14, "didMoveToParentViewController:", v6);
  }
  objc_msgSend(v7, "vibrantObscurableContentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNeedsLayout");

  objc_msgSend(v7, "vibrantObscurableContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutIfNeeded");

  objc_msgSend(v31, "emojiViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v31, "viewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    objc_msgSend(v31, "emojiViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v22, v24, v26, v28);

  }
  objc_msgSend(v31, "tightFrame");
  objc_msgSend(v7, "setPrimaryContentTightFrame:");

}

+ (void)addCallerNameView:(id)a3 toContainerView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v7);

  +[TPIncomingCallMetricsProvider constraintIncomingCallTextViewAdapterWrapper:toView:](TPIncomingCallMetricsProvider, "constraintIncomingCallTextViewAdapterWrapper:toView:", v8, v5);
}

+ (void)constraintIncomingCallTextViewAdapterWrapper:(id)a3 toView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "layout");
  if (v9 == 1)
    objc_msgSend(a1, "constraintIncomingCallTextViewForVerticalLayout:toView:", v10, v6);
  else
    objc_msgSend(a1, "constraintIncomingCallTextViewForHorizontalLayout:toView:", v10, v6);

}

+ (void)constraintIncomingCallTextViewForHorizontalLayout:(id)a3 toView:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[TPIncomingCallMetricsProvider twentyTwoPointFivePercentOfDeviceHeight](TPIncomingCallMetricsProvider, "twentyTwoPointFivePercentOfDeviceHeight");
  v8 = v7;
  objc_msgSend(getPRIncomingCallMetricsProviderClass(), "horizontalTextEdgePadding");
  v10 = v9;
  v21 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "lastBaselineAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  objc_msgSend(v6, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  objc_msgSend(v6, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v16;
  objc_msgSend(v6, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

}

+ (void)constraintIncomingCallTextViewForVerticalLayout:(id)a3 toView:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
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
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[TPIncomingCallMetricsProvider verticalTextTopMargin](TPIncomingCallMetricsProvider, "verticalTextTopMargin");
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "screenSizeCategory") == 1)
    v10 = 16.0;
  else
    v10 = 20.0;

  v21 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(v6, "leftAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  objc_msgSend(v6, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

}

+ (id)nameLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AE8], 1024, *MEMORY[0x1E0DC48F0]);
}

+ (id)nameLabelFontWithAvatar
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B50], 1024, *MEMORY[0x1E0DC48F0]);
}

+ (id)mobileLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B58], 0, *MEMORY[0x1E0DC48F0]);
}

+ (double)homeButtonOffsetForSafeAreaFrame:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double v7;
  void *v8;
  double v9;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = 0.0;
  if (+[TPUIConfiguration pipStatusBarPadding](TPUIConfiguration, "pipStatusBarPadding") == 5)
  {
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    if (!CGRectIsEmpty(v11))
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v7 = v9 - (y + height);

    }
  }
  return v7;
}

+ (double)sixPercentOfDeviceHeight
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 >= v7)
    v8 = v4;
  else
    v8 = v7;
  return v8 * 0.0599999987;
}

+ (double)twelvePercentOfDeviceHeight
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 >= v7)
    v8 = v4;
  else
    v8 = v7;
  return v8 * 0.119999997;
}

+ (double)twentyTwoPointFivePercentOfDeviceHeight
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 >= v7)
    v8 = v4;
  else
    v8 = v7;
  return v8 * 0.224999994;
}

+ (CGRect)fullDeviceBounds
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

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
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

+ (double)fullDeviceHeight
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "fullDeviceBounds");
  v4 = v3;
  objc_msgSend(a1, "fullDeviceBounds");
  if (v4 >= v5)
    return v4;
  else
    return v5;
}

+ (double)fullDeviceWidth
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "fullDeviceBounds");
  v4 = v3;
  objc_msgSend(a1, "fullDeviceBounds");
  if (v4 >= v5)
    return v5;
  else
    return v4;
}

+ (BOOL)deviceHasHomeButton
{
  if (deviceHasHomeButton_onceToken != -1)
    dispatch_once(&deviceHasHomeButton_onceToken, &__block_literal_global_11);
  return deviceHasHomeButton_homeButtonType != 2;
}

uint64_t __52__TPIncomingCallMetricsProvider_deviceHasHomeButton__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceHasHomeButton_homeButtonType = result;
  return result;
}

+ (double)callDetailsButtonPaddingTopPercent_DynamicIsland
{
  return 7.39429998;
}

+ (double)callDetailsButtonPaddingTrailingPercent_DynamicIsland
{
  return 4.07119989;
}

+ (double)callDetailsButtonPaddingTopPercent_Notch
{
  return 6.63500023;
}

+ (double)callDetailsButtonPaddingTrailingPercent_Notch
{
  return 4.10249996;
}

+ (double)callDetailsButtonPaddingTopPercent_HomeButton
{
  return 4.34779978;
}

+ (double)callDetailsButtonPaddingTrailingPercent_HomeButton
{
  return 4.26660013;
}

+ (double)callDetailsButtonPaddingPercentTop_ForSnapshot
{
  double result;

  if (objc_msgSend(a1, "deviceHasHomeButton"))
    objc_msgSend(a1, "callDetailsButtonPaddingTopPercent_HomeButton");
  else
    objc_msgSend(a1, "callDetailsButtonPaddingTopPercent_DynamicIsland");
  return result;
}

+ (double)callDetailsButtonPaddingTrailPercent_ForSnapshot
{
  double result;

  if (objc_msgSend(a1, "deviceHasHomeButton"))
    objc_msgSend(a1, "callDetailsButtonPaddingTrailingPercent_HomeButton");
  else
    objc_msgSend(a1, "callDetailsButtonPaddingTrailingPercent_DynamicIsland");
  return result;
}

+ (double)callDetailsButtonPaddingTop_ForSnapshot
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "fullDeviceHeight");
  v4 = v3;
  objc_msgSend(a1, "callDetailsButtonPaddingPercentTop_ForSnapshot");
  return v4 * v5 / 100.0;
}

+ (double)callDetailsButtonPaddingTrail_ForSnapshot
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "fullDeviceWidth");
  v4 = v3;
  objc_msgSend(a1, "callDetailsButtonPaddingTrailPercent_ForSnapshot");
  return v4 * v5 / 100.0;
}

+ (id)callDetailsButtonMaxSize
{
  return (id)*MEMORY[0x1E0DC48F0];
}

+ (id)posterBadgeMaxSize
{
  return (id)*MEMORY[0x1E0DC4930];
}

+ (double)verticalTextTopMargin
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 >= v7)
    v8 = v4;
  else
    v8 = v7;
  return v8 * 0.129999995;
}

+ (double)sideMarginForDoubleButton
{
  double v2;

  objc_msgSend(a1, "fullDeviceWidth");
  return v2 * 0.102;
}

+ (double)incomingCallAndInCallControlsBottomPadding
{
  _BOOL4 v3;
  double v4;

  v3 = +[TPUIConfiguration screenSize](TPUIConfiguration, "screenSize") == 1;
  objc_msgSend(a1, "fullDeviceHeight");
  return v4 * dbl_1BCFE7480[v3];
}

+ (id)posterDisplayNameForContact:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v3 = a3;
  v4 = (void *)posterDisplayNameForContact__sFormatter;
  if (!posterDisplayNameForContact__sFormatter)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97218]);
    v6 = (void *)posterDisplayNameForContact__sFormatter;
    posterDisplayNameForContact__sFormatter = (uint64_t)v5;

    objc_msgSend((id)posterDisplayNameForContact__sFormatter, "setStyle:", 0);
    v4 = (void *)posterDisplayNameForContact__sFormatter;
  }
  objc_msgSend(v4, "stringFromContact:", v3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &stru_1E75FDD38;
  v9 = v7;

  return v9;
}

@end
