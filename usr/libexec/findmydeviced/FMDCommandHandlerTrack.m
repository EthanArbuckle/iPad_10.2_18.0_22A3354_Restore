@implementation FMDCommandHandlerTrack

- (void)handleCommand
{
  void *v3;
  void *v4;
  signed int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  signed int v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("trackingStatus")));
  v5 = objc_msgSend(v4, "intValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("track.sendTrackedLocationsOnChange")));
  v8 = objc_msgSend(v7, "BOOLValue");

  v51 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("loc.timeout")));
  objc_msgSend(v51, "fm_safelyMapKey:toObject:", CFSTR("timeout"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("loc.startThreshold")));
  objc_msgSend(v51, "fm_safelyMapKey:toObject:", CFSTR("startThreshold"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("loc.endThreshold")));
  objc_msgSend(v51, "fm_safelyMapKey:toObject:", CFSTR("endThreshold"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("loc.decayFactor")));
  objc_msgSend(v51, "fm_safelyMapKey:toObject:", CFSTR("decayFactor"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("loc.desiredAccuracy")));
  objc_msgSend(v51, "fm_safelyMapKey:toObject:", CFSTR("desiredAccuracy"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("loc.validityDuration")));
  objc_msgSend(v51, "fm_safelyMapKey:toObject:", CFSTR("validityDuration"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("track.minSLCThresholdInMeters")));

  if (v22)
  {
    objc_msgSend(v22, "doubleValue");
    v24 = v23;
  }
  else
  {
    v24 = 400.0;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("track.maxTrackedLocationsCount")));
  v27 = objc_msgSend(v26, "intValue");

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("track.locCacheDurationInSecs")));
  objc_msgSend(v29, "doubleValue");
  v31 = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("track.maxCallbackTimeInSecs")));
  objc_msgSend(v33, "doubleValue");
  v35 = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("track.minDistanceThresholdInMeters")));
  objc_msgSend(v37, "doubleValue");
  v39 = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("track.minTimeBetweenLocationsInSecs")));
  objc_msgSend(v41, "doubleValue");
  v43 = v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("track.minCallbackTimeInSecs")));
  objc_msgSend(v45, "doubleValue");
  v47 = v46;

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "locationTracker"));

  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "locationTracker"));
    objc_msgSend(v50, "updateLocationTrackingInfoWithTrackingStatus:minSLCAccuracyThreshold:locateParams:trackNotifyEnabled:maxLocations:keepAlive:periodicCheckInterval:minDistanceBetweenLocations:minTimeBetweenLocations:minTimeBetweenServerCalls:", v5, v51, v8, v27, v24, v31, v35, v39, v43, v47);

  }
  -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);

}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  FMDRequestAckTrack *v9;
  void *v10;
  void *v11;
  FMDRequestAckTrack *v12;
  id v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v9 = [FMDRequestAckTrack alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v12 = -[FMDRequestAckTrack initWithAccount:trackCommand:ackURL:](v9, "initWithAccount:trackCommand:ackURL:", v10, v11, v8);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000056C0;
    v15[3] = &unk_1002C1130;
    v16 = v4;
    -[FMDRequest setCompletionHandler:](v12, "setCompletionHandler:", v15);
    objc_msgSend(v7, "enqueueRequest:", v12);

  }
  else
  {
    v13 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the track command because there is no ack URL", v14, 2u);
    }
  }

}

@end
