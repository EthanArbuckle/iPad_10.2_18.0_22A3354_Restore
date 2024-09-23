@implementation FMDGainsboroughPairedDeviceSimulation

- (BOOL)isPairedDeviceSimulationActive
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v3 = objc_msgSend(v2, "isInternalBuild");

  if (v3)
    return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("GainsboroughSimulationPhone"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  else
    return 0;
}

- (id)udid:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GainsboroughWatchUDID"), "stringByAppendingString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", v3, CFSTR("com.apple.icloud.fmflocatord.notbackedup")));

  return v4;
}

- (id)deviceName:(id)a3
{
  return objc_msgSend(CFSTR("Watch"), "stringByAppendingString:", a3);
}

- (id)connectionStatusString:(id)a3
{
  void *v3;
  __CFString *v4;
  unint64_t v5;
  __CFString *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GainsboroughConnectionStatus"), "stringByAppendingString:", a3));
  v4 = CFSTR("unknown");
  v5 = (unint64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", v3, CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  if (v5 <= 3)
  {
    v6 = *(&off_100056400)[v5];

    v4 = v6;
  }

  return v4;
}

- (id)wristStatusString:(id)a3
{
  void *v3;
  __CFString *v4;
  id v5;
  __CFString **v6;
  __CFString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GainsboroughWristStatus"), "stringByAppendingString:", a3));
  v4 = CFSTR("Unknown");
  v5 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", v3, CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  if (!v5)
  {
    v6 = &off_100056160;
    goto LABEL_5;
  }
  if (v5 == (id)1)
  {
    v6 = &off_100056158;
LABEL_5:
    v7 = *v6;

    v4 = v7;
  }

  return v4;
}

- (id)lastActiveDate:(id)a3
{
  void *v3;
  char *v4;
  double v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("GainsboroughLastActiveTime"), "stringByAppendingString:", a3));
  v4 = (char *)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", v3, CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  if ((unint64_t)(v4 - 1) > 3)
    v5 = -0.0;
  else
    v5 = dbl_100049EA0[(_QWORD)(v4 - 1)];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v5));

  return v6;
}

- (id)pairedDeviceInfo
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _UNKNOWN **v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDGainsboroughPairedDeviceSimulation simulation active", buf, 2u);
  }

  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(&off_10005B170, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(&off_10005B170);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDGainsboroughPairedDeviceSimulation udid:](self, "udid:", v9));
        v11 = v10;
        if (v10 && objc_msgSend(v10, "length"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDGainsboroughPairedDeviceSimulation lastActiveDate:](self, "lastActiveDate:", v9));
          v14 = v13;
          if (v13)
            v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v13, "fm_epoch")));
          else
            v15 = &off_10005AF50;
          objc_msgSend(v12, "fm_safelyMapKey:toObject:", CFSTR("lastActiveTime"), v15);
          objc_msgSend(v12, "fm_safelyMapKey:toObject:", CFSTR("udid"), v11);
          objc_msgSend(v12, "fm_safelyMapKey:toObject:", CFSTR("pairingId"), v11);
          objc_msgSend(v12, "fm_safelyMapKey:toObject:", CFSTR("productType"), CFSTR("Watch3,1"));
          objc_msgSend(v12, "fm_safelyMapKey:toObject:", CFSTR("deviceClass"), CFSTR("Watch"));
          objc_msgSend(v12, "fm_safelyMapKey:toObject:", CFSTR("platform"), CFSTR("watchos"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Watch%@"), v9));
          objc_msgSend(v12, "fm_safelyMapKey:toObject:", CFSTR("deviceName"), v16);

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDGainsboroughPairedDeviceSimulation connectionStatusString:](self, "connectionStatusString:", v9));
          objc_msgSend(v12, "fm_safelyMapKey:toObject:", CFSTR("connectionStatus"), v17);

          objc_msgSend(v21, "addObject:", v12);
        }

      }
      v6 = objc_msgSend(&off_10005B170, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v6);
  }
  v18 = sub_10001C4E8();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FMDGainsboroughPairedDeviceSimulation simulated paired devices %@", buf, 0xCu);
  }

  return v21;
}

@end
