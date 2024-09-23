@implementation PREditingContentStyleItemsScrollableStackViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditingContentStyleItemsScrollableStackViewController;
  -[PREditingContentStyleItemsScrollableStackViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PREditingContentStyleItemsScrollableStackViewController setNeedsScrollToSelectedItem:](self, "setNeedsScrollToSelectedItem:", 1);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditingContentStyleItemsScrollableStackViewController;
  -[PREditingContentStyleItemsViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PREditingContentStyleItemsScrollableStackViewController updateInteritemSpacingIfNeeded](self, "updateInteritemSpacingIfNeeded");
  if (-[PREditingContentStyleItemsScrollableStackViewController needsScrollToSelectedItem](self, "needsScrollToSelectedItem"))
  {
    -[PREditingContentStyleItemsScrollableStackViewController stackView](self, "stackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    -[PREditingContentStyleItemsScrollableStackViewController scrollToSelectedItemAnimated:](self, "scrollToSelectedItemAnimated:", 0);
    -[PREditingContentStyleItemsScrollableStackViewController setNeedsScrollToSelectedItem:](self, "setNeedsScrollToSelectedItem:", 0);
  }
}

- (void)layoutWithItemViews:(id)a3
{
  objc_class *v4;
  id v5;
  UIStackView *v6;
  UIStackView *stackView;
  UIStackView *v8;
  id v9;
  UIScrollView *v10;
  UIScrollView *scrollView;
  UIScrollView *v12;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIStackView *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[11];

  v46[9] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3CA8];
  v5 = a3;
  v6 = (UIStackView *)objc_msgSend([v4 alloc], "initWithArrangedSubviews:", v5);

  -[UIStackView setAxis:](v6, "setAxis:", 0);
  -[UIStackView setAlignment:](v6, "setAlignment:", 1);
  -[UIStackView setSpacing:](v6, "setSpacing:", 14.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  stackView = self->_stackView;
  self->_stackView = v6;
  v8 = v6;

  v9 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v10 = (UIScrollView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIScrollView setContentInset:](v10, "setContentInset:", 0.0, 31.0, 0.0, 31.0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v10, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](v10, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setClipsToBounds:](v10, "setClipsToBounds:", 0);
  -[UIScrollView addSubview:](v10, "addSubview:", v8);
  scrollView = self->_scrollView;
  self->_scrollView = v10;
  v12 = v10;

  -[PREditingContentStyleItemsScrollableStackViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);

  -[UIStackView leadingAnchor](v8, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leadingAnchor](v12, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v43;
  -[UIStackView trailingAnchor](v8, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView trailingAnchor](v12, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v39;
  v42 = v8;
  -[UIStackView topAnchor](v8, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](v12, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v36;
  -[UIStackView bottomAnchor](v8, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](v12, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v33;
  -[UIScrollView heightAnchor](v12, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsScrollableStackViewController estimatedHeight](self, "estimatedHeight");
  objc_msgSend(v32, "constraintEqualToConstant:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v31;
  -[UIScrollView leadingAnchor](v12, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsScrollableStackViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v27;
  -[UIScrollView trailingAnchor](v12, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsScrollableStackViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v14;
  -[UIScrollView bottomAnchor](v12, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsScrollableStackViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v18;
  -[UIScrollView topAnchor](v12, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsScrollableStackViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[8] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v26);
}

- (void)updateInteritemSpacingIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PREditingContentStyleItemsScrollableStackViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = (v5 + -326.0) / 5.0;
  -[UIStackView spacing](self->_stackView, "spacing");
  if (v6 != v7)
  {
    -[UIStackView setSpacing:](self->_stackView, "setSpacing:", v6);
    -[UIStackView setNeedsLayout](self->_stackView, "setNeedsLayout");
  }
}

- (void)scrollToSelectedItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  double v20;
  double Width;
  double v22;
  double v23;
  id v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  v5 = MEMORY[0x1E0C9D538];
  -[PREditingContentStyleItemsViewController selectedContentStyleItemView](self, "selectedContentStyleItemView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsScrollableStackViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PREditingContentStyleItemsViewController selectedContentStyleCoordinator](self, "selectedContentStyleCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsViewController uiKitColorPickerStyleCoordinator](self, "uiKitColorPickerStyleCoordinator");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16 && v15 == (void *)v16)
  {
    -[PREditingContentStyleItemsViewController colorWellView](self, "colorWellView");
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v18;
  }
  else
  {
    v19 = v24;
  }
  v20 = *(double *)(v5 + 8);
  v25 = v19;
  if (v19)
  {
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v14;
    Width = CGRectGetWidth(v26);
    objc_msgSend(v25, "bounds");
    v22 = Width - CGRectGetWidth(v27);
    objc_msgSend(v25, "frame");
    v23 = CGRectGetMinX(v28) + v22 * -0.5;
  }
  else
  {
    v23 = -31.0;
  }
  objc_msgSend(v6, "setContentOffset:animated:", v3, v23, v20);

}

- (double)estimatedHeight
{
  return 44.0;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (BOOL)needsScrollToSelectedItem
{
  return self->_needsScrollToSelectedItem;
}

- (void)setNeedsScrollToSelectedItem:(BOOL)a3
{
  self->_needsScrollToSelectedItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
