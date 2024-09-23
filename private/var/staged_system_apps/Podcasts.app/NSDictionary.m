@implementation NSDictionary

- (id)queryString
{
  NSMutableArray *v3;
  NSDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pf_stringWithPercentEscape"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pf_stringWithPercentEscape"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=%@"), v13, v14, (_QWORD)v18));
        -[NSMutableArray addObject:](v3, "addObject:", v15);

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR("&")));
  return v16;
}

- (id)mt_valueOrNilForKey:(id)a3 type:(Class)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t isKindOfClass;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  NSString *v16;
  objc_class *v17;
  NSString *v18;
  NSDictionary *v19;
  int v21;
  id v22;
  __int16 v23;
  Class v24;
  __int16 v25;
  NSDictionary *v26;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v6));
  v8 = (void *)v7;
  if (!v7)
  {
    v11 = _MTLogCategoryCloudSync(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = 138543874;
      v22 = v6;
      v23 = 2114;
      v24 = a4;
      v25 = 2114;
      v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Notifications: Failed to parse %{public}@ as type %{public}@ from notification %{public}@", (uint8_t *)&v21, 0x20u);
    }

    goto LABEL_10;
  }
  isKindOfClass = objc_opt_isKindOfClass(v7, a4);
  if ((isKindOfClass & 1) == 0)
  {
    v13 = _MTLogCategoryCloudSync(isKindOfClass);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class(v8);
      v16 = NSStringFromClass(v15);
      v17 = (objc_class *)objc_claimAutoreleasedReturnValue(v16);
      v18 = NSStringFromClass(a4);
      v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue(v18);
      v21 = 138543874;
      v22 = v8;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Notifications: Trying to cast %{public}@ from %{public}@ to %{public}@ fails", (uint8_t *)&v21, 0x20u);

    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = v8;
LABEL_11:

  return v10;
}

- (NSNumber)dsid
{
  uint64_t v3;

  v3 = objc_opt_class(NSNumber, a2);
  return (NSNumber *)-[NSDictionary mt_valueOrNilForKey:type:](self, "mt_valueOrNilForKey:type:", CFSTR("dsid"), v3);
}

- (NSString)domain
{
  uint64_t v3;

  v3 = objc_opt_class(NSString, a2);
  return (NSString *)-[NSDictionary mt_valueOrNilForKey:type:](self, "mt_valueOrNilForKey:type:", CFSTR("domain"), v3);
}

- (NSNumber)domainVersion
{
  uint64_t v3;

  v3 = objc_opt_class(NSNumber, a2);
  return (NSNumber *)-[NSDictionary mt_valueOrNilForKey:type:](self, "mt_valueOrNilForKey:type:", CFSTR("domainVersion"), v3);
}

- (NSNumber)storeId
{
  uint64_t v3;

  v3 = objc_opt_class(NSNumber, a2);
  return (NSNumber *)-[NSDictionary mt_valueOrNilForKey:type:](self, "mt_valueOrNilForKey:type:", CFSTR("storeAdamId"), v3);
}

- (NSString)type
{
  uint64_t v3;

  v3 = objc_opt_class(NSString, a2);
  return (NSString *)-[NSDictionary mt_valueOrNilForKey:type:](self, "mt_valueOrNilForKey:type:", CFSTR("type"), v3);
}

- (NSString)triggeredBy
{
  uint64_t v3;

  v3 = objc_opt_class(NSString, a2);
  return (NSString *)-[NSDictionary mt_valueOrNilForKey:type:](self, "mt_valueOrNilForKey:type:", CFSTR("triggered-by"), v3);
}

@end
