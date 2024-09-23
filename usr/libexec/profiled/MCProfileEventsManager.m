@implementation MCProfileEventsManager

- (MCProfileEventsManager)init
{
  MCProfileEventsConcreteDataProvider *v3;
  MCProfileEventsManager *v4;

  v3 = objc_opt_new(MCProfileEventsConcreteDataProvider);
  v4 = -[MCProfileEventsManager initWithDataProvider:](self, "initWithDataProvider:", v3);

  return v4;
}

- (MCProfileEventsManager)initWithDataProvider:(id)a3
{
  id v5;
  MCProfileEventsManager *v6;
  MCProfileEventsManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCProfileEventsManager;
  v6 = -[MCProfileEventsManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataProvider, a3);

  return v7;
}

- (id)earlistProfileEventExpiry
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _profileEvents](self, "_profileEvents", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _timestampFromEvent:](self, "_timestampFromEvent:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)));
        v10 = v9;
        if (v9)
        {
          if (v6)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "earlierDate:", v6));

            if (v11 == v10)
            {
              v12 = v10;

              v6 = v12;
            }
          }
          else
          {
            v6 = v9;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", (double)(int)+[MCFeatureOverrides profileEventsExpirationInterval](MCFeatureOverrides, "profileEventsExpirationInterval")));
  return v13;
}

- (void)addEventForProfile:(id)a3 operation:(id)a4 source:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  void *v23;
  void *v24;

  v8 = a4;
  v9 = (__CFString *)a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _profileEvents](self, "_profileEvents"));
  if (v11)
    v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11));
  else
    v12 = objc_opt_new(NSMutableArray);
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loggingID"));

  v15 = CFSTR("Unknown");
  v23 = v14;
  if (v9)
    v15 = v9;
  v21[0] = CFSTR("Process");
  v21[1] = CFSTR("Operation");
  v22[0] = v15;
  v22[1] = v8;
  v21[2] = CFSTR("Timestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager dataProvider](self, "dataProvider"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentTime"));
  v22[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));
  v24 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));

  -[NSMutableArray insertObject:atIndex:](v13, "insertObject:atIndex:", v19, 0);
  v20 = +[MCFeatureOverrides profileEventsMaxLength](MCFeatureOverrides, "profileEventsMaxLength");
  if (-[NSMutableArray count](v13, "count") > v20)
    -[NSMutableArray removeObjectsInRange:](v13, "removeObjectsInRange:", v20, (_BYTE *)-[NSMutableArray count](v13, "count") - v20);
  -[MCProfileEventsManager _saveProfileEvents:](self, "_saveProfileEvents:", v13);

}

- (void)removeExpiredProfileEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _profileEvents](self, "_profileEvents"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v17 = objc_opt_new(NSMutableArray);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager dataProvider](self, "dataProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTime"));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _timestampFromEvent:](self, "_timestampFromEvent:", v12, v16));
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)+[MCFeatureOverrides profileEventsExpirationInterval](MCFeatureOverrides, "profileEventsExpirationInterval")));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "earlierDate:", v14));

            if (v15 == v6)
              -[NSMutableArray addObject:](v17, "addObject:", v12);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    -[MCProfileEventsManager _saveProfileEvents:](self, "_saveProfileEvents:", v17);
    v4 = v16;
  }

}

- (id)_profileEventsOnDisk
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager dataProvider](self, "dataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "profileEventsFilePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataFromFile:](NSData, "MCDataFromFile:", v3));

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v4, 0, 0, 0));
  else
    v5 = 0;
  if (v5)
    v6 = v5;
  else
    v6 = &__NSDictionary0__struct;
  v7 = v6;

  return v7;
}

- (id)_profileEvents
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _profileEventsOnDisk](self, "_profileEventsOnDisk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProfileEvents")));

  if (v3 && (v4 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)_timestampFromEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timestamp")));
  return v5;
}

- (void)_saveProfileEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v8 = CFSTR("ProfileEvents");
  v9 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager dataProvider](self, "dataProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profileEventsFilePath"));
  objc_msgSend(v5, "MCWriteToBinaryFile:", v7);

}

- (void)_removeAllProfileEvents
{
  -[MCProfileEventsManager _saveProfileEvents:](self, "_saveProfileEvents:", &__NSArray0__struct);
}

- (MCProfileEventsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
