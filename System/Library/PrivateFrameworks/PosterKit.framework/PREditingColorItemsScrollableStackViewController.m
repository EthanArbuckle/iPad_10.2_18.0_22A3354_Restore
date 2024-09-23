@implementation PREditingColorItemsScrollableStackViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditingColorItemsScrollableStackViewController;
  -[PREditingColorItemsScrollableStackViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PREditingColorItemsScrollableStackViewController setNeedsScrollToSelectedItem:](self, "setNeedsScrollToSelectedItem:", 1);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditingColorItemsScrollableStackViewController;
  -[PREditingColorItemsViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PREditingColorItemsScrollableStackViewController updateInteritemSpacingIfNeeded](self, "updateInteritemSpacingIfNeeded");
  if (-[PREditingColorItemsScrollableStackViewController needsScrollToSelectedItem](self, "needsScrollToSelectedItem"))
  {
    -[PREditingColorItemsScrollableStackViewController stackView](self, "stackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    -[PREditingColorItemsScrollableStackViewController scrollToSelectedItemAnimated:](self, "scrollToSelectedItemAnimated:", 0);
    -[PREditingColorItemsScrollableStackViewController setNeedsScrollToSelectedItem:](self, "setNeedsScrollToSelectedItem:", 0);
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

  -[PREditingColorItemsScrollableStackViewController view](self, "view");
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
  -[PREditingColorItemsScrollableStackViewController estimatedHeight](self, "estimatedHeight");
  objc_msgSend(v32, "constraintEqualToConstant:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v31;
  -[UIScrollView leadingAnchor](v12, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItemsScrollableStackViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v27;
  -[UIScrollView trailingAnchor](v12, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItemsScrollableStackViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v14;
  -[UIScrollView bottomAnchor](v12, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItemsScrollableStackViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v18;
  -[UIScrollView topAnchor](v12, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItemsScrollableStackViewController view](self, "view");
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

  -[PREditingColorItemsScrollableStackViewController view](self, "view");
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
  double *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  v3 = a3;
  v5 = (double *)MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PREditingColorItemsViewController selectedColorItem](self, "selectedColorItem");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItemsViewController selectedColorItemView](self, "selectedColorItemView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItemsScrollableStackViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  if (objc_msgSend(v22, "isFromUIKitColorPicker")
    && (-[PREditingColorItemsViewController configuration](self, "configuration"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "colorWellDisplayMode"),
        v11,
        v12 == 1))
  {
    -[PREditingColorItemsScrollableStackViewController stackView](self, "stackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14 - (v10 + -31.0);
  }
  else
  {
    if (!v7)
    {
      v15 = *v5;
      goto LABEL_8;
    }
    objc_msgSend(v7, "frame");
    objc_msgSend(v7, "bounds");
    objc_msgSend(v8, "contentSize");
    objc_msgSend(v7, "frame");
    v17 = v16;
    -[PREditingColorItemsScrollableStackViewController scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v19 = v18;
    objc_msgSend(v7, "bounds");
    v15 = v17 + (v19 - v20) * -0.5;
  }

LABEL_8:
  -[PREditingColorItemsScrollableStackViewController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentOffset:animated:", v3, v15, v6);

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
