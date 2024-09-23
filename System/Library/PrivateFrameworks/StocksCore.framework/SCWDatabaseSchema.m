@implementation SCWDatabaseSchema

- (SCWDatabaseSchema)initWithName:(id)a3 environment:(int64_t)a4 security:(int64_t)a5 zoneSchemas:(id)a6
{
  id v10;
  id v11;
  SCWDatabaseSchema *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSArray *zoneSchemas;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SCWDatabaseSchema;
  v12 = -[SCWDatabaseSchema init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_environment = a4;
    v12->_security = a5;
    v15 = objc_msgSend(v11, "copy");
    zoneSchemas = v12->_zoneSchemas;
    v12->_zoneSchemas = (NSArray *)v15;

  }
  return v12;
}

- (id)schemaForZoneName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SCWDatabaseSchema zoneSchemas](self, "zoneSchemas", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "zoneName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)zoneSchemas
{
  return self->_zoneSchemas;
}

- (CKContainerID)containerID
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  if (-[SCWDatabaseSchema environment](self, "environment") == 1)
    v3 = 1;
  else
    v3 = 2;
  v4 = objc_alloc(MEMORY[0x1E0C94C40]);
  -[SCWDatabaseSchema name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithContainerIdentifier:environment:", v5, v3);

  return (CKContainerID *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)environment
{
  return self->_environment;
}

- (NSArray)zoneIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SCWDatabaseSchema zoneSchemas](self, "zoneSchemas", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "zoneID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)requiresDeviceToDeviceEncryption
{
  return -[SCWDatabaseSchema security](self, "security") != 0;
}

- (void)setZoneSchemas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)security
{
  return self->_security;
}

- (void)setSecurity:(int64_t)a3
{
  self->_security = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSchemas, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
