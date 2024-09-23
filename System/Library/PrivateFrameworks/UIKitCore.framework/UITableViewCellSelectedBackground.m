@implementation UITableViewCellSelectedBackground

- (void)setSelectionStyle:(int64_t)a3
{
  if (self->_selectionStyle != a3)
  {
    self->_selectionStyle = a3;
    -[UITableViewCellSelectedBackground setSelectionTintColor:](self, "setSelectionTintColor:", 0);
    -[UITableViewCellSelectedBackground updateBackgroundColor](self, "updateBackgroundColor");
  }
}

- (void)setSelectionTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_selectionTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectionTintColor, a3);
    -[UITableViewCellSelectedBackground updateBackgroundColor](self, "updateBackgroundColor");
    v5 = v6;
  }

}

- (void)setSelectionEffects:(id)a3
{
  id v4;
  UIVisualEffectView *selectionEffectsView;
  UIVisualEffectView *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *v9;
  id v10;

  v4 = a3;
  selectionEffectsView = self->_selectionEffectsView;
  v10 = v4;
  if (v4)
  {
    if (!selectionEffectsView)
    {
      v6 = [UIVisualEffectView alloc];
      -[UIView bounds](self, "bounds");
      v7 = -[UIVisualEffectView initWithFrame:](v6, "initWithFrame:");
      v8 = self->_selectionEffectsView;
      self->_selectionEffectsView = v7;

      -[UIView addSubview:](self, "addSubview:", self->_selectionEffectsView);
      v4 = v10;
      selectionEffectsView = self->_selectionEffectsView;
    }
    -[UIVisualEffectView setBackgroundEffects:](selectionEffectsView, "setBackgroundEffects:", v4);
  }
  else
  {
    -[UIView removeFromSuperview](selectionEffectsView, "removeFromSuperview");
    v9 = self->_selectionEffectsView;
    self->_selectionEffectsView = 0;

  }
  -[UITableViewCellSelectedBackground updateBackgroundColor](self, "updateBackgroundColor");

}

- (void)updateBackgroundColor
{
  uint64_t v3;
  id v4;
  void *v5;
  int64_t selectionStyle;
  id v7;

  if (self->_selectionEffectsView)
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", 0);
    return;
  }
  if (!self->_multiselect)
  {
    if (!self->_selectionStyle)
    {
      v3 = 456;
      goto LABEL_5;
    }
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom") == 3)
    {
      selectionStyle = self->_selectionStyle;
      if (selectionStyle == 1)
      {

LABEL_14:
        -[UIView tintColor](self, "tintColor");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }

      if (selectionStyle == 3)
        goto LABEL_14;
    }
    else
    {

    }
    v3 = 448;
    goto LABEL_5;
  }
  v3 = 440;
LABEL_5:
  v4 = *(id *)((char *)&self->super.super.super.isa + v3);
LABEL_6:
  v7 = v4;
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (void)setNoneStyleBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_noneStyleBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_noneStyleBackgroundColor, a3);
    -[UITableViewCellSelectedBackground updateBackgroundColor](self, "updateBackgroundColor");
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noneStyleBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectionTintColor, 0);
  objc_storeStrong((id *)&self->_multiselectBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectionEffectsView, 0);
}

- (void)setMultiselect:(BOOL)a3
{
  if (self->_multiselect != a3)
  {
    self->_multiselect = a3;
    -[UITableViewCellSelectedBackground updateBackgroundColor](self, "updateBackgroundColor");
  }
}

- (NSArray)selectionEffects
{
  return -[UIVisualEffectView backgroundEffects](self->_selectionEffectsView, "backgroundEffects");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellSelectedBackground;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_selectionEffectsView, "setFrame:");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellSelectedBackground;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[UITableViewCellSelectedBackground updateBackgroundColor](self, "updateBackgroundColor");
}

- (int64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (UIColor)multiselectBackgroundColor
{
  return self->_multiselectBackgroundColor;
}

- (void)setMultiselectBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_multiselectBackgroundColor, a3);
}

- (BOOL)isMultiselect
{
  return self->_multiselect;
}

- (UIColor)selectionTintColor
{
  return self->_selectionTintColor;
}

- (UIColor)noneStyleBackgroundColor
{
  return self->_noneStyleBackgroundColor;
}

@end
