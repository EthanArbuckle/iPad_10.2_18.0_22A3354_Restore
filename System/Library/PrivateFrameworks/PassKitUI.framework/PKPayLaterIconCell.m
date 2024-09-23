@implementation PKPayLaterIconCell

- (void)setIcon:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  UIImage **p_icon;
  char isKindOfClass;
  UIView *v10;
  UIView *v11;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  UIView *imageView;
  UIView *v19;
  UIView *v20;
  void *v21;
  void *v22;
  UIView *v23;
  UIView *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  UIView *v28;
  _QWORD v29[5];
  UIView *v30;

  v4 = a4;
  v7 = (UIImage *)a3;
  p_icon = &self->_icon;
  if (self->_icon == v7)
    goto LABEL_17;
  objc_storeStrong((id *)&self->_icon, a3);
  if (!*p_icon)
  {
    -[UIView superview](self->_imageView, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
      imageView = self->_imageView;
      self->_imageView = 0;

      -[PKPayLaterIconCell setNeedsLayout](self, "setNeedsLayout");
    }
    goto LABEL_15;
  }
  if (self->_imageView)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = self->_imageView;
    if ((isKindOfClass & 1) != 0)
    {
      v11 = v10;
      v12 = v11;
      if (v4)
      {
        v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_icon);
        v14 = self->_imageView;
        self->_imageView = v13;

        -[PKPayLaterIconCell _setupImageView](self, "_setupImageView");
        -[UIView setAlpha:](self->_imageView, "setAlpha:", 0.0);
        v15 = MEMORY[0x1E0C809B0];
        v16 = (void *)MEMORY[0x1E0DC3F10];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __39__PKPayLaterIconCell_setIcon_animated___block_invoke;
        v29[3] = &unk_1E3E61388;
        v29[4] = self;
        v30 = v12;
        v27[0] = v15;
        v27[1] = 3221225472;
        v27[2] = __39__PKPayLaterIconCell_setIcon_animated___block_invoke_2;
        v27[3] = &unk_1E3E62288;
        v28 = v30;
        objc_msgSend(v16, "pkui_animateUsingOptions:animations:completion:", 4, v29, v27);

      }
      else
      {
        -[UIView image](v11, "image");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setImage:](v12, "setImage:", *p_icon);
        -[UIView image](v12, "image");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 == v21)
        {
          -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
          v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_icon);
          v24 = self->_imageView;
          self->_imageView = v23;

          -[PKPayLaterIconCell _setupImageView](self, "_setupImageView");
        }

      }
      goto LABEL_15;
    }
  }
  else
  {
    v10 = 0;
  }
  -[UIView removeFromSuperview](v10, "removeFromSuperview");
  v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_icon);
  v20 = self->_imageView;
  self->_imageView = v19;

  -[PKPayLaterIconCell _setupImageView](self, "_setupImageView");
LABEL_15:
  -[UIView superview](self->_imageView, "superview");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    -[PKPayLaterIconCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", self->_imageView);

    -[PKPayLaterIconCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_17:

}

uint64_t __39__PKPayLaterIconCell_setIcon_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 752), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __39__PKPayLaterIconCell_setIcon_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setIconDate:(id)a3 animated:(BOOL)a4
{
  UIView *imageView;
  id v6;
  PKCalendarIconView *v7;
  UIView *v8;
  void *v9;

  imageView = self->_imageView;
  v6 = a3;
  -[UIView removeFromSuperview](imageView, "removeFromSuperview");
  v7 = -[PKCalendarIconView initWithDate:isDisabled:]([PKCalendarIconView alloc], "initWithDate:isDisabled:", v6, 0);

  v8 = self->_imageView;
  self->_imageView = &v7->super;

  -[PKPayLaterIconCell _setupImageView](self, "_setupImageView");
  -[PKPayLaterIconCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_imageView);

  -[PKPayLaterIconCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setView:(id)a3
{
  UIView *v5;
  UIView **p_view;
  UIView *view;
  UIView *v8;
  UIView *v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_view = &self->_view;
  view = self->_view;
  if (view != v5)
  {
    v11 = v5;
    v8 = view;
    v9 = v8;
    if (v8)
      -[UIView removeFromSuperview](v8, "removeFromSuperview");
    objc_storeStrong((id *)&self->_view, a3);
    if (*p_view)
    {
      -[PKPayLaterIconCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", *p_view);

    }
    -[PKPayLaterIconCell _applyInactiveAppearance](self, "_applyInactiveAppearance");
    -[PKPayLaterIconCell setNeedsLayout](self, "setNeedsLayout");

    v5 = v11;
  }

}

- (void)setHasCircleBorder:(BOOL)a3
{
  if (self->_hasCircleBorder != a3)
  {
    self->_hasCircleBorder = a3;
    -[PKPayLaterIconCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAppearInactive:(BOOL)a3
{
  if (self->_appearInactive != a3)
  {
    self->_appearInactive = a3;
    -[PKPayLaterIconCell _applyInactiveAppearance](self, "_applyInactiveAppearance");
  }
}

- (void)prepareForReuse
{
  UIView *view;
  UIView *imageView;
  UIImage *icon;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterIconCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v6, sel_prepareForReuse);
  -[UIView removeFromSuperview](self->_view, "removeFromSuperview");
  view = self->_view;
  self->_view = 0;

  -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
  imageView = self->_imageView;
  self->_imageView = 0;

  icon = self->_icon;
  self->_icon = 0;

  self->_appearInactive = 0;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterIconCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKPayLaterIconCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKPayLaterIconCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[PKPayLaterIconCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  v6 = v5;
  -[PKPayLaterIconCell minimumHeight](self, "minimumHeight");
  v8 = fmax(v6, v7);
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width;
  double v7;
  double v8;
  double v9;
  CGRectEdge v10;
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
  double v23;
  CGFloat v24;
  CGSize v25;
  CGFloat x;
  CGFloat v27;
  CGFloat height;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v39;

  width = a3.size.width;
  v7 = a3.origin.x + 13.0;
  v8 = a3.origin.y + 8.0;
  v9 = a3.size.height + -16.0;
  memset(&slice, 0, sizeof(slice));
  if (-[PKPayLaterIconCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v10 = CGRectMaxXEdge;
  else
    v10 = CGRectMinXEdge;
  remainder.origin.x = v7;
  remainder.origin.y = v8;
  remainder.size.width = width + -27.0;
  remainder.size.height = v9;
  v11 = PKPayLaterUICellIconSize();
  v13 = v12;
  v39.origin.x = v7;
  v39.origin.y = v8;
  v39.size.width = width + -27.0;
  v39.size.height = v9;
  CGRectDivide(v39, &slice, &remainder, v11, v10);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  CGRectDivide(remainder, &slice, &remainder, 12.0, v10);
  v22 = v11 * 0.5;
  if (!self->_hasCircleBorder)
    v22 = 8.0;
  -[UIView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", v22);
  -[UIView sizeThatFits:](self->_view, "sizeThatFits:", remainder.size.width, 3.40282347e38);
  v24 = v23;
  v25 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v35.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v35.size = v25;
  x = remainder.origin.x;
  v25.width = remainder.origin.y;
  v27 = remainder.size.width;
  height = remainder.size.height;
  CGRectDivide(*(CGRect *)((char *)&v25 - 8), &v35, &slice, v24, CGRectMinYEdge);
  PKSizeAlignedInRect();
  v35.origin.x = v29;
  v35.origin.y = v30;
  v35.size.width = v31;
  v35.size.height = v32;
  if (!a4)
  {
    -[UIView setFrame:](self->_view, "setFrame:", *(_OWORD *)&v35.origin, *(_OWORD *)&v35.size);
    -[UIView setFrame:](self->_imageView, "setFrame:", v15, v17, v19, v21);
  }
  v33 = fmax(v24, v13) + 16.0;
  v34 = width;
  result.height = v33;
  result.width = v34;
  return result;
}

- (void)_setupImageView
{
  void *v3;
  id v4;
  void *v5;

  -[UIView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  -[UIView layer](self->_imageView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  -[UIView layer](self->_imageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", PKUIPixelLength());

  -[PKPayLaterIconCell _applyInactiveAppearance](self, "_applyInactiveAppearance");
}

- (void)_applyInactiveAppearance
{
  void (**v3)(void *, UIView *);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKPayLaterIconCell__applyInactiveAppearance__block_invoke;
  aBlock[3] = &unk_1E3E62EE0;
  aBlock[4] = self;
  v3 = (void (**)(void *, UIView *))_Block_copy(aBlock);
  v3[2](v3, self->_view);
  v3[2](v3, self->_imageView);

}

void __46__PKPayLaterIconCell__applyInactiveAppearance__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 761));

  v4 = 0.5;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 761))
    v4 = 1.0;
  objc_msgSend(v5, "setAlpha:", v4);

}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (BOOL)hasCircleBorder
{
  return self->_hasCircleBorder;
}

- (BOOL)appearInactive
{
  return self->_appearInactive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
