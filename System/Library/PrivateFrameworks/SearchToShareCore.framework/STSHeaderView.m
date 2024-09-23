@implementation STSHeaderView

- (STSHeaderView)initWithFrame:(CGRect)a3
{
  STSHeaderView *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STSHeaderView;
  v3 = -[STSHeaderView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = v3->_label;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE208]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = v3->_label;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.4, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[STSHeaderView addSubview:](v3, "addSubview:", v3->_label);
    -[STSHeaderView setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");
  }
  return v3;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *constraints;
  objc_super v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)STSHeaderView;
  -[STSHeaderView updateConstraints](&v12, sel_updateConstraints);
  if (self->_constraints)
    -[STSHeaderView removeConstraints:](self, "removeConstraints:");
  _NSDictionaryOfVariableBindings(CFSTR("_label"), self->_label, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("contentInsetsTop");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_contentInsets.top);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("contentInsetsLeft");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_contentInsets.left);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("contentInsetsBottom");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_contentInsets.bottom);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("contentInsetsRight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_contentInsets.right);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(contentInsetsLeft)-[_label]-(contentInsetsRight)-|"), 0, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSHeaderView addConstraints:](self, "addConstraints:", v9);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(contentInsetsTop)-[_label]-(contentInsetsBottom)-|"), 0, v8, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSHeaderView addConstraints:](self, "addConstraints:", v10);

  constraints = self->_constraints;
  self->_constraints = 0;

}

- (void)setTitle:(id)a3
{
  NSString **p_title;
  id v6;

  p_title = &self->_title;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_label, "setText:", *p_title);
  }

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[STSHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (NSString)title
{
  return self->_title;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
