@implementation HDSPSyncedDefaultsKeySet

- (HDSPSyncedDefaultsKeySet)initWithIdentifier:(id)a3 modficationDateKey:(id)a4 keysToPersist:(id)a5 keysToSync:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDSPSyncedDefaultsKeySet *v17;

  v10 = (objc_class *)MEMORY[0x24BDBCF20];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v10);
  v16 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v17 = -[HDSPSyncedDefaultsKeySet initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:perGizmoKeys:defaultValues:](self, "initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:perGizmoKeys:defaultValues:", v14, v13, v12, v11, v15, v16);

  return v17;
}

- (HDSPSyncedDefaultsKeySet)initWithIdentifier:(id)a3 modficationDateKey:(id)a4 keysToPersist:(id)a5 keysToSync:(id)a6 perGizmoKeys:(id)a7 defaultValues:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HDSPSyncedDefaultsKeySet *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  NSString *modificationDateKey;
  HDSPSyncedDefaultsKeySet *v24;
  id v26;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v26 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HDSPSyncedDefaultsKeySet;
  v19 = -[HDSPSyncedDefaultsKeySet init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    modificationDateKey = v19->_modificationDateKey;
    v19->_modificationDateKey = (NSString *)v22;

    objc_storeStrong((id *)&v19->_keysToPersist, a5);
    objc_storeStrong((id *)&v19->_keysToSync, a6);
    objc_storeStrong((id *)&v19->_perGizmoKeys, a7);
    objc_storeStrong((id *)&v19->_defaultValues, a8);
    v24 = v19;
  }

  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)modificationDateKey
{
  return self->_modificationDateKey;
}

- (NSSet)keysToPersist
{
  return self->_keysToPersist;
}

- (NSSet)keysToSync
{
  return self->_keysToSync;
}

- (NSSet)perGizmoKeys
{
  return self->_perGizmoKeys;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_perGizmoKeys, 0);
  objc_storeStrong((id *)&self->_keysToSync, 0);
  objc_storeStrong((id *)&self->_keysToPersist, 0);
  objc_storeStrong((id *)&self->_modificationDateKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
