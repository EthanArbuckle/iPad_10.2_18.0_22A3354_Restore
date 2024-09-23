@implementation PPConstants

+ (id)groupIds
{
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.proactive.PersonalizationPortrait.HealthKitDonation");
  v3[1] = CFSTR("com.apple.proactive.PersonalizationPortrait.Maps.Collections");
  v3[2] = CFSTR("com.apple.proactive.PersonalizationPortrait.Maps.PinnedPlaces");
  v3[3] = CFSTR("com.apple.proactive.PersonalizationPortrait.Maps.Interactions");
  v3[4] = CFSTR("com.apple.proactive.PersonalizationPortrait.Notifications");
  v3[5] = CFSTR("com.apple.proactive.PersonalizationPortrait.NowPlayingDonation");
  v3[6] = CFSTR("com.apple.proactive.PersonalizationPortrait.PhotosGraphDonation");
  v3[7] = CFSTR("com.apple.proactive.PersonalizationPortrait.PhotosOneUpDonation");
  v3[8] = CFSTR("com.apple.proactive.PersonalizationPortrait.pptool");
  v3[9] = CFSTR("com.apple.proactive.PersonalizationPortrait.SiriDonation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
