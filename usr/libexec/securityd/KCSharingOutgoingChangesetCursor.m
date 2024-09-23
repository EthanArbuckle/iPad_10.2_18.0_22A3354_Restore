@implementation KCSharingOutgoingChangesetCursor

- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3
{
  return -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:desiredZoneIDs:](self, "initWithDatabaseScope:desiredZoneIDs:", a3, 0);
}

- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3 desiredZoneIDs:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  KCSharingOutgoingChangesetCursor *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1002EE888, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v13 = -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:keyset:fetchBehavior:](self, "initWithDatabaseScope:keyset:fetchBehavior:", a3, v7, 2);
  }
  else
  {
    v13 = -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:keyset:fetchBehavior:](self, "initWithDatabaseScope:keyset:fetchBehavior:", a3, &__NSDictionary0__struct, 1);
  }

  return v13;
}

- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3 keyset:(id)a4 fetchBehavior:(int64_t)a5
{
  id v8;
  KCSharingOutgoingChangesetCursor *v9;
  KCSharingOutgoingChangesetCursor *v10;
  NSDictionary *v11;
  NSDictionary *keyset;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KCSharingOutgoingChangesetCursor;
  v9 = -[KCSharingOutgoingChangesetCursor init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_databaseScope = a3;
    v11 = (NSDictionary *)objc_msgSend(v8, "copy");
    keyset = v10->_keyset;
    v10->_keyset = v11;

    v10->_fetchBehavior = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  char *v5;

  v3 = -[KCSharingOutgoingChangesetCursor databaseScope](self, "databaseScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingChangesetCursor keyset](self, "keyset"));
  v5 = (char *)objc_msgSend(v4, "hash") + 32 * v3 - v3;

  return (_BYTE *)-[KCSharingOutgoingChangesetCursor fetchBehavior](self, "fetchBehavior") - v5 + 32 * (_QWORD)v5;
}

- (BOOL)isEqual:(id)a3
{
  KCSharingOutgoingChangesetCursor *v4;
  KCSharingOutgoingChangesetCursor *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;

  v4 = (KCSharingOutgoingChangesetCursor *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (-[KCSharingOutgoingChangesetCursor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    v6 = -[KCSharingOutgoingChangesetCursor databaseScope](self, "databaseScope");
    if (v6 == (id)-[KCSharingOutgoingChangesetCursor databaseScope](v5, "databaseScope"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingChangesetCursor keyset](self, "keyset"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingChangesetCursor keyset](v5, "keyset"));
      if (objc_msgSend(v7, "isEqualToDictionary:", v8))
      {
        v9 = -[KCSharingOutgoingChangesetCursor fetchBehavior](self, "fetchBehavior");
        v10 = v9 == (id)-[KCSharingOutgoingChangesetCursor fetchBehavior](v5, "fetchBehavior");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithDesiredZoneIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id v18;
  int64_t v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingChangesetCursor keyset](self, "keyset"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));
          v15 = (void *)v14;
          if (v14)
            v16 = (const __CFString *)v14;
          else
            v16 = &stru_1002EE888;
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v17 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithDatabaseScope:keyset:fetchBehavior:", -[KCSharingOutgoingChangesetCursor databaseScope](self, "databaseScope"), v6, 2);
    v5 = v22;
  }
  else
  {
    v18 = objc_alloc((Class)objc_opt_class(self));
    v19 = -[KCSharingOutgoingChangesetCursor databaseScope](self, "databaseScope");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingChangesetCursor keyset](self, "keyset"));
    v17 = objc_msgSend(v18, "initWithDatabaseScope:keyset:fetchBehavior:", v19, v20, 1);

  }
  return v17;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KCSharingOutgoingChangesetCursor;
  v3 = -[KCSharingOutgoingChangesetCursor description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = CKDatabaseScopeString(-[KCSharingOutgoingChangesetCursor databaseScope](self, "databaseScope"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingChangesetCursor keyset](self, "keyset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@, scope: %@, keyset: %@, fetchBehavior: %ld)"), v4, v6, v7, -[KCSharingOutgoingChangesetCursor fetchBehavior](self, "fetchBehavior")));

  return v8;
}

- (KCSharingOutgoingChangesetCursor)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  KCSharingOutgoingChangesetCursor *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("dbScope"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "intValue");

  v8 = objc_opt_class(NSDictionary);
  v9 = objc_opt_class(NSString);
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(CKRecordZoneID), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("keyset")));

  v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("fetchBehavior"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = objc_msgSend(v14, "intValue");
  if (v12 && v7 >= 1 && v7 <= 3 && v15 >= 1 && v15 < 3)
  {
    self = -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:keyset:fetchBehavior:](self, "initWithDatabaseScope:keyset:fetchBehavior:", v7, v12, v15);
    v16 = self;
  }
  else
  {
    v17 = KCSharingLogObject(CFSTR("KCSharingOutgoingChangesetCursor"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Cursor failed to decode properly", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[KCSharingOutgoingChangesetCursor databaseScope](self, "databaseScope")));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dbScope"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingChangesetCursor keyset](self, "keyset"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("keyset"));

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[KCSharingOutgoingChangesetCursor fetchBehavior](self, "fetchBehavior")));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("fetchBehavior"));

}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (NSDictionary)keyset
{
  return self->_keyset;
}

- (int64_t)fetchBehavior
{
  return self->_fetchBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyset, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
