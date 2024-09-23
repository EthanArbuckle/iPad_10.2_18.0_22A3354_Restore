@implementation ATXModeReadingFeaturizer

- (unint64_t)expectedGenreId
{
  return 6018;
}

- (id)additionalAllowedBundleIds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.iBooks"));
}

- (int)modeFeatureType
{
  return 15;
}

- (id)registrationId
{
  return CFSTR("FocusModes.ReadingMode");
}

@end
