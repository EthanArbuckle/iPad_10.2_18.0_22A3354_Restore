@implementation PCStatusConditionStorage

+ (BOOL)isStatusConditionRegistered:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PCStatusConditionStorage fileURLForCondition:](PCStatusConditionStorage, "fileURLForCondition:", v5));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v9 & 1) == 0)
    {
      v10 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.AdPlatforms"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dictionaryForKey:", CFSTR("ForcedStatusConditions")));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        v9 = objc_msgSend(v13, "isEqualToString:", v14);

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    if (a4)
    {
      v17 = NSLocalizedDescriptionKey;
      v18 = CFSTR("Error creating URL.");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), 1001, v15));

    }
    v9 = 0;
  }

  return v9;
}

+ (id)fileURLForCondition:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "storageRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sha1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 2, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/%@"), v5, v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PCStatusConditionStorage baseURL](PCStatusConditionStorage, "baseURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v8, 0));

  if (!v10)
  {
    v11 = APLogForCategory(44);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "PCStatusConditionStorage returned a nil URL", buf, 2u);
    }

  }
  return v10;
}

+ (id)baseURL
{
  if (PCStatusConditionStorage_baseURL)
    return (id)PCStatusConditionStorage_baseURL;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[PCStatusConditionStorage _makeApplicationSupportSubdirectory:](PCStatusConditionStorage, "_makeApplicationSupportSubdirectory:", CFSTR("adsc")));
}

+ (id)_makeApplicationSupportSubdirectory:(id)a3
{
  id v3;
  void *v4;
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v26[0] = v7;
  v26[1] = CFSTR("com.apple.ap.promotedcontentd");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v8));

  if (v3)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v3, 1));

    v9 = (void *)v10;
  }
  v19 = 0;
  v11 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v19);
  v12 = v19;
  if ((v11 & 1) != 0)
  {
    v13 = v9;
  }
  else
  {
    v14 = APLogForCategory(44);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedFailureReason"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
      *(_DWORD *)buf = 138478339;
      v21 = v9;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to create Application Support subdirectory: %{private}@ %{public}@ %{public}@", buf, 0x20u);

    }
    v13 = 0;
  }

  return v13;
}

+ (id)setStatusCondition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCStatusConditionStorage fileURLForCondition:](PCStatusConditionStorage, "fileURLForCondition:", v3));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingLastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v21 = 0;
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v21);
    v9 = v21;

    if (!v9)
    {
      v10 = APLogForCategory(44);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "iTunesDSID"));
        *(_DWORD *)buf = 136643843;
        v23 = "+[PCStatusConditionStorage setStatusCondition:]";
        v24 = 2114;
        v25 = v12;
        v26 = 2114;
        v27 = v13;
        v28 = 2160;
        v29 = 1752392040;
        v30 = 2112;
        v31 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{sensitive}s]: setting status condition %{public}@ for bundle %{public}@. DSID %{mask.hash}@", buf, 0x34u);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
      v20 = 0;
      objc_msgSend(v16, "writeToURL:options:error:", v5, 0, &v20);
      v9 = v20;

    }
    v17 = v9;

    v18 = v17;
  }
  else
  {
    v32 = NSLocalizedDescriptionKey;
    v33 = CFSTR("Error creating URL.");
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), 1001, v17));
  }

  return v18;
}

+ (id)clearStatusCondition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  NSErrorUserInfoKey v34;
  const __CFString *v35;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCStatusConditionStorage fileURLForCondition:](PCStatusConditionStorage, "fileURLForCondition:", v3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    v8 = APLogForCategory(44);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "iTunesDSID"));
        *(_DWORD *)buf = 136643843;
        v25 = "+[PCStatusConditionStorage clearStatusCondition:]";
        v26 = 2114;
        v27 = v11;
        v28 = 2114;
        v29 = v12;
        v30 = 2160;
        v31 = 1752392040;
        v32 = 2112;
        v33 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{sensitive}s]: clearing status condition %{public}@ for bundle %{public}@. DSID %{mask.hash}@.", buf, 0x34u);

      }
      v23 = 0;
      objc_msgSend(v5, "removeItemAtURL:error:", v4, &v23);
      v15 = v23;
    }
    else
    {
      if (v10)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "iTunesDSID"));
        *(_DWORD *)buf = 136643843;
        v25 = "+[PCStatusConditionStorage clearStatusCondition:]";
        v26 = 2114;
        v27 = v18;
        v28 = 2114;
        v29 = v19;
        v30 = 2160;
        v31 = 1752392040;
        v32 = 2112;
        v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{sensitive}s]: status condition %{public}@ for bundle %{public}@ doesn't exist. DSID %{mask.hash}@", buf, 0x34u);

      }
      v15 = 0;
    }
    v16 = v15;

    v17 = v16;
  }
  else
  {
    v34 = NSLocalizedDescriptionKey;
    v35 = CFSTR("Error creating URL.");
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), 1001, v16));
  }

  return v17;
}

+ (void)clearExpiredStatusConditions
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  unsigned __int8 v16;
  NSObject *v17;
  id v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PCStatusConditionStorage baseURL](PCStatusConditionStorage, "baseURL"));
  if (!v2)
  {
    v24 = APLogForCategory(44);
    v3 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "PCStatusConditionStorage returned a nil URL", buf, 2u);
    }
    goto LABEL_39;
  }
  v3 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLContentModificationDateKey, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v2, v4, 4, &stru_100218D30));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (!v7)
    goto LABEL_38;
  v8 = v7;
  v34 = v4;
  v35 = v2;
  v36 = v3;
  v9 = 0;
  v10 = *(_QWORD *)v45;
  v38 = v6;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v45 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
      v42 = 0;
      v43 = 0;
      v13 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v43, NSURLIsDirectoryKey, &v42);
      v14 = v43;
      v15 = v42;

      if ((v13 & 1) == 0)
      {
        if (!v15)
        {
          v9 = 0;
          goto LABEL_23;
        }
        v25 = APLogForCategory(44);
        v17 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
          *(_DWORD *)buf = 141558530;
          v49 = 1752392040;
          v50 = 2112;
          v51 = v26;
          v52 = 2114;
          v53 = v27;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "An error occurred getting isDirectory from url:%{mask.hash}@. %{public}@", buf, 0x20u);

        }
        v18 = v15;
        goto LABEL_36;
      }
      if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
      {
        v9 = v15;
        goto LABEL_23;
      }
      v40 = 0;
      v41 = 0;
      v16 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v41, NSURLContentModificationDateKey, &v40);
      v17 = v41;
      v18 = v40;

      if ((v16 & 1) != 0)
      {
        if (v17)
        {
          objc_msgSend(v37, "timeIntervalSinceDate:", v17);
          if (v19 <= *(double *)&PCStatusConditionStorage_expectedLifeInterval)
          {
            v9 = v18;
          }
          else
          {
            v39 = v18;
            -[NSObject removeItemAtURL:error:](v36, "removeItemAtURL:error:", v12, &v39);
            v9 = v39;

            if (v9)
            {
              v20 = APLogForCategory(44);
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
                *(_DWORD *)buf = 141558530;
                v49 = 1752392040;
                v50 = 2112;
                v51 = v22;
                v52 = 2114;
                v53 = v23;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "An error occurred attempting to removeItemAtUrl:%{mask.hash}@. %{public}@", buf, 0x20u);

              }
            }
          }
          goto LABEL_22;
        }
        v28 = APLogForCategory(44);
        v17 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
          *(_DWORD *)buf = 138412290;
          v49 = (uint64_t)v29;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "An error occured retrieving modified date from url %@", buf, 0xCu);

        }
LABEL_36:

        v9 = v18;
        v6 = v38;
        goto LABEL_37;
      }
      if (v18)
      {
        v30 = APLogForCategory(44);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
          *(_DWORD *)buf = 141558530;
          v49 = 1752392040;
          v50 = 2112;
          v51 = v32;
          v52 = 2114;
          v53 = v33;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "An error occurred getting date from url:%{mask.hash}@. %{public}@", buf, 0x20u);

        }
        goto LABEL_36;
      }
      v9 = 0;
LABEL_22:

      v6 = v38;
LABEL_23:

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v8)
      continue;
    break;
  }
LABEL_37:

  v4 = v34;
  v2 = v35;
  v3 = v36;
LABEL_38:

LABEL_39:
}

@end
