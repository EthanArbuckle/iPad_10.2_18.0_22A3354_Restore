@implementation PKMessageTableCell

- (PKMessageTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  PKMessageTableCell *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
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
  uint64_t v22;
  UIButton *dismissButton;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PKMessageTableCell;
  v7 = -[PKMessageTableCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC39B0]);
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithConfiguration:", v9);

    -[PKMessageTableCell contentView](v7, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    objc_storeStrong((id *)&v7->_listContentView, v10);
    v12 = (void *)MEMORY[0x1E0DC3520];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1418]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationWithFont:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v13, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v7);
    v19 = (void *)MEMORY[0x1E0DC3518];
    v20 = (void *)MEMORY[0x1E0DC3428];
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __52__PKMessageTableCell_initWithStyle_reuseIdentifier___block_invoke;
    v29 = &unk_1E3E62BD0;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v20, "actionWithHandler:", &v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "buttonWithConfiguration:primaryAction:", v18, v21, v26, v27, v28, v29);
    v22 = objc_claimAutoreleasedReturnValue();
    dismissButton = v7->_dismissButton;
    v7->_dismissButton = (UIButton *)v22;

    -[UIButton setHidden:](v7->_dismissButton, "setHidden:", 1);
    -[UIButton setAccessibilityIdentifier:](v7->_dismissButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    -[PKMessageTableCell contentView](v7, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v7->_dismissButton);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __52__PKMessageTableCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissButtonPressed");

}

- (void)_dismissButtonPressed
{
  void (**actionOnDismiss)(void);

  actionOnDismiss = (void (**)(void))self->_actionOnDismiss;
  if (actionOnDismiss)
    actionOnDismiss[2]();
}

- (void)setContent:(id)a3
{
  void *v4;
  char v5;
  UIListContentView *listContentView;
  void *v7;
  id v8;

  v8 = a3;
  -[UIListContentView configuration](self->_listContentView, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    listContentView = self->_listContentView;
    if (v8)
    {
      -[UIListContentView setConfiguration:](listContentView, "setConfiguration:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView setConfiguration:](listContentView, "setConfiguration:", v7);

    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[UIListContentView sizeThatFits:](self->_listContentView, "sizeThatFits:", a3.width + -20.0 + -20.0, 3.40282347e38);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setActionOnDismiss:(id)a3
{
  void *v4;
  id actionOnDismiss;

  v4 = _Block_copy(a3);
  actionOnDismiss = self->_actionOnDismiss;
  self->_actionOnDismiss = v4;

  -[UIButton setHidden:](self->_dismissButton, "setHidden:", self->_actionOnDismiss == 0);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKMessageTableCell;
  -[PKTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PKMessageTableCell setActionOnDismiss:](self, "setActionOnDismiss:", 0);
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMessageTableCell setContent:](self, "setContent:", v3);

}

- (void)layoutSubviews
{
  int v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGRectEdge v8;
  CGRect v9;
  CGRect remainder;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKMessageTableCell;
  -[PKMessageTableCell layoutSubviews](&v11, sel_layoutSubviews);
  v3 = -[PKMessageTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKMessageTableCell bounds](self, "bounds");
  remainder.origin.x = v4;
  remainder.origin.y = v5;
  remainder.size.width = v6;
  remainder.size.height = v7;
  memset(&v9, 0, sizeof(v9));
  if (v3)
    v8 = CGRectMaxXEdge;
  else
    v8 = CGRectMinXEdge;
  CGRectDivide(*(CGRect *)&v4, &v9, &remainder, v6 + -20.0 + -20.0, v8);
  -[UIListContentView setFrame:](self->_listContentView, "setFrame:", *(_OWORD *)&v9.origin, *(_OWORD *)&v9.size);
  CGRectDivide(remainder, &v9, &remainder, 10.0, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UIButton setFrame:](self->_dismissButton, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
}

@end
