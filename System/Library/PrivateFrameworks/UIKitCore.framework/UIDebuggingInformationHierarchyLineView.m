@implementation UIDebuggingInformationHierarchyLineView

- (void)layoutSubviews
{
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", self->_lineColor);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *lineColor;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationHierarchyLineView;
  -[UICollectionReusableView applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "lineColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    lineColor = self->_lineColor;
    self->_lineColor = v5;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
}

@end
