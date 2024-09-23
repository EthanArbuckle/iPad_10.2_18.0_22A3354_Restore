@implementation NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;
  CGRect v6;

  -[UISegmentedControl frame](self->_unmanagedSegmentControl, "frame", a3.width, a3.height);
  v3 = CGRectGetMaxY(v6) + 35.0;
  v4 = 0.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *v2;
  UIView *v3;
  UIView *unmanagedView;
  UIView *v5;
  void *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *tapGestureRecongizer;
  UILabel *v9;
  UILabel *unmanagedTitleLabel;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  UISegmentedControl *v18;
  UISegmentedControl *unmanagedSegmentControl;
  UILabel *v20;
  UILabel *overflowingLabel;
  id v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint32_t v29;
  double v30;
  void *v31;
  void *v32;
  uint32_t v33;
  uint32_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  UIView *v39;
  void *v40;
  double v41;
  UISegmentedControl *v42;
  double MaxY;
  double v44;
  UILabel *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  id location;
  objc_super v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[4];
  CGRect v65;
  CGRect v66;

  v64[2] = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView;
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView layoutSubviews](&v61, sel_layoutSubviews);
  v2 = self;
  if (!self->_unmanagedView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    unmanagedView = self->_unmanagedView;
    self->_unmanagedView = v3;

    v5 = self->_unmanagedView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView addSubview:](self, "addSubview:", self->_unmanagedView);
    v2 = self;
  }
  if (!v2->_tapGestureRecongizer)
  {
    v7 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
    tapGestureRecongizer = self->_tapGestureRecongizer;
    self->_tapGestureRecongizer = v7;

    -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecongizer, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self->_unmanagedView, "addGestureRecognizer:", self->_tapGestureRecongizer);
    -[UITapGestureRecognizer addTarget:action:](self->_tapGestureRecongizer, "addTarget:action:", self, sel__unmanagedViewTapped);
    v2 = self;
  }
  v53 = 432;
  if (!v2->_unmanagedTitleLabel)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    unmanagedTitleLabel = self->_unmanagedTitleLabel;
    self->_unmanagedTitleLabel = v9;

    -[UILabel setText:](self->_unmanagedTitleLabel, "setText:", CFSTR("Set containsUnmanagedContent on configuration:"));
    -[UILabel setNumberOfLines:](self->_unmanagedTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_unmanagedTitleLabel, "setTextAlignment:", 1);
    -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView addSubview:](self, "addSubview:", self->_unmanagedTitleLabel);
    v2 = self;
  }
  if (!v2->_unmanagedSegmentControl)
  {
    objc_initWeak(&location, v2);
    v11 = (void *)MEMORY[0x1E0DC3428];
    v12 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __93__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView_layoutSubviews__block_invoke;
    v58[3] = &unk_1E8D1B1C8;
    objc_copyWeak(&v59, &location);
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", CFSTR("No"), 0, 0, v58);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3428];
    v56[0] = v12;
    v56[1] = 3221225472;
    v56[2] = __93__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView_layoutSubviews__block_invoke_2;
    v56[3] = &unk_1E8D1B1C8;
    objc_copyWeak(&v57, &location);
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", CFSTR("Yes"), 0, 0, v56);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0DC3C58]);
    v64[0] = v13;
    v64[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (UISegmentedControl *)objc_msgSend(v16, "initWithFrame:actions:", v17, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    unmanagedSegmentControl = self->_unmanagedSegmentControl;
    self->_unmanagedSegmentControl = v18;

    -[UISegmentedControl setSelectedSegmentIndex:](self->_unmanagedSegmentControl, "setSelectedSegmentIndex:", self->_containsUnmanagedContent);
    -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView addSubview:](self, "addSubview:", self->_unmanagedSegmentControl);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
    v2 = self;
  }
  if (!v2->_overflowingLabel)
  {
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    overflowingLabel = self->_overflowingLabel;
    self->_overflowingLabel = v20;

    v22 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v23 = *MEMORY[0x1E0DC1420];
    v24 = *MEMORY[0x1E0DC1450];
    v25 = *MEMORY[0x1E0DC1138];
    v26 = *MEMORY[0x1E0DC1140];
    v27 = 25;
    do
    {
      v28 = (void *)MEMORY[0x1E0DC1350];
      v29 = arc4random_uniform(0x14u);
      if ((arc4random_uniform(0x14u) & 1) != 0)
        v30 = v24;
      else
        v30 = v23;
      objc_msgSend(v28, "systemFontOfSize:weight:", (double)(v29 + 10), v30, v53);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0DC3658];
      v33 = arc4random_uniform(0xFFu);
      v34 = arc4random_uniform(0xFFu);
      objc_msgSend(v32, "colorWithRed:green:blue:alpha:", (double)v33 / 255.0, (double)v34 / 255.0, (double)arc4random_uniform(0xFFu) / 255.0, 1.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_alloc(MEMORY[0x1E0CB3498]);
      v62[0] = v25;
      v62[1] = v26;
      v63[0] = v31;
      v63[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v36, "initWithString:attributes:", CFSTR("repeating str"), v37);
      objc_msgSend(v22, "appendAttributedString:", v38);

      --v27;
    }
    while (v27);
    -[UILabel setAttributedText:](self->_overflowingLabel, "setAttributedText:", v22);
    -[UILabel setNumberOfLines:](self->_overflowingLabel, "setNumberOfLines:", 0);
    -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView addSubview:](self, "addSubview:", self->_overflowingLabel);

    v2 = self;
  }
  v39 = v2->_unmanagedView;
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView bounds](v2, "bounds", v53);
  -[UIView setFrame:](v39, "setFrame:");
  v40 = *(Class *)((char *)&self->super.super.super.isa + v54);
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView bounds](self, "bounds");
  objc_msgSend(v40, "setFrame:", 16.0, 16.0, v41 + -32.0, 50.0);
  v42 = self->_unmanagedSegmentControl;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v54), "frame");
  MaxY = CGRectGetMaxY(v65);
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView bounds](self, "bounds");
  -[UISegmentedControl setFrame:](v42, "setFrame:", 16.0, MaxY + 16.0, v44 + -32.0, 100.0);
  v45 = self->_overflowingLabel;
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView bounds](self, "bounds");
  v47 = v46;
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView bounds](self, "bounds");
  -[UILabel sizeThatFits:](v45, "sizeThatFits:", v47 + 80.0, v48);
  v50 = v49;
  v52 = v51;
  -[UISegmentedControl frame](self->_unmanagedSegmentControl, "frame");
  -[UILabel setFrame:](self->_overflowingLabel, "setFrame:", -40.0, CGRectGetMaxY(v66) + 8.0, v50, v52);
}

void __93__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView_layoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "unmanagedContentViewControllerView:setContainsUnmanagedContent:", v3, 0);

    WeakRetained = v3;
  }

}

void __93__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "unmanagedContentViewControllerView:setContainsUnmanagedContent:", v3, 1);

    WeakRetained = v3;
  }

}

- (void)setContainsUnmanagedContent:(BOOL)a3
{
  self->_containsUnmanagedContent = a3;
  -[UISegmentedControl setSelectedSegmentIndex:](self->_unmanagedSegmentControl, "setSelectedSegmentIndex:", a3);
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_tapGestureRecongizer == a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *tapGestureRecongizer;

  tapGestureRecongizer = self->_tapGestureRecongizer;
  return tapGestureRecongizer == a3 || tapGestureRecongizer != a4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *tapGestureRecongizer;

  tapGestureRecongizer = self->_tapGestureRecongizer;
  return tapGestureRecongizer == a3 || tapGestureRecongizer != a4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *tapGestureRecongizer;

  tapGestureRecongizer = self->_tapGestureRecongizer;
  return tapGestureRecongizer == a4 || tapGestureRecongizer != a3;
}

- (void)_unmanagedViewTapped
{
  void *v3;
  void *v4;
  id v5;

  -[UIView backgroundColor](self->_unmanagedView, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView setBackgroundColor:](self->_unmanagedView, "setBackgroundColor:", v5);
}

- (NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerViewDelegate)delegate
{
  return (NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)containsUnmanagedContent
{
  return self->_containsUnmanagedContent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overflowingLabel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecongizer, 0);
  objc_storeStrong((id *)&self->_unmanagedTitleLabel, 0);
  objc_storeStrong((id *)&self->_unmanagedSegmentControl, 0);
  objc_storeStrong((id *)&self->_unmanagedView, 0);
}

@end
