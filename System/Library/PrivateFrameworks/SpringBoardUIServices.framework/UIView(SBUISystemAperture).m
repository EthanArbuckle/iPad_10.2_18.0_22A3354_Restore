@implementation UIView(SBUISystemAperture)

- (uint64_t)SBUISA_layoutMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "systemApertureHostedElementContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "layoutMode");

  return v2;
}

- (uint64_t)SBUISA_systemApertureObstructedAreaLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureObstructedAreaLayoutGuideIdentifier"));
}

- (double)SBUISA_maximumAccessoryViewWidth
{
  void *v0;
  double v1;
  double v2;

  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "maximumLeadingTrailingViewSize");
  v2 = v1;

  return v2;
}

@end
