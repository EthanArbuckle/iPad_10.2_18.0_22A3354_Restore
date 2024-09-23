@implementation REMNSPersistentHistoryTransaction

- (REMNSPersistentHistoryTransaction)initWithStorage:(id)a3
{
  id v5;
  REMNSPersistentHistoryTransaction *v6;
  REMNSPersistentHistoryTransaction *v7;
  REMNSPersistentHistoryTransaction *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)REMNSPersistentHistoryTransaction;
    v6 = -[REMNSPersistentHistoryTransaction init](&v10, sel_init);
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

- (void)_resolveAccountID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountID:", v4);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transactionNumber");
  -[REMNSPersistentHistoryTransaction timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMNSPersistentHistoryTransaction storeID](self, "storeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMNSPersistentHistoryTransaction author](self, "author");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMNSPersistentHistoryTransaction changes](self, "changes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[REMNSPersistentHistoryTransaction token](self, "token");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<REMNSPersistentHistoryTransaction - txnNo(%lld) timestamp(%@) storeID(%@) contextName(%@) author(%@) chgCount(%ld) token(%@)>"), v4, v5, v6, v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)timestamp
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)changes
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)token
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountID
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)storeID
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)author
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "author");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  -[REMNSPersistentHistoryTransaction storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("storage"));

}

- (REMNSPersistentHistoryTransaction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMNSPersistentHistoryTransaction *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMNSPersistentHistoryTransaction initWithStorage:](self, "initWithStorage:", v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[REMNSPersistentHistoryTransaction storage](v6, "storage", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setInternal_ChangeTransaction:", v6);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v6;
}

- (_REMNSPersistentHistoryTransactionStorage)storage
{
  return (_REMNSPersistentHistoryTransactionStorage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (BOOL)isEqual:(id)a3
{
  REMNSPersistentHistoryTransaction *v4;
  REMNSPersistentHistoryTransaction *v5;
  REMNSPersistentHistoryTransaction *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMNSPersistentHistoryTransaction *)a3;
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
      -[REMNSPersistentHistoryTransaction storage](self, "storage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMNSPersistentHistoryTransaction storage](v6, "storage");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[REMNSPersistentHistoryTransaction storage](self, "storage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMNSPersistentHistoryTransaction storage](v6, "storage");
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

@end
