@implementation WatchSyncedPreferences

- (WatchSyncedPreferences)initWithDefaults:(id)a3
{
  id v5;
  WatchSyncedPreferences *v6;
  NPSManager *v7;
  NPSManager *manager;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WatchSyncedPreferences;
  v6 = -[WatchSyncedPreferences init](&v10, "init");
  if (v6)
  {
    v7 = objc_opt_new(NPSManager);
    manager = v6->_manager;
    v6->_manager = v7;

    objc_storeStrong((id *)&v6->_defaults, a3);
    -[WatchSyncedPreferences loadValuesFromDefaults](v6, "loadValuesFromDefaults");
  }

  return v6;
}

- (WatchSyncedPreferences)initWithCopy:(id)a3
{
  id *v4;
  WatchSyncedPreferences *v5;
  NPSManager *v6;
  NPSManager *manager;
  objc_super v9;

  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)WatchSyncedPreferences;
  v5 = -[WatchSyncedPreferences init](&v9, "init");
  if (v5)
  {
    v6 = objc_opt_new(NPSManager);
    manager = v5->_manager;
    v5->_manager = v6;

    objc_storeStrong((id *)&v5->_defaults, v4[2]);
  }

  return v5;
}

- (NSArray)_keys
{
  return 0;
}

- (NSArray)_values
{
  return 0;
}

- (BOOL)hasAnyNonStandardPreferences
{
  return 0;
}

- (void)_forEachKeyAndValueWithBlock:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void (**v13)(id, void *, void *, unint64_t);

  v13 = (void (**)(id, void *, void *, unint64_t))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _keys](self, "_keys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _values](self, "_values"));
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
    v7 = v5;
  else
    v7 = v4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v8));
      v13[2](v13, v9, v10, v8);

      ++v8;
      v11 = objc_msgSend(v4, "count");
      if (v11 >= objc_msgSend(v5, "count"))
        v12 = v5;
      else
        v12 = v4;
    }
    while (v8 < (unint64_t)objc_msgSend(v12, "count"));
  }

}

- (BOOL)isEqual:(id)a3
{
  WatchSyncedPreferences *v4;
  uint64_t v5;
  WatchSyncedPreferences *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = (WatchSyncedPreferences *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v5 = objc_opt_class(WatchSyncedPreferences);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _keys](v6, "_keys"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _values](v6, "_values"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _keys](self, "_keys"));
      v10 = objc_msgSend(v9, "count");
      if (v10 == objc_msgSend(v7, "count"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _values](self, "_values"));
        v12 = objc_msgSend(v11, "count");
        v13 = objc_msgSend(v8, "count");

        if (v12 == v13)
        {
          v20 = 0;
          v21 = &v20;
          v22 = 0x2020000000;
          v23 = 1;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100595760;
          v16[3] = &unk_1011BBF30;
          v19 = &v20;
          v17 = v7;
          v18 = v8;
          -[WatchSyncedPreferences _forEachKeyAndValueWithBlock:](self, "_forEachKeyAndValueWithBlock:", v16);
          v14 = *((_BYTE *)v21 + 24) != 0;

          _Block_object_dispose(&v20, 8);
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {

      }
      v14 = 0;
      goto LABEL_10;
    }
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _keys](self, "_keys"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _values](self, "_values"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  NSMutableArray *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  NSMutableArray *v12;

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10059597C;
  v11 = &unk_1011BBF58;
  v12 = objc_opt_new(NSMutableArray);
  v3 = v12;
  -[WatchSyncedPreferences _forEachKeyAndValueWithBlock:](self, "_forEachKeyAndValueWithBlock:", &v8);
  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR(", ")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5, v8, v9, v10, v11));

  return v6;
}

- (void)synchronize
{
  id v3;
  NSObject *v4;
  NPSManager *manager;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  WatchSyncedPreferences *v10;

  v3 = sub_100431EAC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Saving %@", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100595B08;
  v8[3] = &unk_1011BBF58;
  v8[4] = self;
  -[WatchSyncedPreferences _forEachKeyAndValueWithBlock:](self, "_forEachKeyAndValueWithBlock:", v8);
  manager = self->_manager;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences _keys](self, "_keys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  -[NPSManager synchronizeUserDefaultsDomain:keys:container:](manager, "synchronizeUserDefaultsDomain:keys:container:", CFSTR("com.apple.Maps"), v7, CFSTR("com.apple.Maps"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc((Class)objc_opt_class(self, a2));
  return _objc_msgSend(v4, "initWithCopy:", self);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
