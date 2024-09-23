@implementation PKEditTableNoPassesView

- (PKEditTableNoPassesView)initWithFrame:(CGRect)a3
{
  PKEditTableNoPassesView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  uint64_t v15;
  UILabel *descriptionLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  int IsAllowed;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIButton *buttonScanCode;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIButton *buttonFindApps;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PKEditTableNoPassesView;
  v3 = -[PKEditTableNoPassesView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    v11 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    v13 = v3->_titleLabel;
    PKLocalizedString(CFSTR("PASS_EDITING_NO_PASSES"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v13, "setText:", v14);

    -[PKEditTableNoPassesView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v15;

    -[UILabel setTextAlignment:](v3->_descriptionLabel, "setTextAlignment:", 1);
    v17 = v3->_descriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 0);
    v19 = v3->_descriptionLabel;
    PKLocalizedString(CFSTR("PASS_EDITING_NO_PASSES_DESCRIPTION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v19, "setText:", v20);

    -[PKEditTableNoPassesView addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    objc_initWeak(&location, v3);
    IsAllowed = PKRearCameraIsAllowed();
    v22 = MEMORY[0x1E0C809B0];
    if (IsAllowed)
    {
      v23 = (void *)MEMORY[0x1E0DC3428];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __41__PKEditTableNoPassesView_initWithFrame___block_invoke;
      v36[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v37, &location);
      objc_msgSend(v23, "actionWithHandler:", v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedString(CFSTR("SCAN_CODE"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ButtonWithTitle(v25, v24);
      v26 = objc_claimAutoreleasedReturnValue();
      buttonScanCode = v3->_buttonScanCode;
      v3->_buttonScanCode = (UIButton *)v26;

      -[PKEditTableNoPassesView addSubview:](v3, "addSubview:", v3->_buttonScanCode);
      objc_destroyWeak(&v37);
    }
    v28 = (void *)MEMORY[0x1E0DC3428];
    v34[0] = v22;
    v34[1] = 3221225472;
    v34[2] = __41__PKEditTableNoPassesView_initWithFrame___block_invoke_2;
    v34[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v28, "actionWithHandler:", v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("APP_STORE"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ButtonWithTitle(v30, v29);
    v31 = objc_claimAutoreleasedReturnValue();
    buttonFindApps = v3->_buttonFindApps;
    v3->_buttonFindApps = (UIButton *)v31;

    -[PKEditTableNoPassesView addSubview:](v3, "addSubview:", v3->_buttonFindApps);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __41__PKEditTableNoPassesView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scanCodeButtonTapped");

}

void __41__PKEditTableNoPassesView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "findAppsForWalletTapped");

}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  UIButton *buttonScanCode;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect slice;
  CGRect v24;

  -[PKEditTableNoPassesView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&slice, 0, sizeof(slice));
  v22.origin.x = v3;
  v22.origin.y = v5;
  v22.size.width = v7;
  v22.size.height = v9;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7, v9);
  v12 = v11;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  CGRectDivide(v24, &slice, &v22, v12, CGRectMinYEdge);
  -[UILabel pkui_setFrame:animated:](self->_titleLabel, "pkui_setFrame:animated:", 0, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRectDivide(v22, &slice, &v22, 16.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v8 + -80.0, v22.size.height);
  v14 = v13;
  CGRectDivide(v22, &slice, &v22, v13, CGRectMinYEdge);
  -[UILabel pkui_setFrame:animated:](self->_descriptionLabel, "pkui_setFrame:animated:", 0, 40.0, slice.origin.y, v8 + -80.0, v14);
  CGRectDivide(v22, &slice, &v22, 16.0, CGRectMinYEdge);
  buttonScanCode = self->_buttonScanCode;
  if (buttonScanCode)
  {
    -[UIButton titleLabel](buttonScanCode, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sizeThatFits:", v8, v22.size.height);
    v18 = v17;

    CGRectDivide(v22, &slice, &v22, v18, CGRectMinYEdge);
    -[UIButton frame](self->_buttonScanCode, "frame");
    PKSizeAlignedInRect();
    -[UIButton setFrame:](self->_buttonScanCode, "setFrame:");
    CGRectDivide(v22, &slice, &v22, 16.0, CGRectMinYEdge);
  }
  -[UIButton titleLabel](self->_buttonFindApps, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", v8, v22.size.height);
  v21 = v20;

  CGRectDivide(v22, &slice, &v22, v21 + 5.0, CGRectMinYEdge);
  -[UIButton frame](self->_buttonFindApps, "frame");
  PKSizeAlignedInRect();
  -[UIButton setFrame:](self->_buttonFindApps, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  UIButton *buttonScanCode;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  v7 = (uint64_t)(v6 + 0.0) + 16;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", width + -80.0, height);
  v9 = (uint64_t)(v8 + (double)v7) + 16;
  buttonScanCode = self->_buttonScanCode;
  if (buttonScanCode)
  {
    -[UIButton titleLabel](buttonScanCode, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", width, height);
    v13 = v12;

    v9 = (uint64_t)(v13 + 5.0 + (double)v9) + 16;
  }
  -[UIButton titleLabel](self->_buttonFindApps, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", width, height);
  v16 = v15;

  v17 = fmin(height, (double)(uint64_t)(v16 + 5.0 + (double)v9));
  v18 = width;
  result.height = v17;
  result.width = v18;
  return result;
}

- (void)scanCodeButtonTapped
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "noPassesViewScanCodeButtonTapped:", self);
      v4 = v6;
    }
  }

}

- (void)findAppsForWalletTapped
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "noPassesViewFindAppsForWalletTapped:", self);
      v4 = v6;
    }
  }

}

- (PKEditTableNoPassesViewDelegate)delegate
{
  return (PKEditTableNoPassesViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonFindApps, 0);
  objc_storeStrong((id *)&self->_buttonScanCode, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
