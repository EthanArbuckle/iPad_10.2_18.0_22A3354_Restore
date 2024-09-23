@implementation SKADatabaseSubscribedLocalStatus

- (SKADatabaseSubscribedLocalStatus)initWithCoreDataSubscirbedLocalStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKADatabaseSubscribedLocalStatus *v12;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SKADatabaseSubscribedLocalStatus initWithIdentifier:creationDate:modificationDate:keyName:keyDomain:payload:idsIdentifier:](self, "initWithIdentifier:creationDate:modificationDate:keyName:keyDomain:payload:idsIdentifier:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SKADatabaseSubscribedLocalStatus identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseSubscribedLocalStatus idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseSubscribedLocalStatus keyDomain](self, "keyDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseSubscribedLocalStatus keyName](self, "keyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseSubscribedLocalStatus creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseSubscribedLocalStatus modificationDate](self, "modificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SubscribedLocalStatus: ID %@, IDS: %@, Domain: %@, Key: %@, CreationDate: %@, ModificationDate: %@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SKADatabaseSubscribedLocalStatus)initWithIdentifier:(id)a3 creationDate:(id)a4 modificationDate:(id)a5 keyName:(id)a6 keyDomain:(id)a7 payload:(id)a8 idsIdentifier:(id)a9
{
  id v16;
  id v17;
  SKADatabaseSubscribedLocalStatus *v18;
  SKADatabaseSubscribedLocalStatus *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SKADatabaseSubscribedLocalStatus;
  v18 = -[SKADatabaseSubscribedLocalStatus init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_creationDate, a4);
    objc_storeStrong((id *)&v19->_modificationDate, a5);
    objc_storeStrong((id *)&v19->_keyName, a6);
    objc_storeStrong((id *)&v19->_keyDomain, a7);
    objc_storeStrong((id *)&v19->_payload, a8);
    objc_storeStrong((id *)&v19->_idsIdentifier, a9);
  }

  return v19;
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

- (NSString)keyName
{
  return self->_keyName;
}

- (void)setKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_keyName, a3);
}

- (NSString)keyDomain
{
  return self->_keyDomain;
}

- (void)setKeyDomain:(id)a3
{
  objc_storeStrong((id *)&self->_keyDomain, a3);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_keyDomain, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
