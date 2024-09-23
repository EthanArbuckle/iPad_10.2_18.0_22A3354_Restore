@implementation UIView(SBUISystemApertureDynamicLayoutSupport)

- (uint64_t)SBUISA_systemApertureLeadingConcentricContentLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureLeadingConcentricContentLayoutGuideIdentifier"));
}

- (uint64_t)SBUISA_systemApertureTrailingConcentricContentLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureTrailingConcentricContentLayoutGuideIdentifier"));
}

- (uint64_t)SBUISA_systemApertureCustomControlsContentLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureCustomControlsContentLayoutGuideIdentifier"));
}

- (uint64_t)SBUISA_systemApertureLegibleContentLayoutMarginsGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureLegibleContentLayoutMarginsGuideIdentifier"));
}

- (double)SBUISA_standardInteritemPadding
{
  uint64_t v1;
  double result;

  v1 = objc_msgSend(a1, "SBUISA_layoutMode");
  result = 11.0;
  if ((unint64_t)(v1 + 1) < 5)
    return 5.5;
  return result;
}

@end
