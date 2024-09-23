@implementation UIScreen

- (double)_car_physicalPixelSize
{
  id AssociatedObject;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cgFloatValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
    if (-[UIScreen _car_hasScreenInfo](self, "_car_hasScreenInfo"))
    {
      -[UIScreen _car_physicalSize](self, "_car_physicalSize");
      v10 = v9;
      -[UIScreen _car_pixelSize](self, "_car_pixelSize");
      v8 = v10 / v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
      objc_setAssociatedObject(self, a2, v12, (void *)1);

    }
  }

  return v8;
}

- (double)_car_physicalPointSize
{
  double v3;
  double v4;
  double v5;

  -[UIScreen nativeScale](self, "nativeScale");
  v4 = v3;
  -[UIScreen _car_physicalPixelSize](self, "_car_physicalPixelSize");
  return v4 * v5;
}

- (double)_car_dynamicPixelScaleValue
{
  id AssociatedObject;
  void *v5;
  void *v6;
  double v7;
  double Double;
  double v9;
  double v10;
  double v11;
  void *v12;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cgFloatValue");
    Double = v7;
  }
  else
  {
    Double = 1.0;
    if (-[UIScreen _car_hasScreenInfo](self, "_car_hasScreenInfo")
      && GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterDynamicScalingEnabled, off_1014B5388))
    {
      if (_GEOConfigHasValue(MapsConfig_HybridInstrumentClusterDynamicPixelScaleValueOverride, off_1014B5418))
      {
        Double = GEOConfigGetDouble(MapsConfig_HybridInstrumentClusterDynamicPixelScaleValueOverride, off_1014B5418);
      }
      else
      {
        -[UIScreen _car_physicalPixelSize](self, "_car_physicalPixelSize");
        v10 = v9;
        if (fabs(v9) <= 2.22044605e-16)
          goto LABEL_10;
        -[UIScreen _car_baselinePixelSize](self, "_car_baselinePixelSize");
        Double = v11 / v10;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
      objc_setAssociatedObject(self, a2, v12, (void *)1);

    }
  }
LABEL_10:

  return Double;
}

- (double)_car_dynamicPointScaleValue
{
  id AssociatedObject;
  void *v5;
  void *v6;
  double v7;
  double Double;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cgFloatValue");
    Double = v7;
  }
  else
  {
    Double = 1.0;
    if (-[UIScreen _car_hasScreenInfo](self, "_car_hasScreenInfo")
      && GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterDynamicScalingEnabled, off_1014B5388))
    {
      if (_GEOConfigHasValue(MapsConfig_HybridInstrumentClusterDynamicPointScaleValueOverride, off_1014B5408))
      {
        Double = GEOConfigGetDouble(MapsConfig_HybridInstrumentClusterDynamicPointScaleValueOverride, off_1014B5408);
      }
      else
      {
        -[UIScreen _car_physicalPixelSize](self, "_car_physicalPixelSize");
        v10 = v9;
        if (fabs(v9) <= 2.22044605e-16)
          goto LABEL_10;
        -[UIScreen _car_baselinePixelSize](self, "_car_baselinePixelSize");
        v12 = v11;
        -[UIScreen _car_baselineManeuverPixelHeight](self, "_car_baselineManeuverPixelHeight");
        v14 = v12 * v13;
        -[UIScreen _car_baselineManeuverPointHeight](self, "_car_baselineManeuverPointHeight");
        v16 = v15;
        -[UIScreen nativeScale](self, "nativeScale");
        Double = v14 / (v10 * (v16 * v17));
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
      objc_setAssociatedObject(self, a2, v18, (void *)1);

    }
  }
LABEL_10:

  return Double;
}

- (CARScreenInfo)_car_screenInfo
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double Double;
  double v9;
  double v10;
  void *v11;
  _QWORD v13[10];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedCarScreenInfos"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100602B8C;
  v13[3] = &unk_1011BDE90;
  v13[4] = self;
  v5 = sub_10039E1FC(v4, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6
    && -[UIScreen _isCarInstrumentsScreen](self, "_isCarInstrumentsScreen")
    && -[UIScreen _car_hasDebugPhysicalSizeOverride](self, "_car_hasDebugPhysicalSizeOverride"))
  {
    objc_msgSend(v6, "physicalSize");
    Double = v7;
    v10 = v9;
    if (_GEOConfigHasValue(MapsConfig_CarPlayHybridInstrumentClusterScreenPhysicalSizeDebugWidthOverride, off_1014B5368))Double = GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterScreenPhysicalSizeDebugWidthOverride, off_1014B5368);
    if (_GEOConfigHasValue(MapsConfig_CarPlayHybridInstrumentClusterScreenPhysicalSizeDebugHeightOverride, off_1014B5378))v10 = GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterScreenPhysicalSizeDebugHeightOverride, off_1014B5378);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", Double, v10));
    objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("_physicalSize"));

  }
  return (CARScreenInfo *)v6;
}

- (CGSize)_car_pixelSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen _car_screenInfo](self, "_car_screenInfo"));
  objc_msgSend(v2, "pixelSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_car_physicalSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen _car_screenInfo](self, "_car_screenInfo"));
  objc_msgSend(v2, "physicalSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_car_hasScreenInfo
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen _car_screenInfo](self, "_car_screenInfo"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_car_hasDebugPhysicalSizeOverride
{
  if ((_GEOConfigHasValue(MapsConfig_CarPlayHybridInstrumentClusterScreenPhysicalSizeDebugWidthOverride, off_1014B5368) & 1) != 0)
    return 1;
  else
    return _GEOConfigHasValue(MapsConfig_CarPlayHybridInstrumentClusterScreenPhysicalSizeDebugHeightOverride, off_1014B5378);
}

- (double)_car_baselinePixelSize
{
  double Double;

  Double = GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineScreenPhysicalHeight, off_1014B5328);
  return Double
       / GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineScreenPixelHeight, off_1014B5308);
}

- (double)_car_baselineManeuverPixelWidth
{
  return GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineManeuverPixelWidth, off_1014B5338);
}

- (double)_car_baselineManeuverPixelHeight
{
  return GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineManeuverPixelHeight, off_1014B5348);
}

- (double)_car_baselineETATrayPixelHeight
{
  return GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineETATrayPixelHeight, off_1014B5358);
}

- (double)_car_baselineManeuverPointWidth
{
  double Double;

  Double = GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineManeuverPixelWidth, off_1014B5338);
  return Double
       / GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineContentScale, off_1014B52E8);
}

- (double)_car_baselineManeuverPointHeight
{
  double Double;

  Double = GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineManeuverPixelHeight, off_1014B5348);
  return Double
       / GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineContentScale, off_1014B52E8);
}

- (double)_car_baselineETATrayPointHeight
{
  double Double;

  Double = GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineETATrayPixelHeight, off_1014B5358);
  return Double
       / GEOConfigGetDouble(MapsConfig_CarPlayHybridInstrumentClusterDynamicScaleBaselineContentScale, off_1014B52E8);
}

- (double)_car_baselineScaledManeuverPixelWidth
{
  double v3;
  double v4;
  double v5;

  -[UIScreen _car_baselineManeuverPixelWidth](self, "_car_baselineManeuverPixelWidth");
  v4 = v3;
  -[UIScreen _car_dynamicPixelScaleValue](self, "_car_dynamicPixelScaleValue");
  return v4 * v5;
}

- (double)_car_baselineScaledManeuverPixelHeight
{
  double v3;
  double v4;
  double v5;

  -[UIScreen _car_baselineManeuverPixelHeight](self, "_car_baselineManeuverPixelHeight");
  v4 = v3;
  -[UIScreen _car_dynamicPixelScaleValue](self, "_car_dynamicPixelScaleValue");
  return v4 * v5;
}

- (double)_car_baselineScaledETATrayPixelHeight
{
  double v3;
  double v4;
  double v5;

  -[UIScreen _car_baselineETATrayPixelHeight](self, "_car_baselineETATrayPixelHeight");
  v4 = v3;
  -[UIScreen _car_dynamicPixelScaleValue](self, "_car_dynamicPixelScaleValue");
  return v4 * v5;
}

- (id)_car_debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGSize v24;
  CGSize v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), objc_opt_class(self), self);
  -[UIScreen _car_physicalPixelSize](self, "_car_physicalPixelSize");
  objc_msgSend(v3, "appendFormat:", CFSTR("physicalPixelSize:%f\n"), v4);
  -[UIScreen _car_physicalPointSize](self, "_car_physicalPointSize");
  objc_msgSend(v3, "appendFormat:", CFSTR("physicalPointSize:%f\n"), v5);
  -[UIScreen _car_dynamicPixelScaleValue](self, "_car_dynamicPixelScaleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("dynamicPixelScaleValue:%f\n"), v6);
  -[UIScreen _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("dynamicPointScaleValue:%f\n"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen _car_screenInfo](self, "_car_screenInfo"));
  objc_msgSend(v3, "appendFormat:", CFSTR("screenInfo:%@\n"), v8);

  -[UIScreen _car_physicalSize](self, "_car_physicalSize");
  v9 = NSStringFromCGSize(v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("physicalSize:%@\n"), v10);

  -[UIScreen _car_pixelSize](self, "_car_pixelSize");
  v11 = NSStringFromCGSize(v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "appendFormat:", CFSTR("pixelSize:%@\n"), v12);

  -[UIScreen _car_baselinePixelSize](self, "_car_baselinePixelSize");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselinePixelSize:%f\n"), v13);
  -[UIScreen _car_baselineManeuverPixelWidth](self, "_car_baselineManeuverPixelWidth");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineManeuverPixelWidth:%f\n"), v14);
  -[UIScreen _car_baselineManeuverPixelHeight](self, "_car_baselineManeuverPixelHeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineManeuverPixelHeight:%f\n"), v15);
  -[UIScreen _car_baselineETATrayPixelHeight](self, "_car_baselineETATrayPixelHeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineETATrayPixelHeight:%f\n"), v16);
  -[UIScreen _car_baselineManeuverPointWidth](self, "_car_baselineManeuverPointWidth");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineManeuverPointWidth:%f\n"), v17);
  -[UIScreen _car_baselineManeuverPointHeight](self, "_car_baselineManeuverPointHeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineManeuverPointHeight:%f\n"), v18);
  -[UIScreen _car_baselineETATrayPointHeight](self, "_car_baselineETATrayPointHeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineETATrayPointHeight:%f\n"), v19);
  -[UIScreen _car_baselineScaledManeuverPixelWidth](self, "_car_baselineScaledManeuverPixelWidth");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineScaledManeuverPixelWidth:%f\n"), v20);
  -[UIScreen _car_baselineScaledManeuverPixelHeight](self, "_car_baselineScaledManeuverPixelHeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineScaledManeuverPixelHeight:%f\n"), v21);
  -[UIScreen _car_baselineScaledETATrayPixelHeight](self, "_car_baselineScaledETATrayPixelHeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("baselineScaledETATrayPixelHeight:%f\n"), v22);
  return v3;
}

@end
