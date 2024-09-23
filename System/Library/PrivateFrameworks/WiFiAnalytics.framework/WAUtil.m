@implementation WAUtil

+ (void)initialize
{
  id v2;

  _isInternalInstall = MGGetBoolAnswer();
  v2 = (id)MGGetStringAnswer();
  objc_msgSend(v2, "isEqualToString:", CFSTR("Beta"));

}

+ (BOOL)isInternalInstall
{
  return _isInternalInstall;
}

+ (id)deviceName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD15C8], "currentHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isKeyBagUnlocked
{
  NSObject *v2;
  unsigned int v3;
  unsigned int v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  const char *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x24BE67160])
  {
    v16 = CFSTR("ExtendedDeviceLockState");
    v17[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = MKBGetDeviceLockState();
    v4 = (v3 < 8) & (0x89u >> v3);
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136446978;
      v9 = "+[WAUtil isKeyBagUnlocked]";
      v11 = 76;
      v10 = 1024;
      if (v4)
        v6 = "YES";
      v12 = 1024;
      v13 = v3;
      v14 = 2080;
      v15 = v6;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:KeyBag ret:%d Unlocked: %s", (uint8_t *)&v8, 0x22u);
    }

  }
  else
  {
    WALogCategoryDefaultHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446466;
      v9 = "+[WAUtil isKeyBagUnlocked]";
      v10 = 1024;
      v11 = 78;
      _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MKBGetDeviceLockState not available. Assume unlocked.", (uint8_t *)&v8, 0x12u);
    }
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (BOOL)storeToken:(id)a3 withIdentifier:(id)a4
{
  id v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  BOOL v8;
  void *v9;
  OSStatus v10;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  OSStatus v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  OSStatus v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[WAUtil _getBaseTokenStorageKeychainQueryWithIdentifer:](WAUtil, "_getBaseTokenStorageKeychainQueryWithIdentifer:", a4);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v6 == 0;
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446466;
      v19 = "+[WAUtil storeToken:withIdentifier:]";
      v20 = 1024;
      v21 = 89;
      v13 = "%{public}s::%d:Failed to get base keychain query for write op";
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 18;
LABEL_9:
      _os_log_impl(&dword_212581000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
LABEL_10:

    goto LABEL_4;
  }
  SecItemDelete(v6);
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDE9550]);

  -[__CFDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", *MEMORY[0x24BDE8F78], *MEMORY[0x24BDE8F60]);
  v10 = SecItemAdd(v7, 0);
  if (v10)
  {
    v17 = v10;
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136446722;
      v19 = "+[WAUtil storeToken:withIdentifier:]";
      v20 = 1024;
      v21 = 97;
      v22 = 1024;
      v23 = v17;
      v13 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d";
      v14 = v12;
      v15 = OS_LOG_TYPE_DEBUG;
      v16 = 24;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v8 = 1;
LABEL_4:

  return v8;
}

+ (id)getTokenForIdentifier:(id)a3
{
  void *v3;
  OSStatus v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  OSStatus v12;
  uint32_t v13;
  CFTypeRef result;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  OSStatus v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  result = 0;
  +[WAUtil _getBaseTokenStorageKeychainQueryWithIdentifer:](WAUtil, "_getBaseTokenStorageKeychainQueryWithIdentifer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE94C8]);
  if (!v3)
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "+[WAUtil getTokenForIdentifier:]";
      v17 = 1024;
      v18 = 111;
      v9 = "%{public}s::%d:Failed to get base keychain query for read op";
      v10 = v6;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_12:
      v13 = 18;
      goto LABEL_13;
    }
LABEL_14:
    v7 = 0;
    goto LABEL_5;
  }
  v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4)
  {
    v12 = v4;
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "+[WAUtil getTokenForIdentifier:]";
      v17 = 1024;
      v18 = 114;
      v19 = 1024;
      v20 = v12;
      v9 = "%{public}s::%d:Error back from SecItemCopyMatching(): %d";
      v10 = v6;
      v11 = OS_LOG_TYPE_DEBUG;
      v13 = 24;
LABEL_13:
      _os_log_impl(&dword_212581000, v10, v11, v9, buf, v13);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!result)
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "+[WAUtil getTokenForIdentifier:]";
      v17 = 1024;
      v18 = 115;
      v9 = "%{public}s::%d:Keychain didn't return any key data";
      v10 = v6;
      v11 = OS_LOG_TYPE_DEBUG;
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  v6 = result;
  v7 = (void *)objc_msgSend(v5, "initWithData:encoding:", result, 4);
LABEL_5:

  return v7;
}

+ (id)_getBaseTokenStorageKeychainQueryWithIdentifer:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.wifi.analytics.tokenStore.%@"), a3, *MEMORY[0x24BDE8FA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDE9128];
  v11[0] = v3;
  v11[1] = CFSTR("WiFiAnalytics");
  v5 = *MEMORY[0x24BDE8F50];
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = *MEMORY[0x24BDE9220];
  v6 = *MEMORY[0x24BDE9230];
  v11[2] = CFSTR("wifianalyticsd");
  v11[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  return v8;
}

+ (id)getMessageInstanceForKey:(id)a3 andGroupType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *context;
  void *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "resourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%ld/"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v42 = "+[WAUtil getMessageInstanceForKey:andGroupType:]";
      v43 = 1024;
      v44 = 136;
      v31 = "%{public}s::%d:Couldn't determine path for group";
      v32 = v30;
      v33 = 18;
LABEL_14:
      _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    }
LABEL_15:
    v23 = 0;
    v26 = 0;
LABEL_16:

    v25 = 0;
    goto LABEL_9;
  }
  v10 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@.wam"), v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithContentsOfFile:options:error:", v11, 8, 0);

  if (!v12)
  {
    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v42 = "+[WAUtil getMessageInstanceForKey:andGroupType:]";
      v43 = 1024;
      v44 = 138;
      v45 = 2112;
      v46 = v6;
      v31 = "%{public}s::%d:Couldn't find obscured data for key: %@";
      v32 = v30;
      v33 = 28;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v39 = v9;
  v36 = v12;
  v13 = MEMORY[0x212BEF45C]();
  v37 = (void *)MEMORY[0x24BDD1620];
  context = (void *)v13;
  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = objc_opt_class();
  v16 = v6;
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v35 = objc_opt_class();
  v23 = v36;
  v34 = v17;
  v6 = v16;
  objc_msgSend(v14, "setWithObjects:", v15, v34, v18, v19, v20, v21, v22, v35, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v37, "unarchivedObjectOfClasses:fromData:error:", v24, v36, &v40);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v40;

  if (v26)
  {
    WALogCategoryDefaultHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v42 = "+[WAUtil getMessageInstanceForKey:andGroupType:]";
      v43 = 1024;
      v44 = 144;
      v45 = 2112;
      v46 = v6;
      v47 = 2112;
      v48 = v26;
      _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive a WAMessageAWD instance with key of %@. Error: %@", buf, 0x26u);
    }

  }
  objc_autoreleasePoolPop(context);
  if (!v25)
  {
    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v9 = v39;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v42 = "+[WAUtil getMessageInstanceForKey:andGroupType:]";
      v43 = 1024;
      v44 = 146;
      _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive model data.", buf, 0x12u);
    }
    goto LABEL_16;
  }
  v9 = v39;
LABEL_9:
  v28 = v25;

  return v28;
}

+ (id)rotateUUIDsForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "mutableFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v4, "mutableFields");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "type") == 10)
      {
        if (objc_msgSend(v11, "isRepeatable"))
        {
          objc_msgSend(v11, "repeatableValues");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            v14 = 0;
            do
            {
              objc_msgSend(v11, "repeatableValues");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              v17 = (id)objc_msgSend(a1, "rotateUUIDsForMessage:", v16);
              ++v14;
              objc_msgSend(v11, "repeatableValues");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "count");

            }
            while (v14 < v19);
          }
        }
        else
        {
          objc_msgSend(v11, "subMessageValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)objc_msgSend(a1, "rotateUUIDsForMessage:", v20);

        }
      }

      ++v8;
      objc_msgSend(v4, "mutableFields");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v8 < v24);
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v26);

  return v4;
}

+ (id)groupTypeToString:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 2) < 4)
    return off_24CDDDF80[a3 - 2];
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 136446722;
    v7 = "+[WAUtil groupTypeToString:]";
    v8 = 1024;
    v9 = 191;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unhandled group type: %lu", (uint8_t *)&v6, 0x1Cu);
  }

  return 0;
}

+ (id)getCopyOfMessage:(id)a3 withNumericalValuesSubstractedByValuesInMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _UNKNOWN **v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  double v47;
  float v48;
  void *v49;
  unint64_t v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  unint64_t v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  unint64_t v76;
  void *v77;
  uint64_t v78;
  unint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  unint64_t v89;
  void *v90;
  uint64_t v91;
  unint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  void *v101;
  unint64_t v102;
  void *v103;
  uint64_t v104;
  unint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  unint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  float v121;
  float v122;
  float v123;
  double v124;
  unint64_t v125;
  uint64_t v126;
  unsigned int v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  int v134;
  uint64_t v135;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  uint64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint8_t v149[128];
  uint8_t buf[4];
  const char *v151;
  __int16 v152;
  int v153;
  __int16 v154;
  void *v155;
  __int16 v156;
  void *v157;
  uint64_t v158;

  v158 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v6;
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v5, "copy");
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    objc_msgSend(v5, "mutableFields");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v145, v149, 16);
    if (v13)
    {
      v14 = v13;
      v139 = v5;
      v15 = *(_QWORD *)v146;
      v16 = &off_24CDDB000;
      v17 = v140;
      v143 = v12;
      v141 = *(_QWORD *)v146;
      do
      {
        v18 = 0;
        v144 = v14;
        do
        {
          if (*(_QWORD *)v146 != v15)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v18);
          if ((objc_msgSend(v19, "isNumerical", v139) & 1) != 0 || objc_msgSend(v19, "type") == 10)
          {
            objc_msgSend(v19, "key");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "fieldForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            switch(objc_msgSend(v19, "type"))
            {
              case 1:
                if (!objc_msgSend(v19, "isRepeatable"))
                {
                  v115 = v17;
                  objc_msgSend(v19, "key");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "doubleValue");
                  v119 = v118;
                  objc_msgSend(v21, "doubleValue");
                  objc_msgSend(v117, "setDoubleValue:", v119 - v120);
                  goto LABEL_72;
                }
                objc_msgSend(v19, "repeatableValues");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "count");

                if (!v23)
                  goto LABEL_58;
                v24 = 0;
                do
                {
                  objc_msgSend(v19, "repeatableValues");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "objectAtIndex:", v24);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v21, "repeatableValues");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "objectAtIndex:", v24);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v19, "key");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v28, "BOOLValue");
                  objc_msgSend(v26, "doubleValue");
                  v33 = v32;
                  if (v31)
                  {
                    objc_msgSend(v28, "doubleValue");
                    v33 = v33 - v34;
                  }
                  objc_msgSend(v30, "addRepeatableDoubleValue:", v33);

                  ++v24;
                  objc_msgSend(v19, "repeatableValues");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = objc_msgSend(v35, "count");

                }
                while (v24 < v36);
                goto LABEL_23;
              case 2:
                if (!objc_msgSend(v19, "isRepeatable"))
                {
                  v115 = v17;
                  objc_msgSend(v19, "key");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "floatValue");
                  v122 = v121;
                  objc_msgSend(v21, "floatValue");
                  *(float *)&v124 = v122 - v123;
                  objc_msgSend(v117, "setFloatValue:", v124);
                  goto LABEL_72;
                }
                objc_msgSend(v19, "repeatableValues");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "count");

                if (v38)
                {
                  v39 = 0;
                  do
                  {
                    objc_msgSend(v19, "repeatableValues");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "objectAtIndex:", v39);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v21, "repeatableValues");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "objectAtIndex:", v39);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v19, "key");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "fieldForKey:", v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_msgSend(v43, "BOOLValue");
                    objc_msgSend(v41, "floatValue");
                    v48 = *(float *)&v47;
                    if (v46)
                    {
                      objc_msgSend(v43, "floatValue");
                      v48 = v48 - *(float *)&v47;
                    }
                    *(float *)&v47 = v48;
                    objc_msgSend(v45, "addRepeatableFloatValue:", v47);

                    ++v39;
                    objc_msgSend(v19, "repeatableValues");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = objc_msgSend(v49, "count");

                  }
                  while (v39 < v50);
LABEL_23:
                  v12 = v143;
                  v14 = v144;
                  v17 = v140;
                  v15 = v141;
                }
                goto LABEL_58;
              case 3:
                if (!objc_msgSend(v19, "isRepeatable"))
                {
                  v115 = v17;
                  objc_msgSend(v19, "key");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "setInt32Value:", objc_msgSend(v19, "int32Value") - objc_msgSend(v21, "int32Value"));
                  goto LABEL_72;
                }
                objc_msgSend(v19, "repeatableValues");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_msgSend(v64, "count");

                if (!v65)
                  goto LABEL_58;
                v142 = v18;
                v66 = 0;
                do
                {
                  objc_msgSend(v19, "repeatableValues");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "objectAtIndex:", v66);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v21, "repeatableValues");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "objectAtIndex:", v66);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v19, "key");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = objc_msgSend(v70, "BOOLValue");
                  v74 = objc_msgSend(v68, "intValue");
                  if (v73)
                    v74 = v74 - objc_msgSend(v70, "intValue");
                  objc_msgSend(v72, "addRepeatableInt32Value:", v74);

                  ++v66;
                  objc_msgSend(v19, "repeatableValues");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v76 = objc_msgSend(v75, "count");

                }
                while (v66 < v76);
                goto LABEL_51;
              case 4:
                if (!objc_msgSend(v19, "isRepeatable"))
                {
                  v115 = v17;
                  objc_msgSend(v19, "key");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "setInt64Value:", objc_msgSend(v19, "int64Value") - objc_msgSend(v21, "int64Value"));
                  goto LABEL_72;
                }
                objc_msgSend(v19, "repeatableValues");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v77, "count");

                if (!v78)
                  goto LABEL_58;
                v142 = v18;
                v79 = 0;
                do
                {
                  objc_msgSend(v19, "repeatableValues");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "objectAtIndex:", v79);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v21, "repeatableValues");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "objectAtIndex:", v79);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v19, "key");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v84);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = objc_msgSend(v83, "BOOLValue");
                  v87 = objc_msgSend(v81, "longLongValue");
                  if (v86)
                    v87 -= objc_msgSend(v83, "longLongValue");
                  objc_msgSend(v85, "addRepeatableInt64Value:", v87);

                  ++v79;
                  objc_msgSend(v19, "repeatableValues");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v89 = objc_msgSend(v88, "count");

                }
                while (v79 < v89);
                goto LABEL_51;
              case 5:
                if (!objc_msgSend(v19, "isRepeatable"))
                {
                  v115 = v17;
                  objc_msgSend(v19, "key");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  v127 = objc_msgSend(v21, "uint32Value");
                  if (v127 <= objc_msgSend(v19, "uint32Value"))
                  {
                    v134 = objc_msgSend(v19, "uint32Value");
                    v128 = v134 - objc_msgSend(v21, "uint32Value");
                  }
                  else
                  {
                    v128 = 0;
                  }
                  objc_msgSend(v117, "setUint32Value:", v128);
                  goto LABEL_72;
                }
                objc_msgSend(v19, "repeatableValues");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v91 = objc_msgSend(v90, "count");

                if (!v91)
                  goto LABEL_58;
                v142 = v18;
                v92 = 0;
                do
                {
                  objc_msgSend(v19, "repeatableValues");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "objectAtIndex:", v92);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v21, "repeatableValues");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "objectAtIndex:", v92);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v19, "key");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v97);
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = objc_msgSend(v96, "BOOLValue");
                  v100 = objc_msgSend(v94, "unsignedIntValue");
                  if (v99)
                    v100 = v100 - objc_msgSend(v96, "unsignedIntValue");
                  objc_msgSend(v98, "addRepeatableUInt32Value:", v100);

                  ++v92;
                  objc_msgSend(v19, "repeatableValues");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  v102 = objc_msgSend(v101, "count");

                }
                while (v92 < v102);
                goto LABEL_51;
              case 6:
                if (!objc_msgSend(v19, "isRepeatable"))
                {
                  v115 = v17;
                  objc_msgSend(v19, "key");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  v125 = objc_msgSend(v21, "uint64Value");
                  if (v125 <= objc_msgSend(v19, "uint64Value"))
                  {
                    v133 = objc_msgSend(v19, "uint64Value");
                    v126 = v133 - objc_msgSend(v21, "uint64Value");
                  }
                  else
                  {
                    v126 = 0;
                  }
                  objc_msgSend(v117, "setUint64Value:", v126);
                  goto LABEL_72;
                }
                objc_msgSend(v19, "repeatableValues");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "count");

                if (!v52)
                  goto LABEL_58;
                v142 = v18;
                v53 = 0;
                do
                {
                  objc_msgSend(v19, "repeatableValues");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "objectAtIndex:", v53);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v21, "repeatableValues");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "objectAtIndex:", v53);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v19, "key");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v58);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = objc_msgSend(v57, "BOOLValue");
                  v61 = objc_msgSend(v55, "unsignedLongLongValue");
                  if (v60)
                    v61 -= objc_msgSend(v57, "unsignedLongLongValue");
                  objc_msgSend(v59, "addRepeatableUInt64Value:", v61);

                  ++v53;
                  objc_msgSend(v19, "repeatableValues");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = objc_msgSend(v62, "count");

                }
                while (v53 < v63);
LABEL_51:
                v17 = v140;
                v15 = v141;
                v12 = v143;
                v14 = v144;
                v16 = &off_24CDDB000;
                goto LABEL_57;
              case 10:
                if (objc_msgSend(v19, "isRepeatable"))
                {
                  objc_msgSend(v19, "repeatableValues");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  v104 = objc_msgSend(v103, "count");

                  if (v104)
                  {
                    v142 = v18;
                    v105 = 0;
                    do
                    {
                      objc_msgSend(v19, "repeatableValues");
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v106, "objectAtIndex:", v105);
                      v107 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v21, "repeatableValues");
                      v108 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v108, "objectAtIndex:", v105);
                      v109 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v19, "key");
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v10, "fieldForKey:", v110);
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      +[WAUtil getCopyOfMessage:withNumericalValuesSubstractedByValuesInMessage:](WAUtil, "getCopyOfMessage:withNumericalValuesSubstractedByValuesInMessage:", v107, v109);
                      v112 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v111, "addRepeatableSubMessageValue:", v112);

                      ++v105;
                      objc_msgSend(v19, "repeatableValues");
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      v114 = objc_msgSend(v113, "count");

                    }
                    while (v105 < v114);
                    v17 = v140;
                    v15 = v141;
                    v16 = &off_24CDDB000;
                    v12 = v143;
                    v14 = v144;
LABEL_57:
                    v18 = v142;
                  }
                  else
                  {
LABEL_58:
                    v16 = &off_24CDDB000;
                  }
                }
                else
                {
                  v115 = v17;
                  objc_msgSend(v19, "key");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "fieldForKey:", v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  v129 = v16[107];
                  objc_msgSend(v19, "subMessageValue");
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "subMessageValue");
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v129, "getCopyOfMessage:withNumericalValuesSubstractedByValuesInMessage:", v130, v131);
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "setSubMessageValue:", v132);

                  v15 = v141;
                  v16 = &off_24CDDB000;
LABEL_72:

                  v17 = v115;
                  v12 = v143;
                  v14 = v144;
                }
                break;
              default:
                break;
            }
          }
          else
          {
            v21 = 0;
          }

          ++v18;
        }
        while (v18 != v14);
        v135 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v145, v149, 16);
        v14 = v135;
      }
      while (v135);
      v5 = v139;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "key");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "key");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v151 = "+[WAUtil getCopyOfMessage:withNumericalValuesSubstractedByValuesInMessage:]";
      v152 = 1024;
      v153 = 200;
      v154 = 2112;
      v155 = v137;
      v156 = 2112;
      v157 = v138;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:[WAUtil getCopyOfMessage:withNumericalValuesSubstractedByValuesInMessage: given two different messages(message 1 key: %@ vs message 2 key: %@), won't attempt to delta. Returning nil!", buf, 0x26u);

    }
    v10 = 0;
  }

  return v10;
}

+ (id)trimTokenForLogging:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_msgSend(v3, "length");
  if (v4 > 9)
  {
    v6 = v5 - 5;
  }
  else
  {
    if (!v5)
    {
      v7 = CFSTR("Nil or empty token");
      goto LABEL_7;
    }
    v6 = 1;
  }
  objc_msgSend(v3, "substringFromIndex:", v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

+ (id)getValueForEntitlementForCurrentProcess:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  size_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v16;
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (getpid() < 0)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "+[WAUtil getValueForEntitlementForCurrentProcess:]";
      v20 = 1024;
      v21 = 321;
      v16 = "%{public}s::%d:Failed to get PID";
LABEL_22:
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    }
LABEL_23:
    v5 = 0;
LABEL_24:
    v8 = 0;
LABEL_16:

    goto LABEL_17;
  }
  getpid();
  xpc_generate_audit_token();
  objc_msgSend(objc_retainAutorelease(v3), "UTF8String", 0, 0, 0, 0);
  v4 = xpc_copy_entitlement_for_token();
  if (!v4)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "+[WAUtil getValueForEntitlementForCurrentProcess:]";
      v20 = 1024;
      v21 = 329;
      v16 = "%{public}s::%d:Failed to copy entitlement object(does this entitlement exist for the current process?)";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v5 = (void *)v4;
  v6 = MEMORY[0x212BEF948]();
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "+[WAUtil getValueForEntitlementForCurrentProcess:]";
      v20 = 1024;
      v21 = 332;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to determine type of XPC entitlement object", buf, 0x12u);
    }
    goto LABEL_24;
  }
  v7 = v6;
  if (v6 == MEMORY[0x24BDACF80])
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", xpc_BOOL_get_value(v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (v7 == MEMORY[0x24BDACF78])
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    xpc_array_get_value(v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x212BEF948]() == MEMORY[0x24BDACFF0])
    {
      if (xpc_array_get_count(v5))
      {
        v11 = 0;
        do
        {
          xpc_array_get_value(v5, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v9, "addObject:", v13);

          ++v11;
        }
        while (v11 < xpc_array_get_count(v5));
      }
    }
    else
    {
      WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v19 = "+[WAUtil getValueForEntitlementForCurrentProcess:]";
        v20 = 1024;
        v21 = 340;
        _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC Array object contains non-string values", buf, 0x12u);
      }

    }
    if (-[NSObject count](v9, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    v8 = (void *)v14;
    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

+ (id)_generateInvocationForMethod:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t *v11;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "+[WAUtil _generateInvocationForMethod:]";
      v20 = 1024;
      v21 = 361;
      v14 = "%{public}s::%d:Didn't get infoForInvocation (InvokeMakerInfo instance)";
LABEL_12:
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    }
LABEL_13:

    v8 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  v4 = a3;
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "methodSignatureForSelector:", objc_msgSend(v4, "selector"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "+[WAUtil _generateInvocationForMethod:]";
      v20 = 1024;
      v21 = 364;
      v14 = "%{public}s::%d:Couldn't create NSMethodSignature from -InvokeMakerInfo.selector";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v4, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTarget:", v9);

    objc_msgSend(v8, "setSelector:", objc_msgSend(v4, "selector"));
    v17 = &v24;
    v16 = v23;
    v10 = 2;
    do
    {
      objc_msgSend(v8, "setArgument:atIndex:", &v16, v10++);
      v11 = v17++;
      v16 = *v11;
    }
    while (v16);
    objc_msgSend(v8, "retainArguments", 0);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "+[WAUtil _generateInvocationForMethod:]";
      v20 = 1024;
      v21 = 366;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't create NSInvocation from NSMethodSignature", buf, 0x12u);
    }

    v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (unint64_t)getAWDTimestamp
{
  timeval v3;

  v3.tv_sec = 0;
  *(_QWORD *)&v3.tv_usec = 0;
  gettimeofday(&v3, 0);
  return 1000 * v3.tv_sec + v3.tv_usec / 1000;
}

+ (void)incrementValueForKey:(id)a3 inMutableDict:(id)a4 onQueue:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
    dispatch_assert_queue_V2(v9);
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v18 = 136446722;
    v19 = "+[WAUtil incrementValueForKey:inMutableDict:onQueue:]";
    v20 = 1024;
    v21 = 411;
    v22 = 2112;
    v23 = v7;
    v15 = "%{public}s::%d:Attempting to adjust nil dictionary with key %@";
    v16 = v14;
    v17 = 28;
LABEL_11:
    _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v18, v17);
    goto LABEL_12;
  }
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v18 = 136446466;
    v19 = "+[WAUtil incrementValueForKey:inMutableDict:onQueue:]";
    v20 = 1024;
    v21 = 416;
    v15 = "%{public}s::%d:Attempting to adjust nil key in dictionary";
    v16 = v14;
    v17 = 18;
    goto LABEL_11;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v8, "setObject:forKey:", &unk_24CE01C38, v7);
    goto LABEL_13;
  }
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedLong:", objc_msgSend(v13, "unsignedIntegerValue") + 1);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObjectForKey:", v7);
  objc_msgSend(v8, "setObject:forKey:", v14, v7);
LABEL_12:

LABEL_13:
}

+ (void)sumNSNumberForKey:(id)a3 dstDict:(id)a4 otherDict:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446722;
      v19 = "+[WAUtil sumNSNumberForKey:dstDict:otherDict:]";
      v20 = 1024;
      v21 = 432;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempting to adjust nil dictionary with key %@", (uint8_t *)&v18, 0x1Cu);
    }
    goto LABEL_9;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");
      objc_msgSend(v10, "objectForKeyedSubscript:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedLong:", objc_msgSend(v16, "unsignedIntegerValue") + v15);
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "removeObjectForKey:", v7);
    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v7);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setObject:forKey:", v17, v7);
LABEL_9:

  }
}

+ (void)addDeltaNSNumberForTelemetryKey:(id)a3 dictKey:(id)a4 dictModule:(id)a5 telDict:(id)a6 recentDict:(id)a7 oldDict:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v16)
  {
    WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v39 = "+[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]";
      v40 = 1024;
      v41 = 452;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempting to adjust nil telDict with key %@", buf, 0x1Cu);
    }
    goto LABEL_12;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", v15);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_7;
  v20 = (void *)v19;
  objc_msgSend(v17, "objectForKeyedSubscript:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0);
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    objc_msgSend(v16, "removeObjectForKey:", v13);
    objc_msgSend(v16, "setObject:forKey:", v32, v13);
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", v15);
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_10;
  v24 = (void *)v23;
  objc_msgSend(v18, "objectForKeyedSubscript:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
LABEL_10:
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v17, "objectForKeyedSubscript:", v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "numberWithUnsignedLong:", objc_msgSend(v35, "unsignedLongValue"));
    v32 = objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v36 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v17, "objectForKeyedSubscript:", v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedLongValue");
  objc_msgSend(v18, "objectForKeyedSubscript:", v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", v14);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "numberWithUnsignedLong:", v28 - objc_msgSend(v30, "unsignedLongValue"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "removeObjectForKey:", v13);
  objc_msgSend(v16, "setObject:forKey:", v31, v13);

LABEL_13:
}

+ (void)logNestedDictionary:(id)a3 indent:(int)a4 prefix:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a5;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", 0, 1);
  objc_msgSend(v6, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v8;
  v48[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15);
        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

LABEL_9:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v7, v16);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "logNestedDictionary:indent:prefix:", v21, (a4 + 4), v20);
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          goto LABEL_9;
        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = objc_opt_isKindOfClass();

        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if ((v23 & 1) != 0)
        {
          v26 = objc_msgSend(v24, "unsignedIntegerValue");

          if (v26)
          {
            WALogCategoryDefaultHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_11;
LABEL_20:
            objc_msgSend(v6, "objectForKeyedSubscript:", v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67110146;
            v38 = a4;
            v39 = 2080;
            v40 = "";
            v41 = 2112;
            v42 = v7;
            v43 = 2112;
            v44 = v16;
            v45 = 2112;
            v46 = v21;
            _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_DEFAULT, "%*s%@ %@ : %@", buf, 0x30u);
            goto LABEL_10;
          }
        }
        else
        {
          objc_opt_class();
          v27 = objc_opt_isKindOfClass();

          if ((v27 & 1) != 0)
          {
            WALogCategoryDefaultHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_20;
LABEL_11:

          }
        }
        ++v15;
      }
      while (v13 != v15);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      v13 = v28;
    }
    while (v28);
  }

}

+ (BOOL)isMacAddress:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  v6 = v3
    && (v5 = objc_retainAutorelease(v3), objc_msgSend(v5, "UTF8String"))
    && ether_aton((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String")) != 0;

  return v6;
}

+ (BOOL)isWildcardMacAddress:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (objc_msgSend(a1, "isMacAddress:", v4))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("00:00:00:00:00:00")) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("0:0:0:0:0:0"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)resourcePath
{
  return CFSTR("/System/Library/PrivateFrameworks/WiFiAnalytics.framework");
}

+ (BOOL)isAnyWiFiAppInstalled
{
  return +[WAUtil isPreinstalledWiFiAppVisible](WAUtil, "isPreinstalledWiFiAppVisible")
      || +[WAUtil isWiFiAppInstalled](WAUtil, "isWiFiAppInstalled");
}

+ (BOOL)isPreinstalledWiFiAppVisible
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)CFPreferencesCopyValue(CFSTR("SBIconVisibility"), CFSTR("com.apple.wifi.app"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
  v3 = objc_msgSend(v2, "BOOLValue");

  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "+[WAUtil isPreinstalledWiFiAppVisible]";
    v8 = 1024;
    v9 = 539;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SBIconVisibility for com.apple.wifi.app=%d", (uint8_t *)&v6, 0x18u);
  }

  return v3;
}

+ (BOOL)isWiFiAppInstalled
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = objc_opt_class();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "applicationIsInstalled:", CFSTR("com.apple.wifi.app-shack"));

    if (v4)
    {
      WALogCategoryDefaultHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136446722;
        v8 = "+[WAUtil isWiFiAppInstalled]";
        v9 = 1024;
        v10 = 549;
        v11 = 2080;
        v12 = "+[WAUtil isWiFiAppInstalled]";
        _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: com.apple.wifi.app-shack is installed", (uint8_t *)&v7, 0x1Cu);
      }

      LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

+ (BOOL)isWiFiFragmentSamplingEnabled
{
  void *v2;
  int v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if ((MGGetBoolAnswer() & 1) != 0
    || (v2 = (void *)MGGetStringAnswer(), v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Beta")), v2, v3))
  {
    if (MGGetProductType() != 3348380076)
      *((_BYTE *)v8 + 24) = 1;
  }
  if (MGGetBoolAnswer())
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__WAUtil_isWiFiFragmentSamplingEnabled__block_invoke;
    v6[3] = &unk_24CDDCBF0;
    v6[4] = &v7;
    +[WAUtil getLazyNSNumberPreference:domain:exists:](WAUtil, "getLazyNSNumberPreference:domain:exists:", CFSTR("WiFiFragmentSampling"), CFSTR("com.apple.wifianalyticsd"), v6);
  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __39__WAUtil_isWiFiFragmentSamplingEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 136447234;
    v7 = "+[WAUtil isWiFiFragmentSamplingEnabled]_block_invoke";
    v8 = 1024;
    v9 = 569;
    v10 = 2080;
    v11 = "+[WAUtil isWiFiFragmentSamplingEnabled]_block_invoke";
    v12 = 1024;
    v13 = v5;
    v14 = 1024;
    v15 = objc_msgSend(v3, "unsignedIntValue");
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING kWAPreferenceWiFiFragmentSampling from %u to %u", (uint8_t *)&v6, 0x28u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");
}

+ (BOOL)isAnalyticsProcessorAllowed
{
  char v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = _os_feature_enabled_impl();
  if ((v2 & 1) == 0)
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446466;
      v6 = "+[WAUtil isAnalyticsProcessorAllowed]";
      v7 = 1024;
      v8 = 580;
      _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Writing in the WiFi Analytics Store is disabled on this platform", (uint8_t *)&v5, 0x12u);
    }

  }
  return v2;
}

+ (BOOL)shouldProcessAnalyticsImmediately
{
  BOOL v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  BOOL v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = +[WAUtil isAnyWiFiAppInstalled](WAUtil, "isAnyWiFiAppInstalled")
    || +[WAUtil isWiFiFragmentSamplingEnabled](WAUtil, "isWiFiFragmentSamplingEnabled");
  v9 = v2;
  if (_isInternalInstall)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __43__WAUtil_shouldProcessAnalyticsImmediately__block_invoke;
    v5[3] = &unk_24CDDCBF0;
    v5[4] = &v6;
    +[WAUtil getLazyNSNumberPreference:domain:exists:](WAUtil, "getLazyNSNumberPreference:domain:exists:", CFSTR("WAStore_ProcessAnalyticsImmediately"), CFSTR("com.apple.wifianalyticsd"), v5);
  }
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__WAUtil_shouldProcessAnalyticsImmediately__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 136447490;
    v7 = "+[WAUtil shouldProcessAnalyticsImmediately]_block_invoke";
    v8 = 1024;
    v9 = 592;
    v10 = 2080;
    v11 = "+[WAUtil shouldProcessAnalyticsImmediately]_block_invoke";
    v12 = 2112;
    v13 = CFSTR("WAStore_ProcessAnalyticsImmediately");
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = objc_msgSend(v3, "unsignedIntValue");
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING %@ from %u to %u", (uint8_t *)&v6, 0x32u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");
}

+ (BOOL)shouldEnableXPCStore
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (_isInternalInstall)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __30__WAUtil_shouldEnableXPCStore__block_invoke;
    v4[3] = &unk_24CDDCBF0;
    v4[4] = &v5;
    +[WAUtil getLazyNSNumberPreference:domain:exists:](WAUtil, "getLazyNSNumberPreference:domain:exists:", CFSTR("WAStore_EnableXPCStore"), CFSTR("com.apple.wifianalyticsd"), v4);
    v2 = *((_BYTE *)v6 + 24) != 0;
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __30__WAUtil_shouldEnableXPCStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 136447490;
    v7 = "+[WAUtil shouldEnableXPCStore]_block_invoke";
    v8 = 1024;
    v9 = 607;
    v10 = 2080;
    v11 = "+[WAUtil shouldEnableXPCStore]_block_invoke";
    v12 = 2112;
    v13 = CFSTR("WAStore_EnableXPCStore");
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = objc_msgSend(v3, "unsignedIntValue");
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING %@ from %u to %u", (uint8_t *)&v6, 0x32u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");
}

+ (BOOL)isWritingWAMessageToJsonAllowed
{
  char v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = _os_feature_enabled_impl();
  if ((v2 & 1) == 0)
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446466;
      v6 = "+[WAUtil isWritingWAMessageToJsonAllowed]";
      v7 = 1024;
      v8 = 621;
      _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:JSON file writing disabled on this platform", (uint8_t *)&v5, 0x12u);
    }

  }
  return v2;
}

+ (void)getLazyNSNumberPreference:(id)a3 domain:(id)a4 exists:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a5;
  v7 = (void *)MEMORY[0x24BDBCF50];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistentDomainForName:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13[2](v13, v12);

}

+ (void)getLazyNSStringPreference:(id)a3 domain:(id)a4 exists:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a5;
  v7 = (void *)MEMORY[0x24BDBCF50];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistentDomainForName:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13[2](v13, v12);

}

+ (BOOL)canPerformActionWithSamplingPercentage:(unint64_t)a3
{
  return arc4random_uniform(0x63u) <= a3;
}

@end
