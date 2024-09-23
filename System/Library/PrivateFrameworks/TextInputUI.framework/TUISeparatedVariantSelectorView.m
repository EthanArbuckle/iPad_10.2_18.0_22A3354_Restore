@implementation TUISeparatedVariantSelectorView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)TUISeparatedVariantSelectorView;
  -[TUIKeyPopupView layoutSubviews](&v11, sel_layoutSubviews);
  -[TUISeparatedVariantSelectorView stackLayoutMargins](self, "stackLayoutMargins");
  v5 = v3 + v4;
  -[TUIKeyPopupView arrangedVariantRows](self, "arrangedVariantRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = (v5 + CGRectGetHeight(v12)) * 0.5;
  -[TUIKeyPopupView variantView](self, "variantView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v8);

}

- (id)widthConstraintsForVariantCell:(id)a3 previousCell:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "minCellDimension");
    objc_msgSend(v6, "constraintEqualToConstant:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v11) = 1144766464;
    objc_msgSend(v10, "setPriority:", v11);
    v13 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
  }

  return v9;
}

- (id)variantCellWithString:(id)a3 annotation:(id)a4
{
  id v6;
  id v7;
  TUISeparatedVariantCell *v8;
  void *v9;
  TUISeparatedVariantCell *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = [TUISeparatedVariantCell alloc];
  -[TUIKeyPopupView renderTraits](self, "renderTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TUISeparatedVariantCell initWithFrame:string:annotation:traits:](v8, "initWithFrame:string:annotation:traits:", v7, v6, v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[TUIKeyPopupView touchesForwardingView](self, "touchesForwardingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISeparatedVariantCell setTouchesForwardingView:](v10, "setTouchesForwardingView:", v12);

  return v10;
}

- (UIEdgeInsets)stackLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 8.0;
  v3 = 8.0;
  v4 = 8.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)itemSpacing
{
  return 4.0;
}

- (double)variantViewBottomSpacing
{
  return 11.0;
}

- (BOOL)wantsUserInteractionEnabled
{
  return 1;
}

- (BOOL)drawsBackground
{
  return 0;
}

- (BOOL)drawsShadows
{
  return 0;
}

- (int64_t)variantViewAlignment
{
  void *v3;
  void *v4;
  int v5;

  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "variantType") == 4)
  {

    return 3;
  }
  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "variantType");

  if (v5 == 7)
    return 3;
  return 1;
}

- (unint64_t)variantRowLimitForLayout
{
  void *v3;
  void *v4;
  int v5;

  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "variantType") == 4)
  {

    return 10;
  }
  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "variantType");

  if (v5 == 7)
    return 10;
  return 12;
}

- (unint64_t)maxRows
{
  void *v3;
  void *v4;
  int v5;
  objc_super v7;

  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "variantType") == 4)
  {

    return 5;
  }
  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "variantType");

  if (v5 == 7)
    return 5;
  v7.receiver = self;
  v7.super_class = (Class)TUISeparatedVariantSelectorView;
  return -[TUIKeyPopupView maxRows](&v7, sel_maxRows);
}

- (BOOL)shouldProvideDefaultSelection
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TUIKeyPopupView variantView](self, "variantView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISeparatedVariantSelectorView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[TUIKeyPopupView variantView](self, "variantView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  return (char)v8;
}

+ (double)minCellDimension
{
  return 60.0;
}

+ (int64_t)hitTestingMode
{
  return 1;
}

@end
