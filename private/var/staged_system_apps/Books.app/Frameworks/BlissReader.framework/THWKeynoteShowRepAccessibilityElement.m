@implementation THWKeynoteShowRepAccessibilityElement

- (CGRect)accessibilityFrame
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
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibilityElement showLayer](self, "showLayer"));
  -[THWKeynoteShowRepAccessibilityElement frameInShowLayer](self, "frameInShowLayer");
  objc_msgSend(v3, "convertRect:toLayer:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameInShowLayer
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameInShowLayer.origin.x;
  y = self->_frameInShowLayer.origin.y;
  width = self->_frameInShowLayer.size.width;
  height = self->_frameInShowLayer.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameInShowLayer:(CGRect)a3
{
  self->_frameInShowLayer = a3;
}

- (CALayer)showLayer
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_showLayer);
}

- (void)setShowLayer:(id)a3
{
  objc_storeWeak((id *)&self->_showLayer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_showLayer);
}

@end
