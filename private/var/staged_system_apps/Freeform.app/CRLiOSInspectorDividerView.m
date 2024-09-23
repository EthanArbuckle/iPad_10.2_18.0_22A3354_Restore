@implementation CRLiOSInspectorDividerView

+ (UIColor)defaultDividerColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (CRLiOSInspectorDividerView)initWithFrame:(CGRect)a3
{
  CRLiOSInspectorDividerView *v3;
  UIView *v4;
  UIView *divider;
  uint64_t v6;
  double v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSInspectorDividerView;
  v3 = -[CRLiOSInspectorDividerView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    divider = v3->_divider;
    v3->_divider = v4;

    *(_QWORD *)&v7 = objc_opt_class(v3, v6).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultDividerColor", v7));
    -[UIView setBackgroundColor:](v3->_divider, "setBackgroundColor:", v9);

    -[CRLiOSInspectorDividerView addSubview:](v3, "addSubview:", v3->_divider);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v17.receiver = self;
  v17.super_class = (Class)CRLiOSInspectorDividerView;
  -[CRLiOSInspectorDividerView layoutSubviews](&v17, "layoutSubviews");
  -[CRLiOSInspectorDividerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
    v14 = 2.0;
  else
    v14 = 0.5;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v15 = CGRectGetWidth(v18) - 16.0 - 16.0;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  if (CGRectGetHeight(v19) == v14)
    -[UIView setFrame:](self->_divider, "setFrame:", 16.0, 0.0, v15, v14);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  if (CGRectGetHeight(v20) <= 1.0)
    v16 = v14;
  else
    v16 = 8.0;
  -[UIView setFrame:](self->_divider, "setFrame:", 16.0, v16, v15, v14);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)result withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;

  v5 = 16.0;
  result.height = v5;
  return result;
}

- (UIColor)dividerColor
{
  return -[UIView backgroundColor](self->_divider, "backgroundColor");
}

- (void)setDividerColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_divider, "setBackgroundColor:", a3);
}

- (UIView)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
  objc_storeStrong((id *)&self->_divider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divider, 0);
}

@end
