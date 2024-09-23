@implementation RoutePlanningOptionsDataSource

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_countryObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_countryObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningOptionsDataSource;
  -[RoutePlanningOptionsDataSource dealloc](&v4, "dealloc");
}

- (BOOL)_hasUnsavedChanges
{
  id originalSelectedVehicle;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  id originalUsesPreferredNetworksForRouting;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (self->_transportType != 1)
    goto LABEL_7;
  originalSelectedVehicle = self->_originalSelectedVehicle;
  v4 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource selectedVehicle](self, "selectedVehicle"));
  if (originalSelectedVehicle != (id)v4)
  {
    v5 = (void *)v4;
    LOBYTE(v6) = 1;
LABEL_18:

    return v6;
  }
  originalUsesPreferredNetworksForRouting = self->_originalUsesPreferredNetworksForRouting;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource usesPreferredNetworksForRouting](self, "usesPreferredNetworksForRouting"));
  v9 = (unint64_t)originalUsesPreferredNetworksForRouting;
  v10 = v8;
  if (!(v9 | v10))
  {

    goto LABEL_7;
  }
  v11 = (void *)v10;
  v12 = objc_msgSend((id)v9, "isEqual:", v10);

  if ((v12 & 1) != 0)
  {
LABEL_7:
    if (self->_originalPreferences)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource drivePreferences](self, "drivePreferences"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource drivePreferences](self, "drivePreferences"));
LABEL_17:
        v5 = v14;
        v6 = objc_msgSend(v14, "isEqual:", self->_originalPreferences) ^ 1;
        goto LABEL_18;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource walkPreferences](self, "walkPreferences"));

      if (v15)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource walkPreferences](self, "walkPreferences"));
        goto LABEL_17;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource transitDataSource](self, "transitDataSource"));

      if (v16)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource transitPreferences](self, "transitPreferences"));
        goto LABEL_17;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource cyclePreferences](self, "cyclePreferences"));

      if (v17)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource cyclePreferences](self, "cyclePreferences"));
        goto LABEL_17;
      }
    }
    LOBYTE(v6) = 0;
    return v6;
  }
  LOBYTE(v6) = 1;
  return v6;
}

- (void)_updateHasUnsavedChanges
{
  -[RoutePlanningOptionsDataSource setHasUnsavedChanges:](self, "setHasUnsavedChanges:", -[RoutePlanningOptionsDataSource _hasUnsavedChanges](self, "_hasUnsavedChanges"));
}

- (void)setHasUnsavedChanges:(BOOL)a3
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSTimer *automaticSaveTimer;
  uint8_t v10[16];
  uint8_t buf[16];

  if (self->_hasUnsavedChanges == a3)
  {
    if (self->_automaticSaveTimer)
      v4 = 0;
    else
      v4 = !a3;
    if (!v4)
    {
      v5 = sub_10043214C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[Options] Rescheduling autosave timer", buf, 2u);
      }

      -[RoutePlanningOptionsDataSource _scheduleAutomaticSave](self, "_scheduleAutomaticSave");
    }
  }
  else
  {
    self->_hasUnsavedChanges = a3;
    if (a3)
    {
      -[RoutePlanningOptionsDataSource _scheduleAutomaticSave](self, "_scheduleAutomaticSave");
    }
    else if (self->_automaticSaveTimer)
    {
      v7 = sub_10043214C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[Options] Cancelling autosave timer, no longer have unsaved changes", v10, 2u);
      }

      -[NSTimer invalidate](self->_automaticSaveTimer, "invalidate");
      automaticSaveTimer = self->_automaticSaveTimer;
      self->_automaticSaveTimer = 0;

    }
  }
}

- (void)setAutomaticallySaveChanges:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  const char *v7;
  NSTimer *automaticSaveTimer;
  int v9;
  const char *v10;

  if (self->_automaticallySaveChanges != a3)
  {
    v3 = a3;
    self->_automaticallySaveChanges = a3;
    v5 = sub_10043214C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = "disable";
      if (v3)
        v7 = "enable";
      v9 = 136315138;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Options] Will %s autosave", (uint8_t *)&v9, 0xCu);
    }

    if (!v3)
    {
      -[NSTimer invalidate](self->_automaticSaveTimer, "invalidate");
      automaticSaveTimer = self->_automaticSaveTimer;
      self->_automaticSaveTimer = 0;

    }
  }
}

- (void)_scheduleAutomaticSave
{
  NSTimer *automaticSaveTimer;
  NSTimer *v4;
  double Double;
  id v6;
  NSObject *v7;
  NSTimer *v8;
  NSTimer *v9;
  int v10;
  double v11;

  automaticSaveTimer = self->_automaticSaveTimer;
  if (automaticSaveTimer)
  {
    -[NSTimer invalidate](automaticSaveTimer, "invalidate");
    v4 = self->_automaticSaveTimer;
    self->_automaticSaveTimer = 0;

  }
  if (-[RoutePlanningOptionsDataSource automaticallySaveChanges](self, "automaticallySaveChanges"))
  {
    Double = GEOConfigGetDouble(MapsConfig_RoutePlanningAutomaticOptionsSaveInterval, off_1014B3838);
    v6 = sub_10043214C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = Double;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[Options] Will autosave in %#.1fs", (uint8_t *)&v10, 0xCu);
    }

    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_performAutomaticSave:", 0, 0, Double));
    v9 = self->_automaticSaveTimer;
    self->_automaticSaveTimer = v8;

  }
}

- (void)_performAutomaticSave:(id)a3
{
  NSTimer *automaticSaveTimer;
  void *drivePreferences;
  id v6;
  id originalPreferences;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  TransitPreferencesViewControllerDataSource *transitDataSource;
  id v15;
  id v16;
  uint8_t v17[16];
  uint8_t buf[16];
  uint8_t v19[16];

  if (self->_automaticSaveTimer != a3)
    return;
  objc_msgSend(a3, "invalidate");
  automaticSaveTimer = self->_automaticSaveTimer;
  self->_automaticSaveTimer = 0;

  if (-[RoutePlanningOptionsDataSource hasUnsavedChanges](self, "hasUnsavedChanges"))
  {
    objc_storeStrong(&self->_originalSelectedVehicle, self->_selectedVehicle);
    objc_storeStrong(&self->_originalUsesPreferredNetworksForRouting, self->_usesPreferredNetworksForRouting);
    drivePreferences = self->_drivePreferences;
    if (drivePreferences
      || (drivePreferences = self->_walkPreferences) != 0
      || (drivePreferences = self->_cyclePreferences) != 0)
    {
      v6 = drivePreferences;
      originalPreferences = self->_originalPreferences;
      self->_originalPreferences = v6;
    }
    else
    {
      transitDataSource = self->_transitDataSource;
      if (!transitDataSource)
        goto LABEL_8;
      originalPreferences = (id)objc_claimAutoreleasedReturnValue(-[TransitPreferencesViewControllerDataSource preferences](transitDataSource, "preferences"));
      v15 = objc_msgSend(originalPreferences, "copy");
      v16 = self->_originalPreferences;
      self->_originalPreferences = v15;

    }
LABEL_8:
    -[RoutePlanningOptionsDataSource setHasUnsavedChanges:](self, "setHasUnsavedChanges:", -[RoutePlanningOptionsDataSource _hasUnsavedChanges](self, "_hasUnsavedChanges"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource dataCoordinator](self, "dataCoordinator"));

    v9 = sub_10043214C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Options] Autosaving to coordinator", buf, 2u);
      }

      -[RoutePlanningOptionsDataSource _updateCoordinatorWithPreferences](self, "_updateCoordinatorWithPreferences");
    }
    else
    {
      if (v11)
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Options] Autosaving to defaults", v17, 2u);
      }

      -[RoutePlanningOptionsDataSource commitPreferences](self, "commitPreferences");
    }
    -[PreferenceValuesDataSource rebuildSections](self, "rebuildSections");
    return;
  }
  v12 = sub_10043214C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Options] Autosave timer fired but no changes to save", v19, 2u);
  }

}

- (void)_autosaveIfNeeded
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (self->_automaticSaveTimer)
  {
    v3 = sub_10043214C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Options] Forcing existing autosave timer to fire before reconfiguring", v5, 2u);
    }

    -[NSTimer fire](self->_automaticSaveTimer, "fire");
  }
}

+ (void)registerCellsInCollectionView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  +[RoutePlanningVehicleCheckmarkRow registerCellsInCollectionView:](RoutePlanningVehicleCheckmarkRow, "registerCellsInCollectionView:", v4);
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___RoutePlanningOptionsDataSource;
  objc_msgSendSuper2(&v5, "registerCellsInCollectionView:", v4);

}

- (void)configureWithTransportType:(int64_t)a3 displayHints:(id)a4 virtualGarage:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  GEORouteDisplayHints *displayHints;
  unint64_t v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  NSObject *v22;
  TransitPreferencesViewControllerDataSource *v23;
  void *v24;
  TransitPreferencesViewControllerDataSource *v25;
  TransitPreferencesViewControllerDataSource *transitDataSource;
  id v27;
  NSObject *v28;
  VGVehicle *v29;
  VGVehicle *selectedVehicle;
  VGVehicle *v31;
  void *v32;
  id v33;
  NSObject *v34;
  int v35;
  const __CFString *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;

  v9 = a4;
  v10 = a5;
  -[RoutePlanningOptionsDataSource _autosaveIfNeeded](self, "_autosaveIfNeeded");
  if (self->_transportType == a3)
  {
    switch(a3)
    {
      case 3:
        displayHints = self->_displayHints;
        v17 = (unint64_t)v9;
        v18 = displayHints;
        if (v17 | (unint64_t)v18)
        {
          v19 = v18;
          v20 = objc_msgSend((id)v17, "isEqual:", v18);

          if ((v20 & 1) == 0)
          {
            v21 = sub_10043214C();
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              LOWORD(v35) = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[Options] Reloading transit options for displayHints change", (uint8_t *)&v35, 2u);
            }

            objc_storeStrong((id *)&self->_displayHints, a4);
            v23 = [TransitPreferencesViewControllerDataSource alloc];
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferencesViewControllerDataSource preferences](self->_transitDataSource, "preferences"));
            v25 = -[TransitPreferencesViewControllerDataSource initWithPreferences:displayHints:](v23, "initWithPreferences:displayHints:", v24, v17);
            transitDataSource = self->_transitDataSource;
            self->_transitDataSource = v25;

            goto LABEL_20;
          }
        }
        break;
      case 2:
        v27 = sub_10043214C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[Options] Reloading walking options", (uint8_t *)&v35, 2u);
        }

        goto LABEL_20;
      case 1:
        if (+[RoutePlanningOptionsDataSource _isGarage:significantlyDifferentFromGarage:](RoutePlanningOptionsDataSource, "_isGarage:significantlyDifferentFromGarage:", v10, self->_virtualGarage))
        {
          v11 = sub_10043214C();
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            LOWORD(v35) = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[Options] Reloading drive options for significant virtual garage change", (uint8_t *)&v35, 2u);
          }

          objc_storeStrong((id *)&self->_virtualGarage, a5);
LABEL_20:
          -[PreferenceValuesDataSource rebuildSections](self, "rebuildSections");
        }
        break;
      default:
        v33 = sub_10043214C();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[Options] No significant change, skipping any rebuild", (uint8_t *)&v35, 2u);
        }

        break;
    }
  }
  else
  {
    v13 = sub_10043214C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 4)
        v15 = CFSTR("Undefined");
      else
        v15 = *(&off_1011C0EC0 + a3 - 1);
      v35 = 138412802;
      v36 = v15;
      v37 = 2112;
      v38 = v9;
      v39 = 2112;
      v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[Options] Configuring with transportType:%@, displayHints:%@, garage:%@", (uint8_t *)&v35, 0x20u);
    }

    self->_transportType = a3;
    objc_storeStrong((id *)&self->_displayHints, a4);
    objc_storeStrong((id *)&self->_virtualGarage, a5);
    v29 = (VGVehicle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedVehicle"));
    selectedVehicle = self->_selectedVehicle;
    self->_selectedVehicle = v29;

    v31 = self->_selectedVehicle;
    if (v31)
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[VGVehicle usesPreferredNetworksForRouting](v31, "usesPreferredNetworksForRouting")));
    else
      v32 = 0;
    objc_storeStrong((id *)&self->_usesPreferredNetworksForRouting, v32);
    if (v31)

    -[RoutePlanningOptionsDataSource _configureForCurrentState](self, "_configureForCurrentState");
    -[RoutePlanningOptionsDataSource _updateAnalyticsTarget](self, "_updateAnalyticsTarget");
  }

}

- (void)_configureForCurrentState
{
  DrivePreferences *drivePreferences;
  WalkPreferences *walkPreferences;
  TransitPreferencesViewControllerDataSource *transitDataSource;
  CyclePreferences *cyclePreferences;
  id originalPreferences;
  id originalSelectedVehicle;
  id originalUsesPreferredNetworksForRouting;
  DrivePreferences *v10;
  void *v11;
  DrivePreferences *v12;
  DrivePreferences *v13;
  id v14;
  NSObject *v15;
  DrivePreferences *v16;
  WalkPreferences *v17;
  void *v18;
  WalkPreferences *v19;
  WalkPreferences *v20;
  id v21;
  WalkPreferences *v22;
  TransitPreferences *v23;
  void *v24;
  GEORouteDisplayHints *v25;
  TransitPreferencesViewControllerDataSource *v26;
  TransitPreferencesViewControllerDataSource *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  CyclePreferences *v33;
  void *v34;
  CyclePreferences *v35;
  CyclePreferences *v36;
  id v37;
  CyclePreferences *v38;
  uint8_t v39[24];

  drivePreferences = self->_drivePreferences;
  self->_drivePreferences = 0;

  walkPreferences = self->_walkPreferences;
  self->_walkPreferences = 0;

  transitDataSource = self->_transitDataSource;
  self->_transitDataSource = 0;

  cyclePreferences = self->_cyclePreferences;
  self->_cyclePreferences = 0;

  originalPreferences = self->_originalPreferences;
  self->_originalPreferences = 0;

  originalSelectedVehicle = self->_originalSelectedVehicle;
  self->_originalSelectedVehicle = 0;

  originalUsesPreferredNetworksForRouting = self->_originalUsesPreferredNetworksForRouting;
  self->_originalUsesPreferredNetworksForRouting = 0;

  switch(self->_transportType)
  {
    case 1:
      v10 = [DrivePreferences alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v12 = -[DrivePreferences initWithDefaults:](v10, "initWithDefaults:", v11);
      v13 = self->_drivePreferences;
      self->_drivePreferences = v12;

      v14 = sub_10043214C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v16 = self->_drivePreferences;
      *(_DWORD *)v39 = 138412290;
      *(_QWORD *)&v39[4] = v16;
      break;
    case 2:
      v17 = [WalkPreferences alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v19 = -[WalkPreferences initWithDefaults:](v17, "initWithDefaults:", v18);
      v20 = self->_walkPreferences;
      self->_walkPreferences = v19;

      v21 = sub_10043214C();
      v15 = objc_claimAutoreleasedReturnValue(v21);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v22 = self->_walkPreferences;
      *(_DWORD *)v39 = 138412290;
      *(_QWORD *)&v39[4] = v22;
      break;
    case 3:
      v23 = [TransitPreferences alloc];
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v15 = -[WatchSyncedPreferences initWithDefaults:](v23, "initWithDefaults:", v24);

      v25 = self->_displayHints;
      v26 = -[TransitPreferencesViewControllerDataSource initWithPreferences:displayHints:]([TransitPreferencesViewControllerDataSource alloc], "initWithPreferences:displayHints:", v15, v25);
      v27 = self->_transitDataSource;
      self->_transitDataSource = v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferencesViewControllerDataSource preferences](self->_transitDataSource, "preferences"));
      v29 = objc_msgSend(v28, "copy");
      v30 = self->_originalPreferences;
      self->_originalPreferences = v29;

      v31 = sub_10043214C();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v39 = 138412290;
        *(_QWORD *)&v39[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[Options] Loaded %@", v39, 0xCu);
      }

      goto LABEL_12;
    case 5:
      v33 = [CyclePreferences alloc];
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v35 = -[CyclePreferences initWithDefaults:](v33, "initWithDefaults:", v34);
      v36 = self->_cyclePreferences;
      self->_cyclePreferences = v35;

      v37 = sub_10043214C();
      v15 = objc_claimAutoreleasedReturnValue(v37);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v38 = self->_cyclePreferences;
      *(_DWORD *)v39 = 138412290;
      *(_QWORD *)&v39[4] = v38;
      break;
    default:
      goto LABEL_13;
  }
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[Options] Loaded %@", v39, 0xCu);
LABEL_12:

LABEL_13:
  -[PreferenceValuesDataSource rebuildSections](self, "rebuildSections", *(_OWORD *)v39);
}

- (void)_commitSelectedVehicle
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  const __CFString *v20;

  if (self->_transportType == 1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource selectedVehicle](self, "selectedVehicle"));
    v3 = sub_10043214C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      objc_msgSend(v16, "virtualGarageSelectVehicle:", v2);

      return;
    }
    v5 = v2;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_9;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_9:

LABEL_11:
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    v14 = (void *)v13;
    v15 = CFSTR("[Any]");
    if (v13)
      v15 = (const __CFString *)v13;
    *(_DWORD *)buf = 138412547;
    v18 = v12;
    v19 = 2113;
    v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Options] Saving selected vehicle: %@ \"%{private}@\", buf, 0x16u);

    goto LABEL_14;
  }
}

- (void)_commitUsesPreferredNetworksForRouting
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  const __CFString *v36;

  if (self->_transportType == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource selectedVehicle](self, "selectedVehicle"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource usesPreferredNetworksForRouting](self, "usesPreferredNetworksForRouting"));
      v5 = sub_10043214C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_23:

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
        v29 = objc_msgSend(v4, "BOOLValue");
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource selectedVehicle](self, "selectedVehicle"));
        objc_msgSend(v28, "virtualGarageSetShouldUsePreferredNetworks:forVehicle:", v29, v30);

        return;
      }
      v7 = v4;
      v8 = v7;
      if (!v7)
      {
        v14 = CFSTR("<nil>");
LABEL_12:

        v15 = v14;
        v16 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource selectedVehicle](self, "selectedVehicle"));
        v17 = v16;
        if (!v16)
        {
          v23 = CFSTR("<nil>");
          goto LABEL_20;
        }
        v18 = (objc_class *)objc_opt_class(v16);
        v19 = NSStringFromClass(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "performSelector:", "accessibilityIdentifier"));
          v22 = v21;
          if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
          {
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

            goto LABEL_18;
          }

        }
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_18:

LABEL_20:
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource selectedVehicle](self, "selectedVehicle"));
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "displayName"));
        v26 = (void *)v25;
        v27 = CFSTR("[Any]");
        *(_DWORD *)buf = 138412803;
        v32 = v15;
        if (v25)
          v27 = (const __CFString *)v25;
        v33 = 2112;
        v34 = v23;
        v35 = 2113;
        v36 = v27;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Options] Saving uses preferred networks for routing: %@ vehicle: %@ \"%{private}@\", buf, 0x20u);

        goto LABEL_23;
      }
      v9 = (objc_class *)objc_opt_class(v7);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
        v13 = v12;
        if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
        {
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

          goto LABEL_10;
        }

      }
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

      goto LABEL_12;
    }
  }
}

- (void)commitPreferences
{
  void *v3;
  id v4;

  switch(self->_transportType)
  {
    case 1:
      -[RoutePlanningOptionsDataSource _commitSelectedVehicle](self, "_commitSelectedVehicle");
      -[RoutePlanningOptionsDataSource _commitUsesPreferredNetworksForRouting](self, "_commitUsesPreferredNetworksForRouting");
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource drivePreferences](self, "drivePreferences"));
      goto LABEL_6;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource walkPreferences](self, "walkPreferences"));
      goto LABEL_6;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource transitPreferences](self, "transitPreferences"));
      goto LABEL_6;
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource cyclePreferences](self, "cyclePreferences"));
LABEL_6:
      v4 = v3;
      objc_msgSend(v3, "synchronize");

      break;
    default:
      return;
  }
}

- (TransitPreferences)transitPreferences
{
  return (TransitPreferences *)-[TransitPreferencesViewControllerDataSource preferences](self->_transitDataSource, "preferences");
}

- (void)setDrivePreferences:(id)a3
{
  uint64_t v4;
  DrivePreferences *v5;
  id originalPreferences;
  uint64_t v7;
  DrivePreferences *drivePreferences;

  v5 = (DrivePreferences *)a3;
  originalPreferences = self->_originalPreferences;
  if (!originalPreferences
    || (v7 = objc_opt_class(DrivePreferences, v4),
        (objc_opt_isKindOfClass(originalPreferences, v7) & 1) == 0))
  {
    objc_storeStrong(&self->_originalPreferences, self->_drivePreferences);
  }
  drivePreferences = self->_drivePreferences;
  self->_drivePreferences = v5;

}

- (void)setWalkPreferences:(id)a3
{
  uint64_t v4;
  WalkPreferences *v5;
  id originalPreferences;
  uint64_t v7;
  WalkPreferences *walkPreferences;

  v5 = (WalkPreferences *)a3;
  originalPreferences = self->_originalPreferences;
  if (!originalPreferences
    || (v7 = objc_opt_class(WalkPreferences, v4),
        (objc_opt_isKindOfClass(originalPreferences, v7) & 1) == 0))
  {
    objc_storeStrong(&self->_originalPreferences, self->_walkPreferences);
  }
  walkPreferences = self->_walkPreferences;
  self->_walkPreferences = v5;

}

- (void)setCyclePreferences:(id)a3
{
  uint64_t v4;
  CyclePreferences *v5;
  id originalPreferences;
  uint64_t v7;
  CyclePreferences *cyclePreferences;

  v5 = (CyclePreferences *)a3;
  originalPreferences = self->_originalPreferences;
  if (!originalPreferences
    || (v7 = objc_opt_class(CyclePreferences, v4),
        (objc_opt_isKindOfClass(originalPreferences, v7) & 1) == 0))
  {
    objc_storeStrong(&self->_originalPreferences, self->_cyclePreferences);
  }
  cyclePreferences = self->_cyclePreferences;
  self->_cyclePreferences = v5;

}

- (void)setSelectedVehicle:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  VGVehicle *selectedVehicle;
  VGVehicle *v20;
  id originalSelectedVehicle;
  VGVehicle *v22;
  void *v23;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  const __CFString *v27;

  v5 = a3;
  v6 = sub_10043214C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    goto LABEL_13;
  v8 = v5;
  v9 = v8;
  if (!v8)
  {
    v15 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v10 = (objc_class *)objc_opt_class(v8);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", "accessibilityIdentifier"));
    v14 = v13;
    if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
    {
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

      goto LABEL_8;
    }

  }
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

LABEL_10:
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
  v17 = (void *)v16;
  v18 = CFSTR("[Any]");
  if (v16)
    v18 = (const __CFString *)v16;
  *(_DWORD *)buf = 138412547;
  v25 = v15;
  v26 = 2113;
  v27 = v18;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[Options] Selecting vehicle: %@ \"%{private}@\", buf, 0x16u);

LABEL_13:
  if (!self->_originalSelectedVehicle)
  {
    selectedVehicle = self->_selectedVehicle;
    if (selectedVehicle)
      v20 = selectedVehicle;
    else
      v20 = (VGVehicle *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    originalSelectedVehicle = self->_originalSelectedVehicle;
    self->_originalSelectedVehicle = v20;

  }
  objc_storeStrong((id *)&self->_selectedVehicle, a3);
  v22 = self->_selectedVehicle;
  if (v22)
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[VGVehicle usesPreferredNetworksForRouting](v22, "usesPreferredNetworksForRouting")));
  else
    v23 = 0;
  objc_storeStrong((id *)&self->_usesPreferredNetworksForRouting, v23);
  if (v22)

  objc_storeStrong(&self->_originalUsesPreferredNetworksForRouting, self->_usesPreferredNetworksForRouting);
}

- (void)setUsesPreferredNetworksForRouting:(id)a3
{
  NSNumber *v4;
  id v5;
  NSObject *v6;
  NSNumber *usesPreferredNetworksForRouting;
  NSNumber *v8;
  id originalUsesPreferredNetworksForRouting;
  NSNumber *v10;
  _DWORD v11[2];

  v4 = (NSNumber *)a3;
  v5 = sub_10043214C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109120;
    v11[1] = -[NSNumber intValue](v4, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Options] Uses preferred networks for routing: %d", (uint8_t *)v11, 8u);
  }

  if (!self->_originalUsesPreferredNetworksForRouting)
  {
    usesPreferredNetworksForRouting = self->_usesPreferredNetworksForRouting;
    if (usesPreferredNetworksForRouting)
      v8 = usesPreferredNetworksForRouting;
    else
      v8 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    originalUsesPreferredNetworksForRouting = self->_originalUsesPreferredNetworksForRouting;
    self->_originalUsesPreferredNetworksForRouting = v8;

  }
  v10 = self->_usesPreferredNetworksForRouting;
  self->_usesPreferredNetworksForRouting = v4;

}

- (void)_updateVirtualGarage:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  id originalSelectedVehicle;
  VGVehicle *v9;
  VGVehicle *selectedVehicle;
  id originalUsesPreferredNetworksForRouting;
  VGVehicle *v12;
  void *v13;
  int v14;
  id v15;

  v5 = a3;
  if (objc_msgSend((id)objc_opt_class(self), "_isGarage:significantlyDifferentFromGarage:", self->_virtualGarage, v5))
  {
    v6 = sub_10043214C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[Options] Using updated garage: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_storeStrong((id *)&self->_virtualGarage, a3);
    originalSelectedVehicle = self->_originalSelectedVehicle;
    self->_originalSelectedVehicle = 0;

    v9 = (VGVehicle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedVehicle"));
    selectedVehicle = self->_selectedVehicle;
    self->_selectedVehicle = v9;

    originalUsesPreferredNetworksForRouting = self->_originalUsesPreferredNetworksForRouting;
    self->_originalUsesPreferredNetworksForRouting = 0;

    v12 = self->_selectedVehicle;
    if (v12)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[VGVehicle usesPreferredNetworksForRouting](v12, "usesPreferredNetworksForRouting")));
    else
      v13 = 0;
    objc_storeStrong((id *)&self->_usesPreferredNetworksForRouting, v13);
    if (v12)

    if (self->_transportType == 1)
      -[PreferenceValuesDataSource rebuildSections](self, "rebuildSections");
  }

}

- (void)prepareContent
{
  int64_t transportType;
  void *v4;
  NSObject *countryObserver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningOptionsDataSource;
  -[PreferenceValuesDataSource prepareContent](&v6, "prepareContent");
  transportType = self->_transportType;
  if (transportType)
  {
    if (self->_countryObserver)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v4, "removeObserver:", self->_countryObserver);

      countryObserver = self->_countryObserver;
      self->_countryObserver = 0;

    }
    switch(transportType)
    {
      case 1:
        -[RoutePlanningOptionsDataSource _prepareForDrive](self, "_prepareForDrive");
        break;
      case 2:
        -[RoutePlanningOptionsDataSource _prepareForWalk](self, "_prepareForWalk");
        break;
      case 3:
        -[RoutePlanningOptionsDataSource _prepareForTransit](self, "_prepareForTransit");
        break;
      case 5:
        -[RoutePlanningOptionsDataSource _prepareForCycling](self, "_prepareForCycling");
        break;
      default:
        return;
    }
  }
}

- (void)_prepareForDrive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Avoid Tolls"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Avoid Highways"), CFSTR("localized string not found"), 0));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006F9674;
  v9[3] = &unk_1011C0D70;
  v7 = v4;
  v10 = v7;
  objc_copyWeak(&v12, &location);
  v8 = v6;
  v11 = v8;
  -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_prepareForWalk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Avoid Hills"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Avoid Busy Roads"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Avoid Stairs"), CFSTR("localized string not found"), 0));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1006F9E58;
  v12[3] = &unk_1011C0DF8;
  v9 = v4;
  v13 = v9;
  objc_copyWeak(&v16, &location);
  v10 = v6;
  v14 = v10;
  v11 = v8;
  v15 = v11;
  -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_prepareForTransit
{
  id v3;
  void *v4;
  uint64_t v5;
  char *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[4];
  id location;

  v3 = objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource transitDataSource](self, "transitDataSource"));

  v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");
  if (v5 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v4, "numberOfRowsInSection:", v6);
      if (objc_msgSend(v4, "normalizedSectionIndex:", v6))
        break;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1006FA78C;
      v8[3] = &unk_1011C0E40;
      v9 = v4;
      v10[1] = v6;
      v10[2] = 0;
      v10[3] = v7;
      objc_copyWeak(v10, &location);
      -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v8);
      objc_destroyWeak(v10);

      ++v6;
    }
    while ((char *)v5 != v6);
  }

  objc_destroyWeak(&location);
}

- (void)_prepareForCycling
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *countryObserver;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  objc_initWeak(&location, self);
  if (!self->_countryObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v5 = GEOCountryConfigurationCountryCodeDidChangeNotification;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1006FAEC4;
    v18[3] = &unk_1011AD288;
    objc_copyWeak(&v19, &location);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v18));
    countryObserver = self->_countryObserver;
    self->_countryObserver = v6;

    objc_destroyWeak(&v19);
  }
  if (sub_1003C7758())
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Avoid Hills"), CFSTR("localized string not found"), 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Avoid Busy Roads"), CFSTR("localized string not found"), 0));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1006FAEF0;
    v14[3] = &unk_1011C0D70;
    v12 = v9;
    v15 = v12;
    objc_copyWeak(&v17, &location);
    v13 = v11;
    v16 = v13;
    -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v14);

    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);
}

- (void)_updateFromCoordinator
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[RoutePlanningDataCoordination desiredTransportType](self->_dataCoordinator, "desiredTransportType");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordination routeCollection](self->_dataCoordinator, "routeCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentRoute"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayHints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordination virtualGarage](self->_dataCoordinator, "virtualGarage"));
  -[RoutePlanningOptionsDataSource configureWithTransportType:displayHints:virtualGarage:](self, "configureWithTransportType:displayHints:virtualGarage:", v3, v5, v6);

}

- (void)_updateCoordinatorWithPreferences
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  int64_t transportType;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  int64_t v22;

  switch(self->_transportType)
  {
    case 0:
      v3 = sub_10043214C();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Options] Coordinator has no current session, updating defaults instead", (uint8_t *)&v21, 2u);
      }

      -[RoutePlanningOptionsDataSource commitPreferences](self, "commitPreferences");
      return;
    case 1:
      v5 = sub_10043214C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource drivePreferences](self, "drivePreferences"));
        v21 = 138412290;
        v22 = (int64_t)v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Options] Updating coordinator with %@", (uint8_t *)&v21, 0xCu);

      }
      -[RoutePlanningOptionsDataSource _commitSelectedVehicle](self, "_commitSelectedVehicle");
      -[RoutePlanningOptionsDataSource _commitUsesPreferredNetworksForRouting](self, "_commitUsesPreferredNetworksForRouting");
      v8 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource dataCoordinator](self, "dataCoordinator"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource drivePreferences](self, "drivePreferences"));
      -[NSObject updateDrivePreferences:](v8, "updateDrivePreferences:", v9);
      goto LABEL_19;
    case 2:
      v10 = sub_10043214C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource walkPreferences](self, "walkPreferences"));
        v21 = 138412290;
        v22 = (int64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Options] Updating coordinator with %@", (uint8_t *)&v21, 0xCu);

      }
      v8 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource dataCoordinator](self, "dataCoordinator"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource walkPreferences](self, "walkPreferences"));
      -[NSObject updateWalkPreferences:](v8, "updateWalkPreferences:", v9);
      goto LABEL_19;
    case 3:
      v13 = sub_10043214C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource transitPreferences](self, "transitPreferences"));
        v21 = 138412290;
        v22 = (int64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[Options] Updating coordinator with %@", (uint8_t *)&v21, 0xCu);

      }
      v8 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource dataCoordinator](self, "dataCoordinator"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource transitPreferences](self, "transitPreferences"));
      -[NSObject updateTransitPreferences:](v8, "updateTransitPreferences:", v9);
      goto LABEL_19;
    case 5:
      v18 = sub_10043214C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource cyclePreferences](self, "cyclePreferences"));
        v21 = 138412290;
        v22 = (int64_t)v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[Options] Updating coordinator with %@", (uint8_t *)&v21, 0xCu);

      }
      v8 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource dataCoordinator](self, "dataCoordinator"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource cyclePreferences](self, "cyclePreferences"));
      -[NSObject updateCyclePreferences:](v8, "updateCyclePreferences:", v9);
LABEL_19:

      break;
    default:
      v16 = sub_10043214C();
      v8 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        transportType = self->_transportType;
        v21 = 134217984;
        v22 = transportType;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Options] Unsupported transport type %lu", (uint8_t *)&v21, 0xCu);
      }
      break;
  }

}

+ (BOOL)_isGarage:(id)a3 significantlyDifferentFromGarage:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  BOOL v17;
  void *v18;
  id v19;
  void *v20;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "selectedVehicle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "selectedVehicle"));
    v9 = v7;
    v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend((id)v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_5;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "selectedVehicle"));
    v14 = objc_msgSend(v13, "usesPreferredNetworksForRouting");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "selectedVehicle"));
    v16 = objc_msgSend(v15, "usesPreferredNetworksForRouting");

    if (v14 == v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "vehicles"));
      v19 = objc_msgSend(v18, "count");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "vehicles"));
      v17 = v19 != objc_msgSend(v20, "count");

    }
    else
    {
LABEL_5:
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setAnalyticsTargetProvider:(id)a3
{
  id v4;
  id analyticsTargetProvider;

  v4 = objc_msgSend(a3, "copy");
  analyticsTargetProvider = self->_analyticsTargetProvider;
  self->_analyticsTargetProvider = v4;

  -[RoutePlanningOptionsDataSource _updateAnalyticsTarget](self, "_updateAnalyticsTarget");
}

- (void)_updateAnalyticsTarget
{
  void *v3;
  uint64_t (**v4)(id, int64_t);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource analyticsTargetProvider](self, "analyticsTargetProvider"));

  if (v3)
  {
    v4 = (uint64_t (**)(id, int64_t))objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsDataSource analyticsTargetProvider](self, "analyticsTargetProvider"));
    self->_analyticsTarget = v4[2](v4, self->_transportType);

  }
  else
  {
    self->_analyticsTarget = 0;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningOptionsDataSource;
  v5 = a3;
  v6 = -[PreferenceValuesDataSource collectionView:cellForItemAtIndexPath:](&v11, "collectionView:cellForItemAtIndexPath:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_1002A8AA0(v5);

  if (v8 == 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration", v11.receiver, v11.super_class));
    objc_msgSend(v7, "setBackgroundConfiguration:", v9);

  }
  return v7;
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 2;
}

- (BOOL)hasUnsavedChanges
{
  return self->_hasUnsavedChanges;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (BOOL)automaticallySaveChanges
{
  return self->_automaticallySaveChanges;
}

- (id)analyticsTargetProvider
{
  return self->_analyticsTargetProvider;
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (DrivePreferences)drivePreferences
{
  return self->_drivePreferences;
}

- (WalkPreferences)walkPreferences
{
  return self->_walkPreferences;
}

- (TransitPreferencesViewControllerDataSource)transitDataSource
{
  return self->_transitDataSource;
}

- (void)setTransitDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_transitDataSource, a3);
}

- (CyclePreferences)cyclePreferences
{
  return self->_cyclePreferences;
}

- (VGVirtualGarage)virtualGarage
{
  return self->_virtualGarage;
}

- (VGVehicle)selectedVehicle
{
  return self->_selectedVehicle;
}

- (NSNumber)usesPreferredNetworksForRouting
{
  return self->_usesPreferredNetworksForRouting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usesPreferredNetworksForRouting, 0);
  objc_storeStrong((id *)&self->_selectedVehicle, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_cyclePreferences, 0);
  objc_storeStrong((id *)&self->_transitDataSource, 0);
  objc_storeStrong((id *)&self->_walkPreferences, 0);
  objc_storeStrong((id *)&self->_drivePreferences, 0);
  objc_storeStrong(&self->_analyticsTargetProvider, 0);
  objc_storeStrong(&self->_originalUsesPreferredNetworksForRouting, 0);
  objc_storeStrong(&self->_originalSelectedVehicle, 0);
  objc_storeStrong(&self->_originalPreferences, 0);
  objc_storeStrong((id *)&self->_displayHints, 0);
  objc_storeStrong((id *)&self->_automaticSaveTimer, 0);
  objc_storeStrong((id *)&self->_countryObserver, 0);
  objc_storeStrong((id *)&self->_dataCoordinator, 0);
}

- (id)dataCoordinator
{
  return self->_dataCoordinator;
}

- (void)setDataCoordinator:(id)a3
{
  RoutePlanningDataCoordination *v5;
  RoutePlanningDataCoordination *dataCoordinator;
  RoutePlanningDataCoordination *v7;

  v5 = (RoutePlanningDataCoordination *)a3;
  dataCoordinator = self->_dataCoordinator;
  if (dataCoordinator != v5)
  {
    v7 = v5;
    -[RoutePlanningDataCoordination removeObserver:](dataCoordinator, "removeObserver:", self);
    objc_storeStrong((id *)&self->_dataCoordinator, a3);
    -[RoutePlanningDataCoordination addObserver:](self->_dataCoordinator, "addObserver:", self);
    -[RoutePlanningOptionsDataSource _updateFromCoordinator](self, "_updateFromCoordinator");
    v5 = v7;
  }

}

- (int64_t)observedRoutePlanningData
{
  return 94608;
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateDrivePreferences:(id)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;

  v6 = a4;
  if (self->_transportType == 1)
  {
    v8 = v6;
    v7 = -[WatchSyncedPreferences isEqual:](self->_drivePreferences, "isEqual:", v6);
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_drivePreferences, a4);
      -[PreferenceValuesDataSource rebuildSections](self, "rebuildSections");
      v6 = v8;
    }
  }

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateWalkPreferences:(id)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;

  v6 = a4;
  if (self->_transportType == 2)
  {
    v8 = v6;
    v7 = -[WatchSyncedPreferences isEqual:](self->_walkPreferences, "isEqual:", v6);
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_walkPreferences, a4);
      -[PreferenceValuesDataSource rebuildSections](self, "rebuildSections");
      v6 = v8;
    }
  }

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransitPreferences:(id)a4
{
  id v5;
  TransitPreferencesViewControllerDataSource *v6;
  TransitPreferencesViewControllerDataSource *transitDataSource;

  if (self->_transportType == 3)
  {
    v5 = a4;
    v6 = -[TransitPreferencesViewControllerDataSource initWithPreferences:displayHints:]([TransitPreferencesViewControllerDataSource alloc], "initWithPreferences:displayHints:", v5, self->_displayHints);

    transitDataSource = self->_transitDataSource;
    self->_transitDataSource = v6;

    -[PreferenceValuesDataSource rebuildSections](self, "rebuildSections");
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateCyclePreferences:(id)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;

  v6 = a4;
  if (self->_transportType == 5)
  {
    v8 = v6;
    v7 = -[WatchSyncedPreferences isEqual:](self->_cyclePreferences, "isEqual:", v6);
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cyclePreferences, a4);
      -[PreferenceValuesDataSource rebuildSections](self, "rebuildSections");
      v6 = v8;
    }
  }

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateVirtualGarage:(id)a4
{
  -[RoutePlanningOptionsDataSource _updateVirtualGarage:](self, "_updateVirtualGarage:", a4);
}

@end
