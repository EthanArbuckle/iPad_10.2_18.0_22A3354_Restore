@implementation FMDCodableFactory

- (FMDCodableFactory)init
{
  FMDCodableFactory *v2;
  uint64_t v3;
  NSDictionary *classTypeMapping;
  uint64_t v5;
  NSArray *objectTypeKeys;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDCodableFactory;
  v2 = -[FMDCodableFactory init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[FMDCodableFactory _defaultClassTypeMap](FMDCodableFactory, "_defaultClassTypeMap"));
    classTypeMapping = v2->_classTypeMapping;
    v2->_classTypeMapping = (NSDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[FMDCodableFactory _defaultObjectTypeKeys](FMDCodableFactory, "_defaultObjectTypeKeys"));
    objectTypeKeys = v2->_objectTypeKeys;
    v2->_objectTypeKeys = (NSArray *)v5;

  }
  return v2;
}

- (FMDCodableFactory)initWithClasses:(id)a3
{
  id v4;
  FMDCodableFactory *v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *classTypeMapping;
  NSDictionary *v19;
  uint64_t v20;
  NSArray *objectTypeKeys;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t buf[4];
  FMDCodableFactory *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FMDCodableFactory;
  v5 = -[FMDCodableFactory init](&v32, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCodableFactory _defaultClassTypeMap](FMDCodableFactory, "_defaultClassTypeMap"));
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCodableFactory _defaultObjectTypeKeys](FMDCodableFactory, "_defaultObjectTypeKeys"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v8));

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = v4;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodable))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectType"));
            -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v15, v16);

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectTypeKey"));
            objc_msgSend(v9, "addObject:", v17);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      }
      while (v12);
    }

    classTypeMapping = v5->_classTypeMapping;
    v5->_classTypeMapping = v7;
    v19 = v7;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    objectTypeKeys = v5->_objectTypeKeys;
    v5->_objectTypeKeys = (NSArray *)v20;

    v22 = sub_10005303C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCodableFactory objectTypeKeys](v5, "objectTypeKeys"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCodableFactory classTypeMapping](v5, "classTypeMapping"));
      *(_DWORD *)buf = 138412802;
      v34 = v5;
      v35 = 2112;
      v36 = v24;
      v37 = 2112;
      v38 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Factory(%@) classes with object mappings: %@ and map %@", buf, 0x20u);

    }
    v4 = v27;
  }

  return v5;
}

- (FMDCodableFactory)initWithObjectTypeKeys:(id)a3 andClassMap:(id)a4
{
  id v6;
  id v7;
  FMDCodableFactory *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *classTypeMapping;
  NSDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *objectTypeKeys;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  FMDCodableFactory *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)FMDCodableFactory;
  v8 = -[FMDCodableFactory init](&v23, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCodableFactory _defaultClassTypeMap](FMDCodableFactory, "_defaultClassTypeMap"));
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v9));

    -[NSDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v7);
    classTypeMapping = v8->_classTypeMapping;
    v8->_classTypeMapping = v10;
    v12 = v10;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCodableFactory _defaultObjectTypeKeys](FMDCodableFactory, "_defaultObjectTypeKeys"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "setByAddingObjectsFromArray:", v6));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
    objectTypeKeys = v8->_objectTypeKeys;
    v8->_objectTypeKeys = (NSArray *)v16;

    v18 = sub_10005303C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCodableFactory objectTypeKeys](v8, "objectTypeKeys"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCodableFactory classTypeMapping](v8, "classTypeMapping"));
      *(_DWORD *)buf = 138412802;
      v25 = v8;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Factory(%@) key-value with object mappings: %@ and map %@", buf, 0x20u);

    }
  }

  return v8;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(0x%p)"), objc_opt_class(self, a2), self);
}

- (Class)classForObjectInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCodableFactory _defaultClassTypeMap](FMDCodableFactory, "_defaultClassTypeMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));

        if (v12)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCodableFactory _defaultClassTypeMap](FMDCodableFactory, "_defaultClassTypeMap"));
          v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v11));

          goto LABEL_21;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v8)
        continue;
      break;
    }
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCodableFactory objectTypeKeys](self, "objectTypeKeys", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    while (2)
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v18));

        if (v19)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCodableFactory classTypeMapping](self, "classTypeMapping"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v18));
          v20 = objc_msgSend(v23, "objectForKey:", v24);

          goto LABEL_20;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v15)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_20:

  v22 = v20;
LABEL_21:

  return (Class)v22;
}

+ (id)_defaultClassTypeMap
{
  if (qword_1003063D8 != -1)
    dispatch_once(&qword_1003063D8, &stru_1002C1548);
  return (id)qword_1003063D0;
}

+ (id)_defaultObjectTypeKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull objectTypeKey](NSNull, "objectTypeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL objectTypeKey](NSURL, "objectTypeKey", v2));
  v11[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate objectTypeKey](NSDate, "objectTypeKey"));
  v11[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber objectTypeKey](NSNumber, "objectTypeKey"));
  v11[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString objectTypeKey](NSString, "objectTypeKey"));
  v11[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray objectTypeKey](NSArray, "objectTypeKey"));
  v11[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary objectTypeKey](NSDictionary, "objectTypeKey"));
  v11[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 7));

  return v9;
}

- (NSDictionary)defaultClassTypeMapping
{
  return self->_defaultClassTypeMapping;
}

- (void)setDefaultClassTypeMapping:(id)a3
{
  objc_storeStrong((id *)&self->_defaultClassTypeMapping, a3);
}

- (NSDictionary)classTypeMapping
{
  return self->_classTypeMapping;
}

- (void)setClassTypeMapping:(id)a3
{
  objc_storeStrong((id *)&self->_classTypeMapping, a3);
}

- (NSArray)objectTypeKeys
{
  return self->_objectTypeKeys;
}

- (void)setObjectTypeKeys:(id)a3
{
  objc_storeStrong((id *)&self->_objectTypeKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectTypeKeys, 0);
  objc_storeStrong((id *)&self->_classTypeMapping, 0);
  objc_storeStrong((id *)&self->_defaultClassTypeMapping, 0);
}

@end
