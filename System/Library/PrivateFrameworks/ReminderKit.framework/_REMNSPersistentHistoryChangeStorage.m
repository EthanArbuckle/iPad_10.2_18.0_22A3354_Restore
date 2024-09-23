@implementation _REMNSPersistentHistoryChangeStorage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[_REMNSPersistentHistoryChangeStorage changeID](self, "changeID"), CFSTR("changeID"));
  -[_REMNSPersistentHistoryChangeStorage changedObjectIDStorage](self, "changedObjectIDStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("changedObjectID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_REMNSPersistentHistoryChangeStorage changeType](self, "changeType"), CFSTR("changeType"));
  -[_REMNSPersistentHistoryChangeStorage tombstone](self, "tombstone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tombstone"));

  -[_REMNSPersistentHistoryChangeStorage updatedProperties](self, "updatedProperties");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("updatedProperties"));

}

- (_REMNSPersistentHistoryChangeStorage)initWithCoder:(id)a3
{
  id v4;
  _REMNSPersistentHistoryChangeStorage *v5;
  _REMChangedObjectIDStorage *v6;
  _REMChangedObjectIDStorage *changedObjectIDStorage;
  _REMChangedObjectIDStorage *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  REMNSPersistentHistoryChangeTombstone *tombstone;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSSet *updatedProperties;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_REMNSPersistentHistoryChangeStorage;
  v5 = -[_REMNSPersistentHistoryChangeStorage init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changedObjectID"));
    v6 = (_REMChangedObjectIDStorage *)objc_claimAutoreleasedReturnValue();
    changedObjectIDStorage = v5->_changedObjectIDStorage;
    v5->_changedObjectIDStorage = v6;
    v8 = v6;

    v5->_changeID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("changeID"));
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeType"));
    if (v9 >= 3)
    {
      v10 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[_REMNSPersistentHistoryChangeStorage initWithCoder:].cold.1();

      v9 = 1;
    }
    v5->_changeType = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tombstone"));
    v11 = objc_claimAutoreleasedReturnValue();
    tombstone = v5->_tombstone;
    v5->_tombstone = (REMNSPersistentHistoryChangeTombstone *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("updatedProperties"));
    v16 = objc_claimAutoreleasedReturnValue();
    updatedProperties = v5->_updatedProperties;
    v5->_updatedProperties = (NSSet *)v16;

  }
  return v5;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (void)setChangeID:(int64_t)a3
{
  self->_changeID = a3;
}

- (_REMChangedObjectIDStorage)changedObjectIDStorage
{
  return self->_changedObjectIDStorage;
}

- (void)setChangedObjectIDStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (REMNSPersistentHistoryChangeTombstone)tombstone
{
  return self->_tombstone;
}

- (void)setTombstone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)updatedProperties
{
  return self->_updatedProperties;
}

- (void)setUpdatedProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedProperties, 0);
  objc_storeStrong((id *)&self->_tombstone, 0);
  objc_storeStrong((id *)&self->_changedObjectIDStorage, 0);
}

- (BOOL)isEqual:(id)a3
{
  _REMNSPersistentHistoryChangeStorage *v4;
  _REMNSPersistentHistoryChangeStorage *v5;
  _REMNSPersistentHistoryChangeStorage *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = (_REMNSPersistentHistoryChangeStorage *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    v7 = -[_REMNSPersistentHistoryChangeStorage changeID](self, "changeID");
    if (v7 != -[_REMNSPersistentHistoryChangeStorage changeID](v6, "changeID"))
      goto LABEL_12;
    -[_REMNSPersistentHistoryChangeStorage changedObjectIDStorage](self, "changedObjectIDStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_REMNSPersistentHistoryChangeStorage changedObjectIDStorage](v6, "changedObjectIDStorage");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[_REMNSPersistentHistoryChangeStorage changedObjectIDStorage](self, "changedObjectIDStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMNSPersistentHistoryChangeStorage changedObjectIDStorage](v6, "changedObjectIDStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_12;
    }
    v15 = -[_REMNSPersistentHistoryChangeStorage changeType](self, "changeType");
    if (v15 == -[_REMNSPersistentHistoryChangeStorage changeType](v6, "changeType"))
    {
      -[_REMNSPersistentHistoryChangeStorage tombstone](self, "tombstone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMNSPersistentHistoryChangeStorage tombstone](v6, "tombstone");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v16 == (void *)v17)
      {

      }
      else
      {
        v18 = (void *)v17;
        -[_REMNSPersistentHistoryChangeStorage tombstone](self, "tombstone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryChangeStorage tombstone](v6, "tombstone");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        if (!v21)
          goto LABEL_12;
      }
      -[_REMNSPersistentHistoryChangeStorage updatedProperties](self, "updatedProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMNSPersistentHistoryChangeStorage updatedProperties](v6, "updatedProperties");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v23 == (void *)v24)
      {
        v14 = 1;
        v25 = v23;
      }
      else
      {
        v25 = (void *)v24;
        -[_REMNSPersistentHistoryChangeStorage updatedProperties](self, "updatedProperties");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryChangeStorage updatedProperties](v6, "updatedProperties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v26, "isEqual:", v27);

      }
      goto LABEL_13;
    }
LABEL_12:
    v14 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v14 = 1;
LABEL_14:

  return v14;
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "Unknown REMChangeType %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
