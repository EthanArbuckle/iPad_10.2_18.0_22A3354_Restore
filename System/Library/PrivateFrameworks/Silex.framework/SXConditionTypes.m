@implementation SXConditionTypes

void __SXConditionTypes_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", SXConditionMinViewportWidth, SXConditionMaxViewportWidth, SXConditionMinViewportAspectRatio, SXConditionMaxViewportAspectRatio, SXConditionMinContentSizeCategory, SXConditionMaxContentSizeCategory, SXConditionMinColumns, SXConditionMaxColumns, SXConditionPlatform, SXConditionViewLocation, SXConditionMinSpecVersion, SXConditionMaxSpecVersion, SXConditionHorizontalSizeClass, SXConditionVerticalSizeClass, SXConditionSubscriptionStatus, SXConditionOfferUpsellScenario, SXConditionSubscriptionActivationEligibility,
    SXConditionTesting,
    SXConditionPreferredColorScheme,
    SXConditionNewsletterSubscriptionStatus,
    SXConditionConfigurationKey,
    SXConditionApp,
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SXConditionTypes_types;
  SXConditionTypes_types = v0;

}

@end
