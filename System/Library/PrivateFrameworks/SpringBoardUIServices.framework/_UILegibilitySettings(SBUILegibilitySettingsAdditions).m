@implementation _UILegibilitySettings(SBUILegibilitySettingsAdditions)

- (void)shadowSettings
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a1, "shadowRadius");
  v5 = v4;
  objc_msgSend(a1, "shadowAlpha");
  v7 = v6;
  objc_msgSend(a1, "imageOutset");
  a2[3] = 0;
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v8;
  objc_msgSend(a1, "shadowCompositingFilterName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  a2[3] = SBUILegibilityShadowCompositingFilterForCAFilterName(v9);

}

@end
