@implementation UIView(PXViewSpec)

- (void)px_setSpec:()PXViewSpec
{
  const void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = (const void *)PXViewSpecAssociationKey;
  v5 = a3;
  objc_setAssociatedObject(a1, v4, v5, (void *)1);
  objc_msgSend(v5, "backgroundColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v9);
  objc_msgSend(v5, "cornerRadius");
  v7 = v6;

  objc_msgSend(a1, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

}

- (id)px_spec
{
  return objc_getAssociatedObject(a1, (const void *)PXViewSpecAssociationKey);
}

@end
