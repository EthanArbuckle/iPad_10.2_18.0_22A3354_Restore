@implementation APPCPolicyEngine

+ (BOOL)isSubscriber
{
  PCBooleanCondition *v2;
  BOOL v3;
  uint64_t v5;

  v2 = -[PCBooleanCondition initWithType:value:identifier:]([PCBooleanCondition alloc], "initWithType:value:identifier:", CFSTR("sc"), CFSTR("751A1F1B-43AB-40F2-BB35-C6731882A9F7"), CFSTR("com.apple.news"));
  v5 = 0;
  v3 = +[PCStatusConditionStorage isStatusConditionRegistered:error:](PCStatusConditionStorage, "isStatusConditionRegistered:error:", v2, &v5);

  return v3;
}

+ (id)policiesToEnforce
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APPCPolicyEngine savedPolicies](APPCPolicyEngine, "savedPolicies"));
  v4 = objc_msgSend(a1, "isSubscriber");
  v5 = CFSTR("non-subscriber");
  if (v4)
    v5 = CFSTR("subscriber");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("userStatus = %@ OR userStatus = nil"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), "dictionaryRepresentation"));
        objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)savedPolicies
{
  if (qword_100268810 != -1)
    dispatch_once(&qword_100268810, &stru_100213288);
  return (id)qword_100268808;
}

+ (id)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[APPCPolicyEngine savedPolicies](APPCPolicyEngine, "savedPolicies"));
  v12 = APLogForCategory(1);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v43 = (id)objc_opt_class(a1);
    v44 = 2114;
    v45 = v11;
    v14 = v43;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{private}@] Policies: %{public}@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v11, "count"))
  {
    v36 = v8;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("containerType = %@ OR containerType = nil"), v8));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:"));
    v35 = v9;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("adType = %@ OR adType = nil"), v9));
    v32 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:"));
    v34 = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("adFormatType = %@ OR adFormatType = nil"), v10));
    v30 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filteredArrayUsingPredicate:", v18));
    v20 = objc_msgSend(a1, "isSubscriber");
    v21 = CFSTR("non-subscriber");
    if (v20)
      v21 = CFSTR("subscriber");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("userStatus = %@ OR userStatus = nil"), v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filteredArrayUsingPredicate:", v22));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v27), "dictionaryRepresentation"));
          objc_msgSend(v15, "addObject:", v28);

          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v25);
    }

    v9 = v35;
    v8 = v36;
    v10 = v34;
  }

  return v15;
}

@end
