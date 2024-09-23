@implementation TSKHorizontalDragRecognizer

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  UIScrollView *v5;
  objc_super v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (UIScrollView *)objc_msgSend(a3, "view");
    if (v5 == -[TSKHorizontalDragRecognizer containingScrollView](self, "containingScrollView")
      && -[TSKHorizontalDragRecognizer state](self, "state") != 5)
    {
      return 0;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TSKHorizontalDragRecognizer;
  return -[TSKHorizontalDragRecognizer canBePreventedByGestureRecognizer:](&v7, sel_canBePreventedByGestureRecognizer_, a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGFloat v6;
  CGFloat v7;

  if ((unint64_t)objc_msgSend(a3, "count") < 2)
  {
    objc_msgSend((id)objc_msgSend(a3, "anyObject"), "locationInView:", -[TSKHorizontalDragRecognizer view](self, "view"));
    self->mStartPoint.x = v6;
    self->mStartPoint.y = v7;
  }
  else
  {
    -[TSKHorizontalDragRecognizer setState:](self, "setState:", 5);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  TSKHorizontalDragRecognizer *v9;
  uint64_t v10;

  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "locationInView:", -[TSKHorizontalDragRecognizer view](self, "view"));
  v6 = v5;
  v8 = v7;
  if (!-[TSKHorizontalDragRecognizer state](self, "state") && vabdd_f64(v8, self->mStartPoint.y) > 15.0)
  {
    v9 = self;
    v10 = 5;
LABEL_10:
    -[TSKHorizontalDragRecognizer setState:](v9, "setState:", v10);
    return;
  }
  if (!-[TSKHorizontalDragRecognizer state](self, "state") && vabdd_f64(v6, self->mStartPoint.x) > 10.0)
  {
    v9 = self;
    v10 = 1;
    goto LABEL_10;
  }
  if (-[TSKHorizontalDragRecognizer state](self, "state") == 1
    || -[TSKHorizontalDragRecognizer state](self, "state") == 2)
  {
    v9 = self;
    v10 = 2;
    goto LABEL_10;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (-[TSKHorizontalDragRecognizer state](self, "state", a3, a4) == 2)
  {
    v5 = 3;
  }
  else if (-[TSKHorizontalDragRecognizer state](self, "state") == 1)
  {
    v5 = 3;
  }
  else
  {
    v5 = 5;
  }
  -[TSKHorizontalDragRecognizer setState:](self, "setState:", v5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[TSKHorizontalDragRecognizer setState:](self, "setState:", 4, a4);
}

- (UIScrollView)containingScrollView
{
  return self->mContainingScrollView;
}

- (void)setContainingScrollView:(id)a3
{
  self->mContainingScrollView = (UIScrollView *)a3;
}

@end
