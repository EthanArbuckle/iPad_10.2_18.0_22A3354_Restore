@implementation CCDValidationGroupInfo

- (CCDValidationGroupInfo)initWithName:(id)a3 validationInfo:(id)a4
{
  id v6;
  CCDValidationGroupInfo *v7;
  CCDValidationGroupInfo *v8;
  uint64_t v9;
  NSArray *keyInfo;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCDValidationGroupInfo;
  v7 = -[CCDValidationInfo initWithName:validationInfo:](&v12, "initWithName:validationInfo:", a3, v6);
  v8 = v7;
  if (v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CCDValidationGroupInfo _mutableKeyInfoArrayFromValidationInfo:](v7, "_mutableKeyInfoArrayFromValidationInfo:", v6));
    keyInfo = v8->_keyInfo;
    v8->_keyInfo = (NSArray *)v9;

  }
  return v8;
}

- (id)_mutableKeyInfoArrayFromValidationInfo:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  CCDValidationKeyInfo *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v5 = (void *)objc_opt_new(NSMutableArray, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keyInfo")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
        v13 = -[CCDValidationKeyInfo initWithName:validationInfo:]([CCDValidationKeyInfo alloc], "initWithName:validationInfo:", v11, v12);
        objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationGroupInfo keyInfo](self, "keyInfo", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v16 = objc_msgSend(v15, "validateSelfWithDictionary:resultsDictionary:", v9, v7);
        if ((v16 & 1) == 0)
        {
          v19 = *(NSObject **)(DEPLogObjects(v16, v17) + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
            *(_DWORD *)buf = 138543618;
            v29 = v21;
            v30 = 2114;
            v31 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Validation error in the following part of cloud config dictionary: \n%{public}@\nValidation information: %{public}@", buf, 0x16u);

          }
          v18 = 0;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v12)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_13:

  return v18;
}

- (NSArray)keyInfo
{
  return self->_keyInfo;
}

- (void)setKeyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_keyInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyInfo, 0);
}

@end
