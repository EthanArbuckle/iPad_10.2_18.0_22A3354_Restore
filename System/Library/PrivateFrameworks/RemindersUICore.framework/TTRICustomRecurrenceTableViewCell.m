@implementation TTRICustomRecurrenceTableViewCell

+ (id)reuseIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__TTRICustomRecurrenceTableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken_0 != -1)
    dispatch_once(&reuseIdentifier_onceToken_0, block);
  return (id)reuseIdentifier_reuseIdentifier_0;
}

void __52__TTRICustomRecurrenceTableViewCell_reuseIdentifier__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reuseIdentifier_reuseIdentifier_0;
  reuseIdentifier_reuseIdentifier_0 = v1;

}

+ (double)rowSeparatorThickness
{
  double v2;

  EKUIScaleFactor();
  return 1.0 / v2;
}

+ (BOOL)vibrant
{
  return 0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TTRICustomRecurrenceTableViewCell;
  -[TTRICustomRecurrenceTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[TTRICustomRecurrenceTableViewCell _layoutSeparator](self, "_layoutSeparator");
}

- (void)_layoutSeparator
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;

  if (self->_separatorViewForNonOpaqueTables)
  {
    objc_msgSend((id)objc_opt_class(), "rowSeparatorThickness");
    v4 = v3;
    -[TTRICustomRecurrenceTableViewCell bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = -[TTRICustomRecurrenceTableViewCell usesInsetMargin](self, "usesInsetMargin");
    v12 = 15.0;
    if (!v11)
      v12 = v6;
    -[TTRICustomRecurrenceCellRowSeparatorView setFrame:](self->_separatorViewForNonOpaqueTables, "setFrame:", v12, v10 - v4, v8, v4);
  }
}

- (void)setUsesInsetMargin:(BOOL)a3
{
  self->_usesInsetMargin = a3;
  -[TTRICustomRecurrenceTableViewCell _setMarginExtendsToFullWidth:](self, "_setMarginExtendsToFullWidth:", !a3);
}

- (void)setRowSeparatorColor:(id)a3
{
  TTRICustomRecurrenceCellRowSeparatorView *separatorViewForNonOpaqueTables;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_rowSeparatorColor, a3);
  separatorViewForNonOpaqueTables = self->_separatorViewForNonOpaqueTables;
  if (separatorViewForNonOpaqueTables)
    -[TTRICustomRecurrenceCellRowSeparatorView setBackgroundColor:](separatorViewForNonOpaqueTables, "setBackgroundColor:", self->_rowSeparatorColor);

}

- (void)setRowSeparatorVisualEffect:(id)a3
{
  UIVisualEffect **p_rowSeparatorVisualEffect;
  id v6;

  p_rowSeparatorVisualEffect = &self->_rowSeparatorVisualEffect;
  objc_storeStrong((id *)&self->_rowSeparatorVisualEffect, a3);
  v6 = a3;
  -[UIVisualEffectView setEffect:](self->_rowSeparatorParentView, "setEffect:", *p_rowSeparatorVisualEffect);

}

- (void)setDrawsOwnRowSeparators:(BOOL)a3
{
  _BOOL4 v3;
  TTRICustomRecurrenceTableViewCell *v4;
  id v5;
  uint64_t v6;
  UIVisualEffectView *rowSeparatorParentView;
  uint64_t v8;
  UIVisualEffect *rowSeparatorVisualEffect;
  void *v10;
  TTRICustomRecurrenceCellRowSeparatorView *separatorViewForNonOpaqueTables;
  TTRICustomRecurrenceCellRowSeparatorView *v12;
  TTRICustomRecurrenceCellRowSeparatorView *v13;
  void *v14;
  uint64_t v15;
  TTRICustomRecurrenceCellRowSeparatorView *v16;
  void *v17;
  UIVisualEffectView *v18;
  UIVisualEffectView *v19;
  id v20;

  v3 = a3;
  v4 = self;
  v20 = v4;
  if (objc_msgSend((id)objc_opt_class(), "vibrant"))
  {
    if (v3 && !v4->_rowSeparatorParentView)
    {
      v5 = objc_alloc(MEMORY[0x1E0DC3F58]);
      -[TTRICustomRecurrenceTableViewCell bounds](v4, "bounds");
      v6 = objc_msgSend(v5, "initWithFrame:");
      rowSeparatorParentView = v4->_rowSeparatorParentView;
      v4->_rowSeparatorParentView = (UIVisualEffectView *)v6;

      -[TTRICustomRecurrenceTableViewCell rowSeparatorVisualEffect](v4, "rowSeparatorVisualEffect");
      v8 = objc_claimAutoreleasedReturnValue();
      rowSeparatorVisualEffect = v4->_rowSeparatorVisualEffect;
      v4->_rowSeparatorVisualEffect = (UIVisualEffect *)v8;

      -[UIVisualEffectView setAutoresizingMask:](v4->_rowSeparatorParentView, "setAutoresizingMask:", 18);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setBackgroundColor:](v4->_rowSeparatorParentView, "setBackgroundColor:", v10);

      -[TTRICustomRecurrenceTableViewCell addSubview:](v4, "addSubview:", v4->_rowSeparatorParentView);
    }
    -[UIVisualEffectView contentView](v4->_rowSeparatorParentView, "contentView");
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  v4->_drawsOwnRowSeparators = v3;
  separatorViewForNonOpaqueTables = v4->_separatorViewForNonOpaqueTables;
  if (v3)
  {
    if (!separatorViewForNonOpaqueTables)
    {
      v12 = objc_alloc_init(TTRICustomRecurrenceCellRowSeparatorView);
      v13 = v4->_separatorViewForNonOpaqueTables;
      v4->_separatorViewForNonOpaqueTables = v12;

      -[TTRICustomRecurrenceCellRowSeparatorView setVibrant:](v4->_separatorViewForNonOpaqueTables, "setVibrant:", objc_msgSend((id)objc_opt_class(), "vibrant"));
      if (objc_msgSend((id)objc_opt_class(), "vibrant"))
      {
        -[UIVisualEffectView contentView](v4->_rowSeparatorParentView, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "tintColor");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[TTRICustomRecurrenceTableViewCell rowSeparatorColor](v4, "rowSeparatorColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[TTRICustomRecurrenceTableViewCell rowSeparatorColor](v4, "rowSeparatorColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.78, 1.0);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v15;
      -[TTRICustomRecurrenceCellRowSeparatorView setBackgroundColor:](v4->_separatorViewForNonOpaqueTables, "setBackgroundColor:", v15);

      objc_msgSend(v20, "addSubview:", v4->_separatorViewForNonOpaqueTables);
    }
  }
  else if (separatorViewForNonOpaqueTables)
  {
    -[TTRICustomRecurrenceCellRowSeparatorView removeFromSuperview](separatorViewForNonOpaqueTables, "removeFromSuperview");
    v16 = v4->_separatorViewForNonOpaqueTables;
    v4->_separatorViewForNonOpaqueTables = 0;

  }
  if (objc_msgSend((id)objc_opt_class(), "vibrant"))
  {
    if (!v4->_drawsOwnRowSeparators)
    {
      v18 = v4->_rowSeparatorParentView;
      if (v18)
      {
        -[UIVisualEffectView removeFromSuperview](v18, "removeFromSuperview");
        v19 = v4->_rowSeparatorParentView;
        v4->_rowSeparatorParentView = 0;

      }
    }
  }

}

- (void)_setMarginExtendsToFullWidth:(BOOL)a3
{
  double v3;

  v3 = 15.0;
  if (a3)
    v3 = 0.0;
  -[TTRICustomRecurrenceTableViewCell _setMarginWidth:](self, "_setMarginWidth:", v3);
}

- (BOOL)drawsOwnRowSeparators
{
  return self->_drawsOwnRowSeparators;
}

- (UIColor)rowSeparatorColor
{
  return self->_rowSeparatorColor;
}

- (UIVisualEffect)rowSeparatorVisualEffect
{
  return self->_rowSeparatorVisualEffect;
}

- (BOOL)usesInsetMargin
{
  return self->_usesInsetMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowSeparatorVisualEffect, 0);
  objc_storeStrong((id *)&self->_rowSeparatorColor, 0);
  objc_storeStrong((id *)&self->_separatorViewForNonOpaqueTables, 0);
  objc_storeStrong((id *)&self->_rowSeparatorParentView, 0);
}

@end
