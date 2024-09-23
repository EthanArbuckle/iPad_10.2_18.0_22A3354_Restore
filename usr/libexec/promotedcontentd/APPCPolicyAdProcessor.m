@implementation APPCPolicyAdProcessor

- (APPCPolicyAdProcessor)init
{
  APPCPolicyAdProcessor *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *adPolicies;
  APPCPolicySettings *v10;
  APPCPolicySettings *policySettings;
  objc_super v13;
  uint8_t buf[4];
  void *v15;

  v13.receiver = self;
  v13.super_class = (Class)APPCPolicyAdProcessor;
  v2 = -[APPCPolicyAdProcessor init](&v13, "init");
  if (v2)
  {
    v3 = APLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_opt_class(v2, v5);
      *(_DWORD *)buf = 138477827;
      v15 = v6;
      v7 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{private}@] Initializing Policy Settings for APPCPolicyAdProcessor", buf, 0xCu);

    }
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    adPolicies = v2->_adPolicies;
    v2->_adPolicies = v8;

    v10 = objc_alloc_init(APPCPolicySettings);
    policySettings = v2->_policySettings;
    v2->_policySettings = v10;

  }
  return v2;
}

- (BOOL)isValidPolicy:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (!v5)
    goto LABEL_21;
  v7 = v5;
  v8 = *(_QWORD *)v24;
  *(_QWORD *)&v6 = 138478083;
  v22 = v6;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9);
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("timer"), v22) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("spacing")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("adsAllowed")) & 1) != 0
        || objc_msgSend(v10, "isEqualToString:", CFSTR("timerOrSpacing")))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v10));
        v12 = NSArray;
      }
      else
      {
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("adSessionBefore")) & 1) == 0
          && !objc_msgSend(v10, "isEqualToString:", CFSTR("adSessionAfter")))
        {
          v15 = APLogForCategory(1);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = (void *)objc_opt_class(self);
            *(_DWORD *)buf = v22;
            v28 = v17;
            v29 = 2114;
            v30 = v10;
            v18 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{private}@] FILE A RADAR. There was an unknown key in policies: %{public}@", buf, 0x16u);

          }
          goto LABEL_12;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v10));
        v12 = NSDictionary;
      }
      v13 = objc_opt_class(v12);
      isKindOfClass = objc_opt_isKindOfClass(v11, v13);

      if ((isKindOfClass & 1) == 0)
      {
        v20 = 0;
        goto LABEL_23;
      }
LABEL_12:
      v9 = (char *)v9 + 1;
    }
    while (v7 != v9);
    v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    v7 = v19;
  }
  while (v19);
LABEL_21:
  v20 = 1;
LABEL_23:

  return v20;
}

- (void)processAdPolicyData
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092D48;
  block[3] = &unk_100212FE0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)generatePolicyDataObjects:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  APPCPolicyData *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a3;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v21)
  {
    v19 = *(_QWORD *)v30;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v3);
        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("value")));
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("isXLFormat")));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("policyType")));
        v8 = (int)objc_msgSend(v7, "intValue");

        v22 = (void *)v6;
        v23 = (void *)v5;
        v9 = -[APPCPolicyData initWithPolicyType:policyValue:isXLFormat:]([APPCPolicyData alloc], "initWithPolicyType:policyValue:isXLFormat:", v8, v5, v6);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = v4;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("value")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("policyType")) & 1) == 0)
              {
                if (objc_msgSend(v15, "isEqualToString:", CFSTR("containerType")))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                  -[APPCPolicyData setContainerType:](v9, "setContainerType:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("adType")))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                  -[APPCPolicyData setAdType:](v9, "setAdType:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("placementDescriptor")))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                  -[APPCPolicyData setPlacementDescriptor:](v9, "setPlacementDescriptor:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("adFormatType")))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                  -[APPCPolicyData setAdFormatType:](v9, "setAdFormatType:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("userStatus")))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                  -[APPCPolicyData setUserStatus:](v9, "setUserStatus:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("expression")))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                  -[APPCPolicyData setExpression:](v9, "setExpression:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("targetingExpression")))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                  -[APPCPolicyData setTargetingExpression:](v9, "setTargetingExpression:", v16);
                }
                else
                {
                  if (!objc_msgSend(v15, "isEqualToString:", CFSTR("dataAdapters")))
                    continue;
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                  -[APPCPolicyData setDataAdapters:](v9, "setDataAdapters:", v16);
                }

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v12);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyAdProcessor adPolicies](self, "adPolicies"));
        objc_msgSend(v17, "addObject:", v9);

        v3 = v24 + 1;
      }
      while ((id)(v24 + 1) != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v21);
  }

}

- (id)flattenPolicy:(id)a3 policyType:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  id v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v37;
  int64_t v38;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[5];
  _BYTE v61[128];

  v5 = a3;
  v40 = objc_alloc_init((Class)NSMutableArray);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v5;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v41)
  {
    v37 = *(_QWORD *)v55;
    v38 = a4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v55 != v37)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v6);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("value")));
        if (!v8)
          v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
        v44 = (void *)v8;
        v45 = v6;
        if (a4 == 7)
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("expression")));
        else
          v43 = 0;
        v60[0] = CFSTR("containerType");
        v60[1] = CFSTR("adType");
        v60[2] = CFSTR("placementDescriptor");
        v60[3] = CFSTR("adFormatType");
        v60[4] = CFSTR("userStatus");
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 5));
        v10 = objc_alloc_init((Class)NSMutableDictionary);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v11 = v7;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v51;
          v15 = 1;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v51 != v14)
                objc_enumerationMutation(v11);
              v17 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v9, "containsObject:", v17))
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v17));
                v19 = objc_msgSend(v18, "count");
                if (v18)
                  v20 = v19 == 0;
                else
                  v20 = 1;
                if (!v20)
                {
                  v15 *= (_QWORD)v19;
                  objc_msgSend(v10, "setObject:forKey:", v18, v17);
                }

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          }
          while (v13);
        }
        else
        {
          v15 = 1;
        }
        v42 = v9;

        v21 = objc_alloc_init((Class)NSMutableDictionary);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v22 = v10;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(_QWORD *)v47 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
              v28 = objc_alloc_init((Class)NSMutableArray);
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v27));
              v30 = (unint64_t)objc_msgSend(v29, "count");
              v31 = v15;
              if (v30)
                v31 = v15 / v30;
              for (; v31; --v31)
                objc_msgSend(v28, "addObjectsFromArray:", v29);
              v32 = objc_msgSend(v28, "copy");
              objc_msgSend(v21, "setObject:forKey:", v32, v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          }
          while (v24);
        }

        a4 = v38;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyAdProcessor buildFinalPolicies:policyValue:policyType:expression:](self, "buildFinalPolicies:policyValue:policyType:expression:", v21, v44, v38, v43));
        objc_msgSend(v40, "addObjectsFromArray:", v33);

        v6 = v45 + 1;
      }
      while ((id)(v45 + 1) != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v41);
  }

  v34 = objc_msgSend(v40, "copy");
  return v34;
}

- (id)cartesianProduct:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *j;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  void *m;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  unint64_t k;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i)));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
        objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v7);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    v16 = 1;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v16 *= (_QWORD)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), "count");
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v14);
  }
  else
  {
    v16 = 1;
  }
  v28 = v5;

  v29 = objc_alloc_init((Class)NSMutableArray);
  if (v16)
  {
    for (k = 0; k != v16; ++k)
    {
      v18 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v29, "addObject:", v18);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v19 = v12;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v32;
        v23 = k;
        do
        {
          for (m = 0; m != v21; m = (char *)m + 1)
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)m);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndex:", v23 % (unint64_t)objc_msgSend(v25, "count")));
            objc_msgSend(v18, "addObject:", v26);

            if (objc_msgSend(v25, "count"))
              v23 /= (unint64_t)objc_msgSend(v25, "count");
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        }
        while (v21);
      }

    }
  }

  return v29;
}

- (id)buildFinalPolicies:(id)a3 policyValue:(id)a4 policyType:(int64_t)a5 expression:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  id obj;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v10 = a3;
  v35 = a4;
  v33 = a6;
  v36 = objc_alloc_init((Class)NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "addObject:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v18));
        objc_msgSend(v12, "addObject:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v15);
  }
  v32 = v13;

  v31 = v12;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[APPCPolicyAdProcessor cartesianProduct:](self, "cartesianProduct:", v12));
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v25 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v25, "setObject:forKey:", v35, CFSTR("value"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
        objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("policyType"));

        if (a5 == 7)
          objc_msgSend(v25, "setObject:forKey:", v33, CFSTR("expression"));
        if (objc_msgSend(v24, "count"))
        {
          v27 = 0;
          do
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v27));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v27));
            objc_msgSend(v25, "setObject:forKey:", v28, v29);

            ++v27;
          }
          while (v27 < (unint64_t)objc_msgSend(v24, "count"));
        }
        objc_msgSend(v36, "addObject:", v25);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v21);
  }

  return v36;
}

- (id)aliasTransformedPolicies:(id)a3 alias:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  APPCPolicyAdProcessor *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id obj;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
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
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];

  v54 = self;
  v5 = a3;
  v6 = a4;
  v60 = v5;
  v7 = objc_msgSend(v5, "mutableCopy");
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v8 = v6;
  v57 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
  obj = v8;
  if (!v57)
  {

    goto LABEL_58;
  }
  v9 = 0;
  v56 = *(_QWORD *)v95;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v95 != v56)
      {
        v11 = v10;
        objc_enumerationMutation(obj);
        v10 = v11;
      }
      v59 = v10;
      v12 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", v12, v54));
      if (v13)
      {
        v14 = v13;
        if (objc_msgSend(v13, "count"))
        {
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v55 = v14;
          v63 = v14;
          v62 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
          if (!v62)
            goto LABEL_51;
          v61 = *(_QWORD *)v91;
          while (1)
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v91 != v61)
              {
                v16 = v15;
                objc_enumerationMutation(v63);
                v15 = v16;
              }
              v64 = v15;
              v17 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKey:", v17));
              v19 = v18;
              if (v18 && objc_msgSend(v18, "count"))
              {
                v88 = 0u;
                v89 = 0u;
                v86 = 0u;
                v87 = 0u;
                v67 = v60;
                v66 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
                if (!v66)
                  goto LABEL_48;
                v65 = *(_QWORD *)v87;
                v74 = v19;
                v75 = v17;
                while (1)
                {
                  v20 = 0;
                  do
                  {
                    if (*(_QWORD *)v87 != v65)
                    {
                      v21 = v20;
                      objc_enumerationMutation(v67);
                      v20 = v21;
                    }
                    v68 = v20;
                    v22 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v20);
                    v81 = v22;
                    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("timer")) & 1) != 0
                      || (objc_msgSend(v22, "isEqualToString:", CFSTR("spacing")) & 1) != 0
                      || (objc_msgSend(v22, "isEqualToString:", CFSTR("timerOrSpacing")) & 1) != 0
                      || objc_msgSend(v22, "isEqualToString:", CFSTR("adsAllowed")))
                    {
                      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKey:", v22));
                      if (objc_msgSend(v23, "count"))
                      {
                        v24 = 0;
                        v71 = v23;
                        do
                        {
                          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v24));
                          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v12));

                          if (objc_msgSend(v26, "containsObject:", v17))
                          {
                            v79 = objc_msgSend(v26, "mutableCopy");
                            objc_msgSend(v79, "addObjectsFromArray:", v19);
                            objc_msgSend(v79, "removeObject:", v17);
                            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v79));
                            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "array"));

                            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v81));
                            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndex:", v24));
                            v31 = objc_msgSend(v30, "mutableCopy");

                            objc_msgSend(v31, "setObject:forKey:", v28, v12);
                            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v81));
                            v33 = objc_msgSend(v32, "mutableCopy");

                            v17 = v75;
                            objc_msgSend(v33, "replaceObjectAtIndex:withObject:", v24, v31);
                            objc_msgSend(v7, "setObject:forKey:", v33, v81);

                            v23 = v71;
                            v9 = 1;
                          }

                          ++v24;
                        }
                        while (v24 < (unint64_t)objc_msgSend(v23, "count"));
                      }
LABEL_29:

                      goto LABEL_30;
                    }
                    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("adSessionBefore")) & 1) != 0
                      || objc_msgSend(v22, "isEqualToString:", CFSTR("adSessionAfter")))
                    {
                      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKey:", v22));
                      v82 = 0u;
                      v83 = 0u;
                      v84 = 0u;
                      v85 = 0u;
                      v70 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
                      if (v70)
                      {
                        v69 = *(_QWORD *)v83;
                        v72 = v23;
                        do
                        {
                          v34 = 0;
                          do
                          {
                            if (*(_QWORD *)v83 != v69)
                              objc_enumerationMutation(v23);
                            v73 = v34;
                            v77 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v34);
                            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:"));
                            if (objc_msgSend(v35, "count"))
                            {
                              v36 = 0;
                              v76 = v35;
                              do
                              {
                                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v36));
                                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", v12));

                                if (objc_msgSend(v38, "containsObject:", v17))
                                {
                                  v39 = objc_msgSend(v38, "mutableCopy");
                                  objc_msgSend(v39, "addObjectsFromArray:", v19);
                                  objc_msgSend(v39, "removeObject:", v17);
                                  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v39));
                                  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "array"));

                                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v22));
                                  v80 = objc_msgSend(v41, "mutableCopy");

                                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKey:", v77));
                                  v43 = v7;
                                  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndex:", v36));
                                  v45 = objc_msgSend(v44, "mutableCopy");

                                  objc_msgSend(v45, "setObject:forKey:", v78, v12);
                                  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v45));
                                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", v81));
                                  v48 = v12;
                                  v49 = objc_msgSend(v47, "mutableCopy");

                                  v7 = v43;
                                  v22 = v81;
                                  objc_msgSend(v49, "setObject:forKey:", v46, v77);
                                  objc_msgSend(v7, "setObject:forKey:", v49, v81);

                                  v12 = v48;
                                  v19 = v74;

                                  v17 = v75;
                                  v35 = v76;
                                  v9 = 1;
                                }

                                ++v36;
                              }
                              while (v36 < (unint64_t)objc_msgSend(v35, "count"));
                            }

                            v23 = v72;
                            v34 = v73 + 1;
                          }
                          while ((id)(v73 + 1) != v70);
                          v70 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
                        }
                        while (v70);
                      }
                      goto LABEL_29;
                    }
LABEL_30:
                    v20 = v68 + 1;
                  }
                  while ((id)(v68 + 1) != v66);
                  v50 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
                  v66 = v50;
                  if (!v50)
                  {
LABEL_48:

                    break;
                  }
                }
              }

              v15 = v64 + 1;
            }
            while ((id)(v64 + 1) != v62);
            v62 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
            if (!v62)
            {
LABEL_51:

              v13 = v55;
              goto LABEL_53;
            }
          }
        }
        v13 = v14;
      }
LABEL_53:

      v10 = v59 + 1;
    }
    while ((id)(v59 + 1) != v57);
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
  }
  while (v57);

  if ((v9 & 1) == 0)
  {
LABEL_58:
    v52 = v7;
    v51 = obj;
    goto LABEL_59;
  }
  v51 = obj;
  v52 = (id)objc_claimAutoreleasedReturnValue(-[APPCPolicyAdProcessor aliasTransformedPolicies:alias:](v54, "aliasTransformedPolicies:alias:", v7, obj));
LABEL_59:

  return v52;
}

- (APPCPolicySettings)policySettings
{
  return self->_policySettings;
}

- (NSMutableArray)adPolicies
{
  return self->_adPolicies;
}

- (void)setAdPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_adPolicies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adPolicies, 0);
  objc_storeStrong((id *)&self->_policySettings, 0);
}

@end
