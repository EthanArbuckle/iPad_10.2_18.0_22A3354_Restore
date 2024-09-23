@implementation SMDeepLinkURLFactory

+ (id)createURLForRecipientHandle:(id)a3 compose:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDD1808];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setScheme:", CFSTR("sms-private"));
  objc_msgSend(v8, "setPath:", CFSTR("open"));
  objc_msgSend(a1, "_generateCommonQueryItemsWithCompose:groupID:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("recipient"), v7);

  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setQueryItems:", v12);
  objc_msgSend(v8, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)createURLToDetailViewForRecipientHandle:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    objc_msgSend(a1, "createURLForRecipientHandle:compose:", a3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

+ (id)createURLForGroupID:(id)a3 recipientHandles:(id)a4 compose:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v7 = (objc_class *)MEMORY[0x24BDD1808];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setScheme:", CFSTR("sms-private"));
  objc_msgSend(v9, "setPath:", CFSTR("open"));
  objc_msgSend(a1, "_generateCommonQueryItemsWithCompose:groupID:", v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("groupid"), v8);

  objc_msgSend(v11, "addObject:", v12);
  objc_msgSend(v9, "setQueryItems:", v11);
  objc_msgSend(v9, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)createURLToDetailViewForGroupID:(id)a3 recipientHandles:(id)a4
{
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  if (a3)
  {
    objc_msgSend(a1, "createURLForGroupID:recipientHandles:compose:", a3, a4, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", v7, 2u);
    }

    v4 = 0;
  }
  return v4;
}

+ (id)_generateCommonQueryItemsWithCompose:(BOOL)a3 groupID:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
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
  id v20;
  _QWORD v21[4];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  const __CFString *v26;
  _QWORD v27[2];

  v4 = a3;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCED8];
  v26 = CFSTR("payloadType");
  if (v4)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v10, "setObject:forKey:", v5, CFSTR("groupID"));
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 8, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  if (v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[SMDeepLinkURLFactory _generateCommonQueryItemsWithCompose:groupID:]";
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_245521000, v13, OS_LOG_TYPE_DEFAULT, "%s, createURLForDetailView, failed to create json payload with error: %@", buf, 0x16u);
    }
    v14 = 0;
  }
  else
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("service"), CFSTR("iMessage"));
    v21[0] = v15;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("appBundleID"), CFSTR("com.apple.SafetyMonitorApp.SafetyMonitorMessages"));
    v21[1] = v16;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("launchApp"), CFSTR("yes"));
    v21[2] = v17;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("appPayload"), v13);
    v21[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

+ (id)createURLToConversationForRecipientHandle:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[16];

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("sms://open?recipient="), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle", buf, 2u);
    }

    v4 = 0;
  }
  return v4;
}

+ (id)createURLToConversationForGroupID:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[16];

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("sms://open?groupid="), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", buf, 2u);
    }

    v4 = 0;
  }
  return v4;
}

+ (int64_t)resolvePayloadTypeFromURL:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  NSObject *v24;
  objc_class *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int64_t v37;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  const char *aSelector;
  int64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  NSObject *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v37 = 0;
    goto LABEL_45;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = v34;
      v56 = 2112;
      v57 = (uint64_t)v35;
      _os_log_error_impl(&dword_245521000, v8, OS_LOG_TYPE_ERROR, "%@,%@,missing url components", buf, 0x16u);

    }
    goto LABEL_41;
  }
  -[NSObject queryItems](v5, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = v40;
      v56 = 2112;
      v57 = (uint64_t)v41;
      _os_log_error_impl(&dword_245521000, v36, OS_LOG_TYPE_ERROR, "%@,%@,missing queryItems", buf, 0x16u);

    }
    v8 = 0;
LABEL_41:
    v37 = 0;
    goto LABEL_44;
  }
  v45 = v6;
  v46 = v4;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v7;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (!v9)
  {
    v48 = 0;
    goto LABEL_43;
  }
  v10 = v9;
  aSelector = a2;
  v48 = 0;
  v11 = *(_QWORD *)v51;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v51 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      objc_msgSend(v13, "value", v42);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v55 = v30;
          v56 = 2112;
          v57 = (uint64_t)v31;
          _os_log_error_impl(&dword_245521000, v24, OS_LOG_TYPE_ERROR, "%@,%@,queryItem missing value", buf, 0x16u);

        }
LABEL_29:

        continue;
      }
      objc_msgSend(v13, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("appPayload"));

      if (!v16)
        goto LABEL_29;
      -[NSObject dataUsingEncoding:](v14, "dataUsingEncoding:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v17, 0, &v49);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v49;
      if (v19 || !v18)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v26 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v55 = v43;
          v56 = 2112;
          v57 = v26;
          v27 = (void *)v26;
          v58 = 2112;
          v59 = v14;
          _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "%@,%@, failure to decode json object %@", buf, 0x20u);

        }
        goto LABEL_25;
      }
      objc_msgSend(v18, "objectForKey:", CFSTR("payloadType"));
      v20 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v55 = v44;
          v56 = 2112;
          v57 = (uint64_t)v42;
          v58 = 2112;
          v59 = v20;
          _os_log_error_impl(&dword_245521000, v28, OS_LOG_TYPE_ERROR, "%@,%@, failure to decode type %@", buf, 0x20u);

        }
LABEL_25:
        v22 = 7;
        goto LABEL_26;
      }
      v21 = -[NSObject unsignedIntegerValue](v20, "unsignedIntegerValue");
      v22 = v21 > 4;
      v23 = v48;
      if (v21 <= 4)
        v23 = v21;
      v48 = v23;
LABEL_26:

      if (!v22)
        goto LABEL_29;

      if (v22 != 7)
      {

        v37 = 0;
        v6 = v45;
        v4 = v46;
        goto LABEL_44;
      }
    }
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  }
  while (v10);
LABEL_43:

  v6 = v45;
  v4 = v46;
  v37 = v48;
LABEL_44:

LABEL_45:
  return v37;
}

@end
