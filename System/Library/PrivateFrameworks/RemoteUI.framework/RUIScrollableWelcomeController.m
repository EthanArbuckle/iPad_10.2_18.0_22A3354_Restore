@implementation RUIScrollableWelcomeController

- (int64_t)navigationBarScrollToEdgeBehavior
{
  return 0;
}

- (void)_layoutButtonTray
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RUIScrollableWelcomeController;
  -[RUIScrollableWelcomeController _layoutButtonTray](&v5, sel__layoutButtonTray);
  if (-[RUIScrollableWelcomeController shouldUseCustomButtonTray](self, "shouldUseCustomButtonTray"))
  {
    -[RUIScrollableWelcomeController buttonTray](self, "buttonTray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stackView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlignment:", 3);

  }
}

- (void)_setupScrollView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RUIScrollViewWeakLayoutObserver *v9;
  RUIScrollViewWeakLayoutObserver *scrollViewLayoutObserver;
  RUIScrollViewWeakLayoutObserver *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
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
  _QWORD v43[5];

  v43[4] = *MEMORY[0x24BDAC8D0];
  -[RUIScrollableWelcomeController contentController](self, "contentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController addChildViewController:](self, "addChildViewController:", v3);

  -[RUIScrollableWelcomeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController contentController](self, "contentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v6);

  -[RUIScrollableWelcomeController contentController](self, "contentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = -[RUIScrollViewWeakLayoutObserver initWithLayoutObserver:]([RUIScrollViewWeakLayoutObserver alloc], "initWithLayoutObserver:", self);
  scrollViewLayoutObserver = self->_scrollViewLayoutObserver;
  self->_scrollViewLayoutObserver = v9;

  v11 = self->_scrollViewLayoutObserver;
  -[RUIScrollableWelcomeController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setLayoutObserver:", v11);

  -[RUIScrollableWelcomeController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController contentController](self, "contentController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v17);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v18) = 1144750080;
  objc_msgSend(v42, "setPriority:", v18);
  -[RUIScrollableWelcomeController contentController](self, "contentController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "didMoveToParentViewController:", self);

  v34 = (void *)MEMORY[0x24BDD1628];
  -[RUIScrollableWelcomeController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController contentController](self, "contentController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v36;
  -[RUIScrollableWelcomeController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController contentController](self, "contentController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v21;
  -[RUIScrollableWelcomeController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController contentController](self, "contentController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v27;
  v43[3] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v28);

  -[RUIScrollableWelcomeController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController buttonTray](self, "buttonTray");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v30);

  -[RUIScrollableWelcomeController _layoutButtonTray](self, "_layoutButtonTray");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RUIScrollableWelcomeController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[RUIScrollableWelcomeController _updateParentPreferredContentSize](self, "_updateParentPreferredContentSize");
}

- (void)_updateParentPreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v12[6];

  -[RUIScrollableWelcomeController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  -[RUIScrollableWelcomeController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v8 = v5 + v7;
  -[RUIScrollableWelcomeController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentInset");
  v11 = v8 + v10;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__RUIScrollableWelcomeController__updateParentPreferredContentSize__block_invoke;
  v12[3] = &unk_24C297920;
  v12[4] = self;
  *(double *)&v12[5] = v11;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v12);
}

void __67__RUIScrollableWelcomeController__updateParentPreferredContentSize__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v3 = v2;
  v4 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredContentSize:", v3, v4);

}

- (void)_inlineButtonTray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  -[RUIScrollableWelcomeController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[RUIScrollableWelcomeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[RUIScrollableWelcomeController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIScrollableWelcomeController tabBarController](self, "tabBarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RUIScrollableWelcomeController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  v27 = v7;
  v23 = (void *)MEMORY[0x24BDD1628];
  -[RUIScrollableWelcomeController buttonTray](self, "buttonTray");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v7, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v30;
  -[RUIScrollableWelcomeController buttonTray](self, "buttonTray");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v24;
  -[RUIScrollableWelcomeController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v15;
  -[RUIScrollableWelcomeController buttonTray](self, "buttonTray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIScrollableWelcomeController scrollView](self, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v21);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RUIScrollableWelcomeController;
  -[RUIScrollableWelcomeController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (UIViewController)contentController
{
  return self->_contentController;
}

- (void)setContentController:(id)a3
{
  objc_storeStrong((id *)&self->_contentController, a3);
}

- (UIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_contentScrollView, a3);
}

- (BOOL)shouldUseCustomButtonTray
{
  return self->_shouldUseCustomButtonTray;
}

- (void)setShouldUseCustomButtonTray:(BOOL)a3
{
  self->_shouldUseCustomButtonTray = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_scrollViewLayoutObserver, 0);
}

@end
