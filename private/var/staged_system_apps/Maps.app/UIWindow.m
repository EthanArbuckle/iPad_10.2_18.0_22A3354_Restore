@implementation UIWindow

- (void)_maps_registerEventTap:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIWindow conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___EventSourceHandler))
    -[UIWindow registerEventTap:](self, "registerEventTap:", v4);

}

- (BOOL)_car_isHybridInstrumentCluster
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow windowScene](self, "windowScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  v4 = objc_opt_class(CarSceneDelegate);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(v6, "sceneType") == (id)7;
  else
    v7 = 0;

  return v7;
}

- (int64_t)_car_hybridInstrumentClusterAlignment
{
  UIWindow *v4;
  uint64_t v5;
  UIWindow *v6;
  UIWindow *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  if (_GEOConfigHasValue(MapsConfig_CarPlayHybridInstrumentClusterAlignmentOverride, off_1014B5288))
    return GEOConfigGetInteger(MapsConfig_CarPlayHybridInstrumentClusterAlignmentOverride, off_1014B5288);
  if (!GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterCardAlignmentEnabled, off_1014B53A8)
    || !-[UIWindow _car_hybridInstrumentClusterAlignmentStyle](self, "_car_hybridInstrumentClusterAlignmentStyle"))
  {
    return 0;
  }
  v4 = self;
  v5 = objc_opt_class(CarInstrumentClusterWindow);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow currentSceneSettings](v7, "currentSceneSettings")),
        v9 = objc_msgSend(v8, "layoutJustification"),
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow currentSceneSettings](v7, "currentSceneSettings"));
    v11 = objc_msgSend(v10, "layoutJustification");
    if (v11 == (id)2)
      v12 = 1;
    else
      v12 = 2 * (v11 == (id)3);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](v4, "screen"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_car_screenInfo"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v15 = objc_msgSend(v14, "rightHandDrive");

    v16 = objc_msgSend(objc_alloc((Class)CPSInstrumentClusterCardLayout), "initWithCarScreenInfo:isRightHandDrive:", v10, v15);
    v17 = objc_msgSend(v16, "layoutForCard");
    if (v17 == (id)3)
      v12 = 2;
    else
      v12 = v17 == (id)2;

  }
  return v12;
}

- (int64_t)_car_hybridInstrumentClusterAlignmentStyle
{
  UIWindow *v4;
  uint64_t v5;
  UIWindow *v6;
  UIWindow *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  if (_GEOConfigHasValue(MapsConfig_HybridInstrumentClusterAlignmentStyleOverride, off_1014B53D8))
    return GEOConfigGetInteger(MapsConfig_HybridInstrumentClusterAlignmentStyleOverride, off_1014B53D8);
  v4 = self;
  v5 = objc_opt_class(CarInstrumentClusterWindow);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow currentSceneSettings](v7, "currentSceneSettings")),
        v9 = objc_msgSend(v8, "layoutJustification"),
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow currentSceneSettings](v7, "currentSceneSettings"));
    v11 = objc_msgSend(v10, "layoutJustification") != (id)1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow safeAreaLayoutGuide](v4, "safeAreaLayoutGuide"));
    objc_msgSend(v12, "layoutFrame");
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](v4, "screen"));
    objc_msgSend(v15, "scale");
    v17 = v14 * v16;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](v4, "screen"));
    objc_msgSend(v10, "_car_baselineScaledManeuverPixelWidth");
    v11 = v17 >= v18
               * GEOConfigGetDouble(MapsConfig_HybridInstrumentClusterAlignmentStyleManeuverScaledWidthMultiple, off_1014B53E8);
  }

  return v11;
}

- (int64_t)_car_hybridInstrumentClusterLayout
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double Double;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  if (_GEOConfigHasValue(MapsConfig_HybridInstrumentClusterFlexibleUILayoutOverride, off_1014B53B8))
    return GEOConfigGetInteger(MapsConfig_HybridInstrumentClusterFlexibleUILayoutOverride, off_1014B53B8);
  if ((id)-[UIWindow _car_hybridInstrumentClusterAlignmentStyle](self, "_car_hybridInstrumentClusterAlignmentStyle") == (id)1
    || !GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterFlexibleUIEnabled, off_1014B5398))
  {
    return 2;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](self, "screen"));
  objc_msgSend(v7, "scale");
  v9 = v6 * v8;

  Double = GEOConfigGetDouble(MapsConfig_HybridInstrumentClusterFlexibleUIETATrayVisibilityRequirementRatio, off_1014B53C8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](self, "screen"));
  objc_msgSend(v11, "_car_baselineScaledManeuverPixelHeight");
  v13 = v12;

  if (v13 > v9 * Double)
    return 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](self, "screen"));
  objc_msgSend(v14, "_car_baselineScaledManeuverPixelHeight");
  v16 = v9 - v15 / Double;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](self, "screen"));
  objc_msgSend(v17, "_car_baselineScaledETATrayPixelHeight");
  v19 = v18;

  if (v16 < v19)
    return 1;
  else
    return 2;
}

- (BOOL)_car_shouldHorizontallyCenterMapInsets
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double MidX;
  void *v13;
  double v14;
  double v15;
  double Double;
  void *v17;
  double v18;
  BOOL v19;
  CGRect v21;
  CGRect v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  objc_msgSend(v3, "layoutFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  MidX = CGRectGetMidX(v21);
  -[UIWindow frame](self, "frame");
  if (vabdd_f64(MidX, CGRectGetMidX(v22)) > 2.22044605e-16
    || !-[UIWindow _car_hybridInstrumentClusterAlignment](self, "_car_hybridInstrumentClusterAlignment"))
  {
    return 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](self, "screen"));
  objc_msgSend(v13, "scale");
  v15 = v9 * v14;

  Double = GEOConfigGetDouble(MapsConfig_HybridInstrumentClusterFlexibleMapInsetCenteringScaledManeuverWidthMultipleRequirement, off_1014B5458);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](self, "screen"));
  objc_msgSend(v17, "_car_baselineScaledManeuverPixelWidth");
  v19 = v15 >= Double * v18;

  return v19;
}

- (id)_car_debugDescription
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  int64_t v6;
  const __CFString *v7;
  int64_t v8;
  const __CFString *v9;
  int64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), objc_opt_class(self), self);
  if (-[UIWindow _car_isHybridInstrumentCluster](self, "_car_isHybridInstrumentCluster"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isHybridInstrumentCluster:%@\n"), v4);
  if (-[UIWindow _car_shouldHorizontallyCenterMapInsets](self, "_car_shouldHorizontallyCenterMapInsets"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("shouldHorizontallyCenterMapInsets:%@\n"), v5);
  v6 = -[UIWindow _car_hybridInstrumentClusterAlignment](self, "_car_hybridInstrumentClusterAlignment");
  v7 = CFSTR("Center");
  if (v6 == 1)
    v7 = CFSTR("Left");
  if (v6 == 2)
    v7 = CFSTR("Right");
  objc_msgSend(v3, "appendFormat:", CFSTR("hybridInstrumentClusterAlignment:%@\n"), v7);
  v8 = -[UIWindow _car_hybridInstrumentClusterAlignmentStyle](self, "_car_hybridInstrumentClusterAlignmentStyle");
  v9 = CFSTR("Wide");
  if (!v8)
    v9 = CFSTR("Narrow");
  objc_msgSend(v3, "appendFormat:", CFSTR("hybridInstrumentClusterAlignmentStyle:%@\n"), v9);
  v10 = -[UIWindow _car_hybridInstrumentClusterLayout](self, "_car_hybridInstrumentClusterLayout");
  v11 = CFSTR("Maneuver");
  if (v10 == 1)
    v11 = CFSTR("ManeuverMap");
  if (v10 == 2)
    v11 = CFSTR("ManeuverMapOther");
  objc_msgSend(v3, "appendFormat:", CFSTR("hybridInstrumentClusterLayout:%@\n"), v11);
  v12 = objc_opt_class(CarInstrumentClusterWindow);
  if ((objc_opt_isKindOfClass(self, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow currentSceneSettings](self, "currentSceneSettings"));
    objc_msgSend(v3, "appendFormat:", CFSTR("currentSceneSettings:%@\n"), v13);

  }
  return v3;
}

@end
