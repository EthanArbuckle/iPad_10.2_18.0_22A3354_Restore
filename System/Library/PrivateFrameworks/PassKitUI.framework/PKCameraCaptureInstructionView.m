@implementation PKCameraCaptureInstructionView

- (PKCameraCaptureInstructionView)initWithFrame:(CGRect)a3 context:(int64_t)a4 primaryAction:(id)a5 primaryActionTitle:(id)a6 secondaryAction:(id)a7 secondaryActionTitle:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  PKCameraCaptureInstructionView *v21;
  PKCameraCaptureInstructionView *v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKCameraCaptureInstructionView;
  v21 = -[PKCameraCaptureInstructionView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v22 = v21;
  if (v21)
  {
    v21->_context = a4;
    -[PKCameraCaptureInstructionView setupScrollView](v21, "setupScrollView");
    -[PKCameraCaptureInstructionView setupPrimaryButtonWithTitle:action:](v22, "setupPrimaryButtonWithTitle:action:", v18, v17);
    -[PKCameraCaptureInstructionView setupSecondaryButtonWithTitle:action:](v22, "setupSecondaryButtonWithTitle:action:", v20, v19);
    -[PKCameraCaptureInstructionView setupHeaderView](v22, "setupHeaderView");
  }

  return v22;
}

- (void)setupScrollView
{
  UIScrollView *v3;
  UIScrollView *scrollView;

  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[PKCameraCaptureInstructionView addSubview:](self, "addSubview:", self->_scrollView);
}

- (void)setupPrimaryButtonWithTitle:(id)a3 action:(id)a4
{
  void *v6;
  NSString *v7;
  NSString *v8;
  id v9;
  id v10;
  void *v11;
  UIButton *v12;
  UIButton *primaryButton;
  id v14;

  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0DC3520];
    v7 = (NSString *)*MEMORY[0x1E0DC4A88];
    v8 = (NSString *)*MEMORY[0x1E0DC48C8];
    v9 = a4;
    v10 = a3;
    PKFontForDefaultDesign(v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pkui_plainConfigurationWithTitle:font:", v10, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v14, v9);
    v12 = (UIButton *)objc_claimAutoreleasedReturnValue();

    primaryButton = self->_primaryButton;
    self->_primaryButton = v12;

    -[UIButton setConfigurationUpdateHandler:](self->_primaryButton, "setConfigurationUpdateHandler:", &__block_literal_global_243);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_primaryButton);

  }
}

void __69__PKCameraCaptureInstructionView_setupPrimaryButtonWithTitle_action___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNumberOfLines:", 3);
}

- (void)setupSecondaryButtonWithTitle:(id)a3 action:(id)a4
{
  id v6;
  int IsSetupAssistant;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  UIButton *secondaryButton;
  id v13;

  v13 = a3;
  v6 = a4;
  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  if (v6 && IsSetupAssistant)
  {
    v8 = (void *)MEMORY[0x1E0DC3520];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pkui_plainConfigurationWithTitle:font:", v13, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, v6);
    v11 = (UIButton *)objc_claimAutoreleasedReturnValue();
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v11;

    -[UIButton setConfigurationUpdateHandler:](self->_secondaryButton, "setConfigurationUpdateHandler:", &__block_literal_global_10_0);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_secondaryButton);

  }
}

void __71__PKCameraCaptureInstructionView_setupSecondaryButtonWithTitle_action___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNumberOfLines:", 2);
}

- (void)setupHeaderView
{
  PKTableHeaderView *v3;
  PKTableHeaderView *v4;
  PKTableHeaderView *headerView;
  _BOOL4 v6;
  double v7;
  double v8;

  v3 = [PKTableHeaderView alloc];
  v4 = -[PKTableHeaderView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v4;

  v6 = -[PKCameraCaptureInstructionView isBuddyiPad](self, "isBuddyiPad");
  -[PKTableHeaderView setStyle:](self->_headerView, "setStyle:", v6);
  v7 = 10.0;
  if (v6)
  {
    v7 = 20.0;
    v8 = 19.0;
  }
  else
  {
    v8 = 9.0;
  }
  -[PKTableHeaderView setTopPadding:](self->_headerView, "setTopPadding:", v7);
  -[PKTableHeaderView setBottomPadding:](self->_headerView, "setBottomPadding:", v8);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_headerView);
}

- (void)setPrimaryButtonEnabled:(BOOL)a3
{
  -[UIButton setEnabled:](self->_primaryButton, "setEnabled:", a3);
}

- (void)setPrimaryButtonHidden:(BOOL)a3
{
  -[UIButton setHidden:](self->_primaryButton, "setHidden:", a3);
}

- (void)setPrimaryButtonTitle:(id)a3
{
  -[UIButton pkui_updateConfigurationWithTitle:](self->_primaryButton, "pkui_updateConfigurationWithTitle:", a3);
}

- (void)setSecondaryButtonTitle:(id)a3
{
  -[UIButton pkui_updateConfigurationWithTitle:](self->_secondaryButton, "pkui_updateConfigurationWithTitle:", a3);
}

- (void)removeSecondaryButton
{
  UIButton *secondaryButton;

  -[UIButton removeFromSuperview](self->_secondaryButton, "removeFromSuperview");
  secondaryButton = self->_secondaryButton;
  self->_secondaryButton = 0;

}

- (BOOL)hasSecondaryButton
{
  return self->_secondaryButton != 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCameraCaptureInstructionView;
  -[PKCameraCaptureInstructionView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[PKCameraCaptureInstructionView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[PKCameraCaptureInstructionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v5 = PKUIGetMinScreenWidthType() - 4;
  if (v5 > 8)
    v6 = 216.0;
  else
    v6 = dbl_19DF18868[v5];
  if (-[PKCameraCaptureInstructionView isBuddyiPad](self, "isBuddyiPad"))
    v7 = 313.0;
  else
    v7 = v6;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _BOOL4 v26;
  double v27;
  void *v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat y;
  CGFloat x;
  CGFloat v45;
  CGFloat width;
  double v47;
  _BOOL4 v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  UIScrollView *scrollView;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  CGRect v61;
  CGFloat MaxY;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect rect;
  __objc2_class *v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  *(_QWORD *)&rect.size.height = self;
  v69 = PKCameraCaptureInstructionView;
  -[CGFloat layoutSubviews]((objc_super *)&rect.size.height, sel_layoutSubviews);
  -[PKCameraCaptureInstructionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v7 + -16.0;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v3);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v8, v10);
  v12 = MEMORY[0x1E0C9D648];
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v8, v10);
  UIRectCenteredXInRect();
  v61.origin.x = v15;
  v61.origin.y = v16;
  v61.size.width = v17;
  v61.size.height = v18;
  -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:");
  -[UIButton titleLabel](self->_primaryButton, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", v11, v10);

  -[UIButton sizeThatFits:](self->_primaryButton, "sizeThatFits:", v11, v10);
  v67 = v13;
  UIRectCenteredXInRect();
  v21 = v20;
  v23 = v22;
  rect.origin.y = v25;
  rect.size.width = v24;
  v66 = *(double *)(v12 + 16);
  v65 = *(double *)(v12 + 24);
  v26 = -[PKCameraCaptureInstructionView isBuddyiPad](self, "isBuddyiPad");
  v27 = 38.0;
  if (!v26)
    v27 = 14.0;
  v59 = v4;
  v60 = v27;
  rect.origin.x = v21;
  if (self->_secondaryButton)
  {
    MaxY = CGRectGetMaxY(v61);
    -[UIButton titleLabel](self->_secondaryButton, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sizeThatFits:", v11, v10);

    -[UIButton sizeThatFits:](self->_secondaryButton, "sizeThatFits:", v11, v10);
    v64 = v14;
    UIRectCenteredXInRect();
    v29 = v8;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v70.origin.x = v4;
    v63 = v29;
    v70.origin.y = v6;
    v70.size.width = v29;
    v70.size.height = v10;
    v38 = CGRectGetMaxY(v70);
    v71.origin.x = v31;
    v71.origin.y = v33;
    v71.size.width = v35;
    v71.size.height = v37;
    v39 = MaxY;
    v40 = v38 - CGRectGetHeight(v71) - v60;
    v72.origin.x = rect.origin.x;
    v72.origin.y = MaxY;
    v72.size.width = rect.size.width;
    v72.size.height = rect.origin.y;
    v41 = CGRectGetMaxY(v72);
    v42 = v67;
    y = rect.origin.y;
    if (v40 < v41)
    {
      x = rect.origin.x;
      v45 = MaxY;
      width = rect.size.width;
      v47 = CGRectGetMaxY(*(CGRect *)(&y - 3));
      v48 = -[PKCameraCaptureInstructionView isBuddyiPad](self, "isBuddyiPad");
      v49 = 9.0;
      if (v48)
        v49 = 19.0;
      v40 = v47 + v49;
      v42 = v31;
      v65 = v37;
      v66 = v35;
      v64 = v40;
    }
    -[UIButton setFrame:](self->_secondaryButton, "setFrame:", v31, v40, v35, v37, *(_QWORD *)&v59);
    v14 = v64;
    v51 = v65;
    v50 = v66;
    v8 = v63;
  }
  else
  {
    v52 = v27;
    v73.origin.x = v4;
    v73.origin.y = v6;
    v73.size.width = v8;
    v73.size.height = v10;
    v53 = CGRectGetMaxY(v73);
    v74.origin.x = v21;
    v74.origin.y = v23;
    v74.size.height = rect.origin.y;
    v74.size.width = rect.size.width;
    v39 = v53 - CGRectGetHeight(v74) - v52;
    v50 = v66;
    v42 = v67;
    v51 = v65;
    if (v39 < CGRectGetMaxY(v61))
    {
      v39 = CGRectGetMaxY(v61);
      v42 = rect.origin.x;
      v51 = rect.origin.y;
      v14 = v39;
      v50 = rect.size.width;
    }
  }
  v75.origin.x = v42;
  v75.origin.y = v14;
  v75.size.width = v50;
  v75.size.height = v51;
  if (!CGRectIsEmpty(v75))
  {
    scrollView = self->_scrollView;
    v76.origin.x = v59;
    v76.origin.y = v6;
    v76.size.width = v8;
    v76.size.height = v10;
    v55 = v39;
    v56 = CGRectGetWidth(v76);
    v77.origin.x = v42;
    v77.origin.y = v14;
    v77.size.width = v50;
    v77.size.height = v51;
    v57 = v60 + CGRectGetMaxY(v77);
    v58 = v56;
    v39 = v55;
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v58, v57);
  }
  -[UIButton setFrame:](self->_primaryButton, "setFrame:", rect.origin.x, v39, rect.size.width, rect.origin.y, *(_QWORD *)&v59);
}

- (BOOL)isBuddyiPad
{
  void *v2;
  uint64_t v3;

  -[PKCameraCaptureInstructionView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return PKPaymentSetupContextIsSetupAssistant();
  else
    return 0;
}

- (PKTableHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
