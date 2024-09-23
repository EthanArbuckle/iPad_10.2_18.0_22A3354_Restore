@implementation PKBadgedView

- (PKBadgedView)init
{

  return 0;
}

- (PKBadgedView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKBadgedView)initWithView:(id)a3 text:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PKBadgedView *v14;
  PKBadgedView *v15;
  PKButtonBadgeView *v16;
  id v17;
  PKBadgedView *v18;
  uint64_t v19;
  CGFloat top;
  uint64_t v21;
  PKButtonBadgeView *badge;
  PKButtonBadgeView *v23;
  void *v24;
  PKButtonBadgeView *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  PKButtonBadgeView *v30;
  void *v31;
  id v32;
  objc_super v34;
  objc_super v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
    __break(1u);
  v9 = v8;
  v34.receiver = self;
  v34.super_class = (Class)PKBadgedView;
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[PKBadgedView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v11, v12, v13);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_view, a3);
    -[PKBadgedView addSubview:](v15, "addSubview:", v15->_view);
    v16 = [PKButtonBadgeView alloc];
    v17 = v9;
    if (v16)
    {
      v35.receiver = v16;
      v35.super_class = (Class)PKButtonBadgeView;
      v18 = -[PKBadgedView initWithFrame:](&v35, sel_initWithFrame_, v10, v11, v12, v13);
      if (v18)
      {
        v19 = objc_msgSend(v17, "copy");
        top = v18->_alignmentInsets.top;
        *(_QWORD *)&v18->_alignmentInsets.top = v19;

        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v10, v11, v12, v13);
        badge = v18->_badge;
        v18->_badge = (PKButtonBadgeView *)v21;

        -[PKButtonBadgeView setText:](v18->_badge, "setText:", *(_QWORD *)&v18->_alignmentInsets.top);
        v23 = v18->_badge;
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKButtonBadgeView setTextColor:](v23, "setTextColor:", v24);

        v25 = v18->_badge;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 10.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKButtonBadgeView setFont:](v25, "setFont:", v26);

        -[PKButtonBadgeView setTextAlignment:](v18->_badge, "setTextAlignment:", 1);
        -[PKBadgedView addSubview:](v18, "addSubview:", v18->_badge);
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKBadgedView setBackgroundColor:](v18, "setBackgroundColor:", v27);

        -[PKBadgedView layer](v18, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v28, "setBorderColor:", objc_msgSend(v29, "CGColor"));

        objc_msgSend(v28, "setBorderWidth:", 1.0);
        objc_msgSend(v28, "setMasksToBounds:", 1);

      }
    }
    else
    {
      v18 = 0;
    }

    v30 = v15->_badge;
    v15->_badge = (PKButtonBadgeView *)v18;

    -[PKBadgedView addSubview:](v15, "addSubview:", v15->_badge);
    -[PKBadgedView _updateBadgeSize]((uint64_t)v15);
    v36[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)-[PKBadgedView registerForTraitChanges:withHandler:](v15, "registerForTraitChanges:withHandler:", v31, &__block_literal_global_56);

  }
  return v15;
}

- (uint64_t)_updateBadgeSize
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 416), "sizeToFit");
    objc_msgSend(*(id *)(v1 + 416), "frame");
    v2 = objc_msgSend((id)v1, "effectiveUserInterfaceLayoutDirection");
    PKFloatRoundToPixel();
    v4 = v3;
    PKFloatRoundToPixel();
    if (v2 == 1)
      v6 = v4;
    else
      v6 = 0.0;
    *(_QWORD *)(v1 + 424) = v5;
    *(double *)(v1 + 432) = v6;
    if (v2 == 1)
      v7 = 0.0;
    else
      v7 = v4;
    *(_QWORD *)(v1 + 440) = 0;
    *(double *)(v1 + 448) = v7;
    return objc_msgSend((id)v1, "setNeedsLayout");
  }
  return result;
}

uint64_t __34__PKBadgedView_initWithView_text___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[PKBadgedView _updateBadgeSize](a2);
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentInsets.top;
  left = self->_alignmentInsets.left;
  bottom = self->_alignmentInsets.bottom;
  right = self->_alignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)layoutSubviews
{
  UIView *view;
  PKButtonBadgeView *badge;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKBadgedView;
  -[PKBadgedView layoutSubviews](&v5, sel_layoutSubviews);
  -[PKBadgedView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[PKBadgedView bounds](self, "bounds");
  view = self->_view;
  -[UIView frame](view, "frame");
  -[UIView alignmentRectForFrame:](view, "alignmentRectForFrame:");
  PKSizeAlignedInRect();
  -[UIView frameForAlignmentRect:](view, "frameForAlignmentRect:");
  -[UIView setFrame:](view, "setFrame:");
  badge = self->_badge;
  -[PKButtonBadgeView frame](badge, "frame");
  PKSizeAlignedInRect();
  -[PKButtonBadgeView setFrame:](badge, "setFrame:");
}

- (NSString)text
{
  PKButtonBadgeView *badge;

  badge = self->_badge;
  if (badge)
    return badge->_text;
  else
    return (NSString *)0;
}

- (void)setText:(id)a3
{
  PKButtonBadgeView *badge;
  uint64_t v5;
  NSString *text;

  badge = self->_badge;
  if (badge)
  {
    v5 = objc_msgSend(a3, "copy");
    text = badge->_text;
    badge->_text = (NSString *)v5;

    -[UILabel setText:](badge->_label, "setText:", badge->_text);
  }
  -[PKBadgedView _updateBadgeSize]((uint64_t)self);
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKBadgedView;
  -[PKBadgedView sizeToFit](&v7, sel_sizeToFit);
  -[PKBadgedView bounds](self, "bounds");
  -[PKBadgedView setAnchorPoint:](self, "setAnchorPoint:", (v3 + self->_alignmentInsets.left + (v5 - (self->_alignmentInsets.left + self->_alignmentInsets.right)) * 0.5 - v3)/ v5, (v4 + self->_alignmentInsets.top + (v6 - (self->_alignmentInsets.top + self->_alignmentInsets.bottom)) * 0.5 - v4)/ v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIView *view;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  view = self->_view;
  -[UIView frame](view, "frame", a3.width, a3.height);
  -[UIView alignmentRectForFrame:](view, "alignmentRectForFrame:");
  v6 = self->_alignmentInsets.left + v5 + self->_alignmentInsets.right;
  v8 = v7 + self->_alignmentInsets.top + self->_alignmentInsets.bottom;
  result.height = v8;
  result.width = v6;
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

@end
