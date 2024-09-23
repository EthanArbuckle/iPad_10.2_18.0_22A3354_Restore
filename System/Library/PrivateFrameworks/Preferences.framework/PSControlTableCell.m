@implementation PSControlTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSControlTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSControlTableCell control](self, "control", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v5, CFSTR("control"));

}

- (UIControl)control
{
  return self->_control;
}

- (PSControlTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PSControlTableCell *v5;
  PSControlTableCell *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSControlTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSControlTableCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    -[PSControlTableCell setAccessoryType:](v6, "setAccessoryType:", 0);
    v7 = -[PSControlTableCell newControl](v6, "newControl");
    -[PSControlTableCell setControl:](v6, "setControl:", v7);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, sel_controlChanged_, 4096);

  }
  return v6;
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
    -[PSControlTableCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    if (*p_control)
      -[UIControl removeFromSuperview](*p_control, "removeFromSuperview");
    objc_storeStrong((id *)p_control, a3);
    v5 = v8;
  }

}

- (id)newControl
{
  return 0;
}

- (BOOL)canReload
{
  return 0;
}

- (id)valueLabel
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[PSTableCell setCellTarget:](self, "setCellTarget:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIControl removeTarget:action:forControlEvents:](self->_control, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)PSControlTableCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (id)controlValue
{
  return 0;
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
      -[PSControlTableCell controlValue](self, "controlValue");
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
  v6.super_class = (Class)PSControlTableCell;
  -[PSTableCell setCellEnabled:](&v6, sel_setCellEnabled_);
  -[PSControlTableCell control](self, "control");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
}

@end
