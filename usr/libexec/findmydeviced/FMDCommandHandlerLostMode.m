@implementation FMDCommandHandlerLostMode

- (void)handleCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  NSObject *v42;
  int v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  unsigned __int8 v71;
  uint64_t v72;
  unsigned int v73;
  id v74;
  NSObject *v75;
  unsigned int v76;
  id v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  signed int v85;
  unsigned int v86;
  signed int v87;
  void *v88;
  unsigned int v89;
  uint8_t buf[8];
  uint64_t v91;

  v91 = qword_100304990;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ownerNbr")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ftCapable")));
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("text")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("trackingStatus")));
  v12 = objc_msgSend(v11, "intValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("emailUpdates")));
  v15 = objc_msgSend(v14, "BOOLValue");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("lostModeEnabled")));
  v18 = objc_msgSend(v17, "BOOLValue");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("passcode")));

    if (v21)
    {
      v22 = sub_1000031B8();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        sub_1002282E8((uint64_t)v21, v23);

    }
    if (objc_msgSend(v19, "setPasscodeLock:statusCode:", v21, &v91))
    {
      v87 = v12;
      v89 = v7;
      v24 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("loc.timeout")));
      -[NSObject fm_safelyMapKey:toObject:](v24, "fm_safelyMapKey:toObject:", CFSTR("timeout"), v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("loc.startThreshold")));
      -[NSObject fm_safelyMapKey:toObject:](v24, "fm_safelyMapKey:toObject:", CFSTR("startThreshold"), v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("loc.endThreshold")));
      -[NSObject fm_safelyMapKey:toObject:](v24, "fm_safelyMapKey:toObject:", CFSTR("endThreshold"), v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("loc.decayFactor")));
      -[NSObject fm_safelyMapKey:toObject:](v24, "fm_safelyMapKey:toObject:", CFSTR("decayFactor"), v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("loc.desiredAccuracy")));
      -[NSObject fm_safelyMapKey:toObject:](v24, "fm_safelyMapKey:toObject:", CFSTR("desiredAccuracy"), v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("loc.validityDuration")));
      -[NSObject fm_safelyMapKey:toObject:](v24, "fm_safelyMapKey:toObject:", CFSTR("validityDuration"), v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("track.minSLCThresholdInMeters")));

      v86 = v15;
      v88 = v38;
      if (v38)
      {
        objc_msgSend(v38, "doubleValue");
        v40 = v39;
      }
      else
      {
        v40 = 400.0;
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("track.maxTrackedLocationsCount")));
      v85 = objc_msgSend(v46, "intValue");

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("track.locCacheDurationInSecs")));
      objc_msgSend(v48, "doubleValue");
      v50 = v49;

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("track.maxCallbackTimeInSecs")));
      objc_msgSend(v52, "doubleValue");
      v54 = v53;

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("track.minDistanceThresholdInMeters")));
      objc_msgSend(v56, "doubleValue");
      v58 = v57;

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("track.minTimeBetweenLocationsInSecs")));
      objc_msgSend(v60, "doubleValue");
      v62 = v61;

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("track.minCallbackTimeInSecs")));
      objc_msgSend(v64, "doubleValue");
      v66 = v65;

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("enableLocationServices")));
      v69 = objc_msgSend(v68, "BOOLValue");

      v70 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLostModeManager sharedInstance](FMDLostModeManager, "sharedInstance"));
      v71 = objc_msgSend(v70, "lostModeEnabled");

      v72 = 0;
      if ((v71 & 1) != 0)
      {
        v43 = 0;
      }
      else
      {
        v43 = 0;
        if ((_DWORD)v69)
        {
          v73 = +[CLLocationManager locationServicesEnabled](CLLocationManager, "locationServicesEnabled");
          if ((v73 & 1) == 0)
          {
            v74 = sub_1000031B8();
            v75 = objc_claimAutoreleasedReturnValue(v74);
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Location services is off. Reporting to the server that we will turn it on", buf, 2u);
            }

          }
          v43 = v73 ^ 1;
          v76 = +[CLLocationManager isStatusBarIconEnabledForLocationEntityClass:](CLLocationManager, "isStatusBarIconEnabledForLocationEntityClass:", 4);
          if ((v76 & 1) == 0)
          {
            v77 = sub_1000031B8();
            v78 = objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Turning on status bar icon since its off & the lost command asks us to turn on location services", buf, 2u);
            }

            +[CLLocationManager setStatusBarIconEnabled:forLocationEntityClass:](CLLocationManager, "setStatusBarIconEnabled:forLocationEntityClass:", 1, 4);
          }
          v72 = v76 ^ 1;
        }
      }
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLostModeManager sharedInstance](FMDLostModeManager, "sharedInstance"));
      objc_msgSend(v79, "enableLostModeWithMessage:ownerNumber:facetimeCapable:enableLocationServices:turnOffStatusBarIconAfterLostMode:", v9, v4, v89, v69, v72);

      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "locationTracker"));
      if (v80)
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "locationTracker"));
        objc_msgSend(v81, "updateLocationTrackingInfoWithTrackingStatus:minSLCAccuracyThreshold:locateParams:trackNotifyEnabled:maxLocations:keepAlive:periodicCheckInterval:minDistanceBetweenLocations:minTimeBetweenLocations:minTimeBetweenServerCalls:", v87, v24, v86, v85, v40, v50, v54, v58, v62, v66);

      }
    }
    else
    {
      v44 = sub_1000031B8();
      v24 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Lock failed. Ignoring the lost mode command.", buf, 2u);
      }
      v43 = 0;
    }

  }
  else
  {
    v41 = sub_1000031B8();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Lost mode cannot be disabled from the server. There seems to be some bug in the server. Not honouring this lost mode command", buf, 2u);
    }

    v43 = 0;
    v91 = qword_100304980;
  }
  objc_msgSend(v19, "registerDeviceWithCause:force:", CFSTR("LostModeCommand"), 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v83 = v82;
  if (v43)
    objc_msgSend(v82, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("locationServicesStateChanged"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v91));
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v84, CFSTR("status"));

  -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", v83);
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  signed int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  FMDRequestAckLost *v15;
  void *v16;
  FMDRequestAckLost *v17;
  id v18;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler ackDataForCommand](self, "ackDataForCommand"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status")));
  v7 = objc_msgSend(v6, "intValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locationServicesStateChanged")));
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v11)
  {
    v13 = v7;
    v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
    v15 = [FMDRequestAckLost alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v17 = -[FMDRequestAckLost initWithProvider:lostCommand:cmdStatusCode:locationServicesStateChanged:ackURL:](v15, "initWithProvider:lostCommand:cmdStatusCode:locationServicesStateChanged:ackURL:", v12, v16, v13, v9, v14);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003EF68;
    v20[3] = &unk_1002C1130;
    v21 = v4;
    -[FMDRequest setCompletionHandler:](v17, "setCompletionHandler:", v20);
    objc_msgSend(v12, "enqueueRequest:", v17);

  }
  else
  {
    v18 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not acking the lost command because there is no ack URL", v19, 2u);
    }
  }

}

@end
