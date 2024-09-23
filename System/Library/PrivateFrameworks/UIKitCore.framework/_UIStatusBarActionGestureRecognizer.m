@implementation _UIStatusBarActionGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 1, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    objc_msgSend(v10, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v9);
    -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", objc_msgSend(v8, "pointInside:withEvent:", v6));

  }
  else
  {
    -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (-[_UIStatusBarActionGestureRecognizer highlighted](self, "highlighted", a3, a4))
    v5 = 3;
  else
    v5 = 5;
  -[UIGestureRecognizer setState:](self, "setState:", v5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 4);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if (_UIPressesContainsPressType(a3, 4))
  {
    -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 1);
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (_UIPressesContainsPressType(a3, 4))
  {
    if (-[_UIStatusBarActionGestureRecognizer highlighted](self, "highlighted"))
      v5 = 3;
    else
      v5 = 5;
    -[UIGestureRecognizer setState:](self, "setState:", v5);
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 4);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (-[UIGestureRecognizer state](self, "state") >= UIGestureRecognizerStateBegan)
      -[UIGestureRecognizer setState:](self, "setState:", 2);
  }
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

@end
