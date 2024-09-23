@implementation TTRIUIDividedGridViewCell

- (TTRIUIDividedGridViewCell)initWithBackgroundColor:(id)a3
{
  id v5;
  TTRIUIDividedGridViewCell *v6;
  TTRIUIDividedGridViewCell *v7;

  v5 = a3;
  v6 = -[TTRIUIDividedGridViewCell init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bgColor, a3);
    -[TTRIUIDividedGridViewCell setBackgroundColor:](v7, "setBackgroundColor:", v7->_bgColor);
  }

  return v7;
}

- (TTRIUIDividedGridViewCell)init
{
  TTRIUIDividedGridViewCell *v2;
  uint64_t v3;
  UILabel *label;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TTRIUIDividedGridViewCell;
  v2 = -[TTRIUIDividedGridViewCell init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    label = v2->_label;
    v2->_label = (UILabel *)v3;

    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v5);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TTRIUIDividedGridViewCell addSubview:](v2, "addSubview:", v2->_label);
    v6 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_label"), v2->_label, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(7)-[_label]-(7)-|"), 1024, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIUIDividedGridViewCell addConstraints:](v2, "addConstraints:", v8);

    v9 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_label"), v2->_label, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(0)-[_label]-(0)-|"), 512, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIUIDividedGridViewCell addConstraints:](v2, "addConstraints:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIUIDividedGridViewCell setBackgroundColor:](v2, "setBackgroundColor:", v12);

  }
  return v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  -[TTRIUIDividedGridViewCell viewController](self, "viewController", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellTapped:", self);

}

- (id)selectedTextColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_selected = a3;
  if (-[TTRIUIDividedGridViewCell selected](self, "selected"))
  {
    -[TTRIUIDividedGridViewCell tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    -[TTRIUIDividedGridViewCell traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolvedColorWithTraitCollection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TTRIUIDividedGridViewCell setBackgroundColor:](self, "setBackgroundColor:", v9);
  }
  else
  {
    if (self->_bgColor)
    {
      -[TTRIUIDividedGridViewCell setBackgroundColor:](self, "setBackgroundColor:");
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIUIDividedGridViewCell setBackgroundColor:](self, "setBackgroundColor:", v7);
  }

LABEL_10:
  if (-[TTRIUIDividedGridViewCell selected](self, "selected"))
    -[TTRIUIDividedGridViewCell selectedTextColor](self, "selectedTextColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewCell label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v11);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTRIUIDividedGridViewCell;
  v3 = -[TTRIUIDividedGridViewCell accessibilityTraits](&v6, sel_accessibilityTraits);
  if (self->_selected)
    v4 = *MEMORY[0x1E0DC46B0];
  else
    v4 = 0;
  return *MEMORY[0x1E0DC4660] | v3 | v4;
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (BOOL)selected
{
  return self->_selected;
}

- (TTRIDividedGridViewController)viewController
{
  return (TTRIDividedGridViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_widthConstraint);
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_widthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_widthConstraint);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bgColor, 0);
}

@end
