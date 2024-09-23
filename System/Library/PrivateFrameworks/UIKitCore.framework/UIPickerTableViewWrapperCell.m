@implementation UIPickerTableViewWrapperCell

- (UIPickerTableViewWrapperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  UIPickerTableViewWrapperCell *v4;
  void *v5;
  UIView *v6;
  uint64_t v7;
  UIView *wrappedViewContainer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIPickerTableViewWrapperCell;
  v4 = -[UIPickerTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UITableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = [UIView alloc];
    -[UIView bounds](v4, "bounds");
    v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
    wrappedViewContainer = v4->_wrappedViewContainer;
    v4->_wrappedViewContainer = (UIView *)v7;

    -[UIView setAutoresizingMask:](v4->_wrappedViewContainer, "setAutoresizingMask:", 0);
    -[UIView addSubview:](v4, "addSubview:", v4->_wrappedViewContainer);
  }
  return v4;
}

- (void)_setIsCenterCell:(BOOL)a3 shouldModifyAlphaOfView:(BOOL)a4
{
  UIView *wrappedViewContainer;
  double v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (a4)
  {
    wrappedViewContainer = self->_wrappedViewContainer;
    v7 = 0.447;
    if (a3)
      v7 = 1.0;
    -[UIView setAlpha:](wrappedViewContainer, "setAlpha:", v7);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[UIView useDigitFont](self->_wrappedView, "useDigitFont");
      if (a3)
      {
        if ((v8 & 1) != 0)
        {
          -[UIPickerTableViewCell style](self, "style");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView traitCollection](self, "traitCollection");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "centerCellDigitFontWithTraitCollection:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        goto LABEL_12;
      }
      if ((v8 & 1) != 0)
      {
        -[UIPickerTableViewCell style](self, "style");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView traitCollection](self, "traitCollection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "nonCenterCellDigitFontWithTraitCollection:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else if (a3)
    {
LABEL_12:
      -[UIPickerTableViewCell style](self, "style");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerCellFontWithTraitCollection:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    -[UIPickerTableViewCell style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nonCenterCellFontWithTraitCollection:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v17 = (void *)v11;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView titleLabel](self->_wrappedView, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v14 = v17;
      if ((isKindOfClass & 1) == 0)
      {
LABEL_22:

        return;
      }
      -[UIView dateLabel](self->_wrappedView, "dateLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFont:", v17);

      -[UIView weekdayLabel](self->_wrappedView, "weekdayLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v12;
    objc_msgSend(v12, "setFont:", v17);

    v14 = v17;
    goto LABEL_22;
  }
}

- (void)_updateWrappedViewFrame
{
  CGFloat v3;
  CGFloat v4;
  double width;
  double height;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 IsEmpty;
  double v24;
  double v25;
  CGRect v26;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  width = self->_wrappedViewSize.width;
  height = self->_wrappedViewSize.height;
  -[UIView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIPickerTableViewWrapperCell wrappedViewInsets](self, "wrappedViewInsets");
  v16 = v8 + v15;
  v18 = v10 + v17;
  v20 = v12 - (v15 + v19);
  v22 = v14 - (v17 + v21);
  v26.origin.x = v3;
  v26.origin.y = v4;
  v26.size.width = width;
  v26.size.height = height;
  IsEmpty = CGRectIsEmpty(v26);
  if (IsEmpty)
    v24 = v22;
  else
    v24 = height;
  if (IsEmpty)
    v25 = v20;
  else
    v25 = width;
  -[UIView setFrame:](self->_wrappedView, "setFrame:", round(v16 + (v20 - v25) * 0.5), round(v18 + (v22 - v24) * 0.5));
}

- (void)_updateWrappedView
{
  CGSize *p_wrappedViewSize;
  UIView *wrappedView;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;

  p_wrappedViewSize = &self->_wrappedViewSize;
  wrappedView = self->_wrappedView;
  if (wrappedView)
  {
    -[UIView frame](wrappedView, "frame");
    p_wrappedViewSize->width = v5;
    p_wrappedViewSize->height = v6;
  }
  else
  {
    *p_wrappedViewSize = *(CGSize *)MEMORY[0x1E0C9D820];
  }
  -[UIView backgroundColor](self->_wrappedView, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_wrappedView, "setBackgroundColor:", v8);

  }
  -[UIPickerTableViewWrapperCell _updateWrappedViewFrame](self, "_updateWrappedViewFrame");
  -[UITableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

- (UIView)wrappedView
{
  return self->_wrappedView;
}

- (void)setWrappedView:(id)a3
{
  UIView *v5;
  UIView *wrappedView;
  UIView *v7;

  v5 = (UIView *)a3;
  wrappedView = self->_wrappedView;
  v7 = v5;
  if (wrappedView != v5)
  {
    -[UIView removeFromSuperview](wrappedView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_wrappedView, a3);
    -[UIView addSubview:](self->_wrappedViewContainer, "addSubview:", self->_wrappedView);
  }
  -[UIPickerTableViewWrapperCell _updateWrappedView](self, "_updateWrappedView");

}

- (void)setWrappedViewInsets:(UIEdgeInsets)a3
{
  if (self->_wrappedViewInsets.left != a3.left
    || self->_wrappedViewInsets.top != a3.top
    || self->_wrappedViewInsets.right != a3.right
    || self->_wrappedViewInsets.bottom != a3.bottom)
  {
    self->_wrappedViewInsets = a3;
    -[UIPickerTableViewWrapperCell _updateWrappedViewFrame](self, "_updateWrappedViewFrame");
  }
}

- (void)resizeSubviewsWithOldSize:(CGSize)a3
{
  UIView *wrappedView;
  CGSize *p_wrappedViewSize;
  CGFloat v6;
  CGFloat v7;

  -[UIPickerTableViewWrapperCell _updateWrappedViewFrame](self, "_updateWrappedViewFrame", a3.width, a3.height);
  wrappedView = self->_wrappedView;
  if (wrappedView)
  {
    p_wrappedViewSize = &self->_wrappedViewSize;
    -[UIView frame](wrappedView, "frame");
    p_wrappedViewSize->width = v6;
    p_wrappedViewSize->height = v7;
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPickerTableViewWrapperCell;
  -[UITableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIView setChecked:](self->_wrappedView, "setChecked:", 0);
}

- (id)_anyDateLabel
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView titleLabel](self->_wrappedView, "titleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView dateLabel](self->_wrappedView, "dateLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (UIEdgeInsets)wrappedViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_wrappedViewInsets.top;
  left = self->_wrappedViewInsets.left;
  bottom = self->_wrappedViewInsets.bottom;
  right = self->_wrappedViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedViewContainer, 0);
  objc_storeStrong((id *)&self->_wrappedView, 0);
}

@end
