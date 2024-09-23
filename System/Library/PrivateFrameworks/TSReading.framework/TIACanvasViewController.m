@implementation TIACanvasViewController

- (id)commonGestureRecognizers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIACanvasViewController;
  return -[NSArray arrayByAddingObjectsFromArray:](-[TSDiOSCanvasViewController commonGestureRecognizers](&v3, sel_commonGestureRecognizers), "arrayByAddingObjectsFromArray:", -[TIACanvasViewController p_LocalGestureRecognizers](self, "p_LocalGestureRecognizers"));
}

- (void)setUpGestureRecognizers
{
  TSAHyperlinkGestureRecognizer *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIACanvasViewController;
  -[TSWPiOSCanvasViewController setUpGestureRecognizers](&v4, sel_setUpGestureRecognizers);
  if (-[TIACanvasViewController wantsHyperlinkGestureRecognizer](self, "wantsHyperlinkGestureRecognizer"))
  {
    if (!-[TIACanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"))
    {
      v3 = -[TSAHyperlinkGestureRecognizer initWithTarget:action:]([TSAHyperlinkGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleHyperlinkGesture_);
      -[TIACanvasViewController setHyperlinkGestureRecognizer:](self, "setHyperlinkGestureRecognizer:", v3);
      -[TSAHyperlinkGestureRecognizer setDelegate:](v3, "setDelegate:", self);
      -[TSAHyperlinkGestureRecognizer setIcc:](v3, "setIcc:", -[TIACanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    }
    objc_msgSend((id)-[TIACanvasViewController view](self, "view"), "addGestureRecognizer:", -[TIACanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"));
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->super.super.mSingleTapGestureRecognizer, "requireGestureRecognizerToFail:", -[TIACanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"));
    -[TSDRepDragGestureRecognizer requireGestureRecognizerToFail:](self->super.super.mRepDragGestureRecognizer, "requireGestureRecognizerToFail:", -[TIACanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"));
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  objc_super v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  v8.receiver = self;
  v8.super_class = (Class)TIACanvasViewController;
  return -[TSDiOSCanvasViewController gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:](&v8, sel_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_, a3, a4);
}

- (void)setHyperlinkGestureRecognizer:(id)a3
{
  self->super._hyperlinkGestureRecognizer = (UIGestureRecognizer *)a3;
}

- (UIGestureRecognizer)hyperlinkGestureRecognizer
{
  return self->super._hyperlinkGestureRecognizer;
}

- (BOOL)wantsHyperlinkGestureRecognizer
{
  return 1;
}

- (TSAInteractiveCanvasController)interactiveCanvasController
{
  objc_opt_class();
  return (TSAInteractiveCanvasController *)TSUDynamicCast();
}

- (id)p_LocalGestureRecognizers
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[UIGestureRecognizer isEnabled](-[TIACanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"), "isEnabled"))
  {
    objc_msgSend(v3, "addObject:", -[TIACanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"));
  }
  return v3;
}

@end
