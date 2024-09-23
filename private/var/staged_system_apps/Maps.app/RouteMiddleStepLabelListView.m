@implementation RouteMiddleStepLabelListView

+ (id)voiceOverStringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  return _objc_msgSend(a1, "stringsForRoute:step:tableMode:isPrinting:forAccessibility:", a3, a4, a5, 0, 1);
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  return objc_msgSend(a1, "stringsForRoute:step:tableMode:isPrinting:", a3, a4, a5, 0);
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6
{
  return _objc_msgSend(a1, "stringsForRoute:step:tableMode:isPrinting:forAccessibility:", a3, a4, a5, a6, 0);
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6 forAccessibility:(BOOL)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  DirectionsWaypoint *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  char *v31;
  char *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  unsigned int v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSString *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v64;
  void *v65;
  void *v66;
  __CFString *v67;
  id v68;
  void *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  BOOL v74;
  void *v75;
  void *v76;
  _QWORD v77[2];

  v8 = a6;
  v12 = a3;
  v13 = a4;
  if (objc_msgSend(v12, "transportType") != 1)
  {
    v74 = a5;
    v15 = sub_100BCA378(v13, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v12, "legIndexForStepIndex:", objc_msgSend(v13, "stepIndex"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "legs"));
    if (v17 >= objc_msgSend(v18, "count"))
    {
      v20 = 0;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "legs"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v17));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "destination"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "chargingInfo"));

    if (v16 && !v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "destinationListInstructionString"));
      if (!objc_msgSend(v23, "length"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Arrive [Directions Step]"), CFSTR("localized string not found"), 0));

        v23 = (void *)v25;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "singleLineAddress"));
      v27 = objc_msgSend(v26, "length");

      if (v27)
      {
        v77[0] = v23;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "singleLineAddress"));
        v77[1] = v28;
        v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 2));

      }
      else
      {
        v76 = v23;
        v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));
      }

LABEL_59:
      goto LABEL_60;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentsForContext:", objc_msgSend(a1, "_instructionsContext")));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringForDistance:", -1.0));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "notice"));
    v30 = objc_msgSend(v75, "length");
    v70 = v29;
    if (v8 && (v31 = (char *)objc_msgSend(v13, "stepIndex"), (unint64_t)v31 >= 2))
    {
      v32 = v31;
      v33 = v30;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "steps"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", v32 - 1));

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "geoStep"));
      v37 = objc_msgSend(v36, "expectedTime");

      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", v37, 1));
        v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (%@)"), v38));

      }
      else
      {
        v71 = &stru_1011EB268;
      }

      v30 = v33;
    }
    else
    {
      v71 = &stru_1011EB268;
    }
    v39 = objc_msgSend(v13, "transportType");
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chargingStationInfo"));
    v69 = v20;
    if ((objc_msgSend(v13, "isStartOrResumeStep") & 1) != 0)
    {
      v41 = 0;
      v72 = 0;
LABEL_23:
      v42 = v70;
LABEL_35:
      v54 = 1;
      if (v41)
        v54 = 2;
      if (v30)
        v55 = v54 + 1;
      else
        v55 = v54;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v55));
      if (v41)
      {
        if (v8)
        {
          v57 = objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.254901961, 0.435294118, 0.658823529, 1.0);
          objc_msgSend(v56, "addObject:", v57);

        }
        objc_msgSend(v56, "addObject:", v41);
      }
      if (v8)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
        objc_msgSend(v56, "addObject:", v58);

      }
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "instruction"));
      if (objc_msgSend(v13, "transportType") == 4 && !v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("Navigation_DirectionsForUnknownTransport"), CFSTR("localized string not found"), 0));

      }
      if (v59)
      {
        v61 = 0;
        if (v41 && !v74)
          v61 = objc_msgSend(v56, "count");
        objc_msgSend(v56, "insertObject:atIndex:", v59, v61);
      }
      if (v30)
        objc_msgSend(v56, "addObject:", v75);
      if (v40)
      {
        objc_msgSend(v40, "batteryPercentageAfterCharging");
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedRouteEVChargingStationInfo chargeToStringForChargePercentage:](GEOComposedRouteEVChargingStationInfo, "chargeToStringForChargePercentage:"));
        objc_msgSend(v56, "addObject:", v62);

      }
      v14 = objc_msgSend(v56, "copy");

      v20 = v69;
      goto LABEL_59;
    }
    if (a7)
      v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessibilityDistance"));
    else
      v43 = v73;
    v72 = v43;
    if (v40)
    {
      v68 = v30;
      objc_msgSend(v40, "chargingTime");
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", v44, 1));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v47 = v46;
      if (v45)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Directions_Driving_EV"), CFSTR("localized string not found"), 0));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "name"));
        v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, v45, v49);
      }
      else
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Directions_Driving_EV_no_charge_time"), CFSTR("localized string not found"), 0));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "name"));
        v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, v49, v67);
      }
      v41 = (id)objc_claimAutoreleasedReturnValue(v50);

      v42 = v70;
      v30 = v68;
      goto LABEL_35;
    }
    if (v39 == 2)
    {
      if (v8)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v52 = v51;
        v53 = CFSTR("Directions_Walking_DistanceTime");
LABEL_64:
        v64 = v30;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", v53, CFSTR("localized string not found"), 0));
        v67 = v71;
LABEL_69:
        v41 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v65, v72, v67));

        v30 = v64;
        goto LABEL_23;
      }
      v42 = v70;
      if (a7 || !objc_msgSend(v70, "hasServerContent"))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v64 = v30;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("Walk %@ then"), CFSTR("localized string not found"), 0));
        goto LABEL_69;
      }
    }
    else
    {
      v42 = v70;
      if (v8)
      {
        if (!objc_msgSend(v13, "stepIndex"))
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "origin"));
          v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "directionsListAddress"));

          goto LABEL_35;
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v52 = v51;
        v53 = CFSTR("Directions_Driving_DistanceTime");
        goto LABEL_64;
      }
    }
    v41 = v72;
    v72 = v41;
    goto LABEL_35;
  }
  v14 = &__NSArray0__struct;
LABEL_60:

  return v14;
}

+ (int64_t)_instructionsContext
{
  return 2;
}

@end
