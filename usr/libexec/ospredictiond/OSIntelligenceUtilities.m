@implementation OSIntelligenceUtilities

+ (id)log
{
  void *v2;
  os_log_t v3;
  void *v4;

  v2 = (void *)qword_1000768A0;
  if (!qword_1000768A0)
  {
    v3 = os_log_create("com.apple.osintelligence", "utilities");
    v4 = (void *)qword_1000768A0;
    qword_1000768A0 = (uint64_t)v3;

    v2 = (void *)qword_1000768A0;
  }
  return v2;
}

+ (BOOL)isInternalBuild
{
  return os_variant_has_internal_ui("com.apple.osintelligence.chargeprediction", a2);
}

+ (BOOL)isiPad
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)MGGetStringAnswer(CFSTR("DeviceClass"), a2);
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

+ (BOOL)isiPod
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)MGGetStringAnswer(CFSTR("DeviceClass"), a2);
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPod"));

  return v3;
}

+ (BOOL)isiPhone
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)MGGetStringAnswer(CFSTR("DeviceClass"), a2);
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

+ (id)getCurrentBootSessionUUID
{
  void *v3;
  void *v4;
  NSObject *v5;
  size_t size;
  uint8_t buf[4];
  void *v9;

  size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  v3 = malloc_type_malloc(size, 0x1105D3EDuLL);
  sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  free(v3);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current boot session UUID: %@", buf, 0xCu);
  }

  return v4;
}

+ (BOOL)isOBCSupported
{
  void *v2;

  v2 = (void *)objc_opt_class(a1);
  return objc_msgSend(v2, "isiPhone");
}

+ (id)batteryProperties
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  CFMutableDictionaryRef v5;
  id v6;
  CFMutableDictionaryRef properties;

  v2 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  if (!MatchingService)
    return 0;
  v4 = MatchingService;
  properties = 0;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0);
  v5 = properties;
  v6 = -[__CFDictionary copy](properties, "copy");

  IOObjectRelease(v4);
  return v6;
}

+ (double)batteryLevelAtDate:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSinceNow");
  if (v5 <= -10.0)
  {
    v26 = 0;
    v27 = (double *)&v26;
    v28 = 0x2020000000;
    v29 = 0;
    v12 = objc_msgSend(objc_alloc((Class)BMPublisherOptions), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, 20, 0, 1);
    v14 = BiomeLibrary(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "Device"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "Power"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "BatteryLevel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "publisherWithOptions:", v12));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filterWithIsIncluded:", &stru_100060F78));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100021DE4;
    v25[3] = &unk_100060F98;
    v25[4] = a1;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100021E44;
    v24[3] = &unk_100060FC0;
    v24[4] = &v26;
    v21 = objc_msgSend(v20, "sinkWithCompletion:shouldContinue:", v25, v24);

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_10003F17C();

    v11 = v27[3];
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryPercentageKey](_CDContextQueries, "batteryPercentageKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
    v11 = (double)(uint64_t)objc_msgSend(v10, "integerValue");

  }
  return v11;
}

+ (void)getBatteryLevelDurations:(double *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[24];

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000220EC;
  v28 = sub_1000220FC;
  v29 = 0;
  v5 = BiomeLibrary(a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "Device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "Power"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "BatteryLevel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisher"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100022104;
  v23[3] = &unk_100060F98;
  v23[4] = a1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100022164;
  v22[3] = &unk_100060FE8;
  v22[4] = &v24;
  v22[5] = a1;
  v22[6] = a3;
  v11 = objc_msgSend(v10, "sinkWithCompletion:receiveInput:", v23, v22);

  if (v25[5])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend((id)v25[5], "timestamp");
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25[5], "eventBody"));
    objc_msgSend(v17, "batteryPercentage");
    v19 = v18;

    if ((unint64_t)(uint64_t)v19 >= 0x65)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)v19));
        sub_10003F280(v21, (uint64_t)v30, v20);
      }

    }
    else
    {
      a3[(uint64_t)v19] = v14 - v16 + a3[(uint64_t)v19];
    }
  }
  _Block_object_dispose(&v24, 8);

}

+ (BOOL)isDesktopDeviceWithDurations:(double *)a3 withAOEThreshold:(double)a4 withContext:(id)a5
{
  return 0;
}

+ (double)areaOverEightyWithBatteryLevelDurations:(double *)a3
{
  double result;

  bzero(a3, 0x328uLL);
  +[OSIntelligenceUtilities getBatteryLevelDurations:](OSIntelligenceUtilities, "getBatteryLevelDurations:", a3);
  +[OSIntelligenceUtilities percentageOfBatteryDurations:aboveBatteryLevel:](OSIntelligenceUtilities, "percentageOfBatteryDurations:aboveBatteryLevel:", a3, 75.0);
  return result;
}

+ (double)percentageOfBatteryDurations:(double *)a3 aboveBatteryLevel:(double)a4
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;

  v4 = 0;
  v5 = 0.0;
  v6 = 0.0;
  do
  {
    v7 = a3[v4];
    v5 = v5 + v7;
    if ((double)(int)v4 < a4)
      v7 = -0.0;
    v6 = v6 + v7;
    ++v4;
  }
  while (v4 != 101);
  if (v5 != 0.0)
    return v6 / v5;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_10003F3E8();

  return 0.0;
}

+ (id)percentageOfTimeForBatteryLevels:(double *)a3 withLog:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  unsigned int v9;
  double v10;
  uint64_t i;
  double v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _OWORD v24[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
  v7 = 0;
  memset(v24, 0, sizeof(v24));
  v8 = 0.0;
  do
  {
    v9 = v7 / 0x19u;
    if (v9 >= 3)
      v9 = 3;
    v10 = a3[v7];
    *((double *)v24 + v9) = v10 + *((double *)v24 + v9);
    v8 = v8 + v10;
    ++v7;
  }
  while (v7 != 101);
  for (i = 0; i != 4; ++i)
  {
    v12 = *((double *)v24 + i);
    if (v12 <= 0.0)
    {
      objc_msgSend(v6, "setObject:atIndexedSubscript:", &off_100064E38, i);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 / v8));
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v13, i);

      v14 = v5;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", i));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
        *(_DWORD *)buf = 138412546;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Quartile %@: %@", buf, 0x16u);

      }
    }
  }
  v17 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Desktop Quartile Bins %@ with totalDuration %@", buf, 0x16u);

  }
  return v6;
}

+ (int64_t)currentBatteryLevelWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryPercentageKey](_CDContextQueries, "batteryPercentageKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "integerValue");

  return (int64_t)v8;
}

+ (BOOL)isPluggedInWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryExternalConnectedKey](_CDContextQueries, "batteryExternalConnectedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (id)lastPluggedInDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  double v28;
  _QWORD v30[5];
  _QWORD v31[5];
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[32];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  if (+[OSIntelligenceUtilities isPluggedInWithContext:](OSIntelligenceUtilities, "isPluggedInWithContext:", v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("externalConnectedChangeDate")));
    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("externalConnectedChangeDate")));
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v21));
      v23 = objc_msgSend(v22, "BOOLValue");

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastModifiedDateForContextualKeyPath:", v24));

LABEL_19:
        goto LABEL_20;
      }
      v7 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    }
    v25 = (void *)v7;
    goto LABEL_19;
  }
  v32 = 0;
  v33[0] = &v32;
  v33[1] = 0x3032000000;
  v33[2] = sub_1000220EC;
  v33[3] = sub_1000220FC;
  v34 = 0;
  v8 = objc_msgSend(objc_alloc((Class)BMPublisherOptions), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 8, 0, 1);
  v10 = BiomeLibrary(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "Device"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "Power"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "PluggedIn"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "publisherWithOptions:", v8));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filterWithIsIncluded:", &stru_100061008));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100022A88;
  v31[3] = &unk_100060F98;
  v31[4] = a1;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100022AE8;
  v30[3] = &unk_100060FC0;
  v30[4] = &v32;
  v17 = objc_msgSend(v16, "sinkWithCompletion:shouldContinue:", v31, v30);

  v18 = *(void **)(v33[0] + 40);
  if (v18)
  {
    objc_msgSend(v18, "timeIntervalSinceNow");
    if (v19 <= 0.0)
    {
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(v33[0] + 40), "timeIntervalSinceNow");
        sub_10003F46C((uint64_t)v33, (uint64_t)v35, v28);
      }

      v26 = *(id *)(v33[0] + 40);
      goto LABEL_16;
    }
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10003F440();
  }
  else
  {
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10003F414();
  }

  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
LABEL_16:
  v25 = v26;

  _Block_object_dispose(&v32, 8);
LABEL_20:

  return v25;
}

+ (BOOL)deviceWasActiveWithinSeconds:(double)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if ((v9 & 5) != 0)
  {
    v10 = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastModifiedDateForContextualKeyPath:", v11));
    objc_msgSend(v12, "timeIntervalSinceNow");
    v14 = -v13;

    if (v14 <= a3)
    {
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v15 = objc_alloc((Class)BMPublisherOptions);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -a3));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
      v18 = objc_msgSend(v15, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v16, v17, 1000, 0, 0);

      v21 = BiomeLibrary(v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "Activity"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "Level"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "publisherWithOptions:", v18));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "filterWithIsIncluded:", &stru_100061028));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100022E18;
      v30[3] = &unk_100060F98;
      v30[4] = a1;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100022E78;
      v29[3] = &unk_100060FC0;
      v29[4] = &v31;
      v27 = objc_msgSend(v26, "sinkWithCompletion:shouldContinue:", v30, v29);

      v10 = *((_BYTE *)v32 + 24) != 0;
      _Block_object_dispose(&v31, 8);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)deviceWasConnectedToChargerWithinSeconds:(double)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryExternalConnectedKey](_CDContextQueries, "batteryExternalConnectedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryExternalConnectedChangeDateKey](_CDContextQueries, "batteryExternalConnectedChangeDateKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v11));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastModifiedDateForContextualKeyPath:", v13));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;

    v17 = v16 < a3 && v16 > 0.0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)deviceConnectedToWirelessChargerWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryAdapterIsWirelessKey](_CDContextQueries, "batteryAdapterIsWirelessKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4
{
  return objc_msgSend(a1, "pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:", a3, a4, 0.0);
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 ignoringDisconnectsShorterThan:(double)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[10];
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v30 = a3;
  v28 = (void *)os_transaction_create("com.apple.powerui.smartcharging.mlmodelpredictor.queryPluginEvents");
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_1000220EC;
  v43 = sub_1000220FC;
  v44 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_1000220EC;
  v37[4] = sub_1000220FC;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_1000220EC;
  v35[4] = sub_1000220FC;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1000220EC;
  v33[4] = sub_1000220FC;
  v34 = 0;
  v7 = objc_alloc((Class)BMPublisherOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dateByAddingTimeInterval:", -5184000.0));
  v9 = objc_msgSend(v7, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v8, v30, 0, 0, 0);

  v12 = BiomeLibrary(v10, v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "Device"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "Power"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "PluggedIn"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publisherWithOptions:", v9));
  v18 = BiomeLibrary(v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "Device"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "TimeZone"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "publisherWithOptions:", v9));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "orderedMergeWithOther:comparator:", v22, &stru_100061048));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10002347C;
  v32[3] = &unk_100060F98;
  v32[4] = a1;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000234DC;
  v31[3] = &unk_100061070;
  v31[4] = v33;
  v31[5] = v35;
  v31[6] = v37;
  v31[7] = &v39;
  *(double *)&v31[8] = a5;
  *(double *)&v31[9] = a4;
  v24 = objc_msgSend(v23, "sinkWithCompletion:receiveInput:", v32, v31);

  v25 = (id)v40[5];
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(&v39, 8);
  return v25;
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5
{
  return objc_msgSend(a1, "pluginEventsBefore:withMinimumDuration:withMinimumPlugoutBatteryLevel:ignoringDisconnectsShorterThan:", a3, a4, a5, 0.0);
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5 ignoringDisconnectsShorterThan:(double)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[14];
  _QWORD v42[5];
  _QWORD v43[3];
  int v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[2];

  v40 = a3;
  v31 = (void *)os_transaction_create("com.apple.powerui.smartcharging.mlmodelpredictor.queryPluginEventsWithMinPlugout");
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1000220EC;
  v57 = sub_1000220FC;
  v58 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = sub_1000220EC;
  v51[4] = sub_1000220FC;
  v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_1000220EC;
  v49[4] = sub_1000220FC;
  v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = sub_1000220EC;
  v47[4] = sub_1000220FC;
  v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_1000220EC;
  v45[4] = sub_1000220FC;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = -1;
  v9 = objc_alloc((Class)BMPublisherOptions);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dateByAddingTimeInterval:", -5184000.0));
  v11 = objc_msgSend(v9, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v10, v40, 0, 0, 0);

  v14 = BiomeLibrary(v12, v13);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "Device"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "Power"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "PluggedIn"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "publisherWithOptions:", v11));
  v16 = BiomeLibrary(v33, v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "Device"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "TimeZone"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "publisherWithOptions:", v11));
  v59[0] = v18;
  v20 = BiomeLibrary(v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "Device"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "Power"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "BatteryLevel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "publisherWithOptions:", v11));
  v59[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "orderedMergeWithOthers:comparator:", v26, &stru_100061090));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100023CBC;
  v42[3] = &unk_100060F98;
  v42[4] = a1;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100023D1C;
  v41[3] = &unk_1000610B8;
  v41[4] = v45;
  v41[5] = v47;
  v41[6] = v49;
  v41[7] = v43;
  v41[8] = v51;
  v41[9] = &v53;
  *(double *)&v41[10] = a6;
  *(double *)&v41[11] = a4;
  *(double *)&v41[12] = a5;
  v41[13] = a1;
  v28 = objc_msgSend(v27, "sinkWithCompletion:receiveInput:", v42, v41);

  v29 = (id)v54[5];
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v53, 8);

  return v29;
}

+ (id)timelineEventDate:(id)a3 withDefaultsDomain:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("timeline"), (CFStringRef)a4);
  v8 = objc_msgSend(v7, "mutableCopy");

  if (v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v21 = a1;
      v12 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("event")));
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if (v16)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("date")));
            objc_msgSend(v18, "doubleValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "log"));
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              sub_10003F6C4();

            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_14:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (double)totalPluginDurationAfter:(id)a3 withMinimumDuration:(double)a4 withPluginEvents:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        objc_msgSend(v7, "timeIntervalSinceDate:", v15);
        v17 = v16;

        if (v17 <= 0.0)
        {
          objc_msgSend(v14, "duration");
          if (v18 >= a4)
          {
            objc_msgSend(v14, "duration");
            v12 = v12 + v12 + v19;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

+ (BOOL)isInputDateInTimeRange:(id)a3 withEarlyTimeOfDay:(double)a4 andLateTimeOfDay:(double)a5
{
  double v7;
  BOOL v8;
  BOOL v9;

  objc_msgSend(a1, "timeOfDayWithDate:", a3);
  v8 = v7 >= a4;
  if (v7 <= a5)
    v8 = 1;
  v9 = v7 >= a4;
  if (v7 > a5)
    v9 = 0;
  if (a4 <= a5)
    return v9;
  else
    return v8;
}

+ (double)secondsUntilHour:(unint64_t)a3 fromDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 252, v5));
  v8 = objc_msgSend(v7, "hour");
  objc_msgSend(v7, "setHour:", a3);
  objc_msgSend(v7, "setMinute:", 0);
  objc_msgSend(v7, "setSecond:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v7));
  v10 = v9;
  if ((unint64_t)v8 > a3)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", 86400.0));

    v10 = (void *)v11;
  }
  objc_msgSend(v10, "timeIntervalSinceDate:", v5);
  v13 = v12;

  return v13;
}

+ (BOOL)isRestDay:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", 14400.0));

  LOBYTE(v3) = objc_msgSend(v4, "isDateInWeekend:", v5);
  return (char)v3;
}

+ (BOOL)isIntervalOnRestDay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  char v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 544, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 544, v7));

  v9 = objc_msgSend(v6, "weekday") == (id)6 && (uint64_t)objc_msgSend(v6, "hour") > 19;
  v10 = objc_msgSend(v6, "weekday") == (id)7 || objc_msgSend(v8, "weekday") == (id)7;
  if (objc_msgSend(v8, "weekday") != (id)1)
  {
    v11 = 0;
    if (!v9)
      goto LABEL_9;
LABEL_11:
    v12 = 1;
    goto LABEL_12;
  }
  v11 = (uint64_t)objc_msgSend(v8, "hour") < 20;
  if (v9)
    goto LABEL_11;
LABEL_9:
  v12 = v10 || v11;
LABEL_12:

  return v12;
}

+ (int)datewiseDistanceBetweenDate:(id)a3 andDate:(id)a4
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceDate:", a4);
  return llround(v4 / 86400.0);
}

+ (id)getAnchorOfDate:(id)a3 onTheDayOf:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v6, (double)-(int)objc_msgSend(a1, "datewiseDistanceBetweenDate:andDate:", v6, a4) * 86400.0));

  return v7;
}

+ (BOOL)isIntervalTouchingTimewiseSlice:(id)a3 definedByReferenceDate:(id)a4 leftBoundary:(double)a5 rightBoundary:(double)a6
{
  id v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10003F728();
    goto LABEL_7;
  }
  if (a5 > a6)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10003F754();
LABEL_7:

    v13 = 0;
    goto LABEL_12;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getAnchorOfDate:onTheDayOf:", v11, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, a5));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, a6));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
  if (objc_msgSend(v18, "compare:", v16) == (id)1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
    v13 = objc_msgSend(v19, "compare:", v17) == (id)-1;

  }
  else
  {
    v13 = 0;
  }

LABEL_12:
  return v13;
}

+ (id)clipInterval:(id)a3 withTimewiseSliceDefineBy:(id)a4 leftBoundary:(double)a5 rightBoundary:(double)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v10 = a3;
  v11 = a4;
  if (a5 <= a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getAnchorOfDate:onTheDayOf:", v11, v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, a5));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, a6));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "earlierDate:", v18));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
    if (v19 == (void *)v20)
    {

      v13 = 0;
    }
    else
    {
      v21 = (void *)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "earlierDate:", v22));

      if (v23 == v17)
      {
        v13 = 0;
        goto LABEL_11;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "laterDate:", v24));

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "earlierDate:", v25));

      v13 = objc_msgSend(v10, "copyWithZone:", 0);
      objc_msgSend(v13, "setStartDate:", v18);
      objc_msgSend(v13, "setEndDate:", v19);
    }

LABEL_11:
    goto LABEL_12;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_10003F754();

  v13 = v10;
LABEL_12:

  return v13;
}

+ (double)clockwiseAngleFromPoint:(id)a3 toPoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  long double v10;
  void *v11;
  long double v12;
  double v13;
  void *v14;
  double v15;
  long double v16;
  void *v17;
  long double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") == (id)2 && objc_msgSend(v7, "count") == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v11, "doubleValue");
    v13 = atan2(v10, v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v17, "doubleValue");
    v19 = atan2(v16, v18);

    v20 = fmod(v13 - v19, 6.28318531);
    if (v20 < 0.0)
      v20 = v20 + 6.28318531;
    v21 = v20 * 57.2957795;
  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10003F7BC();

    v21 = -1.0;
  }

  return v21;
}

+ (id)encodeTimeAsPointFromDate:(id)a3
{
  double v3;
  __double2 v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  objc_msgSend(a1, "timeOfDayWithDate:", a3);
  v4 = __sincos_stret(v3 * 6.28318531 / 24.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4.__cosval));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4.__sinval));
  v9[0] = v5;
  v9[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));

  return v7;
}

+ (BOOL)legacyPastEventInQuestion:(id)a3 containsTimeOfReferenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  BOOL v18;
  double v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 >= 0.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "encodeTimeAsPointFromDate:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "encodeTimeAsPointFromDate:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "encodeTimeAsPointFromDate:", v7));
    objc_msgSend(a1, "clockwiseAngleFromPoint:toPoint:", v16, v13);
    v18 = v17 < 180.0;
    objc_msgSend(a1, "clockwiseAngleFromPoint:toPoint:", v16, v15);
    v11 = v19 > 180.0 && v18;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)pastEventInQuestion:(id)a3 containsTimeOfReferenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  unsigned __int8 v21;
  NSObject *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 < 0.0)
  {
LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = v13;

  if (v14 <= 0.0)
  {
    if (v14 < 0.0)
    {
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10003F824(v6);

    }
    goto LABEL_9;
  }
  if (v14 >= 86400.0)
  {
    v21 = 1;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    objc_msgSend(a1, "timeOfDayWithDate:", v15);
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    objc_msgSend(a1, "timeOfDayWithDate:", v18);
    v20 = v19;

    v21 = objc_msgSend(a1, "isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:", v7, v17, v20);
  }
LABEL_10:

  return v21;
}

+ (BOOL)pastEventInQuestion:(id)a3 startsAfterTimeOfReferenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 >= 0.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "encodeTimeAsPointFromDate:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "encodeTimeAsPointFromDate:", v7));
    objc_msgSend(a1, "clockwiseAngleFromPoint:toPoint:", v13, v14);
    v11 = v15 < 180.0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (double)percentOfLongDurationsIn:(id)a3 withLongThreshold:(double)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  double v11;
  void *i;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      v11 = a4 / 3600.0;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "doubleValue", (_QWORD)v17);
          if (v13 >= v11)
            ++v9;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
      v14 = (double)v9;
    }
    else
    {
      v14 = 0.0;
    }

    v15 = v14 / (double)(unint64_t)objc_msgSend(v6, "count");
  }
  else
  {
    v15 = 0.0;
  }

  return v15;
}

+ (double)cyclicalEncodingOfHoursInDay:(double)a3 useCos:(BOOL)a4
{
  double v4;

  v4 = a3 * 6.28318531 / 24.0;
  if (a4)
    return cos(v4);
  else
    return sin(v4);
}

+ (double)cyclicalEncodingOfWeekday:(id)a3 useCos:(BOOL)a4
{
  _BOOL4 v4;
  double v5;

  v4 = a4;
  v5 = (double)(int)objc_msgSend(a1, "pandasWeekdayOf:", a3) * 6.28318531 / 6.0;
  if (v4)
    return cos(v5);
  else
    return sin(v5);
}

+ (id)dynamicDurationsFromEvents:(id)a3 withAnchorDate:(id)a4 withUnit:(double)a5 cappedAt:(double)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  double v19;
  double v20;
  NSObject *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v10, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (!v14)
      goto LABEL_20;
    v15 = v14;
    v16 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        objc_msgSend(a1, "dynamicDurationFromEvent:withAnchorDate:", v18, v11);
        if (v19 <= 0.0)
        {
          if (v19 >= 0.0)
            continue;
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error: extracted <0 duration from event %@. Abandoning event.", buf, 0xCu);
          }
        }
        else
        {
          if (v19 >= a6)
            v20 = a6;
          else
            v20 = v19;
          if (a6 > 0.0)
            v19 = v20;
          v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 / a5));
          objc_msgSend(v12, "addObject:", v21);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (!v15)
      {
LABEL_20:

        v10 = v23;
        break;
      }
    }
  }

  return v12;
}

+ (double)dynamicDurationFromEvent:(id)a3 withAnchorDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  if (+[OSIntelligenceUtilities pastEventInQuestion:containsTimeOfReferenceDate:](OSIntelligenceUtilities, "pastEventInQuestion:containsTimeOfReferenceDate:", v6, v7))
  {
    objc_msgSend(a1, "intersectedDurationOfPastEvent:withDateOfIntersection:", v6, v7);
    v11 = v12;
  }

  return v11;
}

+ (double)intersectedDurationOfPastEvent:(id)a3 withDateOfIntersection:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v8 = -1.0;
  if (v6)
  {
    if (+[OSIntelligenceUtilities pastEventInQuestion:containsTimeOfReferenceDate:](OSIntelligenceUtilities, "pastEventInQuestion:containsTimeOfReferenceDate:", v6, v7))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "encodeTimeAsPointFromDate:", v9));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "encodeTimeAsPointFromDate:", v7));
      objc_msgSend(a1, "clockwiseAngleFromPoint:toPoint:", v10, v11);
      v8 = v12 * 86400.0 / 360.0;

    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10003F8E0((uint64_t)v7, v6);

    }
  }

  return v8;
}

+ (double)exponentialDecayByDateDistance:(int)a3 withDegree:(double)a4
{
  int v4;

  if (a3 < 0)
    v4 = a3;
  else
    v4 = -a3;
  return exp((double)v4 * a4);
}

+ (double)sumIntervalsWithDateDecay:(id)a3 fromDate:(id)a4 withDecayDegree:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v8 = a3;
  v9 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        v17 = objc_msgSend(a1, "datewiseDistanceBetweenDate:andDate:", v9, v16);

        objc_msgSend(a1, "exponentialDecayByDateDistance:withDegree:", v17, a5);
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        objc_msgSend(v20, "timeIntervalSinceDate:", v21);
        v23 = v22;

        v13 = v13 + v19 * v23;
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

+ (double)countIntervalsWithDateDecay:(id)a3 fromDate:(id)a4 withDecayDegree:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  void *i;
  void *v15;
  id v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v8 = a3;
  v9 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "startDate"));
        v16 = objc_msgSend(a1, "datewiseDistanceBetweenDate:andDate:", v9, v15);

        objc_msgSend(a1, "exponentialDecayByDateDistance:withDegree:", v16, a5);
        v13 = v13 + v17;
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

+ (id)longestK:(int64_t)a3 intervalsInArray:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "sortedArrayUsingComparator:", &stru_1000610F8));
  if ((unint64_t)objc_msgSend(v5, "count") < a3)
    a3 = (int64_t)objc_msgSend(v5, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 0, a3));

  return v6;
}

+ (id)longestKIntervals:(int64_t)a3 endAfter:(id)a4 startBefore:(id)a5 fromIntervals:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("((endDate >= %@) AND (startDate <= %@))"), a4, a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities longestK:intervalsInArray:](OSIntelligenceUtilities, "longestK:intervalsInArray:", a3, v11));
  return v12;
}

+ (id)accumulativelyBinKLongestIntervals:(int64_t)a3 endAfter:(id)a4 startBefore:(id)a5 longerThan:(double)a6 fromIntervals:(id)a7
{
  void *v8;
  int v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _UNKNOWN **v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _UNKNOWN **v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "longestKIntervals:endAfter:startBefore:fromIntervals:", a3, a4, a5, a7));
  v9 = 24;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 24));
  do
  {
    objc_msgSend(v10, "addObject:", &off_100064E38);
    --v9;
  }
  while (v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    v14 = &AnalyticsSendEventLazy_ptr;
    v33 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
        objc_msgSend(v17, "timeIntervalSinceDate:", v18);
        v20 = v19;

        if (v20 >= a6)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
          v23 = v14;
          v24 = v12;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "components:fromDate:toDate:options:", 32, v21, v22, 0));
          v26 = (uint64_t)objc_msgSend(v25, "hour");

          v12 = v24;
          v14 = v23;

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
          v13 = v33;
          v28 = (uint64_t)objc_msgSend(v34, "component:fromDate:", 32, v27);

          if (v26 >= 1)
          {
            do
            {
              v29 = v23[62];
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v28));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "numberWithInteger:", (char *)objc_msgSend(v30, "integerValue") + 1));
              objc_msgSend(v10, "setObject:atIndexedSubscript:", v31, v28);

              v28 = (v28 + 1) % 24;
              --v26;
            }
            while (v26);
          }
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

  return v10;
}

+ (id)lastLockDate
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  double v17;
  _QWORD v19[5];
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[24];

  v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x3032000000;
  v21[2] = sub_1000220EC;
  v21[3] = sub_1000220FC;
  v22 = 0;
  v3 = objc_msgSend(objc_alloc((Class)BMPublisherOptions), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 4, 0, 1);
  v5 = BiomeLibrary(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "Device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ScreenLocked"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publisherWithOptions:", v3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filterWithIsIncluded:", &stru_100061118));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000261A8;
  v19[3] = &unk_100060FC0;
  v19[4] = &v20;
  v11 = objc_msgSend(v10, "sinkWithCompletion:shouldContinue:", &stru_100061138, v19);

  v12 = *(void **)(v21[0] + 40);
  if (!v12)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003F994();
    goto LABEL_8;
  }
  objc_msgSend(v12, "timeIntervalSinceNow");
  if (v13 > 0.0)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003F9C0();
LABEL_8:

    v15 = 0;
    goto LABEL_12;
  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(v21[0] + 40), "timeIntervalSinceNow");
    sub_10003F9EC((uint64_t)v21, (uint64_t)v23, v17);
  }

  v15 = *(id *)(v21[0] + 40);
LABEL_12:

  _Block_object_dispose(&v20, 8);
  return v15;
}

+ (double)secondsSinceBecomingInactiveAtDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  double v19;
  double v20;
  NSObject *v21;
  double v22;
  double v23;
  void *v24;
  unsigned int v25;
  void *v27;
  unsigned int v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  id v43;
  __int16 v44;
  double v45;

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1000220EC;
  v34 = sub_1000220FC;
  v35 = 0;
  v5 = objc_alloc((Class)BMPublisherOptions);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v7 = objc_msgSend(v5, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v4, v6, 100, 0, 1);

  v10 = BiomeLibrary(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "Activity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "Level"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publisherWithOptions:", v7));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filterWithIsIncluded:", &stru_100061158));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100026614;
  v29[3] = &unk_100060FC0;
  v29[4] = &v30;
  v16 = objc_msgSend(v15, "sinkWithCompletion:shouldContinue:", &stru_100061178, v29);

  v17 = (void *)v31[5];
  if (v17)
  {
    objc_msgSend(v17, "timestamp");
    v18 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    -[NSObject timeIntervalSinceDate:](v18, "timeIntervalSinceDate:", v4);
    v20 = v19;
    if (v19 <= 0.0)
    {
      v23 = -v19;
      if (objc_msgSend(a1, "isActiveBiomeActivityLevelEvent:", v31[5]))
      {
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        v22 = 0.0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31[5], "eventBody"));
          v25 = objc_msgSend(v24, "inUseStatus");
          *(_DWORD *)buf = 67109890;
          v37 = v25;
          v38 = 2112;
          v39 = v18;
          v40 = 2048;
          v41 = v23;
          v42 = 2112;
          v43 = v4;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Last event is active (%d) at %@ (%.2f seconds ago from %@). Returning 0 second.", buf, 0x26u);

        }
      }
      else
      {
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31[5], "eventBody"));
          v28 = objc_msgSend(v27, "inUseStatus");
          *(_DWORD *)buf = 67110146;
          v37 = v28;
          v38 = 2112;
          v39 = v18;
          v40 = 2048;
          v41 = -v20;
          v42 = 2112;
          v43 = v4;
          v44 = 2048;
          v45 = -v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Last event is inactive (%d) at %@ (%.2f seconds ago from %@). Returning %.2f seconds.", buf, 0x30u);

        }
        v22 = -v20;
      }
    }
    else
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
      v22 = 0.0;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10003FA8C();
    }

  }
  else
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    v22 = 0.0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10003FA28();
  }

  _Block_object_dispose(&v30, 8);
  return v22;
}

+ (BOOL)isActiveBiomeActivityLevelEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  BOOL v14;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventBody"))) != 0
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody")),
        v8 = objc_msgSend(v7, "hasInUseStatus"),
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
    v10 = objc_msgSend(v9, "inUseStatus");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
    v12 = objc_msgSend(v11, "inUseStatus");

    v14 = v10 != 32 && v12 != 0;
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

+ (id)concatenateChargeSessions:(id)a3 withMaxDeltaSecondsBetweenEvents:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _OSIntelligenceChargeSession *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v38;
  void *v39;
  void *v40;
  _OSIntelligenceChargeSession *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v38 = a1;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "allObjects"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v9 = objc_msgSend(v7, "count");
    LODWORD(v10) = v9 - 1;
    if (v9 >= 2)
    {
      v11 = (double)a4;
      v39 = v8;
      do
      {
        v12 = v10;
        do
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          if (objc_msgSend(v13, "isEqual:", v14))
          {

            v15 = v12;
          }
          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v12));

            v15 = v12;
            if (v16)
              goto LABEL_11;
          }
          --v12;
        }
        while (v15 > 0);
        LODWORD(v12) = -1;
LABEL_11:
        LODWORD(v10) = v12 - 1;
        if ((int)v12 < 1)
        {
LABEL_19:
          if ((v10 & 0x80000000) == 0)
          {
            v10 = v10;
            while (1)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v10));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v10 + 1));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
              objc_msgSend(v22, "timeIntervalSinceDate:", v24);
              v26 = fabs(v25);

              if (v26 > v11)
                break;
              v20 = v10-- <= 0;
              if (v20)
                goto LABEL_24;
            }
          }
        }
        else
        {
          v10 = (v12 - 1);
          do
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v10));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            if (objc_msgSend(v17, "isEqual:", v18))
            {

            }
            else
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v10));

              if (v19)
                goto LABEL_19;
            }
            v20 = v10-- <= 0;
          }
          while (!v20);
LABEL_24:
          LODWORD(v10) = -1;
        }
        if ((int)v10 >= (int)v12 - 1)
        {
          v33 = (_OSIntelligenceChargeSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v12));
          LODWORD(v10) = v12 - 1;
        }
        else
        {
          v41 = [_OSIntelligenceChargeSession alloc];
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v12));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startDate"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v10 + 1));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v12));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startSoC"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v10 + 1));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endSoC"));
          v33 = -[_OSIntelligenceChargeSession initWithStartDate:withEndDate:withStartSoC:withEndSoC:](v41, "initWithStartDate:withEndDate:withStartSoC:withEndSoC:", v40, v28, v30, v32);

          v8 = v39;
        }
        objc_msgSend(v8, "addObject:", v33);

      }
      while ((int)v10 > 0);
    }
    if (!(_DWORD)v10)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v8, "addObject:", v34);

    }
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "log"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (_BYTE *)objc_msgSend(v7, "count") - (_BYTE *)objc_msgSend(v8, "count")));
      *(_DWORD *)buf = 138412290;
      v44 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Concatenated %@ events", buf, 0xCu);

    }
  }
  else
  {
    v7 = v6;
    v8 = v7;
  }

  return v8;
}

+ (id)getUsageBucketsForEvents:(id)a3 forDate:(id)a4 withLog:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  void *v36;
  _UNKNOWN **v37;
  id v38;
  void *v39;
  uint64_t i;
  void *v41;
  id v43;
  id obj;
  uint64_t v45;
  id v46;
  _BYTE *v47;
  _BYTE *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  _OWORD v56[12];

  v7 = a3;
  v8 = a4;
  v43 = a5;
  memset(v56, 0, sizeof(v56));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v7;
  v46 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (!v46)
    goto LABEL_27;
  v9 = *(_QWORD *)v50;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v50 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "components:fromDate:", 112, v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "components:fromDate:", 96, v16));

      v18 = (uint64_t)objc_msgSend(v14, "hour");
      v19 = objc_msgSend(v17, "hour");
      v47 = objc_msgSend(v14, "minute");
      v48 = objc_msgSend(v17, "minute");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
      if (objc_msgSend(v20, "isDate:inSameDayAsDate:", v21, v8))
      {

        goto LABEL_22;
      }
      v45 = (uint64_t)v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
      v23 = v9;
      v24 = v8;
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "earlierDate:", v22));

      v26 = v25 == v24;
      v8 = v24;
      v9 = v23;
      if (!v26)
      {
        if (v18 < v45)
        {
          *((double *)v56 + v18) = sqrt((double)(60 - (uint64_t)v47)) + *((double *)v56 + v18);
          if (v18 + 1 < v45)
          {
            v27 = ~v18 + v45;
            v28 = (double *)v56 + v18 + 1;
            do
            {
              *v28 = *v28 + 7.74596669;
              ++v28;
              --v27;
            }
            while (v27);
          }
LABEL_21:
          *((double *)v56 + v45) = sqrt((double)(uint64_t)v48) + *((double *)v56 + v45);
          goto LABEL_22;
        }
        if (v18 > v45)
        {
          *((double *)v56 + v18) = sqrt((double)(60 - (uint64_t)v47)) + *((double *)v56 + v18);
          if (v18 <= 22)
          {
            v29 = v18 + 1;
            do
            {
              *((double *)v56 + v29) = *((double *)v56 + v29) + 7.74596669;
              ++v29;
            }
            while (v29 != 24);
          }
          if (v45 >= 1)
          {
            v30 = (double *)v56;
            v31 = v45;
            do
            {
              *v30 = *v30 + 7.74596669;
              ++v30;
              --v31;
            }
            while (v31);
          }
          goto LABEL_21;
        }
        if (v48 - v47 >= 0)
          *((double *)v56 + v18) = sqrt((double)(v48 - v47)) + *((double *)v56 + v18);
      }
LABEL_22:

      v10 = (char *)v10 + 1;
    }
    while (v10 != v46);
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    v46 = v32;
  }
  while (v32);
LABEL_27:
  v33 = 0;
  v34 = 0.0;
  do
  {
    if (*(double *)((char *)v56 + v33) > v34)
      v34 = *(double *)((char *)v56 + v33);
    v33 += 8;
  }
  while (v33 != 192);
  v35 = v43;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v34));
    *(_DWORD *)buf = 138412290;
    v54 = v36;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "maxValue in buckets = %@", buf, 0xCu);

  }
  if (v34 == 0.0)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Something went wront, maxValue is 0", buf, 2u);
    }
    v37 = &off_100065950;
  }
  else
  {
    v38 = v8;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    for (i = 0; i != 192; i += 8)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)((char *)v56 + i) / v34));
      objc_msgSend(v39, "addObject:", v41);

    }
    v37 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v39));

    v8 = v38;
  }

  return v37;
}

+ (double)hoursUntilUseFromBucketedUsage:(id)a3 withCurrentHour:(int)a4 withComponentsMinutes:(int64_t)a5
{
  double v8;
  int v9;
  int v10;
  void *v11;
  double v12;
  double v13;

  v8 = 0.0;
  v9 = 1;
  while (1)
  {
    v10 = a4 + v9;
    if (a4 + v9 > 23)
      v10 = a4 + v9 - 24;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectAtIndexedSubscript:", v10));
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    if (v13 > 0.2)
      break;
    if (v9 == 11)
      v8 = 12.0;
    if (++v9 == 12)
      return v8;
  }
  return (double)v9 + (double)a5 / -60.0;
}

+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4 withHourBinWidth:(unint64_t)a5
{
  id v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *context;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v7 = a3;
  v26 = a4;
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v26, "timeIntervalSince1970");
  v9 = v8;
  context = objc_autoreleasePoolPush();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = (uint64_t)v9;
    v14 = (double)a5 * 3600.0;
    v15 = (uint64_t)v14;
    v16 = *(_QWORD *)v29;
    if ((uint64_t)v14 >= 0)
      v17 = (uint64_t)v14;
    else
      v17 = v15 + 1;
    v18 = v13 + (v17 >> 1);
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v10);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
        objc_msgSend(v21, "timeIntervalSince1970");
        v23 = (uint64_t)v22;

        if (v13 > v23 && (v18 - v23) % 604800 <= v15)
          objc_msgSend(v27, "addObject:", v20);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
  return v27;
}

+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  unsigned int v18;
  void *v19;
  signed int v20;
  void *context;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  context = objc_autoreleasePoolPush();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate", context));
        objc_msgSend(v7, "timeIntervalSinceDate:", v14);
        v16 = v15;

        if (v16 > 0.0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
          v18 = objc_msgSend(a1, "datewiseDistanceBetweenDate:andDate:", v7, v17);

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
          v20 = objc_msgSend(a1, "datewiseDistanceBetweenDate:andDate:", v7, v19);

          if (-1227133513 * v18 + 306783378 < 0x24924925 || v20 % 7 == 0)
            objc_msgSend(v24, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(context);
  return v24;
}

+ (id)filterEvents:(id)a3 withDateDistance:(int)a4 fromDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *context;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v8 = a3;
  v9 = a5;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  context = objc_autoreleasePoolPush();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
        objc_msgSend(v9, "timeIntervalSinceDate:", v15);
        v17 = v16;

        if (v17 > 0.0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
          v19 = objc_msgSend(a1, "datewiseDistanceBetweenDate:andDate:", v9, v18);

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
          v21 = objc_msgSend(a1, "datewiseDistanceBetweenDate:andDate:", v9, v20);

          if (v19 == a4 || v21 == a4)
            objc_msgSend(v25, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(context);
  return v25;
}

+ (id)filterEvents:(id)a3 isRecentForDate:(id)a4 goingDaysBack:(int64_t)a5 useEndDate:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = objc_autoreleasePoolPush();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    v17 = (double)(uint64_t)((double)a5 * 86400.0);
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (a6)
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
        else
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate", (_QWORD)v26));
        v21 = (void *)v20;
        objc_msgSend(v10, "timeIntervalSinceDate:", v20, (_QWORD)v26);
        v23 = v22;

        if (v23 >= 0.0 && v23 <= v17)
          objc_msgSend(v11, "addObject:", v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  objc_autoreleasePoolPop(v12);
  return v11;
}

+ (id)filterEvents:(id)a3 withSameWorkOrOffStatusAs:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "isRestDay:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = objc_autoreleasePoolPush();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (v8 == objc_msgSend(a1, "isIntervalOnRestDay:", v16, (_QWORD)v18))
          objc_msgSend(v9, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  objc_autoreleasePoolPop(v10);
  return v9;
}

+ (id)filterEvents:(id)a3 withMinimumDuration:(double)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate", (_QWORD)v18));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
        objc_msgSend(v13, "timeIntervalSinceDate:", v14);
        v16 = v15;

        if (v16 >= a4)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

+ (double)medianTimeBetweenDescendingEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((int)objc_msgSend(v3, "count") >= 2)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", ++v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
      objc_msgSend(v7, "timeIntervalSinceDate:", v9);
      v11 = v10;

      if (v11 >= 0.0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
        objc_msgSend(v4, "addObject:", v12);

      }
    }
    while (v5 < (int)(objc_msgSend(v3, "count") - 1));
  }
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v4);
  v14 = v13;

  return v14;
}

+ (double)meanEventDuration:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *i;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "duration", (_QWORD)v13);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v11 = v8 / (double)(unint64_t)objc_msgSend(v4, "count");
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

+ (id)getDurationsFromEvents:(id)a3 withUnit:(double)a4 cappedAt:(double)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate", (_QWORD)v22));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        objc_msgSend(v15, "timeIntervalSinceDate:", v16);
        v18 = v17 / a4;

        if (v18 >= a5)
          v19 = a5;
        else
          v19 = v18;
        if (a5 <= 0.0)
          v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
        objc_msgSend(v8, "addObject:", v20);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)predicateForEventsWithMaximumDuration:(double)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("((endDate.timeIntervalSinceReferenceDate - startDate.timeIntervalSinceReferenceDate) <= %@)"), v3));

  return v4;
}

+ (double)sumDurationsOfEvents:(id)a3 intersectingDateRangeFrom:(id)a4 to:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  double v13;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  NSObject *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;

  v8 = a3;
  v34 = a4;
  v9 = a5;
  v10 = -[NSObject count](v8, "count");
  v33 = v9;
  if (v9
    && v34
    && v10
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "laterDate:", v9)),
        v11,
        v11 == v33))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v8;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v15)
    {
      v16 = v15;
      v32 = v8;
      v17 = *(_QWORD *)v36;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "laterDate:", v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));

          if (v22 == v23)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
            v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "laterDate:", v27));

            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "earlierDate:", v28));

            objc_msgSend(v29, "timeIntervalSinceDate:", v24);
            if (v30 >= 0.0)
            {
              v13 = v13 + v30;
            }
            else
            {
              v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v41 = v24;
                v42 = 2112;
                v43 = v29;
                _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Negative intersected duration with start date %@ and end date %@", buf, 0x16u);
              }

            }
          }
          else
          {
            v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
              *(_DWORD *)buf = 138412802;
              v41 = v25;
              v42 = 2112;
              v43 = v26;
              v44 = 2112;
              v45 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Negative event duration with start date %@ and end date %@ from event %@", buf, 0x20u);

            }
          }

        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v16);
      v8 = v32;
    }
    else
    {
      v13 = 0.0;
    }
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    v13 = 0.0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v8;
      v42 = 2112;
      v43 = v34;
      v44 = 2112;
      v45 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid argument(s): events = %@ | startDate = %@ | endDate = %@", buf, 0x20u);
    }
  }

  return v13;
}

+ (id)roundedDateFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 124, v3));

  v6 = (uint64_t)((double)((uint64_t)objc_msgSend(v5, "minute") / 30 + 1) * 30.0);
  objc_msgSend(v5, "setMinute:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", (double)(60 * v6)));

  return v8;
}

+ (double)timeInSeconds:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 224, v3));

  v6 = (double)(uint64_t)objc_msgSend(v5, "hour");
  v7 = (double)(60 * (uint64_t)objc_msgSend(v5, "minute")) + v6 * 3600.0;
  v8 = v7 + (double)(uint64_t)objc_msgSend(v5, "second");

  return v8;
}

+ (int)pandasWeekdayOf:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 512, v3));

  LODWORD(v3) = (int)(objc_msgSend(v5, "weekday") + 5) % 7;
  return (int)v3;
}

+ (BOOL)isDayOfWeek:(int)a3 atDate:(id)a4
{
  return objc_msgSend(a1, "pandasWeekdayOf:", a4) == a3;
}

+ (BOOL)isWeekday:(id)a3
{
  return (int)objc_msgSend(a1, "pandasWeekdayOf:", a3) < 5;
}

+ (double)timeOfDayWithDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  double v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 224, v3));

  v6 = objc_msgSend(v5, "hour");
  v7 = objc_msgSend(v5, "minute");
  v8 = (double)(uint64_t)v7 / 60.0 + (double)(uint64_t)v6 + (double)(uint64_t)objc_msgSend(v5, "second") / 3600.0;

  return v8;
}

+ (double)hourFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 32, v3));

  v6 = (double)(uint64_t)objc_msgSend(v5, "hour");
  return v6;
}

+ (double)maxOf:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKeyPath:", CFSTR("@max.doubleValue")));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

+ (double)meanOf:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *i;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "doubleValue", (_QWORD)v13);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v11 = v8 / (double)(unint64_t)objc_msgSend(v4, "count");
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

+ (double)standardDeviationOf:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *i;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = 0.0;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    +[OSIntelligenceUtilities meanOf:](OSIntelligenceUtilities, "meanOf:", v3);
    v6 = v5;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "doubleValue", (_QWORD)v15);
          v11 = v11 + (v13 - v6) * (v13 - v6);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    v4 = sqrt(v11 / (double)((unint64_t)objc_msgSend(v7, "count") - 1));
  }

  return v4;
}

+ (double)medianOf:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingSelector:", "compare:"));
    v5 = objc_msgSend(v4, "count");
    v6 = (unint64_t)objc_msgSend(v4, "count") >> 1;
    if ((v5 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v6));
      objc_msgSend(v7, "doubleValue");
      v12 = v13;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 1));
      objc_msgSend(v7, "doubleValue");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v6));
      objc_msgSend(v10, "doubleValue");
      v12 = (v9 + v11) * 0.5;

    }
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

+ (double)meanAbsoluteDeviationOf:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  unint64_t v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "meanOf:", v4);
    v6 = v5;
    v7 = objc_msgSend(v4, "mutableCopy");
    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
        objc_msgSend(v9, "doubleValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", vabdd_f64(v10, v6)));
        objc_msgSend(v7, "setObject:atIndexedSubscript:", v11, v8);

        ++v8;
      }
      while ((unint64_t)objc_msgSend(v7, "count") > v8);
    }
    objc_msgSend(a1, "meanOf:", v7);
    v13 = v12;

  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

+ (double)qthPercentileOf:(id)a3 withQ:(double)a4
{
  id v5;
  id v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = 0.0;
  if (a4 <= 100.0 && a4 >= 0.0 && v6 != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingSelector:", "compare:"));
    v10 = v9;
    if (a4 >= 2.22044605e-16)
    {
      v12 = 100.0 - a4;
      if (100.0 - a4 >= 2.22044605e-16)
      {
        v13 = (double)((unint64_t)objc_msgSend(v5, "count", v12) - 1) * a4 / 100.0;
        v14 = vcvtmd_s64_f64(v13);
        if ((char *)objc_msgSend(v10, "count") - 1 > (char *)v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v14));
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          v18 = v13 - (double)v14;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v14 + 1));
          objc_msgSend(v19, "doubleValue");
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v14));
          objc_msgSend(v22, "doubleValue");
          v24 = v21 - v23;

          v7 = v17 + v18 * v24;
LABEL_13:

          goto LABEL_14;
        }
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject", v12));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    }
    v25 = v11;
    objc_msgSend(v11, "doubleValue");
    v7 = v26;

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

+ (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 32, v5));

  v8 = (double)(uint64_t)objc_msgSend(v7, "hour") / (double)a4;
  return v8;
}

+ (id)events:(id)a3 forHourBin:(unint64_t)a4 date:(id)a5 withMaxDuration:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v32 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "components:fromDate:", 32, v11));

  v31 = v13;
  v14 = objc_msgSend(v13, "hour");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = (unint64_t)(double)(uint64_t)v14 / a4;
    v20 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
        objc_msgSend(a1, "getHourBinID:forHourBin:", v23, a4);
        if (v19 == (unint64_t)v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "endDate"));
          objc_msgSend(v25, "timeIntervalSinceDate:", v23);
          v27 = v26 / 3600.0;

          if (v27 >= a6)
            v28 = a6;
          else
            v28 = v27;
          if (a6 <= 0.0)
            v28 = v27;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
          objc_msgSend(v15, "addObject:", v29);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v18);
  }

  return v15;
}

+ (unint64_t)decileClassificationWithTopBinCutOff:(float *)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  unint64_t v11;
  _BYTE v13[808];

  bzero(v13, 0x328uLL);
  objc_msgSend(a1, "getBatteryLevelDurations:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "percentageOfTimeForBatteryLevels:withLog:", v13, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 3));
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  v11 = 0;
  while (v10 <= a3[v11] || v10 > a3[v11 + 1])
  {
    if (++v11 == 11)
    {
      v11 = 0;
      break;
    }
  }

  return v11;
}

+ (id)filterEventsSortedByStartDateAscending:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withHourBinWidth:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *context;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v39 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeZone"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", (double)(uint64_t)objc_msgSend(v13, "secondsFromGMT")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeZone"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", (double)(uint64_t)objc_msgSend(v15, "secondsFromGMT")));

  v37 = (void *)v14;
  v40 = v12;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "components:fromDate:", 96, v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateFromComponents:"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateByAddingTimeInterval:", 86400.0));
  context = objc_autoreleasePoolPush();
  if (objc_msgSend(v9, "count"))
  {
    v18 = 0;
    v19 = (double)a6 * 1800.0;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v18));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));

      if (v18)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", (v18 - 1)));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "endDate"));

      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
      }
      objc_msgSend(v21, "timeIntervalSinceDate:", v23);
      if (v24 >= 0.0)
      {
        objc_msgSend(v21, "timeIntervalSinceDate:", v16);
        if (v25 < 0.0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "components:fromDate:", 96, v21));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dateFromComponents:", v26));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dateByAddingTimeInterval:", 86400.0));
          objc_msgSend(v27, "timeIntervalSinceDate:", v17);
          if (v29 < 0.0)
            v29 = -v29;
          if (v29 < v19)
            goto LABEL_17;
          objc_msgSend(v28, "timeIntervalSinceDate:", v17);
          if (v30 < 0.0)
            v30 = -v30;
          if (v30 < v19)
            goto LABEL_17;
          objc_msgSend(v27, "timeIntervalSinceDate:", v38);
          if (v31 < 0.0)
            v31 = -v31;
          if (v31 < v19)
          {
LABEL_17:
            v32 = v16;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v18));
            objc_msgSend(v39, "addObject:", v33);

            v16 = v32;
          }

        }
      }

      ++v18;
    }
    while ((unint64_t)objc_msgSend(v9, "count") > v18);
  }
  objc_autoreleasePoolPop(context);

  return v39;
}

+ (void)setString:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)a5);
}

+ (id)readStringForPreferenceKey:(id)a3 inDomain:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
}

+ (void)setDate:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  __CFString *v7;
  NSNumber *v8;
  __CFString *key;

  key = (__CFString *)a4;
  v7 = (__CFString *)a5;
  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    v8 = 0;
  }
  CFPreferencesSetAppValue(key, v8, v7);

}

+ (id)dateForPreferenceKey:(id)a3 inDomain:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)setNumber:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)a5);
}

+ (id)numberForPreferenceKey:(id)a3 inDomain:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
}

+ (void)setDict:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)a5);
}

+ (id)readDictForPreferenceKey:(id)a3 inDomain:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
}

+ (id)getTestVector:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  _UNKNOWN **v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;

  v3 = a3;
  v46 = 0;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(\".+?),(.+?\")"), 1, &v46));
  v4 = v46;
  v45 = v4;
  v40 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfURL:encoding:error:](NSString, "stringWithContentsOfURL:encoding:error:", v3, 1, &v45));
  v39 = v45;

  v6 = objc_alloc_init((Class)NSNumberFormatter);
  objc_msgSend(v6, "setNumberStyle:", 1);
  v38 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(",")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)objc_msgSend(v7, "count") - 1));
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v12, v11);

      ++v11;
    }
    while ((unint64_t)objc_msgSend(v9, "count") > v11);
  }
  if ((char *)objc_msgSend(v7, "count") - 3 <= (char *)0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = 1;
    v41 = v7;
    while (1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v13));
      v44 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringByReplacingMatchesInString:options:range:withTemplate:", v14, 0, 0, objc_msgSend(v15, "length"), CFSTR("$1.$2")));

      v43 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(",")));
      if (objc_msgSend(v9, "count"))
        break;
LABEL_17:

      v13 = v44 + 1;
      v7 = v41;
      if ((char *)objc_msgSend(v41, "count") - 1 <= (char *)(v44 + 1))
        goto LABEL_18;
    }
    v18 = 0;
    v19 = v44 - 1;
    while (1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v18));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "numberFromString:", v20));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v18));
      v23 = v22;
      if (v21)
        break;
      v26 = objc_msgSend(v22, "isEqualToString:", CFSTR("True"));

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v18));
        v23 = v27;
        v28 = &off_100064E50;
        goto LABEL_14;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v18));
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("False"));

      if (v30)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v18));
        v23 = v27;
        v28 = &off_100064E38;
LABEL_14:
        objc_msgSend(v27, "setObject:atIndexedSubscript:", v28, v19);
LABEL_15:

      }
      if ((unint64_t)objc_msgSend(v9, "count") <= ++v18)
        goto LABEL_17;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "numberFromString:", v22));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v18));
    objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, v19);

    goto LABEL_15;
  }
LABEL_18:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v9, "count"))
  {
    v32 = 0;
    do
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v32));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v33));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v32));
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, v35);

      ++v32;
    }
    while ((unint64_t)objc_msgSend(v9, "count") > v32);
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v31));

  return v36;
}

+ (id)loadCompiledModelFromPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.osintelligence.loadModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10003FB20();

  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v6, &v13));
  v9 = v13;
  if (v9 || !v8)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10003FAB8();

    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

@end
