@implementation APDBEvent

+ (unint64_t)_currentDayOfYear
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSGregorianCalendar);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = objc_msgSend(v2, "ordinalityOfUnit:inUnit:forDate:", 16, 4, v3);

  return (unint64_t)v4;
}

+ (BOOL)_createEventTableWithManager:(id)a3 dayOfYear:(unint64_t)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v14;

  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS event_%lu (handle TEXT NOT NULL, timestamp REAL DEFAULT NULL, purpose INTEGER DEFAULT NULL, event INTEGER NOT NULL, source INTEGER DEFAULT NULL, unknownSource TEXT DEFAULT NULL, handleSet INTEGER DEFAULT NULL, eventOrder INTEGER DEFAULT NULL, trace TEXT DEFAULT NULL, branchString TEXT DEFAULT NULL, environmentString TEXT DEFAULT NULL, impression INTEGER NOT NULL, propertiesData BLOB DEFAULT NULL, internalPropertiesData BLOB DEFAULT NULL, insertOrder INTEGER NOT NULL, FOREIGN KEY (handle) REFERENCES APDBAdInstance(handle))"), a4));
    v8 = objc_msgSend(v6, "executeQueryFromString:", v7);

  }
  else
  {
    v9 = APLogForCategory(39);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v14 = (id)objc_opt_class(a1);
      v11 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

- (id)tableName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("event_%lu"), +[APDBEvent _currentDayOfYear](APDBEvent, "_currentDayOfYear"));
}

- (Class)rowClass
{
  return (Class)objc_opt_class(APDBEventRow);
}

- (APDBEvent)initWithDatabaseManager:(id)a3
{
  id v4;
  unint64_t v5;
  APDBEvent *v6;
  APDBEvent *v7;
  APUnfairLock *v8;
  APUnfairLock *createTableLock;
  APUnfairLock *v10;
  APUnfairLock *createViewLock;
  APDBEvent *v12;
  objc_super v14;

  v4 = a3;
  v5 = +[APDBEvent _currentDayOfYear](APDBEvent, "_currentDayOfYear");
  if (+[APDBEvent _createEventTableWithManager:dayOfYear:](APDBEvent, "_createEventTableWithManager:dayOfYear:", v4, v5))
  {
    v14.receiver = self;
    v14.super_class = (Class)APDBEvent;
    v6 = -[APDBEvent initWithDatabaseManager:](&v14, "initWithDatabaseManager:", v4);
    v7 = v6;
    if (v6)
    {
      v6->_tableDayOfYear = v5;
      -[APDBEvent _createEventViewForDay:](v6, "_createEventViewForDay:", v5);
      v7->_viewDayOfYear = v5;
      v7->_insertOrder = -[APDBEvent _lastEventInsertOrder](v7, "_lastEventInsertOrder");
      v8 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
      createTableLock = v7->_createTableLock;
      v7->_createTableLock = v8;

      v10 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
      createViewLock = v7->_createViewLock;
      v7->_createViewLock = v10;

    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)insertEventWithHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 adProperties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18 timestamp:(id)a19 purpose:(id)a20 event:(id)a21 source:(id)a22 unknownSource:(id)a23 handleSet:(id)a24 eventOrder:(id)a25 trace:(id)a26 branch:(id)a27 environment:(id)a28 impression:(id)a29 eventProperties:(id)a30 eventInternalProperties:(id)a31
{
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  char *v51;
  void *v52;
  id v53;
  unsigned __int8 v54;
  id v56;
  APDBEventRow *v57;
  APDBEvent *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;

  v63 = a3;
  v62 = a4;
  v81 = a5;
  v37 = a6;
  v80 = a7;
  v79 = a8;
  v38 = a9;
  v39 = a10;
  v78 = a11;
  v77 = a12;
  v76 = a13;
  v75 = a14;
  v74 = a15;
  v73 = a16;
  v72 = a17;
  v71 = a18;
  v70 = a19;
  v69 = a20;
  v68 = a21;
  v67 = a22;
  v66 = a23;
  v65 = a24;
  v64 = a25;
  v40 = a26;
  v41 = a27;
  v42 = a28;
  v43 = a29;
  v44 = a30;
  v45 = a31;
  v60 = v39;
  v61 = v38;
  if (-[APDBEvent _createEventTableIfNeeded](self, "_createEventTableIfNeeded"))
  {
    v58 = self;
    v59 = v37;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
    v47 = objc_msgSend(v46, "getTableForClass:", objc_opt_class(APDBAdInstance));
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

    if (v48)
    {
      v56 = v38;
      v49 = v62;
      v50 = v63;
      if (objc_msgSend(v48, "insertOrUpdateAdInstanceWithHandle:campaign:adGroup:ad:creative:bundleId:searchTermId:adamId:adType:adFormatType:containerType:relay:adMetadata:properties:brand:advertiserCategory:", v63, v62, v81, v59, v80, v79, v56, v39, v78, v77, v76, v75, v74, v73, v72, v71))
      {
        v57 = [APDBEventRow alloc];
        v51 = (char *)-[APDBEvent insertOrder](v58, "insertOrder") + 1;
        -[APDBEvent setInsertOrder:](v58, "setInsertOrder:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v51));
        v53 = -[APDBEventRow initHandle:timestamp:purpose:event:source:unknownSource:handleSet:eventOrder:trace:branch:environment:impression:properties:internalProperties:insertOrder:table:](v57, "initHandle:timestamp:purpose:event:source:unknownSource:handleSet:eventOrder:trace:branch:environment:impression:properties:internalProperties:insertOrder:table:", v63, v70, v69, v68, v67, v66, v65, v64, v40, v41, v42, v43, v44, v45, v52, v58);

        v49 = v62;
        v54 = objc_msgSend(v53, "save");

        v50 = v63;
      }
      else
      {
        v54 = 0;
      }
    }
    else
    {
      v54 = 0;
      v49 = v62;
      v50 = v63;
    }

    v37 = v59;
  }
  else
  {
    v54 = 0;
    v49 = v62;
    v50 = v63;
  }

  return v54;
}

- (BOOL)insertReceivedEventWithHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 adProperties:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  id v23;
  unsigned __int8 v24;
  APDBEventRow *v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (-[APDBEvent _createEventTableIfNeeded](self, "_createEventTableIfNeeded"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
    v18 = objc_msgSend(v17, "getTableForClass:", objc_opt_class(APDBAdInstance));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v19
      && objc_msgSend(v19, "insertAdInstanceWithHandle:bundleId:adamId:adMetadata:properties:", v12, v13, v14, v15, v16))
    {
      v26 = [APDBEventRow alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      v21 = (char *)-[APDBEvent insertOrder](self, "insertOrder") + 1;
      -[APDBEvent setInsertOrder:](self, "setInsertOrder:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
      v23 = -[APDBEventRow initHandle:timestamp:event:impression:insertOrder:table:](v26, "initHandle:timestamp:event:impression:insertOrder:table:", v12, 0, &off_10022A0E0, v20, v22, self);

      v24 = objc_msgSend(v23, "save");
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)insertEvent:(id)a3 handle:(id)a4 impression:(BOOL)a5 timestamp:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  APDBEventRow *v17;
  void *v18;
  char *v19;
  void *v20;
  id v21;
  unsigned __int8 v22;
  id v24;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[APDBEvent _createEventTableIfNeeded](self, "_createEventTableIfNeeded"))
  {
    v13 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("handle"), 3, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
    v24 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v16 = objc_msgSend(v14, "executeInsertQuery:withParameters:", CFSTR("INSERT OR IGNORE INTO APDBAdInstance(handle) VALUES(?)"), v15);

    if (v16 == (id)-1)
    {
      v22 = 0;
    }
    else
    {
      v17 = [APDBEventRow alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
      v19 = (char *)-[APDBEvent insertOrder](self, "insertOrder") + 1;
      -[APDBEvent setInsertOrder:](self, "setInsertOrder:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19));
      v21 = -[APDBEventRow initHandle:timestamp:event:impression:insertOrder:table:](v17, "initHandle:timestamp:event:impression:insertOrder:table:", v11, v12, v10, v18, v20, self);

      v22 = objc_msgSend(v21, "save");
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)allEvents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
  if (!v3)
  {
    v6 = APLogForCategory(39);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v11 = (id)objc_opt_class(self);
      v8 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);

    }
    goto LABEL_7;
  }
  if (!-[APDBEvent createEventViewIfNeeded](self, "createEventViewIfNeeded"))
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ORDER BY insertOrder ASC"), CFSTR("SELECT handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder FROM EventView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeSelectQuery:forTable:withParameters:", v4, self, &__NSArray0__struct));

LABEL_8:
  return v5;
}

- (id)allEventsForHandle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
  if (v5)
  {
    if (!-[APDBEvent createEventViewIfNeeded](self, "createEventViewIfNeeded"))
    {
      v9 = 0;
      goto LABEL_9;
    }
    v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("handle"), 3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ WHERE handle = ? ORDER BY insertOrder ASC"), CFSTR("SELECT handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder FROM EventView")));
    v13 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeSelectQuery:forTable:withParameters:", v7, self, v8));

  }
  else
  {
    v10 = APLogForCategory(39);
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v15 = (id)objc_opt_class(self);
      v11 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);

    }
    v9 = 0;
  }

LABEL_9:
  return v9;
}

- (id)impressionEventsForHandle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
  if (v5)
  {
    if (!-[APDBEvent createEventViewIfNeeded](self, "createEventViewIfNeeded"))
    {
      v9 = 0;
      goto LABEL_9;
    }
    v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("handle"), 3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ WHERE impression = 1 AND handle = ? ORDER BY insertOrder ASC"), CFSTR("SELECT handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder FROM EventView")));
    v13 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeSelectQuery:forTable:withParameters:", v7, self, v8));

  }
  else
  {
    v10 = APLogForCategory(39);
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v15 = (id)objc_opt_class(self);
      v11 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);

    }
    v9 = 0;
  }

LABEL_9:
  return v9;
}

- (id)interactedEventsForHandle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[2];
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
  if (v5)
  {
    if (!-[APDBEvent createEventViewIfNeeded](self, "createEventViewIfNeeded"))
    {
      v10 = 0;
      goto LABEL_9;
    }
    v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("event"), 0, &off_10022A0F8);
    v7 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("handle"), 3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ WHERE event = ? AND handle = ? ORDER BY insertOrder ASC"), CFSTR("SELECT handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder FROM EventView")));
    v14[0] = v6;
    v14[1] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeSelectQuery:forTable:withParameters:", v8, self, v9));

  }
  else
  {
    v11 = APLogForCategory(39);
    v6 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v16 = (id)objc_opt_class(self);
      v12 = v16;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);

    }
    v10 = 0;
  }

LABEL_9:
  return v10;
}

- (BOOL)dropExpiredEventTables
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  void *i;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent _eventViewTableNamesForDay:](self, "_eventViewTableNamesForDay:", +[APDBEvent _currentDayOfYear](APDBEvent, "_currentDayOfYear")));
    v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeSelectStringsQuery:withParameters:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name LIKE 'event_%'"), &__NSArray0__struct));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));
      v18 = v5;
      objc_msgSend(v7, "minusSet:", v5);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        v12 = 1;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DROP TABLE %@"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i)));
            v12 &= objc_msgSend(v3, "executeQueryFromString:", v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }
      else
      {
        LOBYTE(v12) = 1;
      }

      v5 = v18;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    v15 = APLogForCategory(39);
    v5 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v25 = (id)objc_opt_class(self);
      v16 = v25;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);

    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)createEventViewIfNeeded
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent createViewLock](self, "createViewLock"));
  objc_msgSend(v3, "lock");
  v4 = +[APDBEvent _currentDayOfYear](APDBEvent, "_currentDayOfYear");
  if ((void *)-[APDBEvent viewDayOfYear](self, "viewDayOfYear") != v4)
  {
    if (!-[APDBEvent _createEventViewForDay:](self, "_createEventViewForDay:", v4))
    {
      v5 = 0;
      goto LABEL_6;
    }
    -[APDBEvent setViewDayOfYear:](self, "setViewDayOfYear:", v4);
  }
  v5 = 1;
LABEL_6:
  objc_msgSend(v3, "unlock");

  return v5;
}

- (BOOL)_createEventTableIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent createTableLock](self, "createTableLock"));
  objc_msgSend(v3, "lock");
  v4 = +[APDBEvent _currentDayOfYear](APDBEvent, "_currentDayOfYear");
  if ((void *)-[APDBEvent tableDayOfYear](self, "tableDayOfYear") != v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
    v6 = +[APDBEvent _createEventTableWithManager:dayOfYear:](APDBEvent, "_createEventTableWithManager:dayOfYear:", v5, v4);

    if (!v6)
    {
      v7 = 0;
      goto LABEL_6;
    }
    -[APDBEvent setTableDayOfYear:](self, "setTableDayOfYear:", v4);
  }
  v7 = 1;
LABEL_6:
  objc_msgSend(v3, "unlock");

  return v7;
}

- (id)_eventViewTableNamesForDay:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v27;
  uint8_t buf[4];
  id v29;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
  v6 = v5;
  if (v5)
  {
    v27 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeSelectStringsQuery:withParameters:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name LIKE 'event_%'"), &__NSArray0__struct));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

    v9 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSGregorianCalendar);
    v10 = objc_alloc_init((Class)NSDateComponents);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = -[APDBEvent _expirationOfData](self, "_expirationOfData");
    if (v12 >= 1)
    {
      v13 = 0;
      v14 = 1 - v12;
      do
      {
        v15 = (id)(a3 + v13);
        if ((uint64_t)(a3 + v13) <= 0)
        {
          objc_msgSend(v10, "setDay:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v10, v16, 0));

          v15 = objc_msgSend(v9, "ordinalityOfUnit:inUnit:forDate:", 16, 4, v17);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("event_%lu"), v15));
        if (objc_msgSend(v8, "containsObject:", v18))
          objc_msgSend(v11, "addObject:", v18);
        v19 = objc_msgSend(v8, "count");
        v20 = objc_msgSend(v11, "count");

        if (v19 == v20)
          break;
      }
      while (v14 != v13--);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v11));

    v6 = v27;
  }
  else
  {
    v23 = APLogForCategory(39);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v29 = (id)objc_opt_class(self);
      v25 = v29;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);

    }
    v22 = &__NSArray0__struct;
  }

  return v22;
}

- (id)_createEventViewQueryForDay:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent _eventViewTableNamesForDay:](self, "_eventViewTableNamesForDay:", a3));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), CFSTR("handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), (_QWORD)v14));
          objc_msgSend(v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" UNION ")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TEMP VIEW IF NOT EXISTS EventView (%@) AS %@"), CFSTR("handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder"), v11));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_createEventViewForDay:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  unsigned __int8 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  int v14;
  id v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
  if (!v5)
  {
    v8 = APLogForCategory(39);
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v14 = 138477827;
      v15 = (id)objc_opt_class(self);
      v9 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v14, 0xCu);

    }
    goto LABEL_10;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[APDBEvent _createEventViewQueryForDay:](self, "_createEventViewQueryForDay:", a3));
  if (!v6)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v5, "executeQueryFromString:", CFSTR("DROP VIEW IF EXISTS EventView")) & 1) == 0)
  {
    v10 = APLogForCategory(39);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 138477827;
      v15 = (id)objc_opt_class(self);
      v12 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{private}@]: Error, could not drop Event View.", (uint8_t *)&v14, 0xCu);

    }
    goto LABEL_10;
  }
  v7 = objc_msgSend(v5, "executeQueryFromString:", v6);
LABEL_11:

  return v7;
}

- (int64_t)_lastEventInsertOrder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEvent manager](self, "manager"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeSelectNumberQuery:withParameters:", CFSTR("SELECT insertOrder FROM EventView ORDER BY insertOrder DESC LIMIT 1"), &__NSArray0__struct));
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "integerValue");
    else
      v7 = 0;

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
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v12, 0xCu);

    }
    v7 = 0;
  }

  return (int64_t)v7;
}

- (int64_t)_expirationOfData
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v2 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APCSEventDatabase));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "expirationOfData"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "expirationOfData"));
    v6 = (int64_t)objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = 30;
  }

  return v6;
}

- (unint64_t)tableDayOfYear
{
  return self->_tableDayOfYear;
}

- (void)setTableDayOfYear:(unint64_t)a3
{
  self->_tableDayOfYear = a3;
}

- (unint64_t)viewDayOfYear
{
  return self->_viewDayOfYear;
}

- (void)setViewDayOfYear:(unint64_t)a3
{
  self->_viewDayOfYear = a3;
}

- (int64_t)insertOrder
{
  return self->_insertOrder;
}

- (void)setInsertOrder:(int64_t)a3
{
  self->_insertOrder = a3;
}

- (APUnfairLock)createTableLock
{
  return self->_createTableLock;
}

- (void)setCreateTableLock:(id)a3
{
  objc_storeStrong((id *)&self->_createTableLock, a3);
}

- (APUnfairLock)createViewLock
{
  return self->_createViewLock;
}

- (void)setCreateViewLock:(id)a3
{
  objc_storeStrong((id *)&self->_createViewLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createViewLock, 0);
  objc_storeStrong((id *)&self->_createTableLock, 0);
}

@end
