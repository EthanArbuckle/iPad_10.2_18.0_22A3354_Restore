@implementation CKKSCurrentItemPointer

- (id)initForIdentifier:(id)a3 contextID:(id)a4 currentItemUUID:(id)a5 state:(id)a6 zoneID:(id)a7 encodedCKRecord:(id)a8
{
  id v15;
  id v16;
  id v17;
  CKKSCurrentItemPointer *v18;
  id *p_isa;
  objc_super v21;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CKKSCurrentItemPointer;
  v18 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v21, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("currentitem"), a8, a4, a7);
  p_isa = (id *)&v18->super.super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_state, a6);
    objc_storeStrong(p_isa + 8, a3);
    objc_storeStrong(p_isa + 9, a5);
  }

  return p_isa;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer currentItemUUID](self, "currentItemUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSCurrentItemPointer[%@](%@) %@: %@>"), v3, v5, v6, v7));

  return v8;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("currentitem"));

  if ((v9 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v20, CFSTR("currentitem")));
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v21, 0));

    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recordName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecord name (%@) was not %@"), v23, v24));
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordNameException"), v25, 0));

LABEL_6:
    objc_exception_throw(v22);
  }
  v14 = objc_alloc((Class)CKReference);
  v15 = objc_alloc((Class)CKRecordID);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer currentItemUUID](self, "currentItemUUID"));
  v17 = objc_msgSend(v15, "initWithRecordName:zoneID:", v16, v7);
  v18 = objc_msgSend(v14, "initWithRecordID:action:", v17, 0);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("item"));

  return v6;
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("currentitem"));

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier")),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v7,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer currentItemUUID](self, "currentItemUUID"));
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setFromCKRecord:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordType"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("currentitem"));

  if ((v5 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v11, CFSTR("currentitem")));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v12, 0));

    objc_exception_throw(v13);
  }
  -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordName"));
  -[CKKSCurrentItemPointer setIdentifier:](self, "setIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("item")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordName"));
  -[CKKSCurrentItemPointer setCurrentItemUUID:](self, "setCurrentItemUUID:", v10);

}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[4];

  v13[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  v14[0] = v6;
  v13[1] = CFSTR("identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
  v14[1] = v7;
  v13[2] = CFSTR("ckzone");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
  v14[2] = v9;
  v13[3] = CFSTR("state");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer state](self, "state"));
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));

  return v11;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v26[6];
  _QWORD v27[6];

  v26[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  v27[0] = v6;
  v26[1] = CFSTR("identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
  v27[1] = v7;
  v26[2] = CFSTR("currentItemUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer currentItemUUID](self, "currentItemUUID"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v11 = v10;

  v27[2] = v11;
  v26[3] = CFSTR("state");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer state](self, "state"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v15 = v14;

  v27[3] = v15;
  v26[4] = CFSTR("ckzone");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));

  if (v17)
    v18 = v17;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v27[4] = v19;
  v26[5] = CFSTR("ckrecord");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "base64EncodedStringWithOptions:", 0));

  if (v21)
    v22 = v21;
  else
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v23 = v22;

  v27[5] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 6));

  return v24;
}

- (SecCKKSProcessedState)state
{
  return (SecCKKSProcessedState *)objc_getProperty(self, a2, 56, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)currentItemUUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentItemUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[4];

  v19[0] = CFSTR("contextID");
  v19[1] = CFSTR("identifier");
  v20[0] = a4;
  v20[1] = a3;
  v20[2] = a5;
  v19[2] = CFSTR("state");
  v19[3] = CFSTR("ckzone");
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "zoneName"));
  v20[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v16, a7));
  return v17;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[4];

  v19[0] = CFSTR("contextID");
  v19[1] = CFSTR("identifier");
  v20[0] = a4;
  v20[1] = a3;
  v20[2] = a5;
  v19[2] = CFSTR("state");
  v19[3] = CFSTR("ckzone");
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "zoneName"));
  v20[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v16, a7));
  return v17;
}

+ (id)remoteItemPointers:(id)a3 contextID:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v11[0] = CFSTR("state");
  v11[1] = CFSTR("ckzone");
  v12[0] = CFSTR("remote");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "zoneName"));
  v12[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v8, a5));

  return v9;
}

+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  void *v12;

  v11 = CFSTR("ckzone");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "zoneName"));
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v8, a5));

  return v9;
}

+ (BOOL)deleteAll:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  void *v13;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v12 = CFSTR("ckzone");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));

  v13 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  LOBYTE(a5) = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:](CKKSSQLDatabaseObject, "deleteFromTable:where:connection:error:", v8, v10, 0, a5);

  return (char)a5;
}

+ (id)sqlTable
{
  return CFSTR("currentitems");
}

+ (id)sqlColumns
{
  return &off_10030B648;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  CKKSCurrentItemPointer *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = [CKKSCurrentItemPointer alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "asString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextID")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "asString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("currentItemUUID")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "asString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asString"));
  v8 = objc_alloc((Class)CKRecordZoneID);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzone")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asString"));
  v11 = objc_msgSend(v8, "initWithZoneName:ownerName:", v10, CKCurrentUserDefaultName);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckrecord")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asBase64DecodedData"));
  v14 = -[CKKSCurrentItemPointer initForIdentifier:contextID:currentItemUUID:state:zoneID:encodedCKRecord:](v4, "initForIdentifier:contextID:currentItemUUID:state:zoneID:encodedCKRecord:", v16, v5, v17, v7, v11, v13);

  return v14;
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
  v26[2] = sub_10009A5BC;
  v26[3] = &unk_1002E9DF8;
  v26[4] = &v27;
  v26[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v14, v23, &off_10030B660, 0, 0, -1, v26, a6);

  v24 = v28[3];
  _Block_object_dispose(&v27, 8);

  return v24;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  unsigned int v45;
  id v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  BOOL v53;
  id *v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  unint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  id v64;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  if (!v7)
    goto LABEL_18;
  v55 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
  v58 = 0;
  v15 = objc_claimAutoreleasedReturnValue(+[CKKSCurrentItemPointer tryFromDatabase:contextID:state:zoneID:error:](CKKSCurrentItemPointer, "tryFromDatabase:contextID:state:zoneID:error:", v12, v10, CFSTR("local"), v14, &v58));
  v16 = v58;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "recordName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneID"));
  v57 = v16;
  v21 = objc_claimAutoreleasedReturnValue(+[CKKSCurrentItemPointer tryFromDatabase:contextID:state:zoneID:error:](CKKSCurrentItemPointer, "tryFromDatabase:contextID:state:zoneID:error:", v18, v10, CFSTR("remote"), v20, &v57));
  v22 = v57;

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneName"));
    v26 = sub_10000BDF4(CFSTR("ckksresync"), v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = (unint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "error loading cip: %@", buf, 0xCu);
    }

  }
  if (v15 | v21)
  {
    if ((objc_msgSend((id)v15, "matchesCKRecord:", v9) & 1) != 0
      || (objc_msgSend((id)v21, "matchesCKRecord:", v9) & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "zoneID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneName"));
      v31 = sub_10000BDF4(CFSTR("ckksresync"), v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = (unint64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Already know about this current item pointer, skipping update: %@", buf, 0xCu);
      }

      goto LABEL_27;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "zoneID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "zoneName"));
    v44 = sub_10000BDF4(CFSTR("ckksresync"), v43);
    v37 = objc_claimAutoreleasedReturnValue(v44);

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412802;
    v60 = v15;
    v61 = 2112;
    v62 = v21;
    v63 = 2112;
    v64 = v9;
    v38 = "BUG: Local current item pointer doesn't match resynced CloudKit record(s): %@ %@ %@";
    v39 = v37;
    v40 = 32;
    goto LABEL_16;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneName"));
  v36 = sub_10000BDF4(CFSTR("ckksresync"), v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);

  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v60 = (unint64_t)v9;
    v38 = "BUG: No current item pointer matching resynced CloudKit record: %@";
    v39 = v37;
    v40 = 12;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
  }
LABEL_17:
  a6 = v55;

LABEL_18:
  v15 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]([CKKSCurrentItemPointer alloc], "initWithCKRecord:contextID:", v9, v10);
  objc_msgSend((id)v15, "setState:", CFSTR("remote"));
  v56 = 0;
  v45 = objc_msgSend((id)v15, "saveToDatabase:", &v56);
  v46 = v56;
  if (v45)
    v47 = v46 == 0;
  else
    v47 = 0;
  if (v47)
  {
    v22 = 0;
LABEL_27:
    v53 = 1;
    goto LABEL_29;
  }
  v22 = v46;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "zoneID"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "zoneName"));
  v51 = sub_10000BDF4(CFSTR("currentitem"), v50);
  v52 = objc_claimAutoreleasedReturnValue(v51);

  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v60 = v15;
    v61 = 2112;
    v62 = (uint64_t)v22;
    v63 = 2112;
    v64 = v9;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Couldn't save current item pointer to database: %@: %@ %@", buf, 0x20u);
  }

  if (a6)
  {
    v22 = objc_retainAutorelease(v22);
    v53 = 0;
    *a6 = v22;
  }
  else
  {
    v53 = 0;
  }
LABEL_29:

  return v53;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  const char *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  BOOL v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  const char *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  __CFString *v50;

  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = sub_10000BDF4(CFSTR("currentitem"), v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v48 = CFSTR("currentitem");
    v49 = 2112;
    v50 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CloudKit notification: deleted current item pointer(%@): %@", buf, 0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString recordName](v8, "recordName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  v46 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentItemPointer tryFromDatabase:contextID:state:zoneID:error:](CKKSCurrentItemPointer, "tryFromDatabase:contextID:state:zoneID:error:", v14, v9, CFSTR("remote"), v15, &v46));
  v17 = (__CFString *)v46;

  if (!v17)
  {
    v45 = 0;
    objc_msgSend(v16, "deleteFromDatabase:", &v45);
    v23 = (__CFString *)v45;
    if (v23)
    {
      v17 = v23;
      if (a6)
        *a6 = objc_retainAutorelease(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneName"));
      v26 = sub_10000BDF4(CFSTR("currentitem"), v25);
      v21 = objc_claimAutoreleasedReturnValue(v26);

      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 138412546;
      v48 = v8;
      v49 = 2112;
      v50 = v17;
      v22 = "Failed to delete remote CKKSCurrentItemPointer %@: %@";
      goto LABEL_13;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString recordName](v8, "recordName"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
    v44 = 0;
    v21 = objc_claimAutoreleasedReturnValue(+[CKKSCurrentItemPointer tryFromDatabase:contextID:state:zoneID:error:](CKKSCurrentItemPointer, "tryFromDatabase:contextID:state:zoneID:error:", v29, v9, CFSTR("local"), v30, &v44));
    v17 = (__CFString *)v44;

    if (v17)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "zoneName"));
      v33 = sub_10000BDF4(CFSTR("currentitem"), v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);

      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      *(_DWORD *)buf = 138412546;
      v48 = v8;
      v49 = 2112;
      v50 = v17;
      v35 = "Failed to find local CKKSCurrentItemPointer %@: %@";
    }
    else
    {
      v43 = 0;
      -[NSObject deleteFromDatabase:](v21, "deleteFromDatabase:", &v43);
      v36 = (__CFString *)v43;
      if (!v36)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "zoneName"));
        v42 = sub_10000BDF4(CFSTR("currentitem"), v41);
        v34 = objc_claimAutoreleasedReturnValue(v42);

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v8;
          v49 = 2112;
          v50 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "CKKSCurrentItemPointer was deleted: %@ error: %@", buf, 0x16u);
        }
        v17 = 0;
        v27 = 1;
        goto LABEL_28;
      }
      v17 = v36;
      if (a6)
        *a6 = objc_retainAutorelease(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "zoneName"));
      v39 = sub_10000BDF4(CFSTR("currentitem"), v38);
      v34 = objc_claimAutoreleasedReturnValue(v39);

      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_27:
        v27 = 0;
LABEL_28:

        goto LABEL_15;
      }
      *(_DWORD *)buf = 138412546;
      v48 = v8;
      v49 = 2112;
      v50 = v17;
      v35 = "Failed to delete local CKKSCurrentItemPointer %@: %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, buf, 0x16u);
    goto LABEL_27;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "zoneName"));
  v20 = sub_10000BDF4(CFSTR("currentitem"), v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);

  if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    goto LABEL_14;
  *(_DWORD *)buf = 138412546;
  v48 = v8;
  v49 = 2112;
  v50 = v17;
  v22 = "Failed to find remote CKKSCurrentItemPointer to delete %@: %@";
LABEL_13:
  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);
LABEL_14:
  v27 = 0;
LABEL_15:

  return v27;
}

@end
