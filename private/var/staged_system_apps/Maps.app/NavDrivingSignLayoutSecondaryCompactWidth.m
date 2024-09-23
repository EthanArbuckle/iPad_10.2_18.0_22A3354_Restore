@implementation NavDrivingSignLayoutSecondaryCompactWidth

+ (id)sharedDrivingSecondaryCompactWidthSignLayout
{
  if (qword_1014D4218 != -1)
    dispatch_once(&qword_1014D4218, &stru_1011E71F0);
  return (id)qword_1014D4210;
}

- (double)minimumHeightForSign:(id)a3
{
  return 48.0;
}

- (double)textTopMarginForSign:(id)a3
{
  return 31.0;
}

- (double)textBottomMarginForSign:(id)a3
{
  return 17.0;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  return 1;
}

- (BOOL)forceHideLaneGuidanceViewForSign:(id)a3
{
  return 1;
}

@end
