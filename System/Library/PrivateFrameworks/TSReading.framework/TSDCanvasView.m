@implementation TSDCanvasView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setController:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!self->mController
    || (v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasView setController:]"),
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasView.m"), 38, CFSTR("shouldn't try to set canvasView's controller more than once")), !self->mController))
  {
    self->mController = (TSDInteractiveCanvasController *)a3;
    -[TSDCanvasLayer setController:](-[TSDCanvasView canvasLayer](self, "canvasLayer"), "setController:", a3);
    -[TSDCanvasView setLayerHost:](self, "setLayerHost:", objc_msgSend(a3, "layerHost"));
  }
}

- (void)teardown
{
  self->mController = 0;
  -[TSDCanvasLayer teardown](-[TSDCanvasView canvasLayer](self, "canvasLayer"), "teardown");
  if (TSUSupportsTextInteraction())
    self->mHyperLinkDelegate = 0;
}

- (TSDCanvasLayer)canvasLayer
{
  objc_opt_class();
  -[TSDCanvasView layer](self, "layer");
  return (TSDCanvasLayer *)TSUDynamicCast();
}

- (TSKScrollView)enclosingScrollView
{
  objc_opt_class();
  -[TSDCanvasView superview](self, "superview");
  return (TSKScrollView *)TSUDynamicCast();
}

- (TSDCanvasView)rootCanvasView
{
  TSDCanvasView *v2;
  uint64_t v3;
  TSDCanvasView *v4;

  v2 = self;
  v3 = -[TSDCanvasView superview](self, "superview");
  if (v3)
  {
    v4 = (TSDCanvasView *)v3;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v2 = v4;
      v4 = (TSDCanvasView *)-[TSDCanvasView superview](v4, "superview");
    }
    while (v4);
  }
  return v2;
}

- (BOOL)mightHaveLinks
{
  int v3;

  v3 = TSUSupportsTextInteraction();
  if (v3)
    LOBYTE(v3) = -[UITextLinkInteraction mightHaveLinks](self->mHyperLinkDelegate, "mightHaveLinks");
  return v3;
}

- (void)tapLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
    -[UITextLinkInteraction tapLinkAtPoint:](self->mHyperLinkDelegate, "tapLinkAtPoint:", x, y);
}

- (BOOL)isInteractingWithLink
{
  int v3;

  v3 = TSUSupportsTextInteraction();
  if (v3)
    LOBYTE(v3) = -[UITextLinkInteraction isInteractingWithLink](self->mHyperLinkDelegate, "isInteractingWithLink");
  return v3;
}

- (void)startInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
    -[UITextLinkInteraction startInteractionWithLinkAtPoint:](self->mHyperLinkDelegate, "startInteractionWithLinkAtPoint:", x, y);
}

- (void)updateInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
    -[UITextLinkInteraction updateInteractionWithLinkAtPoint:](self->mHyperLinkDelegate, "updateInteractionWithLinkAtPoint:", x, y);
}

- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
    -[UITextLinkInteraction validateInteractionWithLinkAtPoint:](self->mHyperLinkDelegate, "validateInteractionWithLinkAtPoint:", x, y);
}

- (void)cancelInteractionWithLink
{
  if (TSUSupportsTextInteraction())
    -[UITextLinkInteraction cancelInteractionWithLink](self->mHyperLinkDelegate, "cancelInteractionWithLink");
}

- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
    -[UITextLinkInteraction startLongInteractionWithLinkAtPoint:](self->mHyperLinkDelegate, "startLongInteractionWithLinkAtPoint:", x, y);
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;
  int v6;

  y = a3.y;
  x = a3.x;
  v6 = TSUSupportsTextInteraction();
  if (v6)
    LOBYTE(v6) = -[UITextLinkInteraction willInteractWithLinkAtPoint:](self->mHyperLinkDelegate, "willInteractWithLinkAtPoint:", x, y);
  return v6;
}

- (void)_requestTextItemConstrainedToLineAtPoint:(CGPoint)a3 resultHandler:(id)a4
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UITextLinkInteraction _requestTextItemConstrainedToLineAtPoint:resultHandler:](self->mHyperLinkDelegate, "_requestTextItemConstrainedToLineAtPoint:resultHandler:", a4, x, y);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  TSDInteractiveCanvasController *mController;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  -[TSDCanvasView bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  mController = self->mController;
  if (mController)
  {
    -[TSDInteractiveCanvasController delegate](mController, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:expandBoundsForHitTesting:](-[TSDInteractiveCanvasController delegate](self->mController, "delegate"), "interactiveCanvasController:expandBoundsForHitTesting:", self->mController, v8, v10, v12, v14);
      v8 = v16;
      v10 = v17;
      v12 = v18;
      v14 = v19;
    }
  }
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  v21.x = x;
  v21.y = y;
  return CGRectContainsPoint(v22, v21);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v8;
  objc_super v9;

  if ((id)-[TSDCanvasView layer](self, "layer") == a3)
  {
    v8 = -[TSDInteractiveCanvasController i_currentAnimation](self->mController, "i_currentAnimation");
    if (v8)
      return (id)objc_msgSend(v8, "actionForLayer:forKey:", a3, a4);
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDCanvasView;
  return -[TSDCanvasView actionForLayer:forKey:](&v9, sel_actionForLayer_forKey_, a3, a4);
}

- (id)_textInputForReveal
{
  return -[TSDInteractiveCanvasController textInputResponder](self->mController, "textInputResponder");
}

- (id)_textImageFromRect:(CGRect)a3
{
  id result;

  result = -[TSDInteractiveCanvasController textImageFromRect:](self->mController, "textImageFromRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", result);
  return result;
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->mLayerHost;
}

- (void)setLayerHost:(id)a3
{
  self->mLayerHost = (TSDCanvasLayerHosting *)a3;
}

- (TSDInteractiveCanvasController)controller
{
  return self->mController;
}

- (UITextLinkInteraction)hyperLinkDelegate
{
  return self->mHyperLinkDelegate;
}

- (void)setHyperLinkDelegate:(id)a3
{
  self->mHyperLinkDelegate = (UITextLinkInteraction *)a3;
}

@end
