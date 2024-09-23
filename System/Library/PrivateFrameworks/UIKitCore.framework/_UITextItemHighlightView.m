@implementation _UITextItemHighlightView

- (_UITextItemHighlightView)initWithFrame:(CGRect)a3
{
  _UITextItemHighlightView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITextItemHighlightView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor systemFillColor](UIColor, "systemFillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextItemHighlightView setFillColor:](v3, "setFillColor:", v4);

  }
  return v3;
}

- (void)setTextLineRects:(id)a3
{
  objc_storeStrong((id *)&self->_textLineRects, a3);
  -[_UITextItemHighlightView _updateShape](self, "_updateShape");
}

- (void)setFillColor:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_fillColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  -[_UIShapeView shapeLayer](self, "shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFillColor:", v6);

}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
  -[_UITextItemHighlightView _updateShape](self, "_updateShape");
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
  -[_UITextItemHighlightView _updateShape](self, "_updateShape");
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[_UITextItemHighlightView _updateShape](self, "_updateShape");
}

- (UIEdgeInsets)_padding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -self->_verticalPadding;
  v3 = -self->_horizontalPadding;
  v4 = v2;
  v5 = v3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_updateShape
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  -[_UITextItemHighlightView textLineRects](self, "textLineRects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextItemHighlightView _padding](self, "_padding");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UITextItemHighlightView cornerRadius](self, "cornerRadius");
  _UIPreviewParametersGenerateTextPlatter(v3, v5, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_retainAutorelease(v13);
  v14 = objc_msgSend(v16, "CGPath");
  -[_UIShapeView shapeLayer](self, "shapeLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPath:", v14);

}

- (NSArray)textLineRects
{
  return self->_textLineRects;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_textLineRects, 0);
}

@end
