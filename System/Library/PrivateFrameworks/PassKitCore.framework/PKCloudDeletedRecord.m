@implementation PKCloudDeletedRecord

- (PKCloudDeletedRecord)initWithRecordID:(id)a3 recordType:(id)a4
{
  id v7;
  id v8;
  PKCloudDeletedRecord *v9;
  PKCloudDeletedRecord *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKCloudDeletedRecord;
  v9 = -[PKCloudDeletedRecord init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordID, a3);
    objc_storeStrong((id *)&v10->_recordType, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudDeletedRecord)initWithCoder:(id)a3
{
  id v4;
  PKCloudDeletedRecord *v5;
  uint64_t v6;
  CKRecordID *recordID;
  uint64_t v8;
  NSString *recordType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCloudDeletedRecord;
  v5 = -[PKCloudDeletedRecord init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordID"));
    v6 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordType"));
    v8 = objc_claimAutoreleasedReturnValue();
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CKRecordID *recordID;
  id v5;

  recordID = self->_recordID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordID, CFSTR("recordID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordType, CFSTR("recordType"));

}

- (NSString)recordName
{
  void *v2;
  void *v3;

  -[PKCloudDeletedRecord recordID](self, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isPass
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  char v5;

  -[PKCloudDeletedRecord recordType](self, "recordType");
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("Pass");
  v4 = v3;
  if (v2 == v3)
  {
    v5 = 1;
  }
  else
  {
    v5 = 0;
    if (v2 && v3)
      v5 = -[__CFString isEqualToString:](v2, "isEqualToString:", v3);
  }

  return v5;
}

- (BOOL)isPassCatalog
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  char v5;

  -[PKCloudDeletedRecord recordType](self, "recordType");
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("PassCatalog");
  v4 = v3;
  if (v2 == v3)
  {
    v5 = 1;
  }
  else
  {
    v5 = 0;
    if (v2 && v3)
      v5 = -[__CFString isEqualToString:](v2, "isEqualToString:", v3);
  }

  return v5;
}

- (BOOL)isRemoteAsset
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  char v5;

  -[PKCloudDeletedRecord recordType](self, "recordType");
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("RemoteAsset");
  v4 = v3;
  if (v2 == v3)
  {
    v5 = 1;
  }
  else
  {
    v5 = 0;
    if (v2 && v3)
      v5 = -[__CFString isEqualToString:](v2, "isEqualToString:", v3);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKCloudDeletedRecord *v4;
  PKCloudDeletedRecord *v5;
  BOOL v6;

  v4 = (PKCloudDeletedRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCloudDeletedRecord isEqualToDeletedRecord:](self, "isEqualToDeletedRecord:", v5);

  return v6;
}

- (BOOL)isEqualToDeletedRecord:(id)a3
{
  _QWORD *v4;
  CKRecordID *recordID;
  CKRecordID *v6;
  BOOL v7;
  char v8;
  NSString *recordType;
  NSString *v11;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  recordID = self->_recordID;
  v6 = (CKRecordID *)v4[1];
  if (recordID)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[CKRecordID isEqual:](recordID, "isEqual:") & 1) != 0)
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (recordID != v6)
    goto LABEL_8;
LABEL_11:
  recordType = self->_recordType;
  v11 = (NSString *)v4[2];
  if (recordType && v11)
    v8 = -[NSString isEqual:](recordType, "isEqual:");
  else
    v8 = recordType == v11;
LABEL_9:

  return v8;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_recordID);
  objc_msgSend(v3, "safelyAddObject:", self->_recordType);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("----------------------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("recordID:\n%@\n"), self->_recordID);
  objc_msgSend(v3, "appendFormat:", CFSTR("recordType:\"%@\"\n"), self->_recordType);
  objc_msgSend(v3, "appendString:", CFSTR("----------------------------\n"));
  return v3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
