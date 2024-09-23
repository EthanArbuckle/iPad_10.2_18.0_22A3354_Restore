@implementation CRLFeatureFlagsHelper

+ (BOOL)isOSFeatureEnabled:(int64_t)a3
{
  BOOL result;

  switch(a3)
  {
    case 0:
      result = _os_feature_enabled_impl("Freeform", "BetterPencilSelection");
      break;
    case 1:
      result = _os_feature_enabled_impl("Freeform", "HandwritingIntelligence");
      break;
    case 2:
      result = _os_feature_enabled_impl("Freeform", "DrawingDataDetectors");
      break;
    case 3:
      if (!_os_feature_enabled_impl("Messages", "esa_ios"))
        goto LABEL_7;
      result = _os_feature_enabled_impl("VisualIntelligence", "Cling");
      break;
    case 4:
      result = _os_feature_enabled_impl("Freeform", "EasierConnectionLines");
      break;
    case 5:
      result = _os_feature_enabled_impl("Freeform", "SnapToGrid");
      break;
    default:
LABEL_7:
      result = 0;
      break;
  }
  return result;
}

@end
