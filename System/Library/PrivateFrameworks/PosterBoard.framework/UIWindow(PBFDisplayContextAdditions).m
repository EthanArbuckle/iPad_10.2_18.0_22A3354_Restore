@implementation UIWindow(PBFDisplayContextAdditions)

- (uint64_t)pbf_layoutOrientation
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "windowScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "interfaceOrientation");

  if (v2)
    return v2;
  else
    return PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
}

- (id)pbf_displayContext
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  objc_msgSend(a1, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFGenericDisplayContext displayContextForScreen:traitCollection:](PBFGenericDisplayContext, "displayContextForScreen:traitCollection:", v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayContextWithUpdatedInterfaceOrientation:", objc_msgSend(a1, "pbf_layoutOrientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
