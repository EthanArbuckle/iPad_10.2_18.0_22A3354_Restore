@implementation NSLayoutAnchor(UIKitExtras)

- (id)constraintEqualToAnchor:()UIKitExtras constant:priority:
{
  void *v4;
  double v5;

  objc_msgSend(a1, "constraintEqualToAnchor:constant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

@end
