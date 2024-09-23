@implementation PKPassPaymentApplicationView

- (PKPassPaymentApplicationView)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"));
  return -[PKPassPaymentApplicationView init](self, "init");
}

- (PKPassPaymentApplicationView)initWithFrame:(CGRect)a3
{
  return -[PKPassPaymentApplicationView initWithPass:](self, "initWithPass:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPassPaymentApplicationView)initWithPass:(id)a3
{
  id v5;
  PKPassPaymentApplicationView *v6;
  PKPassPaymentApplicationView *v7;
  id *p_pass;
  uint64_t v9;
  PKPaymentService *paymentService;
  PKPassPaymentSummaryHeaderView *v11;
  PKPassPaymentSummaryHeaderView *headerView;
  PKPassPaymentSummaryHeaderView *v13;
  void *v14;
  UIView *v15;
  UIView *horizontalSeparator;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  PKPaymentService *v24;
  void *v25;
  uint64_t v26;
  PKPaymentApplication *selectedApplication;
  PKPaymentApplication *v28;
  uint64_t v29;
  PKPaymentApplication *v30;
  uint64_t v31;
  NSArray *paymentApplications;
  void *v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  UISegmentedControl *segmentedControl;
  id v46;
  objc_super v47;

  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKPassPaymentApplicationView;
  v6 = -[PKPassPaymentApplicationView initWithFrame:](&v47, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_pass = (id *)&v6->_pass;
    objc_storeStrong((id *)&v6->_pass, a3);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", 0);
    paymentService = v7->_paymentService;
    v7->_paymentService = (PKPaymentService *)v9;

    v11 = objc_alloc_init(PKPassPaymentSummaryHeaderView);
    headerView = v7->_headerView;
    v7->_headerView = v11;

    v13 = v7->_headerView;
    PKLocalizedPaymentString(CFSTR("PAYMENT_ACCOUNT_SUMMARY_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassPaymentSummaryHeaderView setPrimaryTitle:](v13, "setPrimaryTitle:", v14);

    -[PKPassPaymentApplicationView addSubview:](v7, "addSubview:", v7->_headerView);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    horizontalSeparator = v7->_horizontalSeparator;
    v7->_horizontalSeparator = v15;

    v17 = v7->_horizontalSeparator;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[PKPassPaymentApplicationView addSubview:](v7, "addSubview:", v7->_horizontalSeparator);
    v7->_showHeader = 1;
    objc_msgSend(*p_pass, "devicePaymentApplications");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceLayoutDirection") == 0;

    objc_msgSend(v5, "sortedPaymentApplications:ascending:", v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v7->_paymentService;
    objc_msgSend(v5, "uniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentService defaultPaymentApplicationForPassUniqueIdentifier:](v24, "defaultPaymentApplicationForPassUniqueIdentifier:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    selectedApplication = v7->_selectedApplication;
    v7->_selectedApplication = (PKPaymentApplication *)v26;

    v28 = v7->_selectedApplication;
    if (!v28 || (-[PKPaymentApplication supportsContactlessPayment](v28, "supportsContactlessPayment") & 1) == 0)
    {
      objc_msgSend(*p_pass, "devicePrimaryContactlessPaymentApplication");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v7->_selectedApplication;
      v7->_selectedApplication = (PKPaymentApplication *)v29;

    }
    if (objc_msgSend(v23, "count"))
    {
      v46 = v5;
      v31 = objc_msgSend(v23, "copy");
      paymentApplications = v7->_paymentApplications;
      v7->_paymentApplications = (NSArray *)v31;

      -[PKPaymentApplication applicationIdentifier](v7->_selectedApplication, "applicationIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (-[NSArray count](v7->_paymentApplications, "count"))
      {
        v35 = 0;
        v36 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          -[NSArray objectAtIndexedSubscript:](v7->_paymentApplications, "objectAtIndexedSubscript:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "applicationIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", v33);

          if (v39)
            v36 = v35;
          objc_msgSend(v37, "displayName");
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = (void *)v40;
          if (v40)
            v42 = (const __CFString *)v40;
          else
            v42 = &stru_1E3E7D690;
          objc_msgSend(v34, "addObject:", v42);

          ++v35;
        }
        while (v35 < -[NSArray count](v7->_paymentApplications, "count"));
      }
      else
      {
        v36 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v34);
      segmentedControl = v7->_segmentedControl;
      v7->_segmentedControl = (UISegmentedControl *)v43;

      -[UISegmentedControl setSelectedSegmentIndex:](v7->_segmentedControl, "setSelectedSegmentIndex:", v36);
      -[UISegmentedControl setExclusiveTouch:](v7->_segmentedControl, "setExclusiveTouch:", 1);
      -[UISegmentedControl addTarget:action:forControlEvents:](v7->_segmentedControl, "addTarget:action:forControlEvents:", v7, sel__selectedApplicationDidChange_, 4096);
      -[PKPassPaymentApplicationView addSubview:](v7, "addSubview:", v7->_segmentedControl);

      v5 = v46;
    }

  }
  return v7;
}

- (void)setShowHeader:(BOOL)a3
{
  self->_showHeader = a3;
  if (a3)
  {
    -[PKPassPaymentApplicationView addSubview:](self, "addSubview:", self->_headerView);
    -[PKPassPaymentApplicationView addSubview:](self, "addSubview:", self->_horizontalSeparator);
  }
  else
  {
    -[PKPassPaymentSummaryHeaderView removeFromSuperview](self->_headerView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_horizontalSeparator, "removeFromSuperview");
  }
  -[PKPassPaymentApplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_selectedApplicationDidChange:(id)a3
{
  PKPaymentApplication *v5;
  PKPaymentApplication *v6;
  PKPaymentApplication *selectedApplication;
  PKPassPaymentApplicationViewDelegate **p_delegate;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  PKPaymentApplication *v14;
  _QWORD v15[5];
  PKPaymentApplication *v16;

  v5 = self->_selectedApplication;
  -[NSArray objectAtIndexedSubscript:](self->_paymentApplications, "objectAtIndexedSubscript:", objc_msgSend(a3, "selectedSegmentIndex"));
  v6 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
  selectedApplication = self->_selectedApplication;
  self->_selectedApplication = v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained((id *)p_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[UISegmentedControl setUserInteractionEnabled:](self->_segmentedControl, "setUserInteractionEnabled:", 0);
      v13 = objc_loadWeakRetained((id *)p_delegate);
      v14 = self->_selectedApplication;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62__PKPassPaymentApplicationView__selectedApplicationDidChange___block_invoke;
      v15[3] = &unk_1E3E619E0;
      v15[4] = self;
      v16 = v5;
      objc_msgSend(v13, "paymentApplicationView:didSelectApplication:completion:", self, v14, v15);

    }
  }

}

uint64_t __62__PKPassPaymentApplicationView__selectedApplicationDidChange___block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 472), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setSelectedSegmentIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "indexOfObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472)));
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setUserInteractionEnabled:", 1);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double Width;
  double v6;
  double v7;
  PKPassPaymentSummaryHeaderView *headerView;
  UIView *horizontalSeparator;
  double v10;
  _BOOL4 showHeader;
  double v12;
  UISegmentedControl *segmentedControl;
  double v14;
  double v15;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)PKPassPaymentApplicationView;
  -[PKPassPaymentApplicationView layoutSubviews](&v16, sel_layoutSubviews);
  +[PKPassPaymentSummaryHeaderView preferredHeight](PKPassPaymentSummaryHeaderView, "preferredHeight");
  v4 = v3;
  -[PKPassPaymentApplicationView bounds](self, "bounds");
  Width = CGRectGetWidth(v17);
  if (PKUIGetMinScreenWidthType())
    v6 = 4.0;
  else
    v6 = 20.0;
  v7 = Width + v6 * -2.0;
  headerView = self->_headerView;
  -[PKPassPaymentApplicationView bounds](self, "bounds");
  -[PKPassPaymentSummaryHeaderView setFrame:](headerView, "setFrame:", 0.0, 0.0);
  horizontalSeparator = self->_horizontalSeparator;
  if (PKUIGetMinScreenWidthType())
    v10 = 4.0;
  else
    v10 = 20.0;
  -[UIView setFrame:](horizontalSeparator, "setFrame:", v10, v4, v7, PKUIPixelLength());
  showHeader = self->_showHeader;
  v12 = v4 + 10.0;
  segmentedControl = self->_segmentedControl;
  if (PKUIGetMinScreenWidthType())
    v14 = 4.0;
  else
    v14 = 20.0;
  if (showHeader)
    v15 = v12;
  else
    v15 = 10.0;
  -[UISegmentedControl setFrame:](segmentedControl, "setFrame:", v14, v15, v7, 28.0);
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKPaymentApplication)selectedApplication
{
  return self->_selectedApplication;
}

- (void)setSelectedApplication:(id)a3
{
  objc_storeStrong((id *)&self->_selectedApplication, a3);
}

- (PKPassPaymentApplicationViewDelegate)delegate
{
  return (PKPassPaymentApplicationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showHeader
{
  return self->_showHeader;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_horizontalSeparator, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
