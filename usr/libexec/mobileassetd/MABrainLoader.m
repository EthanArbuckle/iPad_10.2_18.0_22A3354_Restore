@implementation MABrainLoader

+ (id)sharedInstance
{
  if (qword_1000105F8 != -1)
    dispatch_once(&qword_1000105F8, &stru_10000C3A8);
  return (id)qword_1000105F0;
}

- (BOOL)loadCryptex:(BOOL)a3 bundle:(id)a4 bundleName:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  id v12;
  unsigned __int8 v13;
  BOOL v14;
  id v15;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  if ((objc_msgSend(v7, "isPersonalized") & 1) == 0
    && (objc_msgSend(v7, "isGloballySigned") & 1) == 0
    && !v6)
  {
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ is not personalized, and unpersonalized brains are not allowed."), v8)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v9, "UTF8String"));

    v10 = 0;
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  if (v6)
    v11 = CFSTR("MobileAssetBrain bundle %@ is personalized, but unpersonalized brains are also allowed.");
  else
    v11 = CFSTR("MobileAssetBrain bundle %@ is personalized.");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v8)));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v12, "UTF8String"));

  v17 = 0;
  v13 = objc_msgSend(v7, "graft:", &v17);
  v10 = v17;
  if ((v13 & 1) == 0)
  {
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error grafting MobileAssetBrain bundle %@: %@"), v8, v10)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v15, "UTF8String"));

    goto LABEL_11;
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)loadTrustCache:(BOOL)a3 bundle:(id)a4 bundleName:(id)a5 needsUnlock:(BOOL *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  id v25;
  id v26;
  char v27;
  id v28;
  uint64_t v30;
  int *v31;
  NSString *v32;
  id v33;
  const __CFString *v34;
  id v35;
  unsigned int v36;
  id v37;
  id v38;

  LODWORD(v8) = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isPersonalized"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trustCachePath"));
    v38 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v11, 0, &v38));
    v13 = v38;

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trustCachePath"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error loading trust cache at %@: %@"), v14, v13));

      v16 = objc_retainAutorelease(v15);
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v16, "UTF8String"));
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketPath"));
      v37 = 0;
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v19, 0, &v37));
      v13 = v37;

      if (v13)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketPath"));
        v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error loading Cryptex1 ticket at %@: %@"), v20, v13));

        v22 = (void *)v21;
      }
      else
      {
        if ((unint64_t)objc_msgSend(v12, "length") >> 32)
          v23 = 0;
        else
          v23 = objc_msgSend(v12, "length");
        if ((unint64_t)objc_msgSend(v16, "length") >> 32)
          v24 = 0;
        else
          v24 = objc_msgSend(v16, "length");
        if (v12 && v23 && v16 && v24)
        {
          v36 = objc_msgSend(v9, "hasValidCurrentBootOnlyTicket");
          v25 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
          v16 = objc_retainAutorelease(v16);
          v26 = objc_msgSend(v16, "bytes");
          if (v36)
            v27 = 24;
          else
            v27 = 17;
          if (amfi_load_trust_cache(v27, (uint64_t)v25, v23, (uint64_t)v26, v24, 0, 0))
          {
            if (*__error() == 1 && sub_100004BE8())
            {
              v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to load trust cache for MobileAssetBrain bundle %@ likely due to locked device state."), v10)));
              NSLog(CFSTR("[MAB] %s"), objc_msgSend(v8, "UTF8String"));

              LOBYTE(v8) = 0;
              *a6 = 1;
LABEL_29:

              goto LABEL_30;
            }
            v30 = *__error();
            v31 = __error();
            v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to load trust cache for MobileAssetBrain bundle %@: errno=%d (%s)"), v10, v30, strerror(*v31));
            v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v32));
            NSLog(CFSTR("[MAB] %s"), objc_msgSend(v33, "UTF8String"));

            if (!(_DWORD)v8)
              goto LABEL_29;
            v34 = CFSTR("Proceeding because unpersonalized brains are allowed.");
          }
          else
          {
            v35 = v10;
            v34 = CFSTR("Successfully loaded trust cache for MobileAssetBrain bundle %@");
          }
          v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v35)));
          NSLog(CFSTR("[MAB] %s"), objc_msgSend(v8, "UTF8String"));

          LOBYTE(v8) = 1;
          goto LABEL_29;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Trust cache and/or ticket for MobileAssetBrain bundle %@ are invalid\ntrustCache=%@\nticket=%@"), v10, v12, v16));
      }
      v28 = objc_retainAutorelease(v22);
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v28, "UTF8String"));

    }
    LOBYTE(v8) = 0;
    goto LABEL_29;
  }
  if ((v8 & 1) != 0)
  {
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ is not personalized, but unpersonalized brains are allowed."), v10)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v17, "UTF8String"));

    LOBYTE(v8) = 1;
  }
  else
  {
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ is not personalized, and unpersonalized brains are not allowed."), v10)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v18, "UTF8String"));

    LOBYTE(v8) = 0;
  }
LABEL_30:

  return (char)v8;
}

- (void)loadHistory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006E2C;
  block[3] = &unk_10000C3D0;
  block[4] = self;
  if (qword_100010600 != -1)
    dispatch_once(&qword_100010600, block);
}

- (BOOL)healthCheck:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  id v9;
  unint64_t v10;
  char *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  id v17;
  NSString *v18;
  BOOL v19;
  double v20;
  const char *v21;
  NSString *v22;
  void *v23;
  const char *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bundleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_history, "objectForKeyedSubscript:", CFSTR("LaunchRecords")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = (char *)objc_msgSend(v6, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    if (v7)
    {
      v30 = (unint64_t)v7;
      v31 = v4;
      v9 = 0;
      v10 = 0;
      v11 = v7 - 1;
      v12 = 0.0;
      do
      {
        v13 = v9;
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v11));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LaunchDate")));
        v15 = objc_opt_class(NSDate);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          objc_msgSend(v8, "timeIntervalSinceDate:", v14);
          v12 = v16;
          if (v16 <= 60.0)
            ++v10;
        }
        else
        {
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid %@ field in launch record:\n%@"), CFSTR("LaunchDate"), v9)));
          NSLog(CFSTR("[MAB] %s"), objc_msgSend(v17, "UTF8String"));

        }
        --v11;
      }
      while (v11 != (char *)-1);
      if (v10 >= 3)
      {
        v4 = v31;
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ has been relaunched %lu time%s in the last %0.1f seconds. This is unhealthy!"), v31, v10, "s", 0x404E000000000000);
LABEL_25:
        v23 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v19 = 0;
        goto LABEL_26;
      }
      v4 = v31;
      if (v12 >= 3600.0)
      {
        v20 = (double)v30 / v12;
        if (v20 >= 0.00111111111)
        {
          v24 = "s";
          if (v20 * 3600.0 == 1.0)
            v24 = "";
          v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ has been relaunched on average %0.1f time%s per hour. This is unhealthy!"), v31, v20 * 3600.0, v24, v29);
          goto LABEL_25;
        }
      }
      if (v10)
      {
        v21 = "s";
        if (v10 == 1)
          v21 = "";
        v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ has been relaunched %lu time%s in the last %0.1f seconds."), v31, v10, v21, 0x404E000000000000);
        goto LABEL_21;
      }
    }
    else
    {
      v9 = 0;
    }
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ appears to be healthy."), v4, v27, v28, v29);
LABEL_21:
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v19 = 1;
LABEL_26:
    v25 = objc_retainAutorelease(v23);
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v25, "UTF8String"));

    goto LABEL_27;
  }
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("There are no launch records for MobileAssetBrain bundle %@"), v4)));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v9, "UTF8String"));
  v19 = 1;
LABEL_27:

  return v19;
}

- (BOOL)verify:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSString *v17;
  BOOL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "graftPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/RestoreVersion.plist")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
  v27 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v8, &v27));
  v10 = v27;

  if (v9)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RestoreLongVersion")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "restoreVersion"));

    if (v11 && v13)
    {
      v14 = objc_msgSend(objc_alloc((Class)SUCoreRestoreVersion), "initWithRestoreVersion:", v11);
      v15 = objc_msgSend(objc_alloc((Class)SUCoreRestoreVersion), "initWithRestoreVersion:", v13);
      v16 = v15;
      if (v14 && v15)
      {
        if ((objc_msgSend(v15, "isComparable:", v14) & 1) == 0 && (sub_1000048D4() & 1) == 0)
        {
          v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ is from a different build group than the OS. (%ld -> %ld)"), v5, objc_msgSend(v16, "buildGroup"), objc_msgSend(v14, "buildGroup"));
          goto LABEL_26;
        }
        if (objc_msgSend(v16, "isComparable:", v14))
        {
          if (objc_msgSend(v16, "compare:", v14) == (id)1)
          {
            v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ is older than current OS: %@ < %@"), v5, v11, v13);
            goto LABEL_26;
          }
        }
        else
        {
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ is from a different build group than the OS, but cross build group brains are allowed. (%ld -> %ld)"), v5, objc_msgSend(v16, "buildGroup"), objc_msgSend(v14, "buildGroup"))));
          NSLog(CFSTR("[MAB] %s"), objc_msgSend(v26, "UTF8String"));

        }
        if ((sub_10000490C() & 1) != 0)
        {
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MABrain health check is disabled."))));
          NSLog(CFSTR("[MAB] %s"), objc_msgSend(v21, "UTF8String"));

          v18 = 1;
        }
        else
        {
          v18 = -[MABrainLoader healthCheck:](self, "healthCheck:", v4);
        }
        goto LABEL_28;
      }
      if (!v14)
      {
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ RestoreVersion string is invalid: %@"), v5, v11)));
        NSLog(CFSTR("[MAB] %s"), objc_msgSend(v19, "UTF8String"));

      }
      if (v16)
        goto LABEL_27;
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("System RestoreVersion string is invalid: %@"), v13, v24, v25);
LABEL_26:
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v17));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v22, "UTF8String"));

LABEL_27:
      v18 = 0;
LABEL_28:

      goto LABEL_29;
    }
    if (v11)
    {
      if (v13)
      {
LABEL_14:
        v18 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ RestoreVersion string is nil"), v5)));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v20, "UTF8String"));

      if (v13)
        goto LABEL_14;
    }
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("System RestoreVersion string is nil"))));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v14, "UTF8String"));
    v18 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ RestoreVersion.plist could not be loaded: %@"), v5, v10)));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v11, "UTF8String"));
  v18 = 0;
LABEL_31:

  return v18;
}

- (void)recordLaunch:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char *v16;
  char *v17;
  char *v18;
  NSString *v19;
  id v20;
  void *v21;
  void *v22;
  NSNumber *v23;
  void *v24;
  NSMutableDictionary *history;
  void *v26;
  id v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;

  v4 = (__CFString *)a3;
  v5 = v4;
  v6 = CFSTR("built-in");
  if (v4)
    v6 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_history, "objectForKeyedSubscript:", CFSTR("LaunchRecords")));
  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v7));
  v14 = objc_alloc_init((Class)NSMutableArray);
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = (char *)objc_msgSend(v13, "count");
  v17 = v16;
  if ((unint64_t)v16 < 0x33)
  {
    v18 = 0;
  }
  else
  {
    v18 = v16 - 50;
    if (v5)
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Only preserving the last %d launch records for MobileAssetBrain bundle %@"), 50, v5);
    else
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Only preserving the last %d launch records for built-in MobileAssetBrain"), 50, v34);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v19));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v20, "UTF8String"));

  }
  if (v18 < v17)
  {
    do
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v18));
      objc_msgSend(v14, "addObject:", v21);

      ++v18;
    }
    while (v17 != v18);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("LaunchDate"));

  v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("PID"));

  objc_msgSend(v14, "addObject:", v15);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_history, "setObject:forKeyedSubscript:", v12, CFSTR("LaunchRecords"));
  history = self->_history;
  v36 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", history, 100, 0, &v36));
  v27 = v36;
  v28 = v27;
  if (v26)
  {
    v35 = v27;
    v29 = objc_msgSend(v26, "writeToFile:options:error:", CFSTR("/private/var/run/com.apple.mobileassetd-MobileAssetBrain"), 0, &v35);
    v30 = v35;

    if (v29)
      v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Successfully updated launch history with new record:\n%@"), v15);
    else
      v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not write launch history: %@"), v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not serialize launch history: %@"), v27));
    v30 = v28;
  }
  v33 = objc_retainAutorelease(v32);
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v33, "UTF8String"));

}

- (int)run:(int)a3 argv:(char *)a4 info:(id)a5 path:(const char *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t (*v18)(uint64_t, char **, uint64_t);
  uint64_t (*v19)(uint64_t, char **, uint64_t);
  uint64_t v20;
  int v21;
  NSString *v22;
  id v23;
  NSString *v24;
  id v25;
  _QWORD block[5];
  id v28;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v12 = objc_msgSend(v10, "mutableCopy");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007C78;
  block[3] = &unk_10000C3F8;
  block[4] = self;
  v13 = v10;
  v28 = v13;
  if (qword_100010608 != -1)
    dispatch_once(&qword_100010608, block);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a6));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("libmobileassetd-path"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("allow-st-extractor-plugin"));
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempting to load MobileAssetBrain at %s"), a6)));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v15, "UTF8String"));

  v16 = dlopen(a6, 261);
  if (v16)
  {
    v17 = v16;
    v18 = (uint64_t (*)(uint64_t, char **, uint64_t))dlsym(v16, "mobileassetd_main");
    if (v18)
    {
      v19 = v18;
      v20 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v12));

      v21 = v19(v8, a4, v20);
      v13 = (id)v20;
    }
    else
    {
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to find MobileAssetBrain entry point: %s"), dlerror());
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v24));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v25, "UTF8String"));

      v21 = 1;
    }
    dlclose(v17);
  }
  else
  {
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to load MobileAssetBrain: %s"), dlerror());
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v22));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v23, "UTF8String"));

    v21 = 1;
  }

  objc_autoreleasePoolPop(v11);
  return v21;
}

- (char)getTrainName
{
  if (qword_100010610 != -1)
    dispatch_once(&qword_100010610, &stru_10000C418);
  return (char *)qword_100010618;
}

- (int)run:(int)a3 argv:(char *)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  char v13;
  _QWORD *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  void *context;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  MABrainLoader *v57;
  __CFString *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  __int16 v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[4];
  _QWORD v81[4];

  v4 = *(_QWORD *)&a3;
  context = objc_autoreleasePoolPush();
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_100008694;
  v72 = sub_1000086A4;
  v73 = 0;
  v6 = sub_100004944();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)v7;
  v9 = CFSTR("<unknown>");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v67 = 0;
  -[MABrainLoader loadHistory](self, "loadHistory");
  if (sub_100004880())
  {
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v11 = sub_100004A58();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_100004848();
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000086AC;
    v55[3] = &unk_10000C440;
    v59 = &v63;
    v48 = v12;
    v56 = v48;
    v57 = self;
    v62 = v13;
    v60 = &v74;
    v58 = v10;
    v61 = &v68;
    v14 = objc_retainBlock(v55);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ proposedTargetPath](__MABuiltinBrainBundle__, "proposedTargetPath"));
    v54 = 0;
    v16 = +[__MABuiltinBrainBundle__ destageProposed:](__MABuiltinBrainBundle__, "destageProposed:", &v54);
    v17 = v54;
    if ((v16 & 1) == 0)
    {
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error de-staging proposed MobileAssetBrain: %@"), v17, v48, context)));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v18, "UTF8String"));

    }
    if (((unsigned int (*)(_QWORD *, const __CFString *, void *, char *))v14[2])(v14, CFSTR("Proposed"), v15, (char *)&v67 + 1))
    {
      v19 = objc_msgSend((id)v69[5], "mutableCopy");
      objc_msgSend(v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("commit"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Info dict for proposed brain is %@"), v19)));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v20, "UTF8String"));

      -[MABrainLoader run:argv:info:path:](self, "run:argv:info:path:", v4, a4, v19, v75[3]);
      goto LABEL_15;
    }
    if (HIBYTE(v67))
    {
      v53 = v17;
      v21 = +[__MABuiltinBrainBundle__ stageProposed:error:](__MABuiltinBrainBundle__, "stageProposed:error:", v15, &v53);
      v22 = v53;

      if ((v21 & 1) == 0)
      {
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error re-staging proposed MobileAssetBrain for post unlock: %@"), v22)));
        NSLog(CFSTR("[MAB] %s"), objc_msgSend(v23, "UTF8String"));

        HIBYTE(v67) = 0;
      }
    }
    else
    {
      if (!*((_BYTE *)v64 + 24))
        goto LABEL_15;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Proposed MobileAssetBrain bundle %@ requires a reboot"), v24));

      v26 = objc_retainAutorelease(v25);
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v26, "UTF8String"));

      v52 = v17;
      LOBYTE(v26) = +[__MABuiltinBrainBundle__ stageProposed:error:](__MABuiltinBrainBundle__, "stageProposed:error:", v15, &v52);
      v22 = v52;

      if ((v26 & 1) == 0)
      {
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error re-staging proposed MobileAssetBrain for post reboot: %@"), v22)));
        NSLog(CFSTR("[MAB] %s"), objc_msgSend(v27, "UTF8String"));

      }
    }
    v17 = v22;
LABEL_15:
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ currentTargetPath](__MABuiltinBrainBundle__, "currentTargetPath"));

    if (((unsigned int (*)(_QWORD *, const __CFString *, void *, __int16 *))v14[2])(v14, CFSTR("Current"), v28, &v67))
    {
      v29 = objc_msgSend((id)v69[5], "mutableCopy");
      v30 = v29;
      if (HIBYTE(v67))
        objc_msgSend(v29, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("relaunch-on-unlock"));
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Info dict for current brain is %@"), v30)));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v31, "UTF8String"));

      -[MABrainLoader run:argv:info:path:](self, "run:argv:info:path:", v4, a4, v30, v75[3]);
    }
    else
    {
      if (!v28 || (_BYTE)v67)
        goto LABEL_20;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
      v45 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current MobileAssetBrain bundle %@ is no longer viable"), v44));

      v46 = objc_retainAutorelease((id)v45);
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v46, "UTF8String"));

      v51 = v17;
      LOBYTE(v45) = +[__MABuiltinBrainBundle__ destageCurrent:](__MABuiltinBrainBundle__, "destageCurrent:", &v51);
      v47 = v51;

      if ((v45 & 1) != 0)
      {
        v17 = v47;
        goto LABEL_20;
      }
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error de-staging current MobileAssetBrain: %@"), v47)));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v30, "UTF8String"));
      v17 = v47;
    }

LABEL_20:
    _Block_object_dispose(&v63, 8);
  }
  v32 = objc_msgSend(CFSTR("/usr/lib/libmobileassetd.dylib"), "fileSystemRepresentation");
  v75[3] = (uint64_t)v32;
  v33 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), -[MABrainLoader getTrainName](self, "getTrainName")));
  v34 = (void *)v33;
  if (v33)
  {
    v80[0] = CFSTR("built-in");
    v80[1] = CFSTR("_CompatibilityVersion");
    v81[0] = &__kCFBooleanTrue;
    v81[1] = &off_10000D788;
    v80[2] = CFSTR("mobileassetd-uuid");
    v80[3] = CFSTR("mobileassetd-trainname");
    v81[2] = v10;
    v81[3] = v33;
    v35 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 4));
  }
  else
  {
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to determine train name"))));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v36, "UTF8String"));

    v78[0] = CFSTR("built-in");
    v78[1] = CFSTR("_CompatibilityVersion");
    v79[0] = &__kCFBooleanTrue;
    v79[1] = &off_10000D788;
    v78[2] = CFSTR("mobileassetd-uuid");
    v79[2] = v10;
    v35 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 3));
  }
  v37 = (void *)v69[5];
  v69[5] = v35;

  v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Info dict for builtin brain is %@"), v69[5])));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v38, "UTF8String"));

  if (HIBYTE(v67) | v67)
  {
    v39 = objc_msgSend((id)v69[5], "mutableCopy");
    objc_msgSend(v39, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("relaunch-on-unlock"));
    v40 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v39));
    v41 = (void *)v69[5];
    v69[5] = v40;

  }
  v42 = -[MABrainLoader run:argv:info:path:](self, "run:argv:info:path:", v4, a4, v69[5], v75[3]);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);
  objc_autoreleasePoolPop(context);
  return v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
}

@end
