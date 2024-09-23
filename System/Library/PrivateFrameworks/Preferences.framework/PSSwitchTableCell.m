@implementation PSSwitchTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSSwitchTableCell;
  v4 = a3;
  -[PSControlTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("control-loading"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PSSwitchTableCell setLoading:](self, "setLoading:", objc_msgSend(v5, "BOOLValue"));

}

- (PSSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PSSwitchTableCell *v5;
  PSSwitchTableCell *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSSwitchTableCell;
  v5 = -[PSControlTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSControlTableCell control](v5, "control");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSwitchTableCell setAccessoryView:](v6, "setAccessoryView:", v7);

  }
  return v6;
}

- (id)newControl
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA38]), "initWithFrame:", 0.0, 0.0, 51.0, 31.0);
}

- (void)setValue:(id)a3
{
  id v5;

  v5 = a3;
  if (self->super.super._value != v5)
  {
    objc_storeStrong(&self->super.super._value, a3);
    -[UIControl setOn:](self->super._control, "setOn:", objc_msgSend(v5, "intValue") != 0);
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  float v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PSSwitchTableCell;
  -[PSTableCell layoutSubviews](&v15, sel_layoutSubviews);
  if (self->_activityIndicator)
  {
    -[PSSwitchTableCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    objc_msgSend(MEMORY[0x1E0CEA2C8], "defaultSizeForStyle:", -[PSSwitchTableCell spinnerStyle](self, "spinnerStyle"));
    v9 = v8;
    v11 = v10;
    v12 = -[PSSwitchTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v13 = v5 + -9.0 - v9;
    if (v12)
      v13 = 9.0;
    v14 = (v7 - v11) * 0.5;
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v13, ceilf(v14), v9, v11);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;

  -[PSSwitchTableCell backgroundColor](self, "backgroundColor", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSwitchTableCell selectedBackgroundView](self, "selectedBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[PSSwitchTableCell setLoading:](self, "setLoading:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSSwitchTableCell;
  -[PSTableCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (BOOL)canReload
{
  int v3;

  v3 = -[PSSwitchTableCell isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  if (v3)
    LOBYTE(v3) = -[PSSwitchTableCell tag](self, "tag") == 6;
  return v3;
}

- (void)setCellEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PSSwitchTableCell;
  -[PSControlTableCell setCellEnabled:](&v5, sel_setCellEnabled_);
  -[UIControl setEnabled:](self->super._control, "setEnabled:", v3);
}

- (BOOL)loading
{
  return self->_activityIndicator != 0;
}

- (int64_t)spinnerStyle
{
  return 100;
}

- (void)setLoading:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicator;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  UIActivityIndicatorView *v17;
  UIActivityIndicatorView *v18;
  void *v19;
  UIControl *control;
  uint64_t v21;
  UIActivityIndicatorView *v22;
  id v23;

  activityIndicator = self->_activityIndicator;
  if (a3)
  {
    if (!activityIndicator)
    {
      -[PSSwitchTableCell contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v7 = v6;
      v9 = v8;

      objc_msgSend(MEMORY[0x1E0CEA2C8], "defaultSizeForStyle:", -[PSSwitchTableCell spinnerStyle](self, "spinnerStyle"));
      v11 = v10;
      v13 = v12;
      v14 = -[PSSwitchTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection")
          ? 9.0
          : v7 + -9.0 - v11;
      v15 = (v9 - v13) * 0.5;
      v16 = ceilf(v15);
      v17 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", -[PSSwitchTableCell spinnerStyle](self, "spinnerStyle"));
      v18 = self->_activityIndicator;
      self->_activityIndicator = v17;

      -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v14, v16, v11, v13);
      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
      -[PSSwitchTableCell contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", self->_activityIndicator);

      if (self->super._control)
      {
        if (-[PSSwitchTableCell tag](self, "tag") == 6)
        {
          -[PSSwitchTableCell setAccessoryView:](self, "setAccessoryView:", 0);
          control = self->super._control;
          v21 = 1;
LABEL_13:
          -[UIControl setHidden:](control, "setHidden:", v21);
          return;
        }
        -[UIControl removeFromSuperview](self->super._control, "removeFromSuperview");
      }
    }
  }
  else if (activityIndicator)
  {
    -[UIActivityIndicatorView removeFromSuperview](activityIndicator, "removeFromSuperview");
    v22 = self->_activityIndicator;
    self->_activityIndicator = 0;

    if (self->super._control)
    {
      if (-[PSSwitchTableCell tag](self, "tag") == 6)
      {
        -[PSSwitchTableCell setAccessoryView:](self, "setAccessoryView:", self->super._control);
        control = self->super._control;
        v21 = 0;
        goto LABEL_13;
      }
      -[PSSwitchTableCell contentView](self, "contentView");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addSubview:", self->super._control);

    }
  }
}

- (id)controlValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIControl isOn](self->super._control, "isOn"));
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)PSSwitchTableCell;
  -[PSTableCell reloadWithSpecifier:animated:](&v7, sel_reloadWithSpecifier_animated_, a3);
  v6 = objc_msgSend(self->super.super._value, "BOOLValue");
  if (v6 != -[UIControl isOn](self->super._control, "isOn"))
    -[UIControl setOn:animated:](self->super._control, "setOn:animated:", objc_msgSend(self->super.super._value, "BOOLValue"), v4);
}

- (BOOL)shouldUseModernLayout
{
  int v3;

  v3 = -[PSSwitchTableCell isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  if (v3)
    LOBYTE(v3) = self->_activityIndicator == 0;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
