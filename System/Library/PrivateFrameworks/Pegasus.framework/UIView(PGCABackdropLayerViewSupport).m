@implementation UIView(PGCABackdropLayerViewSupport)

- (id)PG_backdropGroupLeader
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "PG_backdropGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)PG_preferredVisibilityForView:()PGCABackdropLayerViewSupport
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "PG_preferredVisibilityForView:", v4);

  return v6;
}

@end
