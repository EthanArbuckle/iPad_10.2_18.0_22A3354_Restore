@implementation FBScene(HostingController)

- (id)_uiHostingController
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

@end
