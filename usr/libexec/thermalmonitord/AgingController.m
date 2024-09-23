@implementation AgingController

+ (id)log
{
  if (qword_1000A1D50 != -1)
    dispatch_once(&qword_1000A1D50, &stru_10007DB08);
  return (id)qword_1000A1D58;
}

+ (id)allocDefaults
{
  NSObject *v2;
  id v3;
  int v5;
  const __CFString *v6;

  v2 = objc_msgSend((id)objc_opt_class(a1, a2), "log");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = CFSTR("/var/MobileSoftwareUpdate/Hardware/Battery");
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Allocating defaults at %@", (uint8_t *)&v5, 0xCu);
  }
  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "_initWithSuiteName:container:", CFSTR("com.apple.thermalmonitor.agingcontroller"), +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("/var/MobileSoftwareUpdate/Hardware/Battery")));
  objc_msgSend(v3, "synchronize");
  return v3;
}

- (void)migrateDefaultsPlist
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.thermalmonitor.agingcontroller"));
  v4 = objc_msgSend(v3, "dictionaryRepresentation");
  v5 = objc_msgSend(v4, "allKeys");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9)), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, CFSTR("DataMigrated"));

}

- (AgingController)initWithParams:(id)a3 currentWRa:(int)a4 currentUPOCount:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  AgingController *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int UPOAgingMitigationsThreshold;
  NSUserDefaults *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSDictionary *v25;
  NSInteger v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  NSObject *queue;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  objc_class *v66;
  NSString *v67;
  _QWORD handler[5];
  objc_super v69;
  uint8_t v70[4];
  const char *v71;
  __int16 v72;
  NSString *v73;
  _BYTE buf[24];
  void (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  AgingController *v77;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v69.receiver = self;
  v69.super_class = (Class)AgingController;
  v9 = -[AgingController init](&v69, "init");
  if (!v9)
  {
    v28 = objc_msgSend((id)objc_opt_class(0, v8), "log");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000500D4(v28, v29, v30, v31, v32, v33, v34, v35);
    return 0;
  }
  v10 = sub_100034E84();
  v11 = objc_msgSend(a3, "objectForKey:", CFSTR("UPOMitigationsThresholdWRa"));
  v12 = objc_msgSend(v11, "objectForKey:", -[NSNumber stringValue](+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10), "stringValue"));
  if (!v12)
  {
    v14 = objc_msgSend((id)objc_opt_class(v9, v13), "log");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Warning> No upo mitigations start threshold found. Falling back to default value\n", buf, 2u);
    }
    v12 = objc_msgSend(v11, "objectForKey:", objc_msgSend(&off_100085180, "stringValue"));
    if (!v12)
    {
      v61 = objc_msgSend((id)objc_opt_class(v9, v15), "log");
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        sub_100050144();

      return 0;
    }
  }
  v9->_UPOAgingMitigationsThreshold = objc_msgSend(v12, "intValue");
  v17 = objc_msgSend((id)objc_opt_class(v9, v16), "log");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    UPOAgingMitigationsThreshold = v9->_UPOAgingMitigationsThreshold;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = UPOAgingMitigationsThreshold;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s UpoAgingMitigationsThreshold %d\n", buf, 0x12u);
  }
  v19 = +[AgingController allocDefaults](AgingController, "allocDefaults");
  v9->_defaults = v19;
  if (!-[NSUserDefaults BOOLForKey:](v19, "BOOLForKey:", CFSTR("DataMigrated")))
  {
    v21 = objc_msgSend((id)objc_opt_class(v9, v20), "log");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Need data migration to new persistent location. Initiating migration...\n", buf, 0xCu);
    }
    -[AgingController migrateDefaultsPlist](v9, "migrateDefaultsPlist");
    v23 = objc_msgSend((id)objc_opt_class(v9, v22), "log");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Migration complete\n", buf, 0xCu);
    }
  }
  v24 = objc_msgSend((id)objc_opt_class(v9, v20), "log");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = -[NSUserDefaults dictionaryRepresentation](v9->_defaults, "dictionaryRepresentation");
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Current defaults %@\n", buf, 0x16u);
  }
  v26 = -[NSUserDefaults integerForKey:](v9->_defaults, "integerForKey:", CFSTR("MitigationState"));
  if (v26)
  {
    v9->_mitigationState = v26;
  }
  else
  {
    v9->_mitigationState = 2;
    v36 = objc_msgSend((id)objc_opt_class(v9, v27), "log");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s Unknown previous mitigation state. Disabling mitigations\n", buf, 0xCu);
    }
  }
  v37 = objc_msgSend((id)objc_opt_class(v9, v27), "log");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    sub_100050250((uint64_t *)&v9->_mitigationState, v37);
  v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.agingcontrollerqueue", v38);
  v39 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9->_connQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.agingcontrollerConQueue", v39);
  v40 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9->_notifyQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.agingcontrollerNotifyQueue", v40);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v75 = sub_100023E7C;
  v76 = sub_100023E8C;
  v77 = v9;
  v41 = (const char *)objc_msgSend(CFSTR("com.apple.thermalmonitor.ageAwareMitigationsDisabled"), "UTF8String");
  queue = v9->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100023E98;
  handler[3] = &unk_10007DB30;
  handler[4] = buf;
  if (notify_register_dispatch(v41, &v9->_mitigationsDisabledToken, queue, handler))
  {
    v44 = objc_msgSend((id)objc_opt_class(v9, v43), "log");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_1000501E0(v44, v45, v46, v47, v48, v49, v50, v51);
  }
  else
  {
    if (!notify_register_check((const char *)objc_msgSend(CFSTR("com.apple.thermalmonitor.ageAwareMitigationState"), "UTF8String"), &v9->_mitigationStateToken))
    {
      if (-[NSUserDefaults stringForKey:](v9->_defaults, "stringForKey:", CFSTR("BootUUID")))
      {
        -[AgingController notifyPPMOfMitigationState:](v9, "notifyPPMOfMitigationState:", -[AgingController mitigationState](v9, "mitigationState"));
      }
      else
      {
        -[NSUserDefaults setInteger:forKey:](v9->_defaults, "setInteger:forKey:", (int)v5, CFSTR("UPOCount"));
        -[NSUserDefaults setObject:forKey:](v9->_defaults, "setObject:forKey:", -[AgingController currentBootSessionUUID](v9, "currentBootSessionUUID"), CFSTR("BootUUID"));
        -[NSUserDefaults setInteger:forKey:](v9->_defaults, "setInteger:forKey:", -[AgingController mitigationState](v9, "mitigationState"), CFSTR("MitigationState"));
      }
      notify_set_state(v9->_mitigationStateToken, -[AgingController mitigationState](v9, "mitigationState"));
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.thermalmonitor.ageAwareMitigationState"), "UTF8String"));
      -[AgingController takeActionOnUPO:forWRa:](v9, "takeActionOnUPO:forWRa:", v5, v6);
      v64 = objc_msgSend((id)objc_opt_class(v9, v63), "log");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v66 = (objc_class *)objc_opt_class(v9, v65);
        v67 = NSStringFromClass(v66);
        *(_DWORD *)v70 = 136315394;
        v71 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
        v72 = 2112;
        v73 = v67;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%s %@ initialized successfully\n", v70, 0x16u);
      }
      goto LABEL_30;
    }
    v53 = objc_msgSend((id)objc_opt_class(v9, v52), "log");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      sub_100050170(v53, v54, v55, v56, v57, v58, v59, v60);
  }

  v9 = 0;
LABEL_30:
  _Block_object_dispose(buf, 8);
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  io_object_t ppmService;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AgingController dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc\n", buf, 0xCu);
  }

  ppmService = self->_ppmService;
  if (ppmService)
    IOObjectRelease(ppmService);
  v5.receiver = self;
  v5.super_class = (Class)AgingController;
  -[AgingController dealloc](&v5, "dealloc");
}

- (void)takeActionOnUPO:(int)a3 forWRa:(int)a4
{
  uint64_t v5;
  NSString *v7;
  id v8;
  NSInteger v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  int *p_UPOAgingMitigationsThreshold;
  AgingController *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  NSString *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;

  v5 = *(_QWORD *)&a3;
  v7 = -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("BootUUID"));
  v8 = -[AgingController currentBootSessionUUID](self, "currentBootSessionUUID");
  v9 = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", CFSTR("UPOCount"));
  v11 = objc_msgSend((id)objc_opt_class(self, v10), "log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v36 = 138413058;
    v37 = v7;
    v38 = 2112;
    v39 = v8;
    v40 = 1024;
    v41 = v9;
    v42 = 1024;
    v43 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "savedBootUUID %@ currentBootUUID %@ savedUPOCount %d currentUPOCount %d\n", (uint8_t *)&v36, 0x22u);
  }
  if (a4 <= 0)
  {
    v21 = objc_msgSend((id)objc_opt_class(self, v12), "log");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100050428(a4, v21);
  }
  else
  {
    if ((objc_msgSend(v8, "isEqualToString:", v7) & 1) != 0)
    {
      v14 = objc_msgSend((id)objc_opt_class(self, v13), "log");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_1000504AC((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);
      return;
    }
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v8, CFSTR("BootUUID"));
    if (v9 < (int)v5)
    {
      -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", (int)v5, CFSTR("UPOCount"));
      p_UPOAgingMitigationsThreshold = &self->_UPOAgingMitigationsThreshold;
      v25 = self;
      if (self->_UPOAgingMitigationsThreshold > a4)
      {
        v26 = objc_msgSend((id)objc_opt_class(self, v23), "log");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          sub_100050510(p_UPOAgingMitigationsThreshold, a4, v26);
        return;
      }
      v35 = 1;
LABEL_20:
      -[AgingController updateMitigationStateAndNotify:](v25, "updateMitigationStateAndNotify:", v35);
      return;
    }
    v27 = objc_msgSend((id)objc_opt_class(self, v22), "log");
    v28 = v27;
    if (v9 != (int)v5)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1000505F8(v9, v5, v28);
      -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", (int)v5, CFSTR("UPOCount"));
      v25 = self;
      v35 = 2;
      goto LABEL_20;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      sub_100050594(v5, v28, v29, v30, v31, v32, v33, v34);
  }
}

- (BOOL)shouldEnableAgeAwarenessForTableDrivenControllers
{
  return (id)-[AgingController mitigationState](self, "mitigationState") == (id)1;
}

- (void)updateMitigationStateAndNotify:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  unsigned int v23;

  v5 = -[AgingController mitigationState](self, "mitigationState");
  v7 = objc_msgSend((id)objc_opt_class(self, v6), "log");
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5 == a3)
  {
    if (v8)
      sub_100050678(self);
  }
  else
  {
    if (v8)
      sub_100050768(self);
    -[AgingController setMitigationState:](self, "setMitigationState:", a3);
    -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", -[AgingController mitigationState](self, "mitigationState"), CFSTR("MitigationState"));
    notify_set_state(self->_mitigationStateToken, -[AgingController mitigationState](self, "mitigationState"));
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.thermalmonitor.ageAwareMitigationState"), "UTF8String"));
    v10 = objc_msgSend((id)objc_opt_class(self, v9), "log");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315394;
      v21 = "-[AgingController updateMitigationStateAndNotify:]";
      v22 = 1024;
      v23 = -[AgingController mitigationState](self, "mitigationState");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Notification posted for state %d\n", (uint8_t *)&v20, 0x12u);
    }
    -[AgingController notifyPPMOfMitigationState:](self, "notifyPPMOfMitigationState:", -[AgingController mitigationState](self, "mitigationState"));
    if ((id)-[AgingController mitigationState](self, "mitigationState") == (id)1)
    {
      v12 = objc_msgSend((id)objc_opt_class(self, v11), "log");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        sub_1000506F8(v12, v13, v14, v15, v16, v17, v18, v19);
      -[AgingController xpcNotifyForMitigationsUI](self, "xpcNotifyForMitigationsUI");
    }
  }
}

- (void)notifyPPMOfMitigationState:(unint64_t)a3
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  kern_return_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 valuePtr;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000246D8;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A1D60 != -1)
    dispatch_once(&qword_1000A1D60, block);
  if (self->_ppmService)
  {
    valuePtr = a3 == 1;
    v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v5)
    {
      v7 = v5;
      v8 = objc_msgSend((id)objc_opt_class(self, v6), "log");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_10005084C((uint64_t)&valuePtr, v8, v9, v10, v11, v12, v13, v14);
      v15 = IORegistryEntrySetCFProperty(self->_ppmService, CFSTR("EnableBatteryAgingModel"), v7);
      v17 = objc_msgSend((id)objc_opt_class(self, v16), "log");
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_100050820();
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        sub_1000507F4();
      }
      CFRelease(v7);
    }
  }
}

- (void)xpcNotifyForMitigationsUI
{
  OS_dispatch_queue *notifyQueue;
  _QWORD block[5];

  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000247A8;
  block[3] = &unk_10007D248;
  block[4] = self;
  dispatch_async((dispatch_queue_t)notifyQueue, block);
}

- (id)currentBootSessionUUID
{
  NSString *v2;
  char *v3;
  size_t size;

  size = 0;
  v2 = 0;
  if (!sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    v3 = (char *)malloc_type_malloc(size, 0x4FE7066EuLL);
    if (sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0))
    {
      v2 = 0;
    }
    else
    {
      v2 = (NSString *)strdup(v3);
      qword_1000A1D68 = (uint64_t)v2;
      free(v3);
      if (v2)
      {
        v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2);
        v3 = (char *)qword_1000A1D68;
      }
      else
      {
        v3 = 0;
      }
    }
    free(v3);
  }
  return v2;
}

- (int)UPOAgingMitigationsThreshold
{
  return self->_UPOAgingMitigationsThreshold;
}

- (void)setUPOAgingMitigationsThreshold:(int)a3
{
  self->_UPOAgingMitigationsThreshold = a3;
}

- (unint64_t)mitigationState
{
  return self->_mitigationState;
}

- (void)setMitigationState:(unint64_t)a3
{
  self->_mitigationState = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
