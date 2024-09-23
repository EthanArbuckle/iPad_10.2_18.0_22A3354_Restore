@implementation PKCalendarDayView

- (PKCalendarDayView)initWithDate:(id)a3 dayString:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKCalendarDayView *v12;
  PKCalendarDayView *v13;
  PKCalendarDayLabelView *v14;
  PKCalendarDayLabelView *dayLabelView;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKCalendarDayView;
  v12 = -[PKCalendarDayView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a3);
    objc_storeStrong((id *)&v13->_delegate, a5);
    v14 = -[PKCalendarDayLabelView initWithDayString:]([PKCalendarDayLabelView alloc], "initWithDayString:", v10);
    dayLabelView = v13->_dayLabelView;
    v13->_dayLabelView = v14;

    -[PKCalendarDayView addSubview:](v13, "addSubview:", v13->_dayLabelView);
  }

  return v13;
}

- (void)setSelected:(BOOL)a3
{
  -[PKCalendarDayLabelView setSelected:](self->_dayLabelView, "setSelected:", a3);
  -[PKCalendarDayView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isSelected
{
  return -[PKCalendarDayLabelView isSelected](self->_dayLabelView, "isSelected");
}

- (void)setSelectable:(BOOL)a3
{
  UITapGestureRecognizer *tapRecognizer;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;

  if (self->_selectable != a3)
  {
    self->_selectable = a3;
    tapRecognizer = self->_tapRecognizer;
    if (a3)
    {
      if (!tapRecognizer)
      {
        v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__viewTapped);
        v7 = self->_tapRecognizer;
        self->_tapRecognizer = v6;

        -[PKCalendarDayView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
      }
    }
    else
    {
      if (tapRecognizer)
      {
        -[PKCalendarDayView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_tapRecognizer);
        v5 = self->_tapRecognizer;
      }
      else
      {
        v5 = 0;
      }
      self->_tapRecognizer = 0;

    }
  }
}

- (void)setHideDayLabel:(BOOL)a3
{
  if (self->_hideDayLabel != a3)
  {
    self->_hideDayLabel = a3;
    -[PKCalendarDayLabelView setHidden:](self->_dayLabelView, "setHidden:");
  }
}

- (void)setDecorationView:(id)a3
{
  UIView *v5;
  UIView *decorationView;
  UIView *v7;

  v5 = (UIView *)a3;
  decorationView = self->_decorationView;
  if (decorationView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](decorationView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_decorationView, a3);
    -[PKCalendarDayView addSubview:](self, "addSubview:", self->_decorationView);
    -[PKCalendarDayView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (double)verticalMarginWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MaxY;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKCalendarDayLabelView labelFrameForBounds:](self->_dayLabelView, "labelFrameForBounds:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MaxY = CGRectGetMaxY(v17);
  v18.origin.x = v8;
  v18.origin.y = v10;
  v18.size.width = v12;
  v18.size.height = v14;
  return fmax(MaxY - CGRectGetMaxY(v18), 0.0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCalendarDayView;
  -[PKCalendarDayView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKCalendarDayView bounds](self, "bounds");
  -[PKCalendarDayView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKCalendarDayView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height;
  double width;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double rect;
  CGSize result;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  v8 = MEMORY[0x1E0C9D648];
  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[PKCalendarDayLabelView sizeThatFits:](self->_dayLabelView, "sizeThatFits:", a3.size.width, 1.79769313e308);
  PKRectCenteredXInRect();
  v14 = v13;
  v15 = v12;
  if (!self->_decorationView)
  {
    v20 = *(double *)(v8 + 16);
    v26 = *(double *)(v8 + 24);
    if (a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  rect = v12;
  v16 = v11;
  -[PKCalendarDayLabelView isSelected](self->_dayLabelView, "isSelected");
  -[UIView sizeThatFits:](self->_decorationView, "sizeThatFits:", width, 1.79769313e308);
  v32.origin.y = 0.0;
  v32.origin.x = v14;
  v32.size.width = v16;
  v32.size.height = rect;
  CGRectGetMaxY(v32);
  PKRectCenteredXInRect();
  v9 = v17;
  v10 = v18;
  v20 = v19;
  v29 = v21;
  v22 = v16;
  v23 = v16;
  v15 = rect;
  -[PKCalendarDayLabelView labelFrameForBounds:](self->_dayLabelView, "labelFrameForBounds:", v14, 0.0, v23, rect);
  if (v20 < v24)
  {
    -[PKCalendarDayLabelView totalSpacingBetweenTextAndLabel](self->_dayLabelView, "totalSpacingBetweenTextAndLabel");
    v9 = v9 + v25 * 0.5;
  }
  v11 = v22;
  v26 = v29;
  if (!a4)
  {
LABEL_5:
    -[PKCalendarDayLabelView setFrame:](self->_dayLabelView, "setFrame:", v14, 0.0, v11, v15);
    -[UIView setFrame:](self->_decorationView, "setFrame:", v9, v10, v20, v26);
  }
LABEL_6:
  v27 = width;
  v28 = height;
  result.height = v28;
  result.width = v27;
  return result;
}

- (void)_viewTapped
{
  -[PKCalendarDayViewDelegate calendarDayViewTapped:withDate:](self->_delegate, "calendarDayViewTapped:withDate:", self, self->_date);
}

- (UIView)decorationView
{
  return self->_decorationView;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (BOOL)hideDayLabel
{
  return self->_hideDayLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationView, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_dayLabelView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
