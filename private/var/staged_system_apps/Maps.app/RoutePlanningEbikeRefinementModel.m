@implementation RoutePlanningEbikeRefinementModel

- (CyclePreferences)cyclePreferences
{
  void *v2;
  uint64_t v3;
  void *v4;
  CyclePreferences *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_opt_class(CyclePreferences);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)titleText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Route Planning, Cycling] E-Bike filter button"), CFSTR("localized string not found"), 0));

  return v3;
}

- (BOOL)shouldShowHighlighted
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEbikeRefinementModel cyclePreferences](self, "cyclePreferences"));
  v3 = objc_msgSend(v2, "ebike");

  return v3;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (int)buttonPressUsageAction
{
  return 0;
}

@end
