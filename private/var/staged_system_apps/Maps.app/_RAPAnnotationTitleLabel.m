@implementation _RAPAnnotationTitleLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGContext *CurrentContext;
  void *v14;
  objc_super v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_RAPAnnotationTitleLabel shadowOffset](self, "shadowOffset");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPAnnotationTitleLabel textColor](self, "textColor"));
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 3.0);
  CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
  CGContextSetTextDrawingMode(CurrentContext, kCGTextStroke);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[_RAPAnnotationTitleLabel setTextColor:](self, "setTextColor:", v14);

  v16.receiver = self;
  v16.super_class = (Class)_RAPAnnotationTitleLabel;
  -[_RAPAnnotationTitleLabel drawTextInRect:](&v16, "drawTextInRect:", x, y, width, height);
  CGContextSetTextDrawingMode(CurrentContext, kCGTextFill);
  -[_RAPAnnotationTitleLabel setTextColor:](self, "setTextColor:", v12);
  -[_RAPAnnotationTitleLabel setShadowOffset:](self, "setShadowOffset:", 0.0, 0.0);
  v15.receiver = self;
  v15.super_class = (Class)_RAPAnnotationTitleLabel;
  -[_RAPAnnotationTitleLabel drawTextInRect:](&v15, "drawTextInRect:", x, y, width, height);
  -[_RAPAnnotationTitleLabel setShadowOffset:](self, "setShadowOffset:", v9, v11);

}

@end
