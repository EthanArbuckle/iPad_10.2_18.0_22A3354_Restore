@implementation UIVisualEffectView(Grouping)

- (void)initWithBackgroundEffects:()Grouping
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "initWithEffect:", 0);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setBackgroundEffects:", v4);

  return v6;
}

@end
