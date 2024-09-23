@implementation UIViewController(PBFDisplayContextAdditions)

- (uint64_t)pbf_layoutOrientation
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a1, "isViewLoaded")
    && (objc_msgSend(a1, "view"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "window"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v3))
  {
    v4 = objc_msgSend(v3, "pbf_layoutOrientation");

    return v4;
  }
  else
  {
    objc_msgSend(a1, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "pbf_layoutOrientation");

      return v8;
    }
    else
    {
      return PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
    }
  }
}

- (id)pbf_displayContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFGenericDisplayContext displayContextForScreen:traitCollection:](PBFGenericDisplayContext, "displayContextForScreen:traitCollection:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "displayContextWithUpdatedInterfaceOrientation:", objc_msgSend(a1, "pbf_layoutOrientation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
