@implementation TSWPopoverDismissGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[TSWPopoverDismissGestureRecognizer setState:](self, "setState:", 1, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[TSWPopoverDismissGestureRecognizer setState:](self, "setState:", 3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[TSWPopoverDismissGestureRecognizer setState:](self, "setState:", 4, a4);
}

@end
