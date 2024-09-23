@implementation UIView(SBUISystemApertureStaticLayoutSupport)

- (uint64_t)SBUISA_systemApertureLeadingViewLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureLeadingAreaLayoutGuideIdentifier"));
}

- (uint64_t)SBUISA_systemApertureTrailingViewLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureTrailingAreaLayoutGuideIdentifier"));
}

- (uint64_t)SBUISA_systemApertureMinimalViewLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureMinimalAreaLayoutGuideIdentifier"));
}

@end
