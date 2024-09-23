@implementation REMReplicaEntry

- (REMReplicaEntry)initWithReplicaUUIDIndex:(unsigned int)a3 clockElementList:(id)a4 inUse:(BOOL)a5 forClient:(id)a6
{
  id v11;
  REMReplicaManagerClient *v12;
  REMReplicaEntry *v13;
  REMReplicaEntry *v14;
  objc_super v16;

  v11 = a4;
  v12 = (REMReplicaManagerClient *)a6;
  v16.receiver = self;
  v16.super_class = (Class)REMReplicaEntry;
  v13 = -[REMReplicaEntry init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_replicaUUIDIndex = a3;
    objc_storeStrong((id *)&v13->_clockElementList, a4);
    v14->_inUse = a5;
    v14->_client = v12;
  }

  return v14;
}

- (void)encodeIntoEntryArchive:(void *)a3
{
  unsigned int v5;
  id v6;

  v5 = -[REMReplicaEntry replicaUUIDIndex](self, "replicaUUIDIndex");
  *((_DWORD *)a3 + 8) |= 2u;
  *((_DWORD *)a3 + 11) = v5;
  -[REMReplicaEntry clockElementList](self, "clockElementList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeIntoEntryArchive:", a3);

}

- (REMReplicaEntry)initWithEntryArchive:(const void *)a3
{
  REMClockElementList *v5;
  REMReplicaEntry *v6;

  v5 = -[REMClockElementList initWithEntryArchive:]([REMClockElementList alloc], "initWithEntryArchive:", a3);
  v6 = -[REMReplicaEntry initWithReplicaUUIDIndex:clockElementList:inUse:forClient:](self, "initWithReplicaUUIDIndex:clockElementList:inUse:forClient:", *((unsigned int *)a3 + 11), v5, 0, 0);

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[REMReplicaEntry replicaUUIDIndex](self, "replicaUUIDIndex");
  -[REMReplicaEntry clockElementList](self, "clockElementList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMReplicaEntry inUse](self, "inUse");
  v8 = CFSTR("Available");
  if (v7)
    v8 = CFSTR("In Use");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>{UUID: %d, clock: %@, state: %@}"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)persistenceDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[REMReplicaEntry replicaUUIDIndex](self, "replicaUUIDIndex");
  -[REMReplicaEntry clockElementList](self, "clockElementList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{UUID: %d, clock: %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasEqualPersistedPropertiesAs:(id)a3
{
  REMReplicaEntry *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (REMReplicaEntry *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v5 = -[REMReplicaEntry replicaUUIDIndex](self, "replicaUUIDIndex");
    if (v5 == -[REMReplicaEntry replicaUUIDIndex](v4, "replicaUUIDIndex"))
    {
      -[REMReplicaEntry clockElementList](self, "clockElementList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReplicaEntry clockElementList](v4, "clockElementList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
        v7 = v6;
      }
      else
      {
        -[REMReplicaEntry clockElementList](self, "clockElementList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReplicaEntry clockElementList](v4, "clockElementList");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unsigned)replicaUUIDIndex
{
  return self->_replicaUUIDIndex;
}

- (void)setReplicaUUIDIndex:(unsigned int)a3
{
  self->_replicaUUIDIndex = a3;
}

- (REMClockElementList)clockElementList
{
  return self->_clockElementList;
}

- (void)setClockElementList:(id)a3
{
  objc_storeStrong((id *)&self->_clockElementList, a3);
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (REMReplicaManagerClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  self->_client = (REMReplicaManagerClient *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockElementList, 0);
}

@end
