@implementation NavSignLayoutDelegateManager

+ (id)layoutDelegateForSign:(id)a3 layoutType:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = objc_opt_class(NavMessageSignView);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultMessageSignLayoutDelegate"));
  }
  else
  {
    v9 = objc_opt_class(NavSecondaryDrivingSignView);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      if (a4 == 2)
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "compactWidthSecondarySignLayoutDelegateForDriving"));
      else
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "secondarySignLayoutDelegateForDriving"));
    }
    else
    {
      v10 = objc_opt_class(NavPrimaryDrivingSignView);
      if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
      {
        if (a4 == 1)
        {
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "minimizedLayoutDelegateForDriving"));
        }
        else if (a4 == 2)
        {
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "compactWidthLayoutDelegateForDriving"));
        }
        else
        {
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultLayoutDelegateForDriving"));
        }
      }
      else if (a4 == 2)
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "compactWidthLayoutDelegateForWalking"));
      }
      else
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultLayoutDelegateForWalking"));
      }
    }
  }
  v11 = (void *)v8;

  return v11;
}

+ (id)defaultMessageSignLayoutDelegate
{
  return +[NavMessageSignLayout sharedMessageSignLayout](NavMessageSignLayout, "sharedMessageSignLayout");
}

+ (id)defaultLayoutDelegateForDriving
{
  return +[NavDrivingSignLayout sharedDrivingSignLayout](NavDrivingSignLayout, "sharedDrivingSignLayout");
}

+ (id)compactWidthLayoutDelegateForDriving
{
  return +[NavDrivingSignLayoutCompactWidth sharedDrivingCompactWidthSignLayout](NavDrivingSignLayoutCompactWidth, "sharedDrivingCompactWidthSignLayout");
}

+ (id)minimizedLayoutDelegateForDriving
{
  return +[NavDrivingSignLayoutMinimized sharedDrivingMinimizedSignLayout](NavDrivingSignLayoutMinimized, "sharedDrivingMinimizedSignLayout");
}

+ (id)minimizedLayoutDelegateForDrivingAndJunctionView
{
  return +[NavDrivingSignLayoutMinimizedWithJunctionView sharedDrivingMinimizedWithJunctionViewSignLayout](NavDrivingSignLayoutMinimizedWithJunctionView, "sharedDrivingMinimizedWithJunctionViewSignLayout");
}

+ (id)compactWidthLayoutDelegateForDrivingAndJunctionView
{
  return +[NavDrivingSignLayoutCompactWithJunctionView sharedDrivingCompactWithJunctionViewSignLayout](NavDrivingSignLayoutCompactWithJunctionView, "sharedDrivingCompactWithJunctionViewSignLayout");
}

+ (id)secondarySignLayoutDelegateForDriving
{
  return +[NavDrivingSignLayoutSecondary sharedDrivingSecondarySignLayout](NavDrivingSignLayoutSecondary, "sharedDrivingSecondarySignLayout");
}

+ (id)compactWidthSecondarySignLayoutDelegateForDriving
{
  return +[NavDrivingSignLayoutSecondaryCompactWidth sharedDrivingSecondaryCompactWidthSignLayout](NavDrivingSignLayoutSecondaryCompactWidth, "sharedDrivingSecondaryCompactWidthSignLayout");
}

+ (id)defaultLayoutDelegateForWalking
{
  return +[NavPedestrianSignLayout sharedPedestrianSignLayout](NavPedestrianSignLayout, "sharedPedestrianSignLayout");
}

+ (id)compactWidthLayoutDelegateForWalking
{
  return +[NavPedestrianSignLayoutCompactWidth sharedPedestrianSignCompactWidthLayout](NavPedestrianSignLayoutCompactWidth, "sharedPedestrianSignCompactWidthLayout");
}

+ (id)defaultLayoutDelegateForStepping
{
  return +[NavSteppingSignLayout sharedSteppingSignLayout](NavSteppingSignLayout, "sharedSteppingSignLayout");
}

@end
