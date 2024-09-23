@implementation STUIStatusBarCellularNetworkTypeView

- (STUIStatusBarCellularNetworkTypeView)initWithFrame:(CGRect)a3
{
  STUIStatusBarCellularNetworkTypeView *v3;
  id v4;
  STUIStatusBarStringView *v5;
  uint64_t v6;
  STUIStatusBarStringView *stringView;
  id v8;
  uint64_t v9;
  UIVectorLabel *prefixLabel;
  id v11;
  uint64_t v12;
  UIVectorLabel *accessoryLabel;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *widthConstraint;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;
  _QWORD v55[14];

  v55[12] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)STUIStatusBarCellularNetworkTypeView;
  v3 = -[STUIStatusBarCellularNetworkTypeView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[STUIStatusBarCellularNetworkTypeView addLayoutGuide:](v3, "addLayoutGuide:");
  v5 = [STUIStatusBarStringView alloc];
  -[STUIStatusBarCellularNetworkTypeView bounds](v3, "bounds");
  v6 = -[STUIStatusBarStringView initWithFrame:](v5, "initWithFrame:");
  stringView = v3->_stringView;
  v3->_stringView = (STUIStatusBarStringView *)v6;

  -[STUIStatusBarStringView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stringView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STUIStatusBarStringView setLineBreakMode:](v3->_stringView, "setLineBreakMode:", 2);
  -[STUIStatusBarCellularNetworkTypeView addSubview:](v3, "addSubview:", v3->_stringView);
  v8 = objc_alloc(MEMORY[0x1E0DC3F00]);
  -[STUIStatusBarCellularNetworkTypeView bounds](v3, "bounds");
  v9 = objc_msgSend(v8, "initWithFrame:");
  prefixLabel = v3->_prefixLabel;
  v3->_prefixLabel = (UIVectorLabel *)v9;

  -[UIVectorLabel setText:](v3->_prefixLabel, "setText:", &stru_1E8D64C18);
  -[UIVectorLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_prefixLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVectorLabel setHidden:](v3->_prefixLabel, "setHidden:", 1);
  -[STUIStatusBarCellularNetworkTypeView addSubview:](v3, "addSubview:", v3->_prefixLabel);
  v11 = objc_alloc(MEMORY[0x1E0DC3F00]);
  -[STUIStatusBarCellularNetworkTypeView bounds](v3, "bounds");
  v12 = objc_msgSend(v11, "initWithFrame:");
  accessoryLabel = v3->_accessoryLabel;
  v3->_accessoryLabel = (UIVectorLabel *)v12;

  -[UIVectorLabel setText:](v3->_accessoryLabel, "setText:", &stru_1E8D64C18);
  -[UIVectorLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_accessoryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVectorLabel setHidden:](v3->_accessoryLabel, "setHidden:", 1);
  -[STUIStatusBarCellularNetworkTypeView addSubview:](v3, "addSubview:", v3->_accessoryLabel);
  -[STUIStatusBarCellularNetworkTypeView widthAnchor](v3, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
  v15 = objc_claimAutoreleasedReturnValue();
  widthConstraint = v3->_widthConstraint;
  v3->_widthConstraint = (NSLayoutConstraint *)v15;

  objc_msgSend(v4, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStringView leadingAnchor](v3->_stringView, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v51;
  objc_msgSend(v4, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStringView trailingAnchor](v3->_stringView, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v48;
  objc_msgSend(v4, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStringView topAnchor](v3->_stringView, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v45;
  objc_msgSend(v4, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStringView bottomAnchor](v3->_stringView, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v42;
  objc_msgSend(v4, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVectorLabel leadingAnchor](v3->_prefixLabel, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v38;
  -[UIVectorLabel trailingAnchor](v3->_prefixLabel, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVectorLabel leadingAnchor](v3->_accessoryLabel, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v34;
  -[STUIStatusBarStringView lastBaselineAnchor](v3->_stringView, "lastBaselineAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVectorLabel lastBaselineAnchor](v3->_prefixLabel, "lastBaselineAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v31;
  -[STUIStatusBarStringView lastBaselineAnchor](v3->_stringView, "lastBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVectorLabel lastBaselineAnchor](v3->_accessoryLabel, "lastBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v28;
  v17 = v4;
  objc_msgSend(v4, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularNetworkTypeView centerXAnchor](v3, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v20;
  -[STUIStatusBarCellularNetworkTypeView topAnchor](v3, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v17;
  objc_msgSend(v17, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v23;
  -[STUIStatusBarCellularNetworkTypeView bottomAnchor](v3, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v26;
  v55[11] = v3->_widthConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 12);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v40);
  return v3;
}

- (void)setFixedWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  -[STUIStatusBarCellularNetworkTypeView widthConstraint](self, "widthConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constant");
  v7 = vabdd_f64(a3, v6);

  if (v7 > 0.00000011920929)
  {
    if (a3 <= 0.0
      || (-[STUIStatusBarCellularNetworkTypeView widthConstraint](self, "widthConstraint"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "constant"),
          v10 = v9,
          v8,
          v10 <= 0.0))
    {
      -[STUIStatusBarCellularNetworkTypeView widthConstraint](self, "widthConstraint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setConstant:", a3);

      -[STUIStatusBarCellularNetworkTypeView superview](self, "superview");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layoutSubviews");

    }
    else
    {
      v11 = (void *)*MEMORY[0x1E0DC4730];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __54__STUIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke;
      v14[3] = &unk_1E8D63248;
      v14[4] = self;
      *(double *)&v14[5] = a3;
      objc_msgSend(v11, "_performBlockAfterCATransactionCommits:", v14);
    }
  }
}

uint64_t __54__STUIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "widthConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__STUIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke_2;
  v5[3] = &unk_1E8D62A38;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.5);
}

void __54__STUIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutSubviews");

}

- (void)_animateUpdateToText:(id)a3 prefixLength:(int64_t)a4 styleAttributes:(id)a5 attributedText:(id)a6 type:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28[2];
  BOOL v29;
  id location;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  int64_t v35;
  BOOL v36;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v16 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke;
  v31[3] = &unk_1E8D63980;
  v31[4] = self;
  v36 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  v17 = v12;
  v32 = v17;
  v35 = a4;
  v18 = v14;
  v33 = v18;
  v19 = v13;
  v34 = v19;
  objc_msgSend(v15, "performWithoutAnimation:", v31);
  objc_initWeak(&location, self);
  v20 = (void *)*MEMORY[0x1E0DC4730];
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_2;
  v24[3] = &unk_1E8D639F8;
  objc_copyWeak(v28, &location);
  v21 = v18;
  v25 = v21;
  v22 = v17;
  v26 = v22;
  v23 = v19;
  v29 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  v27 = v23;
  v28[1] = (id)a7;
  objc_msgSend(v20, "_performBlockAfterCATransactionCommits:", v24);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

}

void __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setHidden:", 0);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 40), "substringFromIndex:", *(_QWORD *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setText:", v2);

    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      objc_msgSend(v3, "attributesAtIndex:effectiveRange:", *(_QWORD *)(a1 + 64), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFont:", v4);

      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setTextColor:", v5);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "fontForStyle:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "fontStyle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFont:", v6);

      objc_msgSend(*(id *)(a1 + 56), "textColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setTextColor:");
    }

  }
}

void __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  _QWORD v5[4];
  id v6[2];
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_3;
  v7[3] = &unk_1E8D639A8;
  v4 = (id *)(a1 + 56);
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 72);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_9;
  v5[3] = &unk_1E8D639D0;
  objc_copyWeak(v6, v4);
  v6[1] = *(id *)(a1 + 64);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v7, v5, 0.5);
  objc_destroyWeak(v6);

  objc_destroyWeak(&v11);
}

void __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (objc_msgSend(WeakRetained, "_isAnimatingUpdate"))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[54], "setAttributedText:");
      objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", 0, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *MEMORY[0x1E0DC1138];
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *MEMORY[0x1E0DC1140];
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(WeakRetained[54], "setText:", *(_QWORD *)(a1 + 40));
      objc_msgSend(WeakRetained[54], "applyStyleAttributes:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 48), "fontForStyle:", objc_msgSend(WeakRetained[54], "fontStyle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "textColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *MEMORY[0x1E0DC1138];
      v6 = *MEMORY[0x1E0DC1140];
    }
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(WeakRetained[55], "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = *MEMORY[0x1E0DC1150];
    v13[1] = v4;
    v14[0] = &unk_1E8D80630;
    v14[1] = v5;
    v13[2] = v6;
    v14[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v10);
    objc_msgSend(WeakRetained[55], "_setAttributedText:", v11);

    v12 = 1.0;
    if (!*(_BYTE *)(a1 + 64))
      v12 = 0.0;
    objc_msgSend(WeakRetained[56], "setAlpha:", v12);

  }
}

void __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_9(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_isAnimatingUpdate"))
  {
    objc_msgSend(WeakRetained[55], "setHidden:", 1);
    objc_msgSend(WeakRetained[56], "setHidden:", 1);
    objc_msgSend(WeakRetained[54], "setAlpha:", 1.0);
    WeakRetained[53] = *(id *)(a1 + 40);
    *((_BYTE *)WeakRetained + 416) = 0;
  }

}

- (void)setAttributedText:(id)a3 prefixLength:(int64_t)a4 forType:(int64_t)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
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
  int64_t v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v6 = a6;
  v33[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v6 && !self->_animatingUpdate)
  {
    self->_animatingUpdate = 1;
    objc_msgSend(v10, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarCellularNetworkTypeView _animateUpdateToText:prefixLength:styleAttributes:attributedText:type:](self, "_animateUpdateToText:prefixLength:styleAttributes:attributedText:type:", v28, a4, 0, v11, a5);

  }
  else
  {
    v31 = a5;
    -[STUIStatusBarStringView setAttributedText:](self->_stringView, "setAttributedText:", v10);
    -[UIVectorLabel setHidden:](self->_prefixLabel, "setHidden:", 1);
    -[UIVectorLabel setHidden:](self->_accessoryLabel, "setHidden:", 1);
    -[STUIStatusBarStringView setAlpha:](self->_stringView, "setAlpha:", 1.0);
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v12, "substringToIndex:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "attributesAtIndex:effectiveRange:", 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0DC1140];
    v29 = v15;
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    v32[0] = *MEMORY[0x1E0DC1150];
    v32[1] = v16;
    v33[0] = &unk_1E8D80630;
    v33[1] = v17;
    v30 = (void *)v17;
    v32[2] = v18;
    v33[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithString:attributes:", v14, v21);
    -[UIVectorLabel _setAttributedText:](self->_prefixLabel, "_setAttributedText:", v22);

    -[UIVectorLabel setNeedsLayout](self->_prefixLabel, "setNeedsLayout");
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "string");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "substringFromIndex:", a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVectorLabel setText:](self->_accessoryLabel, "setText:", v24);

      objc_msgSend(v11, "attributesAtIndex:effectiveRange:", a4, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVectorLabel setFont:](self->_accessoryLabel, "setFont:", v26);

      objc_msgSend(v25, "objectForKeyedSubscript:", v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVectorLabel setTextColor:](self->_accessoryLabel, "setTextColor:", v27);

      -[UIVectorLabel setNeedsLayout](self->_accessoryLabel, "setNeedsLayout");
    }
    self->_type = v31;
    self->_animatingUpdate = 0;

  }
}

- (void)setText:(id)a3 prefixLength:(int64_t)a4 withStyleAttributes:(id)a5 forType:(int64_t)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v7 = a7;
  v27[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  if (v7 && !self->_animatingUpdate)
  {
    self->_animatingUpdate = 1;
    -[STUIStatusBarCellularNetworkTypeView _animateUpdateToText:prefixLength:styleAttributes:attributedText:type:](self, "_animateUpdateToText:prefixLength:styleAttributes:attributedText:type:", v12, a4, v13, 0, a6);
  }
  else
  {
    -[STUIStatusBarStringView setText:](self->_stringView, "setText:", v12);
    -[STUIStatusBarStringView applyStyleAttributes:](self->_stringView, "applyStyleAttributes:", v13);
    -[UIVectorLabel setHidden:](self->_prefixLabel, "setHidden:", 1);
    -[UIVectorLabel setHidden:](self->_accessoryLabel, "setHidden:", 1);
    -[STUIStatusBarStringView setAlpha:](self->_stringView, "setAlpha:", 1.0);
    v23 = v12;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v12, "substringToIndex:", a4);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    objc_msgSend(v13, "fontForStyle:", -[STUIStatusBarStringView fontStyle](self->_stringView, "fontStyle", v23));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    v19 = *MEMORY[0x1E0DC1138];
    v26[0] = *MEMORY[0x1E0DC1150];
    v26[1] = v19;
    v27[0] = &unk_1E8D80630;
    v27[1] = v16;
    v26[2] = *MEMORY[0x1E0DC1140];
    v27[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    v21 = (void *)objc_msgSend(v18, "initWithString:attributes:", v15, v20);
    -[UIVectorLabel _setAttributedText:](self->_prefixLabel, "_setAttributedText:", v21);

    -[UIVectorLabel setNeedsLayout](self->_prefixLabel, "setNeedsLayout");
    v12 = v24;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v24, "substringFromIndex:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVectorLabel setText:](self->_accessoryLabel, "setText:", v22);

      -[UIVectorLabel setFont:](self->_accessoryLabel, "setFont:", v16);
      -[UIVectorLabel setTextColor:](self->_accessoryLabel, "setTextColor:", v17);
      -[UIVectorLabel setNeedsLayout](self->_accessoryLabel, "setNeedsLayout");
    }
    self->_type = a6;
    self->_animatingUpdate = 0;

  }
}

- (void)applyStyleAttributes:(id)a3
{
  -[STUIStatusBarStringView applyStyleAttributes:](self->_stringView, "applyStyleAttributes:", a3);
}

- (id)viewForLastBaselineLayout
{
  return self->_stringView;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3418]);
  -[STUIStatusBarStringView text](self->_stringView, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:image:imageInsets:", v4, 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  return (UIAccessibilityHUDItem *)v5;
}

- (BOOL)_isAnimatingUpdate
{
  return self->_animatingUpdate;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (STUIStatusBarStringView)stringView
{
  return self->_stringView;
}

- (void)setStringView:(id)a3
{
  objc_storeStrong((id *)&self->_stringView, a3);
}

- (UIVectorLabel)prefixLabel
{
  return self->_prefixLabel;
}

- (void)setPrefixLabel:(id)a3
{
  objc_storeStrong((id *)&self->_prefixLabel, a3);
}

- (UIVectorLabel)accessoryLabel
{
  return self->_accessoryLabel;
}

- (void)setAccessoryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLabel, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryLabel, 0);
  objc_storeStrong((id *)&self->_prefixLabel, 0);
  objc_storeStrong((id *)&self->_stringView, 0);
}

@end
