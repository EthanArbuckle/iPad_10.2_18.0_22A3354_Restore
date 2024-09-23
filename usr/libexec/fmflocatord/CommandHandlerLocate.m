@implementation CommandHandlerLocate

- (void)handleCommand
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  const __CFString *v43;
  void *v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler provider](self, "provider"));
  v4 = objc_msgSend(v3, "locServicesCapable");
  v5 = objc_msgSend(v3, "isProviderEnabledForLocations");
  if (v4)
    v6 = CFSTR("Ignored Request - Location Services Not Enabled");
  else
    v6 = CFSTR("Ignored Request - Device Not Capable of Location Services");
  v7 = 405;
  if (v4 && v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandlerLocate createLocatorWithParams:](self, "createLocatorWithParams:", v8));

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardLocator"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardLocator"));
      v13 = objc_msgSend(v12, "locatorRunning");

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardLocator"));
        objc_msgSend(v14, "desiredAccuracy");
        v16 = v15;
        objc_msgSend(v9, "desiredAccuracy");
        v18 = v17;

        v19 = sub_10001C4E8();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
        if (v16 <= v18)
        {
          if (v21)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardLocator"));
            objc_msgSend(v34, "desiredAccuracy");
            v36 = v35;
            objc_msgSend(v9, "desiredAccuracy");
            *(_DWORD *)buf = 134218240;
            v46 = v36;
            v47 = 2048;
            v48 = v37;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Current locate command is already looking for the same/better accuracy. Ignoring new locate - current=%fm,new=%fm", buf, 0x16u);

          }
          goto LABEL_15;
        }
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardLocator"));
          objc_msgSend(v22, "desiredAccuracy");
          v24 = v23;
          objc_msgSend(v9, "desiredAccuracy");
          *(_DWORD *)buf = 134218240;
          v46 = v24;
          v47 = 2048;
          v48 = v25;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "New locate command asks for a better accuracy than the current locate. Stopping current locate - current=%fm,new=%fm", buf, 0x16u);

        }
      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardLocator"));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardLocator"));
      objc_msgSend(v27, "stopLocator");

      objc_msgSend(v3, "setStandardLocator:", 0);
    }
    v43 = CFSTR("id");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandID](self, "commandID"));
    v44 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100015A8C;
    v40[3] = &unk_1000556C8;
    v30 = v3;
    v41 = v30;
    v42 = v29;
    v20 = v29;
    objc_msgSend(v9, "setReceivedLocationBlock:", v40);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100015AAC;
    v38[3] = &unk_100055230;
    v31 = v30;
    v39 = v31;
    objc_msgSend(v9, "setStoppedLocatorBlock:", v38);
    objc_msgSend(v31, "setStandardLocator:", v9);
    objc_msgSend(v9, "startLocator");

LABEL_15:
    v6 = CFSTR("OK");
    v7 = 200;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("status"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v6, CFSTR("message"));
  -[CommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", v32);

}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CommandHandler ackDataForCommand](self, "ackDataForCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("status")));
  v6 = (int)objc_msgSend(v5, "intValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("message")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler provider](self, "provider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
  objc_msgSend(v8, "ackLocateCommand:withStatusCode:andStatusMessage:withCompletion:", v9, v6, v7, v4);

}

- (id)_checkForLocateParamOverrides:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Application Support/FMFLocator/locateOverrides.json"), "stringByExpandingTildeInPath"));
  v5 = v3;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v4);

    v5 = v3;
    if (v7)
    {
      v8 = sub_10001C4E8();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_100034104(v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentsAtPath:", v4));

      v24 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v11, 1, &v24));
      v13 = v24;
      v5 = objc_msgSend(v3, "mutableCopy");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyEnumerator"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nextObject"));
      if (v15)
      {
        v17 = (void *)v15;
        *(_QWORD *)&v16 = 138412546;
        v23 = v16;
        do
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v17, v23));
          v19 = sub_10001C4E8();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v26 = v17;
            v27 = 2112;
            v28 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Locate Param Overridden: %@=%@", buf, 0x16u);
          }

          objc_msgSend(v5, "setValue:forKey:", v18, v17);
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nextObject"));

          v17 = (void *)v21;
        }
        while (v21);
      }

    }
  }

  return v5;
}

- (id)createLocatorWithParams:(id)a3
{
  id v4;
  void *v5;
  Locator *v6;
  id v7;
  Locator *v8;
  id v9;
  NSObject *v10;
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
  Locator *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler provider](self, "provider"));
  v6 = [Locator alloc];
  v7 = objc_msgSend(v5, "newLocationManager");
  v8 = -[Locator initWithLocationManager:](v6, "initWithLocationManager:", v7);

  v9 = sub_10001C4E8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandlerLocate fm_logID](self, "fm_logID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
    v24 = 138412546;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Created %@ for service %@", (uint8_t *)&v24, 0x16u);

  }
  v13 = objc_autoreleasePoolPush();
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandlerLocate _checkForLocateParamOverrides:](self, "_checkForLocateParamOverrides:", v4));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("locationTimeout")));
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    -[Locator setDuration:](v8, "setDuration:");
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startThreshold")));

  if (v17)
  {
    objc_msgSend(v17, "doubleValue");
    -[Locator setStartThreshold:](v8, "setStartThreshold:");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("endThreshold")));

  if (v18)
  {
    objc_msgSend(v18, "doubleValue");
    -[Locator setEndThreshold:](v8, "setEndThreshold:");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("decayFactor")));

  if (v19)
  {
    objc_msgSend(v19, "doubleValue");
    -[Locator setDecayFactor:](v8, "setDecayFactor:");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("desiredAccuracy")));

  if (v20)
  {
    objc_msgSend(v20, "doubleValue");
    -[Locator setDesiredAccuracy:](v8, "setDesiredAccuracy:");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("locationValidityDuration")));

  if (v21)
  {
    objc_msgSend(v21, "doubleValue");
    -[Locator setCachedLocValidityDuration:](v8, "setCachedLocValidityDuration:");
  }

  v22 = v8;
  objc_autoreleasePoolPop(v13);

  return v22;
}

@end
