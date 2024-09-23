@implementation SKADatabasePublishedLocalStatus

- (SKADatabasePublishedLocalStatus)initWithCoreDataPublishedLocalStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SKADatabasePublishedLocalStatus *v12;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "targetDevicesFlags");

  v12 = -[SKADatabasePublishedLocalStatus initWithIdentifier:creationDate:modificationDate:keyDomain:keyName:payload:targetDevicesFlags:](self, "initWithIdentifier:creationDate:modificationDate:keyDomain:keyName:payload:targetDevicesFlags:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (SKADatabasePublishedLocalStatus)initWithIdentifier:(id)a3 creationDate:(id)a4 modificationDate:(id)a5 keyDomain:(id)a6 keyName:(id)a7 payload:(id)a8 targetDevicesFlags:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  SKADatabasePublishedLocalStatus *v19;
  SKADatabasePublishedLocalStatus *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SKADatabasePublishedLocalStatus;
  v19 = -[SKADatabasePublishedLocalStatus init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_creationDate, a4);
    objc_storeStrong((id *)&v20->_modificationDate, a5);
    objc_storeStrong((id *)&v20->_keyDomain, a6);
    objc_storeStrong((id *)&v20->_keyName, a7);
    objc_storeStrong((id *)&v20->_payload, a8);
    v20->_targetDevicesFlags = a9;
  }

  return v20;
}

- (BOOL)isEqualToStatus:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  uint64_t v21;
  int64_t v22;
  void *v23;
  void *v24;

  v4 = a3;
  -[SKADatabasePublishedLocalStatus identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
    goto LABEL_13;
  -[SKADatabasePublishedLocalStatus creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToDate:", v8))
  {
LABEL_12:

LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  -[SKADatabasePublishedLocalStatus modificationDate](self, "modificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToDate:", v10))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[SKADatabasePublishedLocalStatus keyDomain](self, "keyDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyDomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", v12))
  {

    goto LABEL_11;
  }
  v24 = v11;
  -[SKADatabasePublishedLocalStatus keyName](self, "keyName");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyName");
  v14 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v13;
  v15 = (void *)v13;
  v16 = (void *)v14;
  if (!objc_msgSend(v15, "isEqualToString:", v14))
  {

    goto LABEL_11;
  }
  v22 = -[SKADatabasePublishedLocalStatus targetDevicesFlags](self, "targetDevicesFlags");
  v21 = objc_msgSend(v4, "targetDevicesFlags");

  if (v22 != v21)
  {
    v18 = 0;
    goto LABEL_15;
  }
  -[SKADatabasePublishedLocalStatus payload](self, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else
  {
    objc_msgSend(v4, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v18 = 1;
      goto LABEL_15;
    }
  }
  -[SKADatabasePublishedLocalStatus payload](self, "payload", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "isEqualToData:", v6);
LABEL_14:

LABEL_15:
  return v18;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSString)keyDomain
{
  return self->_keyDomain;
}

- (void)setKeyDomain:(id)a3
{
  objc_storeStrong((id *)&self->_keyDomain, a3);
}

- (NSString)keyName
{
  return self->_keyName;
}

- (void)setKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_keyName, a3);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (int64_t)targetDevicesFlags
{
  return self->_targetDevicesFlags;
}

- (void)setTargetDevicesFlags:(int64_t)a3
{
  self->_targetDevicesFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_keyDomain, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
