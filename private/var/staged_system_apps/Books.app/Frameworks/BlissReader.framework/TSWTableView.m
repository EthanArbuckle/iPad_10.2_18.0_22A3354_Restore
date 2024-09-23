@implementation TSWTableView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  TSWTableView *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  TSWTableView *v14;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)TSWTableView;
  v5 = -[TSWTableView hitTest:withEvent:](&v17, "hitTest:withEvent:", a4, a3.x, a3.y);
  if (!objc_msgSend(-[TSWTableView subviews](self, "subviews"), "firstObject"))
    goto LABEL_4;
  objc_msgSend(objc_msgSend(-[TSWTableView subviews](self, "subviews"), "firstObject"), "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[TSWTableView bounds](self, "bounds");
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  if (CGRectEqualToRect(v18, v19))
    v14 = (TSWTableView *)objc_msgSend(-[TSWTableView subviews](self, "subviews"), "firstObject");
  else
LABEL_4:
    v14 = 0;
  if (-[TSWTableView ignoresEventsOutsideCells](self, "ignoresEventsOutsideCells"))
  {
    if (v5 == self || v5 == v14)
      return 0;
  }
  return v5;
}

- (BOOL)ignoresEventsOutsideCells
{
  return self->mIgnoresEventsOutsideCells;
}

- (void)setIgnoresEventsOutsideCells:(BOOL)a3
{
  self->mIgnoresEventsOutsideCells = a3;
}

@end
