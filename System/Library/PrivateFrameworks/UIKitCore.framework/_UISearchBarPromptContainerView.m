@implementation _UISearchBarPromptContainerView

- (BOOL)useMini
{
  return self->_barMetrics == 102;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[UILabel text](self->_promptLabel, "text", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = -[_UISearchBarPromptContainerView useMini](self, "useMini");
    v8 = 22.0;
    if (!v7)
      v8 = 34.0;
  }
  else
  {
    v8 = 0.0;
  }
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double top;
  double left;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double Height;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[UILabel text](self->_promptLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[UIView bounds](self, "bounds");
    top = self->_contentInset.top;
    left = self->_contentInset.left;
    v8 = v7 + left;
    v10 = v9 + top;
    v29 = v9 + top;
    v30 = v7 + left;
    v12 = v11 - (left + self->_contentInset.right);
    v14 = v13 - (top + self->_contentInset.bottom);
    -[UIView sizeToFit](self->_promptLabel, "sizeToFit");
    -[UIView frame](self->_promptLabel, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v31.origin.x = v8;
    v31.origin.y = v10;
    v31.size.width = v12;
    v31.size.height = v14;
    CGRectGetWidth(v31);
    v32.origin.x = v16;
    v32.origin.y = v18;
    v32.size.width = v20;
    v32.size.height = v22;
    CGRectGetWidth(v32);
    UIFloorToViewScale(self);
    v24 = v23;
    if (-[_UISearchBarPromptContainerView useMini](self, "useMini"))
      v25 = 3.0;
    else
      v25 = 12.0;
    v33.origin.x = v24;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    Height = CGRectGetHeight(v33);
    -[UILabel _baselineOffsetFromBottom](self->_promptLabel, "_baselineOffsetFromBottom");
    v28 = v27;
    v34.origin.y = v29;
    v34.origin.x = v30;
    v34.size.width = v12;
    v34.size.height = v14;
    -[UILabel setFrame:](self->_promptLabel, "setFrame:", v24, v28 - Height + CGRectGetMaxY(v34) - v25, v20, v22);
  }
}

- (id)description
{
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t barMetrics;
  void *v10;
  uint64_t v11;
  double top;
  double left;
  double right;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UISearchBarPromptContainerView;
  -[UIView description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  -[UILabel text](self->_promptLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[UILabel text](self->_promptLabel, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  barMetrics = self->_barMetrics;
  if (barMetrics)
  {
    _UIBarMetricsDebugDescription(barMetrics);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  right = self->_contentInset.right;
  if (left == 0.0 && top == 0.0 && right == 0.0 && self->_contentInset.bottom == 0.0)
    return v3;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" contentInset={%g, %g, %g, %g}"), *(_QWORD *)&top, *(_QWORD *)&left, *(_QWORD *)&self->_contentInset.bottom, *(_QWORD *)&right);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)barMetrics
{
  return self->_barMetrics;
}

- (void)setBarMetrics:(int64_t)a3
{
  self->_barMetrics = a3;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_promptLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptLabel, 0);
}

- (BOOL)_isKnownUISearchBarComponentContainer
{
  return 1;
}

@end
