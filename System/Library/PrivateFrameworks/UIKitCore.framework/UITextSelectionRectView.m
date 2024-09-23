@implementation UITextSelectionRectView

- (BOOL)hasPath
{
  void *v2;
  BOOL v3;

  -[UITextSelectionRectView pathLayer](self, "pathLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "path") != 0;

  return v3;
}

- (void)setPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[UITextSelectionRectView pathLayer](self, "pathLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGPath");

  objc_msgSend(v8, "setPath:", v6);
  if (!v5)
  {
    -[UITextSelectionRectView selectionColor](self, "selectionColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v7);

  }
  -[UITextSelectionRectView setSelectionColor:](self, "setSelectionColor:", self->_selectionColor);
  -[UITextSelectionRectView setSelectionBorderColor:](self, "setSelectionBorderColor:", self->_selectionBorderColor);
  -[UITextSelectionRectView setSelectionBorderWidth:](self, "setSelectionBorderWidth:", self->_selectionBorderWidth);

}

- (id)path
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[UITextSelectionRectView pathLayer](self, "pathLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "path");

  if (v3)
  {
    +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setSelectionColor:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_selectionColor, a3);
  if (-[UITextSelectionRectView hasPath](self, "hasPath"))
  {
    v5 = objc_msgSend(objc_retainAutorelease(v8), "CGColor");
    -[UITextSelectionRectView pathLayer](self, "pathLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFillColor:", v5);

    -[UIView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  else
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v8);
    -[UITextSelectionRectView pathLayer](self, "pathLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFillColor:", 0);

  }
}

- (void)setSelectionCornerRadius:(double)a3
{
  id v4;

  self->_selectionCornerRadius = a3;
  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)setSelectionBorderColor:(id)a3
{
  id v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_storeStrong((id *)&self->_selectionBorderColor, a3);
  v6 = -[UITextSelectionRectView hasPath](self, "hasPath");
  v9 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v9, "CGColor");
  if (v6)
  {
    -[UITextSelectionRectView pathLayer](self, "pathLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStrokeColor:", v7);
  }
  else
  {
    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", v7);
  }

}

- (void)setSelectionBorderWidth:(double)a3
{
  id v5;

  self->_selectionBorderWidth = a3;
  if (-[UITextSelectionRectView hasPath](self, "hasPath"))
  {
    -[UITextSelectionRectView pathLayer](self, "pathLayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineWidth:", a3);
  }
  else
  {
    -[UIView layer](self, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderWidth:", a3);
  }

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
  v9.super_class = (Class)UITextSelectionRectView;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v9, sel__dynamicUserInterfaceTraitDidChange);
  if (-[UITextSelectionRectView hasPath](self, "hasPath"))
  {
    -[UITextSelectionRectView selectionColor](self, "selectionColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    -[UITextSelectionRectView pathLayer](self, "pathLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFillColor:", v4);

    -[UITextSelectionRectView selectionBorderColor](self, "selectionBorderColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[UITextSelectionRectView pathLayer](self, "pathLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStrokeColor:", v7);

  }
}

- (UIColor)selectionColor
{
  return self->_selectionColor;
}

- (UIColor)selectionBorderColor
{
  return self->_selectionBorderColor;
}

- (double)selectionBorderWidth
{
  return self->_selectionBorderWidth;
}

- (double)selectionCornerRadius
{
  return self->_selectionCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBorderColor, 0);
  objc_storeStrong((id *)&self->_selectionColor, 0);
}

@end
