@implementation TextLineLayer

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  CGFloat v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24.receiver = self;
  v24.super_class = (Class)TextLineLayer;
  -[TextLineLayer drawInContext:](&v24, sel_drawInContext_);
  UIGraphicsPushContext(a3);
  -[TextLineLayer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[TextLineLayer lineWidth](self, "lineWidth");
  v14 = v13;
  -[TextLineLayer centerOffset](self, "centerOffset");
  v16 = v15;
  -[TextLineLayer lineColor](self, "lineColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFill");

  -[TextLineLayer insets](self, "insets");
  v19 = v18;
  v21 = v20;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v22 = v16 + CGRectGetMidY(v25) + v14 * -0.5;
  v23 = ceilf(v22);
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  v27.size.width = CGRectGetWidth(v26) - v19 - v21;
  v27.origin.x = v19;
  v27.origin.y = v23;
  v27.size.height = v14;
  CGContextFillRect(a3, v27);
  UIGraphicsPopContext();
}

- (double)centerOffset
{
  return self->_centerOffset;
}

- (void)setCenterOffset:(double)a3
{
  self->_centerOffset = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
}

@end
