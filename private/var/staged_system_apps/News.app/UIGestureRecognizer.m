@implementation UIGestureRecognizer

- (void)cancel
{
  if (-[UIGestureRecognizer state](self, "state"))
  {
    if ((id)-[UIGestureRecognizer state](self, "state") == (id)1
      || (id)-[UIGestureRecognizer state](self, "state") == (id)2)
    {
      -[UIGestureRecognizer setState:](self, "setState:", 4);
    }
  }
  else
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
}

@end
