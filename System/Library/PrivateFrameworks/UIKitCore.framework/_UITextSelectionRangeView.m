@implementation _UITextSelectionRangeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(CGPath *)a3
{
  id v4;

  -[_UITextSelectionRangeView pathLayer](self, "pathLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", a3);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITextSelectionRangeView;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v9, sel__dynamicUserInterfaceTraitDidChange);
  -[_UITextSelectionRangeView selectionColor](self, "selectionColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[_UITextSelectionRangeView pathLayer](self, "pathLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillColor:", v4);

  -[_UITextSelectionRangeView selectionBorderColor](self, "selectionBorderColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");
  -[_UITextSelectionRangeView pathLayer](self, "pathLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStrokeColor:", v7);

}

- (void)setSelectionColor:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_selectionColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  -[_UITextSelectionRangeView pathLayer](self, "pathLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFillColor:", v6);

}

- (UIColor)selectionColor
{
  return self->_selectionColor;
}

- (UIColor)selectionBorderColor
{
  return self->_selectionBorderColor;
}

- (CGPath)path
{
  void *v2;
  CGPath *v3;

  -[_UITextSelectionRangeView pathLayer](self, "pathLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGPath *)objc_msgSend(v2, "path");

  return v3;
}

- (void)setSelectionBorderColor:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_selectionBorderColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  -[_UITextSelectionRangeView pathLayer](self, "pathLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeColor:", v6);

}

- (void)setSelectionBorderWidth:(double)a3
{
  id v4;

  self->_selectionBorderWidth = a3;
  -[_UITextSelectionRangeView pathLayer](self, "pathLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", a3);

}

- (double)selectionBorderWidth
{
  return self->_selectionBorderWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBorderColor, 0);
  objc_storeStrong((id *)&self->_selectionColor, 0);
}

@end
