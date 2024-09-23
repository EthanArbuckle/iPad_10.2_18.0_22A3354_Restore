@implementation TSDGuidedPanController

- (TSDGuidedPanController)initWithInteractiveCanvasController:(id)a3
{
  TSDGuidedPanController *v4;
  TSDGuidedPanController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDGuidedPanController;
  v4 = -[TSDGuidedPanController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_interactiveCanvasController = (TSDInteractiveCanvasController *)a3;
    v4->_canvasView = (TSDCanvasView *)objc_msgSend((id)objc_msgSend(a3, "layerHost"), "canvasView");
    v5->_canvasLayer = (TSDCanvasLayer *)objc_msgSend((id)objc_msgSend(a3, "layerHost"), "canvasLayer");
    v5->_canvasScrollView = (UIScrollView *)-[TSDCanvasView enclosingScrollView](v5->_canvasView, "enclosingScrollView");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDGuidedPanController;
  -[TSDGuidedPanController dealloc](&v3, sel_dealloc);
}

- (void)handlePanGesture:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  uint64_t v14;
  TSDCanvasLayer *canvasLayer;
  TSDCanvasLayer *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  TSDCanvasLayer *v23;
  TSDCanvasLayer *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint64_t v30;
  _OWORD v31[8];
  _QWORD v32[5];
  _QWORD v33[5];
  _OWORD v34[8];
  _OWORD v35[16];
  double v36;
  double v37;

  objc_msgSend(a3, "translationInView:", -[TSDCanvasView superview](self->_canvasView, "superview"));
  self->_movement.x = v5;
  self->_movement.y = v6;
  objc_msgSend(a3, "velocityInView:", -[TSDCanvasView superview](self->_canvasView, "superview"));
  self->_velocity.x = v7;
  self->_velocity.y = v8;
  v9 = -[TSDGuidedPanController p_currentContentLocationWithPlacement:](self, "p_currentContentLocationWithPlacement:", 0.5, 0.5);
  switch(objc_msgSend(a3, "state"))
  {
    case 1:
      objc_msgSend(a3, "locationInView:", self->_canvasView);
      self->_startPoint.x = v10;
      self->_startPoint.y = v11;
      -[TSDGuidedPanController p_willBegin](self, "p_willBegin");
      break;
    case 2:
      -[TSDGuidedPanController touchContentPlacement](self, "touchContentPlacement");
      v36 = v12;
      v37 = v13;
      v14 = -[TSDPanGuide contentLocationForMovement:velocity:placement:currentLocation:](self->_guide, "contentLocationForMovement:velocity:placement:currentLocation:", &v36, v9, self->_movement.x, self->_movement.y, self->_velocity.x, self->_velocity.y);
      if (v14)
      {
        -[TSDGuidedPanController p_transformForContentLocation:placement:](self, "p_transformForContentLocation:placement:", v14, v36, v37);
        canvasLayer = self->_canvasLayer;
        v35[4] = v35[12];
        v35[5] = v35[13];
        v35[6] = v35[14];
        v35[7] = v35[15];
        v35[0] = v35[8];
        v35[1] = v35[9];
        v35[2] = v35[10];
        v35[3] = v35[11];
        -[TSDCanvasLayer setTransform:](canvasLayer, "setTransform:", v35);
        -[TSDPanGuide guidedPanDidPanWithContentLocation:](self->_guide, "guidedPanDidPanWithContentLocation:", -[TSDGuidedPanController p_currentContentLocationWithPlacement:](self, "p_currentContentLocationWithPlacement:", 0.5, 0.5));
      }
      else
      {
        v29 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGuidedPanController handlePanGesture:]");
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGuidedPanController.m"), 100, CFSTR("invalid nil value for '%s'"), "contentLocation");
      }
      break;
    case 3:
      v16 = self->_canvasLayer;
      v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
      v34[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      v34[5] = v17;
      v18 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      v34[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      v34[7] = v18;
      v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      v34[0] = *MEMORY[0x24BDE5598];
      v34[1] = v19;
      v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      v34[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      v34[3] = v20;
      -[TSDCanvasLayer setTransform:](v16, "setTransform:", v34);
      v21 = -[TSDPanGuide completionAnimationFromContentLocation:movement:velocity:](self->_guide, "completionAnimationFromContentLocation:movement:velocity:", v9, self->_movement.x, self->_movement.y, self->_velocity.x, self->_velocity.y);
      if (!v21)
      {
        -[TSDGuidedPanController p_scrollToContentLocation:placement:](self, "p_scrollToContentLocation:placement:", v9, 0.5, 0.5);
        goto LABEL_10;
      }
      v22 = (void *)v21;
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
      v23 = self->_canvasLayer;
      v32[4] = self;
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __43__TSDGuidedPanController_handlePanGesture___block_invoke;
      v33[3] = &unk_24D82C958;
      v33[4] = self;
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __43__TSDGuidedPanController_handlePanGesture___block_invoke_2;
      v32[3] = &unk_24D82C980;
      objc_msgSend(v22, "i_applyToLayer:withTransformBlock:completionBlock:", v23, v33, v32);
      break;
    case 4:
      v24 = self->_canvasLayer;
      v25 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
      v31[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      v31[5] = v25;
      v26 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      v31[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      v31[7] = v26;
      v27 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      v31[0] = *MEMORY[0x24BDE5598];
      v31[1] = v27;
      v28 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      v31[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      v31[3] = v28;
      -[TSDCanvasLayer setTransform:](v24, "setTransform:", v31);
LABEL_10:
      -[TSDGuidedPanController p_didEnd](self, "p_didEnd");
      break;
    default:
      return;
  }
}

double __43__TSDGuidedPanController_handlePanGesture___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  void *v3;
  double result;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "p_transformForContentLocation:placement:", a2, 0.5, 0.5);
  }
  else
  {
    result = 0.0;
    a3[6] = 0u;
    a3[7] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t __43__TSDGuidedPanController_handlePanGesture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "guidedPanDidFinishCompletionAnimation");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "guidedPanShouldPreserveCompletionAnimationEndLocation"))objc_msgSend(*(id *)(a1 + 32), "p_scrollToContentLocation:placement:", a2, 0.5, 0.5);
  objc_msgSend(*(id *)(a1 + 32), "p_didEnd");
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
}

- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  $73314616FDF354EDC5180AB8A0BD2955 result;

  -[UIScrollView contentOffset](self->_canvasScrollView, "contentOffset");
  v4 = TSDSubtractPoints(self->_startPoint.x, self->_startPoint.y, v3);
  v6 = TSDAddPoints(v4, v5, self->_movement.x);
  v8 = v7;
  -[UIScrollView bounds](self->_canvasScrollView, "bounds");
  v10 = v6 / v9;
  v11 = -[UIScrollView bounds](self->_canvasScrollView, "bounds");
  TSDContentPlacementWithAnchorPoint(v11, v10, v8 / v12);
  result.var0.y = v14;
  result.var0.x = v13;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement
{
  double x;
  double y;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  $73314616FDF354EDC5180AB8A0BD2955 result;

  x = self->_movement.x;
  y = self->_movement.y;
  -[UIScrollView bounds](self->_canvasScrollView, "bounds");
  v6 = x / v5;
  v7 = -[UIScrollView bounds](self->_canvasScrollView, "bounds");
  TSDContentPlacementWithAnchorPoint(v7, v6 + 0.5, y / v8 + 0.5);
  result.var0.y = v10;
  result.var0.x = v9;
  return result;
}

- (id)p_currentContentLocationWithPlacement:(id)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  y = a3.var0.y;
  x = a3.var0.x;
  v6 = (void *)-[UIScrollView layer](self->_canvasScrollView, "layer");
  -[UIScrollView bounds](self->_canvasScrollView, "bounds");
  objc_msgSend(v6, "convertRect:toLayer:", self->_canvasLayer);
  v8 = v7;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:");
  v10 = v9;
  v12 = v11;
  -[UIScrollView bounds](self->_canvasScrollView, "bounds");
  v14 = v13 / v8;
  -[TSDCanvasLayer viewScale](self->_canvasLayer, "viewScale");
  return -[TSDGuidedPanController p_convertContentLocation:fromPlacement:toPlacement:](self, "p_convertContentLocation:fromPlacement:toPlacement:", +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v10, v12, v15 * v14), 0.0, 0.0, x, y);
}

- (CGPoint)p_boundsOffsetForContentLocation:(id)a3 placement:(id)a4
{
  double y;
  double x;
  TSDInteractiveCanvasController *interactiveCanvasController;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  y = a4.var0.y;
  x = a4.var0.x;
  interactiveCanvasController = self->_interactiveCanvasController;
  objc_msgSend(a3, "unscaledPoint");
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](interactiveCanvasController, "convertUnscaledToBoundsPoint:");
  v9 = v8;
  v11 = v10;
  -[UIScrollView contentOffset](self->_canvasScrollView, "contentOffset");
  v13 = TSDSubtractPoints(v9, v11, v12);
  v15 = v14;
  -[UIScrollView bounds](self->_canvasScrollView, "bounds");
  v17 = v13 - v16 * x;
  -[UIScrollView bounds](self->_canvasScrollView, "bounds");
  v19 = v15 - v18 * y;
  v20 = v17;
  result.y = v19;
  result.x = v20;
  return result;
}

- (CATransform3D)p_transformForContentLocation:(SEL)a3 placement:(id)a4
{
  double v8;
  double v9;
  double v10;
  double v11;
  TSDInteractiveCanvasController *interactiveCanvasController;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CATransform3D *result;

  -[TSDGuidedPanController p_boundsOffsetForContentLocation:placement:](self, "p_boundsOffsetForContentLocation:placement:", a5.var0.x, a5.var0.y);
  v9 = v8;
  v11 = v10;
  interactiveCanvasController = self->_interactiveCanvasController;
  objc_msgSend(a4, "unscaledPoint");
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](interactiveCanvasController, "convertUnscaledToBoundsPoint:");
  v14 = v13;
  v16 = v15;
  objc_msgSend(a4, "viewScale");
  v18 = v17;
  -[TSDCanvasLayer viewScale](self->_canvasLayer, "viewScale");
  result = (CATransform3D *)self->_canvasLayer;
  if (result)
    return (CATransform3D *)-[CATransform3D transformToScale:aroundBoundsPoint:afterOffset:](result, "transformToScale:aroundBoundsPoint:afterOffset:", v18 / v19, v14, v16, -v9, -v11);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return result;
}

- (void)p_scrollToContentLocation:(id)a3 placement:(id)a4
{
  id v5;
  TSDInteractiveCanvasController *interactiveCanvasController;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;

  if (a3)
  {
    v5 = -[TSDGuidedPanController p_convertContentLocation:fromPlacement:toPlacement:](self, "p_convertContentLocation:fromPlacement:toPlacement:", a4.var0.x, a4.var0.y, 0.0, 0.0);
    interactiveCanvasController = self->_interactiveCanvasController;
    objc_msgSend(v5, "viewScale");
    v8 = v7;
    objc_msgSend(v5, "unscaledPoint");
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](interactiveCanvasController, "setViewScale:contentOffset:clampOffset:animated:", 1, 0, v8, v9, v10);
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4.var0.x, a4.var0.y);
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGuidedPanController p_scrollToContentLocation:placement:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGuidedPanController.m"), 239, CFSTR("invalid nil value for '%s'"), "contentLocation");
  }
}

- (id)p_convertContentLocation:(id)a3 fromPlacement:(id)a4 toPlacement:(id)a5
{
  return -[TSDInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self->_interactiveCanvasController, "convertContentLocation:fromPlacement:toPlacement:", a3, a4.var0.x, a4.var0.y, a5.var0.x, a5.var0.y);
}

- (void)p_willBegin
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  TSDPanGuide *guide;
  double v9;
  double v10;

  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", self->_startPoint.x, self->_startPoint.y);
  v4 = v3;
  v6 = v5;
  v7 = -[TSDGuidedPanController p_currentContentLocationWithPlacement:](self, "p_currentContentLocationWithPlacement:", 0.5, 0.5);
  guide = self->_guide;
  objc_msgSend(v7, "unscaledPoint");
  -[TSDPanGuide guidedPanWillBeginAtPoint:withCenterPoint:](guide, "guidedPanWillBeginAtPoint:withCenterPoint:", v4, v6, v9, v10);
}

- (void)p_didEnd
{
  -[TSDPanGuide guidedPanDidEnd](self->_guide, "guidedPanDidEnd");
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->_interactiveCanvasController = (TSDInteractiveCanvasController *)a3;
}

- (TSDCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  self->_canvasView = (TSDCanvasView *)a3;
}

- (TSDCanvasLayer)canvasLayer
{
  return self->_canvasLayer;
}

- (void)setCanvasLayer:(id)a3
{
  self->_canvasLayer = (TSDCanvasLayer *)a3;
}

- (UIScrollView)canvasScrollView
{
  return self->_canvasScrollView;
}

- (void)setCanvasScrollView:(id)a3
{
  self->_canvasScrollView = (UIScrollView *)a3;
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

- (CGPoint)movement
{
  double x;
  double y;
  CGPoint result;

  x = self->_movement.x;
  y = self->_movement.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMovement:(CGPoint)a3
{
  self->_movement = a3;
}

- (CGPoint)velocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_velocity.x;
  y = self->_velocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setVelocity:(CGPoint)a3
{
  self->_velocity = a3;
}

- (TSDPanGuide)guide
{
  return self->_guide;
}

- (void)setGuide:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
