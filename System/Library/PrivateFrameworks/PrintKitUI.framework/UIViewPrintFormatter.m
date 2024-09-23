@implementation UIViewPrintFormatter

- (id)_initWithView:(id)a3
{
  id v5;
  UIViewPrintFormatter *v6;
  UIViewPrintFormatter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIViewPrintFormatter;
  v6 = -[UIPrintFormatter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_view, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIViewPrintFormatter;
  v4 = -[UIPrintFormatter copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 15, self->_view);
  return v5;
}

- (int64_t)_recalcPageCount
{
  UIView *view;
  double v4;
  double v5;
  int64_t v6;
  double v7;
  objc_super v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  view = self->_view;
  if (!view)
    return 0;
  -[UIView bounds](view, "bounds");
  if (v4 <= 0.0)
    return 0;
  v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)UIViewPrintFormatter;
  v6 = 1;
  -[UIPrintFormatter _pageContentRect:](&v10, sel__pageContentRect_, 1);
  v7 = v5 - CGRectGetHeight(v11);
  if (v7 > 0.0)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIViewPrintFormatter;
    -[UIPrintFormatter _pageContentRect:](&v9, sel__pageContentRect_, 0);
    return (uint64_t)(ceil(v7 / CGRectGetHeight(v12)) + 1.0);
  }
  return v6;
}

- (CGRect)rectForPageAtIndex:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSInteger v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  NSInteger v26;
  double v27;
  uint64_t v28;
  double v29;
  objc_super v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)UIViewPrintFormatter;
  -[UIPrintFormatter _pageContentRect:](&v31, sel__pageContentRect_, 1);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView bounds](self->_view, "bounds");
  v14 = v13;
  v16 = v15;
  v17 = -[UIPrintFormatter startPage](self, "startPage");
  if (v17 == a3)
  {
    v18 = v6;
    v19 = v8;
    v20 = v14;
    v21 = v16;
    v22 = v6;
    v23 = v8;
    v24 = v10;
    v25 = v12;
  }
  else
  {
    v26 = v17;
    v30.receiver = self;
    v30.super_class = (Class)UIViewPrintFormatter;
    -[UIPrintFormatter _pageContentRect:](&v30, sel__pageContentRect_, 0);
    v23 = v27;
    v24 = v28;
    v25 = v29;
    v19 = v27 - (v12 + v29 * (double)(~v26 + a3));
    v20 = v14;
    v21 = v16;
    v22 = v18;
  }
  return CGRectIntersection(*(CGRect *)&v18, *(CGRect *)&v22);
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  NSInteger v11;
  int64_t v12;
  double v13;
  double v14;
  objc_super v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGContextClipToRect(CurrentContext, v17);
  CGContextTranslateCTM(CurrentContext, x, y);
  v11 = -[UIPrintFormatter startPage](self, "startPage");
  v12 = a4 - v11 - 1;
  if (a4 - v11 < 1)
  {
    v14 = 0.0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIViewPrintFormatter;
    -[UIPrintFormatter _pageContentRect:](&v16, sel__pageContentRect_, 1);
    v13 = CGRectGetHeight(v18);
    v15.receiver = self;
    v15.super_class = (Class)UIViewPrintFormatter;
    -[UIPrintFormatter _pageContentRect:](&v15, sel__pageContentRect_, 0);
    v14 = v13 + (double)v12 * CGRectGetHeight(v19);
  }
  CGContextTranslateCTM(CurrentContext, 0.0, -v14);
  -[UIView drawRect:forViewPrintFormatter:](self->_view, "drawRect:forViewPrintFormatter:", self, 0.0, v14, width, height);
  CGContextRestoreGState(CurrentContext);
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
