@implementation WifiScannerCommonDarwin

+ (id)networkResultsToScanResults:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[WifiScannerCommonDarwin commonNetworkResultsToScanResults:withConverter:](WifiScannerCommonDarwin, "commonNetworkResultsToScanResults:withConverter:", a3, &stru_100404440));
}

+ (id)commonNetworkResultsToScanResults:(id)a3 withConverter:(id)a4
{
  id v5;
  uint64_t (**v6)(id, _QWORD);
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v6 = (uint64_t (**)(id, _QWORD))a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = v6[2](v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        objc_msgSend(v7, "addObject:", v13, (_QWORD)v15);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)scanResultWithAge:(id)a3 bssid:(id)a4 ssid:(id)a5 channel:(id)a6 rssi:(id)a7 flags:(id)a8 adHoc:(BOOL)a9 captive:(BOOL)a10 mode:(id)a11 personalHotspot:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  WifiScanResult *v23;
  float v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unsigned int v29;
  WifiScanResult *v30;
  uint64_t v32;
  id v33;

  v17 = a3;
  v33 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a11;
  v23 = [WifiScanResult alloc];
  if (v17)
  {
    objc_msgSend(v17, "floatValue");
    v25 = v24;
    if (v19)
      goto LABEL_3;
LABEL_6:
    v26 = 4294966296;
    if (v20)
      goto LABEL_4;
    goto LABEL_7;
  }
  v25 = NAN;
  if (!v19)
    goto LABEL_6;
LABEL_3:
  v26 = (uint64_t)objc_msgSend(v19, "intValue");
  if (v20)
  {
LABEL_4:
    v27 = (uint64_t)objc_msgSend(v20, "intValue");
    goto LABEL_8;
  }
LABEL_7:
  v27 = 2000000000;
LABEL_8:
  v28 = objc_msgSend(v21, "unsignedIntValue");
  if (v22)
    v29 = objc_msgSend(v22, "intValue");
  else
    v29 = -2000000000;
  HIDWORD(v32) = v29;
  BYTE2(v32) = a10;
  BYTE1(v32) = a12;
  LOBYTE(v32) = a9;
  v30 = -[WifiScanResult initWithAge:bssid:ssid:channel:rssi:flags:adHoc:personalHotspot:captive:mode:](v23, "initWithAge:bssid:ssid:channel:rssi:flags:adHoc:personalHotspot:captive:mode:", (uint64_t)(v25 * 1000000.0), v33, v18, v26, v27, v28, v32);

  return v30;
}

+ (id)scanSettingsToDictionary:(id)a3 usingSupportedChannels:(id)a4 logTo:(id)a5
{
  id v6;
  uint64_t (**v7)(_QWORD);
  id v8;
  unsigned int v9;
  _UNKNOWN **v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v21;
  uint64_t v22;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 4);
  objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("SCAN_MERGE"));
  if (v6)
  {
    v9 = objc_msgSend(v6, "scanType");
    switch(v9)
    {
      case 0u:
        goto LABEL_14;
      case 1u:
        v10 = &off_10040B178;
        break;
      case 2u:
        v10 = &off_10040B148;
        break;
      default:
        if (qword_100417ED8 != -1)
          dispatch_once(&qword_100417ED8, &stru_100404460);
        v11 = (id)qword_100417EE0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v21 = 67109120;
          LODWORD(v22) = objc_msgSend(v6, "scanType");
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unsupported scan type %d", (uint8_t *)&v21, 8u);
        }

LABEL_14:
        if (objc_msgSend(v6, "lowPriorityScan"))
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("SCAN_LOW_PRIORITY"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("SCAN_TRIM_RESULTS"));
        v12 = (uint64_t)objc_msgSend(v6, "dwell");
        if (v12 >= 1)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v12));
          objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("SCAN_DWELL_TIME"));

          goto LABEL_21;
        }
        if (qword_100417ED8 == -1)
        {
          v14 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
            goto LABEL_21;
        }
        else
        {
          dispatch_once(&qword_100417ED8, &stru_100404460);
          v14 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
          {
LABEL_21:
            if (objc_msgSend(v6, "includeOffChannelResults"))
              objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SCAN_INC_OFFCHANNEL_BSS"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "channels"));
            v16 = v7[2](v7);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[WifiScannerCommonDarwin channelDictsForChannels:withSupportedChannelDicts:](WifiScannerCommonDarwin, "channelDictsForChannels:withSupportedChannelDicts:", v15, v17));

            if (v18)
            {
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("SCAN_CHANNELS"));
LABEL_28:

              goto LABEL_29;
            }
            if (qword_100417ED8 == -1)
            {
              v19 = qword_100417EE0;
              if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
                goto LABEL_28;
            }
            else
            {
              dispatch_once(&qword_100417ED8, &stru_100404460);
              v19 = qword_100417EE0;
              if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
                goto LABEL_28;
            }
            LOWORD(v21) = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "No WiFi channels are specified to scan.  Will scan all channels", (uint8_t *)&v21, 2u);
            goto LABEL_28;
          }
        }
        v21 = 134217984;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid dwell duration of %lld ms specified.  Default well time will be used", (uint8_t *)&v21, 0xCu);
        goto LABEL_21;
    }
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("SCAN_TYPE"));
    goto LABEL_14;
  }
  objc_msgSend(v8, "setObject:forKey:", &off_10040B148, CFSTR("SCAN_TYPE"));
  objc_msgSend(v8, "setObject:forKey:", &off_10040B160, CFSTR("SCAN_DWELL_TIME"));
LABEL_29:

  return v8;
}

+ (id)channelDictsForChannels:(id)a3 withSupportedChannelDicts:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_msgSend(v5, "count");
    v8 = 0;
    if (v6 && v7)
    {
      v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[WifiScannerCommonDarwin findChannel:in:](WifiScannerCommonDarwin, "findChannel:in:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "intValue", (_QWORD)v15), v6));
            if (v13)
              objc_msgSend(v8, "addObject:", v13);

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)findChannel:(int)a3 in:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SUP_CHANNEL"), (_QWORD)v15));
        v11 = v10;
        if (v10 && objc_msgSend(v10, "intValue") == a3)
        {
          v19[0] = CFSTR("CHANNEL");
          v19[1] = CFSTR("CHANNEL_FLAGS");
          v20[0] = v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SUP_CHANNEL_FLAGS")));
          v20[1] = v13;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

          goto LABEL_12;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

+ (id)dictionaryToScanSettings:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  signed int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  WifiScannerSettings *v23;
  double v24;
  WifiScannerSettings *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *__p;
  void *v33[2];
  char v34;
  _BYTE v35[128];
  std::string v36;

  v3 = a3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SCAN_CHANNELS")));
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v27, "count"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v27;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (!v6)
    goto LABEL_15;
  v7 = *(_QWORD *)v29;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v29 != v7)
        objc_enumerationMutation(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8), "objectForKeyedSubscript:", CFSTR("CHANNEL")));
      if (!v9)
      {
        sub_1000D5048(v33, "");
        sub_100227518("Cannot find channel in settings dictionary", &v36);
        sub_100174738((uint64_t)v33, (uint64_t)&v36, 1);
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v36.__r_.__value_.__l.__data_);
          if (v34 < 0)
            goto LABEL_13;
        }
        else
        {
          if ((v34 & 0x80000000) == 0)
            goto LABEL_11;
LABEL_13:
          operator delete(v33[0]);
        }
LABEL_11:
        sub_1000F2AE4((uint64_t)&__p);
      }
      objc_msgSend(v4, "addObject:", v9);

      v8 = (char *)v8 + 1;
    }
    while (v6 != v8);
    v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    v6 = v10;
  }
  while (v10);
LABEL_15:

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SCAN_DWELL_TIME")));
  v12 = objc_msgSend(v11, "intValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SCAN_INC_OFFCHANNEL_BSS")));
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "BOOLValue");
  else
    v15 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SCAN_TYPE")));
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "intValue");
    if (v18 == 1)
      v19 = 1;
    else
      v19 = 2 * (v18 == 2);
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SCAN_LOW_PRIORITY")));
  v21 = v20;
  if (v20)
    v22 = objc_msgSend(v20, "BOOLValue");
  else
    v22 = 0;
  v23 = [WifiScannerSettings alloc];
  LODWORD(v24) = 2141192192;
  v25 = -[WifiScannerSettings initWithChannels:dwell:scanType:includingOffChannelResults:atDutyCycle:asLowPriority:](v23, "initWithChannels:dwell:scanType:includingOffChannelResults:atDutyCycle:asLowPriority:", v4, v12, v19, v15, v22, v24);

  return v25;
}

@end
