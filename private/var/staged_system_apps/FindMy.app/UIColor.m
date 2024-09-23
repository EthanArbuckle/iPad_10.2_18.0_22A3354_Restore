@implementation UIColor

+ (id)fmfOrangeColor
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

+ (id)fmfOverlayColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.1));

  return v3;
}

@end
