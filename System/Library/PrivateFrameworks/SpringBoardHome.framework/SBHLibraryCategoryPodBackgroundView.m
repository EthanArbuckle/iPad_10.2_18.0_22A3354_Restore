@implementation SBHLibraryCategoryPodBackgroundView

+ (id)visualStyleSetNameForUserInterfaceStyle:(int64_t)a3
{
  if (a3 == 2)
    return CFSTR("podBackgroundViewDark");
  else
    return CFSTR("podBackgroundViewLight");
}

@end
