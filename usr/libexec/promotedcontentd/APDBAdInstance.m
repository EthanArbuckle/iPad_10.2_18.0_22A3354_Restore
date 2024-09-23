@implementation APDBAdInstance

- (Class)rowClass
{
  return (Class)objc_opt_class(APDBAdInstanceRow);
}

- (BOOL)insertAdInstanceWithHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 properties:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  unsigned __int8 v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  int v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstance manager](self, "manager"));

  if (!v17)
  {
    v20 = APLogForCategory(39);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v26 = 138477827;
      v27 = (id)objc_opt_class(self);
      v22 = v27;
      v23 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v26, 0xCu);

    }
LABEL_9:

    v19 = 0;
    goto LABEL_10;
  }
  if (!v12)
  {
    v24 = APLogForCategory(39);
    v21 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v26 = 138477827;
      v27 = (id)objc_opt_class(self);
      v22 = v27;
      v23 = "[%{private}@]: Error storing Ad Instance, NONNULL params are NULL";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v18 = -[APDBAdInstanceRow initHandle:bundleId:adamId:adMetadata:properties:table:]([APDBAdInstanceRow alloc], "initHandle:bundleId:adamId:adMetadata:properties:table:", v12, v13, v14, v15, v16, self);
  v19 = objc_msgSend(v18, "save");

LABEL_10:
  return v19;
}

- (BOOL)insertOrUpdateAdInstanceWithHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 properties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  APDBAdInstance *v50;
  unsigned __int8 v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  id v61;

  v59 = a3;
  v58 = a4;
  v57 = a5;
  v56 = a6;
  v54 = a7;
  v49 = a8;
  v55 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v29 = a15;
  v52 = a16;
  v30 = a17;
  v31 = a18;
  v50 = self;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstance manager](self, "manager"));

  v53 = v24;
  if (v32)
  {
    if (v59)
    {
      v46 = v30;
      v33 = v30;
      v34 = v52;
      v45 = v24;
      v35 = v49;
      v36 = -[APDBAdInstanceRow initHandle:campaign:adGroup:ad:creative:bundleId:searchTermId:adamId:adType:adFormatType:containerType:relay:adMetadata:properties:brand:advertiserCategory:table:]([APDBAdInstanceRow alloc], "initHandle:campaign:adGroup:ad:creative:bundleId:searchTermId:adamId:adType:adFormatType:containerType:relay:adMetadata:properties:brand:advertiserCategory:table:", v59, v58, v57, v56, v54, v49, v55, v45, v25, v26, v27, v28, v29, v52, v46, v31,
              v50);
      v51 = objc_msgSend(v36, "insertOrUpdateIgnoringNilColumns");

    }
    else
    {
      v48 = v25;
      v35 = v49;
      v41 = APLogForCategory(39);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v61 = (id)objc_opt_class(self);
        v43 = v61;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "[%{private}@]: Error storing Ad Instance, NONNULL params are NULL", buf, 0xCu);

      }
      v51 = 0;
      v25 = v48;
      v33 = v30;
      v34 = v52;
    }
    v40 = v59;
  }
  else
  {
    v47 = v25;
    v35 = v49;
    v37 = APLogForCategory(39);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v61 = (id)objc_opt_class(self);
      v39 = v61;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nill.", buf, 0xCu);

    }
    v51 = 0;
    v40 = v59;
    v25 = v47;
    v33 = v30;
    v34 = v52;
  }

  return v51;
}

- (id)adInstanceForHandle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  NSObject *v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstance manager](self, "manager"));
  if (!v5)
  {
    v10 = APLogForCategory(39);
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v17 = (id)objc_opt_class(self);
      v11 = v17;
      v12 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

    }
LABEL_10:
    v9 = 0;
    goto LABEL_13;
  }
  if (!v4)
  {
    v13 = APLogForCategory(11);
    v6 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v17 = (id)objc_opt_class(self);
      v11 = v17;
      v12 = "[%{private}@]: Error getting adInstance for handle, NONNULL params are NULL";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("handle"), 3, v4);
  v15 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeSelectQuery:forTable:withParameters:", CFSTR("SELECT rowid, * FROM APDBAdInstance WHERE handle = ?"), self, v7));

  if (v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  else
    v9 = 0;

LABEL_13:
  return v9;
}

- (id)adInstancesForAdamId:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstance manager](self, "manager"));
  if (!v5)
  {
    v9 = APLogForCategory(39);
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v16 = (id)objc_opt_class(self);
      v10 = v16;
      v11 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);

    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (!v4)
  {
    v12 = APLogForCategory(11);
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v16 = (id)objc_opt_class(self);
      v10 = v16;
      v11 = "[%{private}@]: Error getting adInstance for adamId, NONNULL params are NULL";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("adamId"), 3, v4);
  v14 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeSelectQuery:forTable:withParameters:", CFSTR("SELECT rowid, * FROM APDBAdInstance WHERE adamId = ?"), self, v7));

LABEL_10:
  return v8;
}

- (BOOL)deleteAdInstancesWithNoEvents
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBAdInstance manager](self, "manager"));
  if (v3)
  {
    v4 = objc_msgSend(v3, "getTableForClass:", objc_opt_class(APDBEvent));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "createEventViewIfNeeded");
      v7 = objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("DELETE FROM APDBAdInstance WHERE handle IN (SELECT APDBAdInstance.handle FROM APDBAdInstance LEFT JOIN EventView ON APDBAdInstance.handle = EventView.handle WHERE EventView.handle IS NULL)"), &__NSArray0__struct);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v8 = APLogForCategory(39);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138477827;
      v13 = (id)objc_opt_class(self);
      v10 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nill.", (uint8_t *)&v12, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

@end
