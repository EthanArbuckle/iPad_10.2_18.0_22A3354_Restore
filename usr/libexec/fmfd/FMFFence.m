@implementation FMFFence

+ (id)cacheDirectory
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("FMFFenceTriggerManagerCache")));
  return v8;
}

+ (id)pathToTriggerDataForFenceWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("triggerData")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("data")));

  return v8;
}

- (void)receiveTriggerWithUUID:(id)a3 status:(id)a4 atDate:(id)a5 triggerLocation:(id)a6 completion:(id)a7
{
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  id v15;

  v15 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a7;
  -[FMFFence postReceiveTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:](self, "postReceiveTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:", a3, v15, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](self, "trigger"));
  LODWORD(a3) = objc_msgSend(v14, "isEqualToString:", FMFFenceTriggerScheduled);

  if ((_DWORD)a3)
    -[FMFFence setStatus:forDate:](self, "setStatus:forDate:", v15, v12);
  if (v13)
    v13[2](v13, 0);

}

- (void)triggerWithUUID:(id)a3 status:(id)a4 atDate:(id)a5 triggerLocation:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  unsigned int v29;
  void (**v30)(_QWORD, id);
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  FMFFence *v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  v17 = sub_100011D0C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v33 = "-[FMFFence(Status) triggerWithUUID:status:atDate:triggerLocation:completion:]";
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v14;
    v40 = 2112;
    v41 = self;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x34u);
  }

  if (!-[FMFFence isOnMe](self, "isOnMe"))
    goto LABEL_8;
  v30 = (void (**)(_QWORD, id))v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFIDSMessageController sharedInstance](FMFIDSMessageController, "sharedInstance"));
  v20 = v14;
  v21 = v13;
  v22 = v12;
  v23 = v15;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence _recipients](self, "_recipients"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v25));
  v31 = 0;
  objc_msgSend(v19, "sendTriggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:toHandles:error:", v22, v24, v21, v20, v23, v26, &v31);
  v27 = v31;

  v15 = v23;
  v12 = v22;
  v13 = v21;
  v14 = v20;

  v16 = (void (**)(id, _QWORD))v30;
  if (v27)
  {
    if (v30)
      v30[2](v30, v27);

  }
  else
  {
LABEL_8:
    -[FMFFence postTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:](self, "postTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:", v12, v13, v14, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](self, "trigger"));
    v29 = objc_msgSend(v28, "isEqualToString:", FMFFenceTriggerScheduled);

    if (v29)
      -[FMFFence setStatus:forDate:](self, "setStatus:forDate:", v13, v14);
    if (v16)
      v16[2](v16, 0);
  }

}

+ (id)statusByWindowStartDateByFenceID
{
  if (qword_1000B3868 != -1)
    dispatch_once(&qword_1000B3868, &stru_10009AD50);
  return (id)qword_1000B3860;
}

- (BOOL)isStatusValidAtDate:(id)a3 reason:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  __CFString *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](self, "trigger"));
  v8 = objc_msgSend(v7, "isEqualToString:", FMFFenceTriggerScheduled);

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      v12 = CFSTR("non-scheduled fence");
LABEL_8:
      v11 = 0;
      *a4 = v12;
      goto LABEL_10;
    }
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence schedule](self, "schedule"));
  v10 = objc_msgSend(v9, "isCurrentAt:", v6);

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("scheduled fence not current at date: %@"), v6));
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v11 = 1;
LABEL_10:

  return v11;
}

- (id)statusForDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence infoByWindowStartDate:](self, "infoByWindowStartDate:", a3));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FMFFenceTriggerStatusKey")));
  else
    v5 = 0;

  return v5;
}

- (BOOL)previouslyAtLocationForDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence infoByWindowStartDate:](self, "infoByWindowStartDate:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FMFPreviouslyInFenceStatusKey")));
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)infoByWindowStartDate:(id)a3
{
  FMFFence *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  FMFFence *v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  FMFFence *v29;

  v4 = (FMFFence *)a3;
  v19 = 0;
  v5 = -[FMFFence isStatusValidAtDate:reason:](self, "isStatusValidAtDate:reason:", v4, &v19);
  v6 = v19;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence schedule](self, "schedule"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previousStartDateFrom:", v4));

    v9 = objc_msgSend((id)objc_opt_class(self), "statusByWindowStartDateByFenceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

    v13 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "-[FMFFence(Status) infoByWindowStartDate:]";
      v22 = 2112;
      v23 = v4;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: date: %@ windowStartDate: %@ statusByWindowStartDate: %@ fence: %@", buf, 0x34u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v8, "description"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v15));

  }
  else
  {
    v17 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[FMFFence(Status) infoByWindowStartDate:]";
      v22 = 2112;
      v23 = self;
      v24 = 2112;
      v25 = v4;
      v26 = 2112;
      v27 = v6;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s: fence: %@ invalid at date: %@ reason: %@", buf, 0x2Au);
    }
    v16 = 0;
  }

  return v16;
}

- (void)setStatus:(id)a3 forDate:(id)a4
{
  id v6;
  FMFFence *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  FMFFence *v48;
  __int16 v49;
  NSObject *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  FMFFence *v54;
  void *v55;
  void *v56;
  _QWORD v57[2];
  _QWORD v58[2];

  v6 = a3;
  v7 = (FMFFence *)a4;
  v44 = 0;
  v8 = -[FMFFence isStatusValidAtDate:reason:](self, "isStatusValidAtDate:reason:", v7, &v44);
  v9 = v44;
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    v43 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence schedule](self, "schedule"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "previousStartDateFrom:", v7));

    v13 = objc_msgSend((id)objc_opt_class(self), "statusByWindowStartDateByFenceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v12, "description"));
    v42 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("FMFPreviouslyInFenceStatusKey")));
    v20 = objc_msgSend(v19, "BOOLValue");

    v21 = objc_msgSend(v6, "isEqualToString:", FMFFenceTriggerStatusIn);
    v58[0] = v6;
    v57[0] = CFSTR("FMFFenceTriggerStatusKey");
    v57[1] = CFSTR("FMFPreviouslyInFenceStatusKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21 | v20));
    v58[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 2));

    v24 = objc_msgSend((id)objc_opt_class(self), "statusByWindowStartDateByFenceID");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v12, "description"));
    v55 = v27;
    v56 = v23;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
    v29 = objc_msgSend((id)objc_opt_class(self), "statusByWindowStartDateByFenceID");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, v31);

    v32 = sub_100011D0C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend((id)objc_opt_class(self), "statusByWindowStartDateByFenceID");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v36));
      *(_DWORD *)buf = 136316162;
      v46 = "-[FMFFence(Status) setStatus:forDate:]";
      v47 = 2112;
      v48 = v7;
      v49 = 2112;
      v50 = v12;
      v51 = 2112;
      v52 = v37;
      v53 = 2112;
      v54 = self;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: date: %@ windowStartDate: %@ statusByWindowStartDate: %@ fence: %@", buf, 0x34u);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v39 = objc_msgSend((id)objc_opt_class(self), "statusByWindowStartDateByFenceID");
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    objc_msgSend(v38, "setObject:forKey:", v40, CFSTR("FMFScheduledFenceStatus"));

    v10 = v43;
  }
  else
  {
    v41 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v46 = "-[FMFFence(Status) setStatus:forDate:]";
      v47 = 2112;
      v48 = self;
      v49 = 2112;
      v50 = v7;
      v51 = 2112;
      v52 = v10;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s: fence: %@ invalid at date: %@ reason: %@", buf, 0x2Au);
    }
  }

}

- (void)setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:(id)a3 date:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  FMFFence *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  FMFFence *v44;
  _QWORD v45[3];
  _QWORD v46[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v45[0] = CFSTR("FMFPreAcceptanceFenceTriggerStatus");
  v45[1] = CFSTR("FMFPreAcceptanceFenceTriggerDate");
  v46[0] = v8;
  v46[1] = v9;
  v45[2] = CFSTR("FMFPreAcceptanceFenceTriggerLocation");
  v46[2] = v10;
  v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 3));
  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[FMFFence(Status) setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:]";
    v41 = 2112;
    v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: firstTriggerForRepeatedFence infoForStartDate: %@", buf, 0x16u);
  }

  v38 = 0;
  v14 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v38));
  v15 = v38;
  v16 = sub_100011D0C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[FMFFence(Status) setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:]";
    v41 = 2112;
    v42 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: firstTriggerForRepeatedFence triggerData: %@", buf, 0x16u);
  }

  if (v15)
  {
    v18 = sub_100011D0C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100065580();
  }
  else
  {
    v20 = (void *)objc_opt_class(self);
    v34 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathToTriggerDataForFenceWithID:", v21));

    v22 = sub_100011D0C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[FMFFence(Status) setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:]";
      v41 = 2112;
      v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: path to trigger data: %@", buf, 0x16u);
    }

    v24 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", NSFileProtectionCompleteUntilFirstUserAuthentication, NSFileProtectionKey));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByDeletingLastPathComponent](v19, "stringByDeletingLastPathComponent"));
    v37 = 0;
    v35 = (void *)v24;
    objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, v24, &v37);
    v27 = v37;

    if (v27)
    {
      v28 = sub_100011D0C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_100065510();
    }
    else
    {
      v36 = 0;
      -[NSObject writeToFile:options:error:](v14, "writeToFile:options:error:", v19, 0, &v36);
      v29 = v36;
      if (v29)
      {
        v30 = sub_100011D0C();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_1000654A0();

      }
      v32 = sub_100011D0C();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v40 = "-[FMFFence(Status) setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:]";
        v41 = 2112;
        v42 = v14;
        v43 = 2112;
        v44 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: firstTriggerForRepeatedFence: %@ fence: %@", buf, 0x20u);
      }

    }
  }

}

- (id)triggerForRepeatedFenceBeforeAcceptance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v21;
  id v22;
  _QWORD v23[4];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;

  v3 = (void *)objc_opt_class(self);
  v4 = objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathToTriggerDataForFenceWithID:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  LOBYTE(v4) = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v4 & 1) != 0)
  {
    v22 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v5, 0, &v22));
    v8 = v22;
    if (v8)
    {
      v9 = sub_100011D0C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100065658();
    }
    else
    {
      if (v7)
      {
        v23[0] = objc_opt_class(NSDictionary);
        v23[1] = objc_opt_class(NSDate);
        v23[2] = objc_opt_class(NSString);
        v23[3] = objc_opt_class(CLLocation);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
        v21 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v14, v7, &v21));
        v10 = v21;

        v16 = sub_100011D0C();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        v18 = v17;
        if (v10)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_1000655EC();

          v11 = 0;
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "-[FMFFence(Status) triggerForRepeatedFenceBeforeAcceptance]";
            v26 = 2112;
            v27 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: trigger dictionary: %@", buf, 0x16u);
          }

          v11 = v15;
        }

        goto LABEL_20;
      }
      v19 = sub_100011D0C();
      v10 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[FMFFence(Status) triggerForRepeatedFenceBeforeAcceptance]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Repeated fence first trigger: No trigger Data", buf, 0xCu);
      }
    }
    v11 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v12 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[FMFFence(Status) triggerForRepeatedFenceBeforeAcceptance]";
    v26 = 2112;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: no file at %@", buf, 0x16u);
  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (void)clearStaleFenceTrigger
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;

  v3 = (void *)objc_opt_class(self);
  v4 = objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathToTriggerDataForFenceWithID:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  LOBYTE(v4) = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v4 & 1) == 0)
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[FMFFence(Status) clearStaleFenceTrigger]";
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: no file at %@", buf, 0x16u);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByDeletingLastPathComponent"));
  v15 = 0;
  v11 = objc_msgSend(v9, "removeItemAtPath:error:", v10, &v15);
  v12 = v15;

  if ((v11 & 1) == 0)
  {
    v13 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000656C4();

  }
}

- (NSArray)_recipients
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence recipients](self, "recipients"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence recipients](self, "recipients"));
  }
  else if ((-[FMFFence isFromMe](self, "isFromMe") & 1) != 0)
  {
    v5 = &__NSArray0__struct;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence followerIds](self, "followerIds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_map:", &stru_10009AD90));

  }
  return (NSArray *)v5;
}

- (void)postConfirmationNotificationWithUUID:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence followerGivenName](self, "followerGivenName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence localizedRequestNotificationStringForFollower:locationName:](self, "localizedRequestNotificationStringForFollower:locationName:", v8, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFUserNotificationManager sharedInstance](FMFUserNotificationManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004D0DC;
  v13[3] = &unk_1000995E8;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v10, "postConfirmationWithUUID:forFenceWithID:withText:forDate:completion:", v12, v11, v9, v7, v13);

}

- (void)postReceiveTriggerNotificationWithUUID:(id)a3 forStatus:(id)a4 atDate:(id)a5 triggerLocation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  FMFFence *v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25 = 0;
  v14 = -[FMFFence shouldPostForStatus:atDate:reason:](self, "shouldPostForStatus:atDate:reason:", v11, v12, &v25);
  v15 = v25;
  v16 = sub_100011D0C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    v27 = "-[FMFFence(Notifications) postReceiveTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:]";
    v28 = 1024;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: shouldPost: %d reason: %@ uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x44u);
  }

  if (v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence localizedNotificationTextForStatus:atDate:](self, "localizedNotificationTextForStatus:atDate:", v11, v12));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFUserNotificationManager sharedInstance](FMFUserNotificationManager, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence friendIdentifier](self, "friendIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence location](self, "location"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004D40C;
    v23[3] = &unk_1000995E8;
    v24 = v10;
    objc_msgSend(v19, "postReceiveTriggerWithUUID:forFenceWithID:friendID:withText:forDate:triggerLocation:fenceLocation:completion:", v24, v20, v21, v18, v12, v13, v22, v23);

  }
}

- (void)postTriggerNotificationWithUUID:(id)a3 forStatus:(id)a4 atDate:(id)a5 triggerLocation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  FMFFence *v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v29 = 0;
  v14 = -[FMFFence shouldPostForStatus:atDate:reason:](self, "shouldPostForStatus:atDate:reason:", v11, v12, &v29);
  v15 = v29;
  v16 = sub_100011D0C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    v31 = "-[FMFFence(Notifications) postTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:]";
    v32 = 1024;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    v36 = 2112;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: shouldPost: %d reason: %@ uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x44u);
  }

  if (v14)
  {
    v26 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence localizedNotificationTextForStatus:atDate:](self, "localizedNotificationTextForStatus:atDate:", v11, v12));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFUserNotificationManager sharedInstance](FMFUserNotificationManager, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence identifier](self, "identifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence followerIds](self, "followerIds"));
    v22 = v10;
    v23 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence location](self, "location"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004D764;
    v27[3] = &unk_1000995E8;
    v28 = v22;
    objc_msgSend(v19, "postTriggerWithUUID:forFenceWithID:followerID:withText:forDate:triggerLocation:fenceLocation:completion:", v28, v20, v24, v18, v12, v23, v25, v27);

    v13 = v23;
    v10 = v22;

    v15 = v26;
  }

}

- (BOOL)shouldPostForStatus:(id)a3 atDate:(id)a4 reason:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  unsigned __int8 v15;
  id v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  FMFFence *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](self, "trigger"));
  v11 = objc_msgSend(v10, "isEqualToString:", FMFFenceTriggerScheduled);

  if ((v11 & 1) != 0)
  {
    v18 = 0;
    v12 = -[FMFFence isStatusValidAtDate:reason:](self, "isStatusValidAtDate:reason:", v9, &v18);
    v13 = v18;
    if ((v12 & 1) != 0)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[FMFFence statusForDate:](self, "statusForDate:", v9));
      v15 = objc_msgSend((id)objc_opt_class(self), "shouldPostForStatus:givenPreviousStatus:", v8, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{status: %@ previousStatus}: %@"), v8, v14));
    }
    else
    {
      v16 = sub_100011D0C();
      v14 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "-[FMFFence(Notifications) shouldPostForStatus:atDate:reason:]";
        v21 = 2112;
        v22 = self;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: fence: %@ invalid at date: %@ reason: %@", buf, 0x2Au);
      }
      v15 = 0;
    }

  }
  else
  {
    if (a5)
      *a5 = CFSTR("non-scheduled fence");
    v15 = 1;
  }

  return v15;
}

+ (BOOL)shouldPostForStatus:(id)a3 givenPreviousStatus:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", FMFFenceTriggerStatusUndetermined))
  {
    LOBYTE(a1) = v7 == 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "isEqualToString:", FMFFenceTriggerStatusIn);
    v9 = FMFFenceTriggerStatusOut;
    if (v8)
    {
      LOBYTE(a1) = objc_msgSend(a1, "isString:equalToString:", v7, FMFFenceTriggerStatusOut);
    }
    else if (objc_msgSend(v6, "isEqualToString:", FMFFenceTriggerStatusOut))
    {
      LODWORD(a1) = objc_msgSend(a1, "isString:equalToString:", v7, v9) ^ 1;
    }
    else
    {
      v10 = sub_100011D0C();
      a1 = (id)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT))
        sub_100065880((os_log_t)a1);

      LOBYTE(a1) = 1;
    }
  }

  return (char)a1;
}

+ (BOOL)isString:(id)a3 equalToString:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqualToString:", a4);
  else
    return a3 == a4;
}

- (id)localizedNotificationTextForStatus:(id)a3 atDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  NSBundle *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  NSBundle *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSBundle *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v42;
  unsigned int v43;
  NSBundle *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  const __CFString *v51;
  NSBundle *v52;
  void *v53;
  void *v54;
  NSBundle *v55;
  void *v56;
  void *v57;
  NSString *v58;
  NSBundle *v59;
  void *v60;
  NSBundle *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSBundle *v66;
  NSBundle *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence displayLocationName](self, "displayLocationName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](self, "trigger"));
  v11 = objc_msgSend(v10, "isEqualToString:", FMFFenceTriggerLeaving);

  if (!v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](self, "trigger"));
    v17 = objc_msgSend(v16, "isEqualToString:", FMFFenceTriggerArriving);

    if (v17)
    {
      if ((objc_msgSend(FMFFenceTriggerStatusEnter, "isEqualToString:", v7) & 1) == 0)
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFFenceTriggerManager.m"), 762, CFSTR("invalid status"));

      }
      v18 = -[FMFFence isOnMe](self, "isOnMe");
      v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v18)
      {
        v15 = CFSTR("FENCE_TRIGGERED_YOU_ARRIVED");
        goto LABEL_11;
      }
      v22 = CFSTR("FENCE_TRIGGERED_FRIEND_ARRIVED");
LABEL_21:
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v22, &stru_10009B948, CFSTR("Localizable-TINKER")));

      v21 = objc_claimAutoreleasedReturnValue(-[FMFFence followedGivenName](self, "followedGivenName"));
      goto LABEL_22;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](self, "trigger"));
    v24 = objc_msgSend(v23, "isEqualToString:", FMFFenceTriggerScheduled);

    if (!v24)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFFenceTriggerManager.m"), 875, CFSTR("invalid trigger type"));
      v40 = 0;
      goto LABEL_23;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence statusForDate:](self, "statusForDate:", v8));
    v25 = -[FMFFence previouslyAtLocationForDate:](self, "previouslyAtLocationForDate:", v8);
    v76 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v8, 0, 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence schedule](self, "schedule"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStartTimeString"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence schedule](self, "schedule"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedEndTimeString"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence schedule](self, "schedule"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedDaysOfWeekString"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence schedule](self, "schedule"));
    v30 = objc_msgSend(v29, "daysOfWeek");

    v31 = (void *)FMFFenceTriggerStatusUndetermined;
    if (objc_msgSend(FMFFenceTriggerStatusUndetermined, "isEqualToString:", v7))
    {
      if (-[FMFFence isOnMe](self, "isOnMe"))
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFFenceTriggerManager.m"), 783, CFSTR("invalid status"));

      }
      v32 = (void *)v76;
      if (v20)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFFenceTriggerManager.m"), 784, CFSTR("invalid previousStatus"));

      }
      v33 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("FENCE_TRIGGERED_FRIEND_COULD_NOT_DETERMINE_AT_LOCATION_BY_TIME"), &stru_10009B948, CFSTR("Localizable-TINKER")));

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence followedGivenName](self, "followedGivenName"));
      v37 = v77;
      v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v36, v9, v77);
      goto LABEL_47;
    }
    v42 = (void *)FMFFenceTriggerStatusIn;
    if (objc_msgSend(FMFFenceTriggerStatusIn, "isEqualToString:", v7))
    {
      if ((objc_msgSend(FMFFenceTriggerStatusOut, "isEqualToString:", v20) & 1) == 0)
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFFenceTriggerManager.m"), 790, CFSTR("invalid previousStatus"));

      }
      v43 = -[FMFFence isOnMe](self, "isOnMe");
      v44 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = v45;
      if (v25)
      {
        v37 = v77;
        if (v43)
        {
          v47 = CFSTR("FENCE_TRIGGER_YOU_RETURNED_TO_LOCATION_AT_TIME");
LABEL_40:
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", v47, &stru_10009B948, CFSTR("Localizable-TINKER")));

          v50 = objc_claimAutoreleasedReturnValue(-[FMFFence followerGivenName](self, "followerGivenName"));
LABEL_46:
          v36 = (void *)v50;
          v32 = (void *)v76;
          v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v50, v9, v76);
LABEL_47:
          v40 = (void *)objc_claimAutoreleasedReturnValue(v38);

          goto LABEL_48;
        }
        v51 = CFSTR("FENCE_TRIGGER_FRIEND_RETURNED_TO_LOCATION_AT_TIME");
      }
      else
      {
        v37 = v77;
        if (v43)
        {
          v47 = CFSTR("FENCE_TRIGGER_YOU_ARRIVED_AT_LOCATION_AT_TIME");
          goto LABEL_40;
        }
        v51 = CFSTR("FENCE_TRIGGER_FRIEND_ARRIVED_AT_LOCATION_AT_TIME");
      }
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", v51, &stru_10009B948, CFSTR("Localizable-TINKER")));

      v50 = objc_claimAutoreleasedReturnValue(-[FMFFence followedGivenName](self, "followedGivenName"));
      goto LABEL_46;
    }
    if (objc_msgSend(FMFFenceTriggerStatusOut, "isEqualToString:", v7))
    {
      if (!v20 || objc_msgSend(v31, "isEqualToString:", v20))
      {
        v37 = v77;
        v48 = objc_msgSend(v77, "isEqualToString:", v79);
        v49 = -[FMFFence isOnMe](self, "isOnMe");
        if (v48)
        {
          if (v49)
          {
            if (v30 == (id)127)
              v35 = CFSTR("FENCE_TRIGGER_NOT_AT_LOCATION_BY_TIME");
            else
              v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FENCE_TRIGGER_NOT_AT_LOCATION_BY_TIME"), "stringByAppendingString:", CFSTR("_ON_DAYSLIST")));
            v61 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
            v57 = (void *)objc_claimAutoreleasedReturnValue(v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", v35, &stru_10009B948, CFSTR("Localizable-TINKER")));
            v63 = objc_claimAutoreleasedReturnValue(-[FMFFence followerGivenName](self, "followerGivenName"));
            v64 = (void *)v63;
            v65 = v78;
LABEL_63:
            v37 = v77;
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v62, v63, v9, v77, v65, v75));

            goto LABEL_64;
          }
          v55 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("FENCE_TRIGGERED_FRIEND_DID_NOT_ARRIVE_AT_LOCATION_BY_TIME"), &stru_10009B948, CFSTR("Localizable-TINKER")));

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence followedGivenName](self, "followedGivenName"));
          v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v57, v9, v77, v79);
        }
        else
        {
          if (v49)
          {
            if (v30 == (id)127)
              v35 = CFSTR("FENCE_TRIGGER_NOT_AT_LOCATION_BY_TIME_BETWEEN_TIMES");
            else
              v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FENCE_TRIGGER_NOT_AT_LOCATION_BY_TIME_BETWEEN_TIMES"), "stringByAppendingString:", CFSTR("_ON_DAYSLIST")));
            v66 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
            v57 = (void *)objc_claimAutoreleasedReturnValue(v66);
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", v35, &stru_10009B948, CFSTR("Localizable-TINKER")));
            v63 = objc_claimAutoreleasedReturnValue(-[FMFFence followerGivenName](self, "followerGivenName"));
            v64 = (void *)v63;
            v75 = v78;
            v65 = v79;
            goto LABEL_63;
          }
          v59 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("FENCE_TRIGGERED_FRIEND_DID_NOT_ARRIVE_AT_LOCATION_BY_TIME"), &stru_10009B948, CFSTR("Localizable-TINKER")));

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence followedGivenName](self, "followedGivenName"));
          v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v57, v9, v77, v74);
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue(v58);
LABEL_64:

        v32 = (void *)v76;
        goto LABEL_48;
      }
      v32 = (void *)v76;
      if (objc_msgSend(v42, "isEqualToString:", v20))
      {
        if (-[FMFFence isOnMe](self, "isOnMe"))
        {
          v52 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("FENCE_TRIGGER_DEPARTED_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES"), &stru_10009B948, CFSTR("Localizable-TINKER")));

          v54 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence followerGivenName](self, "followerGivenName"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v54, v9, v76));
        }
        else
        {
          v67 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(v67);
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v35, "localizedStringForKey:value:table:", CFSTR("FENCE_TRIGGERED_FRIEND_DEPARTED_LOCATION_AT_TIME"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence followedGivenName](self, "followedGivenName"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v54, v68, v9, v76));

          v32 = (void *)v76;
        }

      }
      else
      {
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        -[__CFString handleFailureInMethod:object:file:lineNumber:description:](v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFFenceTriggerManager.m"), 865, CFSTR("invalid previousStatus for status"));
        v40 = 0;
      }
    }
    else
    {
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      -[__CFString handleFailureInMethod:object:file:lineNumber:description:](v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFFenceTriggerManager.m"), 870, CFSTR("invalid status"));
      v40 = 0;
      v32 = (void *)v76;
    }
    v37 = v77;
LABEL_48:

    goto LABEL_23;
  }
  if ((objc_msgSend(FMFFenceTriggerStatusExit, "isEqualToString:", v7) & 1) == 0)
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFFenceTriggerManager.m"), 750, CFSTR("invalid status"));

  }
  v12 = -[FMFFence isOnMe](self, "isOnMe");
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (!v12)
  {
    v22 = CFSTR("FENCE_TRIGGERED_FRIEND_LEFT");
    goto LABEL_21;
  }
  v15 = CFSTR("FENCE_TRIGGERED_YOU_LEFT");
LABEL_11:
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_10009B948, CFSTR("Localizable-TINKER")));

  v21 = objc_claimAutoreleasedReturnValue(-[FMFFence followerGivenName](self, "followerGivenName"));
LABEL_22:
  v39 = (void *)v21;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21, v9));

LABEL_23:
  return v40;
}

- (id)followedGivenName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "followedHandleForFence:", self));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAddressBook sharedAddressBook](FMFAddressBook, "sharedAddressBook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prettyGivenNameForHandle:", v4));

  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "genericFriendName");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (id)followedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "followedHandleForFence:", self));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAddressBook sharedAddressBook](FMFAddressBook, "sharedAddressBook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prettyNameForHandle:", v4));

  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "genericFriendName");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (id)followerGivenName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "followerHandleForFence:", self));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAddressBook sharedAddressBook](FMFAddressBook, "sharedAddressBook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prettyGivenNameForHandle:", v4));

  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "genericFriendName");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (id)followerName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "followerHandleForFence:", self));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAddressBook sharedAddressBook](FMFAddressBook, "sharedAddressBook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prettyNameForHandle:", v4));

  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "genericFriendName");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (CKRecordID)ckRecordID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordName](self, "ckRecordName"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordZoneID](self, "ckRecordZoneID"));

    if (!v4)
    {
      v7 = 0;
      return (CKRecordID *)v7;
    }
    v5 = objc_alloc((Class)CKRecordID);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordName](self, "ckRecordName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordZoneID](self, "ckRecordZoneID"));
    v7 = objc_msgSend(v5, "initWithRecordName:zoneID:", v3, v6);

  }
  else
  {
    v7 = 0;
  }

  return (CKRecordID *)v7;
}

- (CKRecordZoneID)ckRecordZoneID
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordZoneName](self, "ckRecordZoneName"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordZoneOwnerName](self, "ckRecordZoneOwnerName"));
    v5 = objc_msgSend(v4, "length");

    if (!v5)
    {
      v8 = 0;
      return (CKRecordZoneID *)v8;
    }
    v6 = objc_alloc((Class)CKRecordZoneID);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordZoneName](self, "ckRecordZoneName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordZoneOwnerName](self, "ckRecordZoneOwnerName"));
    v8 = objc_msgSend(v6, "initWithZoneName:ownerName:", v3, v7);

  }
  else
  {
    v8 = 0;
  }

  return (CKRecordZoneID *)v8;
}

- (NSString)ckRecordZoneName
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordName](self, "ckRecordName"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_opt_class(self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordName](self, "ckRecordName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ckRecordZoneNameForRecordName:", v6));

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

+ (id)ckRecordZoneNameForRecordName:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fence-%@"), a3);
}

- (void)updateFromRecord:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  FMFSchedule *v28;
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
  FMFFence *v45;
  id v46;

  v46 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location")));
  if (v5)
  {
    -[FMFFence setLocation:](self, "setLocation:", v5);
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "invalidLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[FMFFence setLocation:](self, "setLocation:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("label")));
  -[FMFFence setLabel:](self, "setLabel:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("locationType")));
  -[FMFFence setLocationType:](self, "setLocationType:", objc_msgSend(v11, "unsignedIntegerValue"));

  v12 = objc_alloc((Class)FMFPlacemark);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("placemark_locality")));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v45 = self;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("placemark_administrativeArea")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("placemark_country")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("placemark_state")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("placemark_streetAddress")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("placemark_streetName")));
  v22 = v12;
  v23 = (void *)v14;
  v24 = objc_msgSend(v22, "initWithLocality:administrativeArea:country:state:streetAddress:streetName:", v13, v14, v15, v17, v19, v21);
  -[FMFFence setPlacemark:](v45, "setPlacemark:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("fence_muteEndDate")));
  -[FMFFence setMuteEndDate:](v45, "setMuteEndDate:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](v45, "trigger"));
  LODWORD(v26) = objc_msgSend(v27, "isEqualToString:", FMFFenceTriggerScheduled);

  if ((_DWORD)v26)
  {
    v28 = objc_opt_new(FMFSchedule);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("schedule_startHour")));
    -[FMFSchedule setStartHour:](v28, "setStartHour:", objc_msgSend(v30, "unsignedIntegerValue"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("schedule_startMin")));
    -[FMFSchedule setStartMin:](v28, "setStartMin:", objc_msgSend(v32, "unsignedIntegerValue"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("schedule_endHour")));
    -[FMFSchedule setEndHour:](v28, "setEndHour:", objc_msgSend(v34, "unsignedIntegerValue"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("schedule_endMin")));
    -[FMFSchedule setEndMin:](v28, "setEndMin:", objc_msgSend(v36, "unsignedIntegerValue"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("schedule_daysOfWeek")));
    -[FMFSchedule setDaysOfWeek:](v28, "setDaysOfWeek:", objc_msgSend(v38, "integerValue"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "encryptedValuesByKey"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("schedule_timeZone")));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v40));
    -[FMFSchedule setTimeZone:](v28, "setTimeZone:", v41);

    -[FMFFence setSchedule:](v45, "setSchedule:", v28);
  }

}

+ (id)invalidLocation
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)CLLocation);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = objc_msgSend(v2, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v3, kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude, 0.0, 0.0, 0.0);

  return v4;
}

@end
