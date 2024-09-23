@implementation UIColor

- (BOOL)isDark
{
  void *v3;
  UIColor *v4;
  CGColor *v5;

  v3 = (void *)objc_opt_self(BKImageColorAnalyzer);
  v4 = self;
  v5 = -[UIColor CGColor](v4, "CGColor");
  LOBYTE(v3) = objc_msgSend(v3, "isDarkColor:", v5);

  return (char)v3;
}

@end
