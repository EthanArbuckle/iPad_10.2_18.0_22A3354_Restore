@implementation WAIOReporterMessagePopulator

- (WAIOReporterMessagePopulator)init
{
  WAIOReporterMessagePopulator *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDate *pidLaunchDate;
  NSString *drvName;
  NSNumber *providerNum;
  dispatch_queue_attr_t v13;
  NSObject *p_super;
  NSObject *v15;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;

  v18.receiver = self;
  v18.super_class = (Class)WAIOReporterMessagePopulator;
  v2 = -[WAIOReporterMessagePopulator init](&v18, "init");
  if (v2)
  {
    if (qword_1000ECF98 != -1)
      dispatch_once(&qword_1000ECF98, &stru_1000CCCF0);
    if (qword_1000ECF80 != -1)
      dispatch_once(&qword_1000ECF80, &stru_1000CCC90);
    if (qword_1000ECF88 != -1)
      dispatch_once(&qword_1000ECF88, &stru_1000CCCB0);
    if (qword_1000ECF90 != -1)
      dispatch_once(&qword_1000ECF90, &stru_1000CCCD0);
    v3 = objc_alloc_init((Class)NSMutableArray);
    -[WAIOReporterMessagePopulator setCachedPredicatesNotYetFound:](v2, "setCachedPredicatesNotYetFound:", v3);

    v4 = objc_alloc_init((Class)NSMutableDictionary);
    -[WAIOReporterMessagePopulator setCachedUsage:](v2, "setCachedUsage:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dunno")));
    -[WAIOReporterMessagePopulator setInfraInterfaceName:](v2, "setInfraInterfaceName:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](RecommendationPreferences, "sharedObject"));
    -[WAIOReporterMessagePopulator setPreferences:](v2, "setPreferences:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator preferences](v2, "preferences"));
    if (v7)
    {
      *(_WORD *)&v2->_ioReportersCacheNeedsUpdating = 0;
      v2->_persistFileExistedAtPIDLoad = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v2->_pid = objc_msgSend(v8, "processIdentifier");

      v9 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      pidLaunchDate = v2->_pidLaunchDate;
      v2->_pidLaunchDate = (NSDate *)v9;

      v2->_srv = 0;
      drvName = v2->_drvName;
      v2->_drvName = 0;

      providerNum = v2->_providerNum;
      v2->_providerNum = 0;

      v2->_wlanType = 0;
      v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      p_super = objc_claimAutoreleasedReturnValue(v13);
      v15 = dispatch_queue_create("com.apple.wifi.analytics.IOReporterQ", p_super);
      -[WAIOReporterMessagePopulator setQueue:](v2, "setQueue:", v15);
    }
    else
    {
      v17 = WALogCategoryDefaultHandle();
      v15 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[WAIOReporterMessagePopulator init]";
        v21 = 1024;
        v22 = 327;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error RecommendationPreferences init", buf, 0x12u);
      }
      p_super = &v2->super;
      v2 = 0;
    }

  }
  else
  {
    p_super = 0;
  }

  return v2;
}

- (unsigned)_getIOServiceWithForceRefresh:(BOOL)a3 apple80211:(id)a4
{
  id v6;
  unsigned int srv;
  id v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;

  v6 = a4;
  if (a3 || (srv = self->_srv) == 0)
  {
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Fetch IOService Calls"), self->_cachedUsage, self->_queue);
    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446466;
      v12 = "-[WAIOReporterMessagePopulator _getIOServiceWithForceRefresh:apple80211:]";
      v13 = 1024;
      v14 = 359;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Getting _srv", (uint8_t *)&v11, 0x12u);
    }

    srv = objc_msgSend(v6, "getIOReportingService");
    self->_srv = srv;
  }

  return srv;
}

- (unsigned)_getCCPipeDriverForWLAN
{
  CFMutableDictionaryRef v2;
  CFMutableDictionaryRef v3;
  io_registry_entry_t v4;
  const __CFString *v5;
  CFTypeID v6;
  CFTypeID v7;
  id v8;
  NSObject *v9;
  id v10;
  id v12;
  NSObject *v13;
  const char *v14;
  id v15;
  NSObject *v16;
  id v17;
  mach_port_t mainPort[2];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;

  *(_QWORD *)mainPort = 0;
  v2 = IOServiceNameMatching("CCPipe");
  if (!v2)
  {
    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
      v21 = 1024;
      v22 = 375;
      v14 = "%{public}s::%d:IOServiceMatching failed";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    }
LABEL_30:

LABEL_31:
    v4 = 0;
    goto LABEL_21;
  }
  v3 = v2;
  if (IOMainPort(0, &mainPort[1]))
  {
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
      v21 = 1024;
      v22 = 378;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOMasterPort failed", buf, 0x12u);
    }

    CFRelease(v3);
    goto LABEL_31;
  }
  if (IOServiceGetMatchingServices(mainPort[1], v3, mainPort))
  {
    v17 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
      v21 = 1024;
      v22 = 381;
      v14 = "%{public}s::%d:IOServiceGetMatchingServices failed";
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v4 = IOIteratorNext(mainPort[0]);
  if (v4)
  {
    while (1)
    {
      v5 = (const __CFString *)IORegistryEntrySearchCFProperty(v4, "IOService", CFSTR("LogIdentifier"), kCFAllocatorDefault, 3u);
      v6 = CFGetTypeID(v5);
      if (v6 == CFStringGetTypeID() && CFStringCompare(v5, CFSTR("wlan0"), 0) == kCFCompareEqualTo)
      {
        v8 = WALogCategoryDefaultHandle();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_20;
        *(_DWORD *)buf = 136446722;
        v20 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
        v21 = 1024;
        v22 = 390;
        v23 = 2112;
        v24 = v5;
        goto LABEL_19;
      }
      if (v5)
        CFRelease(v5);
      v5 = (const __CFString *)IORegistryEntrySearchCFProperty(v4, "IOService", CFSTR("Owner"), kCFAllocatorDefault, 3u);
      v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID()
        && CFStringCompare(v5, CFSTR("com.apple.driver.ACIWiFiDriver"), 0) == kCFCompareEqualTo)
      {
        break;
      }
      if (v5)
        CFRelease(v5);
      v4 = IOIteratorNext(mainPort[0]);
      if (!v4)
        goto LABEL_21;
    }
    v10 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_20;
    *(_DWORD *)buf = 136446722;
    v20 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
    v21 = 1024;
    v22 = 403;
    v23 = 2112;
    v24 = v5;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found Match %@", buf, 0x1Cu);
LABEL_20:

    CFRelease(v5);
  }
LABEL_21:
  IOObjectRelease(mainPort[0]);
  return v4;
}

- (void)freeIORCaches
{
  char *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  v3 = (char *)os_signpost_id_generate((os_log_t)WALogCategoryDefault);
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v3, "IOR freeIORCaches", ", buf, 2u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001477C;
  v8[3] = &unk_1000CCD38;
  objc_copyWeak(v9, &location);
  v9[1] = v3;
  dispatch_sync(v7, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_freeIORCaches
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446722;
    v10 = "-[WAIOReporterMessagePopulator _freeIORCaches]";
    v11 = 1024;
    v12 = 436;
    v13 = 2080;
    v14 = "-[WAIOReporterMessagePopulator _freeIORCaches]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s", (uint8_t *)&v9, 0x1Cu);
  }

  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR _freeIORCaches", ", (uint8_t *)&v9, 2u);
  }

  -[WAIOReporterMessagePopulator setCachedChannelsCountPerIORPopulatable:](self, "setCachedChannelsCountPerIORPopulatable:", 0);
  -[WAIOReporterMessagePopulator setCachedIOPopAvailableChannels:](self, "setCachedIOPopAvailableChannels:", 0);
  -[WAIOReporterMessagePopulator setCachedIOReportSubbedChannels:](self, "setCachedIOReportSubbedChannels:", 0);
  -[WAIOReporterMessagePopulator setCachedIOReportSample:](self, "setCachedIOReportSample:", 0);
  v7 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR _freeIORCaches", ", (uint8_t *)&v9, 2u);
  }

}

- (void)_freeSubscriptionSample:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;

  v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 136446722;
    v33 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
    v34 = 1024;
    v35 = 449;
    v36 = 2112;
    v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Clearing cachedIOReportSubbedChannels and cachedIOReportSample for %@", (uint8_t *)&v32, 0x1Cu);
  }

  v7 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v32) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR _freeSubscriptionSample", ", (uint8_t *)&v32, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](self, "cachedIOReportSubbedChannels"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("iorsub")));

  if (v11)
  {
    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 136446722;
      v33 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      v34 = 1024;
      v35 = 453;
      v36 = 2112;
      v37 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Freeing cachedIOReportSubbedChannels iorsub for %@", (uint8_t *)&v32, 0x1Cu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](self, "cachedIOReportSubbedChannels"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v4));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("iorsub"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v4));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("sampleValues")));

  if (v18)
  {
    v19 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 136446722;
      v33 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      v34 = 1024;
      v35 = 458;
      v36 = 2112;
      v37 = v4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Freeing cachedIOReportSample sampleValues for %@", (uint8_t *)&v32, 0x1Cu);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v4));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, CFSTR("sampleValues"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v4));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("structuredDict")));

  if (v25)
  {
    v26 = WALogCategoryDefaultHandle();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 136446722;
      v33 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      v34 = 1024;
      v35 = 463;
      v36 = 2112;
      v37 = v4;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Freeing cachedIOReportSample structuredDict for %@", (uint8_t *)&v32, 0x1Cu);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v4));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, CFSTR("structuredDict"));

  }
  v30 = WALogCategoryDefaultHandle();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_signpost_enabled(v31))
  {
    LOWORD(v32) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR _freeSubscriptionSample", ", (uint8_t *)&v32, 2u);
  }

}

- (BOOL)runIOLegendTest
{
  NSObject *v3;
  _QWORD block[5];
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  id location;

  objc_initWeak(&location, self);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014F0C;
  block[3] = &unk_1000CCD60;
  objc_copyWeak(&v6, &location);
  block[4] = &v7;
  dispatch_sync(v3, block);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&location);
  return (char)v3;
}

- (BOOL)_runIOLegendTest
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  id v29;
  id v31;
  NSObject *v32;
  id v33;
  void *context;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
    v42 = 1024;
    v43 = 488;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:runIOLegendTest starting", buf, 0x12u);
  }

  if (!self->_hasAttemptedUnpersisting)
    -[WAIOReporterMessagePopulator _unpersistIORObjects](self, "_unpersistIORObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getInfraApple80211"));

  if (v6)
  {
    v7 = (void *)v36;
    *(_QWORD *)&v36 = CFSTR("Interface en");

    v8 = (void *)*((_QWORD *)&v36 + 1);
    *((_QWORD *)&v36 + 1) = CFSTR("Peer");

    v9 = (void *)v37;
    *(_QWORD *)&v37 = CFSTR("00:00:00:00:00:00");

    v10 = (void *)*((_QWORD *)&v38 + 1);
    *((_QWORD *)&v38 + 1) = CFSTR("DataPath");

    context = objc_autoreleasePoolPush();
    v35 = 0;
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Legend Query Calls"), self->_cachedUsage, self->_queue);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getIOReportLegendItemsMatching:retErr:", &v36, &v35));
    if (v35 == 1)
    {
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Legend Query Failed"), self->_cachedUsage, self->_queue);
      -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:](self, "_incrementPredicateCachedUsageWithPrefix:q:", CFSTR("Failed Pred: "), &v36);
      v12 = WALogCategoryDefaultHandle();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        v42 = 1024;
        v43 = 512;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:legendFetchError with getIOReportLegendItemsMatching", buf, 0x12u);
      }

    }
    if (!objc_msgSend(v11, "count"))
      -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:](self, "_incrementPredicateCachedUsageWithPrefix:q:", CFSTR("Zero Results Pred: "), &v36);
    v33 = objc_msgSend(v11, "count");
    if (v33)
    {
      v14 = 100;
      do
      {
        v15 = WALogCategoryDefaultHandle();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR getIOReportLegendItemsMatching", ", buf, 2u);
        }

        +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Legend Query Calls"), self->_cachedUsage, self->_queue);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getIOReportLegendItemsMatching:retErr:", &v36, &v35));

        if (v35 == 1)
        {
          +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Legend Query Failed"), self->_cachedUsage, self->_queue);
          -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:](self, "_incrementPredicateCachedUsageWithPrefix:q:", CFSTR("Failed Pred: "), &v36);
          v18 = WALogCategoryDefaultHandle();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
            v42 = 1024;
            v43 = 529;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:legendFetchError with getIOReportLegendItemsMatching", buf, 0x12u);
          }

        }
        if (!objc_msgSend(v17, "count", v33))
        {
          -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:](self, "_incrementPredicateCachedUsageWithPrefix:q:", CFSTR("Zero Results Pred: "), &v36);
          v20 = WALogCategoryDefaultHandle();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
            v42 = 1024;
            v43 = 534;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find requests from query", buf, 0x12u);
          }

        }
        v22 = WALogCategoryDefaultHandle();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR getIOReportLegendItemsMatching", ", buf, 2u);
        }

        v11 = v17;
        --v14;
      }
      while (v14);
    }
    else
    {
      v31 = WALogCategoryDefaultHandle();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        v42 = 1024;
        v43 = 517;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:getIOReportLegendItemsMatching returned 0 size", buf, 0x12u);
      }

      v17 = v11;
    }

    objc_autoreleasePoolPop(context);
    if (v33)
    {
      v24 = WALogCategoryDefaultHandle();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        v42 = 1024;
        v43 = 543;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:runIOLegendTest complete: success", buf, 0x12u);
      }
      v26 = 1;
      goto LABEL_37;
    }
  }
  else
  {
    v27 = WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
      v42 = 1024;
      v43 = 495;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", buf, 0x12u);
    }

  }
  v29 = WALogCategoryDefaultHandle();
  v25 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
    v42 = 1024;
    v43 = 547;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:runIOLegendTest failed", buf, 0x12u);
  }
  v26 = 0;
LABEL_37:

  sub_1000155DC((id *)&v36);
  return v26;
}

- (unsigned)doesChannelExistInStructuredDict:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  const char *v36;
  id v37;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", &off_1000E0020));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("structuredDict")));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v12));
  if (!v19)
    goto LABEL_16;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v12));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v14));

  if (!v21)
  {
    v19 = 0;
    goto LABEL_17;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v12));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v14));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v15));

  if (!v24)
    goto LABEL_15;
  if ((unint64_t)objc_msgSend(v13, "count") <= 1)
  {
    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[WAIOReporterMessagePopulator doesChannelExistInStructuredDict:providerName:legCh:groupName:subgroupName:chinfo:]";
      v42 = 1024;
      v43 = 571;
      v36 = "%{public}s::%d:legCh is not >= 2";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v36, buf, 0x12u);
    }
LABEL_14:

LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 2));
  if (!v25)
  {
    v37 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[WAIOReporterMessagePopulator doesChannelExistInStructuredDict:providerName:legCh:groupName:subgroupName:chinfo:]";
      v42 = 1024;
      v43 = 573;
      v36 = "%{public}s::%d:chName not valid";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v19 = (void *)v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v12));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v14));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v15));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v19));

  if (!v29)
  {
LABEL_16:
    LOBYTE(v21) = 0;
    goto LABEL_17;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
  v39 = objc_msgSend(v30, "unsignedLongLongValue");

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v12));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v14));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v15));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v19));

  LOBYTE(v21) = v39 == (id)IOReportChannelGetChannelID(v33);
LABEL_17:

  return v21;
}

- (unsigned)doesDriverHaveChannelsInStructuredDict:(int64_t)a3 containsStale:(char *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  io_registry_entry_t v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  const char *v41;
  id v42;
  const char *v43;
  id v44;
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  NSObject *v51;
  void *v53;
  id obj;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t entryID;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int64_t v67;
  __int16 v68;
  void *v69;
  char v70[128];
  io_name_t name;

  entryID = 0;
  *a4 = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  if (!v6)
    return v6;
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", &off_1000E0020));
  if (!v9)
  {

    goto LABEL_9;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", &off_1000E0020));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("structuredDict")));

  if (!v13)
    goto LABEL_52;
  memset(name, 0, sizeof(name));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", &off_1000E0020));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("structuredDict")));

  if (a3 != 1)
  {
    if (a3)
    {
      v17 = 0;
      goto LABEL_35;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getInfraApple80211"));

    if (v17)
    {
      v18 = objc_msgSend(v17, "getIOReportingService");
      goto LABEL_11;
    }
    v50 = WALogCategoryDefaultHandle();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
      v64 = 1024;
      v65 = 614;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", buf, 0x12u);
    }

LABEL_9:
    goto LABEL_52;
  }
  v18 = -[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN](self, "_getCCPipeDriverForWLAN");
  v17 = 0;
LABEL_11:
  if (!v18)
  {
LABEL_35:
    v39 = WALogCategoryDefaultHandle();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
LABEL_38:

      goto LABEL_52;
    }
    *(_DWORD *)buf = 136446722;
    v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    v64 = 1024;
    v65 = 624;
    v66 = 2048;
    v67 = a3;
    v41 = "%{public}s::%d:Can't find io_service_t for driver %ld";
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v41, buf, 0x1Cu);
    goto LABEL_38;
  }
  if (IORegistryEntryGetRegistryEntryID(v18, &entryID))
  {
    v48 = WALogCategoryDefaultHandle();
    v40 = objc_claimAutoreleasedReturnValue(v48);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_DWORD *)buf = 136446722;
    v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    v64 = 1024;
    v65 = 626;
    v66 = 2048;
    v67 = a3;
    v41 = "%{public}s::%d:Can't call IORegistryEntryGetRegistryEntryID on driver %ld";
    goto LABEL_37;
  }
  if (IORegistryEntryGetName(v18, name))
  {
    v49 = WALogCategoryDefaultHandle();
    v40 = objc_claimAutoreleasedReturnValue(v49);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_DWORD *)buf = 136446722;
    v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    v64 = 1024;
    v65 = 628;
    v66 = 2048;
    v67 = a3;
    v41 = "%{public}s::%d:Can't call IORegistryEntryGetName on driver %ld";
    goto LABEL_37;
  }
  v53 = v17;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", name, 4));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (!v19)
    goto LABEL_51;
  v20 = v19;
  v21 = *(_QWORD *)v58;
  while (2)
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(_QWORD *)v58 != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v23));

      if (!v24)
      {
        v42 = WALogCategoryDefaultHandle();
        v29 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          v64 = 1024;
          v65 = 638;
          v66 = 2112;
          v67 = (int64_t)v23;
          v43 = "%{public}s::%d:Issue strDict[foundDriver] %@ doesnt have value";
          goto LABEL_43;
        }
LABEL_50:

        goto LABEL_51;
      }
      if (objc_msgSend(v23, "containsString:", v56))
      {
        v25 = WALogCategoryDefaultHandle();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          v64 = 1024;
          v65 = 641;
          v66 = 2112;
          v67 = (int64_t)v56;
          v68 = 2112;
          v69 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found matching driver name %@ in dict as %@", buf, 0x26u);
        }

        *a4 = 1;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v23));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectEnumerator"));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "nextObject"));

      if (!v29)
      {
        v44 = WALogCategoryDefaultHandle();
        v29 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          v64 = 1024;
          v65 = 646;
          v66 = 2112;
          v67 = (int64_t)v23;
          v43 = "%{public}s::%d:Issue firstGroup %@ doesnt have value";
LABEL_43:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v43, buf, 0x1Cu);
        }
        goto LABEL_50;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectEnumerator](v29, "objectEnumerator"));
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "nextObject"));

      if (!v31)
      {
        v45 = WALogCategoryDefaultHandle();
        v31 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          v64 = 1024;
          v65 = 649;
          v66 = 2112;
          v67 = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:Issue firstSubGroup %@ doesnt have value", buf, 0x1Cu);
        }
        goto LABEL_49;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectEnumerator](v31, "objectEnumerator"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "nextObject"));

      if (!v33)
      {
        v46 = WALogCategoryDefaultHandle();
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          v64 = 1024;
          v65 = 652;
          v66 = 2112;
          v67 = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:Issue firstChannel %@ doesnt have value", buf, 0x1Cu);
        }

LABEL_49:
        goto LABEL_50;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("DriverID")));
      v35 = objc_msgSend(v34, "unsignedLongLongValue");
      v36 = entryID;

      if (v35 == (id)v36)
      {
        v37 = WALogCategoryDefaultHandle();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446722;
          v63 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          v64 = 1024;
          v65 = 655;
          v66 = 2112;
          v67 = (int64_t)v33;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found matching firstChannel %@ with matching drvID", buf, 0x1Cu);
        }

        *a4 = 0;
        LOBYTE(v6) = 1;
        return v6;
      }

    }
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v20)
      continue;
    break;
  }
LABEL_51:

LABEL_52:
  LOBYTE(v6) = 0;
  return v6;
}

- (id)createChannelWithProviderID:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  NSObject *v25;
  const char *v26;
  id v27;
  id v28;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if ((unint64_t)objc_msgSend(v15, "count") <= 1)
  {
    v24 = WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v29 = 136446466;
      v30 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
      v31 = 1024;
      v32 = 673;
      v26 = "%{public}s::%d:legCh is not >= 2";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v29, 0x12u);
    }
  }
  else
  {
    v19 = objc_alloc_init((Class)NSMutableDictionary);
    if (v19)
    {
      v20 = v19;
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, CFSTR("DriverID"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("DriverName"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, CFSTR("LegendChannel"));
      if (v16)
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("IOReportGroupName"));
      if (v17)
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, CFSTR("IOReportSubGroupName"));
      if (v18)
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("IOReportChannelInfo"));
      v21 = v20;
      v22 = v21;
      goto LABEL_10;
    }
    v27 = WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v29 = 136446466;
      v30 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
      v31 = 1024;
      v32 = 676;
      v26 = "%{public}s::%d:failed to alloc newch";
      goto LABEL_15;
    }
  }

  v28 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v29 = 136446466;
    v30 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
    v31 = 1024;
    v32 = 700;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create IOReportChannelRef", (uint8_t *)&v29, 0x12u);
  }
  v22 = 0;
LABEL_10:

  return v22;
}

- (void)_incrementPredicateCachedUsageWithPrefix:(id)a3 q:(id *)a4
{
  const __CFString *var7;
  const __CFString *var0;
  const __CFString *var1;
  const __CFString *var2;
  const __CFString *var3;
  const __CFString *var4;
  const __CFString *var5;
  const __CFString *var6;
  void *v13;

  var7 = &stru_1000CF640;
  var0 = (const __CFString *)a4->var0;
  var1 = (const __CFString *)a4->var1;
  if (!a4->var0)
    var0 = &stru_1000CF640;
  if (!var1)
    var1 = &stru_1000CF640;
  var2 = (const __CFString *)a4->var2;
  var3 = (const __CFString *)a4->var3;
  if (!var2)
    var2 = &stru_1000CF640;
  if (!var3)
    var3 = &stru_1000CF640;
  var4 = (const __CFString *)a4->var4;
  var5 = (const __CFString *)a4->var5;
  if (!var4)
    var4 = &stru_1000CF640;
  if (!var5)
    var5 = &stru_1000CF640;
  var6 = (const __CFString *)a4->var6;
  if (!var6)
    var6 = &stru_1000CF640;
  if (a4->var7)
    var7 = (const __CFString *)a4->var7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ G: %@,%@,%@,%@ g: %@,%@,%@,%@"), a3, var0, var1, var2, var3, var4, var5, var6, var7));
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", v13, self->_cachedUsage, self->_queue);

}

- (id)_buildPredicateList:(int64_t)a3 wlan:(int64_t)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  id result;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *k;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *n;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *jj;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *mm;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  id v44;
  NSObject *v45;
  id v46;
  const char *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *m;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *ii;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  void *kk;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint8_t v113[128];
  uint8_t buf[4];
  const char *v115;
  __int16 v116;
  int v117;
  _BYTE v118[128];
  _BYTE v119[128];

  switch(a3)
  {
    case 0:
      v6 = objc_msgSend((id)qword_1000ECF68, "mutableCopy");
      if (a4 == 1)
      {
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v7 = (NSMutableArray *)(id)qword_1000ECF78;
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v100;
          do
          {
            for (i = 0; i != v41; i = (char *)i + 1)
            {
              if (*(_QWORD *)v100 != v42)
                objc_enumerationMutation(v7);
              objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i));
            }
            v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
          }
          while (v41);
        }
      }
      else if (a4 == 2)
      {
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v7 = (NSMutableArray *)(id)qword_1000ECF70;
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v103, v119, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v104;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(_QWORD *)v104 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)j));
            }
            v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v103, v119, 16);
          }
          while (v9);
        }
      }
      else
      {
        v44 = WALogCategoryDefaultHandle();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v115 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          v116 = 1024;
          v117 = 746;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
        }

        v46 = WALogCategoryDefaultHandle();
        v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v47 = "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchAllStaticPredicates";
          goto LABEL_108;
        }
      }
      goto LABEL_105;
    case 1:
      v6 = objc_alloc_init((Class)NSMutableArray);
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v13 = (id)qword_1000ECF68;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v96;
        do
        {
          for (k = 0; k != v15; k = (char *)k + 1)
          {
            if (*(_QWORD *)v96 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)k);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("mutates")));

            if (v19)
              objc_msgSend(v6, "addObject:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
        }
        while (v15);
      }

      if (a4 == 1)
      {
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v20 = (id)qword_1000ECF78;
        v48 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v88;
          do
          {
            for (m = 0; m != v49; m = (char *)m + 1)
            {
              if (*(_QWORD *)v88 != v50)
                objc_enumerationMutation(v20);
              v52 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)m);
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("mutates")));

              if (v53)
                objc_msgSend(v6, "addObject:", v52);
            }
            v49 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
          }
          while (v49);
        }
      }
      else if (a4 == 2)
      {
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v20 = (id)qword_1000ECF70;
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v92;
          do
          {
            for (n = 0; n != v22; n = (char *)n + 1)
            {
              if (*(_QWORD *)v92 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)n);
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("mutates")));

              if (v26)
                objc_msgSend(v6, "addObject:", v25);
            }
            v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
          }
          while (v22);
        }
      }
      else
      {
        v54 = WALogCategoryDefaultHandle();
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v115 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          v116 = 1024;
          v117 = 790;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchUnfoundAndMutablePredicates", buf, 0x12u);
        }

        v56 = WALogCategoryDefaultHandle();
        v20 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchUnfoundAndMutablePredicates", buf, 2u);
        }
      }

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v7 = self->_cachedPredicatesNotYetFound;
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v83, v110, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v84;
        do
        {
          for (ii = 0; ii != v58; ii = (char *)ii + 1)
          {
            if (*(_QWORD *)v84 != v59)
              objc_enumerationMutation(v7);
            v61 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)ii);
            if ((objc_msgSend(v6, "containsObject:", v61) & 1) == 0)
              objc_msgSend(v6, "addObject:", v61);
          }
          v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v83, v110, 16);
        }
        while (v58);
      }
      goto LABEL_105;
    case 2:
      return -[NSMutableArray copy](self->_cachedPredicatesNotYetFound, "copy");
    case 3:
      v6 = objc_alloc_init((Class)NSMutableArray);
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v27 = (id)qword_1000ECF68;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v109, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v80;
        do
        {
          for (jj = 0; jj != v29; jj = (char *)jj + 1)
          {
            if (*(_QWORD *)v80 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)jj);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("mutates")));

            if (v33)
              objc_msgSend(v6, "addObject:", v32);
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v109, 16);
        }
        while (v29);
      }

      if (a4 == 1)
      {
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v7 = (NSMutableArray *)(id)qword_1000ECF78;
        v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v71, v107, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v72;
          do
          {
            for (kk = 0; kk != v63; kk = (char *)kk + 1)
            {
              if (*(_QWORD *)v72 != v64)
                objc_enumerationMutation(v7);
              v66 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)kk);
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("mutates"), (_QWORD)v71));

              if (v67)
                objc_msgSend(v6, "addObject:", v66);
            }
            v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v71, v107, 16);
          }
          while (v63);
        }
      }
      else if (a4 == 2)
      {
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v7 = (NSMutableArray *)(id)qword_1000ECF70;
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v75, v108, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v76;
          do
          {
            for (mm = 0; mm != v35; mm = (char *)mm + 1)
            {
              if (*(_QWORD *)v76 != v36)
                objc_enumerationMutation(v7);
              v38 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)mm);
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("mutates")));

              if (v39)
                objc_msgSend(v6, "addObject:", v38);
            }
            v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v75, v108, 16);
          }
          while (v35);
        }
      }
      else
      {
        v68 = WALogCategoryDefaultHandle();
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v115 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          v116 = 1024;
          v117 = 844;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchMutablePredicates", buf, 0x12u);
        }

        v70 = WALogCategoryDefaultHandle();
        v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v47 = "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchMutablePredicates";
LABEL_108:
          _os_log_fault_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_FAULT, v47, buf, 2u);
        }
      }
LABEL_105:

      result = v6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unint64_t)_addDriverChannelsMatchingPredicateList:(int64_t)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  WAIOReporterMessagePopulator *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  unsigned int srv;
  unsigned int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  NSString *v16;
  NSString *drvName;
  id v18;
  NSNumber *v19;
  NSNumber *providerNum;
  NSString *v21;
  NSString *drvPath;
  id v23;
  __int128 v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  void *v44;
  BOOL v45;
  uint64_t v46;
  void *v47;
  void *v48;
  BOOL v49;
  uint64_t v50;
  void *v51;
  void *v52;
  BOOL v53;
  uint64_t v54;
  void *v55;
  void *v56;
  BOOL v57;
  uint64_t v58;
  void *v59;
  id v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  id v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  NSMutableArray *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  id v74;
  void *k;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  NSObject *v82;
  id v83;
  uint64_t v84;
  void *m;
  uint64_t ChannelID;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  void *Aggregate;
  void *v94;
  void *v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  void *v99;
  id v100;
  id v101;
  NSObject *v102;
  NSObject *v103;
  const char *v104;
  uint32_t v105;
  void *v106;
  _BOOL4 v107;
  id v108;
  NSObject *v109;
  _BOOL4 v110;
  NSObject *v111;
  const char *v112;
  id v113;
  NSObject *v114;
  id v115;
  id v116;
  NSMutableArray *cachedPredicatesNotYetFound;
  id v118;
  id v119;
  NSObject *v120;
  id v121;
  NSObject *v122;
  NSObject *v123;
  id v124;
  NSObject *v125;
  id v126;
  NSObject *v127;
  id v128;
  NSObject *v129;
  id v130;
  id v132;
  _BOOL4 v133;
  int64_t wlanType;
  _BOOL4 v135;
  _BOOL4 v136;
  const char *v137;
  NSObject *v138;
  uint32_t v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  __int128 v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  void *v153;
  NSObject *v154;
  uint64_t v155;
  uint64_t v157;
  unint64_t v158;
  id v159;
  id v160;
  id v161;
  void *i;
  void *v163;
  NSObject *obj;
  void *v165;
  void *j;
  void *v167;
  void *v168;
  void *v169;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  char v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  uint64_t entryID;
  uint8_t v189[4];
  const char *v190;
  __int16 v191;
  int v192;
  __int16 v193;
  uint64_t v194;
  __int16 v195;
  NSObject *v196;
  __int16 v197;
  void *v198;
  __int16 v199;
  void *v200;
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  uint8_t buf[48];
  __int128 v205;
  _BYTE v206[128];

  entryID = 0;
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR addDriverChannelsMatchingPredicateList", "Mode %ld", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getInfraApple80211"));

  if (!v169)
  {
    v141 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v141);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_163;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 868;
    v137 = "%{public}s::%d:invalid apple80211API";
LABEL_161:
    v138 = v14;
    v139 = 18;
LABEL_162:
    _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, v137, buf, v139);
    goto LABEL_163;
  }
  v6 = self;
  if (self->_srv && self->_drvName && self->_providerNum && self->_drvPath && self->_wlanType)
    goto LABEL_25;
  v7 = -[WAIOReporterMessagePopulator _getIOServiceWithForceRefresh:apple80211:](self, "_getIOServiceWithForceRefresh:apple80211:", 0, v169);
  self->_srv = v7;
  if (!v7)
  {
    v142 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v142);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_163;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 875;
    v137 = "%{public}s::%d:Failed to retrieve io_service_t of driver";
    goto LABEL_161;
  }
  if (!IORegistryEntryGetRegistryEntryID(v7, &entryID))
    goto LABEL_17;
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    srv = self->_srv;
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 878;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = entryID;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = srv;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to convert IORegistryEntryGetRegistryEntryID %llx _srv was %d", buf, 0x22u);
  }

  v11 = -[WAIOReporterMessagePopulator _getIOServiceWithForceRefresh:apple80211:](self, "_getIOServiceWithForceRefresh:apple80211:", 1, v169);
  self->_srv = v11;
  v12 = WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!v11)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_163;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 882;
    v137 = "%{public}s::%d:Failed to find io_service_t";
    goto LABEL_161;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_srv;
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 884;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found new io_service_t _srv is now %d", buf, 0x18u);
  }

  if (!IORegistryEntryGetRegistryEntryID(self->_srv, &entryID))
  {
LABEL_17:
    v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "getIOReportingDriverName"));
    drvName = self->_drvName;
    self->_drvName = v16;

    if (self->_drvName)
    {
      v18 = objc_alloc((Class)NSNumber);
      v19 = (NSNumber *)objc_msgSend(v18, "initWithLongLong:", entryID);
      providerNum = self->_providerNum;
      self->_providerNum = v19;

      if (self->_providerNum)
      {
        v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "getIOReportingClassPath"));
        drvPath = self->_drvPath;
        self->_drvPath = v21;

        if (self->_drvPath)
        {
          v23 = objc_msgSend(v169, "getDriverType");
          v6 = self;
          self->_wlanType = (int64_t)v23;
          if (v23)
          {
            *(_QWORD *)buf = _NSConcreteStackBlock;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = nullsub_1;
            *(_QWORD *)&buf[24] = &unk_1000CCD10;
            *(_QWORD *)&buf[32] = v23;
            if (qword_1000ECF60 != -1)
              dispatch_once(&qword_1000ECF60, buf);
            if (!self->_drvName || !self->_providerNum)
            {
LABEL_143:
              v132 = WALogCategoryDefaultHandle();
              v14 = objc_claimAutoreleasedReturnValue(v132);
              if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                goto LABEL_163;
              v133 = v6->_drvName == 0;
              wlanType = v6->_wlanType;
              v135 = v6->_providerNum == 0;
              v136 = v6->_drvPath == 0;
              *(_DWORD *)buf = 136447490;
              *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 903;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v133;
              *(_WORD *)&buf[24] = 1024;
              *(_DWORD *)&buf[26] = v135;
              *(_WORD *)&buf[30] = 1024;
              *(_DWORD *)&buf[32] = v136;
              *(_WORD *)&buf[36] = 2048;
              *(_QWORD *)&buf[38] = wlanType;
              v137 = "%{public}s::%d:Invalid drvName %d and providerNum %d and drvPath %d _wlanType %ld";
              v138 = v14;
              v139 = 46;
              goto LABEL_162;
            }
LABEL_25:
            if (v6->_drvPath && v6->_wlanType)
            {
              v186 = 0u;
              v187 = 0u;
              v184 = 0u;
              v185 = 0u;
              obj = (id)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator _buildPredicateList:wlan:](v6, "_buildPredicateList:wlan:", a3));
              v159 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v184, v206, 16);
              if (!v159)
              {
                v157 = 0;
                v158 = 0;
                v168 = 0;
                goto LABEL_138;
              }
              v157 = 0;
              v158 = 0;
              v168 = 0;
              v150 = *(_QWORD *)v185;
              *(_QWORD *)&v24 = 136447490;
              v148 = v24;
              while (1)
              {
                for (i = 0; i != v159; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v185 != v150)
                    objc_enumerationMutation(obj);
                  v25 = *(NSObject **)(*((_QWORD *)&v184 + 1) + 8 * (_QWORD)i);
                  v205 = 0u;
                  memset(buf, 0, sizeof(buf));
                  v183 = 0;
                  v26 = WALogCategoryDefaultHandle();
                  v27 = objc_claimAutoreleasedReturnValue(v26);
                  if (os_signpost_enabled(v27))
                  {
                    *(_WORD *)v189 = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR Query and append IOReportLegend", ", v189, 2u);
                  }

                  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("gbegin")));
                  v29 = v28 == 0;

                  if (!v29)
                  {
                    v30 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("gbegin")));
                    v31 = *(void **)buf;
                    *(_QWORD *)buf = v30;

                  }
                  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("gcont"), v148));
                  v33 = v32 == 0;

                  if (!v33)
                  {
                    v34 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("gcont")));
                    v35 = *(void **)&buf[8];
                    *(_QWORD *)&buf[8] = v34;

                  }
                  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("gends")));
                  v37 = v36 == 0;

                  if (!v37)
                  {
                    v38 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("gends")));
                    v39 = *(void **)&buf[16];
                    *(_QWORD *)&buf[16] = v38;

                  }
                  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("gis")));
                  v41 = v40 == 0;

                  if (!v41)
                  {
                    v42 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("gis")));
                    v43 = *(void **)&buf[24];
                    *(_QWORD *)&buf[24] = v42;

                  }
                  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("sgbegin")));
                  v45 = v44 == 0;

                  if (!v45)
                  {
                    v46 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("sgbegin")));
                    v47 = *(void **)&buf[32];
                    *(_QWORD *)&buf[32] = v46;

                  }
                  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("sgcont")));
                  v49 = v48 == 0;

                  if (!v49)
                  {
                    v50 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("sgcont")));
                    v51 = *(void **)&buf[40];
                    *(_QWORD *)&buf[40] = v50;

                  }
                  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("sgends")));
                  v53 = v52 == 0;

                  if (!v53)
                  {
                    v54 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("sgends")));
                    v55 = (void *)v205;
                    *(_QWORD *)&v205 = v54;

                  }
                  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("sgis")));
                  v57 = v56 == 0;

                  if (!v57)
                  {
                    v58 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("sgis")));
                    v59 = (void *)*((_QWORD *)&v205 + 1);
                    *((_QWORD *)&v205 + 1) = v58;

                  }
                  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Legend Query Calls"), self->_cachedUsage, self->_queue);
                  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "getIOReportLegendItemsMatching:retErr:", buf, &v183));
                  if (v183 == 1)
                  {
                    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Legend Query Failed"), self->_cachedUsage, self->_queue);
                    -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:](self, "_incrementPredicateCachedUsageWithPrefix:q:", CFSTR("Failed Pred: "), buf);
                    v60 = WALogCategoryDefaultHandle();
                    v61 = objc_claimAutoreleasedReturnValue(v60);
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v189 = 136446722;
                      v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      v191 = 1024;
                      v192 = 949;
                      v193 = 2112;
                      v194 = (uint64_t)v25;
                      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%{public}s::%d:legendFetchError with getIOReportLegendItemsMatching pred %@", v189, 0x1Cu);
                    }

                  }
                  if (!objc_msgSend(v167, "count"))
                  {
                    -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:](self, "_incrementPredicateCachedUsageWithPrefix:q:", CFSTR("Zero Results Pred: "), buf);
                    if ((-[NSMutableArray containsObject:](self->_cachedPredicatesNotYetFound, "containsObject:", v25) & 1) != 0)
                    {
                      v106 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("rare")));
                      v107 = v106 == 0;

                      v108 = WALogCategoryDefaultHandle();
                      v109 = objc_claimAutoreleasedReturnValue(v108);
                      v110 = os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
                      if (!v107)
                      {
                        if (v110)
                        {
                          *(_DWORD *)v189 = 136446722;
                          v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                          v191 = 1024;
                          v192 = 964;
                          v193 = 2112;
                          v194 = (uint64_t)v25;
                          v111 = v109;
                          v112 = "%{public}s::%d:Failed to discover known missing rare pred %@";
                          goto LABEL_119;
                        }
LABEL_120:

                        v118 = WALogCategoryDefaultHandle();
                        v102 = objc_claimAutoreleasedReturnValue(v118);
                        if (!os_signpost_enabled(v102))
                          goto LABEL_123;
                        *(_DWORD *)v189 = 138412290;
                        v190 = (const char *)v25;
                        v103 = v102;
                        v104 = "Failed Dictionary %@";
                        v105 = 12;
                        goto LABEL_122;
                      }
                      if (!v110)
                        goto LABEL_120;
                      *(_DWORD *)v189 = 136446722;
                      v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      v191 = 1024;
                      v192 = 962;
                      v193 = 2112;
                      v194 = (uint64_t)v25;
                      v111 = v109;
                      v112 = "%{public}s::%d:Failed to discover known missing pred %@";
                    }
                    else
                    {
                      v113 = WALogCategoryDefaultHandle();
                      v114 = objc_claimAutoreleasedReturnValue(v113);
                      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
                      {
                        v115 = -[NSMutableArray count](self->_cachedPredicatesNotYetFound, "count");
                        *(_DWORD *)v189 = 136446978;
                        v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                        v191 = 1024;
                        v192 = 956;
                        v193 = 2048;
                        v194 = (uint64_t)v115;
                        v195 = 2112;
                        v196 = v25;
                        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Adding _cachedPredicatesNotYetFound existing count %lu %@", v189, 0x26u);
                      }

                      -[NSMutableArray addObject:](self->_cachedPredicatesNotYetFound, "addObject:", v25);
                      v116 = WALogCategoryDefaultHandle();
                      v109 = objc_claimAutoreleasedReturnValue(v116);
                      if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                        goto LABEL_120;
                      cachedPredicatesNotYetFound = self->_cachedPredicatesNotYetFound;
                      *(_DWORD *)v189 = 136446722;
                      v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      v191 = 1024;
                      v192 = 959;
                      v193 = 2112;
                      v194 = (uint64_t)cachedPredicatesNotYetFound;
                      v111 = v109;
                      v112 = "%{public}s::%d:_cachedPredicatesNotYetFound is now %@";
                    }
LABEL_119:
                    _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, v112, v189, 0x1Cu);
                    goto LABEL_120;
                  }
                  v62 = WALogCategoryDefaultHandle();
                  v63 = objc_claimAutoreleasedReturnValue(v62);
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    v64 = objc_msgSend(v167, "count");
                    *(_DWORD *)v189 = 136446978;
                    v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                    v191 = 1024;
                    v192 = 972;
                    v193 = 2048;
                    v194 = (uint64_t)v64;
                    v195 = 2112;
                    v196 = v25;
                    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found %lu legends pred %@", v189, 0x26u);
                  }

                  if (-[NSMutableArray containsObject:](self->_cachedPredicatesNotYetFound, "containsObject:", v25))
                  {
                    v65 = WALogCategoryDefaultHandle();
                    v66 = objc_claimAutoreleasedReturnValue(v65);
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v189 = 136446722;
                      v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      v191 = 1024;
                      v192 = 975;
                      v193 = 2112;
                      v194 = (uint64_t)v25;
                      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found a previously missing pred %@", v189, 0x1Cu);
                    }

                    -[NSMutableArray removeObject:](self->_cachedPredicatesNotYetFound, "removeObject:", v25);
                    v67 = WALogCategoryDefaultHandle();
                    v68 = objc_claimAutoreleasedReturnValue(v67);
                    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                    {
                      v69 = self->_cachedPredicatesNotYetFound;
                      *(_DWORD *)v189 = 136446722;
                      v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      v191 = 1024;
                      v192 = 977;
                      v193 = 2112;
                      v194 = (uint64_t)v69;
                      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_cachedPredicatesNotYetFound is now %@", v189, 0x1Cu);
                    }

                  }
                  v181 = 0u;
                  v182 = 0u;
                  v179 = 0u;
                  v180 = 0u;
                  v161 = v167;
                  v152 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v179, v203, 16);
                  if (v152)
                  {
                    v155 = *(_QWORD *)v180;
                    do
                    {
                      for (j = 0; j != v152; j = (char *)j + 1)
                      {
                        if (*(_QWORD *)v180 != v155)
                          objc_enumerationMutation(v161);
                        v70 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * (_QWORD)j);
                        v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("IOReportChannels")));
                        v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("IOReportChannelInfo")));
                        v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("IOReportGroupName")));
                        v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("IOReportSubGroupName")));
                        if (v72)
                          v73 = v71 == 0;
                        else
                          v73 = 0;
                        if (!v73)
                        {
                          v177 = 0u;
                          v178 = 0u;
                          v175 = 0u;
                          v176 = 0u;
                          v160 = v163;
                          v74 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v175, v202, 16);
                          v153 = (void *)v71;
                          v154 = v72;
                          if (!v74)
                            goto LABEL_101;
                          v151 = *(_QWORD *)v176;
                          while (1)
                          {
                            v149 = v74;
                            for (k = 0; k != v149; k = (char *)k + 1)
                            {
                              if (*(_QWORD *)v176 != v151)
                                objc_enumerationMutation(v160);
                              v76 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * (_QWORD)k);
                              v77 = v168;
                              if (!v168)
                              {
                                v90 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
                                v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", &off_1000E0020));
                                v92 = v91 == 0;

                                if (v92)
                                {
                                  Aggregate = (void *)IOReportCreateAggregate(0);
                                  v94 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
                                  objc_msgSend(v94, "setObject:forKeyedSubscript:", Aggregate, &off_1000E0020);

                                }
                                v95 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
                                v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", &off_1000E0020));

                                v77 = (void *)v96;
                                if (!v96)
                                {
                                  v119 = WALogCategoryDefaultHandle();
                                  v120 = objc_claimAutoreleasedReturnValue(v119);
                                  if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)v189 = 136446466;
                                    v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                                    v191 = 1024;
                                    v192 = 1014;
                                    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to alloc drvchs", v189, 0x12u);
                                  }

                                  v121 = WALogCategoryDefaultHandle();
                                  v122 = objc_claimAutoreleasedReturnValue(v121);
                                  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)v189 = 136446466;
                                    v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                                    v191 = 1024;
                                    v192 = 1016;
                                    _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to alloc drvchs", v189, 0x12u);
                                  }
                                  v168 = 0;
                                  goto LABEL_131;
                                }
                              }
                              v168 = v77;
                              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("IOReportChannels")));
                              if (!v78)
                              {
                                v79 = objc_alloc_init((Class)NSMutableArray);
                                objc_msgSend(v168, "setObject:forKeyedSubscript:", v79, CFSTR("IOReportChannels"));

                                v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "objectForKeyedSubscript:", CFSTR("IOReportChannels")));
                                if (!v78)
                                {
                                  v140 = WALogCategoryDefaultHandle();
                                  v122 = objc_claimAutoreleasedReturnValue(v140);
                                  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)v189 = 136446466;
                                    v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                                    v191 = 1024;
                                    v192 = 1024;
                                    _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to retrieve or alloc chlist", v189, 0x12u);
                                  }
LABEL_131:

                                  sub_1000155DC((id *)buf);
                                  v14 = obj;
                                  v123 = obj;
                                  goto LABEL_132;
                                }
                              }
                              v173 = 0u;
                              v174 = 0u;
                              v171 = 0u;
                              v172 = 0u;
                              v80 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
                              v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKeyedSubscript:", &off_1000E0020));
                              v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("IOReportChannels")));

                              v83 = -[NSObject countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v171, v201, 16);
                              if (v83)
                              {
                                v84 = *(_QWORD *)v172;
                                while (2)
                                {
                                  for (m = 0; m != v83; m = (char *)m + 1)
                                  {
                                    if (*(_QWORD *)v172 != v84)
                                      objc_enumerationMutation(v82);
                                    ChannelID = IOReportChannelGetChannelID(*(_QWORD *)(*((_QWORD *)&v171 + 1)
                                                                                      + 8 * (_QWORD)m));
                                    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectAtIndex:", 0));
                                    v88 = objc_msgSend(v87, "unsignedLongLongValue");

                                    if (v88 == (id)ChannelID)
                                    {
                                      ++v157;
                                      goto LABEL_91;
                                    }
                                  }
                                  v83 = -[NSObject countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v171, v201, 16);
                                  if (v83)
                                    continue;
                                  break;
                                }
                              }

                              v89 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:](self, "createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:", self->_providerNum, self->_drvName, v76, v153, v154, v165));
                              if (v89)
                              {
                                objc_msgSend(v78, "addObject:", v89);
                                ++v158;
                              }
                              else
                              {
                                v97 = WALogCategoryDefaultHandle();
                                v82 = objc_claimAutoreleasedReturnValue(v97);
                                if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)v189 = v148;
                                  v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                                  v191 = 1024;
                                  v192 = 1042;
                                  v193 = 2112;
                                  v194 = (uint64_t)v153;
                                  v195 = 2112;
                                  v196 = v154;
                                  v197 = 2112;
                                  v198 = v76;
                                  v199 = 2112;
                                  v200 = v165;
                                  _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create channel groupName %@ subgroup %@ legCh %@ chinfo %@, continuing", v189, 0x3Au);
                                }
LABEL_91:

                                v89 = 0;
                              }

                            }
                            v74 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v175, v202, 16);
                            if (!v74)
                            {
LABEL_101:

                              v99 = v153;
                              v98 = v154;
                              goto LABEL_105;
                            }
                          }
                        }
                        v100 = WALogCategoryDefaultHandle();
                        v98 = objc_claimAutoreleasedReturnValue(v100);
                        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v189 = 136446722;
                          v190 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                          v191 = 1024;
                          v192 = 989;
                          v193 = 2112;
                          v99 = (void *)v72;
                          v194 = v72;
                          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unpacking legend yields subgroupName %@ with no groupName, continuing", v189, 0x1Cu);
                        }
                        else
                        {
                          v99 = (void *)v72;
                        }
LABEL_105:

                      }
                      v152 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v179, v203, 16);
                    }
                    while (v152);
                  }

                  v101 = WALogCategoryDefaultHandle();
                  v102 = objc_claimAutoreleasedReturnValue(v101);
                  if (os_signpost_enabled(v102))
                  {
                    *(_WORD *)v189 = 0;
                    v103 = v102;
                    v104 = "";
                    v105 = 2;
LABEL_122:
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v103, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR Query and append IOReportLegend", v104, v189, v105);
                  }
LABEL_123:

                  sub_1000155DC((id *)buf);
                }
                v159 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v184, v206, 16);
                if (!v159)
                {
LABEL_138:

                  v128 = WALogCategoryDefaultHandle();
                  v129 = objc_claimAutoreleasedReturnValue(v128);
                  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136446978;
                    *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 1057;
                    *(_WORD *)&buf[18] = 2048;
                    *(_QWORD *)&buf[20] = v158;
                    *(_WORD *)&buf[28] = 2048;
                    *(_QWORD *)&buf[30] = v157;
                    _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finished finding IOReporter channels... Success - added %lu duplicate %lu", buf, 0x26u);
                  }

                  v130 = WALogCategoryDefaultHandle();
                  v127 = objc_claimAutoreleasedReturnValue(v130);
                  if (os_signpost_enabled(v127))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = a3;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v127, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR addDriverChannelsMatchingPredicateList", "Mode %ld", buf, 0xCu);
                  }
                  goto LABEL_142;
                }
              }
            }
            goto LABEL_143;
          }
          v146 = WALogCategoryDefaultHandle();
          v14 = objc_claimAutoreleasedReturnValue(v146);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_163;
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 899;
          v137 = "%{public}s::%d:failed to get _wlanType through getDriverType";
        }
        else
        {
          v145 = WALogCategoryDefaultHandle();
          v14 = objc_claimAutoreleasedReturnValue(v145);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_163;
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 896;
          v137 = "%{public}s::%d:failed to get _drvPath through getIOReportingClassPath";
        }
      }
      else
      {
        v144 = WALogCategoryDefaultHandle();
        v14 = objc_claimAutoreleasedReturnValue(v144);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_163;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 893;
        v137 = "%{public}s::%d:failed to alloc providerNum";
      }
    }
    else
    {
      v143 = WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue(v143);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_163;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 890;
      v137 = "%{public}s::%d:Failed to get _drvName through getIOReportingDriverName";
    }
    goto LABEL_161;
  }
  v147 = WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue(v147);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 886;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = entryID;
    v137 = "%{public}s::%d:Failed to convert IORegistryEntryGetRegistryEntryID %llx";
    v138 = v14;
    v139 = 28;
    goto LABEL_162;
  }
LABEL_163:
  v157 = 0;
  v158 = 0;
  v123 = 0;
  v168 = 0;
LABEL_132:

  v124 = WALogCategoryDefaultHandle();
  v125 = objc_claimAutoreleasedReturnValue(v124);
  if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1065;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v158;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v157;
    _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "%{public}s::%d:Finished finding IOReporter channels... Error - added %lu duplicate %lu", buf, 0x26u);
  }

  v126 = WALogCategoryDefaultHandle();
  v127 = objc_claimAutoreleasedReturnValue(v126);
  if (os_signpost_enabled(v127))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v127, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR addDriverChannelsMatchingPredicateList", "Error", buf, 2u);
  }
  obj = v123;
LABEL_142:

  return v158;
}

- (void)signalPotentialNewIORChannels
{
  char *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9[2];
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  v3 = (char *)os_signpost_id_generate((os_log_t)WALogCategoryDefault);
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v3, "IOR signalPotentialNewIORChannels", ", buf, 2u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018910;
  block[3] = &unk_1000CCD88;
  objc_copyWeak(v9, &location);
  block[4] = self;
  v9[1] = v3;
  dispatch_sync(v7, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_signalPotentialNewIORChannels
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  char v25;
  char v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  NSObject *v42;
  double v43;
  id v44;
  NSObject *v45;
  char v46;
  id v47;
  NSObject *v48;
  NSMutableDictionary *cachedUsage;
  const __CFString *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  id v58;
  NSObject *v59;
  _BOOL4 v60;
  void *v61;
  const char *v62;
  id v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  unsigned int v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  id v79;
  _BOOL4 v80;
  unsigned int v81;
  id v82;
  NSObject *v83;
  void *v84;
  void *v85;
  unsigned int v86;
  id v87;
  NSObject *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  unsigned int v93;
  id v94;
  NSObject *v95;
  id v96;
  const char *v97;
  NSObject *v98;
  os_log_type_t v99;
  id v100;
  NSObject *v101;
  NSMutableDictionary *v102;
  id v103;
  void *v104;
  id v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  WAIOReporterMessagePopulator *v143;
  uint64_t v144;
  id v145;
  NSObject *v146;
  id v147;
  id v148;
  uint64_t v149;
  char v150;
  uint8_t buf[4];
  const char *v152;
  __int16 v153;
  int v154;
  __int16 v155;
  double v156;
  __int16 v157;
  double v158;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (self->_rescanTimerRunning)
  {
    v4 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      v153 = 1024;
      v154 = 1108;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Ignoring, waiting for _rescanTimerRunning to run", buf, 0x12u);
    }
    goto LABEL_132;
  }
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Signal Count"), self->_cachedUsage, self->_queue);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Rescan Siganl Date"));
  -[NSMutableDictionary setObject:forKey:](self->_cachedUsage, "setObject:forKey:", v3, CFSTR("Rescan Siganl Date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getInfraApple80211"));

  if (!v5)
  {
    v147 = WALogCategoryDefaultHandle();
    v59 = objc_claimAutoreleasedReturnValue(v147);
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      goto LABEL_94;
    *(_DWORD *)buf = 136446466;
    v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    v153 = 1024;
    v154 = 1117;
    v97 = "%{public}s::%d:invalid apple80211API";
    v98 = v59;
    v99 = OS_LOG_TYPE_ERROR;
    goto LABEL_93;
  }
  v7 = -[NSObject getPhyMode](v5, "getPhyMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));

  if (!v8)
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedUsage, "setObject:forKeyedSubscript:", v9, CFSTR("Phy Types Found after signal API"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

  v148 = v7;
  if (!v12)
  {
    v28 = objc_alloc_init((Class)NSMutableDictionary);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);

    v24 = 0;
    v26 = 1;
    v27 = 1;
LABEL_23:
    v25 = 1;
    goto LABEL_24;
  }
  v13 = WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    v153 = 1024;
    v154 = 1134;
    v155 = 2048;
    v156 = *(double *)&v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Already recscanned due to this phy %lu", buf, 0x1Cu);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", &off_1000E0020));
  v17 = objc_msgSend(v16, "count");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedChannelsCountPerIORPopulatable, "objectForKeyedSubscript:", &off_1000E0020));
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  if (v19 > v17)
  {
    v20 = WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedChannelsCountPerIORPopulatable, "objectForKeyedSubscript:", &off_1000E0020));
      v23 = objc_msgSend(v22, "unsignedIntegerValue");
      *(_DWORD *)buf = 136446978;
      v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      v153 = 1024;
      v154 = 1143;
      v155 = 2048;
      v156 = *(double *)&v17;
      v157 = 2048;
      v158 = *(double *)&v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Considering Exploratory Rescan: currentChannelCount %lu previous max chanels %lu", buf, 0x26u);

    }
    v24 = 0;
    v25 = 0;
    v26 = 1;
    v27 = 1;
    goto LABEL_24;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Permitted: Last Rescan Date")));

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_cachedUsage, "valueForKey:", CFSTR("Rescan Permitted: Last Rescan Date")));
    objc_msgSend(v3, "timeIntervalSinceDate:", v32);
    if (v33 >= 0.0)
      v34 = v33;
    else
      v34 = -v33;
    if (-[RecommendationPreferences ior_rescan_budget_exploratory_seconds](self->_preferences, "ior_rescan_budget_exploratory_seconds", v7) < v34)
    {
      v35 = WALogCategoryDefaultHandle();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        v153 = 1024;
        v154 = 1158;
        v155 = 2048;
        v156 = v34;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Considering Exploratory Rescan: Last rescan was %f s ago", buf, 0x1Cu);
      }

      v24 = 0;
      v27 = 0;
      v26 = 1;
      goto LABEL_23;
    }

  }
  v63 = WALogCategoryDefaultHandle();
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    v153 = 1024;
    v154 = 1167;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Rescan not selected due to isExploratory or isLessThanPreviousMaxChannels", buf, 0x12u);
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
  if (!v65)
  {
    v66 = objc_alloc_init((Class)NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedUsage, "setObject:forKeyedSubscript:", v66, CFSTR("Interface Types Found after signal API"));

  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API"), v148));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("ap")));
  if (v68)
  {

  }
  else
  {
    v69 = -[NSObject hasSoftAPInterfaceListed](v5, "hasSoftAPInterfaceListed");

    if (v69)
    {
      v70 = WALogCategoryDefaultHandle();
      v71 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        v153 = 1024;
        v154 = 1182;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Interface found AP", buf, 0x12u);
      }

      v26 = 0;
      v27 = 1;
      v25 = 1;
      v24 = CFSTR("ap");
      goto LABEL_24;
    }
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("nan")));
  if (v73)
  {

  }
  else
  {
    v81 = -[NSObject hasNANInterfaceListed](v5, "hasNANInterfaceListed");

    if (v81)
    {
      v82 = WALogCategoryDefaultHandle();
      v83 = objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        v153 = 1024;
        v154 = 1190;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Interface found NAN", buf, 0x12u);
      }

      v26 = 0;
      v27 = 1;
      v25 = 1;
      v24 = CFSTR("nan");
      goto LABEL_24;
    }
  }
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("awdl")));
  if (v85)
  {

  }
  else
  {
    v86 = -[NSObject hasAWDLInterfaceListed](v5, "hasAWDLInterfaceListed");

    if (v86)
    {
      v87 = WALogCategoryDefaultHandle();
      v88 = objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        v153 = 1024;
        v154 = 1198;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Interface found AWDL", buf, 0x12u);
      }

      v26 = 0;
      v27 = 1;
      v25 = 1;
      v24 = CFSTR("awdl");
      goto LABEL_24;
    }
  }
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("ir")));
  if (v90)
  {

LABEL_91:
    v96 = WALogCategoryDefaultHandle();
    v59 = objc_claimAutoreleasedReturnValue(v96);
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      goto LABEL_94;
    *(_DWORD *)buf = 136446466;
    v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    v153 = 1024;
    v154 = 1211;
    v97 = "%{public}s::%d:Rescan not selected due to No new Interfaces found";
    v98 = v59;
    v99 = OS_LOG_TYPE_DEBUG;
LABEL_93:
    _os_log_impl((void *)&_mh_execute_header, v98, v99, v97, buf, 0x12u);
    goto LABEL_94;
  }
  v93 = -[NSObject hasIRInterfaceListed](v5, "hasIRInterfaceListed");

  if (!v93)
    goto LABEL_91;
  v94 = WALogCategoryDefaultHandle();
  v95 = objc_claimAutoreleasedReturnValue(v94);
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    v153 = 1024;
    v154 = 1206;
    _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Interface found IR", buf, 0x12u);
  }

  v26 = 0;
  v27 = 1;
  v25 = 1;
  v24 = CFSTR("ir");
LABEL_24:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Permitted: Last Rescan Date"), v148));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Permitted: Last Rescan Date")));
    objc_msgSend(v3, "timeIntervalSinceDate:", v38);
    v40 = v39;

    v41 = WALogCategoryDefaultHandle();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v43 = -v40;
      v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      if (v40 >= 0.0)
        v43 = v40;
      v153 = 1024;
      v154 = 1219;
      v155 = 2048;
      v156 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Last rescan was %f s ago", buf, 0x1Cu);
    }

  }
  v150 = v25;
  if ((v26 & 1) != 0)
  {
    if (v12)
    {
      if ((v25 & 1) != 0)
      {
        if ((v27 & 1) != 0)
        {
          v44 = WALogCategoryDefaultHandle();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            v153 = 1024;
            v154 = 1285;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:Testing budget with no reason", buf, 0x12u);
          }
          v46 = v27;

          goto LABEL_103;
        }
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Reason: Explore Date")));

        if (v74)
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Reason: Explore Date")));
          objc_msgSend(v3, "timeIntervalSinceDate:", v75);
          v77 = v76;

          if (v77 < 0.0)
            v77 = -v77;
          v78 = (double)-[RecommendationPreferences ior_rescan_budget_less_than_previous_max_channels_seconds](self->_preferences, "ior_rescan_budget_less_than_previous_max_channels_seconds");
          v79 = WALogCategoryDefaultHandle();
          v59 = objc_claimAutoreleasedReturnValue(v79);
          v80 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
          if (v77 < v78)
          {
            if (v80)
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Reason: Explore Count")));
              *(_DWORD *)buf = 136446978;
              v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
              v153 = 1024;
              v154 = 1268;
              v155 = 2112;
              v156 = *(double *)&v61;
              v157 = 2048;
              v158 = v77;
              v62 = "%{public}s::%d:Rescan Budget Denied: Explore - previous rescans %@ - last check was %f s ago";
              goto LABEL_68;
            }
            goto LABEL_94;
          }
          if (v80)
          {
            v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Reason: Explore Count")));
            *(_DWORD *)buf = 136446978;
            v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            v153 = 1024;
            v154 = 1271;
            v155 = 2112;
            v156 = *(double *)&v104;
            v157 = 2048;
            v158 = v77;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: Missing Channels - previous rescans %@ - last check was %f s ago", buf, 0x26u);

          }
        }
        else
        {
          v103 = WALogCategoryDefaultHandle();
          v59 = objc_claimAutoreleasedReturnValue(v103);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            v153 = 1024;
            v154 = 1274;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: Explore - first rescan", buf, 0x12u);
          }
        }
        v46 = v27;

        +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Reason: Explore Count"), self->_cachedUsage, self->_queue);
        cachedUsage = self->_cachedUsage;
        v50 = CFSTR("Rescan Reason: Explore Date");
      }
      else
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Reason: Low Channel Date")));

        if (v53)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Reason: Low Channel Date")));
          objc_msgSend(v3, "timeIntervalSinceDate:", v54);
          v56 = v55;

          if (v56 < 0.0)
            v56 = -v56;
          v57 = (double)-[RecommendationPreferences ior_rescan_budget_less_than_previous_max_channels_seconds](self->_preferences, "ior_rescan_budget_less_than_previous_max_channels_seconds");
          v58 = WALogCategoryDefaultHandle();
          v59 = objc_claimAutoreleasedReturnValue(v58);
          v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
          if (v56 < v57)
          {
            if (v60)
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Reason: Low Channel Count")));
              *(_DWORD *)buf = 136446978;
              v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
              v153 = 1024;
              v154 = 1246;
              v155 = 2112;
              v156 = *(double *)&v61;
              v157 = 2048;
              v158 = v56;
              v62 = "%{public}s::%d:Rescan Budget Denied: Missing Channels - previous rescans %@ - last check was %f s ago";
LABEL_68:
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, v62, buf, 0x26u);

            }
LABEL_94:

            +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Denied"), self->_cachedUsage, self->_queue);
            v100 = WALogCategoryDefaultHandle();
            v101 = objc_claimAutoreleasedReturnValue(v100);
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
            {
              v102 = self->_cachedUsage;
              *(_DWORD *)buf = 136446722;
              v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
              v153 = 1024;
              v154 = 1358;
              v155 = 2112;
              v156 = *(double *)&v102;
              _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan not performed: %@", buf, 0x1Cu);
            }

            goto LABEL_132;
          }
          if (v60)
          {
            v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Rescan Reason: Low Channel Count")));
            *(_DWORD *)buf = 136446978;
            v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            v153 = 1024;
            v154 = 1249;
            v155 = 2112;
            v156 = *(double *)&v92;
            v157 = 2048;
            v158 = v56;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: Missing Channels - previous rescans %@ - last check was %f s ago", buf, 0x26u);

          }
        }
        else
        {
          v91 = WALogCategoryDefaultHandle();
          v59 = objc_claimAutoreleasedReturnValue(v91);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            v153 = 1024;
            v154 = 1252;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: Missing Channels - first rescan", buf, 0x12u);
          }
        }
        v46 = v27;

        +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Reason: Low Channel Count"), self->_cachedUsage, self->_queue);
        cachedUsage = self->_cachedUsage;
        v50 = CFSTR("Rescan Reason: Low Channel Date");
      }
    }
    else
    {
      v51 = WALogCategoryDefaultHandle();
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        v153 = 1024;
        v154 = 1232;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: New Phy - granted", buf, 0x12u);
      }
      v46 = v27;

      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Reason: New Phy Count"), self->_cachedUsage, self->_queue);
      cachedUsage = self->_cachedUsage;
      v50 = CFSTR("Rescan Reason: New Phy Date");
    }
  }
  else
  {
    v47 = WALogCategoryDefaultHandle();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      v153 = 1024;
      v154 = 1223;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: New Interface - granted", buf, 0x12u);
    }
    v46 = v27;

    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Reason: New Interface Count"), self->_cachedUsage, self->_queue);
    cachedUsage = self->_cachedUsage;
    v50 = CFSTR("Rescan Reason: New Interface Date");
  }
  -[NSMutableDictionary removeObjectForKey:](cachedUsage, "removeObjectForKey:", v50);
  -[NSMutableDictionary setObject:forKey:](self->_cachedUsage, "setObject:forKey:", v3, v50);
LABEL_103:
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Rescan Permitted: Last Rescan Date"));
  -[NSMutableDictionary setObject:forKey:](self->_cachedUsage, "setObject:forKey:", v3, CFSTR("Rescan Permitted: Last Rescan Date"));
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Permitted: Last Rescan Count"), self->_cachedUsage, self->_queue);
  v105 = WALogCategoryDefaultHandle();
  v106 = objc_claimAutoreleasedReturnValue(v105);
  v107 = v106;
  if ((v26 & 1) == 0)
  {
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      v153 = 1024;
      v154 = 1297;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:IORescan: New Interface found - rescanning", buf, 0x12u);
    }

    v108 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectForKeyedSubscript:", v24));

    if (!v109)
    {
      v110 = objc_alloc_init((Class)NSMutableDictionary);
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
      objc_msgSend(v111, "setObject:forKeyedSubscript:", v110, v24);

    }
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "objectForKeyedSubscript:", v24));
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Permitted: Last Rescan Count"), v113, self->_queue);

    v114 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "objectForKeyedSubscript:", v24));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("Rescan Permitted: Last Rescan Date")));

    if (v116)
    {
      v117 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", v24));
      objc_msgSend(v118, "setObject:forKeyedSubscript:", 0, CFSTR("Rescan Permitted: Last Rescan Date"));

    }
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Interface Types Found after signal API")));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "objectForKeyedSubscript:", v24));
    objc_msgSend(v120, "setObject:forKeyedSubscript:", v3, CFSTR("Rescan Permitted: Last Rescan Date"));

    v121 = WALogCategoryDefaultHandle();
    v122 = objc_claimAutoreleasedReturnValue(v121);
    if (!os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      goto LABEL_130;
    *(_DWORD *)buf = 136446466;
    v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    v153 = 1024;
    v154 = 1311;
    goto LABEL_129;
  }
  if (v12)
  {
    if ((v150 & 1) != 0)
    {
      if ((v46 & 1) != 0)
      {
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
          v153 = 1024;
          v154 = 1349;
          _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%{public}s::%d:Rescan granted with no reason", buf, 0x12u);
        }

        goto LABEL_132;
      }
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        v153 = 1024;
        v154 = 1340;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:IORescan: Performing exploratory scan - rescanning", buf, 0x12u);
      }

      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Reason: Explore Count"), self->_cachedUsage, self->_queue);
      -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Rescan Reason: Explore Date"));
      -[NSMutableDictionary setObject:forKey:](self->_cachedUsage, "setObject:forKey:", v3, CFSTR("Rescan Reason: Explore Date"));
      v145 = WALogCategoryDefaultHandle();
      v146 = objc_claimAutoreleasedReturnValue(v145);
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        v153 = 1024;
        v154 = 1345;
        _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchUnfoundAndMutablePredicates", buf, 0x12u);
      }

      -[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:](self, "_buildOrRescanToBuildChannelAvailabilityCaches:", 1);
      v143 = self;
      v144 = 1;
LABEL_131:
      -[WAIOReporterMessagePopulator _iorPreparedForSampling:](v143, "_iorPreparedForSampling:", v144);
      goto LABEL_132;
    }
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      v153 = 1024;
      v154 = 1331;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:IORescan: Max channels still not found - rescanning", buf, 0x12u);
    }

    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Reason: Low Channel Count"), self->_cachedUsage, self->_queue);
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Rescan Reason: Low Channel Date"));
    -[NSMutableDictionary setObject:forKey:](self->_cachedUsage, "setObject:forKey:", v3, CFSTR("Rescan Reason: Low Channel Date"));
    v142 = WALogCategoryDefaultHandle();
    v122 = objc_claimAutoreleasedReturnValue(v142);
    if (!os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
LABEL_130:

      -[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:](self, "_buildOrRescanToBuildChannelAvailabilityCaches:", 1);
      v143 = self;
      v144 = 0;
      goto LABEL_131;
    }
    *(_DWORD *)buf = 136446466;
    v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    v153 = 1024;
    v154 = 1336;
LABEL_129:
    _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchUnfoundAndMutablePredicates", buf, 0x12u);
    goto LABEL_130;
  }
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    v153 = 1024;
    v154 = 1315;
    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:IORescan: New Phy Type in use - scheduling rescanning", buf, 0x12u);
  }

  v123 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v149));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKeyedSubscript:", v124));

  if (!v125)
  {
    v126 = objc_alloc_init((Class)NSMutableDictionary);
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v149));
    objc_msgSend(v127, "setObject:forKeyedSubscript:", v126, v128);

  }
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));
  v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v149));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", v130));
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Rescan Permitted: Last Rescan Count"), v131, self->_queue);

  v132 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));
  v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v149));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectForKeyedSubscript:", v133));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("Rescan Permitted: Last Rescan Date")));

  if (v135)
  {
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));
    v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v149));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "objectForKeyedSubscript:", v137));
    objc_msgSend(v138, "setObject:forKeyedSubscript:", 0, CFSTR("Rescan Permitted: Last Rescan Date"));

  }
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Phy Types Found after signal API")));
  v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v149));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "objectForKeyedSubscript:", v140));
  objc_msgSend(v141, "setObject:forKeyedSubscript:", v3, CFSTR("Rescan Permitted: Last Rescan Date"));

  -[WAIOReporterMessagePopulator _delayedInvocationForRescan](self, "_delayedInvocationForRescan");
LABEL_132:

}

- (void)_cancelDelayedInvocationForRescan
{
  NSObject *rescanTimer;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _BOOL4 rescanTimerRunning;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;

  if (self->_rescanTimerRunning)
  {
    rescanTimer = self->_rescanTimer;
    if (rescanTimer)
    {
      if (!dispatch_source_testcancel(rescanTimer))
      {
        v4 = WALogCategoryDefaultHandle();
        v5 = objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136446466;
          v10 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForRescan]";
          v11 = 1024;
          v12 = 1367;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer exists and is valid, Suspending", (uint8_t *)&v9, 0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_rescanTimer);
        self->_rescanTimerRunning = 0;
        v6 = WALogCategoryDefaultHandle();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          rescanTimerRunning = self->_rescanTimerRunning;
          v9 = 136446722;
          v10 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForRescan]";
          v11 = 1024;
          v12 = 1370;
          v13 = 1024;
          v14 = rescanTimerRunning;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _rescanTimerRunning %d", (uint8_t *)&v9, 0x18u);
        }

      }
    }
  }
}

- (void)_delayedInvocationForRescan
{
  id v3;
  NSObject *v4;
  _BOOL4 rescanTimerRunning;
  unint64_t v6;
  NSObject *rescanTimer;
  _BOOL4 v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  OS_dispatch_source *v15;
  OS_dispatch_source *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  unint64_t v26;
  NSObject *v27;
  dispatch_time_t v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  NSObject *v37;
  _BOOL4 v38;
  unint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  id v42;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _BYTE v49[14];
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  _BOOL4 v53;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    rescanTimerRunning = self->_rescanTimerRunning;
    v6 = -[RecommendationPreferences ior_rescan_new_phy_delay_seconds](self->_preferences, "ior_rescan_new_phy_delay_seconds");
    rescanTimer = self->_rescanTimer;
    v8 = rescanTimer != 0;
    if (rescanTimer)
      v9 = dispatch_source_testcancel(rescanTimer) != 0;
    else
      v9 = 0;
    *(_DWORD *)buf = 136447490;
    v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    v46 = 1024;
    v47 = 1376;
    v48 = 1024;
    *(_DWORD *)v49 = rescanTimerRunning;
    *(_WORD *)&v49[4] = 2048;
    *(_QWORD *)&v49[6] = v6;
    v50 = 1024;
    v51 = v8;
    v52 = 1024;
    v53 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_rescanTimerRunning is %d ior_rescan_new_phy_delay_seconds is %lu _timer exists %d testcancel is %d", buf, 0x2Eu);
  }

  if (self->_rescanTimerRunning)
    goto LABEL_31;
  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    v46 = 1024;
    v47 = 1379;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
  }

  v12 = self->_rescanTimer;
  if (v12)
  {
    if (!dispatch_source_testcancel(v12))
    {
LABEL_22:
      v24 = WALogCategoryDefaultHandle();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = -[RecommendationPreferences ior_rescan_new_phy_delay_seconds](self->_preferences, "ior_rescan_new_phy_delay_seconds");
        *(_DWORD *)buf = 136446722;
        v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        v46 = 1024;
        v47 = 1405;
        v48 = 2048;
        *(_QWORD *)v49 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s", buf, 0x1Cu);
      }

      v27 = self->_rescanTimer;
      v28 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000* -[RecommendationPreferences ior_rescan_new_phy_delay_seconds](self->_preferences, "ior_rescan_new_phy_delay_seconds"));
      dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v29 = WALogCategoryDefaultHandle();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        v46 = 1024;
        v47 = 1407;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer Done", buf, 0x12u);
      }

      v31 = WALogCategoryDefaultHandle();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        v46 = 1024;
        v47 = 1409;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dispatch_resume _timer", buf, 0x12u);
      }

      dispatch_resume((dispatch_object_t)self->_rescanTimer);
      self->_rescanTimerRunning = 1;
      v33 = WALogCategoryDefaultHandle();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = self->_rescanTimerRunning;
        *(_DWORD *)buf = 136446722;
        v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        v46 = 1024;
        v47 = 1413;
        v48 = 1024;
        *(_DWORD *)v49 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _rescanTimerRunning %d", buf, 0x18u);
      }

LABEL_31:
      v36 = WALogCategoryDefaultHandle();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = self->_rescanTimerRunning;
        v39 = -[RecommendationPreferences ior_rescan_new_phy_delay_seconds](self->_preferences, "ior_rescan_new_phy_delay_seconds");
        v40 = self->_rescanTimer;
        if (v40)
          v41 = dispatch_source_testcancel(v40) == 0;
        else
          v41 = 0;
        *(_DWORD *)buf = 136447234;
        v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        v46 = 1024;
        v47 = 1417;
        v48 = 1024;
        *(_DWORD *)v49 = v38;
        *(_WORD *)&v49[4] = 2048;
        *(_QWORD *)&v49[6] = v39;
        v50 = 1024;
        v51 = v41;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d", buf, 0x28u);
      }
      goto LABEL_36;
    }
LABEL_17:
    v19 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
      v46 = 1024;
      v47 = 1391;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting dispatch_source_set_event_handler", buf, 0x12u);
    }

    v21 = self->_rescanTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001AA88;
    handler[3] = &unk_1000CCDB0;
    handler[4] = self;
    dispatch_source_set_event_handler(v21, handler);
    v22 = WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
      v46 = 1024;
      v47 = 1402;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_22;
  }
  v13 = WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    v46 = 1024;
    v47 = 1385;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Creating _rescanTimer", buf, 0x12u);
  }

  v15 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  v16 = self->_rescanTimer;
  self->_rescanTimer = v15;

  v17 = WALogCategoryDefaultHandle();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    v46 = 1024;
    v47 = 1387;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Creating _rescanTimer Done", buf, 0x12u);
  }

  if (self->_rescanTimer)
    goto LABEL_17;
  v42 = WALogCategoryDefaultHandle();
  v37 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "Failed to create _timer", buf, 2u);
  }
LABEL_36:

}

- (void)scanPredicatesNotYetFoundAndMutable
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ACEC;
  block[3] = &unk_1000CCC08;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_sync(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_scanPredicatesWithMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  unint64_t v20;
  _UNKNOWN **v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  const char *v38;
  id v39;
  int v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _UNKNOWN **v45;
  __int16 v46;
  _UNKNOWN **v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_1000E0020));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_1000E0020));
    v9 = objc_msgSend(v8, "count");

    if (!a3)
      goto LABEL_9;
  }
  else
  {
    v9 = 0;
    if (!a3)
      goto LABEL_9;
  }
  if (!v9)
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 136446978;
      v41 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
      v42 = 1024;
      v43 = 1447;
      v44 = 2048;
      v45 = (_UNKNOWN **)a3;
      v46 = 2048;
      v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:predicateSearch %ld when previousChannelCount %lu, changing predicateSearch to kWAIORIOReporterSearchAllStaticPredicates", (uint8_t *)&v40, 0x26u);
    }

    a3 = 0;
    goto LABEL_13;
  }
LABEL_9:
  if (a3 == 2)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
      v15 = objc_msgSend(v14, "count");

      if (!v15)
      {
        v39 = WALogCategoryDefaultHandle();
        v37 = objc_claimAutoreleasedReturnValue(v39);
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        v40 = 136446466;
        v41 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
        v42 = 1024;
        v43 = 1454;
        v38 = "%{public}s::%d:predicateSearch kWAIORIOReporterSearchUnfoundPredicates when cachedPredicatesNotYetFound co"
              "unt == 0 returning without scanning";
        goto LABEL_29;
      }
    }
    a3 = 2;
  }
LABEL_13:
  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    LOWORD(v40) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR _scanPredicatesWithMode", ", (uint8_t *)&v40, 2u);
  }

  v18 = WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v40 = 136446722;
    v41 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
    v42 = 1024;
    v43 = 1460;
    v44 = 2048;
    v45 = (_UNKNOWN **)a3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:addDriverChannelsMatchingPredicateList from _scanPredicatesWithMode %ld", (uint8_t *)&v40, 0x1Cu);
  }

  v20 = -[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:](self, "_addDriverChannelsMatchingPredicateList:", a3);
  if (v20)
  {
    v21 = (_UNKNOWN **)v20;
    v22 = WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 136446722;
      v41 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
      v42 = 1024;
      v43 = 1465;
      v44 = 2048;
      v45 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found %lu new channels", (uint8_t *)&v40, 0x1Cu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", &off_1000E0020));
    v26 = objc_msgSend(v25, "count");

    -[WAIOReporterMessagePopulator _freeSubscriptionSample:](self, "_freeSubscriptionSample:", &off_1000E0020);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", &off_1000E0020));
    v29 = objc_msgSend(v28, "unsignedIntValue");

    if ((unint64_t)v26 > v29)
    {
      v30 = WALogCategoryDefaultHandle();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v40 = 136447490;
        v41 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
        v42 = 1024;
        v43 = 1472;
        v44 = 2112;
        v45 = &off_1000E0020;
        v46 = 2048;
        v47 = v21;
        v48 = 2048;
        v49 = v9;
        v50 = 2048;
        v51 = v26;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Increasing max known channel count for group %@ by %lu from %lu to %lu", (uint8_t *)&v40, 0x3Au);
      }

      v32 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLong:", v26);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, &off_1000E0020);

    }
    self->_ioReportersCacheNeedsUpdating = 1;
  }
  v34 = WALogCategoryDefaultHandle();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_signpost_enabled(v35))
  {
    LOWORD(v40) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR _scanPredicatesWithMode", ", (uint8_t *)&v40, 2u);
  }

  v36 = WALogCategoryDefaultHandle();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v40 = 136446466;
    v41 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
    v42 = 1024;
    v43 = 1481;
    v38 = "%{public}s::%d:_scanPredicatesWithMode Complete";
LABEL_29:
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&v40, 0x12u);
  }
LABEL_30:

}

- (void)_buildOrRescanToBuildChannelAvailabilityCaches:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int64_t v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v11 = 136446722;
      v12 = "-[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:]";
      v13 = 1024;
      v14 = 1499;
      v15 = 2048;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _scanPredicatesWithMode:%ld", (uint8_t *)&v11, 0x1Cu);
    }

    -[WAIOReporterMessagePopulator _scanPredicatesWithMode:](self, "_scanPredicatesWithMode:", a3);
  }
  else
  {
    if (v10)
    {
      v11 = 136446466;
      v12 = "-[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:]";
      v13 = 1024;
      v14 = 1492;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _findChannelsAndBuildChannelCaches:kWAIORIOReporterSearchAllStaticPredicates", (uint8_t *)&v11, 0x12u);
    }

    -[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:](self, "_findChannelsAndBuildChannelCaches:", 0);
  }
}

- (void)_findChannelsAndBuildChannelCaches:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  NSMutableDictionary *cachedUsage;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  _BOOL4 v37;
  id v38;
  NSObject *v39;
  WAIOReporterMessagePopulator *v40;
  int64_t v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  const void *v49;
  uint64_t v50;
  uint64_t v51;
  const void *v52;
  id v53;
  NSObject *v54;
  int ChannelCount;
  int v56;
  int v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  int v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  id v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  unint64_t Count;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  unsigned int v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  unsigned int v102;
  id v103;
  NSObject *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  void *v108;
  const char *v109;
  id v110;
  NSObject *v111;
  id v112;
  NSObject *v113;
  id v114;
  id v115;
  NSObject *v116;
  id v117;
  NSObject *v118;
  const char *v119;
  id v120;
  NSObject *v121;
  uint32_t v122;
  id v123;
  id v124;
  NSObject *v125;
  __int16 v126;
  uint64_t v127;
  void *value;
  uint8_t buf[4];
  const char *v130;
  __int16 v131;
  int v132;
  __int16 v133;
  _BYTE v134[10];
  unint64_t v135;
  __int16 v136;
  unint64_t v137;
  __int16 v138;
  unint64_t v139;

  v127 = 0;
  value = 0;
  v126 = 0;
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Find Channels Calls"), self->_cachedUsage, self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    -[WAIOReporterMessagePopulator setCachedChannelsCountPerIORPopulatable:](self, "setCachedChannelsCountPerIORPopulatable:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", &off_1000E0020));
    v10 = objc_msgSend(v9, "count");

  }
  else
  {
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    -[WAIOReporterMessagePopulator setCachedIOPopAvailableChannels:](self, "setCachedIOPopAvailableChannels:", v8);
    v10 = 0;
  }

  if (a3 && !v10)
  {
    v11 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
      v131 = 1024;
      v132 = 1532;
      v133 = 2048;
      *(_QWORD *)v134 = a3;
      *(_WORD *)&v134[8] = 2048;
      v135 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:predicateSearch %ld when previousChannelCount %lu, changing predicateSearch to kWAIORIOReporterSearchAllStaticPredicates", buf, 0x26u);
    }

    a3 = 0;
LABEL_15:
    v17 = WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR FindChannelsAndBuildChannelCaches", ", buf, 2u);
    }

    v19 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
    if (v19)
    {
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", &off_1000E0020));
      if (!v22)
      {

        v26 = 0;
LABEL_34:

LABEL_35:
        if (HIBYTE(v126) | v126)
        {
          +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Fault Detection: Stale DriverID Count"), self->_cachedUsage, self->_queue);
          -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Fault Detection: Stale DriverID Date"));
          cachedUsage = self->_cachedUsage;
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v33, CFSTR("Fault Detection: Stale DriverID Date"));

          -[WAIOReporterMessagePopulator _clearIOReporterCache](self, "_clearIOReporterCache");
          v26 = 0;
        }
        else if ((_DWORD)v22)
        {
          v34 = -[NSMutableArray count](self->_cachedPredicatesNotYetFound, "count");
          v35 = WALogCategoryDefaultHandle();
          v36 = objc_claimAutoreleasedReturnValue(v35);
          v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (v34)
          {
            if (v37)
            {
              *(_DWORD *)buf = 136446722;
              v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              v131 = 1024;
              v132 = 1570;
              v133 = 2048;
              *(_QWORD *)v134 = a3;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Some predicates not found, searching %ld", buf, 0x1Cu);
            }

            v38 = WALogCategoryDefaultHandle();
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              v131 = 1024;
              v132 = 1572;
              v133 = 2048;
              *(_QWORD *)v134 = a3;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:%ld", buf, 0x1Cu);
            }

            v40 = self;
            v41 = a3;
          }
          else
          {
            if (v37)
            {
              *(_DWORD *)buf = 136446466;
              v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              v131 = 1024;
              v132 = 1575;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:All predicates found, searching kWAIORIOReporterSearchMutablePredicates", buf, 0x12u);
            }

            v46 = WALogCategoryDefaultHandle();
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              v131 = 1024;
              v132 = 1577;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchMutablePredicates", buf, 0x12u);
            }

            v40 = self;
            v41 = 3;
          }
          -[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:](v40, "_buildOrRescanToBuildChannelAvailabilityCaches:", v41);
LABEL_55:
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
          v49 = (const void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", &off_1000E0020));

          if (!v49 || (int)IOReportGetChannelCount(v49) <= 0)
          {
            v115 = WALogCategoryDefaultHandle();
            v116 = objc_claimAutoreleasedReturnValue(v115);
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              v131 = 1024;
              v132 = 1583;
              _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "%{public}s::%d:No WiFi Channels found", buf, 0x12u);
            }

            if (v49)
            {
              CFRelease(v49);
              v49 = 0;
            }
            goto LABEL_118;
          }
          if (!v26)
          {
            v50 = -[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN](self, "_getCCPipeDriverForWLAN");
            if ((_DWORD)v50)
            {
              v51 = IOReportCopyChannelsForDriver(v50, 0, &v127);
              v52 = (const void *)v51;
              if (v51 && (int)IOReportGetChannelCount(v51) > 0)
              {
                v53 = WALogCategoryDefaultHandle();
                v54 = objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  ChannelCount = IOReportGetChannelCount(v52);
                  v56 = IOReportGetChannelCount(v49);
                  *(_DWORD *)buf = 136446978;
                  v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  v131 = 1024;
                  v132 = 1592;
                  v133 = 1024;
                  *(_DWORD *)v134 = ChannelCount;
                  *(_WORD *)&v134[4] = 1024;
                  *(_DWORD *)&v134[6] = v56;
                  _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding %d channels to %d", buf, 0x1Eu);
                }

                v57 = IOReportMergeChannels(v49, v52, &v127);
                v58 = WALogCategoryDefaultHandle();
                v59 = objc_claimAutoreleasedReturnValue(v58);
                v60 = v59;
                if (!v57)
                {
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    v61 = IOReportGetChannelCount(v49);
                    *(_DWORD *)buf = 136446722;
                    v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    v131 = 1024;
                    v132 = 1598;
                    v133 = 1024;
                    *(_DWORD *)v134 = v61;
                    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Final channel count %d", buf, 0x18u);
                  }

                  CFRelease(v52);
                  goto LABEL_70;
                }
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446722;
                  v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  v131 = 1024;
                  v132 = 1596;
                  v133 = 2112;
                  *(_QWORD *)v134 = v127;
                  _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't get additionalChannels from CCLogPipe driver %@", buf, 0x1Cu);
                }

              }
              else
              {
                v124 = WALogCategoryDefaultHandle();
                v125 = objc_claimAutoreleasedReturnValue(v124);
                if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446722;
                  v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  v131 = 1024;
                  v132 = 1590;
                  v133 = 2112;
                  *(_QWORD *)v134 = v127;
                  _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't get additionalChannels from CCLogPipe driver %@", buf, 0x1Cu);
                }

                if (!v52)
                  goto LABEL_118;
              }
              CFRelease(v52);
              goto LABEL_118;
            }
            v62 = WALogCategoryDefaultHandle();
            v63 = objc_claimAutoreleasedReturnValue(v62);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              v131 = 1024;
              v132 = 1601;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't find _getCCPipeDriverForWLAN", buf, 0x12u);
            }

          }
LABEL_70:
          CFDictionaryGetValueIfPresent((CFDictionaryRef)v49, CFSTR("IOReportChannels"), (const void **)&value);
          if (value && CFArrayGetCount((CFArrayRef)value))
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));
            if (objc_msgSend(v64, "isEqualToString:", CFSTR("dunno")))
            {

            }
            else
            {
              v65 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));

              if (v65)
              {
LABEL_77:
                v69 = WALogCategoryDefaultHandle();
                v70 = objc_claimAutoreleasedReturnValue(v69);
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                {
                  v71 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));
                  *(_DWORD *)buf = 136446722;
                  v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  v131 = 1024;
                  v132 = 1616;
                  v133 = 2112;
                  *(_QWORD *)v134 = v71;
                  _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "%{public}s::%d:InterfaceName is %@", buf, 0x1Cu);

                }
                v72 = WALogCategoryDefaultHandle();
                v73 = objc_claimAutoreleasedReturnValue(v72);
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                {
                  v74 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", &off_1000E0020));
                  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("IOReportChannels")));
                  v77 = objc_msgSend(v76, "count");
                  *(_DWORD *)buf = 136446978;
                  v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  v131 = 1024;
                  v132 = 1619;
                  v133 = 2112;
                  *(_QWORD *)v134 = &off_1000E0020;
                  *(_WORD *)&v134[8] = 2048;
                  v135 = (unint64_t)v77;
                  _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Cached group %@ has size %lu", buf, 0x26u);

                }
                Count = CFArrayGetCount((CFArrayRef)value);
                v79 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
                v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", &off_1000E0020));
                v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("IOReportChannels")));
                v82 = objc_msgSend(v81, "count");

                if (v82 != (id)Count)
                {
                  v83 = WALogCategoryDefaultHandle();
                  v84 = objc_claimAutoreleasedReturnValue(v83);
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                  {
                    v85 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
                    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", &off_1000E0020));
                    v87 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
                    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", &off_1000E0020));
                    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("IOReportChannels")));
                    v90 = objc_msgSend(v89, "count");
                    *(_DWORD *)buf = 136447490;
                    v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    v131 = 1024;
                    v132 = 1625;
                    v133 = 2112;
                    *(_QWORD *)v134 = &off_1000E0020;
                    *(_WORD *)&v134[8] = 2112;
                    v135 = (unint64_t)v86;
                    v136 = 2048;
                    v137 = (unint64_t)v90;
                    v138 = 2048;
                    v139 = Count;
                    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found New Channels to add to cache for group %@, we know we should have %@, current cached channel size %lu new size %lu", buf, 0x3Au);

                  }
                  self->_ioReportersCacheNeedsUpdating = 1;
                  -[WAIOReporterMessagePopulator _freeSubscriptionSample:](self, "_freeSubscriptionSample:", &off_1000E0020);
                  v91 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
                  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:", &off_1000E0020));
                  v93 = objc_msgSend(v92, "unsignedIntValue");

                  if (Count > v93)
                  {
                    v94 = WALogCategoryDefaultHandle();
                    v95 = objc_claimAutoreleasedReturnValue(v94);
                    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
                    {
                      v96 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
                      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "objectForKeyedSubscript:", &off_1000E0020));
                      *(_DWORD *)buf = 136447234;
                      v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                      v131 = 1024;
                      v132 = 1632;
                      v133 = 2112;
                      *(_QWORD *)v134 = &off_1000E0020;
                      *(_WORD *)&v134[8] = 2112;
                      v135 = (unint64_t)v97;
                      v136 = 2048;
                      v137 = Count;
                      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Increasing max known channel count for group %@ from %@ to %lu", buf, 0x30u);

                    }
                    v98 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLong:", Count);
                    v99 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
                    objc_msgSend(v99, "setObject:forKeyedSubscript:", v98, &off_1000E0020);

                    goto LABEL_95;
                  }
                  v100 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
                  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", &off_1000E0020));
                  v102 = objc_msgSend(v101, "unsignedIntValue");

                  v103 = WALogCategoryDefaultHandle();
                  v104 = objc_claimAutoreleasedReturnValue(v103);
                  v105 = os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG);
                  if (Count == v102)
                  {
                    if (v105)
                    {
                      *(_DWORD *)buf = 136446722;
                      v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                      v131 = 1024;
                      v132 = 1635;
                      v133 = 2112;
                      *(_QWORD *)v134 = &off_1000E0020;
                      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEBUG, "%{public}s::%d:All known channels for group %@ have been found", buf, 0x1Cu);
                    }
                  }
                  else if (v105)
                  {
                    v106 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
                    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", &off_1000E0020));
                    *(_DWORD *)buf = 136447234;
                    v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    v131 = 1024;
                    v132 = 1637;
                    v133 = 2112;
                    *(_QWORD *)v134 = &off_1000E0020;
                    *(_WORD *)&v134[8] = 2048;
                    v135 = Count;
                    v136 = 2112;
                    v137 = (unint64_t)v107;
                    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEBUG, "%{public}s::%d:There are still missing channels for group %@ have %lu expect %@", buf, 0x30u);

                  }
                }
                if (Count)
                {
LABEL_95:
                  v108 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
                  objc_msgSend(v108, "setObject:forKeyedSubscript:", v49, &off_1000E0020);

                  CFRelease(v49);
                  v49 = 0;
                  v109 = "Success";
LABEL_96:
                  v110 = WALogCategoryDefaultHandle();
                  v111 = objc_claimAutoreleasedReturnValue(v110);
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136446722;
                    v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    v131 = 1024;
                    v132 = 1651;
                    v133 = 2080;
                    *(_QWORD *)v134 = v109;
                    _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finished Finding Channels and Building Caches... %s", buf, 0x1Cu);
                  }

                  if (v49)
                    CFRelease(v49);
                  -[WAIOReporterMessagePopulator _delayedInvocationForPersist](self, "_delayedInvocationForPersist");
                  v112 = WALogCategoryDefaultHandle();
                  v113 = objc_claimAutoreleasedReturnValue(v112);
                  if (os_signpost_enabled(v113))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v113, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR FindChannelsAndBuildChannelCaches", ", buf, 2u);
                  }
                  goto LABEL_102;
                }
                v120 = WALogCategoryDefaultHandle();
                v118 = objc_claimAutoreleasedReturnValue(v120);
                if (!os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                  goto LABEL_117;
                *(_DWORD *)buf = 136446722;
                v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                v131 = 1024;
                v132 = 1641;
                v133 = 2112;
                *(_QWORD *)v134 = &off_1000E0020;
                v119 = "%{public}s::%d:Didn't find any channels for populatable: %@ ";
                v121 = v118;
                v122 = 28;
                goto LABEL_116;
              }
            }
            v66 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "getInfraApple80211"));

            if (v67)
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "ifName"));
              -[WAIOReporterMessagePopulator setInfraInterfaceName:](self, "setInfraInterfaceName:", v68);

              goto LABEL_77;
            }
            v123 = WALogCategoryDefaultHandle();
            v118 = objc_claimAutoreleasedReturnValue(v123);
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              v131 = 1024;
              v132 = 1612;
              v119 = "%{public}s::%d:invalid apple80211API";
              goto LABEL_115;
            }
          }
          else
          {
            v117 = WALogCategoryDefaultHandle();
            v118 = objc_claimAutoreleasedReturnValue(v117);
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              v131 = 1024;
              v132 = 1608;
              v119 = "%{public}s::%d:Failed to copy any channels (via IOReportCopyChannelsForDrivers())... all IOReporter"
                     " metrics disabled";
LABEL_115:
              v121 = v118;
              v122 = 18;
LABEL_116:
              _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_ERROR, v119, buf, v122);
            }
          }
LABEL_117:

LABEL_118:
          v109 = "Failure";
          goto LABEL_96;
        }
        v42 = WALogCategoryDefaultHandle();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
          v131 = 1024;
          v132 = 1564;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No WiFi Channels exist in cache", buf, 0x12u);
        }

        v44 = WALogCategoryDefaultHandle();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
          v131 = 1024;
          v132 = 1566;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _scanPredicatesWithMode:kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
        }

        -[WAIOReporterMessagePopulator _scanPredicatesWithMode:](self, "_scanPredicatesWithMode:", 0);
        goto LABEL_55;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", &off_1000E0020));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("structuredDict")));

      if (v25)
      {
        v26 = -[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:](self, "doesDriverHaveChannelsInStructuredDict:containsStale:", 1, &v126);
        LODWORD(v22) = -[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:](self, "doesDriverHaveChannelsInStructuredDict:containsStale:", 0, (char *)&v126 + 1);
        v27 = WALogCategoryDefaultHandle();
        v20 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v28 = "is found";
          v29 = "is";
          if ((_DWORD)v22)
            v30 = "is found";
          else
            v30 = "is not found";
          v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
          v131 = 1024;
          v132 = 1550;
          *(_QWORD *)v134 = v30;
          if (HIBYTE(v126))
            v31 = "is";
          else
            v31 = "is not";
          *(_DWORD *)buf = 136447490;
          if (!v26)
            v28 = "is not found";
          v133 = 2080;
          *(_WORD *)&v134[8] = 2080;
          v135 = (unint64_t)v31;
          if (!(_BYTE)v126)
            v29 = "is not";
          v136 = 2080;
          v137 = (unint64_t)v28;
          v138 = 2080;
          v139 = (unint64_t)v29;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WiFi %s and %s stale, CoreCapture %s and %s stale", buf, 0x3Au);
        }
        goto LABEL_34;
      }
    }
    v26 = 0;
    LODWORD(v22) = 0;
    goto LABEL_35;
  }
  if (a3 != 2)
    goto LABEL_15;
  v13 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
  if (!v13
    || (v14 = (void *)v13,
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound")),
        v16 = objc_msgSend(v15, "count"),
        v15,
        v14,
        v16))
  {
    a3 = 2;
    goto LABEL_15;
  }
  v114 = WALogCategoryDefaultHandle();
  v113 = objc_claimAutoreleasedReturnValue(v114);
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
    v131 = 1024;
    v132 = 1539;
    _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:predicateSearch kWAIORIOReporterSearchUnfoundPredicates when cachedPredicatesNotYetFound count == 0 returning without scanning", buf, 0x12u);
  }
LABEL_102:

}

- (unsigned)_iorPreparedForSampling:(unsigned __int8)a3
{
  int v3;
  WAIOReporterMessagePopulator *v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  CFAllocatorRef Default;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CFTypeRef v41;
  CFErrorRef v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _UNKNOWN **v67;
  CFTypeRef v68;
  id v69;
  NSObject *v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  void *v74;
  id v75;
  NSObject *v76;
  id v77;
  NSObject *v78;
  CFErrorRef v79;
  CFErrorRef v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  NSObject *v100;
  id v101;
  NSObject *v102;
  id v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  int updated;
  id v115;
  NSObject *v116;
  id v117;
  NSObject *v118;
  CFErrorRef v119;
  BOOL v120;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  void *v138;
  void *v139;
  void *v140;
  NSMutableDictionary *cachedUsage;
  void *v142;
  id v143;
  NSObject *v144;
  id v146;
  id v147;
  const char *v148;
  NSObject *v149;
  uint32_t v150;
  id v151;
  NSObject *v152;
  id v153;
  const __CFString *v154;
  NSObject *v155;
  const char *v156;
  id v157;
  NSObject *v158;
  id v159;
  const __CFString *v160;
  id v161;
  NSObject *v162;
  id v163;
  const __CFString *v164;
  void *v165;
  void *v166;
  void *v167;
  unsigned __int8 v168;
  WAIOReporterMessagePopulator *v169;
  CFErrorRef v170;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v173;
  __int16 v174;
  int v175;
  __int16 v176;
  const __CFString *v177;
  __int16 v178;
  NSObject *v179;

  v3 = a3;
  v4 = self;
  v170 = 0;
  cf = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  v6 = &AnalyticsSendEventLazy_ptr;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));

    if (!v9)
    {
      v10 = objc_alloc_init((Class)NSMutableDictionary);
      -[WAIOReporterMessagePopulator setCachedIOReportSubbedChannels:](v4, "setCachedIOReportSubbedChannels:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));

    if (!v11)
    {
      v12 = objc_alloc_init((Class)NSMutableDictionary);
      -[WAIOReporterMessagePopulator setCachedIOReportSample:](v4, "setCachedIOReportSample:", v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));

    }
    v19 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR Prepare IOReporter", ", buf, 2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));
    v169 = v4;
    if (v23)
    {
      v24 = (void *)v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v26));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("iorsub")));

      if (v28)
        goto LABEL_33;
    }
    else
    {

    }
    v32 = WALogCategoryDefaultHandle();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
      v174 = 1024;
      v175 = 1714;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedIOReportSubbedChannels nil - running and caching IOReportCreateSubscription", buf, 0x12u);
    }

    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportCreateSubscription", ", buf, 2u);
    }

    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("CreateSubscription Calls"), v4->_cachedUsage, v4->_queue);
    Default = CFAllocatorGetDefault();
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](v4, "cachedIOPopAvailableChannels"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v38));
    v40 = (void *)IOReportCreateSubscription(Default, v39, &cf, 0, &v170);

    if (!v40 || (v41 = cf) == 0 || (v42 = v170) != 0)
    {
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("CreateSubscription Failed Calls"), v4->_cachedUsage, v4->_queue);
      v42 = v170;
      v41 = cf;
    }
    if (!v40 || !v41 || v42)
    {
      v151 = WALogCategoryDefaultHandle();
      v152 = objc_claimAutoreleasedReturnValue(v151);
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        v174 = 1024;
        v175 = 1726;
        _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create iorsub and subbedChannelsRef", buf, 0x12u);
      }

      if (v170)
      {
        v153 = WALogCategoryDefaultHandle();
        v71 = objc_claimAutoreleasedReturnValue(v153);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v154 = (const __CFString *)v170;
          v155 = objc_claimAutoreleasedReturnValue(-[__CFError localizedDescription](v170, "localizedDescription"));
          *(_DWORD *)buf = 136446978;
          v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
          v174 = 1024;
          v175 = 1726;
          v176 = 2112;
          v177 = v154;
          v178 = 2112;
          v179 = v155;
          v156 = "%{public}s::%d:Error returned from IOReportCreateSubscription(): %@ - localized description: %@";
LABEL_125:
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, v156, buf, 0x26u);

        }
LABEL_126:
        v30 = 0;
        LOBYTE(updated) = 0;
        goto LABEL_96;
      }
LABEL_133:
      v30 = 0;
      v168 = 0;
LABEL_97:
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
      v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "objectForKeyedSubscript:", v126));
      v128 = objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("iorsub")));
      if (v128)
      {
        v129 = (void *)v128;
        v130 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));
        v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
        v167 = v130;
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "objectForKeyedSubscript:", v131));
        v133 = objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("sampleValues")));
        if (v133)
        {
          v134 = (void *)v133;
          v166 = v125;
          v135 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));
          v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
          v137 = v30;
          v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "objectForKeyedSubscript:", v136));
          v165 = v126;
          v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("structuredDict")));

          v30 = v137;
          v6 = &AnalyticsSendEventLazy_ptr;
          if (v139)
          {
            v31 = 1;
LABEL_104:
            v143 = WALogCategoryDefaultHandle();
            v144 = objc_claimAutoreleasedReturnValue(v143);
            if (os_signpost_enabled(v144))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v144, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR Prepare IOReporter", ", buf, 2u);
            }

            goto LABEL_107;
          }
LABEL_103:
          v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[111], "numberWithUnsignedInteger:", 5));
          -[WAIOReporterMessagePopulator _freeSubscriptionSample:](v169, "_freeSubscriptionSample:", v140);

          +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("IOR Unprepared For Sample Count"), v169->_cachedUsage, v169->_queue);
          -[NSMutableDictionary removeObjectForKey:](v169->_cachedUsage, "removeObjectForKey:", CFSTR("IOR Unprepared For Sample Date"));
          cachedUsage = v169->_cachedUsage;
          v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v142, CFSTR("IOR Unprepared For Sample Date"));

          v31 = v168;
          goto LABEL_104;
        }

        v6 = &AnalyticsSendEventLazy_ptr;
      }

      goto LABEL_103;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v44));

    if (!v45)
    {
      v46 = objc_alloc_init((Class)NSMutableDictionary);
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v48);

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v50));
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v40, CFSTR("iorsub"));

    v52 = WALogCategoryDefaultHandle();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_signpost_enabled(v53))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportCreateSubscription", ", buf, 2u);
    }

LABEL_33:
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", v55));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("iorsub")));

    if (!v57)
    {
      v146 = WALogCategoryDefaultHandle();
      v71 = objc_claimAutoreleasedReturnValue(v146);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        v174 = 1024;
        v175 = 1740;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%{public}s::%d:Don't have iorsub, bailing", buf, 0x12u);
      }
      goto LABEL_126;
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v59));
    if (v60)
    {
      v61 = (void *)v60;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", v63));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("sampleValues")));

      if (v65)
      {
        v66 = 0;
        v6 = &AnalyticsSendEventLazy_ptr;
        v67 = &AnalyticsSendEventLazy_ptr;
        goto LABEL_63;
      }
    }
    else
    {

    }
    v68 = cf;
    v69 = WALogCategoryDefaultHandle();
    v70 = objc_claimAutoreleasedReturnValue(v69);
    v71 = v70;
    if (!v68)
    {
      v6 = &AnalyticsSendEventLazy_ptr;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        v174 = 1024;
        v175 = 1745;
        v176 = 2112;
        v177 = CFSTR("WAIORPopSuperSet");
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%{public}s::%d:sampleValues not yet saved, but subbedChannelsRef isn't set - state mismatch for: %@, clearing cache", buf, 0x1Cu);
      }
      v30 = 0;
      LOBYTE(updated) = 0;
      v4 = v169;
      goto LABEL_96;
    }
    v6 = &AnalyticsSendEventLazy_ptr;
    v67 = &AnalyticsSendEventLazy_ptr;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
      v174 = 1024;
      v175 = 1747;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedIOReportSample nil - running and caching IOReportCreateSamples", buf, 0x12u);
    }

    v72 = WALogCategoryDefaultHandle();
    v73 = objc_claimAutoreleasedReturnValue(v72);
    v4 = v169;
    if (os_signpost_enabled(v73))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportCreateSamples", ", buf, 2u);
    }

    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("CreateSamples Calls"), v169->_cachedUsage, v169->_queue);
    v74 = (void *)IOReportCreateSamples(v57, cf, &v170);
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    v75 = WALogCategoryDefaultHandle();
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (os_signpost_enabled(v76))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportCreateSamples", ", buf, 2u);
    }

    if (v169->_failNextCreateOrUpdateSample)
    {
      v77 = WALogCategoryDefaultHandle();
      v78 = objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        v174 = 1024;
        v175 = 1762;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%{public}s::%d:Injecting Error to IOReportCreateSamples due to _failNextCreateOrUpdateSample", buf, 0x12u);
      }

      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Fault Injection: Create or Update Sample Error"), v169->_cachedUsage, v169->_queue);
      v79 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainPOSIX, 1, 0);
      v170 = v79;
      v169->_failNextCreateOrUpdateSample = 0;
      if (!v74)
        goto LABEL_55;
    }
    else
    {
      v79 = v170;
      if (!v74)
        goto LABEL_55;
    }
    if (!v79)
    {
      v80 = 0;
LABEL_56:
      if (v74 && !v80)
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v169, "cachedIOReportSample"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", v82));

        if (!v83)
        {
          v84 = objc_alloc_init((Class)NSMutableDictionary);
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v169, "cachedIOReportSample"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
          objc_msgSend(v85, "setObject:forKeyedSubscript:", v84, v86);

        }
        v87 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v169, "cachedIOReportSample"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", v88));
        objc_msgSend(v89, "setObject:forKeyedSubscript:", v74, CFSTR("sampleValues"));

        v90 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v169, "cachedIOReportSample"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", v91));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("sampleValues")));

        v93 = WALogCategoryDefaultHandle();
        v94 = objc_claimAutoreleasedReturnValue(v93);
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446722;
          v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
          v174 = 1024;
          v175 = 1782;
          v176 = 2112;
          v177 = CFSTR("WAIORPopSuperSet");
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Stored new sampleValues for enum %@", buf, 0x1Cu);
        }

        v3 = 0;
LABEL_63:
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", v96));
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("structuredDict")));

        if (v98)
        {
          v30 = 0;
        }
        else
        {
          v99 = WALogCategoryDefaultHandle();
          v100 = objc_claimAutoreleasedReturnValue(v99);
          if (os_signpost_enabled(v100))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v100, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR createStructuredIOReportDictionary", ", buf, 2u);
          }

          v101 = WALogCategoryDefaultHandle();
          v102 = objc_claimAutoreleasedReturnValue(v101);
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
            v174 = 1024;
            v175 = 1789;
            v176 = 2112;
            v177 = CFSTR("WAIORPopSuperSet");
            _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Making createStructuredIOReportDictionary for %@", buf, 0x1Cu);
          }

          v30 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator _createStructuredIOReportDictionary:](v4, "_createStructuredIOReportDictionary:", v66));
          v103 = WALogCategoryDefaultHandle();
          v104 = objc_claimAutoreleasedReturnValue(v103);
          if (os_signpost_enabled(v104))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v104, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR createStructuredIOReportDictionary", ", buf, 2u);
          }

          v105 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));
          v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", v106));
          objc_msgSend(v107, "setObject:forKeyedSubscript:", v30, CFSTR("structuredDict"));

        }
        if (v3 != 1)
        {
          LOBYTE(updated) = 0;
          goto LABEL_89;
        }
        v108 = WALogCategoryDefaultHandle();
        v109 = objc_claimAutoreleasedReturnValue(v108);
        if (os_signpost_enabled(v109))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v109, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportUpdateSamples", ", buf, 2u);
        }

        v110 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));
        v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectForKeyedSubscript:", v111));
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("sampleValues")));

        objc_msgSend(v67[130], "incrementValueForKey:inMutableDict:onQueue:", CFSTR("UpdateSamples Calls"), v4->_cachedUsage, v4->_queue);
        updated = IOReportUpdateSamples(v113, v57, &v170);
        v115 = WALogCategoryDefaultHandle();
        v116 = objc_claimAutoreleasedReturnValue(v115);
        if (os_signpost_enabled(v116))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v116, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportUpdateSamples", ", buf, 2u);
        }

        if (v4->_failNextCreateOrUpdateSample)
        {
          v117 = WALogCategoryDefaultHandle();
          v118 = objc_claimAutoreleasedReturnValue(v117);
          if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
            v174 = 1024;
            v175 = 1812;
            _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "%{public}s::%d:Injecting Error to IOReportUpdateSamples due to _failNextCreateOrUpdateSample", buf, 0x12u);
          }

          objc_msgSend(v67[130], "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Fault Injection: Create or Update Sample Error"), v4->_cachedUsage, v4->_queue);
          v119 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainPOSIX, 1, 0);
          v170 = v119;
          v4->_failNextCreateOrUpdateSample = 0;
          if (!v113)
            goto LABEL_86;
        }
        else
        {
          v119 = v170;
          if (!v113)
            goto LABEL_86;
        }
        if (!v119)
        {
          v120 = 1;
LABEL_87:
          if (!updated || !v120)
          {
            v161 = WALogCategoryDefaultHandle();
            v162 = objc_claimAutoreleasedReturnValue(v161);
            if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
              v174 = 1024;
              v175 = 1822;
              v176 = 2112;
              v177 = CFSTR("WAIORPopSuperSet");
              _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOReportUpdateSamples failed for populatable: %@", buf, 0x1Cu);
            }

            if (v170)
            {
              v163 = WALogCategoryDefaultHandle();
              v71 = objc_claimAutoreleasedReturnValue(v163);
              if (!os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                goto LABEL_96;
              v164 = (const __CFString *)v170;
              v124 = objc_claimAutoreleasedReturnValue(-[__CFError localizedDescription](v170, "localizedDescription"));
              *(_DWORD *)buf = 136446978;
              v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
              v174 = 1024;
              v175 = 1822;
              v176 = 2112;
              v177 = v164;
              v178 = 2112;
              v179 = v124;
              v148 = "%{public}s::%d:Error returned from IOReportUpdateSamples(): %@ - localized description: %@";
              v149 = v71;
              v150 = 38;
              goto LABEL_132;
            }
            goto LABEL_92;
          }
LABEL_89:
          v121 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](v4, "infraInterfaceName"));
          if (objc_msgSend(v121, "isEqualToString:", CFSTR("dunno")))
          {

LABEL_93:
            v123 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
            v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "getInfraApple80211"));

            if (v71)
            {
              v124 = objc_claimAutoreleasedReturnValue(-[NSObject ifName](v71, "ifName"));
              -[WAIOReporterMessagePopulator setInfraInterfaceName:](v4, "setInfraInterfaceName:", v124);
LABEL_95:

LABEL_96:
              v168 = updated;

              goto LABEL_97;
            }
            v147 = WALogCategoryDefaultHandle();
            v124 = objc_claimAutoreleasedReturnValue(v147);
            if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
              goto LABEL_95;
            *(_DWORD *)buf = 136446466;
            v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
            v174 = 1024;
            v175 = 1827;
            v148 = "%{public}s::%d:invalid apple80211API";
            v149 = v124;
            v150 = 18;
LABEL_132:
            _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_ERROR, v148, buf, v150);
            goto LABEL_95;
          }
          v122 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](v4, "infraInterfaceName"));

          if (!v122)
            goto LABEL_93;
LABEL_92:
          v168 = updated;
          goto LABEL_97;
        }
LABEL_86:
        objc_msgSend(v67[130], "incrementValueForKey:inMutableDict:onQueue:", CFSTR("UpdateSamples Failed Calls"), v4->_cachedUsage, v4->_queue);
        v120 = v170 == 0;
        goto LABEL_87;
      }
      v157 = WALogCategoryDefaultHandle();
      v158 = objc_claimAutoreleasedReturnValue(v157);
      if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        v174 = 1024;
        v175 = 1772;
        v176 = 2112;
        v177 = CFSTR("WAIORPopSuperSet");
        _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOReportCreateSamples Failed for populatable: %@", buf, 0x1Cu);
      }

      if (v170)
      {
        v159 = WALogCategoryDefaultHandle();
        v71 = objc_claimAutoreleasedReturnValue(v159);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v160 = (const __CFString *)v170;
          v155 = objc_claimAutoreleasedReturnValue(-[__CFError localizedDescription](v170, "localizedDescription"));
          *(_DWORD *)buf = 136446978;
          v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
          v174 = 1024;
          v175 = 1772;
          v176 = 2112;
          v177 = v160;
          v178 = 2112;
          v179 = v155;
          v156 = "%{public}s::%d:Error returned from IOReportCreateSamples(): %@ - localized description: %@";
          goto LABEL_125;
        }
        goto LABEL_126;
      }
      goto LABEL_133;
    }
LABEL_55:
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("CreateSamples Failed Calls"), v169->_cachedUsage, v169->_queue);
    v80 = v170;
    goto LABEL_56;
  }
  v29 = WALogCategoryDefaultHandle();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
    v174 = 1024;
    v175 = 1691;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No Channels to build into subscriptions, find channels first", buf, 0x12u);
  }
  v31 = 0;
LABEL_107:

  return v31;
}

- (void)determineChannelsPerIORPopulatable
{
  char *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9[2];
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  v3 = (char *)os_signpost_id_generate((os_log_t)WALogCategoryDefault);
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v3, "IOR determineChannelsPerIORPopulatable", ", buf, 2u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E048;
  block[3] = &unk_1000CCD88;
  objc_copyWeak(v9, &location);
  block[4] = self;
  v9[1] = v3;
  dispatch_sync(v7, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)determineChannelsPerIORPopulatableWithinPopulatorBlock
{
  if (!self->_hasAttemptedUnpersisting)
    -[WAIOReporterMessagePopulator unpersistIORObjects](self, "unpersistIORObjects");
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("External: Determine Channels Within Blocks Calls"), self->_cachedUsage, self->_queue);
  -[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:](self, "_findChannelsAndBuildChannelCaches:", 1);
}

- (BOOL)doesMessageNeedPrepopulation:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000ECF58, "objectForKeyedSubscript:", a3));
  v4 = v3 != 0;

  return v4;
}

- (void)prepopulateMessageWithinPopulatorBlock:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a4;
  v11 = a6;
  if (!self->_hasAttemptedUnpersisting)
    -[WAIOReporterMessagePopulator _unpersistIORObjects](self, "_unpersistIORObjects");
  -[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:](self, "_prepopulateMessage:forProcess:groupType:andReply:isResubscribe:", v12, v10, a5, v11, 0);

}

- (void)prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  char *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26[3];
  id location;
  uint8_t buf[4];
  void *v29;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  v13 = (char *)os_signpost_id_generate((os_log_t)WALogCategoryDefault);
  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "originalClassName"));
    *(_DWORD *)buf = 138543362;
    v29 = v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "IOR prepopulateMessage", " message=%{public, signpost.description:attribute}@ ", buf, 0xCu);

  }
  v18 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001E444;
  v22[3] = &unk_1000CCDD8;
  objc_copyWeak(v26, &location);
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26[1] = (id)a5;
  v26[2] = v13;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  dispatch_sync(v18, v22);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)_prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6 isResubscribe:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSMutableDictionary *cachedUsage;
  void *v25;
  id v26;
  NSObject *v27;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  unsigned __int8 updated;
  id v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  CFErrorRef v54;
  const __CFString *v55;
  unsigned __int8 v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unsigned int v61;
  id v62;
  NSObject *v63;
  __CFString *v64;
  __CFString *v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  void *v84;
  id v85;
  NSObject *v86;
  __CFString *v87;
  void *v88;
  id v89;
  NSObject *v90;
  id v91;
  NSObject *v92;
  id v93;
  NSObject *v94;
  id v95;
  NSObject *v96;
  void *v97;
  id v98;
  NSObject *v99;
  id v100;
  NSObject *v101;
  NSObject *v102;
  const char *v103;
  NSObject *v104;
  os_log_type_t v105;
  id v106;
  NSObject *v107;
  id v108;
  id v109;
  id v110;
  NSObject *v111;
  id v112;
  id v113;
  NSObject *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  NSObject *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  dispatch_queue_global_t global_queue;
  NSObject *v125;
  id v126;
  NSObject *v127;
  id v128;
  NSObject *v129;
  id v130;
  NSObject *v131;
  const char *v132;
  id v133;
  __CFString *v134;
  void *v135;
  id v136;
  id v137;
  id v138;
  void *v139;
  __CFString *v140;
  id v141;
  NSObject *v142;
  id v143;
  const __CFString *v144;
  void *v145;
  const char *v146;
  id v147;
  NSObject *v148;
  id v149;
  const __CFString *v150;
  int64_t v151;
  BOOL v152;
  id v153;
  id v154;
  void *v155;
  _QWORD v156[5];
  NSObject *v157;
  id v158;
  _QWORD v159[5];
  NSObject *v160;
  id v161;
  _QWORD v162[5];
  NSObject *v163;
  id v164;
  _QWORD v165[5];
  NSObject *v166;
  id v167;
  __CFError *v168;
  uint8_t buf[4];
  const char *v170;
  __int16 v171;
  int v172;
  __int16 v173;
  const __CFString *v174;
  __int16 v175;
  void *v176;

  v12 = a3;
  v153 = a4;
  v154 = a6;
  v13 = v12;
  v168 = 0;
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator messageDelegate](self, "messageDelegate"));
  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateIOReporterChannels", ", buf, 2u);
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Populate IOReporter Calls"), self->_cachedUsage, self->_queue);
  v151 = a5;
  v152 = a7;
  if (!v13)
  {
    v130 = WALogCategoryDefaultHandle();
    v131 = objc_claimAutoreleasedReturnValue(v130);
    if (!os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      goto LABEL_111;
    *(_DWORD *)buf = 136446466;
    v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    v171 = 1024;
    v172 = 1936;
    v132 = "%{public}s::%d:ERROR messageToPopulate == nil";
LABEL_107:
    _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, v132, buf, 0x12u);
    goto LABEL_111;
  }
  v16 = (void *)qword_1000ECF58;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "originalClassName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));

  if (!v18)
  {
    v133 = WALogCategoryDefaultHandle();
    v131 = objc_claimAutoreleasedReturnValue(v133);
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      v134 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "originalClassName"));
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "key"));
      *(_DWORD *)buf = 136446978;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 1938;
      v173 = 2112;
      v174 = v134;
      v175 = 2112;
      v176 = v135;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAMessageAWD with original classname: %@ and key: %@ doesn't appear to be setup to be prepopulated. Sending it back as received.", buf, 0x26u);

LABEL_110:
    }
LABEL_111:

LABEL_56:
    v65 = 0;
    v57 = v153;
    goto LABEL_57;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v20));

  if (!v21)
  {
    v22 = WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 1942;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _findChannelsAndBuildChannelCaches:kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
    }

    -[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:](self, "_findChannelsAndBuildChannelCaches:", 0);
  }
  if (!-[WAIOReporterMessagePopulator _iorPreparedForSampling:](self, "_iorPreparedForSampling:", 0))
  {
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("IOR Full Teardown Count"), self->_cachedUsage, self->_queue);
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("IOR Full Teardown Date"));
    cachedUsage = self->_cachedUsage;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v25, CFSTR("IOR Full Teardown Date"));

    -[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles](self, "_removeIORChannelsPersistenceFiles");
    -[WAIOReporterMessagePopulator _freeIORCaches](self, "_freeIORCaches");
    v26 = WALogCategoryDefaultHandle();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 1957;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
    }

    -[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:](self, "_buildOrRescanToBuildChannelAvailabilityCaches:", 0);
    if (!-[WAIOReporterMessagePopulator _iorPreparedForSampling:](self, "_iorPreparedForSampling:", 0))
    {
      v91 = WALogCategoryDefaultHandle();
      v92 = objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
        v171 = 1024;
        v172 = 1961;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed second to _prepopulateMessage, bailing", buf, 0x12u);
      }

      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("IOR Full Teardown Failed Count"), self->_cachedUsage, self->_queue);
      goto LABEL_56;
    }
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("IOR Full Teardown Recovered Count"), self->_cachedUsage, self->_queue);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v29));

  if (!v30)
  {
    v136 = WALogCategoryDefaultHandle();
    v131 = objc_claimAutoreleasedReturnValue(v136);
    if (!os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      goto LABEL_111;
    *(_DWORD *)buf = 136446466;
    v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    v171 = 1024;
    v172 = 1970;
    v132 = "%{public}s::%d:XPC: Didn't have cachedIOPopAvailableChannels, bailing";
    goto LABEL_107;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](self, "cachedIOReportSubbedChannels"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v32));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("iorsub")));

  if (!v34)
  {
    v137 = WALogCategoryDefaultHandle();
    v131 = objc_claimAutoreleasedReturnValue(v137);
    if (!os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      goto LABEL_111;
    *(_DWORD *)buf = 136446466;
    v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    v171 = 1024;
    v172 = 1975;
    v132 = "%{public}s::%d:XPC: Didn't have cachedIOReportSubbedChannels iorsub, bailing";
    goto LABEL_107;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](self, "cachedIOReportSubbedChannels"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v36));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("iorsub")));

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v40));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("sampleValues")));

  if (!v42)
  {
    v138 = WALogCategoryDefaultHandle();
    v131 = objc_claimAutoreleasedReturnValue(v138);
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      v134 = (__CFString *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
      v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
      v140 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v134, "objectForKeyedSubscript:", v139));
      *(_DWORD *)buf = 136446722;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 1980;
      v173 = 2112;
      v174 = v140;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "%{public}s::%d:Dont have cachedIOReportSample sampleValues %@", buf, 0x1Cu);

      goto LABEL_110;
    }
    goto LABEL_111;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v44));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("sampleValues")));

  v47 = WALogCategoryDefaultHandle();
  v48 = objc_claimAutoreleasedReturnValue(v47);
  if (os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportUpdateSamples", ", buf, 2u);
  }

  updated = IOReportUpdateSamples(v46, v38, &v168);
  v50 = WALogCategoryDefaultHandle();
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportUpdateSamples", ", buf, 2u);
  }

  if (self->_failNextCreateOrUpdateSample)
  {
    v52 = WALogCategoryDefaultHandle();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 1993;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%{public}s::%d:Injecting Error to IOReportUpdateSamples due to _failNextCreateOrUpdateSample", buf, 0x12u);
    }

    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Fault Injection: Create or Update Sample Error"), self->_cachedUsage, self->_queue);
    v54 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainPOSIX, 1, 0);
    v168 = v54;
    self->_failNextCreateOrUpdateSample = 0;
  }
  else
  {
    v54 = v168;
  }
  if ((updated & (v54 == 0)) != 0)
    v55 = CFSTR("UpdateSamples Calls");
  else
    v55 = CFSTR("UpdateSamples Failed Calls");
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", v55, self->_cachedUsage, self->_queue);
  if (v168)
    v56 = 0;
  else
    v56 = updated;
  if ((v56 & 1) == 0)
  {
    v141 = WALogCategoryDefaultHandle();
    v142 = objc_claimAutoreleasedReturnValue(v141);
    v57 = v153;
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 2005;
      v173 = 2112;
      v174 = CFSTR("WAIORPopSuperSet");
      _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOReportUpdateSamples failed for populatable: %@", buf, 0x1Cu);
    }

    if (!v168)
      goto LABEL_39;
    v143 = WALogCategoryDefaultHandle();
    v63 = objc_claimAutoreleasedReturnValue(v143);
    if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v144 = (const __CFString *)v168;
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError localizedDescription](v168, "localizedDescription"));
    *(_DWORD *)buf = 136446978;
    v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    v171 = 1024;
    v172 = 2005;
    v173 = 2112;
    v174 = v144;
    v175 = 2112;
    v176 = v145;
    v146 = "%{public}s::%d:Error returned from IOReportUpdateSamples(): %@ - localized description: %@";
    goto LABEL_122;
  }
  v57 = v153;
  if (!v46)
  {
    v147 = WALogCategoryDefaultHandle();
    v148 = objc_claimAutoreleasedReturnValue(v147);
    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 2022;
      v173 = 2112;
      v174 = CFSTR("WAIORPopSuperSet");
      _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Failed to get sample values for populatable type: %@", buf, 0x1Cu);
    }

    if (!v168)
      goto LABEL_39;
    v149 = WALogCategoryDefaultHandle();
    v63 = objc_claimAutoreleasedReturnValue(v149);
    if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
LABEL_38:

LABEL_39:
      v65 = 0;
      goto LABEL_57;
    }
    v150 = (const __CFString *)v168;
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError localizedDescription](v168, "localizedDescription"));
    *(_DWORD *)buf = 136446978;
    v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    v171 = 1024;
    v172 = 2022;
    v173 = 2112;
    v174 = v150;
    v175 = 2112;
    v176 = v145;
    v146 = "%{public}s::%d:Error returned from IOReportCreateSamples(): %@ - localized description: %@";
LABEL_122:
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, v146, buf, 0x26u);

    goto LABEL_38;
  }
  v58 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));
  if (!v58
    || (v59 = (void *)v58,
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName")),
        v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("dunno")),
        v60,
        v59,
        v61))
  {
    v62 = WALogCategoryDefaultHandle();
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));
      *(_DWORD *)buf = 136446722;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 2024;
      v173 = 2112;
      v174 = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad infraInterfaceName: %@", buf, 0x1Cu);

    }
    goto LABEL_38;
  }
  v66 = WALogCategoryDefaultHandle();
  v67 = objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", v69));
    v71 = (const __CFString *)objc_msgSend(v70, "count");
    *(_DWORD *)buf = 136446722;
    v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    v171 = 1024;
    v172 = 2026;
    v173 = 2048;
    v174 = v71;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "%{public}s::%d:cachedIOReportSample has %lu entries in dictionary", buf, 0x1Cu);

  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", v73));
  v65 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("structuredDict")));

  if (v65)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString allKeys](v65, "allKeys"));
    v76 = objc_msgSend(v75, "count");

    if (v76)
    {
      v77 = WALogCategoryDefaultHandle();
      v78 = objc_claimAutoreleasedReturnValue(v77);
      if (os_signpost_enabled(v78))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v78, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR PopulationGroup", ", buf, 2u);
      }

      v79 = (void *)qword_1000ECF58;
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "originalClassName"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", v80));
      v82 = objc_msgSend(v81, "unsignedIntegerValue");

      v83 = dispatch_group_create();
      dispatch_group_enter(v83);
      dispatch_group_enter(v83);
      v84 = v154;
      switch((unint64_t)v82)
      {
        case 0uLL:
        case 6uLL:
          v85 = WALogCategoryDefaultHandle();
          v86 = objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            v87 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "key"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "originalClassName"));
            *(_DWORD *)buf = 136446978;
            v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
            v171 = 1024;
            v172 = 2103;
            v173 = 2112;
            v174 = v87;
            v175 = 2112;
            v176 = v88;
            _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%{public}s::%d:unhandled WAIOReporterPopulatableType type! not populating message with key: %@ and classname: %@", buf, 0x26u);

          }
          dispatch_group_leave(v83);
          break;
        case 1uLL:
          v113 = WALogCategoryDefaultHandle();
          v114 = objc_claimAutoreleasedReturnValue(v113);
          if (os_signpost_enabled(v114))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v114, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR WAIORPopNWActivity Iterator", ", buf, 2u);
          }

          v115 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));
          v165[0] = _NSConcreteStackBlock;
          v165[1] = 3221225472;
          v165[2] = sub_10001FCE0;
          v165[3] = &unk_1000CCE00;
          v165[4] = self;
          v167 = v154;
          v166 = v83;
          sub_100005400((uint64_t)v166, v13, v46, v65, v155, v151, v153, v115, v165);

          v116 = v167;
          goto LABEL_91;
        case 2uLL:
          v117 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));
          v162[0] = _NSConcreteStackBlock;
          v162[1] = 3221225472;
          v162[2] = sub_10001FE6C;
          v162[3] = &unk_1000CCE00;
          v162[4] = self;
          v164 = v154;
          v163 = v83;
          sub_1000109EC((uint64_t)v163, v13, v46, v65, v155, v151, v153, v117, v162);

          v116 = v164;
          goto LABEL_91;
        case 3uLL:
          v118 = WALogCategoryDefaultHandle();
          v119 = objc_claimAutoreleasedReturnValue(v118);
          if (os_signpost_enabled(v119))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v119, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR WAIORPopSlowWiFiDiagnosticsCounterSample Iterator", ", buf, 2u);
          }

          v120 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));
          v156[0] = _NSConcreteStackBlock;
          v156[1] = 3221225472;
          v156[2] = sub_10001FF84;
          v156[3] = &unk_1000CCE00;
          v156[4] = self;
          v158 = v154;
          v157 = v83;
          sub_100013D30((uint64_t)v157, v13, v46, v65, v155, v121, v153, v120, v156);

          v116 = v158;
          goto LABEL_91;
        case 4uLL:
          v122 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator infraInterfaceName](self, "infraInterfaceName"));
          v159[0] = _NSConcreteStackBlock;
          v159[1] = 3221225472;
          v159[2] = sub_10001FEF8;
          v159[3] = &unk_1000CCE00;
          v159[4] = self;
          v161 = v154;
          v160 = v83;
          sub_100012A68((uint64_t)v160, v13, v46, v65, v155, v123, v153, v122, v159);

          v116 = v161;
LABEL_91:

          break;
        case 5uLL:
          v128 = WALogCategoryDefaultHandle();
          v129 = objc_claimAutoreleasedReturnValue(v128);
          if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
            v171 = 1024;
            v172 = 2044;
            _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAIORPopSuperSet does not map to a message, replace enumToPopulate of WAIORPopSuperSet back to the intended enumToPopulate", buf, 0x12u);
          }

          break;
        default:
          break;
      }
      global_queue = dispatch_get_global_queue(2, 0);
      v125 = objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_group_notify(v83, v125, &stru_1000CCE20);

      dispatch_group_leave(v83);
      v126 = WALogCategoryDefaultHandle();
      v127 = objc_claimAutoreleasedReturnValue(v126);
      if (os_signpost_enabled(v127))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v127, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateIOReporterChannels", ", buf, 2u);
      }

      goto LABEL_95;
    }
  }
  v89 = WALogCategoryDefaultHandle();
  v90 = objc_claimAutoreleasedReturnValue(v89);
  if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    v171 = 1024;
    v172 = 2032;
    v173 = 2112;
    v174 = v65;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad structuredIOReportSample %@", buf, 0x1Cu);
  }

LABEL_57:
  v93 = WALogCategoryDefaultHandle();
  v94 = objc_claimAutoreleasedReturnValue(v93);
  if (os_signpost_enabled(v94))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v94, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateExiting", ", buf, 2u);
  }

  if (v168)
  {
    v95 = WALogCategoryDefaultHandle();
    v96 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 2123;
      v173 = 2112;
      v174 = (const __CFString *)v168;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%{public}s::%d:Encountered an IOReporter error trying to prepopulate a message. Error: %@", buf, 0x1Cu);
    }

    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 5));
    -[WAIOReporterMessagePopulator _freeSubscriptionSample:](self, "_freeSubscriptionSample:", v97);

    if (v168)
    {
      CFRelease(v168);
      v168 = 0;
    }
    -[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles](self, "_removeIORChannelsPersistenceFiles");
    -[WAIOReporterMessagePopulator _clearIOReporterCache](self, "_clearIOReporterCache");
    v98 = WALogCategoryDefaultHandle();
    v99 = objc_claimAutoreleasedReturnValue(v98);
    v84 = v154;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 2135;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
    }

    -[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:](self, "_buildOrRescanToBuildChannelAvailabilityCaches:", 0);
    v100 = WALogCategoryDefaultHandle();
    v101 = objc_claimAutoreleasedReturnValue(v100);
    v102 = v101;
    if (v152)
    {
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        goto LABEL_78;
      *(_DWORD *)buf = 136446466;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 2143;
      v103 = "%{public}s::%d:Already attempted a resubscription - returning without success";
      v104 = v102;
      v105 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
        v171 = 1024;
        v172 = 2139;
        _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Will attempt a resubscription", buf, 0x12u);
      }

      -[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:](self, "_prepopulateMessage:forProcess:groupType:andReply:isResubscribe:", v13, v57, v151, v154, 1);
      v109 = WALogCategoryDefaultHandle();
      v102 = objc_claimAutoreleasedReturnValue(v109);
      if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
LABEL_78:

        v110 = WALogCategoryDefaultHandle();
        v111 = objc_claimAutoreleasedReturnValue(v110);
        if (os_signpost_enabled(v111))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v111, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateIOReporterChannels", ", buf, 2u);
        }

        v112 = WALogCategoryDefaultHandle();
        v83 = objc_claimAutoreleasedReturnValue(v112);
        if (os_signpost_enabled(v83))
        {
          *(_WORD *)buf = 0;
          goto LABEL_82;
        }
        goto LABEL_95;
      }
      *(_DWORD *)buf = 136446466;
      v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      v171 = 1024;
      v172 = 2141;
      v103 = "%{public}s::%d:Resubscription attempt done";
      v104 = v102;
      v105 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl((void *)&_mh_execute_header, v104, v105, v103, buf, 0x12u);
    goto LABEL_78;
  }
  v84 = v154;
  (*((void (**)(id, _QWORD, _QWORD))v154 + 2))(v154, 0, 0);
  v106 = WALogCategoryDefaultHandle();
  v107 = objc_claimAutoreleasedReturnValue(v106);
  if (os_signpost_enabled(v107))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v107, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateIOReporterChannels", ", buf, 2u);
  }

  v108 = WALogCategoryDefaultHandle();
  v83 = objc_claimAutoreleasedReturnValue(v108);
  if (os_signpost_enabled(v83))
  {
    *(_WORD *)buf = 0;
LABEL_82:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateExiting", ", buf, 2u);
  }
LABEL_95:

}

+ (id)getIORPopAvailabeIOReportersTempFile
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ch.out"), v3));

  return v4;
}

+ (id)getUnavailablePredTempFile
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@unavail.out"), v3));

  return v4;
}

+ (id)getUsageTempFile
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@usage.out"), v3));

  return v4;
}

- (void)_removeIORChannelsPersistenceFiles
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile](WAIOReporterMessagePopulator, "getIORPopAvailabeIOReportersTempFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v29 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v29);
  v6 = v29;

  if ((v5 & 1) != 0)
  {
    v7 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      v32 = 1024;
      v33 = 2184;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile file is not deletable", buf, 0x12u);
    }
  }
  else
  {
    if (v6 && objc_msgSend(v6, "code") != (id)2)
    {
      v14 = WALogCategoryDefaultHandle();
      v8 = objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "underlyingErrors"));
      *(_DWORD *)buf = 136446978;
      v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      v32 = 1024;
      v33 = 2179;
      v34 = 2112;
      v35 = v3;
      v36 = 2112;
      v37 = v10;
      v11 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile error removing file %@: %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      v9 = WALogCategoryDefaultHandle();
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      *(_DWORD *)buf = 136446978;
      v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      v32 = 1024;
      v33 = 2181;
      v34 = 2112;
      v35 = v3;
      v36 = 2112;
      v37 = v10;
      v11 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile successful or does not exist %@: %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, 0x26u);

  }
LABEL_11:

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUnavailablePredTempFile](WAIOReporterMessagePopulator, "getUnavailablePredTempFile"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v15, 0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v28 = v6;
  v18 = objc_msgSend(v17, "removeItemAtURL:error:", v16, &v28);
  v19 = v28;

  if ((v18 & 1) == 0)
  {
    if (v19 && objc_msgSend(v19, "code") != (id)2)
    {
      v27 = WALogCategoryDefaultHandle();
      v21 = objc_claimAutoreleasedReturnValue(v27);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "underlyingErrors"));
      *(_DWORD *)buf = 136446978;
      v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      v32 = 1024;
      v33 = 2190;
      v34 = 2112;
      v35 = v16;
      v36 = 2112;
      v37 = v23;
      v24 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile error removing file %@: %@";
      v25 = v21;
      v26 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      v22 = WALogCategoryDefaultHandle();
      v21 = objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "description"));
      *(_DWORD *)buf = 136446978;
      v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      v32 = 1024;
      v33 = 2192;
      v34 = 2112;
      v35 = v16;
      v36 = 2112;
      v37 = v23;
      v24 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile successful or does not exist %@: %@";
      v25 = v21;
      v26 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, 0x26u);

    goto LABEL_21;
  }
  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
    v32 = 1024;
    v33 = 2195;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile file is not deletable", buf, 0x12u);
  }
LABEL_21:

}

- (void)_clearIOReporterCache
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v12 = 136446466;
    v13 = "-[WAIOReporterMessagePopulator _clearIOReporterCache]";
    v14 = 1024;
    v15 = 2202;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Removing IOReporter Cache", (uint8_t *)&v12, 0x12u);
  }

  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR clearIOReporterCache", ", (uint8_t *)&v12, 2u);
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("clearIOReporterCaches Calls"), self->_cachedUsage, self->_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  objc_msgSend(v7, "removeAllObjects");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable](self, "cachedChannelsCountPerIORPopulatable"));
  objc_msgSend(v8, "removeAllObjects");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
  objc_msgSend(v9, "removeAllObjects");

  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR clearIOReporterCache", ", (uint8_t *)&v12, 2u);
  }

}

- (void)injectErrorOnNextCreateOrUpdateSample
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020968;
  v4[3] = &unk_1000CCE48;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *cachedChannelsCountPerIORPopulatable;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  NSMutableDictionary *v17;

  v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR encodeWithCoder", ", (uint8_t *)&v12, 2u);
  }

  objc_msgSend(v4, "encodeObject:forKey:", self->_cachedChannelsCountPerIORPopulatable, CFSTR("_cachedChannelsCountPerIORPopulatable"));
  v7 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    cachedChannelsCountPerIORPopulatable = self->_cachedChannelsCountPerIORPopulatable;
    v12 = 136446722;
    v13 = "-[WAIOReporterMessagePopulator encodeWithCoder:]";
    v14 = 1024;
    v15 = 2234;
    v16 = 2112;
    v17 = cachedChannelsCountPerIORPopulatable;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:encoded _cachedChannelsCountPerIORPopulatable %@", (uint8_t *)&v12, 0x1Cu);
  }

  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR encodeWithCoder", ", (uint8_t *)&v12, 2u);
  }

}

- (WAIOReporterMessagePopulator)initWithCoder:(id)a3
{
  id v4;
  WAIOReporterMessagePopulator *v5;
  void *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *cachedChannelsCountPerIORPopulatable;
  id v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSString *drvName;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  NSMutableDictionary *v26;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WAIOReporterMessagePopulator;
  v5 = -[WAIOReporterMessagePopulator init](&v20, "init");
  if (v5)
  {
    if (qword_1000ECF98 != -1)
      dispatch_once(&qword_1000ECF98, &stru_1000CCCF0);
    if (qword_1000ECF80 != -1)
      dispatch_once(&qword_1000ECF80, &stru_1000CCC90);
    if (qword_1000ECF88 != -1)
      dispatch_once(&qword_1000ECF88, &stru_1000CCCB0);
    if (qword_1000ECF90 != -1)
      dispatch_once(&qword_1000ECF90, &stru_1000CCCD0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dunno")));
    -[WAIOReporterMessagePopulator setInfraInterfaceName:](v5, "setInfraInterfaceName:", v6);

    *(_WORD *)&v5->_ioReportersCacheNeedsUpdating = 0;
    v5->_persistFileExistedAtPIDLoad = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.wifi.analytics.IOReporterQ", v8);
    -[WAIOReporterMessagePopulator setQueue:](v5, "setQueue:", v9);

    v10 = objc_opt_class(NSDictionary);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(NSNumber), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_cachedChannelsCountPerIORPopulatable")));
    cachedChannelsCountPerIORPopulatable = v5->_cachedChannelsCountPerIORPopulatable;
    v5->_cachedChannelsCountPerIORPopulatable = (NSMutableDictionary *)v13;

    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = v5->_cachedChannelsCountPerIORPopulatable;
      *(_DWORD *)buf = 136446722;
      v22 = "-[WAIOReporterMessagePopulator initWithCoder:]";
      v23 = 1024;
      v24 = 2265;
      v25 = 2112;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:initWithCoder _cachedChannelsCountPerIORPopulatable %@", buf, 0x1Cu);
    }

    drvName = v5->_drvName;
    v5->_drvName = 0;

  }
  return v5;
}

- (void)unpersistIORObjects
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020E70;
  v4[3] = &unk_1000CCE48;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_unpersistIORObjects
{
  id v3;
  NSObject *v4;
  void *v5;
  _UNKNOWN **v6;
  int *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  id v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSSet *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  _BOOL4 v42;
  id v43;
  id v44;
  const char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSSet *v55;
  void *v56;
  id v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  NSObject *v70;
  _BOOL4 v71;
  id v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSSet *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  NSObject *v87;
  NSObject *v88;
  void *v89;
  id v90;
  id v91;
  NSObject *v92;
  void *v93;
  id v94;
  NSObject *v95;
  const char *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  id v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  uint8_t buf[4];
  const char *v117;
  __int16 v118;
  int v119;
  __int16 v120;
  id v121;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR Unpersist", ", buf, 2u);
  }

  -[WAIOReporterMessagePopulator setCachedIOPopAvailableChannels:](self, "setCachedIOPopAvailableChannels:", 0);
  -[WAIOReporterMessagePopulator setCachedPredicatesNotYetFound:](self, "setCachedPredicatesNotYetFound:", 0);
  -[WAIOReporterMessagePopulator setCachedUsage:](self, "setCachedUsage:", 0);
  v5 = objc_autoreleasePoolPush();
  v6 = &AnalyticsSendEventLazy_ptr;
  v7 = &OBJC_IVAR___RecommendationPreferences__ior_rescan_new_phy_delay_seconds;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile](WAIOReporterMessagePopulator, "getIORPopAvailabeIOReportersTempFile"));
  v115 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v8, 8, &v115));
  v10 = v115;

  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v13)
      goto LABEL_22;
    *(_DWORD *)buf = 136446466;
    v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    v118 = 1024;
    v119 = 2332;
    v16 = "%{public}s::%d:unpersist cachedIOPopAvailableChannels file not available";
    v17 = v12;
    v18 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_11;
  }
  if (v13)
  {
    v14 = objc_msgSend(v9, "length");
    *(_DWORD *)buf = 136446722;
    v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    v118 = 1024;
    v119 = 2314;
    v120 = 2048;
    v121 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:from file: cachedIOPopAvailableChannelsData NSData sizeof is %lu", buf, 0x1Cu);
  }

  if (v10)
  {
    v15 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136446466;
    v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    v118 = 1024;
    v119 = 2329;
    v16 = "%{public}s::%d:Failed to unpersist cachedIOPopAvailableChannels";
    v17 = v12;
    v18 = OS_LOG_TYPE_ERROR;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, 0x12u);
    goto LABEL_22;
  }
  v107 = v5;
  v19 = objc_opt_class(NSDictionary);
  v20 = objc_opt_class(NSMutableDictionary);
  v21 = objc_opt_class(NSArray);
  v22 = objc_opt_class(NSMutableArray);
  v23 = objc_opt_class(NSData);
  v24 = objc_opt_class(NSMutableData);
  v25 = objc_opt_class(NSString);
  v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v20, v21, v22, v23, v24, v25, objc_opt_class(NSNumber), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v114 = 0;
  v12 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v27, v9, &v114));
  v28 = v114;

  v29 = WALogCategoryDefaultHandle();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  v31 = v30;
  if (v28 || !v12)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2320;
      v120 = 2112;
      v121 = v28;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive cachedIOPopAvailableChannels: %@", buf, 0x1Cu);
    }

    v5 = v107;
    v6 = &AnalyticsSendEventLazy_ptr;
    v7 = &OBJC_IVAR___RecommendationPreferences__ior_rescan_new_phy_delay_seconds;
  }
  else
  {
    v7 = &OBJC_IVAR___RecommendationPreferences__ior_rescan_new_phy_delay_seconds;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_opt_class(v12);
      *(_DWORD *)buf = 136446722;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2323;
      v120 = 2112;
      v121 = v32;
      v33 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist rootChannelDictionary class is %@", buf, 0x1Cu);

    }
    -[WAIOReporterMessagePopulator setCachedIOPopAvailableChannels:](self, "setCachedIOPopAvailableChannels:", v12);
    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    v6 = &AnalyticsSendEventLazy_ptr;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2326;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedIOPopAvailableChannels success", buf, 0x12u);
    }

    v5 = v107;
  }
LABEL_22:

  v36 = v6[93];
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7 + 212, "getUnavailablePredTempFile"));
  v113 = 0;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dataWithContentsOfFile:options:error:", v37, 8, &v113));
  v39 = v113;

  v40 = WALogCategoryDefaultHandle();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
  if (!v38)
  {
    if (!v42)
      goto LABEL_41;
    *(_DWORD *)buf = 136446466;
    v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    v118 = 1024;
    v119 = 2358;
    v45 = "%{public}s::%d:unpersist cachedPredicatesNotYetFound file not available";
    v46 = v41;
    v47 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_30;
  }
  if (v42)
  {
    v43 = objc_msgSend(v38, "length");
    *(_DWORD *)buf = 136446722;
    v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    v118 = 1024;
    v119 = 2341;
    v120 = 2048;
    v121 = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:from file: cachedUnavailableArrayData NSData sizeof is %lu", buf, 0x1Cu);
  }

  if (v39)
  {
    v44 = WALogCategoryDefaultHandle();
    v41 = objc_claimAutoreleasedReturnValue(v44);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_DWORD *)buf = 136446466;
    v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    v118 = 1024;
    v119 = 2355;
    v45 = "%{public}s::%d:Failed to unpersist cachedPredicatesNotYetFound";
    v46 = v41;
    v47 = OS_LOG_TYPE_ERROR;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v46, v47, v45, buf, 0x12u);
    goto LABEL_41;
  }
  v108 = v5;
  v48 = objc_opt_class(NSDictionary);
  v49 = objc_opt_class(NSMutableDictionary);
  v50 = objc_opt_class(NSArray);
  v51 = objc_opt_class(NSMutableArray);
  v52 = objc_opt_class(v6[93]);
  v53 = objc_opt_class(NSMutableData);
  v54 = objc_opt_class(NSString);
  v55 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v48, v49, v50, v51, v52, v53, v54, objc_opt_class(NSNumber), 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v112 = 0;
  v41 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v56, v38, &v112));
  v57 = v112;

  v58 = WALogCategoryDefaultHandle();
  v59 = objc_claimAutoreleasedReturnValue(v58);
  v60 = v59;
  if (v57 || !v41)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2346;
      v120 = 2112;
      v121 = v57;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive cachedPredicatesNotYetFound: %@", buf, 0x1Cu);
    }

    v5 = v108;
    v6 = &AnalyticsSendEventLazy_ptr;
    v7 = &OBJC_IVAR___RecommendationPreferences__ior_rescan_new_phy_delay_seconds;
  }
  else
  {
    v7 = &OBJC_IVAR___RecommendationPreferences__ior_rescan_new_phy_delay_seconds;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v61 = (void *)objc_opt_class(v41);
      *(_DWORD *)buf = 136446722;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2349;
      v120 = 2112;
      v121 = v61;
      v62 = v61;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedUnavailableArray class is %@", buf, 0x1Cu);

    }
    -[WAIOReporterMessagePopulator setCachedPredicatesNotYetFound:](self, "setCachedPredicatesNotYetFound:", v41);
    v63 = WALogCategoryDefaultHandle();
    v64 = objc_claimAutoreleasedReturnValue(v63);
    v6 = &AnalyticsSendEventLazy_ptr;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2352;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedPredicatesNotYetFound success", buf, 0x12u);
    }

    v5 = v108;
  }
LABEL_41:

  v65 = v6[93];
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7 + 212, "getUsageTempFile"));
  v111 = 0;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "dataWithContentsOfFile:options:error:", v66, 8, &v111));
  v68 = v111;

  v69 = WALogCategoryDefaultHandle();
  v70 = objc_claimAutoreleasedReturnValue(v69);
  v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
  if (v67)
  {
    if (v71)
    {
      v72 = objc_msgSend(v67, "length");
      *(_DWORD *)buf = 136446722;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2367;
      v120 = 2048;
      v121 = v72;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:from file: usageDictData NSData sizeof is %lu", buf, 0x1Cu);
    }

    self->_persistFileExistedAtPIDLoad = 1;
    if (v68)
    {
      v73 = WALogCategoryDefaultHandle();
      v74 = objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
        v118 = 1024;
        v119 = 2382;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unpersist cachedUsage", buf, 0x12u);
      }

    }
    else
    {
      v109 = v5;
      v106 = objc_opt_class(NSDictionary);
      v75 = objc_opt_class(NSMutableDictionary);
      v76 = objc_opt_class(NSArray);
      v77 = objc_opt_class(NSMutableArray);
      v78 = objc_opt_class(v6[93]);
      v79 = objc_opt_class(NSDate);
      v80 = objc_opt_class(NSMutableData);
      v81 = objc_opt_class(NSString);
      v82 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v106, v75, v76, v77, v78, v79, v80, v81, objc_opt_class(NSNumber), 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
      v110 = 0;
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v83, v67, &v110));
      v85 = v110;

      v86 = WALogCategoryDefaultHandle();
      v87 = objc_claimAutoreleasedReturnValue(v86);
      v88 = v87;
      if (v85 || !v84)
      {
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
          v118 = 1024;
          v119 = 2373;
          v120 = 2112;
          v121 = v85;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive cachedUsage: %@", buf, 0x1Cu);
        }

      }
      else
      {
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          v89 = (void *)objc_opt_class(v84);
          *(_DWORD *)buf = 136446722;
          v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
          v118 = 1024;
          v119 = 2376;
          v120 = 2112;
          v121 = v89;
          v90 = v89;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist usageDict class is %@", buf, 0x1Cu);

        }
        -[WAIOReporterMessagePopulator setCachedUsage:](self, "setCachedUsage:", v84);
        v91 = WALogCategoryDefaultHandle();
        v92 = objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
          v118 = 1024;
          v119 = 2379;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedUsage success", buf, 0x12u);
        }

      }
      v5 = v109;
    }
  }
  else
  {
    if (v71)
    {
      *(_DWORD *)buf = 136446466;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2385;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedUsage file not available", buf, 0x12u);
    }

    self->_persistFileExistedAtPIDLoad = 0;
  }

  objc_autoreleasePoolPop(v5);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  if (v93
    || (v93 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"))) != 0)
  {

LABEL_65:
    v94 = WALogCategoryDefaultHandle();
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (!os_signpost_enabled(v95))
      goto LABEL_68;
    *(_WORD *)buf = 0;
    v96 = "Success";
    goto LABEL_67;
  }
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedUsage](self, "cachedUsage"));

  if (v104)
    goto LABEL_65;
  v105 = WALogCategoryDefaultHandle();
  v95 = objc_claimAutoreleasedReturnValue(v105);
  if (os_signpost_enabled(v95))
  {
    *(_WORD *)buf = 0;
    v96 = "Fail";
LABEL_67:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR Unpersist", v96, buf, 2u);
  }
LABEL_68:

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
  if (!v97)
  {
    v98 = objc_alloc_init((Class)NSMutableArray);
    -[WAIOReporterMessagePopulator setCachedPredicatesNotYetFound:](self, "setCachedPredicatesNotYetFound:", v98);

  }
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedUsage](self, "cachedUsage"));

  if (!v99)
  {
    v100 = objc_alloc_init((Class)NSMutableDictionary);
    -[WAIOReporterMessagePopulator setCachedUsage:](self, "setCachedUsage:", v100);

  }
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));

  if (v101)
  {
    v102 = WALogCategoryDefaultHandle();
    v103 = objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      v118 = 1024;
      v119 = 2412;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedIOPopAvailableChannels exists, running _iorPreparedForSampling to build reliant objects", buf, 0x12u);
    }

    -[WAIOReporterMessagePopulator _iorPreparedForSampling:](self, "_iorPreparedForSampling:", 0);
  }
  -[WAIOReporterMessagePopulator _handleUnpersistForUsageData](self, "_handleUnpersistForUsageData");
  self->_hasAttemptedUnpersisting = 1;
}

- (void)persistIORObjects:(unsigned __int8)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  unsigned __int8 v8;
  id location;

  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021E4C;
  block[3] = &unk_1000CCE70;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_persistIORObjects:(unsigned __int8)a3
{
  int v3;
  id v5;
  NSObject *v6;
  NSMutableDictionary *cachedUsage;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  const char *v61;
  void *v62;
  id v63;
  id v64;
  NSObject *v65;
  const char *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  id v77;
  __int16 v78;
  void *v79;

  v3 = a3;
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR Persist", ", buf, 2u);
  }

  -[WAIOReporterMessagePopulator _cancelDelayedInvocationForPersist](self, "_cancelDelayedInvocationForPersist");
  if (v3 == 1)
  {
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Terminations - Graceful"), self->_cachedUsage, self->_queue);
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Last Graceful Termination Date"));
    cachedUsage = self->_cachedUsage;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v8, CFSTR("Last Graceful Termination Date"));

  }
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Persist Calls"), self->_cachedUsage, self->_queue);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Last Persisted Date"));
  v9 = self->_cachedUsage;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, CFSTR("Last Persisted Date"));

  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Last Persisted PID"));
  v11 = self->_cachedUsage;
  v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", self->_pid));
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, CFSTR("Last Persisted PID"));

  -[WAIOReporterMessagePopulator _calculateEstimatedUptime](self, "_calculateEstimatedUptime");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUsageTempFile](WAIOReporterMessagePopulator, "getUsageTempFile"));
  LOBYTE(v12) = objc_msgSend(v13, "fileExistsAtPath:", v14);

  if ((v12 & 1) == 0)
  {
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUsageTempFile](WAIOReporterMessagePopulator, "getUsageTempFile"));
      *(_DWORD *)buf = 136446722;
      v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      v74 = 1024;
      v75 = 2460;
      v76 = 2112;
      v77 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Persistence file doesnt yet exist %@", buf, 0x1Cu);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Persist file creation Date"));
    v18 = self->_cachedUsage;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, CFSTR("Persist file creation Date"));

  }
  v20 = objc_autoreleasePoolPush();
  v21 = WALogCategoryDefaultHandle();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUsageTempFile](WAIOReporterMessagePopulator, "getUsageTempFile"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedUsage](self, "cachedUsage"));
    v25 = (void *)objc_opt_class(v24);
    *(_DWORD *)buf = 136446978;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2468;
    v76 = 2112;
    v77 = v23;
    v78 = 2112;
    v79 = v25;
    v26 = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Updating file %@ with cachedUsage of class %@", buf, 0x26u);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedUsage](self, "cachedUsage"));
  v71 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v27, 1, &v71));
  v29 = v71;

  v30 = WALogCategoryDefaultHandle();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_msgSend(v28, "length");
    *(_DWORD *)buf = 136446722;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2471;
    v76 = 2048;
    v77 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedUsage sizeof is %lu", buf, 0x1Cu);
  }

  if (v29)
  {
    v64 = WALogCategoryDefaultHandle();
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136446722;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2472;
    v76 = 2112;
    v77 = v29;
    v66 = "%{public}s::%d:Failed to archive usages: %@";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, v66, buf, 0x1Cu);
    goto LABEL_43;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUsageTempFile](WAIOReporterMessagePopulator, "getUsageTempFile"));
  objc_msgSend(v28, "writeToFile:atomically:", v33, 1);

  LODWORD(v33) = self->_ioReportersCacheNeedsUpdating;
  v34 = WALogCategoryDefaultHandle();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v33)
  {
    if (v36)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile](WAIOReporterMessagePopulator, "getIORPopAvailabeIOReportersTempFile"));
      *(_DWORD *)buf = 136446722;
      v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      v74 = 1024;
      v75 = 2503;
      v76 = 2112;
      v77 = v62;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Didn't find new channels, not updating file %@", buf, 0x1Cu);

    }
    v63 = WALogCategoryDefaultHandle();
    v60 = objc_claimAutoreleasedReturnValue(v63);
    if (!os_signpost_enabled(v60))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v61 = "Skipped";
    goto LABEL_33;
  }
  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile](WAIOReporterMessagePopulator, "getIORPopAvailabeIOReportersTempFile"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
    v39 = (void *)objc_opt_class(v38);
    *(_DWORD *)buf = 136446978;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2480;
    v76 = 2112;
    v77 = v37;
    v78 = 2112;
    v79 = v39;
    v40 = v39;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Updating file %@ with cachedIOPopAvailableChannels of class %@", buf, 0x26u);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  v70 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v41, 1, &v70));
  v29 = v70;

  v42 = WALogCategoryDefaultHandle();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v28, "length");
    *(_DWORD *)buf = 136446722;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2483;
    v76 = 2048;
    v77 = v44;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedIOPopAvailableChannels sizeof is %lu", buf, 0x1Cu);
  }

  if (v29)
  {
    v67 = WALogCategoryDefaultHandle();
    v65 = objc_claimAutoreleasedReturnValue(v67);
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136446722;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2484;
    v76 = 2112;
    v77 = v29;
    v66 = "%{public}s::%d:Failed to archive desired channels: %@";
    goto LABEL_42;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile](WAIOReporterMessagePopulator, "getIORPopAvailabeIOReportersTempFile"));
  objc_msgSend(v28, "writeToFile:atomically:", v45, 1);

  v46 = WALogCategoryDefaultHandle();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUnavailablePredTempFile](WAIOReporterMessagePopulator, "getUnavailablePredTempFile"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
    v50 = (void *)objc_opt_class(v49);
    *(_DWORD *)buf = 136446978;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2490;
    v76 = 2112;
    v77 = v48;
    v78 = 2112;
    v79 = v50;
    v51 = v50;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Updating file %@ with cachedPredicatesNotYetFound of class %@", buf, 0x26u);

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
  v69 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v52, 1, &v69));
  v29 = v69;

  v53 = WALogCategoryDefaultHandle();
  v54 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = objc_msgSend(v28, "length");
    *(_DWORD *)buf = 136446722;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2493;
    v76 = 2048;
    v77 = v55;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedPredicatesNotYetFound sizeof is %lu", buf, 0x1Cu);
  }

  if (v29)
  {
    v68 = WALogCategoryDefaultHandle();
    v65 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      v74 = 1024;
      v75 = 2494;
      v76 = 2112;
      v77 = v29;
      v66 = "%{public}s::%d:Failed to archive cachedPredicatesNotYetFound: %@";
      goto LABEL_42;
    }
LABEL_43:

    goto LABEL_35;
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUnavailablePredTempFile](WAIOReporterMessagePopulator, "getUnavailablePredTempFile"));
  objc_msgSend(v28, "writeToFile:atomically:", v56, 1);

  v57 = WALogCategoryDefaultHandle();
  v58 = objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v73 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    v74 = 1024;
    v75 = 2500;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DONE", buf, 0x12u);
  }

  v59 = WALogCategoryDefaultHandle();
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (!os_signpost_enabled(v60))
    goto LABEL_34;
  *(_WORD *)buf = 0;
  v61 = "Success";
LABEL_33:
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR Persist", v61, buf, 2u);
LABEL_34:

  self->_ioReportersCacheNeedsUpdating = 0;
LABEL_35:
  objc_autoreleasePoolPop(v20);
}

- (void)_cancelDelayedInvocationForPersist
{
  NSObject *persistTimer;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _BOOL4 persistTimerRunning;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;

  if (self->_persistTimerRunning)
  {
    persistTimer = self->_persistTimer;
    if (persistTimer)
    {
      if (!dispatch_source_testcancel(persistTimer))
      {
        v4 = WALogCategoryDefaultHandle();
        v5 = objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136446466;
          v10 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForPersist]";
          v11 = 1024;
          v12 = 2519;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer exists and is valid, Suspending", (uint8_t *)&v9, 0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_persistTimer);
        self->_persistTimerRunning = 0;
        v6 = WALogCategoryDefaultHandle();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          persistTimerRunning = self->_persistTimerRunning;
          v9 = 136446722;
          v10 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForPersist]";
          v11 = 1024;
          v12 = 2522;
          v13 = 1024;
          v14 = persistTimerRunning;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _persistTimerRunning %d", (uint8_t *)&v9, 0x18u);
        }

      }
    }
  }
}

- (void)_delayedInvocationForPersist
{
  _BOOL4 persistTimerRunning;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  _BOOL4 v10;
  unint64_t v11;
  NSObject *persistTimer;
  _BOOL4 v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  OS_dispatch_source *v20;
  OS_dispatch_source *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  dispatch_time_t v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  _BOOL4 v42;
  unint64_t v43;
  NSObject *v44;
  _BOOL4 v45;
  id v46;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[14];
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;

  persistTimerRunning = self->_persistTimerRunning;
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (persistTimerRunning)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136446466;
      v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      v50 = 1024;
      v51 = 2529;
      v7 = "%{public}s::%d:Persist is already scheduled, ignoring additional request";
      v8 = v5;
      v9 = 18;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  if (v6)
  {
    v10 = self->_persistTimerRunning;
    v11 = -[RecommendationPreferences ior_persist_delay_seconds](self->_preferences, "ior_persist_delay_seconds");
    persistTimer = self->_persistTimer;
    v13 = persistTimer != 0;
    if (persistTimer)
      v14 = dispatch_source_testcancel(persistTimer) != 0;
    else
      v14 = 0;
    *(_DWORD *)buf = 136447490;
    v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
    v50 = 1024;
    v51 = 2533;
    v52 = 1024;
    *(_DWORD *)v53 = v10;
    *(_WORD *)&v53[4] = 2048;
    *(_QWORD *)&v53[6] = v11;
    v54 = 1024;
    v55 = v13;
    v56 = 1024;
    v57 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_persistTimerRunning is %d ior_persist_delay_seconds is %lu _persistTimer exists %d testcancel is %d", buf, 0x2Eu);
  }

  if (!self->_persistTimerRunning)
  {
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      v50 = 1024;
      v51 = 2536;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
    }

    v17 = self->_persistTimer;
    if (v17)
    {
      if (!dispatch_source_testcancel(v17))
      {
LABEL_25:
        v29 = WALogCategoryDefaultHandle();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = -[RecommendationPreferences ior_persist_delay_seconds](self->_preferences, "ior_persist_delay_seconds");
          *(_DWORD *)buf = 136446722;
          v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          v50 = 1024;
          v51 = 2557;
          v52 = 2048;
          *(_QWORD *)v53 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s", buf, 0x1Cu);
        }

        v32 = self->_persistTimer;
        v33 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000* -[RecommendationPreferences ior_persist_delay_seconds](self->_preferences, "ior_persist_delay_seconds"));
        dispatch_source_set_timer(v32, v33, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        v34 = WALogCategoryDefaultHandle();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          v50 = 1024;
          v51 = 2559;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer Done", buf, 0x12u);
        }

        v36 = WALogCategoryDefaultHandle();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          v50 = 1024;
          v51 = 2561;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dispatch_resume _persistTimer", buf, 0x12u);
        }

        dispatch_resume((dispatch_object_t)self->_persistTimer);
        self->_persistTimerRunning = 1;
        v38 = WALogCategoryDefaultHandle();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = self->_persistTimerRunning;
          *(_DWORD *)buf = 136446722;
          v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          v50 = 1024;
          v51 = 2565;
          v52 = 1024;
          *(_DWORD *)v53 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _persistTimerRunning %d", buf, 0x18u);
        }

        goto LABEL_34;
      }
    }
    else
    {
      v18 = WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
        v50 = 1024;
        v51 = 2542;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Creating _persistTimer", buf, 0x12u);
      }

      v20 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
      v21 = self->_persistTimer;
      self->_persistTimer = v20;

      v22 = WALogCategoryDefaultHandle();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
        v50 = 1024;
        v51 = 2544;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Creating _persistTimer Done", buf, 0x12u);
      }

      if (!self->_persistTimer)
      {
        v46 = WALogCategoryDefaultHandle();
        v5 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Failed to create _persistTimer", buf, 2u);
        }
        goto LABEL_40;
      }
    }
    v24 = WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      v50 = 1024;
      v51 = 2548;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting dispatch_source_set_event_handler", buf, 0x12u);
    }

    v26 = self->_persistTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002314C;
    handler[3] = &unk_1000CCDB0;
    handler[4] = self;
    dispatch_source_set_event_handler(v26, handler);
    v27 = WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      v50 = 1024;
      v51 = 2554;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_25;
  }
LABEL_34:
  v41 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v42 = self->_persistTimerRunning;
    v43 = -[RecommendationPreferences ior_persist_delay_seconds](self->_preferences, "ior_persist_delay_seconds");
    v44 = self->_persistTimer;
    if (v44)
      v45 = dispatch_source_testcancel(v44) == 0;
    else
      v45 = 0;
    *(_DWORD *)buf = 136447234;
    v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
    v50 = 1024;
    v51 = 2569;
    v52 = 1024;
    *(_DWORD *)v53 = v42;
    *(_WORD *)&v53[4] = 2048;
    *(_QWORD *)&v53[6] = v43;
    v54 = 1024;
    v55 = v45;
    v7 = "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d";
    v8 = v5;
    v9 = 40;
    goto LABEL_39;
  }
LABEL_40:

}

- (void)_calculateEstimatedUptime
{
  void *v3;
  id v4;
  NSObject *v5;
  NSDate *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSMutableDictionary *cachedUsage;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  NSMutableDictionary *v18;
  NSDate *pidLaunchDate;
  id v20;
  NSObject *v21;
  NSDate *v22;
  void *v23;
  double v24;
  NSMutableDictionary *v25;
  double v26;
  _BYTE v27[18];
  __int16 v28;
  NSDate *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("PID Unpersisted Date")));

  if (v3)
  {
    v4 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("PID Unpersisted Date")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("PID Unpersisted Date")));
      objc_msgSend(v8, "timeIntervalSinceNow");
      v10 = v9;

      *(_DWORD *)v27 = 136447234;
      v11 = -v10;
      *(_QWORD *)&v27[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
      if (v10 >= 0.0)
        v11 = v10;
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = 2577;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v7;
      v32 = 2048;
      v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_cachedUsage[kWAUnpersistedDateKey] %@ now %@ interval %f", v27, 0x30u);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Estimated Uptime (s)"));
    cachedUsage = self->_cachedUsage;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cachedUsage, "objectForKeyedSubscript:", CFSTR("PID Unpersisted Date")));
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = v14;

    v16 = -v15;
    if (v15 >= 0.0)
      v16 = v15;
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v16, *(_OWORD *)v27));
    v18 = cachedUsage;
LABEL_17:
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, CFSTR("Estimated Uptime (s)"));
    goto LABEL_18;
  }
  pidLaunchDate = self->_pidLaunchDate;
  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v17 = v21;
  if (pidLaunchDate)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = self->_pidLaunchDate;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[NSDate timeIntervalSinceNow](self->_pidLaunchDate, "timeIntervalSinceNow");
      *(_DWORD *)v27 = 136447234;
      *(_QWORD *)&v27[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
      *(_WORD *)&v27[12] = 1024;
      if (v24 < 0.0)
        v24 = -v24;
      *(_DWORD *)&v27[14] = 2582;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2048;
      v33 = v24;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_pidLaunchDate %@ now %@ interval %f", v27, 0x30u);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Estimated Uptime (s)"));
    v25 = self->_cachedUsage;
    -[NSDate timeIntervalSinceNow](self->_pidLaunchDate, "timeIntervalSinceNow");
    if (v26 < 0.0)
      v26 = -v26;
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v26, *(_QWORD *)v27, *(_QWORD *)&v27[8]));
    v18 = v25;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v27 = 136446466;
    *(_QWORD *)&v27[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 2587;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d: calculating kWACumulativeUptimeKey unavailable", v27, 0x12u);
  }
LABEL_18:

}

- (void)_handleUnpersistForUsageData
{
  WAIOReporterMessagePopulator *v2;
  const __CFString *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __CFString *v11;
  id v12;
  NSObject *v13;
  id v14;
  WAIOReporterMessagePopulator *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _UNKNOWN **v28;
  id v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char isKindOfClass;
  id v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  char v47;
  id v48;
  NSObject *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  char v58;
  void *v59;
  void *v60;
  uint64_t v61;
  __CFString *v62;
  void *j;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  char v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  __CFString *v85;
  __CFString *v86;
  id v87;
  NSMutableDictionary *cachedUsage;
  void *v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  WAIOReporterMessagePopulator *v95;
  NSObject *obj;
  id v97;
  __CFString *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  const char *v112;
  __int16 v113;
  int v114;
  __int16 v115;
  const __CFString *v116;
  __int16 v117;
  __CFString *v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  __CFString *v122;
  __int16 v123;
  void *v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];

  v2 = self;
  v3 = CFSTR("Work Bin: Last PID Work");
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Work Bin: Last PID Work"));
  v90 = objc_alloc_init((Class)NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_cachedUsage, "setObject:forKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_cachedUsage, "setObject:forKeyedSubscript:", v5, CFSTR("Work Bin: Previous PIDs Work"));

  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v6 = -[NSMutableDictionary copy](v2->_cachedUsage, "copy");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
  v95 = v2;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v108 != v9)
          objc_enumerationMutation(v6);
        v11 = *(__CFString **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i);
        if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Work Bin: Previous PIDs Work")) & 1) != 0|| -[__CFString isEqualToString:](v11, "isEqualToString:", v3))
        {
          v12 = WALogCategoryDefaultHandle();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446978;
            v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            v113 = 1024;
            v114 = 2613;
            v115 = 2112;
            v116 = v3;
            v117 = 2112;
            v118 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Skipping copying key to %@: %@", buf, 0x26u);
          }
        }
        else
        {
          v14 = v6;
          v15 = v2;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2->_cachedUsage, "objectForKey:", v11));
          v17 = v3;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15->_cachedUsage, "objectForKeyedSubscript:", v3));
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v11);

          -[NSMutableDictionary removeObjectForKey:](v15->_cachedUsage, "removeObjectForKey:", v11);
          v19 = WALogCategoryDefaultHandle();
          v13 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15->_cachedUsage, "objectForKeyedSubscript:", v17));
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v11));
            *(_DWORD *)buf = 136446978;
            v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            v113 = 1024;
            v114 = 2620;
            v115 = 2112;
            v116 = v11;
            v117 = 2112;
            v118 = v21;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_cachedUsage[kLastPIDBin] now contains key %@ with value %@", buf, 0x26u);

          }
          v3 = v17;
          v6 = v14;
        }

        v2 = v95;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
    }
    while (v8);
  }

  if (v2->_persistFileExistedAtPIDLoad)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Terminations - Graceful")));

    if (!v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Terminations - Unknown"), v24, v2->_queue);

    }
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
  v26 = objc_msgSend(v25, "copy");

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v103, v126, 16);
  v28 = &AnalyticsSendEventLazy_ptr;
  if (v27)
  {
    v29 = v27;
    v93 = *(_QWORD *)v104;
    v91 = v26;
    do
    {
      v30 = 0;
      v92 = v29;
      do
      {
        if (*(_QWORD *)v104 != v93)
          objc_enumerationMutation(v26);
        v94 = v30;
        v31 = *(__CFString **)(*((_QWORD *)&v103 + 1) + 8 * v30);
        if (-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("Persist file creation Date")))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v31));
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v31);

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v31));
        v37 = objc_opt_class(v28[94]);
        isKindOfClass = objc_opt_isKindOfClass(v36, v37);

        v98 = v31;
        if ((isKindOfClass & 1) != 0)
        {
          v39 = WALogCategoryDefaultHandle();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            goto LABEL_35;
          *(_DWORD *)buf = 136446722;
          v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
          v113 = 1024;
          v114 = 2637;
          v115 = 2112;
          v116 = v31;
          v41 = v40;
          v42 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: NSDate";
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0x1Cu);
          goto LABEL_35;
        }
        if ((-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("Last Persisted PID")) & 1) != 0
          || -[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("Last Terminated PID")))
        {
          v43 = WALogCategoryDefaultHandle();
          v40 = objc_claimAutoreleasedReturnValue(v43);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            goto LABEL_35;
          *(_DWORD *)buf = 136446722;
          v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
          v113 = 1024;
          v114 = 2641;
          v115 = 2112;
          v116 = v31;
          v41 = v40;
          v42 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: kWAPersistedPidKey or kWATerminationPidKey";
          goto LABEL_34;
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", v31));
        v46 = objc_opt_class(NSNumber);
        v47 = objc_opt_isKindOfClass(v45, v46);

        if ((v47 & 1) != 0)
        {
          v48 = WALogCategoryDefaultHandle();
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
            v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v31));
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v31));
            *(_DWORD *)buf = 136447234;
            v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            v113 = 1024;
            v114 = 2646;
            v115 = 2112;
            v116 = v31;
            v117 = 2112;
            v118 = v51;
            v119 = 2112;
            v120 = v53;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Summing key %@ of kLastPIDBin %@ to kPreviousPIDsBin %@", buf, 0x30u);

            v29 = v92;
          }

          v40 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
          +[WAUtil sumNSNumberForKey:dstDict:otherDict:](WAUtil, "sumNSNumberForKey:dstDict:otherDict:", v31, v40, v54);

        }
        else
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v31));
          v57 = objc_opt_class(NSMutableDictionary);
          v58 = objc_opt_isKindOfClass(v56, v57);

          if ((v58 & 1) != 0)
          {
            v101 = 0u;
            v102 = 0u;
            v99 = 0u;
            v100 = 0u;
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v31));
            v40 = objc_msgSend(v60, "copy");

            v97 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v99, v125, 16);
            if (v97)
            {
              v61 = *(_QWORD *)v100;
              v62 = v98;
              obj = v40;
              do
              {
                for (j = 0; j != v97; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v100 != v61)
                    objc_enumerationMutation(obj);
                  v64 = *(const __CFString **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)j);
                  v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
                  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", v62));
                  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", v64));
                  v68 = objc_opt_class(NSNumber);
                  v69 = objc_opt_isKindOfClass(v67, v68);

                  if ((v69 & 1) != 0)
                  {
                    v70 = WALogCategoryDefaultHandle();
                    v71 = objc_claimAutoreleasedReturnValue(v70);
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                    {
                      v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
                      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", v62));
                      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", v64));
                      v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));
                      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", v98));
                      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", v64));
                      *(_DWORD *)buf = 136447746;
                      v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
                      v113 = 1024;
                      v114 = 2653;
                      v115 = 2112;
                      v116 = v64;
                      v117 = 2112;
                      v118 = v98;
                      v119 = 2112;
                      v120 = v74;
                      v121 = 2112;
                      v122 = v98;
                      v123 = 2112;
                      v124 = v77;
                      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Summing innerKey %@ of kLastPIDBin.%@ %@ to kPreviousPIDsBin.%@ %@", buf, 0x44u);

                      v2 = v95;
                      v62 = v98;

                    }
                    v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));
                    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", v62));
                    v80 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
                    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKeyedSubscript:", v98));
                    +[WAUtil sumNSNumberForKey:dstDict:otherDict:](WAUtil, "sumNSNumberForKey:dstDict:otherDict:", v64, v79, v81);

                    v62 = v98;
                  }
                }
                v40 = obj;
                v97 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v125, 16);
              }
              while (v97);
              v26 = v91;
              v28 = &AnalyticsSendEventLazy_ptr;
              v29 = v92;
            }
          }
          else
          {
            v82 = WALogCategoryDefaultHandle();
            v40 = objc_claimAutoreleasedReturnValue(v82);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", v31));
              v85 = (__CFString *)objc_opt_class(v84);
              *(_DWORD *)buf = 136446978;
              v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
              v113 = 1024;
              v114 = 2658;
              v115 = 2112;
              v116 = v31;
              v117 = 2112;
              v118 = v85;
              v86 = v85;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: unknown class %@", buf, 0x26u);

            }
          }
        }
LABEL_35:

        v30 = v94 + 1;
      }
      while ((id)(v94 + 1) != v29);
      v87 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v103, v126, 16);
      v29 = v87;
    }
    while (v87);
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Unpersisted Count"), v2->_cachedUsage, v2->_queue);
  cachedUsage = v2->_cachedUsage;
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28[94], "date"));
  -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v89, CFSTR("PID Unpersisted Date"));

  +[WAUtil logNestedDictionary:indent:prefix:](WAUtil, "logNestedDictionary:indent:prefix:", v2->_cachedUsage, 0, CFSTR("Unpersist ior _cachedUsage"));
}

- (id)getCachedUsage
{
  NSObject *v3;
  id v4;
  _QWORD block[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id location;

  objc_initWeak(&location, self);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000242F0;
  v12 = sub_100024300;
  v13 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024308;
  block[3] = &unk_1000CCD60;
  objc_copyWeak(&v7, &location);
  block[4] = &v8;
  dispatch_sync(v3, block);

  v4 = (id)v9[5];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
  return v4;
}

- (id)_getCachedUsage
{
  id v3;
  NSObject *v4;
  NSMutableDictionary *cachedUsage;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  NSMutableDictionary *v12;

  if (!self->_hasAttemptedUnpersisting)
  {
    v3 = WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      cachedUsage = self->_cachedUsage;
      v7 = 136446722;
      v8 = "-[WAIOReporterMessagePopulator _getCachedUsage]";
      v9 = 1024;
      v10 = 2688;
      v11 = 2112;
      v12 = cachedUsage;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_hasAttemptedUnpersisting not run _cachedUsage is %@", (uint8_t *)&v7, 0x1Cu);
    }

    -[WAIOReporterMessagePopulator _unpersistIORObjects](self, "_unpersistIORObjects");
  }
  -[WAIOReporterMessagePopulator _calculateEstimatedUptime](self, "_calculateEstimatedUptime");
  return self->_cachedUsage;
}

- (id)_createStructuredIOReportDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000242F0;
  v13 = sub_100024300;
  v14 = objc_alloc_init((Class)NSMutableDictionary);
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Build Structured Dict Calls"), self->_cachedUsage, self->_queue);
  v5 = objc_autoreleasePoolPush();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024554;
  v8[3] = &unk_1000CCE98;
  v8[4] = &v9;
  IOReportIterate(v4, v8);
  objc_autoreleasePoolPop(v5);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (WAIOReporterPopulatorMessageDelegate)messageDelegate
{
  return (WAIOReporterPopulatorMessageDelegate *)objc_loadWeakRetained((id *)&self->_messageDelegate);
}

- (void)setMessageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_messageDelegate, a3);
}

- (WAIOReporterPersistenceDelegate)persistenceDelegate
{
  return (WAIOReporterPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_persistenceDelegate);
}

- (void)setPersistenceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_persistenceDelegate, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_source)rescanTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRescanTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)rescanTimerRunning
{
  return self->_rescanTimerRunning;
}

- (void)setRescanTimerRunning:(BOOL)a3
{
  self->_rescanTimerRunning = a3;
}

- (OS_dispatch_source)persistTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPersistTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)persistTimerRunning
{
  return self->_persistTimerRunning;
}

- (void)setPersistTimerRunning:(BOOL)a3
{
  self->_persistTimerRunning = a3;
}

- (NSMutableDictionary)cachedIOPopAvailableChannels
{
  return self->_cachedIOPopAvailableChannels;
}

- (void)setCachedIOPopAvailableChannels:(id)a3
{
  objc_storeStrong((id *)&self->_cachedIOPopAvailableChannels, a3);
}

- (NSMutableDictionary)cachedUsage
{
  return self->_cachedUsage;
}

- (void)setCachedUsage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedUsage, a3);
}

- (NSMutableDictionary)cachedChannelsCountPerIORPopulatable
{
  return self->_cachedChannelsCountPerIORPopulatable;
}

- (void)setCachedChannelsCountPerIORPopulatable:(id)a3
{
  objc_storeStrong((id *)&self->_cachedChannelsCountPerIORPopulatable, a3);
}

- (BOOL)ioReportersCacheNeedsUpdating
{
  return self->_ioReportersCacheNeedsUpdating;
}

- (void)setIoReportersCacheNeedsUpdating:(BOOL)a3
{
  self->_ioReportersCacheNeedsUpdating = a3;
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_infraInterfaceName, a3);
}

- (NSMutableArray)cachedPredicatesNotYetFound
{
  return self->_cachedPredicatesNotYetFound;
}

- (void)setCachedPredicatesNotYetFound:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPredicatesNotYetFound, a3);
}

- (NSMutableDictionary)cachedIOReportSubbedChannels
{
  return self->_cachedIOReportSubbedChannels;
}

- (void)setCachedIOReportSubbedChannels:(id)a3
{
  objc_storeStrong((id *)&self->_cachedIOReportSubbedChannels, a3);
}

- (NSMutableDictionary)cachedIOReportSample
{
  return self->_cachedIOReportSample;
}

- (void)setCachedIOReportSample:(id)a3
{
  objc_storeStrong((id *)&self->_cachedIOReportSample, a3);
}

- (WAApple80211)apple80211Wrapper
{
  return self->_apple80211Wrapper;
}

- (void)setApple80211Wrapper:(id)a3
{
  objc_storeStrong((id *)&self->_apple80211Wrapper, a3);
}

- (BOOL)hasAttemptedUnpersisting
{
  return self->_hasAttemptedUnpersisting;
}

- (void)setHasAttemptedUnpersisting:(BOOL)a3
{
  self->_hasAttemptedUnpersisting = a3;
}

- (BOOL)persistFileExistedAtPIDLoad
{
  return self->_persistFileExistedAtPIDLoad;
}

- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3
{
  self->_persistFileExistedAtPIDLoad = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)pidLaunchDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPidLaunchDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)failNextCreateOrUpdateSample
{
  return self->_failNextCreateOrUpdateSample;
}

- (void)setFailNextCreateOrUpdateSample:(BOOL)a3
{
  self->_failNextCreateOrUpdateSample = a3;
}

- (unsigned)srv
{
  return self->_srv;
}

- (void)setSrv:(unsigned int)a3
{
  self->_srv = a3;
}

- (NSString)drvName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDrvName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)drvPath
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDrvPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSNumber)providerNum
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setProviderNum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (int64_t)wlanType
{
  return self->_wlanType;
}

- (void)setWlanType:(int64_t)a3
{
  self->_wlanType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerNum, 0);
  objc_storeStrong((id *)&self->_drvPath, 0);
  objc_storeStrong((id *)&self->_drvName, 0);
  objc_storeStrong((id *)&self->_pidLaunchDate, 0);
  objc_storeStrong((id *)&self->_apple80211Wrapper, 0);
  objc_storeStrong((id *)&self->_cachedIOReportSample, 0);
  objc_storeStrong((id *)&self->_cachedIOReportSubbedChannels, 0);
  objc_storeStrong((id *)&self->_cachedPredicatesNotYetFound, 0);
  objc_storeStrong((id *)&self->_infraInterfaceName, 0);
  objc_storeStrong((id *)&self->_cachedChannelsCountPerIORPopulatable, 0);
  objc_storeStrong((id *)&self->_cachedUsage, 0);
  objc_storeStrong((id *)&self->_cachedIOPopAvailableChannels, 0);
  objc_storeStrong((id *)&self->_persistTimer, 0);
  objc_storeStrong((id *)&self->_rescanTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_persistenceDelegate);
  objc_destroyWeak((id *)&self->_messageDelegate);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
