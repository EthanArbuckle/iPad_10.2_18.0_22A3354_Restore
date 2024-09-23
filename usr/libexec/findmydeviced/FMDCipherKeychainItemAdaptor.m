@implementation FMDCipherKeychainItemAdaptor

- (FMDCipherKeychainItemAdaptor)initWithKeychainItem:(id)a3
{
  id v4;
  FMDCipherKeychainItemAdaptor *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  FMDOneShotCipher *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FMDCipherKeychainItemAdaptor;
  v5 = -[FMDCipherKeychainItemAdaptor init](&v26, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
    -[FMDCipherKeychainItemAdaptor setCreationDate:](v5, "setCreationDate:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastModifyDate"));
    -[FMDCipherKeychainItemAdaptor setLastModifyDate:](v5, "setLastModifyDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawData"));
    -[FMDCipherKeychainItemAdaptor setRawData:](v5, "setRawData:", v8);
    v10 = objc_opt_class(NSDictionary, v9);
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(NSData, v11), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v25 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v13, v8, &v25));
    v15 = v25;
    if (v15)
    {
      v16 = sub_1000031B8();
      v17 = (FMDOneShotCipher *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
        sub_10022C7B8((uint64_t)v15, &v17->super, v18, v19, v20, v21, v22, v23);
    }
    else
    {
      v17 = -[FMDOneShotCipher initWithDictionary:]([FMDOneShotCipher alloc], "initWithDictionary:", v14);
      -[FMDCipherKeychainItemAdaptor setCipher:](v5, "setCipher:", v17);
    }

  }
  return v5;
}

- (FMDCipherKeychainItemAdaptor)initWithCipher:(id)a3
{
  id v4;
  FMDCipherKeychainItemAdaptor *v5;
  FMDCipherKeychainItemAdaptor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FMDCipherKeychainItemAdaptor;
  v5 = -[FMDCipherKeychainItemAdaptor init](&v22, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDCipherKeychainItemAdaptor setCipher:](v5, "setCipher:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[FMDCipherKeychainItemAdaptor setCreationDate:](v6, "setCreationDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCipherKeychainItemAdaptor creationDate](v6, "creationDate"));
    -[FMDCipherKeychainItemAdaptor setLastModifyDate:](v6, "setLastModifyDate:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryValue"));
    v21 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v21));
    v11 = v21;
    if (v11)
    {
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10022C820((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

    }
    -[FMDCipherKeychainItemAdaptor setRawData:](v6, "setRawData:", v10);

  }
  return v6;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_storeStrong((id *)&self->_rawData, a3);
}

- (NSDate)lastModifyDate
{
  return self->_lastModifyDate;
}

- (void)setLastModifyDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifyDate, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)password
{
  return self->_password;
}

- (FMDCiphering)cipher
{
  return self->_cipher;
}

- (void)setCipher:(id)a3
{
  objc_storeStrong((id *)&self->_cipher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cipher, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_lastModifyDate, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end
