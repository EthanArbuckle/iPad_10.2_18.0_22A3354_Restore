@implementation RoutePlanningVehicleRefinementModel

- (RoutePlanningVehicleRefinementModel)initWithDelegate:(id)a3 value:(id)a4
{
  RoutePlanningVehicleRefinementModel *v4;
  RoutePlanningVehicleRefinementModel *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningVehicleRefinementModel;
  v4 = -[RoutePlanningRefinementModel initWithDelegate:value:](&v10, "initWithDelegate:value:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleRefinementModel virtualGarage](v4, "virtualGarage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedVehicle"));
    -[RoutePlanningVehicleRefinementModel setSelectedVehicle:](v5, "setSelectedVehicle:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, "offlineMapsStateChanged", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  }
  return v5;
}

- (id)titleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[RoutePlanningVehicleRefinementModel _shouldDefaultToNoSelection](self, "_shouldDefaultToNoSelection"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleRefinementModel _titleForDifferentCar](self, "_titleForDifferentCar"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleRefinementModel selectedVehicle](self, "selectedVehicle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "combinedDisplayName"));
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleRefinementModel _titleForDifferentCar](self, "_titleForDifferentCar"));
    v3 = v7;

  }
  return v3;
}

- (id)_titleForDifferentCar
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Transport Type Picker] Different Car"), CFSTR("localized string not found"), 0));

  return v3;
}

- (BOOL)shouldShowHighlighted
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleRefinementModel selectedVehicle](self, "selectedVehicle"));
  if (v3)
    v4 = !-[RoutePlanningVehicleRefinementModel _shouldDefaultToNoSelection](self, "_shouldDefaultToNoSelection");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (BOOL)_shouldDefaultToNoSelection
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v3 = objc_msgSend(v2, "isUsingOfflineMaps");

  return v3;
}

- (void)_assertValidValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  char *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;

  v3 = objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
    v6 = objc_opt_class(VGVirtualGarage);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) == 0)
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
        v11 = (objc_class *)objc_opt_class(v10);
        v12 = NSStringFromClass(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrong type: %@"), v13));
        *(_DWORD *)buf = 136316162;
        v19 = "-[RoutePlanningVehicleRefinementModel _assertValidValue]";
        v20 = 2080;
        v21 = "RoutePlanningVehicleRefinementModel.m";
        v22 = 1024;
        v23 = 88;
        v24 = 2080;
        v25 = "!self.value || [self.value isKindOfClass:VGVirtualGarage.class]";
        v26 = 2112;
        v27 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v15 = sub_1004318FC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
}

- (id)virtualGarage
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_opt_class(VGVirtualGarage);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setSelectedVehicle:(id)a3
{
  id v5;
  VGVehicle *selectedVehicle;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  VGVehicle *v13;
  void *v14;
  int v15;
  VGVehicle *v16;
  __int16 v17;
  unint64_t v18;

  v5 = a3;
  selectedVehicle = self->_selectedVehicle;
  v7 = (unint64_t)v5;
  v8 = selectedVehicle;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      v11 = sub_10043214C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = self->_selectedVehicle;
        v15 = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[Options] updating selected vehicle from: %@ to: %@", (uint8_t *)&v15, 0x16u);
      }

      objc_storeStrong((id *)&self->_selectedVehicle, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel delegate](self, "delegate"));
      objc_msgSend(v14, "updatedRefinementModel:", self);

    }
  }

}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  UIMenu *cachedMenu;
  int v14;
  id v15;

  v4 = a3;
  v5 = objc_opt_class(VGVirtualGarage);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleRefinementModel virtualGarage](self, "virtualGarage"));
  v9 = objc_msgSend((id)objc_opt_class(self), "_isGarage:significantlyDifferentFromGarage:", v8, v7);
  v10 = sub_10043214C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if ((v9 & 1) != 0)
  {
    if (v12)
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Options] Using updated garage: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_storeStrong(&self->super._value, v6);
    cachedMenu = self->_cachedMenu;
    self->_cachedMenu = 0;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedVehicle"));
    -[RoutePlanningVehicleRefinementModel setSelectedVehicle:](self, "setSelectedVehicle:", v11);
  }
  else if (v12)
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Options] Garage has not changed; will not update menu",
      (uint8_t *)&v14,
      2u);
  }

}

- (id)menuProvider
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100AC113C;
  v5[3] = &unk_1011BECE8;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (int)menuPressUsageAction
{
  return 309;
}

- (id)_attributedTitleForVehicle:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  NSAttributedStringKey v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableAttributedString);
  if (v4)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "combinedDisplayName"));
  else
    v6 = objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleRefinementModel _titleForDifferentCar](self, "_titleForDifferentCar"));
  v7 = (void *)v6;
  v8 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v6);
  objc_msgSend(v5, "appendAttributedString:", v8);

  +[UIFont systemFontSize](UIFont, "systemFontSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v11 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setLineSpacing:", 0.0);
  objc_msgSend(v11, "setParagraphSpacing:", 0.0);
  objc_msgSend(v11, "setParagraphSpacingBefore:", 0.0);
  v36[0] = NSFontAttributeName;
  v36[1] = NSParagraphStyleAttributeName;
  v37[0] = v9;
  v37[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));

  if (v4)
  {
    if (-[RoutePlanningVehicleRefinementModel _shouldDefaultToNoSelection](self, "_shouldDefaultToNoSelection"))
    {
      v14 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
      objc_msgSend(v5, "appendAttributedString:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Transport Type Picker] Not Available Offline"), CFSTR("localized string not found"), 0));

      v17 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v16, v13);
      objc_msgSend(v5, "appendAttributedString:", v17);

      v34 = NSForegroundColorAttributeName;
      v18 = (id)objc_claimAutoreleasedReturnValue(+[UIColor placeholderTextColor](UIColor, "placeholderTextColor"));
      v35 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
      objc_msgSend(v5, "addAttributes:range:", v19, 0, objc_msgSend(v5, "length"));
LABEL_12:

      goto LABEL_13;
    }
    if (objc_msgSend(v4, "isPureElectricVehicle"))
    {
      v20 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
      objc_msgSend(v5, "appendAttributedString:", v20);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BatteryIconView batteryIconWithLevel:](BatteryIconView, "batteryIconWithLevel:", objc_msgSend(v4, "displayedBatteryPercentage")));
      v18 = objc_alloc_init((Class)NSTextAttachment);
      objc_msgSend(v18, "setImage:", v16);
      objc_msgSend(v16, "size");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v9, "capHeight");
      v26 = (v25 - v24) * 0.5;
      v27 = 0.0;
      if (v9)
        v27 = v26;
      objc_msgSend(v18, "setBounds:", 0.0, v27, v22, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v18));
      objc_msgSend(v5, "appendAttributedString:", v28);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleRefinementModel _subtitleForVehicle:](self, "_subtitleForVehicle:", v4));
      if (objc_msgSend(v19, "length"))
      {
        v29 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
        objc_msgSend(v5, "appendAttributedString:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[VehicleBatteryView colorForBatteryLevel:](VehicleBatteryView, "colorForBatteryLevel:", objc_msgSend(v4, "displayedBatteryPercentage")));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, NSForegroundColorAttributeName);

        v31 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v19, v13);
        objc_msgSend(v5, "appendAttributedString:", v31);

      }
      goto LABEL_12;
    }
  }
LABEL_13:
  v32 = objc_msgSend(v5, "copy");

  return v32;
}

- (id)_subtitleForVehicle:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  char BOOL;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  char *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  char *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;

  v3 = a3;
  if (!v3)
  {
    v24 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[RoutePlanningVehicleRefinementModel _subtitleForVehicle:]";
      v36 = 2080;
      v37 = "RoutePlanningVehicleRefinementModel.m";
      v38 = 1024;
      v39 = 248;
      v40 = 2080;
      v41 = "vehicle != nil";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if ((objc_msgSend(v3, "isPureElectricVehicle") & 1) == 0)
  {
    v29 = sub_1004318FC();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[RoutePlanningVehicleRefinementModel _subtitleForVehicle:]";
      v36 = 2080;
      v37 = "RoutePlanningVehicleRefinementModel.m";
      v38 = 1024;
      v39 = 249;
      v40 = 2080;
      v41 = "vehicle.isPureElectricVehicle";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v31 = sub_1004318FC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!objc_msgSend(v3, "isPureElectricVehicle"))
  {
    v6 = 0;
    goto LABEL_25;
  }
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  if (GEOConfigGetBOOL(MapsConfig_EVRoutingShouldShowBatteryPercentageInVehiclePickers, off_1014B46C8))
  {
    if (v3)
      v5 = (uint64_t)objc_msgSend(v3, "displayedBatteryPercentage");
    else
      v5 = 65;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%lu%%"), CFSTR("localized string not found"), 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5));
    objc_msgSend(v4, "addObject:", v9);

  }
  if (v3)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastStateUpdateDate"));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -7200.0));
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v12, "timeIntervalSinceDate:", v11);
  if (v13 >= GEOConfigGetDouble(MapsConfig_EVRoutingMinimumSyncAgeToDisplay, off_1014B3848))
  {

  }
  else
  {
    BOOL = GEOConfigGetBOOL(VirtualGarageConfig_EVRoutingForceShowLastSyncDate[0], VirtualGarageConfig_EVRoutingForceShowLastSyncDate[1]);

    if ((BOOL & 1) == 0)
      goto LABEL_18;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:](NSDateComponentsFormatter, "_mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:", v11, v15, 128));

  objc_msgSend(v4, "addObject:", v16);
LABEL_18:
  if (objc_msgSend(v4, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
    v18 = objc_msgSend(v17, "layoutDirection");

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR(" · [List view details separator]"), CFSTR("localized string not found"), 0));

    if (v18 == (id)1)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsJoinedByString:", v20));

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", v20));
    }

  }
  else
  {
    v6 = 0;
  }

LABEL_25:
  return v6;
}

+ (BOOL)_isGarage:(id)a3 significantlyDifferentFromGarage:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "selectedVehicle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "selectedVehicle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v11 = v8;
    v12 = v10;
    if (v11 | v12)
    {
      v14 = (void *)v12;
      v15 = objc_msgSend((id)v11, "isEqual:", v12);

      if ((v15 & 1) == 0)
        goto LABEL_8;
    }
    else
    {

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "vehicles"));
    v17 = objc_msgSend(v16, "count");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "vehicles"));
    v19 = objc_msgSend(v18, "count");

    if (v17 == v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "selectedVehicle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentVehicleState"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "selectedVehicle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentVehicleState"));
      v13 = objc_msgSend(v21, "isSignificantlyDifferentFromVehicleState:", v23);

      goto LABEL_9;
    }
LABEL_8:
    v13 = 1;
    goto LABEL_9;
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (void)offlineMapsStateChanged
{
  UIMenu *cachedMenu;

  cachedMenu = self->_cachedMenu;
  self->_cachedMenu = 0;

}

- (VGVehicle)selectedVehicle
{
  return self->_selectedVehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVehicle, 0);
  objc_storeStrong((id *)&self->_cachedMenu, 0);
}

@end
