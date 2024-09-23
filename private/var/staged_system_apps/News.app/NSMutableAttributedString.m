@implementation NSMutableAttributedString

- (void)fr_accessibilityApplyLowerPitchTokenToRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v7 = UIAccessibilityTokenLowPitch;
  v8 = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v6, location, length);

}

@end
