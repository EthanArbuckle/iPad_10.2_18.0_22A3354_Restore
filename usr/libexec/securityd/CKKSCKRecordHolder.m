@implementation CKKSCKRecordHolder

- (CKKSCKRecordHolder)initWithCKRecord:(id)a3 contextID:(id)a4
{
  id v6;
  id v7;
  CKKSCKRecordHolder *v8;
  void *v9;
  uint64_t v10;
  CKRecordZoneID *zoneID;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKKSCKRecordHolder;
  v8 = -[CKKSCKRecordHolder init](&v13, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
    zoneID = v8->_zoneID;
    v8->_zoneID = (CKRecordZoneID *)v10;

    objc_storeStrong((id *)&v8->_contextID, a4);
    -[CKKSCKRecordHolder setFromCKRecord:](v8, "setFromCKRecord:", v6);
  }

  return v8;
}

- (CKKSCKRecordHolder)initWithCKRecordType:(id)a3 encodedCKRecord:(id)a4 contextID:(id)a5 zoneID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKKSCKRecordHolder *v15;
  CKKSCKRecordHolder *v16;
  CKRecord *storedCKRecord;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKKSCKRecordHolder;
  v15 = -[CKKSCKRecordHolder init](&v19, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contextID, a5);
    objc_storeStrong((id *)&v16->_zoneID, a6);
    objc_storeStrong((id *)&v16->_ckRecordType, a3);
    objc_storeStrong((id *)&v16->_encodedCKRecord, a4);
    storedCKRecord = v16->_storedCKRecord;
    v16->_storedCKRecord = 0;

  }
  return v16;
}

- (CKRecord)storedCKRecord
{
  CKRecord *storedCKRecord;
  void *v5;
  id v6;
  CKRecord *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  CKRecord *v19;
  CKRecord *v20;
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;

  storedCKRecord = self->_storedCKRecord;
  if (storedCKRecord)
    return (CKRecord *)-[CKRecord copy](storedCKRecord, "copy");
  if (!self->_encodedCKRecord)
    return (CKRecord *)0;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", self->_encodedCKRecord, 0);
  v7 = (CKRecord *)objc_msgSend(objc_alloc((Class)CKRecord), "initWithCoder:", v6);
  objc_msgSend(v6, "finishDecoding");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v7, "recordID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
      v14 = sub_10000BDF4(CFSTR("ckks"), v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v7, "recordID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
        v22 = 138412546;
        v23 = v16;
        v24 = 2112;
        v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "mismatching zone ids in a single record: %@ and %@", (uint8_t *)&v22, 0x16u);

      }
    }
  }
  v19 = self->_storedCKRecord;
  self->_storedCKRecord = v7;
  v20 = v7;

  v21 = -[CKRecord copy](v20, "copy");
  objc_autoreleasePoolPop(v5);
  return (CKRecord *)v21;
}

- (void)setStoredCKRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSData *v10;
  NSData *encodedCKRecord;
  CKRecord *v12;
  CKRecord *storedCKRecord;
  NSData *v14;
  CKRecord *v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    -[CKKSCKRecordHolder setZoneID:](self, "setZoneID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordType"));
    -[CKKSCKRecordHolder setCkRecordType:](self, "setCkRecordType:", v7);

    v8 = objc_autoreleasePoolPush();
    v9 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v16, "encodeWithCoder:", v9);
    v10 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "encodedData"));
    encodedCKRecord = self->_encodedCKRecord;
    self->_encodedCKRecord = v10;

    v12 = (CKRecord *)objc_msgSend(v16, "copy");
    storedCKRecord = self->_storedCKRecord;
    self->_storedCKRecord = v12;

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v14 = self->_encodedCKRecord;
    self->_encodedCKRecord = 0;

    v15 = self->_storedCKRecord;
    self->_storedCKRecord = 0;

  }
}

- (NSData)encodedCKRecord
{
  return self->_encodedCKRecord;
}

- (void)setEncodedCKRecord:(id)a3
{
  CKRecord *storedCKRecord;
  id v6;

  objc_storeStrong((id *)&self->_encodedCKRecord, a3);
  v6 = a3;
  storedCKRecord = self->_storedCKRecord;
  self->_storedCKRecord = 0;

}

- (id)CKRecordWithZoneID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc((Class)CKRecordID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder CKRecordName](self, "CKRecordName"));
  v7 = objc_msgSend(v5, "initWithRecordName:zoneID:", v6, v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  }
  else
  {
    v10 = objc_alloc((Class)CKRecord);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder ckRecordType](self, "ckRecordType"));
    v9 = objc_msgSend(v10, "initWithRecordType:recordID:", v11, v7);

  }
  v12 = objc_msgSend(v9, "copy");
  v13 = -[CKKSCKRecordHolder updateCKRecord:zoneID:](self, "updateCKRecord:zoneID:", v9, v4);
  if ((objc_msgSend(v9, "isEqual:", v12) & 1) == 0)
    -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v9);

  return v9;
}

- (id)CKRecordName
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ must override %@"), v5, v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v7;
  id v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = (objc_class *)objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ must override %@"), v11, v13));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v14, 0));

  objc_exception_throw(v15);
}

- (void)setFromCKRecord:(id)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ must override %@"), v8, v10));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ must override %@"), v8, v10));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKKSCKRecordHolder;
  v4 = -[CKKSSQLDatabaseObject copyWithZone:](&v10, "copyWithZone:", a3);
  objc_storeStrong(v4 + 4, self->_contextID);
  objc_storeStrong(v4 + 5, self->_zoneID);
  objc_storeStrong(v4 + 6, self->_ckRecordType);
  v5 = -[NSData copy](self->_encodedCKRecord, "copy");
  v6 = v4[2];
  v4[2] = v5;

  v7 = -[CKRecord copy](self->_storedCKRecord, "copy");
  v8 = v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)ckRecordType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCkRecordType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecordType, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_storedCKRecord, 0);
  objc_storeStrong((id *)&self->_encodedCKRecord, 0);
}

@end
