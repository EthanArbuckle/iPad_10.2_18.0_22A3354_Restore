@implementation THWLayerDraggingController

- (THWLayerDraggingController)initWithLayer:(id)a3 hostView:(id)a4 gesture:(id)a5 anchorPoint:(CGPoint)a6 delegate:(id)a7
{
  double x;
  THWLayerDraggingController *v13;
  THWLayerDraggingController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIView *wrapperView;
  double v24;
  double v25;
  double v26;
  double v27;
  THWLayerDraggingDelegate *delegate;
  double v29;
  objc_super v31;

  x = a6.x;
  if (a3)
  {
    if (a7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWLayerDraggingController initWithLayer:hostView:gesture:anchorPoint:delegate:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLayerDraggingController.m"), 43, CFSTR("invalid nil value for '%s'"), "layer");
    if (a7)
      goto LABEL_3;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWLayerDraggingController initWithLayer:hostView:gesture:anchorPoint:delegate:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLayerDraggingController.m"), 44, CFSTR("invalid nil value for '%s'"), "delegate");
LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)THWLayerDraggingController;
  v13 = -[THWLayerDraggingController init](&v31, "init");
  v14 = v13;
  if (v13)
  {
    v13->_delegate = (THWLayerDraggingDelegate *)a7;
    v13->_hostView = (UIView *)a4;
    v14->_layer = (CALayer *)a3;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CALayer bounds](v14->_layer, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v14->_wrapperLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[CALayer setDelegate:](v14->_wrapperLayer, "setDelegate:", -[CALayer delegate](v14->_layer, "delegate"));
    -[CALayer setBounds:](v14->_wrapperLayer, "setBounds:", v16, v18, v20, v22);
    -[CALayer setAnchorPoint:](v14->_wrapperLayer, "setAnchorPoint:", 0.5, 0.5);
    -[CALayer addSublayer:](v14->_wrapperLayer, "addSublayer:", v14->_layer);
    -[CALayer frame](v14->_wrapperLayer, "frame");
    wrapperView = v14->_wrapperView;
    if (!wrapperView)
    {
      v24 = TSDRectWithSize(0);
      wrapperView = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v24, v25, v26, v27);
      v14->_wrapperView = wrapperView;
    }
    -[CALayer addSublayer:](-[UIView layer](wrapperView, "layer"), "addSublayer:", v14->_wrapperLayer);
    -[CALayer setZPosition:](-[UIView layer](v14->_wrapperView, "layer"), "setZPosition:", 5.0);
    -[UIView addSubview:](v14->_hostView, "addSubview:", v14->_wrapperView);
    delegate = v14->_delegate;
    -[THWLayerDraggingDelegate layerDragging:naturalPositionWithGesture:](delegate, "layerDragging:naturalPositionWithGesture:", v14, a5);
    -[THWLayerDraggingDelegate layerDragging:convertNaturalPointToBounds:](delegate, "layerDragging:convertNaturalPointToBounds:", v14);
    -[CALayer setPosition:](v14->_wrapperLayer, "setPosition:", TSDRoundedPoint(v29));
    -[CALayer setAnchorPoint:](v14->_layer, "setAnchorPoint:", 0.5, 0.5);
    -[CALayer setPosition:](v14->_layer, "setPosition:", TSDRoundedPoint((1.0 - x) * v20));
    +[CATransaction commit](CATransaction, "commit");
    +[CATransaction flush](CATransaction, "flush");
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWLayerDraggingController;
  -[THWLayerDraggingController dealloc](&v3, "dealloc");
}

- (void)teardown
{
  -[UIView removeFromSuperview](self->_wrapperView, "removeFromSuperview");
}

- (void)p_dragLayerToPosition:(CGPoint)a3 boundsPosition:(CGPoint)a4
{
  double x;

  x = a4.x;
  +[CATransaction begin](CATransaction, "begin", a3.x, a3.y);
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
  -[CALayer setPosition:](self->_wrapperLayer, "setPosition:", TSDRoundedPoint(x));
  +[CATransaction commit](CATransaction, "commit");
}

- (BOOL)canHandleGesture:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "gestureKind");
  return v3 == (id)TSWPImmediatePress;
}

- (BOOL)handleGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;

  -[THWLayerDraggingDelegate layerDragging:naturalPositionWithGesture:](self->_delegate, "layerDragging:naturalPositionWithGesture:", self, a3);
  v6 = v5;
  v8 = v7;
  -[THWLayerDraggingDelegate layerDragging:convertNaturalPointToBounds:](self->_delegate, "layerDragging:convertNaturalPointToBounds:", self);
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(a3, "gestureKind");
  v14 = (id)TSWPImmediatePress;
  if (v13 == (id)TSWPImmediatePress)
  {
    switch(objc_msgSend(a3, "gestureState"))
    {
      case 1u:
        -[THWLayerDraggingController p_didBeginWithPosition:boundsPosition:](self, "p_didBeginWithPosition:boundsPosition:", v6, v8, v10, v12);
        goto LABEL_6;
      case 2u:
        -[THWLayerDraggingDelegate layerDraggingDidMove:withPosition:](self->_delegate, "layerDraggingDidMove:withPosition:", self, v6, v8);
LABEL_6:
        -[THWLayerDraggingController p_dragLayerToPosition:boundsPosition:](self, "p_dragLayerToPosition:boundsPosition:", v6, v8, v10, v12);
        break;
      case 3u:
      case 4u:
      case 5u:
        -[THWLayerDraggingController p_didEndWithPosition:](self, "p_didEndWithPosition:", v6, v8);
        break;
      default:
        return v13 == v14;
    }
  }
  return v13 == v14;
}

- (void)p_didBeginWithPosition:(CGPoint)a3 boundsPosition:(CGPoint)a4
{
  -[THWLayerDraggingDelegate layerDraggingDidBegin:withPosition:](self->_delegate, "layerDraggingDidBegin:withPosition:", self, a3.x, a3.y, a4.x, a4.y);
}

- (void)p_didEndWithPosition:(CGPoint)a3
{
  double y;
  double x;
  THWLayerDraggingController *v6;

  y = a3.y;
  x = a3.x;
  v6 = self;
  -[THWLayerDraggingDelegate layerDraggingDidEnd:withPosition:](self->_delegate, "layerDraggingDidEnd:withPosition:", self, x, y);
}

- (CALayer)layer
{
  return self->_layer;
}

- (CALayer)wrapperLayer
{
  return self->_wrapperLayer;
}

- (UIView)hostView
{
  return self->_hostView;
}

- (THWLayerDraggingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWLayerDraggingDelegate *)a3;
}

- (BOOL)shouldDragTargetLayer
{
  return self->_shouldDragTargetLayer;
}

- (void)setShouldDragTargetLayer:(BOOL)a3
{
  self->_shouldDragTargetLayer = a3;
}

- (UIView)wrapperView
{
  return self->_wrapperView;
}

- (void)setWrapperView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
