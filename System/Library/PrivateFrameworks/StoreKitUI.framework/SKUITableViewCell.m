@implementation SKUITableViewCell

- (SKUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  char *v7;
  SKUITableViewCell *v8;
  __int128 v9;
  objc_super v11;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUITableViewCell;
  v7 = -[SKUITableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = (SKUITableViewCell *)v7;
  if (v7)
  {
    *((_QWORD *)v7 + 135) = 0x402E000000000000;
    v9 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)(v7 + 1048) = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)(v7 + 1064) = v9;
  }

  return v8;
}

- (UIColor)bottomBorderColor
{
  return (UIColor *)-[SKUIBorderView backgroundColor](self->_bottomBorderView, "backgroundColor");
}

- (void)setBottomBorderColor:(id)a3
{
  id v4;
  SKUIBorderView *bottomBorderView;
  SKUIBorderView *v6;
  SKUIBorderView *v7;
  SKUIBorderView *v8;
  id v9;

  v4 = a3;
  bottomBorderView = self->_bottomBorderView;
  v9 = v4;
  if (v4)
  {
    if (!bottomBorderView)
    {
      v6 = objc_alloc_init(SKUIBorderView);
      v7 = self->_bottomBorderView;
      self->_bottomBorderView = v6;

      -[SKUITableViewCell addSubview:](self, "addSubview:", self->_bottomBorderView);
      bottomBorderView = self->_bottomBorderView;
    }
    -[SKUIBorderView setColor:](bottomBorderView, "setColor:", v9);
  }
  else
  {
    -[SKUIBorderView removeFromSuperview](bottomBorderView, "removeFromSuperview");
    v8 = self->_bottomBorderView;
    self->_bottomBorderView = 0;

  }
}

- (void)setTopBorderColor:(id)a3
{
  id v4;
  SKUIBorderView *topBorderView;
  SKUIBorderView *v6;
  SKUIBorderView *v7;
  SKUIBorderView *v8;
  id v9;

  v4 = a3;
  topBorderView = self->_topBorderView;
  v9 = v4;
  if (v4)
  {
    if (!topBorderView)
    {
      v6 = objc_alloc_init(SKUIBorderView);
      v7 = self->_topBorderView;
      self->_topBorderView = v6;

      -[SKUITableViewCell addSubview:](self, "addSubview:", self->_topBorderView);
      topBorderView = self->_topBorderView;
    }
    -[SKUIBorderView setColor:](topBorderView, "setColor:", v9);
  }
  else
  {
    -[SKUIBorderView removeFromSuperview](topBorderView, "removeFromSuperview");
    v8 = self->_topBorderView;
    self->_topBorderView = 0;

  }
}

- (UIColor)topBorderColor
{
  return (UIColor *)-[SKUIBorderView backgroundColor](self->_topBorderView, "backgroundColor");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUITableViewCell;
  -[SKUITableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  self->_borderPaddingLeft = 15.0;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUITableViewCell;
  -[SKUITableViewCell setHighlighted:animated:](&v5, sel_setHighlighted_animated_, a3, a4);
  -[SKUITableViewCell _reloadBorderVisibility](self, "_reloadBorderVisibility");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUITableViewCell;
  -[SKUITableViewCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[SKUITableViewCell _reloadBorderVisibility](self, "_reloadBorderVisibility");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  SKUIBorderView *bottomBorderView;
  double borderPaddingLeft;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  SKUIBorderView *topBorderView;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double top;
  double left;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)SKUITableViewCell;
  -[SKUITableViewCell layoutSubviews](&v37, sel_layoutSubviews);
  -[SKUITableViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  bottomBorderView = self->_bottomBorderView;
  borderPaddingLeft = self->_borderPaddingLeft;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v6 - 1.0 / v10;
  v12 = v4 - self->_borderPaddingLeft;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  -[SKUIBorderView setFrame:](bottomBorderView, "setFrame:", borderPaddingLeft, v11, v12, 1.0 / v14);

  topBorderView = self->_topBorderView;
  v16 = self->_borderPaddingLeft;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  -[SKUIBorderView setFrame:](topBorderView, "setFrame:", v16, 0.0, v4 - v16, 1.0 / v18);

  -[SKUITableViewCell textLabel](self, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  top = self->_textLabelInsets.top;
  left = self->_textLabelInsets.left;
  v30 = v21 + left;
  v31 = v23 + top;
  v32 = v25 - (left + self->_textLabelInsets.right);
  v33 = v27 - (top + self->_textLabelInsets.bottom);
  -[SKUITableViewCell textLabel](self, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v30, v31, v32, v33);

  -[SKUITableViewCell textLabel](self, "textLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (storeShouldReverseLayoutDirection())
    v36 = 2;
  else
    v36 = 0;
  objc_msgSend(v35, "setTextAlignment:", v36);

}

- (void)_reloadBorderVisibility
{
  uint64_t v3;

  if ((-[SKUITableViewCell isEditing](self, "isEditing") & 1) != 0
    || !-[SKUITableViewCell selectionStyle](self, "selectionStyle"))
  {
    v3 = 0;
  }
  else if ((-[SKUITableViewCell isHighlighted](self, "isHighlighted") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = -[SKUITableViewCell isSelected](self, "isSelected");
  }
  -[SKUIBorderView setHidden:](self->_bottomBorderView, "setHidden:", v3);
  -[SKUIBorderView setHidden:](self->_topBorderView, "setHidden:", v3);
}

- (double)borderPaddingLeft
{
  return self->_borderPaddingLeft;
}

- (void)setBorderPaddingLeft:(double)a3
{
  self->_borderPaddingLeft = a3;
}

- (UIEdgeInsets)textLabelInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textLabelInsets.top;
  left = self->_textLabelInsets.left;
  bottom = self->_textLabelInsets.bottom;
  right = self->_textLabelInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextLabelInsets:(UIEdgeInsets)a3
{
  self->_textLabelInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITableViewCell initWithStyle:reuseIdentifier:]";
}

@end
