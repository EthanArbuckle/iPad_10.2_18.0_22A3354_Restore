@implementation SUGradientView

- (void)dealloc
{
  CGGradient *cgGradient;
  objc_super v4;

  cgGradient = self->_cgGradient;
  if (cgGradient)
    CGGradientRelease(cgGradient);

  v4.receiver = self;
  v4.super_class = (Class)SUGradientView;
  -[SUGradientView dealloc](&v4, sel_dealloc);
}

- (void)setGradient:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CGGradient *v8;
  CGGradient *cgGradient;

  if (self->_gradient == a3)
    return;
  if (a3)
  {
    v5 = (void *)objc_msgSend(a3, "colorStopColors");
    if (objc_msgSend(v5, "count") != 1)
    {
      v8 = (CGGradient *)objc_msgSend(a3, "copyCGGradient");
      v7 = objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      goto LABEL_9;
    }
    v6 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", objc_msgSend(v5, "objectAtIndex:", 0));
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  }
  v7 = v6;
  v8 = 0;
LABEL_9:
  -[SUGradientView setBackgroundColor:](self, "setBackgroundColor:", v7);
  cgGradient = self->_cgGradient;
  if (cgGradient)
    CGGradientRelease(cgGradient);
  self->_cgGradient = v8;

  self->_gradient = (SUGradient *)objc_msgSend(a3, "copy");
  -[SUGradientView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGContext *CurrentContext;
  CGPoint v21;
  CGPoint v22;

  if (self->_cgGradient)
  {
    -[SUGradientView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[SUGradient p0](self->_gradient, "p0");
    v13 = v12;
    v15 = v14;
    -[SUGradient p1](self->_gradient, "p1");
    v17 = v16;
    v19 = v18;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextTranslateCTM(CurrentContext, v5, v7);
    CGContextScaleCTM(CurrentContext, v9, v11);
    v21.x = v13;
    v21.y = v15;
    v22.x = v17;
    v22.y = v19;
    CGContextDrawLinearGradient(CurrentContext, self->_cgGradient, v21, v22, 3u);
    CGContextRestoreGState(CurrentContext);
  }
}

- (SUGradient)gradient
{
  return self->_gradient;
}

@end
