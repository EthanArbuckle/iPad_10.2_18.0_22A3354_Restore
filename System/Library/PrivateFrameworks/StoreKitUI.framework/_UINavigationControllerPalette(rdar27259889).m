@implementation _UINavigationControllerPalette(rdar27259889)

- (void)resetBackgroundConstraints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "_backgroundConstraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "_backgroundConstraints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_backgroundConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setConstant:", 0.0);
    objc_msgSend(v5, "setConstant:", 0.0);

  }
}

@end
