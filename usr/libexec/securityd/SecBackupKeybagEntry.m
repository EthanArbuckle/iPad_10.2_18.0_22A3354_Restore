@implementation SecBackupKeybagEntry

- (SecBackupKeybagEntry)initWithPublicKey:(id)a3 publickeyHash:(id)a4 user:(id)a5
{
  id v9;
  id v10;
  id v11;
  SecBackupKeybagEntry *v12;
  SecBackupKeybagEntry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SecBackupKeybagEntry;
  v12 = -[SecBackupKeybagEntry init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_publickey, a3);
    objc_storeStrong((id *)&v13->_publickeyHash, a4);
    objc_storeStrong((id *)&v13->_musr, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_opt_class(SecBackupKeybagEntry);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry publickeyHash](self, "publickeyHash"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publickeyHash"));

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)whereClauseToFindSelf
{
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("publickeyHash");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry publickeyHash](self, "publickeyHash"));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];

  v11[0] = CFSTR("publickey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry publickey](self, "publickey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
  v12[0] = v4;
  v11[1] = CFSTR("publickeyHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry publickeyHash](self, "publickeyHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "base64EncodedStringWithOptions:", 0));
  v12[1] = v6;
  v11[2] = CFSTR("musr");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry musr](self, "musr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "base64EncodedStringWithOptions:", 0));
  v12[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  return v9;
}

- (NSData)publickeyHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPublickeyHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)publickey
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPublickey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)musr
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMusr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musr, 0);
  objc_storeStrong((id *)&self->_publickey, 0);
  objc_storeStrong((id *)&self->_publickeyHash, 0);
}

+ (id)state:(id)a3
{
  id v3;
  SecBackupKeybagEntry *v4;
  id v5;
  const void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;

  v3 = a3;
  v9 = 0;
  v4 = (SecBackupKeybagEntry *)objc_claimAutoreleasedReturnValue(+[SecBackupKeybagEntry tryFromDatabase:error:](SecBackupKeybagEntry, "tryFromDatabase:error:", v3, &v9));
  v5 = v9;
  if (v5)
  {
    v6 = sub_10000EF14("SecError");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CKKS: error fetching SecBackupKeybagEntry(%@): %@", buf, 0x16u);
    }

  }
  if (!v4)
    v4 = -[SecBackupKeybagEntry initWithPublicKey:publickeyHash:user:]([SecBackupKeybagEntry alloc], "initWithPublicKey:publickeyHash:user:", 0, v3, 0);

  return v4;
}

+ (id)fromDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  id v11;

  v10 = CFSTR("publickeyHash");
  v11 = a3;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v7, a4));
  return v8;
}

+ (id)tryFromDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  id v11;

  v10 = CFSTR("publickeyHash");
  v11 = a3;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v7, a4));
  return v8;
}

+ (id)sqlTable
{
  return CFSTR("backup_keybag");
}

+ (id)sqlColumns
{
  return &off_10030B7F8;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SecBackupKeybagEntry *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("publickey")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asBase64DecodedData"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("publickeyHash")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asBase64DecodedData"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("musr")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asBase64DecodedData"));

  v10 = 0;
  if (v5 && v7 && v9)
    v10 = -[SecBackupKeybagEntry initWithPublicKey:publickeyHash:user:]([SecBackupKeybagEntry alloc], "initWithPublicKey:publickeyHash:user:", v5, v7, v9);

  return v10;
}

@end
