@implementation _UIFocusRotaryRingArrowView

- (_UIFocusRotaryRingArrowView)initWithFrame:(CGRect)a3 color:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIFocusRotaryRingArrowView *v10;
  CAShapeLayer *v11;
  CAShapeLayer *shapeLayer;
  void *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusRotaryRingArrowView;
  v10 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    shapeLayer = v10->_shapeLayer;
    v10->_shapeLayer = v11;

    _UIFocusRotaryRingConfigureShadowForLayer(v10->_shapeLayer);
    -[UIView layer](v10, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v10->_shapeLayer);

    -[UIView setAutoresizingMask:](v10, "setAutoresizingMask:", 0);
    -[_UIFocusRotaryRingArrowView updateArrowColor:](v10, "updateArrowColor:", v9);
    -[_UIFocusRotaryRingArrowView _updateShapePath](v10, "_updateShapePath");
  }

  return v10;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusRotaryRingArrowView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIFocusRotaryRingArrowView _updateShapePath](self, "_updateShapePath");
}

- (void)updateArrowColor:(id)a3
{
  -[CAShapeLayer setFillColor:](self->_shapeLayer, "setFillColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
}

- (void)_updateShapePath
{
  id v3;

  -[_UIFocusRotaryRingArrowView _trianglePath](self, "_trianglePath");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", objc_msgSend(v3, "CGPath"));

}

- (id)_trianglePath
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  double MinX;
  double MidX;
  double MaxX;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  -[UIView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  objc_msgSend(v10, "moveToPoint:", MinX, CGRectGetMaxY(v16));
  v17.origin.x = v3;
  v17.origin.y = v5;
  v17.size.width = v7;
  v17.size.height = v9;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = v3;
  v18.origin.y = v5;
  v18.size.width = v7;
  v18.size.height = v9;
  objc_msgSend(v10, "addLineToPoint:", MidX, CGRectGetMinY(v18));
  v19.origin.x = v3;
  v19.origin.y = v5;
  v19.size.width = v7;
  v19.size.height = v9;
  MaxX = CGRectGetMaxX(v19);
  v20.origin.x = v3;
  v20.origin.y = v5;
  v20.size.width = v7;
  v20.size.height = v9;
  objc_msgSend(v10, "addLineToPoint:", MaxX, CGRectGetMaxY(v20));
  objc_msgSend(v10, "closePath");
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end
