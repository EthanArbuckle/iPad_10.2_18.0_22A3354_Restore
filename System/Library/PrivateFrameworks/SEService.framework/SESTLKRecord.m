@implementation SESTLKRecord

+ (id)withView:(id)a3 tlkUUID:(id)a4 parentTLKUUID:(id)a5 recordData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (_QWORD *)objc_opt_new();
  v14 = (void *)v13[1];
  v13[1] = v9;
  v15 = v9;

  v16 = (void *)v13[2];
  v13[2] = v10;
  v17 = v10;

  v18 = (void *)v13[3];
  v13[3] = v11;
  v19 = v11;

  v20 = (void *)v13[4];
  v13[4] = v12;

  return v13;
}

+ (id)withCKKSExternalKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_uuidFromStringPermissive:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "parentKeyUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_uuidFromStringPermissive:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8)
  {
    objc_msgSend(v4, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ses_toData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ses_toData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SESTLKRecord withView:tlkUUID:parentTLKUUID:recordData:](SESTLKRecord, "withView:tlkUUID:parentTLKUUID:recordData:", v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SESDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "keyData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "base64");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_20A048000, v14, OS_LOG_TYPE_ERROR, "Couldn't convert from UUID String %@ %@", (uint8_t *)&v19, 0x16u);

    }
    v13 = 0;
  }

  return v13;
}

- (id)asCKKSExternalKey
{
  id v3;
  NSString *view;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDE8460]);
  view = self->_view;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", -[NSData bytes](self->_tlkUUID, "bytes"));
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", -[NSData bytes](self->_parentTLKUUID, "bytes"));
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithView:uuid:parentTLKUUID:keyData:", view, v6, v8, self->_recordData);

  return v9;
}

+ (id)_uuidFromStringPermissive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 0);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "ses_withData:", v7);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SESDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "Failed to permissive decode UUID %@", (uint8_t *)&v10, 0xCu);
      }

      v6 = 0;
    }

  }
  return v6;
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)tlkUUID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)parentTLKUUID
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)recordData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordData, 0);
  objc_storeStrong((id *)&self->_parentTLKUUID, 0);
  objc_storeStrong((id *)&self->_tlkUUID, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
