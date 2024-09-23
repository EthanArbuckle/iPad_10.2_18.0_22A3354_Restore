@implementation PSGUnderlineButton

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  -[PSGUnderlineButton currentTitleShadowColor](self, "currentTitleShadowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");

  -[PSGUnderlineButton bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v10 = v8 + -2.0;
  CGContextMoveToPoint(CurrentContext, self->_linePadding, v8 + -2.0);
  CGContextAddLineToPoint(CurrentContext, v7, v10);
  CGContextStrokePath(CurrentContext);
  -[PSGUnderlineButton currentTitleColor](self, "currentTitleColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "set");

  v12 = v9 + -3.0;
  CGContextMoveToPoint(CurrentContext, self->_linePadding, v12);
  CGContextAddLineToPoint(CurrentContext, v7, v12);
  CGContextStrokePath(CurrentContext);
}

- (float)linePadding
{
  return self->_linePadding;
}

- (void)setLinePadding:(float)a3
{
  self->_linePadding = a3;
}

@end
