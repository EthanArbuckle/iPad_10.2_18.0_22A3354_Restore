@implementation RateLimiter

- (RateLimiter)initWithConfig:(id)a3
{
  id v5;
  RateLimiter *v6;
  RateLimiter *v7;
  NSString *assetType;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RateLimiter;
  v6 = -[RateLimiter init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    assetType = v7->_assetType;
    v7->_assetType = 0;

    -[RateLimiter reset](v7, "reset");
  }

  return v7;
}

- (RateLimiter)initWithCoder:(id)a3
{
  id v4;
  RateLimiter *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  NSArray *groups;
  id v13;
  uint64_t v14;
  NSDate *overloadUntil;
  id v16;
  uint64_t v17;
  NSDate *lastJudgment;
  id v19;
  uint64_t v20;
  NSString *assetType;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSSet *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *config;
  RateLimiter *v30;
  objc_super v32;

  v4 = a3;
  if (v4)
  {
    v32.receiver = self;
    v32.super_class = (Class)RateLimiter;
    v5 = -[RateLimiter init](&v32, "init");
    if (v5)
    {
      v6 = objc_opt_class(NSArray);
      v7 = objc_opt_class(NSMutableDictionary);
      v8 = objc_opt_class(NSString);
      v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(NSDate), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("RLgroups")));
      groups = v5->_groups;
      v5->_groups = (NSArray *)v11;

      v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("RLoverLoadedUntil"));
      v14 = objc_claimAutoreleasedReturnValue(v13);
      overloadUntil = v5->_overloadUntil;
      v5->_overloadUntil = (NSDate *)v14;

      v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("RLlastJudgment"));
      v17 = objc_claimAutoreleasedReturnValue(v16);
      lastJudgment = v5->_lastJudgment;
      v5->_lastJudgment = (NSDate *)v17;

      v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("RLassetType"));
      v20 = objc_claimAutoreleasedReturnValue(v19);
      assetType = v5->_assetType;
      v5->_assetType = (NSString *)v20;

      if (!v5->_assetType)
      {
        v22 = objc_opt_class(NSMutableArray);
        v23 = objc_opt_class(NSDictionary);
        v24 = objc_opt_class(NSString);
        v25 = objc_opt_class(NSNumber);
        v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, v23, v24, v25, objc_opt_class(NSDate), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("RLconfig")));
        config = v5->_config;
        v5->_config = (NSDictionary *)v28;

      }
    }
    self = v5;
    v30 = self;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (int64_t)judge:(id)a3 at:(id)a4 limitTime:(id *)a5
{
  void *v5;
  void *v6;
  id v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  signed int v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v54;
  id *v55;
  id v56;
  void *v57;
  int64_t v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;

  v10 = a3;
  v59 = a4;
  v11 = (void *)CFPreferencesCopyValue(CFSTR("DisableKeychainRateLimiting"), CFSTR("com.apple.security"), kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  v12 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0 && objc_msgSend(v11, "BOOLValue"))
  {
    if (qword_100340F68 != -1)
      dispatch_once(&qword_100340F68, &stru_1002DC600);
    dispatch_source_merge_data((dispatch_source_t)qword_100340F70, 1uLL);
    v13 = 0;
    *a5 = 0;
    goto LABEL_37;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
    objc_msgSend(v59, "timeIntervalSinceDate:", v15);
    v17 = v16;

    if (v17 >= 0.0)
      -[RateLimiter trim:](self, "trim:", v59);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));

    if (v18)
    {
      *a5 = (id)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
LABEL_21:
      v13 = 4;
      goto LABEL_37;
    }
  }
  v55 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter lastJudgment](self, "lastJudgment", v11));
  v56 = v10;
  if (!v19)
  {
LABEL_16:
    v23 = -[RateLimiter stateSize](self, "stateSize");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("general")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("maxStateSize")));
    v27 = objc_msgSend(v26, "unsignedIntegerValue");

    if (v19)
    {

    }
    v10 = v56;
    if (v23 <= (unint64_t)v27)
      goto LABEL_22;
    goto LABEL_19;
  }
  a5 = (id *)objc_claimAutoreleasedReturnValue(-[RateLimiter lastJudgment](self, "lastJudgment"));
  objc_msgSend(v59, "timeIntervalSinceDate:", a5);
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("general")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxItemAge")));
  if (v21 <= (double)(int)objc_msgSend(v6, "intValue"))
  {
    v57 = v22;
    goto LABEL_16;
  }

LABEL_19:
  -[RateLimiter trim:](self, "trim:", v59);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));

  if (v28)
  {
    v11 = v54;
    *v55 = (id)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
    goto LABEL_21;
  }
LABEL_22:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
  v31 = objc_msgSend(v30, "count");

  if (!v31)
    goto LABEL_35;
  v32 = 0;
  v13 = 0;
  do
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("groups")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", v32));

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("property")));
    if (v32)
    {
      v37 = objc_claimAutoreleasedReturnValue(-[RateLimiter getPropertyValue:object:](self, "getPropertyValue:object:", v36, v10));

      v36 = (void *)v37;
    }
    if (v36)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", v32));
      v40 = objc_claimAutoreleasedReturnValue(-[RateLimiter consumeTokenFromBucket:config:name:at:](self, "consumeTokenFromBucket:config:name:at:", v39, v35, v36, v59));

      if (v40)
      {
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "laterDate:", v40));

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("badness")));
        v43 = objc_msgSend(v42, "intValue");

        if (v13 <= v43)
          v13 = v43;
        v29 = (void *)v41;
      }
    }
    else
    {
      v44 = sub_10000BDF4(CFSTR("ratelimiter"), 0);
      v40 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v58 = v13;
        v45 = v29;
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("general")));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("name")));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("property")));
        *(_DWORD *)buf = 138412546;
        v61 = v48;
        v62 = 2112;
        v63 = v49;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "RateLimiter[%@]: Got nil instead of property named %@", buf, 0x16u);

        v10 = v56;
        v29 = v45;
        v13 = v58;
      }
    }

    ++v32;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
    v51 = objc_msgSend(v50, "count");

  }
  while (v32 < (unint64_t)v51);
  v52 = v29;
  if (!v13)
  {
LABEL_35:
    v13 = 0;
    v52 = 0;
  }
  *v55 = objc_retainAutorelease(v52);
  -[RateLimiter setLastJudgment:](self, "setLastJudgment:", v59);

  v11 = v54;
LABEL_37:

  return v13;
}

- (id)consumeTokenFromBucket:(id)a3 config:(id)a4 name:(id)a5 at:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("capacity")));
  v14 = objc_msgSend(v13, "intValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rate")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", (double)-(v14 * objc_msgSend(v15, "intValue"))));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v11));
  v18 = v17;
  if (!v17 || (objc_msgSend(v17, "timeIntervalSinceDate:", v16), v19 < 0.0))
  {
    v20 = v16;

    v18 = v20;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rate")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v21, "intValue")));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v11);
  objc_msgSend(v22, "timeIntervalSinceDate:", v12);
  if (v23 > 0.0)
    v24 = v22;
  else
    v24 = 0;
  v25 = v24;

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  v5 = objc_opt_class(RateLimiter);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "config"));
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v16 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groups"));
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v16 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter lastJudgment](self, "lastJudgment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastJudgment"));
    v30 = v11;
    if (!objc_msgSend(v11, "isEqual:", v12))
    {
      v16 = 0;
LABEL_28:

      goto LABEL_29;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
    if (v13 || (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overloadUntil"))) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overloadUntil"));
      v29 = v14;
      if (!objc_msgSend(v14, "isEqual:"))
      {
        v16 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v27 = v13;
      v15 = 1;
    }
    else
    {
      v27 = 0;
      v24 = 0;
      v15 = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter assetType](self, "assetType"));
    if (v17 || (v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetType"))) != 0)
    {
      v25 = v15;
      v26 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter assetType](self, "assetType", v22, v24));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetType"));
      v16 = objc_msgSend(v18, "isEqualToString:", v19);

      if (v17)
      {

        v12 = v26;
        if (v25)
        {
          v13 = v27;
          goto LABEL_24;
        }
        v13 = v27;
LABEL_25:
        if (!v13)

        goto LABEL_28;
      }
      v12 = v26;
      LOBYTE(v15) = v25;
      v20 = v23;
    }
    else
    {
      v20 = 0;
      v16 = 1;
    }

    v13 = v27;
    if ((v15 & 1) != 0)
      goto LABEL_24;
    goto LABEL_25;
  }
  v16 = 0;
LABEL_31:

  return v16;
}

- (void)reset
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;

  v12 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groups")));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = objc_opt_new(NSMutableDictionary);
      -[NSMutableArray addObject:](v12, "addObject:", v7);

      ++v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("groups")));
      v10 = objc_msgSend(v9, "count");

    }
    while (v6 < (unint64_t)v10);
  }
  -[RateLimiter setGroups:](self, "setGroups:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  -[RateLimiter setLastJudgment:](self, "setLastJudgment:", v11);

  -[RateLimiter setOverloadUntil:](self, "setOverloadUntil:", 0);
}

- (void)trim:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id obj;
  id obja;
  id v36;
  _QWORD v37[4];
  id v38;
  unsigned int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];

  v36 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("general")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxItemAge")));
  v7 = objc_msgSend(v6, "intValue");

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10008E290;
        v37[3] = &unk_1002DC648;
        v38 = v36;
        v39 = v7;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keysOfEntriesPassingTest:", v37));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
        objc_msgSend(v12, "removeObjectsForKeys:", v14);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v9);
  }

  v15 = -[RateLimiter stateSize](self, "stateSize");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("general")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("maxStateSize")));
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  if (v15 <= (unint64_t)v19)
  {
    -[RateLimiter setOverloadUntil:](self, "setOverloadUntil:", 0);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("general")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("overloadDuration")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dateByAddingTimeInterval:", (double)objc_msgSend(v22, "unsignedIntValue")));
    -[RateLimiter setOverloadUntil:](self, "setOverloadUntil:", v23);

    v24 = sub_10000BDF4(CFSTR("ratelimiter"), 0);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      obja = (id)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("general")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("name")));
      v28 = -[RateLimiter stateSize](self, "stateSize");
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("general")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("maxStateSize")));
      v32 = objc_msgSend(v31, "unsignedLongValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
      *(_DWORD *)buf = 138413058;
      v45 = v27;
      v46 = 2048;
      v47 = v28;
      v48 = 2048;
      v49 = v32;
      v50 = 2112;
      v51 = v33;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "RateLimiter[%@] state size %lu exceeds max %lu, overloaded until %@", buf, 0x2Au);

    }
  }

}

- (unint64_t)stateSize
{
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)diagnostics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("general")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter lastJudgment](self, "lastJudgment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RateLimiter[%@]\nconfig:%@\ngroups:%@\noverloaded:%@\nlastJudgment:%@"), v5, v6, v7, v8, v9));

  return v10;
}

- (id)getPropertyValue:(id)a3 object:(id)a4
{
  NSString *v6;
  id v7;
  SEL v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  NSString *v20;

  v6 = (NSString *)a3;
  v7 = a4;
  if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("accessGroup"))
    || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("uuid")))
  {
    v8 = NSSelectorFromString(v6);
    v9 = ((uint64_t (*)(id, SEL))objc_msgSend(v7, "methodForSelector:", v8))(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }
  else
  {
    v11 = sub_10000EF14("SecCritical");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("general")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("name")));
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "RateLimter[%@]: \"%@\" is not an approved selector string", (uint8_t *)&v17, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_groups, CFSTR("RLgroups"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overloadUntil, CFSTR("RLoverloadedUntil"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastJudgment, CFSTR("RLlastJudgment"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_assetType, CFSTR("RLassetType"));
  if (!self->_assetType)
    objc_msgSend(v4, "encodeObject:forKey:", self->_config, CFSTR("RLconfig"));

}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_assetType, a3);
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (NSDate)lastJudgment
{
  return self->_lastJudgment;
}

- (void)setLastJudgment:(id)a3
{
  objc_storeStrong((id *)&self->_lastJudgment, a3);
}

- (NSDate)overloadUntil
{
  return self->_overloadUntil;
}

- (void)setOverloadUntil:(id)a3
{
  objc_storeStrong((id *)&self->_overloadUntil, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overloadUntil, 0);
  objc_storeStrong((id *)&self->_lastJudgment, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
