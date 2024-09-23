@implementation THWConstants

+ (id)modeStringForMode:(int)a3
{
  id result;

  switch(a3)
  {
    case 0:
      result = kTHWidgetModeUninitializedString;
      break;
    case 1:
      result = kTHWidgetModeFixedString;
      break;
    case 2:
      result = kTHWidgetModeGutterString;
      break;
    case 3:
      result = kTHWidgetModeFullScreenString;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
