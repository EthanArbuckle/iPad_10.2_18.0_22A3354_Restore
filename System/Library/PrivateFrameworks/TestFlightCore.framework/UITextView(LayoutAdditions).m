@implementation UITextView(LayoutAdditions)

- (double)tf_estimatedFirstBaseline
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "font");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tf_estimatedFirstBaseline");
    v5 = v4;
    objc_msgSend(a1, "textContainerInset");
    v7 = v5 + v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

@end
