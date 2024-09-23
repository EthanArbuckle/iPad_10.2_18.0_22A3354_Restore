@implementation THCustomLayerView

- (UIColor)borderColor
{
  return +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(-[THCustomLayerView layer](self, "layer"), "borderColor"));
}

- (void)setBorderColor:(id)a3
{
  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "setBorderColor:", objc_msgSend(a3, "CGColor"));
}

- (double)borderWidth
{
  double result;

  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "borderWidth");
  return result;
}

- (void)setBorderWidth:(double)a3
{
  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "setBorderWidth:", a3);
}

- (id)contents
{
  return objc_msgSend(-[THCustomLayerView layer](self, "layer"), "contents");
}

- (void)setContents:(id)a3
{
  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "setContents:", a3);
}

- (CGRect)contentsRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "contentsRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "setContentsRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)contentsGravity
{
  return (NSString *)objc_msgSend(-[THCustomLayerView layer](self, "layer"), "contentsGravity");
}

- (void)setContentsGravity:(id)a3
{
  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "setContentsGravity:", a3);
}

- (double)contentsScale
{
  double result;

  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "contentsScale");
  return result;
}

- (void)setContentsScale:(double)a3
{
  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "setContentsScale:", a3);
}

- (CGRect)contentsCenter
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "contentsCenter");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentsCenter:(CGRect)a3
{
  objc_msgSend(-[THCustomLayerView layer](self, "layer"), "setContentsCenter:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBackgroundColorFromPatternImage:(id)a3
{
  -[THCustomLayerView setBackgroundColor:](self, "setBackgroundColor:", -[TSUColor UIColor](+[TSUColor colorWithPatternImage:](TSUColor, "colorWithPatternImage:", a3), "UIColor"));
}

- (void)setContentsFromImage:(id)a3
{
  -[THCustomLayerView setContents:](self, "setContents:", objc_msgSend(a3, "CGImage"));
  objc_msgSend(a3, "scale");
  -[THCustomLayerView setContentsScale:](self, "setContentsScale:");
}

@end
