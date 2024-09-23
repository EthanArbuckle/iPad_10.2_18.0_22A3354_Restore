@implementation CUINamedLookup(UIKitAdditions)

- (id)configuration
{
  void *v0;
  void *v1;
  id v2;

  +[UITraitCollection _emptyTraitCollection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v0 = (void *)objc_msgSend(v0, "imageConfiguration");
  v2 = v0;

  return v2;
}

@end
