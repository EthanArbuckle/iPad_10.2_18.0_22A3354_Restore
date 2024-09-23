@implementation THGlossaryInteractiveCanvasController

- (BOOL)shouldPreventBackgroundLayout
{
  return 0;
}

- (BOOL)usesTiledLayers
{
  return 0;
}

- (CGSize)canvasScrollingOutset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)supportsReadingHighlights
{
  return 0;
}

- (BOOL)supportsWritingHighlights
{
  return 0;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  NSUserDefaults *v2;

  v2 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  return -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", kTHShowTextOverflowIndicator[0]);
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THGlossaryInteractiveCanvasController;
  -[THInteractiveCanvasController setSelection:onModel:withFlags:](&v5, "setSelection:onModel:withFlags:", a3, a4, a5 & 0xFFFFFFFFFFFFFFAFLL);
}

- (void)p_dismissSearchKeyboard
{
  -[NSNotificationCenter postNotification:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotification:", +[NSNotification notificationWithName:object:](NSNotification, "notificationWithName:object:", kTHGlossaryDismissSearchNotification, self));
}

- (BOOL)handleGesture:(id)a3
{
  objc_super v6;

  -[THGlossaryInteractiveCanvasController p_dismissSearchKeyboard](self, "p_dismissSearchKeyboard");
  v6.receiver = self;
  v6.super_class = (Class)THGlossaryInteractiveCanvasController;
  return -[THInteractiveCanvasController handleGesture:](&v6, "handleGesture:", a3);
}

- (BOOL)handleHyperlinksWithTextGRs
{
  return 1;
}

- (void)showHyperlinkInfoForField:(id)a3 inRep:(id)a4 openInEditMode:(BOOL)a5
{
  id v6;
  THLinkTraversalDelegate *mLinkHandler;

  v6 = -[THInteractiveCanvasController linkForHyperlinkField:](self, "linkForHyperlinkField:", a3, a4, a5);
  mLinkHandler = self->mLinkHandler;
  if (!mLinkHandler)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryInteractiveCanvasController showHyperlinkInfoForField:inRep:openInEditMode:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryInteractiveCanvasController.m"), 105, CFSTR("invalid nil value for '%s'"), "mLinkHandler");
    mLinkHandler = self->mLinkHandler;
  }
  -[THLinkTraversalDelegate followLink:](mLinkHandler, "followLink:", v6);
}

- (void)handleHyperlinkGesture:(id)a3
{
  id v5;
  THLinkTraversalDelegate *mLinkHandler;

  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
  {
    if (objc_msgSend(a3, "wasTapHold"))
      +[TSWPEditMenuController hideEditMenu](TSWPEditMenuController, "hideEditMenu");
    v5 = -[THInteractiveCanvasController linkForHyperlinkField:](self, "linkForHyperlinkField:", objc_msgSend(a3, "hitField"));
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
    mLinkHandler = self->mLinkHandler;
    if (!mLinkHandler)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryInteractiveCanvasController handleHyperlinkGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryInteractiveCanvasController.m"), 129, CFSTR("invalid nil value for '%s'"), "mLinkHandler");
      mLinkHandler = self->mLinkHandler;
    }
    -[THLinkTraversalDelegate followLink:](mLinkHandler, "followLink:", v5);
  }
}

- (THLinkTraversalDelegate)linkHandler
{
  return self->mLinkHandler;
}

- (void)setLinkHandler:(id)a3
{
  self->mLinkHandler = (THLinkTraversalDelegate *)a3;
}

@end
