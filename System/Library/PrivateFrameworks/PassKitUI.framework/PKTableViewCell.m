@implementation PKTableViewCell

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCell;
  v4 = a3;
  -[UITableViewCell pk_applyAppearance:](&v8, sel_pk_applyAppearance_, v4);
  objc_msgSend(v4, "tableViewCellHighlightColor", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableViewCell setHighlightColor:](self, "setHighlightColor:", v5);

  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableViewCell setCheckmarkAccessoryColor:](self, "setCheckmarkAccessoryColor:", v6);

  objc_msgSend(v4, "tableViewCellAccessoryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTableViewCell setCustomAccessoryColor:](self, "setCustomAccessoryColor:", v7);
}

- (void)setHighlightColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  UIColor *highlightColor;
  id v7;
  UIColor *v8;

  v4 = (UIColor *)a3;
  if (self->_highlightColor != v4)
  {
    v8 = v4;
    v5 = (UIColor *)-[UIColor copy](v4, "copy");
    highlightColor = self->_highlightColor;
    self->_highlightColor = v5;

    if (self->_highlightColor)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v7, "setBackgroundColor:", self->_highlightColor);
      -[PKTableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v7);

    }
    else
    {
      -[PKTableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", 0);
    }
    v4 = v8;
  }

}

- (id)_checkmarkImage:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  if (self->_checkmarkAccessoryColor)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKTableViewCell;
    -[PKTableViewCell _checkmarkImage:](&v9, sel__checkmarkImage_, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTableViewCell checkmarkAccessoryColor](self, "checkmarkAccessoryColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKTableViewCell;
    -[PKTableViewCell _checkmarkImage:](&v8, sel__checkmarkImage_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_disclosureChevronImage:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  if (self->_customAccessoryColor)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKTableViewCell;
    -[PKTableViewCell _disclosureChevronImage:](&v9, sel__disclosureChevronImage_, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", self->_customAccessoryColor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageFlippedForRightToLeftLayoutDirection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKTableViewCell;
    -[PKTableViewCell _disclosureChevronImage:](&v8, sel__disclosureChevronImage_, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageFlippedForRightToLeftLayoutDirection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTableViewCell;
  -[PKTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKTableViewCell setShowsActionSpinner:](self, "setShowsActionSpinner:", 0);
}

- (void)setShowsActionSpinner:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_showsActionSpinner != a3)
  {
    self->_showsActionSpinner = a3;
    if (a3)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v5, "startAnimating");
      -[PKTableViewCell setEditingAccessoryView:](self, "setEditingAccessoryView:", v5);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v4, "startAnimating");
      -[PKTableViewCell setAccessoryView:](self, "setAccessoryView:", v4);

    }
    else
    {
      -[PKTableViewCell setEditingAccessoryView:](self, "setEditingAccessoryView:", 0);
      -[PKTableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double minimumHeight;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)PKTableViewCell;
  -[PKTableViewCell sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  if (self->_minimumHeight > minimumHeight)
    minimumHeight = self->_minimumHeight;
  result.height = minimumHeight;
  result.width = v4;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v6;
  double minimumHeight;
  objc_super v8;
  CGSize result;

  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCell;
  -[PKTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v8, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  if (self->_minimumHeight > minimumHeight)
    minimumHeight = self->_minimumHeight;
  result.height = minimumHeight;
  result.width = v6;
  return result;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (UIColor)checkmarkAccessoryColor
{
  return self->_checkmarkAccessoryColor;
}

- (void)setCheckmarkAccessoryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (UIColor)customAccessoryColor
{
  return self->_customAccessoryColor;
}

- (void)setCustomAccessoryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (BOOL)showsActionSpinner
{
  return self->_showsActionSpinner;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAccessoryColor, 0);
  objc_storeStrong((id *)&self->_checkmarkAccessoryColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
