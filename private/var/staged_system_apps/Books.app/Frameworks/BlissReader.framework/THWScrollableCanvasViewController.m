@implementation THWScrollableCanvasViewController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasViewController;
  -[THWScrollableCanvasViewController dealloc](&v3, "dealloc");
}

- (BOOL)wantsHyperlinkGestureRecognizer
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_super v5;

  if ("menuCopy:" != a3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)THWScrollableCanvasViewController;
  return -[THWScrollableCanvasViewController canPerformAction:withSender:](&v5, "canPerformAction:withSender:");
}

- (void)teardown
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasViewController;
  -[THWScrollableCanvasViewController teardown](&v3, "teardown");

  self->_magnifierBackgroundColor = 0;
}

- (id)backgroundColorForMagnifier
{
  if (!-[THWScrollableCanvasViewController magnifierBackgroundColor](self, "magnifierBackgroundColor"))
    -[THWScrollableCanvasViewController setMagnifierBackgroundColor:](self, "setMagnifierBackgroundColor:", +[TSUColor whiteColor](TSUColor, "whiteColor"));
  return -[THWScrollableCanvasViewController magnifierBackgroundColor](self, "magnifierBackgroundColor");
}

- (BOOL)shouldHideCanvasLayerInMagnifier
{
  return 0;
}

- (TSUColor)magnifierBackgroundColor
{
  return self->_magnifierBackgroundColor;
}

- (void)setMagnifierBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

@end
