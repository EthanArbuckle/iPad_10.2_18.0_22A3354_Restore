@implementation CRLiOSInsertPageViewControllerOverlayGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (!-[CRLiOSInsertPageViewControllerOverlayGestureRecognizer state](self, "state", a3, a4))
    -[CRLiOSInsertPageViewControllerOverlayGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[CRLiOSInsertPageViewControllerOverlayGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[CRLiOSInsertPageViewControllerOverlayGestureRecognizer setState:](self, "setState:", 5, a4);
}

@end
