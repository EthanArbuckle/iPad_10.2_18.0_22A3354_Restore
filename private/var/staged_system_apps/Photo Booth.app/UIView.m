@implementation UIView

- (void)updateShadow
{
  CALayer *v3;
  double v4;

  v3 = -[UIView layer](self, "layer");
  -[CALayer setShadowColor:](v3, "setShadowColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
  -[CALayer setShadowOffset:](v3, "setShadowOffset:", 0.0, 4.0);
  LODWORD(v4) = 1060320051;
  -[CALayer setShadowOpacity:](v3, "setShadowOpacity:", v4);
  -[CALayer setShadowRadius:](v3, "setShadowRadius:", 4.0);
  -[UIView updateShadowPath](self, "updateShadowPath");
}

- (void)updateShadowPath
{
  CGPath *Mutable;
  CGRect v4;

  Mutable = CGPathCreateMutable();
  -[CALayer bounds](-[UIView layer](self, "layer"), "bounds");
  CGPathAddRect(Mutable, 0, v4);
  -[CALayer setShadowPath:](-[UIView layer](self, "layer"), "setShadowPath:", Mutable);
  CGPathRelease(Mutable);
}

@end
