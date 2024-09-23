@implementation ICPrintPageRenderer

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  CGContext *CurrentContext;
  id v12;
  objc_super v13;
  CGRect v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICPrintPageRenderer backgroundColor](self, "backgroundColor"));

  if (v10)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ICPrintPageRenderer backgroundColor](self, "backgroundColor")));
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v12, "CGColor"));

    -[ICPrintPageRenderer paperRect](self, "paperRect");
    CGContextFillRect(CurrentContext, v14);
  }
  v13.receiver = self;
  v13.super_class = (Class)ICPrintPageRenderer;
  -[ICPrintPageRenderer drawPageAtIndex:inRect:](&v13, "drawPageAtIndex:inRect:", a3, x, y, width, height);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
