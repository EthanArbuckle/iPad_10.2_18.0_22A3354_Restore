@implementation UIAccessibilityLargeTextSegmentedViewController

- (id)segmentFromSegment:(id)a3
{
  id *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (id *)a3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
  objc_msgSend(v5, "setRequiresSecureCoding:", 0);
  objc_msgSend(v5, "decodeObjectForKey:", *MEMORY[0x1E0CB2CD0]);
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v3, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v8);

  objc_msgSend(v6, "setEnabled:", objc_msgSend(v3, "isEnabled"));
  objc_storeStrong(v6 + 69, v3[69]);
  if (((_BYTE)v3[79] & 0x20) != 0)
  {
    objc_msgSend(v3, "objectValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithConfiguration:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObjectValue:", v11);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6[64], "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  return v6;
}

- (UIAccessibilityLargeTextSegmentedViewController)initWithSegmentedControl:(id)a3 segments:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIAccessibilityLargeTextSegmentedViewController *v12;
  UIAccessibilityLargeTextSegmentedViewController *v13;
  id *p_segmentedControl;
  NSMutableArray *v15;
  NSMutableArray *segmentButtons;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSArray *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  NSArray *segments;
  NSArray *v45;
  void *v46;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v54.receiver = self;
  v54.super_class = (Class)UIAccessibilityLargeTextSegmentedViewController;
  v12 = -[UIViewController init](&v54, sel_init);
  v13 = v12;
  if (v12)
  {
    p_segmentedControl = (id *)&v12->_segmentedControl;
    objc_storeStrong((id *)&v12->_segmentedControl, a3);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    segmentButtons = v13->_segmentButtons;
    v13->_segmentButtons = v15;

    -[UIViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 7);
    -[UIViewController popoverPresentationController](v13, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v11);
    objc_msgSend(v17, "setSourceView:", *p_segmentedControl);
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      objc_msgSend(*p_segmentedControl, "bounds");
      objc_msgSend(v17, "setSourceRect:");
    }
    v49 = v11;
    objc_msgSend(v17, "setPermittedArrowDirections:", 3);
    v18 = (void *)objc_opt_class();
    objc_msgSend(v9, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v18, objc_msgSend(v19, "userInterfaceIdiom"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v20;
    if ((objc_msgSend(v20, "useSelectionIndicatorStyling") & 1) == 0)
    {
      objc_msgSend(*p_segmentedControl, "tintColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setArrowBackgroundColor:", v21);

      objc_msgSend(*p_segmentedControl, "backgroundColor");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = v10;
      v24 = objc_msgSend(v22, "CGColor");
      -[UIViewController view](v13, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBackgroundColor:", v24);

      objc_msgSend(*p_segmentedControl, "tintColor");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = objc_msgSend(v27, "CGColor");
      -[UIViewController view](v13, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBorderColor:", v28);

      v10 = v23;
      -[UIViewController view](v13, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setBorderWidth:", 1.0);

      -[UIViewController view](v13, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setCornerRadius:", 13.0);

    }
    -[UIViewController view](v13, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v36 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v37 = v10;
    v38 = v10;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v51 != v41)
            objc_enumerationMutation(v38);
          -[UIAccessibilityLargeTextSegmentedViewController segmentFromSegment:](v13, "segmentFromSegment:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v36, "addObject:", v43);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v40);
    }

    segments = v13->_segments;
    v13->_segments = v36;
    v45 = v36;

    -[UIAccessibilityLargeTextSegmentedViewController _configureSegmentViews](v13, "_configureSegmentViews");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObserver:selector:name:object:", v13, sel__orientationChanged_, CFSTR("UIDeviceOrientationDidChangeNotification"), 0);

    v10 = v37;
    v11 = v49;
  }

  return v13;
}

- (void)_configureSegmentViews
{
  UIScrollView *v3;
  void *v4;
  id v5;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  int *v35;
  char *v36;
  id v37;
  void *v38;
  int *v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  UIScrollView *mainScrollView;
  UIScrollView *v59;
  NSUInteger v60;
  UIStackView *v61;

  v3 = objc_alloc_init(UIScrollView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setBounces:](v3, "setBounces:", 0);
  v61 = objc_alloc_init(UIStackView);
  -[UIStackView setAxis:](v61, "setAxis:", 1);
  -[UIStackView setDistribution:](v61, "setDistribution:", 3);
  -[UIStackView setAlignment:](v61, "setAlignment:", 0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v61, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[UIView addSubview:](v3, "addSubview:", v61);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIView centerXAnchor](v3, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  -[UIView widthAnchor](v3, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  -[UIView topAnchor](v3, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v18);

  -[UIView centerXAnchor](v61, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v3, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v21);

  -[UIView widthAnchor](v61, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](v3, "widthAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v24);

  -[UIView topAnchor](v61, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](v3, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v27);

  -[UIView bottomAnchor](v61, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v3;
  -[UIView bottomAnchor](v3, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v30);

  v60 = -[NSArray count](self->_segments, "count");
  if (v60)
  {
    v31 = 0;
    v32 = *MEMORY[0x1E0C9D820];
    v33 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v34 = 0.0;
    v35 = &OBJC_IVAR___UICollectionViewFlowLayout__footerReferenceSize;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_segments, "objectAtIndex:", v31);
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setUsesAXTextSize:", 1);
      objc_msgSend(v36, "setSegmentPosition:", 1);
      if (v31 == -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex"))
      {
        objc_storeStrong((id *)&self->_originalSelectedSegment, v36);
        objc_msgSend(v36, "setSelected:", 1);
      }
      v37 = *(id *)&v36[v35[637]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v37, "setNumberOfLines:", 0);
        objc_msgSend(v37, "setLineBreakMode:", 0);
      }
      +[UISegmentAccessibilityButton buttonWithSegment:](UISegmentAccessibilityButton, "buttonWithSegment:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel_buttonPress_, 64);
      objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel_buttonTouchDown_, 1);
      objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel_buttonTouchDown_, 16);
      objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel_buttonTouchUp_, 128);
      objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel_buttonTouchUp_, 32);
      v39 = v35;
      v40 = *(id *)&v36[v35[637]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v36, "_maximumTextSize");
      }
      else
      {
        v42 = v33;
        v43 = v32;
        if (!v40)
          goto LABEL_12;
        objc_msgSend(v40, "intrinsicContentSize");
      }
      v43 = v41;
LABEL_12:
      v44 = v42 + 16.0;
      if (!v31)
      {
        -[UIView window](self->_segmentedControl, "window");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "bounds");
        v47 = v46;

        if (v47 < v44 + v44)
          -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
      }
      -[UIStackView addArrangedSubview:](v61, "addArrangedSubview:", v38);
      objc_msgSend(v38, "heightAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToConstant:", v44);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v49);

      -[NSMutableArray addObject:](self->_segmentButtons, "addObject:", v38);
      if (v34 < v43 + 32.0)
        v34 = v43 + 32.0;

      ++v31;
      v35 = v39;
      if (v60 == v31)
        goto LABEL_20;
    }
  }
  v34 = 0.0;
LABEL_20:
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v34, 0.0);
  -[UIView heightAnchor](v59, "heightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](v61, "heightAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v53) = 1148829696;
  objc_msgSend(v52, "setPriority:", v53);
  objc_msgSend(v5, "addObject:", v52);
  -[UIView heightAnchor](v59, "heightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:multiplier:", v56, 1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v57);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v5);
  mainScrollView = self->_mainScrollView;
  self->_mainScrollView = v59;

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityLargeTextSegmentedViewController;
  -[UIViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[UIViewController preferredContentSize](self, "preferredContentSize");
  v4 = v3;
  -[UIView size](self->_mainScrollView, "size");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4);
}

- (void)buttonPress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[UIAccessibilityLargeTextSegmentedViewController originalSelectedSegment](self, "originalSelectedSegment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 0);

  objc_msgSend(v4, "segment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", 1);

  -[UIAccessibilityLargeTextSegmentedViewController segmentedControl](self, "segmentedControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray indexOfObject:](self->_segmentButtons, "indexOfObject:", v4);

  objc_msgSend(v7, "setSelectedSegmentIndex:", v8);
  -[UIAccessibilityLargeTextSegmentedViewController segmentedControl](self, "segmentedControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_sendValueChanged");

  -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)buttonTouchDown:(id)a3
{
  id v3;

  objc_msgSend(a3, "segment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", 1);

}

- (void)buttonTouchUp:(id)a3
{
  id v3;

  objc_msgSend(a3, "segment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", 0);

}

- (void)_orientationChanged:(id)a3
{
  -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (NSMutableArray)segmentButtons
{
  return self->_segmentButtons;
}

- (void)setSegmentButtons:(id)a3
{
  objc_storeStrong((id *)&self->_segmentButtons, a3);
}

- (UISegment)originalSelectedSegment
{
  return self->_originalSelectedSegment;
}

- (void)setOriginalSelectedSegment:(id)a3
{
  objc_storeStrong((id *)&self->_originalSelectedSegment, a3);
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (UIScrollView)mainScrollView
{
  return self->_mainScrollView;
}

- (void)setMainScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_mainScrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainScrollView, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_originalSelectedSegment, 0);
  objc_storeStrong((id *)&self->_segmentButtons, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
