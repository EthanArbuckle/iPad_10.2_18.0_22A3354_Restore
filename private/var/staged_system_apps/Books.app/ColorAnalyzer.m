@implementation ColorAnalyzer

- (BOOL)isDarkColor:(CGColor *)a3
{
  return objc_msgSend((id)objc_opt_self(BKImageColorAnalyzer), "isDarkColor:", a3);
}

- (double)colorLuminance:(CGColor *)a3
{
  double result;

  objc_msgSend((id)objc_opt_self(BKImageColorAnalyzer), "colorLuminance:", a3);
  return result;
}

@end
