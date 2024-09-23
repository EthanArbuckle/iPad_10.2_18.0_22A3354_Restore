@implementation FMDAccessoryLocationStoreRecord

- (FMDAccessoryLocationStoreRecord)initWithRecordName:(id)a3 contextUUID:(id)a4 creationDate:(id)a5 protection:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  FMDAccessoryLocationStoreRecord *v13;
  FMDAccessoryLocationStoreRecord *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FMDAccessoryLocationStoreRecord;
  v13 = -[FMDAccessoryLocationStoreRecord init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    -[FMDAccessoryLocationStoreRecord setRecordName:](v13, "setRecordName:", v10);
    -[FMDAccessoryLocationStoreRecord setContextUUID:](v14, "setContextUUID:", v11);
    -[FMDAccessoryLocationStoreRecord setCreationDate:](v14, "setCreationDate:", v12);
    -[FMDAccessoryLocationStoreRecord setProtection:](v14, "setProtection:", a6);
  }

  return v14;
}

- (FMDAccessoryLocationStoreRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDAccessoryLocationStoreRecord *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FMDAccessoryLocationStoreRecord;
  v6 = -[FMDAccessoryLocationStoreRecord init](&v27, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = NSStringFromSelector("recordName");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDAccessoryLocationStoreRecord setRecordName:](v6, "setRecordName:", v10);

    v12 = objc_opt_class(NSUUID, v11);
    v13 = NSStringFromSelector("contextUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v14));
    -[FMDAccessoryLocationStoreRecord setContextUUID:](v6, "setContextUUID:", v15);

    v17 = objc_opt_class(NSDate, v16);
    v18 = NSStringFromSelector("creationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v19));
    -[FMDAccessoryLocationStoreRecord setCreationDate:](v6, "setCreationDate:", v20);

    v22 = objc_opt_class(NSNumber, v21);
    v23 = NSStringFromSelector("protection");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v24));
    -[FMDAccessoryLocationStoreRecord setProtection:](v6, "setProtection:", objc_msgSend(v25, "unsignedIntegerValue"));

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStoreRecord recordName](self, "recordName"));
  v6 = NSStringFromSelector("recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStoreRecord contextUUID](self, "contextUUID"));
  v9 = NSStringFromSelector("contextUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStoreRecord creationDate](self, "creationDate"));
  v12 = NSStringFromSelector("creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v13);

  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAccessoryLocationStoreRecord protection](self, "protection")));
  v14 = NSStringFromSelector("protection");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStoreRecord recordName](self, "recordName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryLocationStoreRecord creationDate](self, "creationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("name %@ - creationDate %@ - protection %li"), v3, v4, -[FMDAccessoryLocationStoreRecord protection](self, "protection")));

  return v5;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
  objc_storeStrong((id *)&self->_recordName, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (unint64_t)protection
{
  return self->_protection;
}

- (void)setProtection:(unint64_t)a3
{
  self->_protection = a3;
}

- (NSUUID)contextUUID
{
  return self->_contextUUID;
}

- (void)setContextUUID:(id)a3
{
  objc_storeStrong((id *)&self->_contextUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

@end
