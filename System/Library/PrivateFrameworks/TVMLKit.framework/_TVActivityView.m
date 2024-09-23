@implementation _TVActivityView

- (void)setActivityView:(id)a3
{
  UIView *v5;
  UIView *activityView;
  UIView *v7;

  v5 = (UIView *)a3;
  activityView = self->_activityView;
  v7 = v5;
  if (activityView != v5)
  {
    -[UIView removeFromSuperview](activityView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_activityView, a3);
    if (self->_activityView)
      -[_TVActivityView addSubview:](self, "addSubview:");
  }
  -[_TVActivityView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setTextView:(id)a3
{
  UIView *v5;
  UIView *textView;
  UIView *v7;

  v5 = (UIView *)a3;
  textView = self->_textView;
  v7 = v5;
  if (textView != v5)
  {
    -[UIView removeFromSuperview](textView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textView, a3);
    if (self->_textView)
      -[_TVActivityView addSubview:](self, "addSubview:");
  }
  -[_TVActivityView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  CGFloat rect;
  void *recta;
  CGRect v22;

  -[_TVActivityView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_TVActivityView activityView](self, "activityView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_itemWidth");
  -[_TVActivityView activityView](self, "activityView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tv_itemHeight");
  UIRectCenteredIntegralRect();
  v10 = v9;
  rect = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[_TVActivityView activityView](self, "activityView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  -[_TVActivityView textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tv_margin");

  -[_TVActivityView textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", v4, v6);

  v22.origin.x = rect;
  v22.origin.y = v12;
  v22.size.width = v14;
  v22.size.height = v16;
  CGRectGetMinY(v22);
  -[_TVActivityView textView](self, "textView");
  recta = (void *)objc_claimAutoreleasedReturnValue();
  UIRectCenteredXInRect();
  objc_msgSend(recta, "setFrame:");

}

- (UIView)activityView
{
  return self->_activityView;
}

- (UIView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end
