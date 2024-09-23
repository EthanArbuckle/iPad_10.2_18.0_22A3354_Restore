@implementation SPUIUnifiedFieldViewController

- (CALayer)searchProtectorLayer
{
  return (CALayer *)objc_getProperty(self, a2, 984, 1);
}

- (void)keyboardFrameChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  float v17;
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
  CGFloat Height;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  _QWORD v35[6];
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v4 = a3;
  -[SPUIUnifiedFieldViewController setHandlingKeyboardFrameChange:](self, "setHandlingKeyboardFrameChange:", 1);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BEBE468]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BEBE408]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v34 = v17;

  -[SPUIUnifiedFieldViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tlks_screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  v38.origin.x = v21;
  v38.origin.y = v23;
  v38.size.width = v25;
  v38.size.height = v27;
  v37 = CGRectIntersection(v36, v38);
  Height = CGRectGetHeight(v37);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __55__SPUIUnifiedFieldViewController_keyboardFrameChanged___block_invoke;
  v35[3] = &unk_24F9D5CA0;
  v35[4] = self;
  *(CGFloat *)&v35[5] = Height;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 196608, v35, 0, v34, 0.0);
  -[SPUIUnifiedFieldViewController setHandlingKeyboardFrameChange:](self, "setHandlingKeyboardFrameChange:", 0);
  -[SPUIUnifiedFieldViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "window");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "windowScene");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "activationState");

  if (!v32)
  {
    -[SPUIUnifiedFieldViewController delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "unifiedFieldViewControllerDidLayoutForKeyboardFrameChange:", self);

  }
}

- (void)setHandlingKeyboardFrameChange:(BOOL)a3
{
  self->_handlingKeyboardFrameChange = a3;
}

- (int64_t)preferredUserInterfaceStyle
{
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
    return 0;
  else
    return 2;
}

- (BOOL)isUnifiedFieldDocked
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFirstResponder"))
  {
    -[SPUIUnifiedFieldViewController keyboardVisualEffectView](self, "keyboardVisualEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hideVisualEffectView");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (SPUIUnifiedFieldViewController)initWithNavigationController:(id)a3
{
  id v5;
  SPUIUnifiedFieldViewController *v6;
  SPUIUnifiedFieldViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SPUISearchHeader *searchHeader;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SPUINavigationSwipeRecognizerDelegate *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CALayer *searchProtectorLayer;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  objc_super v71;

  v5 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SPUIUnifiedFieldViewController;
  v6 = -[SPUIUnifiedFieldViewController init](&v71, sel_init);
  v7 = v6;
  if (v6)
  {
    -[SPUIUnifiedFieldViewController view](v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setOverrideVibrancyTrait:", 1);

    objc_storeStrong((id *)&v7->_searchNavigationController, a3);
    objc_msgSend(v5, "searchViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "headerView");
    v10 = objc_claimAutoreleasedReturnValue();
    searchHeader = v7->_searchHeader;
    v7->_searchHeader = (SPUISearchHeader *)v10;

    objc_msgSend(v5, "setNavigationBarHidden:", 1);
    objc_msgSend(v5, "setUnifiedFieldDelegate:", v7);
    -[SPUIUnifiedFieldViewController addChildViewController:](v7, "addChildViewController:", v5);
    -[SPUIUnifiedFieldViewController view](v7, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    v14 = (void *)MEMORY[0x24BE85220];
    objc_msgSend(v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fillContainerWithView:", v15);

    v16 = -[SPUINavigationSwipeRecognizerDelegate initWithNavigationController:]([SPUINavigationSwipeRecognizerDelegate alloc], "initWithNavigationController:", v7->_searchNavigationController);
    -[SPUIUnifiedFieldViewController setSwipeRecognizer:](v7, "setSwipeRecognizer:", v16);

    -[SPUIUnifiedFieldViewController swipeRecognizer](v7, "swipeRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactivePopGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v17);

    v19 = (void *)objc_opt_new();
    -[SPUIUnifiedFieldViewController setKeyboardVisualEffectView:](v7, "setKeyboardVisualEffectView:", v19);
    -[SPUIUnifiedFieldViewController keyboardVisualEffectView](v7, "keyboardVisualEffectView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = objc_claimAutoreleasedReturnValue();
    searchProtectorLayer = v7->_searchProtectorLayer;
    v7->_searchProtectorLayer = (CALayer *)v21;

    -[SPUIUnifiedFieldViewController view](v7, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v19);

    -[SPUIUnifiedFieldViewController view](v7, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController searchHeader](v7, "searchHeader");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    -[SPUIUnifiedFieldViewController searchHeader](v7, "searchHeader");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[SPUIUnifiedFieldViewController searchHeader](v7, "searchHeader");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController view](v7, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "keyboardLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v33) = 1148829696;
    objc_msgSend(v32, "setPriority:", v33);
    objc_msgSend(v32, "setActive:", 1);
    -[SPUIUnifiedFieldViewController view](v7, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController searchHeader](v7, "searchHeader");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:constant:", v37, 16.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setActive:", 1);
    -[SPUIUnifiedFieldViewController searchHeader](v7, "searchHeader");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController view](v7, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController setLeadingConstraint:](v7, "setLeadingConstraint:", v43);

    -[SPUIUnifiedFieldViewController leadingConstraint](v7, "leadingConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    -[SPUIUnifiedFieldViewController searchHeader](v7, "searchHeader");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController view](v7, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController setTrailingConstraint:](v7, "setTrailingConstraint:", v49);

    -[SPUIUnifiedFieldViewController trailingConstraint](v7, "trailingConstraint");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0858]), "initWithRecipe:", 5);
    -[SPUIUnifiedFieldViewController setTopBlur:](v7, "setTopBlur:", v51);

    -[SPUIUnifiedFieldViewController view](v7, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController topBlur](v7, "topBlur");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addSubview:", v53);

    -[SPUIUnifiedFieldViewController topBlur](v7, "topBlur");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchViewController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTopBlurView:", v54);

    v56 = (void *)objc_opt_new();
    -[SPUIUnifiedFieldViewController setFakeTextField:](v7, "setFakeTextField:", v56);

    -[SPUIUnifiedFieldViewController fakeTextField](v7, "fakeTextField");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setUserInteractionEnabled:", 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController fakeTextField](v7, "fakeTextField");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setTokenBackgroundColor:", v58);

    -[SPUIUnifiedFieldViewController fakeTextField](v7, "fakeTextField");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setSymbolAnimationEnabled:", 0);

    -[SPUIUnifiedFieldViewController fakeTextField](v7, "fakeTextField");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setCanAcquireFieldEditor:", 0);

    -[SPUIUnifiedFieldViewController fakeTextField](v7, "fakeTextField");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setTextAlignment:", 1);

    -[SPUIUnifiedFieldViewController fakeTextField](v7, "fakeTextField");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leftView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController setFakeOriginalLeftView:](v7, "setFakeOriginalLeftView:", v64);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObserver:selector:name:object:", v7, sel_keyboardFrameChanged_, *MEMORY[0x24BEBE570], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObserver:selector:name:object:", v7, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObserver:selector:name:object:", v7, sel_keyboardWillHide_, *MEMORY[0x24BEBE578], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addObserver:selector:name:object:", v7, sel_processStateForeground, *MEMORY[0x24BEBE6E8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObserver:selector:name:object:", v7, sel_doALayoutPass, CFSTR("SPUILayoutPass"), 0);

  }
  return v7;
}

- (SPUITextField)fakeTextField
{
  return (SPUITextField *)objc_getProperty(self, a2, 1064, 1);
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double MinY;
  void *v13;
  CGFloat v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  BOOL v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;

  v38.receiver = self;
  v38.super_class = (Class)SPUIUnifiedFieldViewController;
  -[SPUIUnifiedFieldViewController viewDidLayoutSubviews](&v38, sel_viewDidLayoutSubviews);
  -[SPUIUnifiedFieldViewController keyboardProtectorHeight](self, "keyboardProtectorHeight");
  v4 = v3;
  -[SPUIUnifiedFieldViewController keyboardVisualEffectView](self, "keyboardVisualEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchFieldHeight:", v4);

  -[SPUIUnifiedFieldViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  MinY = CGRectGetMinY(v39);

  -[SPUIUnifiedFieldViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v14 = CGRectGetHeight(v40) - MinY;

  -[SPUIUnifiedFieldViewController keyboardVisualEffectView](self, "keyboardVisualEffectView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, MinY, v10, v14);

  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  -[SPUIUnifiedFieldViewController searchNavigationController](self, "searchNavigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v18, 0.0);

  -[SPUIUnifiedFieldViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  -[SPUIUnifiedFieldViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "windowScene");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "statusBarManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "statusBarFrame");
  v28 = v27;
  -[SPUIUnifiedFieldViewController topBlur](self, "topBlur");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, v22, v28);

  -[SPUIUnifiedFieldViewController delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "unifiedFieldViewControllerDidLayoutUnifiedField:dueToKeyboardLayout:", self, -[SPUIUnifiedFieldViewController handlingKeyboardFrameChange](self, "handlingKeyboardFrameChange"));

  -[SPUIUnifiedFieldViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "keyboardLayoutGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutFrame");
  v34 = v33;
  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  if (v34 <= v36)
  {

  }
  else
  {
    v37 = -[SPUIUnifiedFieldViewController tryToLayoutForBadFrame](self, "tryToLayoutForBadFrame");

    if (!v37)
    {
      -[SPUIUnifiedFieldViewController setTryToLayoutForBadFrame:](self, "setTryToLayoutForBadFrame:", 1);
      -[SPUIUnifiedFieldViewController doALayoutPass](self, "doALayoutPass");
      -[SPUIUnifiedFieldViewController setTryToLayoutForBadFrame:](self, "setTryToLayoutForBadFrame:", 0);
    }
  }
}

- (SPUIDynamicKeyboardVisualEffectView)keyboardVisualEffectView
{
  return (SPUIDynamicKeyboardVisualEffectView *)objc_getProperty(self, a2, 1016, 1);
}

- (SBFFeatherBlurView)topBlur
{
  return (SBFFeatherBlurView *)objc_getProperty(self, a2, 1024, 1);
}

- (SPUINavigationController)searchNavigationController
{
  return (SPUINavigationController *)objc_getProperty(self, a2, 992, 1);
}

- (double)keyboardProtectorHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;
  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomPadding");
  v9 = v6 + v8;
  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topPadding");
  v12 = v9 + v11;

  return v12;
}

- (CGSize)unifiedFieldSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (SPUISearchHeader)searchHeader
{
  return (SPUISearchHeader *)objc_getProperty(self, a2, 1000, 1);
}

- (BOOL)handlingKeyboardFrameChange
{
  return self->_handlingKeyboardFrameChange;
}

- (SPUIUnifiedFieldViewControllerDelegate)delegate
{
  return (SPUIUnifiedFieldViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __55__SPUIUnifiedFieldViewController_keyboardFrameChanged___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v2 = *(double *)(a1 + 40) <= 0.0;
  objc_msgSend(*(id *)(a1 + 32), "keyboardVisualEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHideVisualEffectView:", v2);

  objc_msgSend(*(id *)(a1 + 32), "keyboardVisualEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHideFeatheredBlur:", 0);

  v5 = *(double *)(a1 + 40) == 0.0;
  objc_msgSend(*(id *)(a1 + 32), "keyboardVisualEffectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHideVisualEffectView:", v5);

  objc_msgSend((id)objc_opt_class(), "insetMarginsForSearchField");
  v8 = v7;
  if (*(double *)(a1 + 40) <= 0.0)
    v9 = v7;
  else
    v9 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "leadingConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

  if (*(double *)(a1 + 40) <= 0.0)
    v11 = -v8;
  else
    v11 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "trailingConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

}

- (CGSize)dockedUnifiedFieldSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  -[SPUIUnifiedFieldViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isContinuityDisplay") & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode") ^ 1;

  -[SPUIUnifiedFieldViewController unifiedFieldSize](self, "unifiedFieldSize");
  v13 = v12;
  if (v10)
  {
    -[SPUIUnifiedFieldViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;

    objc_msgSend((id)objc_opt_class(), "insetMarginsForSearchField");
    v18 = v16 + v17 * -2.0;
    -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sizeThatFits:", v18, v13);
    v21 = v20;

  }
  else
  {
    v21 = v11;
  }
  v22 = v21;
  v23 = v13;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (double)insetMarginsForSearchField
{
  double result;

  objc_msgSend(MEMORY[0x24BEB4BC0], "standardTableCellContentInset");
  return result;
}

- (NSLayoutConstraint)trailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1040, 1);
}

- (NSLayoutConstraint)leadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1032, 1);
}

- (SPUINavigationSwipeRecognizerDelegate)swipeRecognizer
{
  return (SPUINavigationSwipeRecognizerDelegate *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (void)setTopBlur:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void)setSwipeRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (void)setLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void)setKeyboardVisualEffectView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (void)setFakeTextField:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (void)setFakeOriginalLeftView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (double)unifiedFieldCornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundCornerRadius");
  v5 = v4;

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SPUIUnifiedFieldViewController backButton](self, "backButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SPUIUnifiedFieldViewController originalLeftView](self, "originalLeftView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[SPUIUnifiedFieldViewController originalLeftView](self, "originalLeftView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftView:", v8);

  }
}

- (UIButton)backButton
{
  return (UIButton *)objc_getProperty(self, a2, 1048, 1);
}

- (void)processStateForeground
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SPUIUnifiedFieldViewController_processStateForeground__block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __56__SPUIUnifiedFieldViewController_processStateForeground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doALayoutPass");
}

- (void)doALayoutPass
{
  void *v3;
  id v4;

  -[SPUIUnifiedFieldViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[SPUIUnifiedFieldViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SPUIUnifiedFieldViewController;
  -[SPUIUnifiedFieldViewController dealloc](&v4, sel_dealloc);
}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SPUIUnifiedFieldViewController searchNavigationController](self, "searchNavigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > 1)
  {
    -[SPUIUnifiedFieldViewController backButton](self, "backButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SPUIUnifiedFieldViewController backButton](self, "backButton");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLeftView:", v10);

    }
  }
  else
  {
    -[SPUIUnifiedFieldViewController setBackButton:](self, "setBackButton:", 0);
  }
}

- (void)resetSearchFieldContentWithSearchToken:(id)a3 text:(id)a4 wantsBackButton:(BOOL)a5 transitionCoordinator:(id)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id *v54;
  id *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  void *v67;
  _QWORD v68[5];
  id v69;
  _QWORD aBlock[5];
  id v71;
  id v72;
  id v73;
  id v74;
  BOOL v75;
  _QWORD v76[4];
  id v77;

  v7 = a5;
  v59 = a3;
  v10 = a4;
  v60 = a6;
  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_fieldEditor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = MEMORY[0x24BDAC760];
  v76[1] = 3221225472;
  v76[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke;
  v76[3] = &unk_24F9D5CC8;
  v14 = v12;
  v77 = v14;
  objc_msgSend(v13, "_performWhileSuppressingDelegateNotifications:", v76);

  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primaryColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "secondaryColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v14, "isOnDarkBackground");
  v20 = (void *)MEMORY[0x24BEB4B88];
  -[SPUIUnifiedFieldViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bestAppearanceForView:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  v24 = v7;
  objc_msgSend(v16, "updateWithPrimaryColor:secondaryColor:isOnDarkBackground:appearance:", v17, v18, v23, v22);

  v25 = (void *)MEMORY[0x24BE85220];
  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fillContainerWithView:", v26);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTokenBackgroundColor:", v27);

  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "canvasView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAlpha:", 0.0);

  if (v7)
  {
    objc_msgSend(v14, "_placeholderLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setHidden:", 1);

    -[SPUIUnifiedFieldViewController generateBackButton](self, "generateBackButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLeftView:", v32);

    -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "unfocusSearchFieldWithReason:afterCommit:", 5, 0);
  }
  else
  {
    -[SPUIUnifiedFieldViewController fakeOriginalLeftView](self, "fakeOriginalLeftView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setLeftView:", v34);

  }
  v36 = v59;
  v37 = MEMORY[0x24BDAC760];

  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leftView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0.0;
  objc_msgSend(v39, "setAlpha:", 0.0);

  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rightView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAlpha:", 0.0);

  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_2((uint64_t)v43, v43, (uint64_t)v10, v59);

  if (objc_msgSend(v14, "hasContent"))
    v40 = 1.0;
  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField", v59);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_clearButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAlpha:", v40);

  -[SPUIUnifiedFieldViewController fakeTextField](self, "fakeTextField");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "layoutBelowIfNeeded");

  aBlock[0] = v37;
  aBlock[1] = 3221225472;
  aBlock[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_3;
  aBlock[3] = &unk_24F9D6208;
  aBlock[4] = self;
  v47 = v14;
  v71 = v47;
  v74 = &__block_literal_global_2;
  v48 = v10;
  v72 = v48;
  v49 = v36;
  v73 = v49;
  v75 = v24;
  v50 = _Block_copy(aBlock);
  v68[0] = v37;
  v68[1] = 3221225472;
  v68[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_4;
  v68[3] = &unk_24F9D6230;
  v68[4] = self;
  v51 = v47;
  v69 = v51;
  v52 = _Block_copy(v68);
  v53 = v52;
  if (v60)
  {
    v66[0] = v37;
    v66[1] = 3221225472;
    v66[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_5;
    v66[3] = &unk_24F9D5DE8;
    v54 = &v67;
    v67 = v52;
    v64[0] = v37;
    v64[1] = 3221225472;
    v55 = &v65;
    v64[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_6;
    v64[3] = &unk_24F9D5DE8;
    v65 = v50;
    v56 = v53;
    objc_msgSend(v60, "animateAlongsideTransition:completion:", v66, v64);
  }
  else
  {
    v57 = (void *)MEMORY[0x24BEBDB00];
    v61[0] = v37;
    v61[1] = 3221225472;
    v61[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_7;
    v61[3] = &unk_24F9D6258;
    v54 = &v62;
    v62 = v52;
    v55 = &v63;
    v63 = v50;
    v58 = v53;
    objc_msgSend(v57, "performWithoutAnimation:", v61);
  }

}

uint64_t __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unmarkText");
}

void __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  if (a4)
    a3 = 0;
  v6 = a4;
  v7 = a2;
  objc_msgSend(v7, "updateTextRange:", a3);
  objc_msgSend(v7, "updateToken:", v6);

}

void __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_3(uint64_t a1, char a2)
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "fakeTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 40), "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  if ((a2 & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "searchHeader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUseClearTokens:", 1);

    }
    v8 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v8, "backButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "generateBackButton");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setBackButton:", v10);

      }
      objc_msgSend(*(id *)(a1 + 32), "backButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "leftView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 != v12)
      {
        objc_msgSend(*(id *)(a1 + 40), "leftView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setOriginalLeftView:", v13);

      }
      objc_msgSend(*(id *)(a1 + 32), "backButton");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "originalLeftView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
LABEL_13:
        objc_msgSend(*(id *)(a1 + 40), "leftView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAlpha:", 1.0);

        objc_msgSend(*(id *)(a1 + 40), "_placeholderLabel");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setHidden:", 0);

        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "originalLeftView");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v14;
    objc_msgSend(*(id *)(a1 + 40), "setLeftView:", v14);

    goto LABEL_13;
  }
}

void __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_4(uint64_t a1, double a2)
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = 1.0 - a2;
  objc_msgSend(*(id *)(a1 + 32), "fakeTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0 - a2);

  objc_msgSend(*(id *)(a1 + 40), "leftView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", a2);

  objc_msgSend(*(id *)(a1 + 32), "fakeTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 1.0 - a2);

  if (!objc_msgSend(*(id *)(a1 + 40), "hasContent"))
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "fakeTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_placeholderLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v4);

  objc_msgSend(*(id *)(a1 + 40), "_fieldEditor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", a2);

  objc_msgSend(*(id *)(a1 + 40), "canvasView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", a2);

  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "_fieldEditor");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", a2);

}

uint64_t __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "percentComplete");
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
}

uint64_t __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_6(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled"));
}

uint64_t __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_7(uint64_t a1)
{
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(1.0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)generateBackButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE85280];
  -[SPUIUnifiedFieldViewController searchHeader](self, "searchHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiImageWithSymbolName:font:scale:", CFSTR("chevron.backward"), v7, -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v8);

  objc_msgSend(v3, "setImagePlacement:", 2);
  v9 = (void *)MEMORY[0x24BEB4BA0];
  -[SPUIUnifiedFieldViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceScaledRoundedValue:forView:", v10, 3.5);
  v12 = v11;

  objc_msgSend(v3, "setContentInsets:", 0.0, 6.0, 0.0, v12);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setConfiguration:", v3);
  objc_msgSend(v13, "setRole:", 1);
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_dismissSingleLevelViewController, 64);

  return v13;
}

- (void)dismissSingleLevelViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[SPUIUnifiedFieldViewController searchNavigationController](self, "searchNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  -[SPUIUnifiedFieldViewController searchNavigationController](self, "searchNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= 1)
    -[SPUIUnifiedFieldViewController setBackButton:](self, "setBackButton:", 0);
}

- (void)setBackButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (UIView)originalLeftView
{
  return (UIView *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setOriginalLeftView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (UIView)fakeOriginalLeftView
{
  return (UIView *)objc_getProperty(self, a2, 1072, 1);
}

- (BOOL)tryToLayoutForBadFrame
{
  return self->_tryToLayoutForBadFrame;
}

- (void)setTryToLayoutForBadFrame:(BOOL)a3
{
  self->_tryToLayoutForBadFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeOriginalLeftView, 0);
  objc_storeStrong((id *)&self->_fakeTextField, 0);
  objc_storeStrong((id *)&self->_originalLeftView, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_topBlur, 0);
  objc_storeStrong((id *)&self->_keyboardVisualEffectView, 0);
  objc_storeStrong((id *)&self->_swipeRecognizer, 0);
  objc_storeStrong((id *)&self->_searchHeader, 0);
  objc_storeStrong((id *)&self->_searchNavigationController, 0);
  objc_storeStrong((id *)&self->_searchProtectorLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
