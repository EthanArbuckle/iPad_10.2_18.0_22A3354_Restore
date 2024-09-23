@implementation REMNSPersistentHistoryChange

- (REMNSPersistentHistoryChange)initWithStorage:(id)a3
{
  id v5;
  REMNSPersistentHistoryChange *v6;
  REMNSPersistentHistoryChange *v7;
  REMNSPersistentHistoryChange *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)REMNSPersistentHistoryChange;
    v6 = -[REMNSPersistentHistoryChange init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_storage, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (REMNSPersistentHistoryChange)initWithPersistentHistoryChange:(id)a3
{
  id v4;
  _REMNSPersistentHistoryChangeStorage *v5;
  void *v6;
  void *v7;
  REMNSPersistentHistoryChangeTombstone *v8;
  void *v9;
  REMNSPersistentHistoryChangeTombstone *v10;
  REMNSPersistentHistoryChange *v11;
  REMNSPersistentHistoryChange *v12;
  REMNSPersistentHistoryChange *v13;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(_REMNSPersistentHistoryChangeStorage);
    -[_REMNSPersistentHistoryChangeStorage setChangeID:](v5, "setChangeID:", objc_msgSend(v4, "changeID"));
    -[_REMNSPersistentHistoryChangeStorage setChangeType:](v5, "setChangeType:", objc_msgSend(v4, "changeType"));
    objc_msgSend(v4, "updatedProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_REMNSPersistentHistoryChangeStorage setUpdatedProperties:](v5, "setUpdatedProperties:", v7);

    v8 = [REMNSPersistentHistoryChangeTombstone alloc];
    objc_msgSend(v4, "tombstone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[REMNSPersistentHistoryChangeTombstone initWithDictionary:](v8, "initWithDictionary:", v9);
    -[_REMNSPersistentHistoryChangeStorage setTombstone:](v5, "setTombstone:", v10);

    -[_REMNSPersistentHistoryChangeStorage setChangedObjectIDStorage:](v5, "setChangedObjectIDStorage:", 0);
    v11 = -[REMNSPersistentHistoryChange initWithStorage:](self, "initWithStorage:", v5);
    v12 = v11;
    if (v11)
      objc_storeWeak((id *)&v11->_persistentHistoryChange, v4);
    self = v12;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)changedManagedObjectID
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChange persistentHistoryChange](self, "persistentHistoryChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resolveObjectIDWithUUID:(id)a3 entityName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _REMChangedObjectIDStorage *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[_REMChangedObjectIDStorage initWithUUID:entityName:]([_REMChangedObjectIDStorage alloc], "initWithUUID:entityName:", v7, v6);

  -[REMNSPersistentHistoryChange storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setChangedObjectIDStorage:", v9);

}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[REMNSPersistentHistoryChange changeID](self, "changeID");
  +[REMNSPersistentHistoryChange shortStringForChangeType:](REMNSPersistentHistoryChange, "shortStringForChangeType:", -[REMNSPersistentHistoryChange changeType](self, "changeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMNSPersistentHistoryChange persistentHistoryChange](self, "persistentHistoryChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMNSPersistentHistoryChange storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedObjectIDStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<REMNSPersistentHistoryChange - changeID(%lld) changeType(%@) mocID(%@) remID(%@)>"), v4, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)changeID
{
  void *v2;
  int64_t v3;

  -[REMNSPersistentHistoryChange storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "changeID");

  return v3;
}

- (id)changedObjectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  -[REMNSPersistentHistoryChange cachedChangedREMObjectID](self, "cachedChangedREMObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[REMNSPersistentHistoryChange storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedObjectIDStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "entityName");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "entityName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v8, v9);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        -[REMNSPersistentHistoryChange setCachedChangedREMObjectID:](self, "setCachedChangedREMObjectID:", v4);
LABEL_12:

        return v4;
      }
      +[REMLog changeTracking](REMLog, "changeTracking");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[REMNSPersistentHistoryChange changedObjectID].cold.2();

    }
    else
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[REMNSPersistentHistoryChange changedObjectID].cold.1();
    }
    v4 = 0;
    goto LABEL_12;
  }
  -[REMNSPersistentHistoryChange cachedChangedREMObjectID](self, "cachedChangedREMObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (int64_t)changeType
{
  void *v2;
  int64_t v3;

  -[REMNSPersistentHistoryChange storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "changeType");

  return v3;
}

- (id)tombstone
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChange storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tombstone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)shortStringForChangeType:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "stringForChangeType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("REMChangeType"), &stru_1E67FB1F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)stringForChangeType:(int64_t)a3
{
  NSObject *v4;

  if ((unint64_t)a3 < 3)
    return off_1E67F95A0[a3];
  +[REMLog changeTracking](REMLog, "changeTracking");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    +[REMNSPersistentHistoryChange stringForChangeType:].cold.1();

  return 0;
}

- (id)updatedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[REMNSPersistentHistoryChange storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v4);
  else
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[REMNSPersistentHistoryChange isCoalesced](self, "isCoalesced"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[REMNSPersistentHistoryChange coalescedChanges](self, "coalescedChanges", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "updatedProperties");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "unionSet:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (id)copyForCoalescing
{
  REMNSPersistentHistoryChange *v3;
  void *v4;
  REMNSPersistentHistoryChange *v5;
  void *v6;

  v3 = [REMNSPersistentHistoryChange alloc];
  -[REMNSPersistentHistoryChange storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMNSPersistentHistoryChange initWithStorage:](v3, "initWithStorage:", v4);

  -[REMNSPersistentHistoryChange internal_ChangeTransaction](self, "internal_ChangeTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMNSPersistentHistoryChange setInternal_ChangeTransaction:](v5, "setInternal_ChangeTransaction:", v6);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMNSPersistentHistoryChange storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("storage"));

}

- (REMNSPersistentHistoryChange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMNSPersistentHistoryChange *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMNSPersistentHistoryChange initWithStorage:](self, "initWithStorage:", v5);
  return v6;
}

- (REMChangeTransaction)internal_ChangeTransaction
{
  return (REMChangeTransaction *)objc_loadWeakRetained((id *)&self->_internal_ChangeTransaction);
}

- (void)setInternal_ChangeTransaction:(id)a3
{
  objc_storeWeak((id *)&self->_internal_ChangeTransaction, a3);
}

- (BOOL)isCoalesced
{
  return self->_isCoalesced;
}

- (void)setIsCoalesced:(BOOL)a3
{
  self->_isCoalesced = a3;
}

- (NSArray)coalescedChanges
{
  return self->_coalescedChanges;
}

- (void)setCoalescedChanges:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedChanges, a3);
}

- (_REMNSPersistentHistoryChangeStorage)storage
{
  return (_REMNSPersistentHistoryChangeStorage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSPersistentHistoryChange)persistentHistoryChange
{
  return (NSPersistentHistoryChange *)objc_loadWeakRetained((id *)&self->_persistentHistoryChange);
}

- (REMObjectID)cachedChangedREMObjectID
{
  return (REMObjectID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCachedChangedREMObjectID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedChangedREMObjectID, 0);
  objc_destroyWeak((id *)&self->_persistentHistoryChange);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_coalescedChanges, 0);
  objc_destroyWeak((id *)&self->_internal_ChangeTransaction);
}

- (BOOL)isEqual:(id)a3
{
  REMNSPersistentHistoryChange *v4;
  REMNSPersistentHistoryChange *v5;
  REMNSPersistentHistoryChange *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMNSPersistentHistoryChange *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMNSPersistentHistoryChange storage](self, "storage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMNSPersistentHistoryChange storage](v6, "storage");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[REMNSPersistentHistoryChange storage](self, "storage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMNSPersistentHistoryChange storage](v6, "storage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (void)changedObjectID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Cannot convert changedObjectIDStorage to changedObjectID because entityName is nil in persistentHistoryChange {change: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

+ (void)stringForChangeType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "Unexpected REMChangeType {type: %lu}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
