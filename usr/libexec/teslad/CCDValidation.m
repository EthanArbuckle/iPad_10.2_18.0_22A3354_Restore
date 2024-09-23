@implementation CCDValidation

+ (id)cloudConfigurationValidationDictionary
{
  if (qword_100021648 != -1)
    dispatch_once(&qword_100021648, &stru_100018CF0);
  return (id)qword_100021640;
}

+ (BOOL)validateCloudConfiguration:(id)a3 withResultDictionary:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t isKindOfClass;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  CCDValidationGroupInfo *v20;
  void *v21;
  CCDValidationGroupInfo *v22;
  _BOOL8 v23;
  uint64_t v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(NSDictionary);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if ((isKindOfClass & 1) == 0)
  {
    v26 = *(NSObject **)(DEPLogObjects(isKindOfClass, v10) + 8);
    v25 = 0;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Cloud configuration is not a dictionary!", buf, 2u);
LABEL_19:
    v25 = 0;
    goto LABEL_20;
  }
  v11 = objc_msgSend(a1, "validateGroupDependenciesInCloudConfiguration:", v6);
  if (!(_DWORD)v11)
    goto LABEL_19;
  v13 = *(NSObject **)(DEPLogObjects(v11, v12) + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cloud configuration group dependencies are valid.", buf, 2u);
  }
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cloudConfigurationValidationDictionary"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v20 = [CCDValidationGroupInfo alloc];
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v19, (_QWORD)v29));
        v22 = -[CCDValidationGroupInfo initWithName:validationInfo:](v20, "initWithName:validationInfo:", v19, v21);

        v23 = -[CCDValidationInfo validateSelfWithDictionary:resultsDictionary:](v22, "validateSelfWithDictionary:resultsDictionary:", v6, v7);
        if (!v23)
        {
          v27 = *(NSObject **)(DEPLogObjects(v23, v24) + 8);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cloud configuration is NOT valid.", buf, 2u);
          }

          goto LABEL_19;
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v16)
        continue;
      break;
    }
  }

  v25 = 1;
LABEL_20:

  return v25;
}

+ (BOOL)validateGroupDependenciesInCloudConfiguration:(id)a3
{
  return 1;
}

@end
