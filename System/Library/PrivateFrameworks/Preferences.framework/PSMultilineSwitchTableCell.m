@implementation PSMultilineSwitchTableCell

- (PSMultilineSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PSMultilineSwitchTableCell *v5;
  PSMultilineSwitchTableCell *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSMultilineSwitchTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSMultilineSwitchTableCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    -[PSMultilineSwitchTableCell setAccessoryType:](v6, "setAccessoryType:", 0);
    v7 = -[PSMultilineSwitchTableCell newControl](v6, "newControl");
    -[PSMultilineSwitchTableCell setControl:](v6, "setControl:", v7);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, sel_controlChanged_, 4096);
    -[PSMultilineSwitchTableCell control](v6, "control");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSMultilineSwitchTableCell setAccessoryView:](v6, "setAccessoryView:", v8);

  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSMultilineSwitchTableCell;
  v4 = a3;
  -[PSMultilineTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSMultilineSwitchTableCell control](self, "control", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v5, CFSTR("control"));

  objc_msgSend(v4, "propertyForKey:", CFSTR("control-loading"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[PSMultilineSwitchTableCell setLoading:](self, "setLoading:", objc_msgSend(v6, "BOOLValue"));

}

- (BOOL)canReload
{
  return 1;
}

- (id)valueLabel
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v6;

  -[PSTableCell setCellTarget:](self, "setCellTarget:", 0);
  -[PSMultilineSwitchTableCell control](self, "control");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PSMultilineSwitchTableCell control](self, "control");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  }
  v6.receiver = self;
  v6.super_class = (Class)PSMultilineSwitchTableCell;
  -[PSTableCell dealloc](&v6, sel_dealloc);
}

- (void)setControl:(id)a3
{
  UIControl *v5;
  UIControl **p_control;
  void *v7;
  UIControl *v8;

  v5 = (UIControl *)a3;
  p_control = &self->_control;
  if (self->_control != v5)
  {
    v8 = v5;
    -[PSMultilineSwitchTableCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    if (*p_control)
      -[UIControl removeFromSuperview](*p_control, "removeFromSuperview");
    objc_storeStrong((id *)p_control, a3);
    v5 = v8;
  }

}

- (void)controlChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[PSTableCell cellTarget](self, "cellTarget");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PSTableCell specifier](self, "specifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PSTableCell cellAction](self, "cellAction");
      -[PSTableCell cellTarget](self, "cellTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineSwitchTableCell controlValue](self, "controlValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell specifier](self, "specifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)SFPerformSelector2();

    }
  }
  -[PSTableCell cellTarget](self, "cellTarget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PSTableCell cellTarget](self, "cellTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = (objc_class *)objc_opt_class();

  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8D658], "trackingControlValueChanged:sender:", v18, v17);

}

- (void)setCellEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PSMultilineSwitchTableCell;
  -[PSTableCell setCellEnabled:](&v6, sel_setCellEnabled_);
  -[PSMultilineSwitchTableCell control](self, "control");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[PSMultilineSwitchTableCell setLoading:](self, "setLoading:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSMultilineSwitchTableCell;
  -[PSTableCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (id)newControl
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA38]), "initWithFrame:", 0.0, 0.0, 51.0, 31.0);
}

- (BOOL)loading
{
  void *v2;
  BOOL v3;

  -[PSMultilineSwitchTableCell activityIndicator](self, "activityIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)spinnerStyle
{
  return 100;
}

- (void)setLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = a3;
  -[PSMultilineSwitchTableCell activityIndicator](self, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      -[PSMultilineSwitchTableCell contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;
      v10 = v9;

      objc_msgSend(MEMORY[0x1E0CEA2C8], "defaultSizeForStyle:", -[PSMultilineSwitchTableCell spinnerStyle](self, "spinnerStyle"));
      v12 = v11;
      v14 = v13;
      v15 = -[PSMultilineSwitchTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection")? 9.0: v8 + -9.0 - v12;
      v16 = (v10 - v14) * 0.5;
      v17 = ceilf(v16);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", -[PSMultilineSwitchTableCell spinnerStyle](self, "spinnerStyle"));
      -[PSMultilineSwitchTableCell setActivityIndicator:](self, "setActivityIndicator:", v18);

      -[PSMultilineSwitchTableCell activityIndicator](self, "activityIndicator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFrame:", v15, v17, v12, v14);

      -[PSMultilineSwitchTableCell activityIndicator](self, "activityIndicator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startAnimating");

      -[PSMultilineSwitchTableCell contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineSwitchTableCell activityIndicator](self, "activityIndicator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

      -[PSMultilineSwitchTableCell control](self, "control");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if (-[PSMultilineSwitchTableCell tag](self, "tag") != 6)
        {
          -[PSMultilineSwitchTableCell control](self, "control");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "removeFromSuperview");
          goto LABEL_17;
        }
        -[PSMultilineSwitchTableCell setAccessoryView:](self, "setAccessoryView:", 0);
        -[PSMultilineSwitchTableCell control](self, "control");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v24;
        v25 = 1;
        goto LABEL_13;
      }
    }
  }
  else if (v5)
  {
    -[PSMultilineSwitchTableCell activityIndicator](self, "activityIndicator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeFromSuperview");

    -[PSMultilineSwitchTableCell setActivityIndicator:](self, "setActivityIndicator:", 0);
    -[PSMultilineSwitchTableCell control](self, "control");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      if (-[PSMultilineSwitchTableCell tag](self, "tag") != 6)
      {
        -[PSMultilineSwitchTableCell contentView](self, "contentView");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        -[PSMultilineSwitchTableCell control](self, "control");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addSubview:", v29);

        goto LABEL_17;
      }
      -[PSMultilineSwitchTableCell control](self, "control");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineSwitchTableCell setAccessoryView:](self, "setAccessoryView:", v28);

      -[PSMultilineSwitchTableCell control](self, "control");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v24;
      v25 = 0;
LABEL_13:
      objc_msgSend(v24, "setHidden:", v25);
LABEL_17:

    }
  }
}

- (id)controlValue
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PSMultilineSwitchTableCell control](self, "control");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isOn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int v6;
  void *v7;
  int v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PSMultilineSwitchTableCell;
  -[PSTableCell reloadWithSpecifier:animated:](&v10, sel_reloadWithSpecifier_animated_, a3);
  v6 = objc_msgSend(self->super.super._value, "BOOLValue");
  -[PSMultilineSwitchTableCell control](self, "control");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isOn");

  if (v6 != v8)
  {
    -[PSMultilineSwitchTableCell control](self, "control");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOn:animated:", objc_msgSend(self->super.super._value, "BOOLValue"), v4);

  }
}

- (void)setValue:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (self->super.super._value != v6)
  {
    objc_storeStrong(&self->super.super._value, a3);
    -[PSMultilineSwitchTableCell control](self, "control");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOn:", objc_msgSend(v6, "intValue") != 0);

  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;

  -[PSMultilineSwitchTableCell backgroundColor](self, "backgroundColor", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSMultilineSwitchTableCell selectedBackgroundView](self, "selectedBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIControl)control
{
  return self->_control;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
