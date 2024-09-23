@implementation _UICollectionTableIndexOverlaySelectionViewCollectionViewCell

- (_UICollectionTableIndexOverlaySelectionViewCollectionViewCell)initWithFrame:(CGRect)a3
{
  _UICollectionTableIndexOverlaySelectionViewCollectionViewCell *v3;
  uint64_t v4;
  UIButton *button;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    v6 = v3->_button;
    -[UIView bounds](v3, "bounds");
    -[UIButton setFrame:](v6, "setFrame:");
    -[UIButton titleLabel](v3->_button, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    -[UIButton titleLabel](v3->_button, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", 1);

    -[UIView addSubview:](v3, "addSubview:", v3->_button);
    v3->_rightMarginAdjusted = 0;
  }
  return v3;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
  -[UIView tintColorDidChange](&v8, sel_tintColorDidChange);
  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewCell button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewCell button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v7, 1);

}

- (void)layoutSubviews
{
  UIButton *button;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  button = self->_button;
  if (self->_rightMarginAdjusted)
  {
    -[UIView sizeToFit](self->_button, "sizeToFit");
    -[UIView bounds](self->_button, "bounds");
    v5 = v4;
    v7 = v6;
    -[UIView bounds](self, "bounds");
    v10 = v9 + (v8 - v7) * 0.5;
    -[UIView bounds](self, "bounds");
    v12 = v11 - v5;
    if (!-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v12 = v12 - self->_rightMargin;
    v13 = round(v10);
    button = self->_button;
  }
  else
  {
    -[UIView bounds](self, "bounds");
    v12 = v14;
    v5 = v15;
    v7 = v16;
  }
  -[UIButton setFrame:](button, "setFrame:", v12, v13, v5, v7);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
  v4 = a3;
  -[UICollectionReusableView applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "rightMargin", v7.receiver, v7.super_class);
  v6 = v5;

  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewCell setRightMargin:](self, "setRightMargin:", v6);
}

- (void)setText:(id)a3
{
  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", a3, 0);
}

- (NSString)text
{
  return -[UIButton currentTitle](self->_button, "currentTitle");
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;

  -[UIButton titleLabel](self->_button, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", a3);

}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[UIButton titleLabel](self->_button, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAlignment");

  return v3;
}

- (void)setRightMargin:(double)a3
{
  if (a3 != 0.0)
  {
    self->_rightMarginAdjusted = 1;
    self->_rightMargin = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (UILabel)label
{
  return -[UIButton titleLabel](self->_button, "titleLabel");
}

- (UIButton)button
{
  return (UIButton *)objc_getProperty(self, a2, 648, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapTarget, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
