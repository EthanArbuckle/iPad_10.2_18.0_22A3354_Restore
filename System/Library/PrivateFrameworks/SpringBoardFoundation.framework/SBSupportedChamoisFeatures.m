@implementation SBSupportedChamoisFeatures

uint64_t __SBSupportedChamoisFeatures_block_invoke()
{
  uint64_t result;

  SBSupportedChamoisFeatures_sFeaturesMask = 0;
  if (MGGetBoolAnswer())
    SBSupportedChamoisFeatures_sFeaturesMask |= 1uLL;
  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    SBSupportedChamoisFeatures_sFeaturesMask = -1;
  return result;
}

@end
