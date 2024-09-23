@implementation UIKBMultilingualIntroductionArrowView

- (UIKBMultilingualIntroductionArrowView)init
{
  UIKBMultilingualIntroductionArrowView *v2;
  UIKBMultilingualIntroductionArrowView *v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  CAShapeLayer *v8;
  CAShapeLayer *arrowTailLayer;
  id v10;
  id v11;
  CAShapeLayer *v12;
  CAShapeLayer *arrowHeadLayer;
  id v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UIKBMultilingualIntroductionArrowView;
  v2 = -[UIView init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIView _inheritedRenderConfig](v2, "_inheritedRenderConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "lightKeyboard");
    v6 = 0.35;
    if (v5)
      v6 = 0.65;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v6, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    arrowTailLayer = v3->_arrowTailLayer;
    v3->_arrowTailLayer = v8;

    +[UIColor clearColor](UIColor, "clearColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_arrowTailLayer, "setFillColor:", objc_msgSend(v10, "CGColor"));

    v11 = objc_retainAutorelease(v7);
    -[CAShapeLayer setStrokeColor:](v3->_arrowTailLayer, "setStrokeColor:", objc_msgSend(v11, "CGColor"));
    v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    arrowHeadLayer = v3->_arrowHeadLayer;
    v3->_arrowHeadLayer = v12;

    v14 = objc_retainAutorelease(v11);
    -[CAShapeLayer setFillColor:](v3->_arrowHeadLayer, "setFillColor:", objc_msgSend(v14, "CGColor"));
    v15 = objc_retainAutorelease(v14);
    -[CAShapeLayer setStrokeColor:](v3->_arrowHeadLayer, "setStrokeColor:", objc_msgSend(v15, "CGColor"));
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView layer](v3, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v3->_arrowTailLayer);

    -[UIView layer](v3, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v3->_arrowHeadLayer);

  }
  return v3;
}

- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  self->_startPoint = a3;
  self->_endPoint = a4;
  -[UIKBMultilingualIntroductionArrowView _updatePath](self, "_updatePath");
}

- (void)_updatePath
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;

  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveToPoint:", self->_startPoint.x, self->_startPoint.y);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", self->_endPoint.x, self->_endPoint.y + 3.0, self->_startPoint.x + (self->_endPoint.x - self->_startPoint.x) * 0.5, self->_startPoint.y + -5.0, self->_endPoint.x, self->_startPoint.y - (self->_startPoint.y - self->_endPoint.y) / 3.0);
  v12 = objc_retainAutorelease(v3);
  -[CAShapeLayer setPath:](self->_arrowTailLayer, "setPath:", objc_msgSend(v12, "CGPath"));
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBMultilingualIntroductionArrowView endPoint](self, "endPoint");
  objc_msgSend(v4, "moveToPoint:");
  -[UIKBMultilingualIntroductionArrowView endPoint](self, "endPoint");
  v6 = v5 + -4.0;
  -[UIKBMultilingualIntroductionArrowView endPoint](self, "endPoint");
  objc_msgSend(v4, "addLineToPoint:", v6, v7 + 8.0);
  -[UIKBMultilingualIntroductionArrowView endPoint](self, "endPoint");
  v9 = v8 + 4.0;
  -[UIKBMultilingualIntroductionArrowView endPoint](self, "endPoint");
  objc_msgSend(v4, "addLineToPoint:", v9, v10 + 8.0);
  v11 = objc_retainAutorelease(v4);
  -[CAShapeLayer setPath:](self->_arrowHeadLayer, "setPath:", objc_msgSend(v11, "CGPath"));

}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  self->_endPoint = a3;
}

- (CAShapeLayer)arrowTailLayer
{
  return self->_arrowTailLayer;
}

- (void)setArrowTailLayer:(id)a3
{
  objc_storeStrong((id *)&self->_arrowTailLayer, a3);
}

- (CAShapeLayer)arrowHeadLayer
{
  return self->_arrowHeadLayer;
}

- (void)setArrowHeadLayer:(id)a3
{
  objc_storeStrong((id *)&self->_arrowHeadLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowHeadLayer, 0);
  objc_storeStrong((id *)&self->_arrowTailLayer, 0);
}

@end
