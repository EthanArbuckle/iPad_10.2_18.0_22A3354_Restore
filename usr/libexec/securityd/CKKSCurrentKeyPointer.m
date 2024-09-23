@implementation CKKSCurrentKeyPointer

- (id)initForClass:(id)a3 contextID:(id)a4 currentKeyUUID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7
{
  id v13;
  id v14;
  CKKSCurrentKeyPointer *v15;
  id *p_isa;
  void *v17;
  id v18;
  NSObject *v19;
  uint8_t v21[16];
  objc_super v22;

  v13 = a3;
  v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CKKSCurrentKeyPointer;
  v15 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v22, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("currentkey"), a7, a4, a6);
  p_isa = (id *)&v15->super.super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_keyclass, a3);
    objc_storeStrong(p_isa + 8, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "currentKeyUUID"));

    if (!v17)
    {
      v18 = sub_10000BDF4(CFSTR("currentkey"), 0);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "created a CKKSCurrentKey with a nil currentKeyUUID. Why?", v21, 2u);
      }

    }
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSCurrentKeyPointer(%@, %@) %@: %@>"), v4, v5, v6, v7));

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKKSCurrentKeyPointer;
  v5 = -[CKKSCKRecordHolder copyWithZone:](&v11, "copyWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setKeyclass:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setCurrentKeyUUID:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;

  v5 = a3;
  v6 = objc_opt_class(CKKSCurrentKeyPointer);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      v13 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
    if (v10 || (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentKeyUUID"))) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentKeyUUID"));
      if (!objc_msgSend(v11, "isEqual:", v3))
      {
        v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v21 = v11;
      v12 = 1;
    }
    else
    {
      v22 = 0;
      v12 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
    if (v14 || (v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyclass"))) != 0)
    {
      v23 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass", v19));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyclass"));
      v13 = objc_msgSend(v15, "isEqual:", v16);

      if (v14)
      {

        if (v23)
        {
          v11 = v21;
          goto LABEL_19;
        }
LABEL_20:
        if (!v10)

        goto LABEL_23;
      }
      LOBYTE(v12) = v23;
      v17 = v20;
    }
    else
    {
      v17 = 0;
      v13 = 1;
    }

    v11 = v21;
    if ((v12 & 1) != 0)
      goto LABEL_19;
    goto LABEL_20;
  }
  v13 = 0;
LABEL_24:

  return v13;
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
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("currentkey"));

  if ((v9 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v20, CFSTR("currentkey")));
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v21, 0));

    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recordName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecord name (%@) was not %@"), v23, v24));
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordNameException"), v25, 0));

LABEL_6:
    objc_exception_throw(v22);
  }
  v14 = objc_alloc((Class)CKReference);
  v15 = objc_alloc((Class)CKRecordID);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  v17 = objc_msgSend(v15, "initWithRecordName:zoneID:", v16, v7);
  v18 = objc_msgSend(v14, "initWithRecordID:action:", v17, 0);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("parentkeyref"));

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
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("currentkey"));

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass")),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v7,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
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
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("currentkey"));

  if ((v6 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v15, CFSTR("currentkey")));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v16, 0));

    objc_exception_throw(v17);
  }
  -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
  -[CKKSCurrentKeyPointer setKeyclass:](self, "setKeyclass:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
  -[CKKSCurrentKeyPointer setCurrentKeyUUID:](self, "setCurrentKeyUUID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  if (!v12)
  {
    v13 = sub_10000BDF4(CFSTR("currentkey"), 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No current key UUID in record! How/why? %@", buf, 0xCu);
    }

  }
}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v10[0] = v3;
  v9[1] = CFSTR("keyclass");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  v10[1] = v4;
  v9[2] = CFSTR("ckzone");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];

  v19[0] = CFSTR("keyclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  v20[0] = v3;
  v19[1] = CFSTR("contextID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v20[1] = v4;
  v19[2] = CFSTR("currentKeyUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v8 = v7;

  v20[2] = v8;
  v19[3] = CFSTR("ckzone");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));

  if (v10)
    v11 = v10;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v12 = v11;

  v20[3] = v12;
  v19[4] = CFSTR("ckrecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "base64EncodedStringWithOptions:", 0));

  if (v14)
    v15 = v14;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v20[4] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 5));

  return v17;
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeyclass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)currentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentKeyUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKeyUUID, 0);
  objc_storeStrong((id *)&self->_keyclass, 0);
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];

  v16[0] = CFSTR("keyclass");
  v16[1] = CFSTR("contextID");
  v17[0] = a3;
  v17[1] = a4;
  v16[2] = CFSTR("ckzone");
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "zoneName"));
  v17[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v13, a6));
  return v14;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];

  v16[0] = CFSTR("keyclass");
  v16[1] = CFSTR("contextID");
  v17[0] = a3;
  v17[1] = a4;
  v16[2] = CFSTR("ckzone");
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "zoneName"));
  v17[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v13, a6));
  return v14;
}

+ (id)forKeyClass:(id)a3 contextID:(id)a4 withKeyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabase:contextID:zoneID:error:", v12, v13, v15, &v22));
  v17 = v22;
  v18 = v17;
  if (v17)
  {
    v19 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v17);
  }
  else
  {
    if (v16)
    {
      objc_msgSend(v16, "setCurrentKeyUUID:", v14);
      v20 = v16;
    }
    else
    {
      v20 = -[CKKSCurrentKeyPointer initForClass:contextID:currentKeyUUID:zoneID:encodedCKRecord:]([CKKSCurrentKeyPointer alloc], "initForClass:contextID:currentKeyUUID:zoneID:encodedCKRecord:", v12, v13, v14, v15, 0);
    }
    v19 = v20;
  }

  return v19;
}

+ (id)all:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;

  v10 = CFSTR("ckzone");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "zoneName"));
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v7, a4));

  return v8;
}

+ (BOOL)deleteAll:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v11 = CFSTR("ckzone");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));

  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  LOBYTE(a4) = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:](CKKSSQLDatabaseObject, "deleteFromTable:where:connection:error:", v7, v9, 0, a4);

  return (char)a4;
}

+ (id)sqlTable
{
  return CFSTR("currentkeys");
}

+ (id)sqlColumns
{
  return &off_10030B678;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  CKKSCurrentKeyPointer *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  CKKSCurrentKeyPointer *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = [CKKSCurrentKeyPointer alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keyclass")));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "asString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "asString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("currentKeyUUID")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asString"));
  v9 = objc_alloc((Class)CKRecordZoneID);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzone")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asString"));
  v12 = objc_msgSend(v9, "initWithZoneName:ownerName:", v11, CKCurrentUserDefaultName);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckrecord")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asBase64DecodedData"));
  v15 = v4;
  v16 = (void *)v5;
  v17 = -[CKKSCurrentKeyPointer initForClass:contextID:currentKeyUUID:zoneID:encodedCKRecord:](v15, "initForClass:contextID:currentKeyUUID:zoneID:encodedCKRecord:", v5, v6, v8, v12, v14);

  return v17;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7
{
  _BOOL4 v8;
  CKKSCurrentKeyPointer *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CKKSCurrentKeyPointer *v17;
  CKKSCurrentKeyPointer *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint32_t v37;
  CKKSCurrentKeyPointer *v38;
  unsigned __int8 v39;
  CKKSCurrentKeyPointer *v40;
  BOOL v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  CKKSCurrentKeyPointer *v61;
  CKKSCurrentKeyPointer *v62;
  CKKSCurrentKeyPointer *v63;
  id v64;
  id v65;
  uint8_t buf[4];
  CKKSCurrentKeyPointer *v67;
  __int16 v68;
  CKKSCurrentKeyPointer *v69;

  v8 = a5;
  v10 = (CKKSCurrentKeyPointer *)a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneID"));
  v65 = 0;
  v17 = (CKKSCurrentKeyPointer *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", v14, v11, v16, &v65));
  v18 = (CKKSCurrentKeyPointer *)v65;

  v63 = v18;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneName"));
    v22 = sub_10000BDF4(CFSTR("ckkskey"), v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "error loading ckp: %@", buf, 0xCu);
    }

  }
  if (v8)
  {
    if (v17)
    {
      v24 = -[CKKSCurrentKeyPointer matchesCKRecord:](v17, "matchesCKRecord:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "zoneName"));
      v28 = sub_10000BDF4(CFSTR("ckksresync"), v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);

      if ((v24 & 1) != 0)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v10;
          v30 = "Current key pointer has 'changed', but it matches our local copy: %@";
          v31 = v29;
          v32 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
          v37 = 12;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v31, v32, v30, buf, v37);
        }
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v17;
        v68 = 2112;
        v69 = v10;
        v30 = "BUG: Local current key pointer doesn't match resynced CloudKit record: %@ %@";
        v31 = v29;
        v32 = OS_LOG_TYPE_ERROR;
        v37 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneName"));
      v36 = sub_10000BDF4(CFSTR("ckksresync"), v35);
      v29 = objc_claimAutoreleasedReturnValue(v36);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v10;
        v30 = "BUG: No current key pointer matching resynced CloudKit record: %@";
        v31 = v29;
        v32 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }

  }
  v38 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]([CKKSCurrentKeyPointer alloc], "initWithCKRecord:contextID:", v10, v11);
  v64 = 0;
  v39 = -[CKKSSQLDatabaseObject saveToDatabase:](v38, "saveToDatabase:", &v64);
  v40 = (CKKSCurrentKeyPointer *)v64;
  if (v40)
    v41 = 0;
  else
    v41 = v39;
  if (v41)
  {
    if (-[CKKSCurrentKeyPointer matchesCKRecord:](v17, "matchesCKRecord:", v10))
    {
      v61 = v17;
      v42 = v12;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "zoneID"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "zoneName"));
      v46 = sub_10000BDF4(CFSTR("ckkskey"), v45);
      v47 = objc_claimAutoreleasedReturnValue(v46);

      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v10;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Current key pointer modification doesn't change anything interesting; skipping reprocess: %@",
          buf,
          0xCu);
      }

      v12 = v42;
      v17 = v61;
    }
    else
    {
      objc_msgSend(v12, "_onqueueHandleFlag:", CFSTR("key_process_requested"));
    }
  }
  else
  {
    v62 = v17;
    v48 = v12;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "zoneID"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "zoneName"));
    v52 = sub_10000BDF4(CFSTR("ckkskey"), v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);

    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v38;
      v68 = 2112;
      v69 = v40;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Couldn't save current key pointer to database: %@: %@", buf, 0x16u);
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "zoneID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "zoneName"));
    v57 = sub_10000BDF4(CFSTR("ckkskey"), v56);
    v58 = objc_claimAutoreleasedReturnValue(v57);

    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "CKRecord was %@", buf, 0xCu);
    }

    v12 = v48;
    v17 = v62;
    if (a7)
      *a7 = objc_retainAutorelease(v40);
  }

  return v41;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
  v25 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", v9, v8, v10, &v25));

  v12 = v25;
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
    v15 = sub_10000BDF4(CFSTR("ckkskey"), v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "error loading ckp: %@", buf, 0xCu);
    }

    v17 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else if (v11)
  {
    v24 = 0;
    objc_msgSend(v11, "deleteFromDatabase:", &v24);
    v18 = v24;
    v17 = v18 == 0;
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));
      v21 = sub_10000BDF4(CFSTR("ckkskey"), v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "error deleting ckp: %@", buf, 0xCu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v18);
    }

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

@end
