@implementation FBSSceneSettings(SBUISystemAperture)

- (uint64_t)SBUISA_layoutMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213009);

  return v2;
}

- (double)SBUISA_containerViewFrame
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213010);
  v3 = v2;

  return v3;
}

- (double)SBUISA_resolvedLeadingViewFrame
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213011);
  v3 = v2;

  return v3;
}

- (double)SBUISA_resolvedTrailingViewFrame
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213012);
  v3 = v2;

  return v3;
}

- (double)SBUISA_resolvedMinimalViewFrame
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213013);
  v3 = v2;

  return v3;
}

- (double)SBUISA_resolvedDetachedMinimalViewFrame
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213014);
  v3 = v2;

  return v3;
}

- (double)SBUISA_obstructedAreaLayoutFrame
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213015);
  v3 = v2;

  return v3;
}

- (uint64_t)SBUISA_minimalViewLayoutAxis
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 3213016);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (uint64_t)SBUISA_isBeingRemoved
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 3213017);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)SBUI_systemApertureDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUI_systemApertureDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "SBUI_systemApertureDescriptionOfDiffFromSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
