@implementation UIWindowScene(UVAdditions)

- (double)previewMaximumSize
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "previewMaximumSize");
    v4 = v3;
  }
  else
  {
    objc_msgSend(v2, "displayConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v4 = v6;

  }
  return v4;
}

- (id)displayName
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)displayScale
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointScale");
  v5 = v4;

  return v5;
}

@end
