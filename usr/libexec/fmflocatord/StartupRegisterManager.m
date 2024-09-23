@implementation StartupRegisterManager

+ (id)sharedInstance
{
  if (qword_1000697B0 != -1)
    dispatch_once(&qword_1000697B0, &stru_100056258);
  return (id)qword_1000697A8;
}

- (StartupRegisterManager)init
{
  void *v3;
  StartupRegisterManager *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil objectForKey:inDomain:](FMPreferencesUtil, "objectForKey:inDomain:", CFSTR("startupRegisterInfo"), CFSTR("com.apple.icloud.fmflocatord.notbackedup")));
  v4 = -[StartupRegisterManager initWithDict:](self, "initWithDict:", v3);

  return v4;
}

- (StartupRegisterManager)initWithDict:(id)a3
{
  id v4;
  StartupRegisterManager *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)StartupRegisterManager;
  v5 = -[StartupRegisterManager init](&v14, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.icloud.fmflocatord.startup_reg.mod_queue", v7);
    -[StartupRegisterManager setInfoChangeQueue:](v5, "setInfoChangeQueue:", v8);

    if (v4)
      v9 = objc_msgSend(v4, "mutableCopy");
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v10 = v9;
    -[StartupRegisterManager setInfo:](v5, "setInfo:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[StartupRegisterManager info](v5, "info"));
    v12 = objc_msgSend(v11, "copy");
    -[StartupRegisterManager setInfoAtStartup:](v5, "setInfoAtStartup:", v12);

  }
  return v5;
}

- (id)infoDictForTesting
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StartupRegisterManager info](self, "info"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)shouldForceRegisterOnStartup
{
  StartupRegisterManager *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[StartupRegisterManager infoChangeQueue](self, "infoChangeQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023ECC;
  v5[3] = &unk_100056280;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)eventDidOccur:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartupRegisterManager fm_logID](self, "fm_logID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StartupRegisterManager _descriptionForEvent:](self, "_descriptionForEvent:", a3));
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ Event occurred : %@", (uint8_t *)&v13, 0x16u);

  }
  switch(a3)
  {
    case 0:
    case 1:
      -[StartupRegisterManager _clearAllInfo](self, "_clearAllInfo");
      return;
    case 2:
    case 4:
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v10 = CFSTR("qcPendingEpoch");
      goto LABEL_12;
    case 3:
    case 6:
      -[StartupRegisterManager _clearQCPendingEpoch](self, "_clearQCPendingEpoch");
      return;
    case 5:
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[StartupRegisterManager _setInfo:forKey:](self, "_setInfo:forKey:", v11, CFSTR("qcPendingEpoch"));

      goto LABEL_9;
    case 7:
      -[StartupRegisterManager _clearQCPendingEpoch](self, "_clearQCPendingEpoch");
LABEL_9:
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v10 = CFSTR("commandPendingEpoch");
      goto LABEL_12;
    case 8:
      v12 = CFSTR("commandPendingEpoch");
      goto LABEL_14;
    case 9:
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v10 = CFSTR("ackPendingEpoch");
LABEL_12:
      -[StartupRegisterManager _setInfo:forKey:](self, "_setInfo:forKey:", v9, v10);

      break;
    case 10:
      v12 = CFSTR("ackPendingEpoch");
LABEL_14:
      -[StartupRegisterManager _removeInfoForKey:](self, "_removeInfoForKey:", v12);
      break;
    default:
      return;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StartupRegisterManager fm_logID](self, "fm_logID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StartupRegisterManager info](self, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v3, v5));

  return v6;
}

- (void)_clearQCPendingEpoch
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[StartupRegisterManager infoChangeQueue](self, "infoChangeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024240;
  block[3] = &unk_100055230;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_clearAllInfo
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[StartupRegisterManager infoChangeQueue](self, "infoChangeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002447C;
  block[3] = &unk_100055230;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_setInfo:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[StartupRegisterManager infoChangeQueue](self, "infoChangeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002457C;
  block[3] = &unk_1000562A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)_removeInfoForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[StartupRegisterManager infoChangeQueue](self, "infoChangeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024650;
  block[3] = &unk_100055638;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_saveInfo
{
  id v3;

  if (!-[StartupRegisterManager inTestingMode](self, "inTestingMode"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[StartupRegisterManager info](self, "info"));
    +[FMPreferencesUtil setObject:forKey:inDomain:](FMPreferencesUtil, "setObject:forKey:inDomain:", v3, CFSTR("startupRegisterInfo"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));

  }
}

- (id)_descriptionForEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return CFSTR("AccountAdded");
  else
    return off_1000562C8[a3 - 1];
}

- (NSDictionary)infoAtStartup
{
  return self->_infoAtStartup;
}

- (void)setInfoAtStartup:(id)a3
{
  objc_storeStrong((id *)&self->_infoAtStartup, a3);
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (OS_dispatch_queue)infoChangeQueue
{
  return self->_infoChangeQueue;
}

- (void)setInfoChangeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_infoChangeQueue, a3);
}

- (BOOL)inTestingMode
{
  return self->_inTestingMode;
}

- (void)setInTestingMode:(BOOL)a3
{
  self->_inTestingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoChangeQueue, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_infoAtStartup, 0);
}

@end
