@implementation UIViewController(PXViewController)

- (double)px_referenceSize
{
  void *v2;
  double v3;
  double v4;

  if ((objc_msgSend(a1, "isViewLoaded") & 1) == 0)
    return *(double *)off_1E50B8810;
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

- (double)px_windowReferenceSize
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "viewIfLoaded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "bounds");
    v4 = v3;
  }
  else
  {
    v4 = *(double *)off_1E50B8810;
  }

  return v4;
}

@end
