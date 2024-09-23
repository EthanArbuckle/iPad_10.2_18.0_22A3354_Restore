@implementation CKKSIncomingQueueEntry

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contextID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry action](self, "action"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry state](self, "state"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%@](%@): %@ %@ (%@)>"), v5, v6, v9, v10, v12, v13));

  return v14;
}

- (CKKSIncomingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKKSIncomingQueueEntry *v12;
  CKKSIncomingQueueEntry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSIncomingQueueEntry;
  v12 = -[CKKSIncomingQueueEntry init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_item, a3);
    objc_storeStrong((id *)&v13->_action, a4);
    objc_storeStrong((id *)&v13->_state, a5);
  }

  return v13;
}

- (NSString)contextID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contextID"));

  return (NSString *)v3;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuid"));

  return (NSString *)v3;
}

- (void)setUuid:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  objc_msgSend(v5, "setUuid:", v4);

}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];

  v11[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry contextID](self, "contextID"));
  v12[0] = v3;
  v11[1] = CFSTR("UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry uuid](self, "uuid"));
  v12[1] = v4;
  v11[2] = CFSTR("state");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry state](self, "state"));
  v12[2] = v5;
  v11[3] = CFSTR("ckzone");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
  v12[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));

  return v9;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sqlValues"));
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry action](self, "action"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("action"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry state](self, "state"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("state"));

  return v5;
}

- (CKKSItem)item
{
  return (CKKSItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)action
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28[0] = CFSTR("contextID");
  v13 = v11;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v29[0] = v16;
  v28[1] = CFSTR("UUID");
  v17 = v10;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v29[1] = v20;
  v28[2] = CFSTR("ckzone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v25, a6));

  return v26;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28[0] = CFSTR("contextID");
  v13 = v11;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v29[0] = v16;
  v28[1] = CFSTR("UUID");
  v17 = v10;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v29[1] = v20;
  v28[2] = CFSTR("ckzone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v25, a6));

  return v26;
}

+ (id)fetch:(int64_t)a3 startingAtUUID:(id)a4 state:(id)a5 action:(id)a6 contextID:(id)a7 zoneID:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  _QWORD v40[3];

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v37 = CFSTR("contextID");
  v18 = v16;
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v20;

  v40[0] = v21;
  v38 = CFSTR("state");
  v22 = v14;
  v23 = v22;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v25 = v24;

  v40[1] = v25;
  v39 = CFSTR("ckzone");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
  v27 = v26;
  if (v26)
    v28 = v26;
  else
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v29 = v28;

  v40[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, &v37, 3));
  v31 = objc_msgSend(v30, "mutableCopy");

  objc_msgSend(v31, "setObject:forKeyedSubscript:", v15, CFSTR("action"));
  if (v13)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSSQLWhereValue op:value:](CKKSSQLWhereValue, "op:value:", 3, v13));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("UUID"));

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetch:where:orderBy:error:", a3, v31, &off_10030B588, a9, a1, a3, a9, v37, v38));

  return v33;
}

+ (id)sqlTable
{
  return CFSTR("incomingqueue");
}

+ (id)sqlColumns
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem sqlColumns](CKKSItem, "sqlColumns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayByAddingObjectsFromArray:", &off_10030B5A0));

  return v3;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  CKKSIncomingQueueEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKKSIncomingQueueEntry *v10;

  v3 = a3;
  v4 = [CKKSIncomingQueueEntry alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem fromDatabaseRow:](CKKSItem, "fromDatabaseRow:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asString"));
  v10 = -[CKKSIncomingQueueEntry initWithCKKSItem:action:state:](v4, "initWithCKKSItem:action:state:", v5, v7, v9);

  return v10;
}

+ (id)countsByStateWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v25[0] = CFSTR("contextID");
  v13 = v8;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v25[1] = CFSTR("ckzone");
  v26[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));

  if (v17)
    v18 = v17;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v26[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000776FC;
  v23[3] = &unk_1002DE3E0;
  v21 = v10;
  v24 = v21;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v12, v20, &off_10030B5B8, &off_10030B5D0, 0, -1, v23, a5);

  return v21;
}

+ (int64_t)countByState:(id)a3 contextID:(id)a4 zone:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int64_t v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -1;
  v13 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v31[0] = CFSTR("contextID");
  v15 = v11;
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18 = v17;

  v32[0] = v18;
  v31[1] = CFSTR("ckzone");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v20 = v19;
  if (v19)
    v21 = v19;
  else
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22 = v21;

  v31[2] = CFSTR("state");
  v32[1] = v22;
  v32[2] = v10;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
  v26[1] = 3221225472;
  v26[2] = sub_1000776AC;
  v26[3] = &unk_1002E9DF8;
  v26[4] = &v27;
  v26[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v14, v23, &off_10030B5E8, 0, 0, -1, v26, a6);

  v24 = v28[3];
  _Block_object_dispose(&v27, 8);

  return v24;
}

+ (id)countNewEntriesByKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[3];
  _QWORD v26[3];

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v25[0] = CFSTR("contextID");
  v13 = v8;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v26[0] = v16;
  v25[1] = CFSTR("ckzone");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));

  if (v17)
    v18 = v17;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v25[2] = CFSTR("state");
  v26[1] = v19;
  v26[2] = CFSTR("new");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100077608;
  v23[3] = &unk_1002DE3E0;
  v21 = v10;
  v24 = v21;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v12, v20, &off_10030B600, &off_10030B618, 0, -1, v23, a5);

  return v21;
}

+ (BOOL)allIQEsHaveValidUnwrappingKeysInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v7 = a3;
  v8 = a4;
  v38 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSSQLDatabaseObject allParentKeyUUIDsInContextID:zoneID:error:](CKKSIncomingQueueEntry, "allParentKeyUUIDsInContextID:zoneID:error:", v7, v8, &v38));
  v10 = v38;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
    v12 = sub_10000BDF4(CFSTR("ckkskey"), v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to find IQE parent keys: %@", buf, 0xCu);
    }

    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
    goto LABEL_27;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (!v16)
  {
    v14 = 1;
    goto LABEL_26;
  }
  v17 = v16;
  v31 = a5;
  v32 = v9;
  v18 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v35 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
      v33 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v20, v7, v8, &v33, v31));
      v22 = v33;
      if (v22)
      {
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
        v25 = sub_10000BDF4(CFSTR("ckksheal"), v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);

        v9 = v32;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v23;
          v41 = 2112;
          v42 = v20;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to find key %@: %@", buf, 0x16u);
        }

        if (v31)
        {
          v23 = objc_retainAutorelease(v23);
          *v31 = v23;
        }
        goto LABEL_25;
      }
      if (!v21)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
        v28 = sub_10000BDF4(CFSTR("ckkskey"), v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);

        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v20;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Some item is encrypted under a non-existent key(%@).", buf, 0xCu);
        }

        v23 = 0;
        v21 = 0;
        v9 = v32;
LABEL_25:

        v14 = 0;
        v10 = 0;
        goto LABEL_26;
      }

    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    v14 = 1;
    v9 = v32;
    v10 = 0;
    if (v17)
      continue;
    break;
  }
LABEL_26:

LABEL_27:
  return v14;
}

@end
