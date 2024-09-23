@implementation APDBAdInstanceRow

- (id)readOnlyColumns
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("relay"), CFSTR("properties"), CFSTR("allEvents"), CFSTR("impressionEvents"), CFSTR("interactedEvents"), 0));
  v8.receiver = self;
  v8.super_class = (Class)APDBAdInstanceRow;
  v4 = -[APDBAdInstanceRow readOnlyColumns](&v8, "readOnlyColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setByAddingObjectsFromSet:", v5));

  return v6;
}

- (NSDictionary)relay
{
  return (NSDictionary *)-[APDBAdInstanceRow dictionaryFromBlobForColumnName:](self, "dictionaryFromBlobForColumnName:", CFSTR("relayData"));
}

- (void)setRelay:(id)a3
{
  -[APDBAdInstanceRow setDictionary:forBlobColumnName:](self, "setDictionary:forBlobColumnName:", a3, CFSTR("relayData"));
}

- (NSDictionary)properties
{
  return (NSDictionary *)-[APDBAdInstanceRow dictionaryFromBlobForColumnName:](self, "dictionaryFromBlobForColumnName:", CFSTR("propertiesData"));
}

- (void)setProperties:(id)a3
{
  -[APDBAdInstanceRow setDictionary:forBlobColumnName:](self, "setDictionary:forBlobColumnName:", a3, CFSTR("propertiesData"));
}

- (id)initHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 properties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18 table:(id)a19
{
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v24 = a3;
  v25 = a4;
  v26 = a5;
  v45 = a6;
  v44 = a7;
  v43 = a8;
  v42 = a9;
  v41 = a10;
  v27 = v26;
  v40 = a11;
  v28 = v25;
  v39 = a12;
  v29 = a13;
  v30 = a14;
  v31 = a15;
  v32 = a16;
  v33 = a17;
  v34 = a18;
  v46.receiver = self;
  v46.super_class = (Class)APDBAdInstanceRow;
  v35 = -[APDBAdInstanceRow initAsNewObjectWithTable:](&v46, "initAsNewObjectWithTable:", a19);
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "setValue:forColumnName:", v24, CFSTR("handle"));
    objc_msgSend(v36, "setValue:forColumnName:", v28, CFSTR("campaign"));
    objc_msgSend(v36, "setValue:forColumnName:", v27, CFSTR("adGroup"));
    objc_msgSend(v36, "setValue:forColumnName:", v45, CFSTR("ad"));
    objc_msgSend(v36, "setValue:forColumnName:", v44, CFSTR("creative"));
    objc_msgSend(v36, "setValue:forColumnName:", v43, CFSTR("bundleId"));
    objc_msgSend(v36, "setValue:forColumnName:", v42, CFSTR("searchTermId"));
    objc_msgSend(v36, "setValue:forColumnName:", v41, CFSTR("adamId"));
    objc_msgSend(v36, "setValue:forColumnName:", v40, CFSTR("adType"));
    objc_msgSend(v36, "setValue:forColumnName:", v39, CFSTR("adFormatType"));
    objc_msgSend(v36, "setValue:forColumnName:", v29, CFSTR("containerType"));
    objc_msgSend(v36, "setRelay:", v30);
    objc_msgSend(v36, "setValue:forColumnName:", v31, CFSTR("adMetadata"));
    objc_msgSend(v36, "setProperties:", v32);
    objc_msgSend(v36, "setValue:forColumnName:", v33, CFSTR("brand"));
    objc_msgSend(v36, "setValue:forColumnName:", v34, CFSTR("advertiserCategory"));
  }

  return v36;
}

- (id)initHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 properties:(id)a7 table:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)APDBAdInstanceRow;
  v17 = -[APDBAdInstanceRow initAsNewObjectWithTable:](&v20, "initAsNewObjectWithTable:", a8);
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "setValue:forColumnName:", v13, CFSTR("handle"));
    objc_msgSend(v18, "setValue:forColumnName:", v14, CFSTR("bundleId"));
    objc_msgSend(v18, "setValue:forColumnName:", v15, CFSTR("adMetadata"));
    objc_msgSend(v18, "setProperties:", v16);
  }

  return v18;
}

- (NSArray)allEvents
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow table](self, "table"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manager"));

  if (v4)
  {
    v5 = objc_msgSend(v4, "getTableForClass:", objc_opt_class(APDBEvent));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow handle](self, "handle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allEventsForHandle:", v7));

  }
  else
  {
    v9 = APLogForCategory(39);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138477827;
      v14 = (id)objc_opt_class(self);
      v11 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v13, 0xCu);

    }
    v8 = 0;
  }

  return (NSArray *)v8;
}

- (NSArray)impressionEvents
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow table](self, "table"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manager"));

  if (v4)
  {
    v5 = objc_msgSend(v4, "getTableForClass:", objc_opt_class(APDBEvent));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow handle](self, "handle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "impressionEventsForHandle:", v7));

  }
  else
  {
    v9 = APLogForCategory(39);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138477827;
      v14 = (id)objc_opt_class(self);
      v11 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v13, 0xCu);

    }
    v8 = 0;
  }

  return (NSArray *)v8;
}

- (NSArray)interactedEvents
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow table](self, "table"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manager"));

  if (v4)
  {
    v5 = objc_msgSend(v4, "getTableForClass:", objc_opt_class(APDBEvent));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow handle](self, "handle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactedEventsForHandle:", v7));

  }
  else
  {
    v9 = APLogForCategory(39);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138477827;
      v14 = (id)objc_opt_class(self);
      v11 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v13, 0xCu);

    }
    v8 = 0;
  }

  return (NSArray *)v8;
}

- (BOOL)insertOrUpdateIgnoringNilColumns
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  APDBAdInstanceRow *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  void *v28;
  NSObject *obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _BYTE v35[128];
  _QWORD v36[15];
  uint8_t buf[4];
  id v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow table](self, "table"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manager"));

  if (v4)
  {
    v28 = v4;
    v36[0] = CFSTR("campaign");
    v36[1] = CFSTR("adGroup");
    v36[2] = CFSTR("ad");
    v36[3] = CFSTR("creative");
    v36[4] = CFSTR("bundleId");
    v36[5] = CFSTR("searchTermId");
    v36[6] = CFSTR("adamId");
    v36[7] = CFSTR("adType");
    v36[8] = CFSTR("adFormatType");
    v36[9] = CFSTR("containerType");
    v36[10] = CFSTR("relayData");
    v36[11] = CFSTR("adMetadata");
    v36[12] = CFSTR("propertiesData");
    v36[13] = CFSTR("brand");
    v36[14] = CFSTR("advertiserCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 15));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v8 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow columns](self, "columns"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("handle")));

    objc_msgSend(v7, "addObject:", v10);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("COALESCE((SELECT %@ FROM APDBAdInstance WHERE handle = ?), ?)"), v15));
          objc_msgSend(v6, "addObject:", v16);

          v34[0] = v10;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstanceRow columns](v8, "columns"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v15));
          v34[1] = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
          objc_msgSend(v7, "addObjectsFromArray:", v19);

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v12);
    }
    v20 = obj;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject componentsJoinedByString:](obj, "componentsJoinedByString:", CFSTR(", ")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", ")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO APDBAdInstance (handle, %@) VALUES (?, %@)"), v21, v22));

    v4 = v28;
    v24 = objc_msgSend(v28, "executeInsertQuery:withParameters:", v23, v7) != 0;

  }
  else
  {
    v25 = APLogForCategory(39);
    v20 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v38 = (id)objc_opt_class(self);
      v26 = v38;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);

    }
    v24 = 0;
  }

  return v24;
}

- (NSData)relayData
{
  return self->_relayData;
}

- (void)setRelayData:(id)a3
{
  objc_storeStrong((id *)&self->_relayData, a3);
}

- (NSData)propertiesData
{
  return self->_propertiesData;
}

- (void)setPropertiesData:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesData, 0);
  objc_storeStrong((id *)&self->_relayData, 0);
}

@end
