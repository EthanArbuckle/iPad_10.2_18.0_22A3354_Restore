@implementation PKSwitchSpinnerTableCell

- (PKSwitchSpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PKSwitchSpinnerTableCell *v9;
  void *v10;
  UISwitch *v11;
  UISwitch *v12;
  void *v13;
  UISwitch *v14;
  void *v15;
  uint64_t v16;
  UIActivityIndicatorView *spinner;
  void *v18;
  objc_super v20;

  v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKSwitchSpinnerTableCell;
  v9 = -[PKSwitchSpinnerTableCell initWithStyle:reuseIdentifier:](&v20, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v9)
  {
    objc_msgSend(v8, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_delegate, v10);

    v11 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v12 = v9->_switch;
    v9->_switch = v11;

    -[UISwitch addTarget:action:forEvents:](v9->_switch, "addTarget:action:forEvents:", v9, sel__switchToggled_, 4096);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSwitchSpinnerTableCell setSwitchIsOn:](v9, "setSwitchIsOn:", objc_msgSend(v13, "BOOLValue"));

    v14 = v9->_switch;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PKSwitchSpinnerTableCellSwitchIsDisabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setEnabled:](v14, "setEnabled:", objc_msgSend(v15, "BOOLValue") ^ 1);

    -[UISwitch sizeToFit](v9->_switch, "sizeToFit");
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v9->_spinner;
    v9->_spinner = (UIActivityIndicatorView *)v16;

    -[UIActivityIndicatorView sizeToFit](v9->_spinner, "sizeToFit");
    -[PSTableCell titleLabel](v9, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLineBreakMode:", 4);

    -[PKSwitchSpinnerTableCell _updateSubviews](v9, "_updateSubviews");
    -[PKSwitchSpinnerTableCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
  }

  return v9;
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSwitchSpinnerTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSwitchSpinnerTableCell setSwitchIsOn:](self, "setSwitchIsOn:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKSwitchSpinnerTableCellShowSpinner"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSwitchSpinnerTableCell setShowSpinner:](self, "setShowSpinner:", objc_msgSend(v6, "BOOLValue"));
}

- (void)setSwitchIsOn:(BOOL)a3
{
  -[UISwitch setOn:](self->_switch, "setOn:", a3);
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  int v13;
  CGRectEdge v14;
  uint64_t v15;
  id *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGRectEdge v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect remainder;
  CGRect slice;
  objc_super v34;
  CGRect v35;

  v34.receiver = self;
  v34.super_class = (Class)PKSwitchSpinnerTableCell;
  -[PSTableCell layoutSubviews](&v34, sel_layoutSubviews);
  v3 = PKTableViewCellTextInset();
  -[PKSwitchSpinnerTableCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = -[PKSwitchSpinnerTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  memset(&v31, 0, sizeof(v31));
  if (v13)
    v14 = CGRectMinXEdge;
  else
    v14 = CGRectMaxXEdge;
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  CGRectDivide(v35, &slice, &remainder, v3, v14);
  if (self->_showSpinner)
    v15 = 1200;
  else
    v15 = 1208;
  v16 = (id *)((char *)&self->super.super.super.super.super.isa + v15);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v15), "frame", *(_OWORD *)&v31.origin);
  CGRectDivide(remainder, &slice, &remainder, v17, v14);
  UIRectCenteredIntegralRect();
  slice.origin.x = v18;
  slice.origin.y = v19;
  slice.size.width = v20;
  slice.size.height = v21;
  objc_msgSend(*v16, "setFrame:");
  if (v13)
    v22 = CGRectMaxXEdge;
  else
    v22 = CGRectMinXEdge;
  -[PSTableCell titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CGRectDivide(remainder, &slice, &v31, v3, v22);
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v23, "sizeThatFits:", v31.size.width, v28);
  objc_msgSend(v23, "setFrame:", v25, v27, v30, v29);

}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    -[PKSwitchSpinnerTableCell _updateSubviews](self, "_updateSubviews");
  }
}

- (void)_updateSubviews
{
  void *v3;
  void *v4;

  if (self->_showSpinner)
  {
    -[UISwitch removeFromSuperview](self->_switch, "removeFromSuperview");
    -[PKSwitchSpinnerTableCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", self->_spinner);

    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  }
  else
  {
    -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
    -[PKSwitchSpinnerTableCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", self->_switch);

  }
  -[PKSwitchSpinnerTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_switchToggled:(id)a3
{
  PKSwitchSpinnerTableCellDelegate **p_delegate;
  id v5;
  uint64_t v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_msgSend(v5, "isOn");

  objc_msgSend(WeakRetained, "switchSpinnerCell:hasToggledSwitch:", self, v6);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
