@implementation UIKBCachedImage

- (BOOL)hasFormatColor
{
  -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  return CGImageGetProperty() != 0;
}

- (UIColor)formatColor
{
  -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  if (CGImageGetProperty())
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:");
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setFormatColor:(id)a3
{
  UIKBCachedImage *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = objc_retainAutorelease(self);
    v5 = a3;
    -[UIImage CGImage](v4, "CGImage");
    v6 = objc_retainAutorelease(v5);
    objc_msgSend(v6, "CGColor");

    CGImageSetProperty();
  }
}

@end
