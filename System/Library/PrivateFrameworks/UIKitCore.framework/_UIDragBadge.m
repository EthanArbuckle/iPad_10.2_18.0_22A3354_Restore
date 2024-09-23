@implementation _UIDragBadge

- (_UIDragBadge)initWithFrame:(CGRect)a3
{
  _UIDragBadge *v3;
  _UIDragBadge *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDragBadge;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    CommonInit_0(v3);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDragBadge;
  v4 = a3;
  -[UIView encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_itemCount, CFSTR("UIDragBadgeItemCount"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("UIDragBadgeStyle"));

}

- (_UIDragBadge)initWithCoder:(id)a3
{
  id v4;
  _UIDragBadge *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIDragBadge;
  v5 = -[UIView initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_itemCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIDragBadgeItemCount"));
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIDragBadgeStyle"));
    CommonInit_0(v5);
  }

  return v5;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setItemCount:(int64_t)a3
{
  if (self->_itemCount != a3)
  {
    self->_itemCount = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateLabelTextFromItemCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  dispatch_once_t *v8;
  void *v9;
  id v10;

  if (qword_1ECD7A928 != -1)
    dispatch_once(&qword_1ECD7A928, &__block_literal_global_172);
  if (self->_itemCount >= 2)
  {
    v3 = (void *)_MergedGlobals_5_6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromNumber:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, objc_msgSend(v10, "length"));
    v6 = v5;
    -[UILabel setText:](self->_label, "setText:", v10);
    if (v6 <= 1)
    {
      if (qword_1ECD7A948 == -1)
      {
        v7 = &qword_1ECD7A940;
        goto LABEL_10;
      }
      v7 = &qword_1ECD7A940;
      v8 = &qword_1ECD7A948;
      v9 = &__block_literal_global_49_1;
    }
    else
    {
      if (qword_1ECD7A958 == -1)
      {
        v7 = &qword_1ECD7A950;
LABEL_10:
        -[UILabel setFont:](self->_label, "setFont:", *v7);

        return;
      }
      v7 = &qword_1ECD7A950;
      v8 = &qword_1ECD7A958;
      v9 = &__block_literal_global_50;
    }
    dispatch_once(v8, v9);
    goto LABEL_10;
  }
}

- (void)_updateForStyle
{
  void *v2;
  int64_t style;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  id v13;
  const __CFString *v14;
  void *v15;

  style = self->_style;
  if (style == 2)
  {
    v6 = _AXDarkenSystemColors();
    +[UIColor systemGrayColor](UIColor, "systemGrayColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[UIColor _accessibilityDarkenedColorForColor:](UIColor, "_accessibilityDarkenedColorForColor:", v2);
      v7 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v7;
    }
  }
  else
  {
    if (style == 1)
    {
      if (_AXDarkenSystemColors())
        +[UIColor systemDarkGreenColor](UIColor, "systemDarkGreenColor");
      else
        +[UIColor systemGreenColor](UIColor, "systemGreenColor");
    }
    else
    {
      if (style)
        goto LABEL_13;
      if (_AXDarkenSystemColors())
        +[UIColor systemDarkBlueColor](UIColor, "systemDarkBlueColor");
      else
        +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    }
    v5 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v5;
  }
LABEL_13:
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v2);

  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", 1.0);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGColor");
  -[UIView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v10);

  v12 = self->_style;
  -[UIView traitCollection](self, "traitCollection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == 1)
  {
    v14 = CFSTR("plus");
  }
  else
  {
    if (v12 != 2)
    {
      v15 = 0;
      goto LABEL_19;
    }
    v14 = CFSTR("nosign");
  }
  +[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  -[UIImageView setImage:](self->_imageView, "setImage:", v15);
  -[UIView sizeToFit](self->_imageView, "sizeToFit");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)layoutSubviews
{
  UIUserInterfaceLayoutDirection v3;
  _BOOL4 v4;
  _BOOL4 v5;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *imageView;
  CGRect v17;
  CGRect v18;
  CGRect remainder;
  CGRect slice;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[_UIDragBadge _updateForStyle](self, "_updateForStyle");
  if (self->_itemCount < 2)
  {
    -[UIView setHidden:](self->_label, "setHidden:", 1);
    -[UIView setAlpha:](self->_imageView, "setAlpha:", 1.0);
    -[UIView bounds](self, "bounds");
    -[UIImageView setCenter:](self->_imageView, "setCenter:", v12 + v11 * 0.5, v14 + v13 * 0.5);
    if (self->_style)
      v15 = 1.0;
    else
      v15 = 0.0;
    imageView = self;
  }
  else
  {
    -[_UIDragBadge _updateLabelTextFromItemCount](self, "_updateLabelTextFromItemCount");
    -[UIView setHidden:](self->_label, "setHidden:", 0);
    -[UIView setAlpha:](self, "setAlpha:", 1.0);
    if (self->_style)
    {
      v3 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      memset(&slice, 0, sizeof(slice));
      v4 = v3 != UIUserInterfaceLayoutDirectionLeftToRight;
      v5 = v3 == UIUserInterfaceLayoutDirectionLeftToRight;
      memset(&remainder, 0, sizeof(remainder));
      memset(&v18, 0, sizeof(v18));
      -[UIView bounds](self, "bounds");
      CGRectDivide(v21, &slice, &remainder, 25.0, (CGRectEdge)(2 * v4));
      memset(&v17, 0, sizeof(v17));
      CGRectDivide(remainder, &v17, &v18, 6.0, (CGRectEdge)(2 * v5));
      -[UILabel setFrame:](self->_label, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
      -[UIView setAlpha:](self->_imageView, "setAlpha:", 1.0);
      __asm { FMOV            V2.2D, #0.5 }
      -[UIImageView setCenter:](self->_imageView, "setCenter:", vaddq_f64((float64x2_t)slice.origin, vmulq_f64((float64x2_t)slice.size, _Q2)));
      return;
    }
    -[UIView bounds](self, "bounds");
    v23 = CGRectInset(v22, 6.0, 0.0);
    -[UILabel setFrame:](self->_label, "setFrame:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
    imageView = self->_imageView;
    v15 = 0.0;
  }
  objc_msgSend(imageView, "setAlpha:", v15);
}

- (CGPoint)anchorPointForAlignment
{
  int64_t itemCount;
  double v3;
  BOOL v4;
  double v5;
  double v6;
  CGPoint result;

  itemCount = self->_itemCount;
  if (itemCount > 9 || ((v3 = 0.5, itemCount >= 2) ? (v4 = self->_style == 0) : (v4 = 1), !v4))
  {
    -[_UIDragBadge _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v3 = -12.5 / v5 + 1.0;
  }
  v6 = 0.5;
  result.y = v6;
  result.x = v3;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = 25.0;
  if (self->_itemCount >= 2)
  {
    -[UIView systemLayoutSizeFittingSize:](self->_label, "systemLayoutSizeFittingSize:", a3.width, a3.height, 25.0);
    v6 = 31.0;
    if (!self->_style)
      v6 = 12.0;
    v7 = v5 + v6;
    if (v7 >= 25.0)
      v3 = v7;
    else
      v3 = 25.0;
  }
  v8 = 25.0;
  v9 = v3;
  result.height = v8;
  result.width = v9;
  return result;
}

- (UILabel)_label
{
  return self->_label;
}

- (UIImageView)_imageView
{
  return self->_imageView;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

@end
