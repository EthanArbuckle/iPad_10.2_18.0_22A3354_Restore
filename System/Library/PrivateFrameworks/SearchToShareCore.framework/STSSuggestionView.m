@implementation STSSuggestionView

- (STSSuggestionView)init
{
  STSSuggestionView *v2;
  STSSuggestionView *v3;
  id v4;
  uint64_t v5;
  UITableView *tableView;
  UITableView *v7;
  void *v8;
  STSSuggestionFooter *v9;
  STSSuggestionFooter *footerView;
  void *v11;
  id v12;
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)STSSuggestionView;
  v2 = -[STSSuggestionView init](&v28, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STSSuggestionView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v5 = objc_msgSend(v4, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    tableView = v3->_tableView;
    v3->_tableView = (UITableView *)v5;

    v7 = v3->_tableView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_defaultBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UITableView setCellLayoutMarginsFollowReadableWidth:](v3->_tableView, "setCellLayoutMarginsFollowReadableWidth:", 1);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v3->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = objc_alloc_init(STSSuggestionFooter);
    footerView = v3->_footerView;
    v3->_footerView = v9;

    -[STSSuggestionFooter sizeToFit](v3->_footerView, "sizeToFit");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v3, sel__handleLogoTap_);
    -[STSSuggestionFooter addGestureRecognizer:](v3->_footerView, "addGestureRecognizer:", v11);
    -[STSSuggestionFooter setUserInteractionEnabled:](v3->_footerView, "setUserInteractionEnabled:", 1);
    v12 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[STSSuggestionFooter bounds](v3->_footerView, "bounds");
    v13 = (void *)objc_msgSend(v12, "initWithFrame:");
    -[UITableView setTableFooterView:](v3->_tableView, "setTableFooterView:", v13);
    -[STSSuggestionView addSubview:](v3, "addSubview:", v3->_tableView);
    -[STSSuggestionView addSubview:](v3, "addSubview:", v3->_footerView);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView leadingAnchor](v3->_tableView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSuggestionView leadingAnchor](v3, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v17);

    -[UITableView trailingAnchor](v3->_tableView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSuggestionView trailingAnchor](v3, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v20);

    -[UITableView topAnchor](v3->_tableView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSuggestionView topAnchor](v3, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v23);

    -[UITableView bottomAnchor](v3->_tableView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSuggestionView bottomAnchor](v3, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v26);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v14);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[STSSuggestionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITableView setFrame:](self->_tableView, "setFrame:");
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4 + self->_contentInset.left, v6 + self->_contentInset.top, v8 - (self->_contentInset.left + self->_contentInset.right), v10 - (self->_contentInset.top + self->_contentInset.bottom));
  -[STSSuggestionView _updateFooterOrigin](self, "_updateFooterOrigin");
}

- (void)setOverlayView:(id)a3
{
  -[STSSuggestionView setOverlayView:animated:](self, "setOverlayView:animated:", a3, 0);
}

- (void)setOverlayView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v7;
  UIView **p_overlayView;
  UIView *overlayView;
  UIView *v10;
  uint64_t v11;
  UIView *v12;
  void (**v13)(_QWORD);
  UIView *v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  UIView *v20;
  STSSuggestionView *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  STSSuggestionView *v26;
  UIView *v27;

  v4 = a4;
  v7 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  if (overlayView != v7)
  {
    v10 = overlayView;
    objc_storeStrong((id *)&self->_overlayView, a3);
    -[STSSuggestionView addSubview:](self, "addSubview:", *p_overlayView);
    -[STSSuggestionView setNeedsLayout](self, "setNeedsLayout");
    -[STSSuggestionView layoutIfNeeded](self, "layoutIfNeeded");
    -[UIView setAlpha:](*p_overlayView, "setAlpha:", 0.0);
    v11 = MEMORY[0x24BDAC760];
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __45__STSSuggestionView_setOverlayView_animated___block_invoke;
    v25 = &unk_24E745D30;
    v26 = self;
    v12 = v10;
    v27 = v12;
    v13 = (void (**)(_QWORD))MEMORY[0x227672A18](&v22);
    v16 = v11;
    v17 = 3221225472;
    v18 = __45__STSSuggestionView_setOverlayView_animated___block_invoke_2;
    v19 = &unk_24E7461A8;
    v20 = v12;
    v21 = self;
    v14 = v12;
    v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x227672A18](&v16);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v13, v15, 0.2, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
    }
    else
    {
      v13[2](v13);
      v15[2](v15, 1);
    }

  }
}

uint64_t __45__STSSuggestionView_setOverlayView_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __45__STSSuggestionView_setOverlayView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 432));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  UIEdgeInsets *p_contentInset;

  p_contentInset = &self->_contentInset;
  self->_contentInset = a3;
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", p_contentInset->top, p_contentInset->left, p_contentInset->bottom, p_contentInset->right);
  -[STSSuggestionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFooterOffset:(CGPoint)a3
{
  if (self->_footerOffset.x != a3.x || self->_footerOffset.y != a3.y)
  {
    self->_footerOffset = a3;
    -[STSSuggestionView _updateFooterOrigin](self, "_updateFooterOrigin");
  }
}

- (BOOL)isShowingFooter
{
  return -[STSSuggestionFooter isHidden](self->_footerView, "isHidden") ^ 1;
}

- (void)setShowingFooter:(BOOL)a3
{
  -[STSSuggestionFooter setHidden:](self->_footerView, "setHidden:", !a3);
}

- (CGSize)footerSize
{
  double v2;
  double v3;
  CGSize result;

  -[STSSuggestionFooter sizeThatFits:](self->_footerView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_handleLogoTap:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[STSSuggestionView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[STSSuggestionView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestionViewDidTapLogo:", self);

  }
}

- (void)updateFooterImage:(id)a3
{
  -[STSSuggestionFooter setSearchProviderImage:](self->_footerView, "setSearchProviderImage:", a3);
}

- (void)_updateFooterOrigin
{
  -[STSSuggestionFooter frame](self->_footerView, "frame");
  -[STSSuggestionFooter setFrame:](self->_footerView, "setFrame:", self->_footerOffset.x, self->_footerOffset.y);
}

- (void)_updateContentInsets
{
  UIEdgeInsets *p_contentInset;
  CGRect v4;

  p_contentInset = &self->_contentInset;
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", self->_contentInset.top, 0.0, self->_contentInset.bottom, 0.0);
  -[STSSuggestionFooter bounds](self->_footerView, "bounds");
  CGRectGetHeight(v4);
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", p_contentInset->top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGPoint)footerOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_footerOffset.x;
  y = self->_footerOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (STSSuggestionViewDelegate)delegate
{
  return (STSSuggestionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
