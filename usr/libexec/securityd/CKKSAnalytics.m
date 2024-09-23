@implementation CKKSAnalytics

- (void)logSuccessForEvent:(id)a3 zoneName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v6, v7));
  -[CKKSAnalytics logSuccessForEventNamed:](self, "logSuccessForEventNamed:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("last_success_%@-%@"), v6, v7));

  -[CKKSAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v10, v9);
}

- (BOOL)isCKPartialError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", CKErrorDomain))
    v5 = objc_msgSend(v3, "code") == (id)2;
  else
    v5 = 0;

  return v5;
}

- (void)addCKPartialError:(id)a3 error:(id)a4 depth:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  CKKSAnalytics *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v8 = a3;
  v9 = a4;
  v28 = self;
  if (!-[CKKSAnalytics isCKPartialError:](self, "isCKPartialError:", v9))
    goto LABEL_20;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v12 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
    goto LABEL_19;
  v26 = v9;
  v27 = v8;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = v11;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v14)
    goto LABEL_18;
  v15 = v14;
  v16 = *(_QWORD *)v30;
  v17 = a5 + 1;
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(_QWORD *)v30 != v16)
        objc_enumerationMutation(v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), v25, v26));
      v20 = objc_opt_class(NSError);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "domain"));
        if (objc_msgSend(v21, "isEqualToString:", CKErrorDomain))
        {
          v22 = objc_msgSend(v19, "code");

          if (v22 == (id)22)
            goto LABEL_14;
        }
        else
        {

        }
        v23 = objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](v28, "errorChain:depth:", v19, v17));
        if (v23)
        {
          v24 = (void *)v23;
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, CFSTR("oneCloudKitPartialFailure"));

          goto LABEL_18;
        }
      }
LABEL_14:

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
      continue;
    break;
  }
LABEL_18:

  v9 = v26;
  v8 = v27;
  v11 = v25;
LABEL_19:

LABEL_20:
}

- (id)errorChain:(id)a3 depth:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v6 = a3;
  if (a4 <= 5 && (v7 = objc_opt_class(NSError), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v17[0] = CFSTR("domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v17[1] = CFSTR("code");
    v18[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
    v18[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
    v11 = objc_msgSend(v10, "mutableCopy");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
    v14 = a4 + 1;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v13, v14));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("child"));

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v11, v6, v14);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)createErrorAttributes:(id)a3 depth:(unint64_t)a4 attributes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setValuesForKeysWithDictionary:", v7);
  v19[0] = &__kCFBooleanTrue;
  v18[0] = CFSTR("recoverableError");
  v18[1] = CFSTR("errorDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v19[1] = v11;
  v18[2] = CFSTR("errorCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "code")));
  v19[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
  objc_msgSend(v10, "setValuesForKeysWithDictionary:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v15, 0));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("errorChain"));

  -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v10, v8, 0);
  return v10;
}

- (void)logRecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[4];
  _QWORD v24[4];

  v10 = a6;
  if (a3)
  {
    v11 = a5;
    v12 = a4;
    v13 = a3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v15 = v14;
    if (v10)
      objc_msgSend(v14, "setValuesForKeysWithDictionary:", v10);
    v23[0] = CFSTR("recoverableError");
    v23[1] = CFSTR("zone");
    v24[0] = &__kCFBooleanTrue;
    v24[1] = v11;
    v23[2] = CFSTR("errorDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    v24[2] = v16;
    v23[3] = CFSTR("errorCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v13, "code")));
    v24[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
    objc_msgSend(v15, "setValuesForKeysWithDictionary:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v20, 0));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("errorChain"));

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v15, v13, 0);
    v22.receiver = self;
    v22.super_class = (Class)CKKSAnalytics;
    -[CKKSAnalytics logSoftFailureForEventNamed:withAttributes:](&v22, "logSoftFailureForEventNamed:withAttributes:", v12, v15);

  }
}

- (void)logRecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v8 = a5;
  if (a3)
  {
    v9 = a4;
    v10 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = v11;
    if (v8)
      objc_msgSend(v11, "setValuesForKeysWithDictionary:", v8);
    v21[0] = &__kCFBooleanTrue;
    v20[0] = CFSTR("recoverableError");
    v20[1] = CFSTR("errorDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    v21[1] = v13;
    v20[2] = CFSTR("errorCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "code")));
    v21[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
    objc_msgSend(v12, "setValuesForKeysWithDictionary:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v17, 0));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("errorChain"));

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v12, v10, 0);
    v19.receiver = self;
    v19.super_class = (Class)CKKSAnalytics;
    -[CKKSAnalytics logSoftFailureForEventNamed:withAttributes:](&v19, "logSoftFailureForEventNamed:withAttributes:", v9, v12);

  }
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[4];

  v10 = a6;
  if (a3)
  {
    v11 = a5;
    v12 = a4;
    v13 = a3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v15 = v14;
    if (v10)
      objc_msgSend(v14, "setValuesForKeysWithDictionary:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v17, 0));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("errorChain"));

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v15, v13, 0);
    v23[0] = CFSTR("recoverableError");
    v23[1] = CFSTR("zone");
    v24[0] = &__kCFBooleanFalse;
    v24[1] = v11;
    v23[2] = CFSTR("errorDomain");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    v24[2] = v19;
    v23[3] = CFSTR("errorCode");
    v20 = objc_msgSend(v13, "code");

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20));
    v24[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));

    objc_msgSend(v15, "setValuesForKeysWithDictionary:", v22);
    -[CKKSAnalytics logHardFailureForEventNamed:withAttributes:](self, "logHardFailureForEventNamed:withAttributes:", v12, v15);

  }
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[4];

  v8 = a5;
  if (a3)
  {
    v9 = a4;
    v10 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = v11;
    if (v8)
      objc_msgSend(v11, "setValuesForKeysWithDictionary:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v14, 0));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("errorChain"));

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v12, v10, 0);
    v20[0] = CFSTR("recoverableError");
    v20[1] = CFSTR("zone");
    v21[0] = &__kCFBooleanFalse;
    v21[1] = CFSTR("OTBottledPeer");
    v20[2] = CFSTR("errorDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    v21[2] = v16;
    v20[3] = CFSTR("errorCode");
    v17 = objc_msgSend(v10, "code");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
    v21[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4));
    objc_msgSend(v12, "setValuesForKeysWithDictionary:", v19);

    -[CKKSAnalytics logHardFailureForEventNamed:withAttributes:](self, "logHardFailureForEventNamed:withAttributes:", v9, v12);
  }

}

- (void)noteEvent:(id)a3 zoneName:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), a4, a3));
  -[CKKSAnalytics noteEventNamed:](self, "noteEventNamed:", v5);

}

- (id)dateOfLastSuccessForEvent:(id)a3 zoneName:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("last_success_%@-%@"), a4, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics datePropertyForKey:](self, "datePropertyForKey:", v5));

  return v6;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4 zoneName:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), a4, a5));
  -[CKKSAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v8, v9);

}

- (id)datePropertyForKey:(id)a3 zoneName:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics datePropertyForKey:](self, "datePropertyForKey:", v5));

  return v6;
}

- (void)noteMetric:(id)a3 count:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%lld"), v6, a4));
  -[CKKSAnalytics logResultForEvent:hardFailure:result:](self, "logResultForEvent:hardFailure:result:", v9, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[CKKSAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v7, v9);

  v8 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLong:", a4);
  -[CKKSAnalytics setNumberProperty:forKey:](self, "setNumberProperty:forKey:", v8, v6);

}

- (void)recordRecoveredTLKMetrics:(id)a3 tlkRecoveryResults:(id)a4 uniqueTLKsRecoveredEvent:(id)a5 totalSharesRecoveredEvent:(id)a6 totalRecoverableTLKSharesEvent:(id)a7 totalRecoverableTLKsEvent:(id)a8 totalViewsWithSharesEvent:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v36 = a9;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "successfulKeysRecovered"));
  v38 = v16;
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v16, objc_msgSend(v19, "count"));

  v39 = v15;
  v37 = v17;
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v17, objc_msgSend(v15, "totalTLKSharesRecovered"));
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v18, objc_msgSend(v14, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = v14;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "tlkUUID"));
        objc_msgSend(v20, "addObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v23);
  }

  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v18, objc_msgSend(v20, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v28 = v21;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneID"));
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, v35);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v30);
  }

  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v36, objc_msgSend(v27, "count"));
}

+ (id)databasePath
{
  if (qword_100341360 != -1)
    dispatch_once(&qword_100341360, &stru_1002E8C78);
  return +[CKKSAnalytics defaultAnalyticsDatabasePath:](CKKSAnalytics, "defaultAnalyticsDatabasePath:", CFSTR("ckks_analytics"));
}

+ (id)logger
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKKSAnalytics;
  v2 = objc_msgSendSuper2(&v4, "logger");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

@end
