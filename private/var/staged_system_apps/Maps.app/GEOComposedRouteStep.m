@implementation GEOComposedRouteStep

- (BOOL)isEVChargerStep
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep chargingStationInfo](self, "chargingStationInfo"));
  v3 = v2 != 0;

  return v3;
}

- (id)chargingStationInfo
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self, "composedRoute"));
  v4 = objc_msgSend(v3, "legIndexForStepIndex:", -[GEOComposedRouteStep stepIndex](self, "stepIndex"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self, "composedRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legs"));
  v7 = objc_msgSend(v6, "count");

  if (v4 >= v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self, "composedRoute"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "legs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v4));

    v11 = -[GEOComposedRouteStep stepIndex](self, "stepIndex");
    if (v11 == objc_msgSend(v10, "endStepIndex"))
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chargingStationInfo"));
    else
      v12 = 0;

  }
  return v12;
}

- (id)attributedChargeStringForWaypointType:(unint64_t)a3 font:(id)a4 textColor:(id)a5 includeDaysAgo:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSTextAttachment *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSAttributedStringKey v38;
  id v39;
  NSAttributedStringKey v40;
  id v41;

  v9 = a4;
  v10 = a5;
  if (qword_1014D2668 != -1)
    dispatch_once(&qword_1014D2668, &stru_1011B8AF8);
  if (a3 - 1 < 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    v13 = CFSTR("[EV] Battery at arrival");
LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep evInfo](self, "evInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, objc_msgSend(v15, "remainingBatteryPercentage")));

    goto LABEL_9;
  }
  if (!a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    v13 = CFSTR("[EV] Battery at start");
    goto LABEL_7;
  }
  v16 = 0;
LABEL_9:
  v17 = objc_opt_new(NSTextAttachment);
  objc_msgSend(v9, "pointSize");
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep evInfo](self, "evInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage chargeImageOfSize:batteryLevel:](UIImage, "chargeImageOfSize:batteryLevel:", objc_msgSend(v20, "remainingBatteryPercentage"), v19));

  -[NSTextAttachment setImage:](v17, "setImage:", v21);
  objc_msgSend(v9, "capHeight");
  v23 = v22;
  objc_msgSend(v21, "size");
  v25 = (v23 - v24) * 0.5;
  objc_msgSend(v21, "size");
  v27 = v26;
  objc_msgSend(v21, "size");
  -[NSTextAttachment setBounds:](v17, "setBounds:", 0.0, v25, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v17));
  v30 = objc_msgSend(v29, "mutableCopy");

  v31 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
  objc_msgSend(v30, "appendAttributedString:", v31);

  v32 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v16);
  objc_msgSend(v30, "appendAttributedString:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "string"));
  v34 = objc_msgSend(v33, "length");

  v40 = NSFontAttributeName;
  v41 = v9;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  objc_msgSend(v30, "addAttributes:range:", v35, 0, v34);

  if (v10)
  {
    v38 = NSForegroundColorAttributeName;
    v39 = v10;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    objc_msgSend(v30, "addAttributes:range:", v36, 0, v34);

  }
  return v30;
}

- (GEOComposedWaypoint)waypoint
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self, "composedRoute"));
  v4 = objc_msgSend(v3, "legIndexForStepIndex:", -[GEOComposedRouteStep stepIndex](self, "stepIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "legs"));
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "legs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v4));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destination"));
  }

  return (GEOComposedWaypoint *)v9;
}

- (id)transitInstructionInContext:(int64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](self, "transitStep"));

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", self, a3));
  else
    v6 = 0;
  return v6;
}

- (NSString)notice
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep geoStep](self, "geoStep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "notice"));

  return (NSString *)v3;
}

- (NSString)distanceString
{
  double v3;
  double v4;
  void *v5;

  -[GEOComposedRouteStep distance](self, "distance");
  if (v3 == 0.0)
  {
    v5 = 0;
  }
  else
  {
    -[GEOComposedRouteStep distance](self, "distance");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _mapkit_localizedDistanceStringWithMeters:abbreviated:](NSString, "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v4, 0));
  }
  return (NSString *)v5;
}

- (NSString)accessibilityDistance
{
  double v2;

  -[GEOComposedRouteStep distance](self, "distance");
  return (NSString *)+[NSString _mapkit_voiceOverLocalizedDistanceStringWithMeters:](NSString, "_mapkit_voiceOverLocalizedDistanceStringWithMeters:", v2);
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectAroundStartCoordinate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $C79183323B9A0D5602617FF3BE5395AC result;

  -[GEOComposedRouteStep distance](self, "distance");
  v4 = v3 * 0.5;
  -[GEOComposedRouteStep startCoordinate](self, "startCoordinate");
  v7 = MKMapRectMakeWithRadialDistance(v5, v6, fmin(fmax(v4, 250.0), 500.0));
  result.var1.var1 = v10;
  result.var1.var0 = v9;
  result.var0.var1 = v8;
  result.var0.var0 = v7;
  return result;
}

- (id)representativeSignGuidanceEvent
{
  id AssociatedObject;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep geoStep](self, "geoStep"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guidanceEvents"));
    v8 = sub_1007EAE9C(v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (!v5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_setAssociatedObject(self, a2, v5, (void *)1);
      v11 = 0;
      goto LABEL_8;
    }
    objc_setAssociatedObject(self, a2, v5, (void *)1);
  }
  v9 = objc_opt_class(GEOGuidanceEvent);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    v10 = v5;
  else
    v10 = 0;
  v11 = v10;
LABEL_8:

  return v11;
}

@end
