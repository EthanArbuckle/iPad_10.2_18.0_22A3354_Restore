@implementation UIView(TLKSharedPublic)

- (void)tlks_setCornerRadius:()TLKSharedPublic withStyle:
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerCurve:", v6);

  objc_msgSend(a1, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", a2);

}

- (id)tlks_screen
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "_screen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (void)tlks_scale
{
  double v2;
  void *v3;

  objc_msgSend(a1, "effectiveScreenScale");
  if (v2 == 0.0)
  {
    objc_msgSend(a1, "tlks_screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");

  }
}

@end
