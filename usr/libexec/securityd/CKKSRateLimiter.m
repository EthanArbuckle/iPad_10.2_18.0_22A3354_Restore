@implementation CKKSRateLimiter

- (CKKSRateLimiter)init
{
  return -[CKKSRateLimiter initWithCoder:](self, "initWithCoder:", 0);
}

- (CKKSRateLimiter)initWithCoder:(id)a3
{
  id v4;
  CKKSRateLimiter *v5;
  _UNKNOWN **v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  NSMutableDictionary *v23;
  NSMutableDictionary *buckets;
  NSMutableDictionary *v25;
  NSDate *overloadUntil;
  uint64_t v27;
  NSDictionary *config;
  CKKSRateLimiter *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CKKSRateLimiter;
  v5 = -[CKKSRateLimiter init](&v35, "init");
  if (v5)
  {
    v6 = &AAAccountClassPrimary_ptr;
    if (v4)
    {
      v7 = objc_opt_class(NSDictionary);
      v8 = objc_opt_class(NSString);
      v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(NSDate), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("buckets")));

      v12 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
      {
LABEL_18:

        v29 = 0;
        goto LABEL_19;
      }
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = v11;
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v32;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v17);
            v19 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0
              || (v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v18)),
                  v21 = objc_opt_class(NSDate),
                  isKindOfClass = objc_opt_isKindOfClass(v20, v21),
                  v20,
                  (isKindOfClass & 1) == 0))
            {

              goto LABEL_18;
            }
            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          v6 = &AAAccountClassPrimary_ptr;
          if (v15)
            continue;
          break;
        }
      }

      v23 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v13, "mutableCopy");
      buckets = v5->_buckets;
      v5->_buckets = v23;

    }
    else
    {
      v25 = objc_opt_new(NSMutableDictionary);
      v13 = v5->_buckets;
      v5->_buckets = v25;
    }

    overloadUntil = v5->_overloadUntil;
    v5->_overloadUntil = 0;

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6[294], "dictionaryWithObjectsAndKeys:", &off_10030A1A8, CFSTR("rateAll"), &off_10030A1C0, CFSTR("rateGroup"), &off_10030A1D8, CFSTR("rateUUID"), &off_10030A1F0, CFSTR("capacityAll"), &off_10030A208, CFSTR("capacityGroup"), &off_10030A220, CFSTR("capacityUUID"), &off_10030A238, CFSTR("trimSize"), &off_10030A250, CFSTR("trimTime"),
              &off_10030A268,
              CFSTR("overloadDuration"),
              0));
    config = v5->_config;
    v5->_config = (NSDictionary *)v27;

  }
  v29 = v5;
LABEL_19:

  return v29;
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
  unsigned __int8 v14;
  void *v16;

  v4 = a3;
  v5 = objc_opt_class(CKKSRateLimiter);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "config"));
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v14 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buckets"));
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v14 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
    if (v11 || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overloadUntil"))) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overloadUntil"));
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v16 = 0;
      v14 = 1;
    }

    goto LABEL_13;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (int)rate:(int)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  unsigned int v7;

  switch(a3)
  {
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      v4 = v3;
      v5 = CFSTR("rateUUID");
      goto LABEL_7;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      v4 = v3;
      v5 = CFSTR("rateGroup");
      goto LABEL_7;
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      v4 = v3;
      v5 = CFSTR("rateAll");
LABEL_7:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
      v7 = objc_msgSend(v6, "intValue");

      LODWORD(self) = v7;
      break;
  }
  return (int)self;
}

- (int)capacity:(int)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  unsigned int v7;

  switch(a3)
  {
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      v4 = v3;
      v5 = CFSTR("capacityUUID");
      goto LABEL_7;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      v4 = v3;
      v5 = CFSTR("capacityGroup");
      goto LABEL_7;
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      v4 = v3;
      v5 = CFSTR("capacityAll");
LABEL_7:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
      v7 = objc_msgSend(v6, "intValue");

      LODWORD(self) = v7;
      break;
  }
  return (int)self;
}

- (id)consumeTokenFromBucket:(id)a3 type:(int)a4 at:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-(-[CKKSRateLimiter capacity:](self, "capacity:", v6)* -[CKKSRateLimiter rate:](self, "rate:", v6))));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));

  if (!v12 || (objc_msgSend(v12, "timeIntervalSinceDate:", v10), v13 < 0.0))
  {
    v14 = v10;

    v12 = v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", (double)-[CKKSRateLimiter rate:](self, "rate:", v6)));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v8);

  objc_msgSend(v15, "timeIntervalSinceDate:", v9);
  if (v17 <= 0.0)
    v18 = 0;
  else
    v18 = objc_msgSend(v15, "copy");

  return v18;
}

- (int)judge:(id)a3 at:(id)a4 limitTime:(id *)a5
{
  void *v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t v24;
  BOOL v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v41;
  id *v42;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v12);
    v14 = v13;

    if (v14 >= 0.0)
      -[CKKSRateLimiter trim:](self, "trim:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
      *a5 = objc_msgSend(v16, "copy");
LABEL_17:
      v27 = 5;
      goto LABEL_31;
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("All")));

  v42 = a5;
  if (!v16)
  {
    v41 = v9;
    goto LABEL_11;
  }
  objc_msgSend(v10, "timeIntervalSinceDate:", v16);
  v19 = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("trimTime")));
  if (v19 <= (double)(int)objc_msgSend(v5, "intValue"))
  {
    v41 = v9;
LABEL_11:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    v21 = objc_msgSend(v20, "count");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("trimSize")));
    v24 = objc_msgSend(v23, "unsignedIntValue");

    if (v16)
    {

    }
    v25 = (unint64_t)v21 >= v24;
    v9 = v41;
    if (!v25)
      goto LABEL_18;
    goto LABEL_15;
  }

LABEL_15:
  -[CKKSRateLimiter trim:](self, "trim:", v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));

  if (v26)
  {
    *v42 = (id)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
    goto LABEL_17;
  }
LABEL_18:
  v28 = (id)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter consumeTokenFromBucket:type:at:](self, "consumeTokenFromBucket:type:at:", CFSTR("All"), 0, v10));
  v27 = v28 != 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessgroup"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("G:%@"), v29));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter consumeTokenFromBucket:type:at:](self, "consumeTokenFromBucket:type:at:", v30, 1, v10));

  if (v31)
  {
    if (v28)
    {
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "laterDate:", v31));

      v28 = (id)v32;
    }
    else
    {
      v28 = v31;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", (double)(2 * -[CKKSRateLimiter rate:](self, "rate:", 1))));
    objc_msgSend(v31, "timeIntervalSinceDate:", v33);
    if (v34 >= 0.0)
      v27 = 3;
    else
      v27 = 2;

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("U:%@"), v35));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter consumeTokenFromBucket:type:at:](self, "consumeTokenFromBucket:type:at:", v36, 2, v10));

  if (v37)
  {
    if (v28)
    {
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "laterDate:", v37));

      v27 = 4;
      v28 = (id)v38;
    }
    else
    {
      v28 = v37;
      v27 = 4;
    }
  }
  v39 = objc_retainAutorelease(v28);
  *v42 = v39;

LABEL_31:
  return v27;
}

- (unint64_t)stateSize
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)reset
{
  NSMutableDictionary *v3;

  v3 = objc_opt_new(NSMutableDictionary);
  -[CKKSRateLimiter setBuckets:](self, "setBuckets:", v3);

  -[CKKSRateLimiter setOverloadUntil:](self, "setOverloadUntil:", 0);
}

- (void)trim:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  BOOL (*v23)(uint64_t);
  void *v24;
  id v25;
  unsigned int v26;
  uint8_t buf[4];
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trimTime")));
  v7 = objc_msgSend(v6, "intValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10004CEB0;
  v24 = &unk_1002DC648;
  v25 = v4;
  v26 = v7;
  v9 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keysOfEntriesPassingTest:", &v21));

  if (objc_msgSend(v10, "count", v21, v22, v23, v24))
  {
    -[CKKSRateLimiter setOverloadUntil:](self, "setOverloadUntil:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    objc_msgSend(v11, "removeObjectsForKeys:", v12);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("All")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("overloadDuration")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingTimeInterval:", (double)objc_msgSend(v16, "unsignedIntValue")));
    -[CKKSRateLimiter setOverloadUntil:](self, "setOverloadUntil:", v17);

    v18 = sub_10000EF14("SecCritical");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "RateLimiter overloaded until %@", buf, 0xCu);

    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("buckets"));

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("RateLimiter config: %@\n"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    objc_msgSend(v5, "appendFormat:", CFSTR("Overloaded until %@, %lu total buckets\n"), v7, objc_msgSend(v8, "count"));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    objc_msgSend(v5, "appendFormat:", CFSTR("Not overloaded, %lu total buckets\n"), objc_msgSend(v7, "count"));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter topOffendingAccessGroups:](self, "topOffendingAccessGroups:", 10));
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "count");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", (char *)objc_msgSend(v10, "count") - 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));
    objc_msgSend(v5, "appendFormat:", CFSTR("%lu congested buckets. Top offenders: \n%@ range %@ to %@\n"), v11, v10, v14, v17);

  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("No buckets congested"));
  }

  return v5;
}

- (id)topOffendingAccessGroups:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004CE48;
  v21[3] = &unk_1002DBE70;
  v7 = v5;
  v22 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keysOfEntriesPassingTest:", v21));

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectsForKeys:notFoundMarker:", v10, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v12, v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keysSortedByValueUsingSelector:", "compare:"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "reverseObjectEnumerator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));

    if ((unint64_t)objc_msgSend(v17, "count") <= a3)
      v18 = v17;
    else
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subarrayWithRange:", 0, a3));
    v19 = v18;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)buckets
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBuckets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)overloadUntil
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOverloadUntil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overloadUntil, 0);
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
