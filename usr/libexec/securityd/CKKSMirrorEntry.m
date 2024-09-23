@implementation CKKSMirrorEntry

- (CKKSMirrorEntry)initWithCKKSItem:(id)a3
{
  id v5;
  CKKSMirrorEntry *v6;
  CKKSMirrorEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSMirrorEntry;
  v6 = -[CKKSMirrorEntry init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    v7->_wasCurrent = 0;
  }

  return v7;
}

- (CKKSMirrorEntry)initWithCKRecord:(id)a3 contextID:(id)a4
{
  id v6;
  id v7;
  CKKSMirrorEntry *v8;
  CKKSItem *v9;
  CKKSItem *item;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKKSMirrorEntry;
  v8 = -[CKKSMirrorEntry init](&v13, "init");
  if (v8)
  {
    v9 = -[CKKSItem initWithCKRecord:contextID:]([CKKSItem alloc], "initWithCKRecord:contextID:", v6, v7);
    item = v8->_item;
    v8->_item = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server_wascurrent")));
    v8->_wasCurrent = (unint64_t)objc_msgSend(v11, "unsignedLongLongValue");

  }
  return v8;
}

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

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%@](%@): %@>"), v5, v7, v10, v12));

  return v13;
}

- (void)setFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  objc_msgSend(v5, "setFromCKRecord:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("server_wascurrent")));
  self->_wasCurrent = (unint64_t)objc_msgSend(v6, "unsignedLongLongValue");

}

- (BOOL)matchesCKRecord:(id)a3
{
  return -[CKKSMirrorEntry matchesCKRecord:checkServerFields:](self, "matchesCKRecord:checkServerFields:", a3, 1);
}

- (BOOL)matchesCKRecord:(id)a3 checkServerFields:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  uint8_t v16[16];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v8 = objc_msgSend(v7, "matchesCKRecord:", v6);

  if (v8 && v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server_wascurrent")));
    if ((v9 || -[CKKSMirrorEntry wasCurrent](self, "wasCurrent"))
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server_wascurrent"))),
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[CKKSMirrorEntry wasCurrent](self, "wasCurrent"))), v12 = objc_msgSend(v10, "isEqual:", v11), v11, v10, v9, (v12 & 1) == 0))
    {
      v13 = sub_10000BDF4(CFSTR("ckksitem"), 0);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v16 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "was_current does not match", v16, 2u);
      }

      LOBYTE(v8) = 0;
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuid"));

  return (NSString *)v3;
}

- (void)setUuid:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  objc_msgSend(v5, "setUuid:", v4);

}

- (id)whereClauseToFindSelf
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "whereClauseToFindSelf"));

  return v3;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sqlValues"));
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[CKKSMirrorEntry wasCurrent](self, "wasCurrent")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("wascurrent"));

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

- (unint64_t)wasCurrent
{
  return self->_wasCurrent;
}

- (void)setWasCurrent:(unint64_t)a3
{
  self->_wasCurrent = a3;
}

- (void).cxx_destruct
{
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

+ (id)allWithUUID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v8 = a3;
  v20[0] = CFSTR("contextID");
  v9 = a4;
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v12 = v11;

  v20[1] = CFSTR("UUID");
  v21[0] = v12;
  v13 = v8;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v21[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v17, a5));

  return v18;
}

+ (id)sqlTable
{
  return CFSTR("ckmirror");
}

+ (id)sqlColumns
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem sqlColumns](CKKSItem, "sqlColumns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayByAddingObjectsFromArray:", &off_10030B690));

  return v3;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  CKKSMirrorEntry *v4;
  void *v5;
  CKKSMirrorEntry *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = [CKKSMirrorEntry alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem fromDatabaseRow:](CKKSItem, "fromDatabaseRow:", v3));
  v6 = -[CKKSMirrorEntry initWithCKKSItem:](v4, "initWithCKKSItem:", v5);

  v7 = objc_alloc_init((Class)NSNumberFormatter);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wascurrent")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "numberFromString:", v9));
  -[CKKSMirrorEntry setWasCurrent:](v6, "setWasCurrent:", objc_msgSend(v10, "unsignedLongLongValue"));

  return v6;
}

+ (id)countsByParentKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
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
  v23[2] = sub_1000AA0C8;
  v23[3] = &unk_1002DE3E0;
  v21 = v10;
  v24 = v21;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v12, v20, &off_10030B6A8, &off_10030B6C0, 0, -1, v23, a5);

  return v21;
}

+ (id)countsByZoneNameWithContextID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  const __CFString *v19;
  void *v20;

  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v19 = CFSTR("contextID");
  v10 = v6;
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  v20 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AA024;
  v17[3] = &unk_1002DE3E0;
  v15 = v7;
  v18 = v15;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v9, v14, &off_10030B6D8, &off_10030B6F0, 0, -1, v17, a4);

  return v15;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000A9FB0;
  v28 = sub_1000A9FC0;
  v29 = 0;
  v10 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v30[0] = CFSTR("contextID");
  v12 = v8;
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v15 = v14;

  v31[0] = v15;
  v30[1] = CFSTR("ckzone");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v31[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
  v23[1] = 3221225472;
  v23[2] = sub_1000A9FC8;
  v23[3] = &unk_1002E9DF8;
  v23[4] = &v24;
  v23[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v11, v20, &off_10030B708, 0, 0, -1, v23, a5);

  v21 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v21;
}

+ (id)pcsMirrorKeysForService:(id)a3 matchingKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  const __CFString *v21;
  id v22;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v21 = CFSTR("pcss");
  v22 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A9F44;
  v18[3] = &unk_1002DCAA0;
  v19 = v8;
  v13 = v10;
  v20 = v13;
  v14 = v8;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v11, v12, &off_10030B720, 0, &off_10030B738, 0, v18, a5);

  v15 = v20;
  v16 = v13;

  return v16;
}

@end
