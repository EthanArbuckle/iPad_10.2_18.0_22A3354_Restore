@implementation UIKBAutoFillTestGroundTruthGenerationViewController

- (UIKBAutoFillTestGroundTruthGenerationViewController)initWithAutoFillTestViewController:(id)a3
{
  id v5;
  UIKBAutoFillTestGroundTruthGenerationViewController *v6;
  UIKBAutoFillTestGroundTruthGenerationViewController *v7;
  UIKBAutoFillTestExpectedResult *v8;
  UIKBAutoFillTestExpectedResult *expectedResult;
  UIKBAutoFillTestGroundTruthGenerationViewController *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBAutoFillTestGroundTruthGenerationViewController;
  v6 = -[UIViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_testViewController, a3);
    v8 = objc_alloc_init(UIKBAutoFillTestExpectedResult);
    expectedResult = v7->_expectedResult;
    v7->_expectedResult = v8;

    v10 = v7;
  }

  return v7;
}

- (void)_enumerateSubviewsOfRootView:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, char *, _WORD *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;

  v5 = a3;
  v6 = (void (**)(id, void *, char *, _WORD *))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v5);
  while (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);
    v11 = 0;
    v6[2](v6, v9, (char *)&v11 + 1, &v11);
    if ((_BYTE)v11)
    {

      break;
    }
    if (!HIBYTE(v11))
    {
      objc_msgSend(v9, "subviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v10);

    }
  }

}

- (void)viewDidLoad
{
  UIBarButtonItem *v3;
  void *v4;
  void *v5;
  void *v6;
  UIScrollView *v7;
  UIScrollView *v8;
  UIScrollView *scrollView;
  double v10;
  double v11;
  double v12;
  double v13;
  UIKBAutoFillTestTaggerView *v14;
  UIKBAutoFillTestTaggerView *taggerView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIKBAutoFillTestTagRequest *v25;
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
  objc_super v47;
  UIKBAutoFillTestTagRequest *v48;
  _QWORD v49[10];

  v49[8] = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)UIKBAutoFillTestGroundTruthGenerationViewController;
  -[UIViewController viewDidLoad](&v47, sel_viewDidLoad);
  -[UIViewController setTitle:](self, "setTitle:", CFSTR("AutoFill Test Case"));
  v3 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelBarButtonItemAction_);
  -[UIViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor whiteColor](UIColor, "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v7 = [UIScrollView alloc];
  objc_msgSend(v5, "bounds");
  v8 = -[UIScrollView initWithFrame:](v7, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", self->_scrollView);
  -[UIViewController addChildViewController:](self, "addChildViewController:", self->_testViewController);
  -[UIViewController view](self->_testViewController, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frame");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v46, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[UIView addSubview:](self->_scrollView, "addSubview:", v46);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v11, v13);
  -[UIViewController didMoveToParentViewController:](self->_testViewController, "didMoveToParentViewController:", self);
  v14 = -[UIKBAutoFillTestTaggerView initWithFrame:]([UIKBAutoFillTestTaggerView alloc], "initWithFrame:", 0.0, 0.0, 320.0, 280.0);
  taggerView = self->_taggerView;
  self->_taggerView = v14;

  -[UIKBAutoFillTestTaggerView setDelegate:](self->_taggerView, "setDelegate:", self);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_taggerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", self->_taggerView);
  v34 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](self->_scrollView, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v42;
  -[UIView leadingAnchor](self->_scrollView, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v39;
  -[UIView trailingAnchor](self->_scrollView, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v35;
  -[UIView bottomAnchor](self->_scrollView, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_taggerView, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v31;
  -[UIView leadingAnchor](self->_taggerView, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v28;
  -[UIView trailingAnchor](self->_taggerView, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  v38 = v5;
  objc_msgSend(v5, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v18;
  -[UIView bottomAnchor](self->_taggerView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v21;
  -[UIView heightAnchor](self->_taggerView, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", 280.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v24);

  v25 = -[UIKBAutoFillTestTagRequest initWithRequestType:view:]([UIKBAutoFillTestTagRequest alloc], "initWithRequestType:view:", 0, 0);
  v48 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBAutoFillTestTaggerView setTagRequests:](self->_taggerView, "setTagRequests:", v26);

}

- (void)_cancelBarButtonItemAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "autoFillTestGroundTruthGenerationViewController:didFinishWithResult:", self, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  UIKBAutoFillTestTagRequest *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKBAutoFillTestGroundTruthGenerationViewController;
  -[UIViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIKBAutoFillTestTagRequest initWithRequestType:view:]([UIKBAutoFillTestTagRequest alloc], "initWithRequestType:view:", 0, 0);
  objc_msgSend(v4, "addObject:", v5);

  -[UIViewController view](self->_testViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__UIKBAutoFillTestGroundTruthGenerationViewController_viewDidAppear___block_invoke;
  v10[3] = &unk_1E16CC9B0;
  v11 = v4;
  v8 = v4;
  -[UIKBAutoFillTestGroundTruthGenerationViewController _enumerateSubviewsOfRootView:usingBlock:](self, "_enumerateSubviewsOfRootView:usingBlock:", v6, v10);

  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __69__UIKBAutoFillTestGroundTruthGenerationViewController_viewDidAppear___block_invoke_2;
  v9[3] = &unk_1E16CC9D8;
  v9[4] = self;
  objc_msgSend(v8, "sortUsingComparator:", v9);
  -[UIKBAutoFillTestTaggerView setTagRequests:](self->_taggerView, "setTagRequests:", v8);

}

void __69__UIKBAutoFillTestGroundTruthGenerationViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  UIKBAutoFillTestTagRequest *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "setScrollEnabled:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v13, "frame");
      v4 = v3;
      v6 = v5;
      v8 = v7;
      v10 = v9;
      if ((objc_msgSend(v13, "isHidden") & 1) == 0)
      {
        v14.origin.x = v4;
        v14.origin.y = v6;
        v14.size.width = v8;
        v14.size.height = v10;
        if (CGRectGetWidth(v14) >= 15.0)
        {
          v15.origin.x = v4;
          v15.origin.y = v6;
          v15.size.width = v8;
          v15.size.height = v10;
          if (CGRectGetHeight(v15) >= 15.0)
          {
            v11 = *(void **)(a1 + 32);
            v12 = -[UIKBAutoFillTestTagRequest initWithRequestType:view:]([UIKBAutoFillTestTagRequest alloc], "initWithRequestType:view:", 1, v13);
            objc_msgSend(v11, "addObject:", v12);

          }
        }
      }
    }
  }

}

uint64_t __69__UIKBAutoFillTestGroundTruthGenerationViewController_viewDidAppear___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "requestType");
  v8 = objc_msgSend(v6, "requestType");
  if (v7 == v8)
  {
    objc_msgSend(v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v9, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertPoint:fromView:", v16, v13, v15);
    v18 = v17;

    objc_msgSend(*(id *)(a1 + 32), "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v10, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertPoint:fromView:", v24, v21, v23);
    v26 = v25;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "compare:", v28);

  }
  else
  {
    v30 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v9, "compare:", v10);
  }

  return v29;
}

- (void)_moveTaggerHighlightViewOverView:(id)a3
{
  id v4;
  UIView *v5;
  UIView *highlightView;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *highlightBox;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  UIScrollView *scrollView;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[9];
  _QWORD v42[5];

  v4 = a3;
  if (!self->_highlightView)
  {
    v5 = objc_alloc_init(UIView);
    highlightView = self->_highlightView;
    self->_highlightView = v5;

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.2, 0.8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v7);

    -[UIView layer](self->_highlightView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 1);

    v9 = objc_alloc_init(UIView);
    highlightBox = self->_highlightBox;
    self->_highlightBox = v9;

    +[UIColor blackColor](UIColor, "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_highlightBox, "setBackgroundColor:", v11);

    v12 = *MEMORY[0x1E0CD2C50];
    -[UIView layer](self->_highlightBox, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", v12);

    -[UIView layer](self->_highlightBox, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 8.0);

    -[UIView layer](self->_highlightBox, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    v16 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](self->_highlightBox, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerCurve:", v16);

    -[UIView addSubview:](self->_highlightView, "addSubview:", self->_highlightBox);
  }
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v19 = v18;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  -[UIView setFrame:](self->_highlightView, "setFrame:", 0.0, 0.0, v19, v20);
  scrollView = self->_scrollView;
  objc_msgSend(v4, "frame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v4, "superview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:fromView:](scrollView, "convertRect:fromView:", v30, v23, v25, v27, v29);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[UIView superview](self->_highlightView, "superview");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = MEMORY[0x1E0C809B0];
  if (!v39)
  {
    -[UIView addSubview:](self->_scrollView, "addSubview:", self->_highlightView);
    -[UIView setFrame:](self->_highlightBox, "setFrame:", v32, v34, v36, v38);
    -[UIView setAlpha:](self->_highlightView, "setAlpha:", 0.0);
    v42[0] = v40;
    v42[1] = 3221225472;
    v42[2] = __88__UIKBAutoFillTestGroundTruthGenerationViewController__moveTaggerHighlightViewOverView___block_invoke;
    v42[3] = &unk_1E16B1B28;
    v42[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 65540, v42, 0, 0.25, 0.0);
  }
  v41[0] = v40;
  v41[1] = 3221225472;
  v41[2] = __88__UIKBAutoFillTestGroundTruthGenerationViewController__moveTaggerHighlightViewOverView___block_invoke_2;
  v41[3] = &unk_1E16B20D8;
  v41[4] = self;
  *(double *)&v41[5] = v32;
  *(double *)&v41[6] = v34;
  *(double *)&v41[7] = v36;
  *(double *)&v41[8] = v38;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 131076, v41, 0, 0.25, 0.0);
  -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1, v32, v34, v36, v38);

}

uint64_t __88__UIKBAutoFillTestGroundTruthGenerationViewController__moveTaggerHighlightViewOverView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 1.0);
}

uint64_t __88__UIKBAutoFillTestGroundTruthGenerationViewController__moveTaggerHighlightViewOverView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_removeTaggerHighlightView
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__UIKBAutoFillTestGroundTruthGenerationViewController__removeTaggerHighlightView__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __81__UIKBAutoFillTestGroundTruthGenerationViewController__removeTaggerHighlightView__block_invoke_2;
  v2[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 131076, v3, v2, 0.25, 0.0);
}

uint64_t __81__UIKBAutoFillTestGroundTruthGenerationViewController__removeTaggerHighlightView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 0.0);
}

uint64_t __81__UIKBAutoFillTestGroundTruthGenerationViewController__removeTaggerHighlightView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "removeFromSuperview");
}

- (void)taggerViewDidFinish:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "autoFillTestGroundTruthGenerationViewController:didFinishWithResult:", self, self->_expectedResult);

}

- (void)taggerView:(id)a3 willTagRequest:(id)a4
{
  uint64_t v5;
  id v6;

  objc_msgSend(a4, "view", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v5)
    -[UIKBAutoFillTestGroundTruthGenerationViewController _moveTaggerHighlightViewOverView:](self, "_moveTaggerHighlightViewOverView:", v5);
  else
    -[UIKBAutoFillTestGroundTruthGenerationViewController _removeTaggerHighlightView](self, "_removeTaggerHighlightView");

}

- (int64_t)taggerView:(id)a3 selectedTypeForFormRequest:(id)a4
{
  return -[UIKBAutoFillTestExpectedResult formType](self->_expectedResult, "formType", a3, a4);
}

- (int64_t)taggerView:(id)a3 selectedTypeForTextFieldRequest:(id)a4
{
  UIKBAutoFillTestExpectedResult *expectedResult;
  void *v5;
  int64_t v6;

  expectedResult = self->_expectedResult;
  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKBAutoFillTestExpectedResult typeForTextFieldWithTag:](expectedResult, "typeForTextFieldWithTag:", objc_msgSend(v5, "tag"));

  return v6;
}

- (void)taggerView:(id)a3 didTagFormRequest:(id)a4 withSelectedType:(int64_t)a5
{
  -[UIKBAutoFillTestExpectedResult setFormType:](self->_expectedResult, "setFormType:", a5, a4);
}

- (void)taggerView:(id)a3 didTagTextFieldRequest:(id)a4 withSelectedType:(int64_t)a5
{
  UIKBAutoFillTestExpectedResult *expectedResult;
  id v7;

  expectedResult = self->_expectedResult;
  objc_msgSend(a4, "view", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBAutoFillTestExpectedResult setType:forTextFieldWithTag:](expectedResult, "setType:forTextFieldWithTag:", a5, objc_msgSend(v7, "tag"));

}

- (UIKBAutoFillTestGroundTruthGenerationViewControllerDelegate)delegate
{
  return (UIKBAutoFillTestGroundTruthGenerationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIKBAutoFillTestViewController)testViewController
{
  return self->_testViewController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_highlightBox, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_taggerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_expectedResult, 0);
  objc_storeStrong((id *)&self->_testViewController, 0);
}

@end
