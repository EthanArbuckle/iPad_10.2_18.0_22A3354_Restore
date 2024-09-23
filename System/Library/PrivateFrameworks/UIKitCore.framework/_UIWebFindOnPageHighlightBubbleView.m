@implementation _UIWebFindOnPageHighlightBubbleView

- (void)drawRect:(CGRect)a3
{
  _QWORD *ContextStack;
  CGContext *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  id v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v13 = CGRectInset(v12, 6.0, 6.0);
  v14 = CGRectInset(v13, -3.5, -1.5);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height, 3.0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v5 = 0;
  else
    v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v5);
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.894117647, 0.219607843, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  objc_msgSend(v11, "fill");
  CGContextRestoreGState(v5);
  if (self->_highlightedContent)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = 1.0 / v8;

    v10 = round(v9 * (double)CGImageGetWidth(self->_highlightedContent));
    v15.size.height = round(v9 * (double)CGImageGetHeight(self->_highlightedContent));
    v15.origin.x = self->_highlightedContentOrigin.x;
    v15.origin.y = self->_highlightedContentOrigin.y;
    v15.size.width = v10;
    CGContextDrawImage(v5, v15, self->_highlightedContent);
  }

}

- (void)setHighlightedContent:(CGImage *)a3 withOrigin:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGImage *highlightedContent;

  y = a4.y;
  x = a4.x;
  highlightedContent = self->_highlightedContent;
  if (highlightedContent)
    CFRelease(highlightedContent);
  self->_highlightedContent = a3;
  if (a3)
    CFRetain(a3);
  self->_highlightedContentOrigin.x = x;
  self->_highlightedContentOrigin.y = y;
}

- (void)dealloc
{
  CGImage *highlightedContent;
  objc_super v4;

  highlightedContent = self->_highlightedContent;
  if (highlightedContent)
    CFRelease(highlightedContent);
  v4.receiver = self;
  v4.super_class = (Class)_UIWebFindOnPageHighlightBubbleView;
  -[UIView dealloc](&v4, sel_dealloc);
}

@end
