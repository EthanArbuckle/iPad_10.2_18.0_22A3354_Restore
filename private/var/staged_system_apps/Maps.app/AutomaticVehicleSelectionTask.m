@implementation AutomaticVehicleSelectionTask

- (AutomaticVehicleSelectionTask)initWithPlatformController:(id)a3
{
  id v4;
  AutomaticVehicleSelectionTask *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AutomaticVehicleSelectionTask;
  v5 = -[AutomaticVehicleSelectionTask init](&v20, "init");
  if (v5)
  {
    objc_msgSend(v4, "addObserver:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));
    v7 = objc_opt_class(NavigationSession);
    v5->_isNavigating = objc_opt_isKindOfClass(v6, v7) & 1;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v8, "registerObserver:", v5);

    objc_initWeak(&location, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_10055FE54;
    v17 = &unk_1011AD100;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v9, "virtualGarageGetGarageWithReply:", &v14);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager", v14, v15, v16, v17));
    objc_msgSend(v10, "registerForLocalNotifications");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, "_handleAccessoryConnect:", EAAccessoryDidConnectNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, "_handleAccessoryDisconnect:", EAAccessoryDidDisconnectNotification, 0);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)_updateGarage:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10055FFFC;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateVehicleSelectionIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  AutomaticVehicleSelectionTask *v32;
  void *v33;
  id v34;
  const char *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];

  if ((GEOConfigGetBOOL(MapsFeaturesConfig_EnableAlberta[0], MapsFeaturesConfig_EnableAlberta[1]) & 1) != 0
    || (GEOConfigGetBOOL(VirtualGarageConfig_EVRoutingEnableAutomaticVehicleDeselection[0], VirtualGarageConfig_EVRoutingEnableAutomaticVehicleDeselection[1]) & 1) == 0)
  {
    v12 = sub_1004326FC();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "AutomaticVehicleSelectionTask: ignoring callback because vehicle deselection is disabled";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager", 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedAccessories"));

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          if (-[AutomaticVehicleSelectionTask _isAccessoryCarPlayConnected:](self, "_isAccessoryCarPlayConnected:", v10))
          {
            v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serialNumber"));

            v7 = v11;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    if (GEOConfigGetBOOL(VirtualGarageConfig_EVRoutingUseCarDisplaySimIdentifier[0], VirtualGarageConfig_EVRoutingUseCarDisplaySimIdentifier[1]))v14 = v7 == 0;
    else
      v14 = 1;
    if (!v14)
    {

      v7 = CFSTR("CarDisplaySim");
      goto LABEL_25;
    }
    if (v7)
    {
LABEL_25:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AutomaticVehicleSelectionTask _vehicleForIdentifier:](self, "_vehicleForIdentifier:", v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      if (v17)
      {

      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage selectedVehicle](self->_garage, "selectedVehicle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));

        if (!v19)
        {
          v34 = sub_1004326FC();
          v25 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v7;
            v35 = "AutomaticVehicleSelectionTask: user connected to CarPlay and the head unit (%@) does not match any sav"
                  "ed vehicles, no vehicle is selected at the moment so we can safely ignore this call.";
LABEL_41:
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
          }
LABEL_42:

LABEL_47:
          goto LABEL_48;
        }
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage selectedVehicle](self->_garage, "selectedVehicle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
      v23 = objc_msgSend(v20, "isEqualToString:", v22);

      if (v23)
      {
        v24 = sub_1004326FC();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayName"));
          *(_DWORD *)buf = 138412546;
          v42 = v7;
          v43 = 2112;
          v44 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "AutomaticVehicleSelectionTask: user connected to a head unit (%@) and its underlying vehicle (%@) is already selected. Ignoring this call.", buf, 0x16u);

        }
        goto LABEL_42;
      }
      if (!self->_isNavigating
        || (GEOConfigGetBOOL(MapsConfig_EVRoutingShouldSelectVehiclesDuringNavigation, off_1014B5158) & 1) != 0)
      {
        v27 = sub_1004326FC();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayName"));
            *(_DWORD *)buf = 138412802;
            v42 = v7;
            v43 = 2112;
            v44 = v30;
            v45 = 2112;
            v46 = v31;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AutomaticVehicleSelectionTask: user connected to CarPlay HU (%@) that is paired or disambiguated to vehicle: <%@, %@>. We'll select it automatically.", buf, 0x20u);

          }
          v32 = self;
          v33 = v16;
        }
        else
        {
          if (v29)
          {
            *(_DWORD *)buf = 138412290;
            v42 = v7;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AutomaticVehicleSelectionTask: user connected to CarPlay (identifier: %@) but there is no associated vehicle for this head unit. It is either a new vehicle that was not yet disambiguated or a nonEV -> we'll deselect the currently selected vehicle", buf, 0xCu);
          }

          v32 = self;
          v33 = 0;
        }
        -[AutomaticVehicleSelectionTask _selectVehicleAndForceRerouteIfNeeded:](v32, "_selectVehicleAndForceRerouteIfNeeded:", v33);
        goto LABEL_47;
      }
      v36 = sub_1004326FC();
      v25 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v7;
        v35 = "AutomaticVehicleSelectionTask: user is navigating and EVRoutingShouldSelectVehiclesDuringNavigation is dis"
              "abled so we'll ignore connection to a HU: %@";
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    v15 = sub_1004326FC();
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "AutomaticVehicleSelectionTask: we have disconnected from CarPlay (there was no accessory that supports CarPl"
            "ay and has a serialNumber), but we will keep the current selection.";
      goto LABEL_15;
    }
  }
LABEL_48:

}

- (void)_selectVehicleAndForceRerouteIfNeeded:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  __CFString *v15;

  v4 = a3;
  v5 = sub_1004326FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    if (self->_isNavigating)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = v8;
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AutomaticVehicleSelectionTask: will select vehicle: %@ and forceReroute: %@", (uint8_t *)&v12, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v10, "virtualGarageSelectVehicle:", v4);

  if (self->_isNavigating)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v11, "forceReroute");

  }
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;

  v6 = a5;
  v8 = objc_opt_class(NavigationSession, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  self->_isNavigating = isKindOfClass & 1;
}

- (void)_handleAccessoryConnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;

  v4 = a3;
  v5 = sub_1004326FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AutomaticVehicleSelectionTask: _handleAccessoryConnect: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005608EC;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

- (void)_handleAccessoryDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;

  v4 = a3;
  v5 = sub_1004326FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AutomaticVehicleSelectionTask: _handleAccessoryDisconnect: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100560A3C;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

- (id)_vehicleForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage vehicles](self->_garage, "vehicles", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iapIdentifier"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_isAccessoryCarPlayConnected:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "supportsCarPlay") & 1) != 0
    || (objc_msgSend(v3, "supportsWirelessCarPlay") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "supportsUSBCarPlay");
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_garage, 0);
}

@end
