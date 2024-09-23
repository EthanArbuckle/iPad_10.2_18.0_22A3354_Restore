@implementation UIView(SBClassicLayout)

- (uint64_t)sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpaceForInterfaceOrientation:()SBClassicLayout allowStatusBarToOverlap:useDeviceCornerRadius:
{
  return objc_msgSend(a1, "_sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpace:forInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:", 1, a3, 0, a4, a5, 1.0);
}

- (uint64_t)sbClassicLayout_applyTransformsForClassicPresentationInLayoutSpaceForInterfaceOrientation:()SBClassicLayout withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:
{
  return objc_msgSend(a1, "_sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpace:forInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:", 0, a3, a4, a5, a6);
}

- (void)_sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpace:()SBClassicLayout forInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:
{
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  id v27;

  v15 = SBFEffectiveHomeButtonType();
  if (a5 && v15 == 2)
  {
    objc_msgSend(a1, "layer");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v16, "_referenceBounds");
    v22 = v21;
    v24 = v23;
    if ((unint64_t)(a5 - 5) < 0xFFFFFFFFFFFFFFFELL)
      v25 = 1;
    else
      v25 = a4;
    if (v25)
      v26 = v20;
    else
      v26 = v18;
    if (!v25)
      v18 = v20;
    objc_msgSend(v27, "setMasksToBounds:", 1);
    objc_msgSend(v27, "setMaskedCorners:", 15);
    SBClassicUtilitiesInsetAndTranslateLayerForPresentationWithHomeAffordance(v27, v16, a4, a5, a6, a7, a8, v22, v24, v18, v26, a2);

  }
}

@end
