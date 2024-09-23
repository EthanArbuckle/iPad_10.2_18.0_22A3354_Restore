@implementation RatingRequestHomeAvailability

+ (BOOL)shouldShowRatingRequestDiscoveryBanner
{
  GEOCanUserMakeLagunaBeachContributions(a1, a2);
  return 0;
}

+ (BOOL)shouldShowRatingRequestSuggestionsOnProactiveTray
{
  return MKGetHasUserConsentedToAddingContributions(a1, a2) != 2;
}

+ (void)setHasShownTipKitAlertOnProactiveTray
{
  GEOConfigSetBOOL(MapsConfig_LagunaBeachHasShownTipKitAlert, off_1014B3A68, 1);
}

@end
