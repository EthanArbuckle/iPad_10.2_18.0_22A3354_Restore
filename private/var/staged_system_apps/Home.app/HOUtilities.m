@implementation HOUtilities

+ (double)viewMarginInsetForViewSizeSubclass:(int64_t)a3 withViewWidth:(double)a4
{
  double result;

  result = (a4 + -288.0) * 0.5;
  if (a3 > 2)
    return 74.0;
  return result;
}

+ (double)buttonPaddingToViewBottomForViewSizeSubclass:(int64_t)a3
{
  double result;

  result = 60.0;
  if (a3 != 3)
    return 24.0;
  return result;
}

+ (id)onboardingStatesForRestrictedGuestInvitation:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v3, "isInviteeRestrictedGuest"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "restrictedGuestSchedule"));

    if (v5)
      -[NSMutableArray addObject:](v4, "addObject:", &off_1000BF518);
    -[NSMutableArray addObject:](v4, "addObject:", &off_1000BF530);
    -[NSMutableArray addObject:](v4, "addObject:", &off_1000BF548);
  }
  v6 = -[NSMutableArray copy](v4, "copy");

  return v6;
}

@end
