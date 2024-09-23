@implementation _REMNSPersistentHistoryTransactionStorage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
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
  id v13;

  v4 = a3;
  -[_REMNSPersistentHistoryTransactionStorage timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timestamp"));

  -[_REMNSPersistentHistoryTransactionStorage changes](self, "changes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("changes"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[_REMNSPersistentHistoryTransactionStorage transactionNumber](self, "transactionNumber"), CFSTR("transactionNumber"));
  -[_REMNSPersistentHistoryTransactionStorage accountID](self, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("accountID"));

  -[_REMNSPersistentHistoryTransactionStorage storeID](self, "storeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("storeID"));

  -[_REMNSPersistentHistoryTransactionStorage bundleID](self, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("bundleID"));

  -[_REMNSPersistentHistoryTransactionStorage processID](self, "processID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("processID"));

  -[_REMNSPersistentHistoryTransactionStorage contextName](self, "contextName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("contextName"));

  -[_REMNSPersistentHistoryTransactionStorage author](self, "author");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("author"));

  -[_REMNSPersistentHistoryTransactionStorage token](self, "token");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("token"));

}

- (_REMNSPersistentHistoryTransactionStorage)initWithCoder:(id)a3
{
  id v4;
  _REMNSPersistentHistoryTransactionStorage *v5;
  REMNSPersistentHistoryToken *v6;
  REMNSPersistentHistoryToken *token;
  REMNSPersistentHistoryToken *v8;
  uint64_t v9;
  NSDate *timestamp;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *changes;
  uint64_t v16;
  REMObjectID *accountID;
  uint64_t v18;
  NSString *storeID;
  uint64_t v20;
  NSString *bundleID;
  uint64_t v22;
  NSString *processID;
  uint64_t v24;
  NSString *contextName;
  uint64_t v26;
  NSString *author;
  _REMNSPersistentHistoryTransactionStorage *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_REMNSPersistentHistoryTransactionStorage;
  v5 = -[_REMNSPersistentHistoryTransactionStorage init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v6 = (REMNSPersistentHistoryToken *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v28 = 0;
      goto LABEL_6;
    }
    token = v5->_token;
    v5->_token = v6;
    v8 = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v9 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("changes"));
    v14 = objc_claimAutoreleasedReturnValue();
    changes = v5->_changes;
    v5->_changes = (NSArray *)v14;

    v5->_transactionNumber = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("transactionNumber"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v16 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeID"));
    v18 = objc_claimAutoreleasedReturnValue();
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v20 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processID"));
    v22 = objc_claimAutoreleasedReturnValue();
    processID = v5->_processID;
    v5->_processID = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextName"));
    v24 = objc_claimAutoreleasedReturnValue();
    contextName = v5->_contextName;
    v5->_contextName = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("author"));
    v26 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (NSString *)v26;

  }
  v28 = v5;
LABEL_6:

  return v28;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)transactionNumber
{
  return self->_transactionNumber;
}

- (void)setTransactionNumber:(int64_t)a3
{
  self->_transactionNumber = a3;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)processID
{
  return self->_processID;
}

- (void)setProcessID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setContextName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (REMNSPersistentHistoryToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
  objc_storeStrong((id *)&self->_processID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (BOOL)isEqual:(id)a3
{
  _REMNSPersistentHistoryTransactionStorage *v4;
  _REMNSPersistentHistoryTransactionStorage *v5;
  _REMNSPersistentHistoryTransactionStorage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;

  v4 = (_REMNSPersistentHistoryTransactionStorage *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_REMNSPersistentHistoryTransactionStorage timestamp](self, "timestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMNSPersistentHistoryTransactionStorage timestamp](v6, "timestamp");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[_REMNSPersistentHistoryTransactionStorage timestamp](self, "timestamp");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage timestamp](v6, "timestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_35;
      }
      -[_REMNSPersistentHistoryTransactionStorage changes](self, "changes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMNSPersistentHistoryTransactionStorage changes](v6, "changes");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[_REMNSPersistentHistoryTransactionStorage changes](self, "changes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage changes](v6, "changes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_35;
      }
      v20 = -[_REMNSPersistentHistoryTransactionStorage transactionNumber](self, "transactionNumber");
      if (v20 == -[_REMNSPersistentHistoryTransactionStorage transactionNumber](v6, "transactionNumber"))
      {
        -[_REMNSPersistentHistoryTransactionStorage accountID](self, "accountID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage accountID](v6, "accountID");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v21 == (void *)v22)
        {

        }
        else
        {
          v23 = (void *)v22;
          -[_REMNSPersistentHistoryTransactionStorage accountID](self, "accountID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_REMNSPersistentHistoryTransactionStorage accountID](v6, "accountID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqual:", v25);

          if (!v26)
            goto LABEL_35;
        }
        -[_REMNSPersistentHistoryTransactionStorage storeID](self, "storeID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage storeID](v6, "storeID");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v27 == (void *)v28)
        {

        }
        else
        {
          v29 = (void *)v28;
          -[_REMNSPersistentHistoryTransactionStorage storeID](self, "storeID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[_REMNSPersistentHistoryTransactionStorage storeID](v6, "storeID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "isEqual:", v31);

          if (!v32)
            goto LABEL_35;
        }
        -[_REMNSPersistentHistoryTransactionStorage bundleID](self, "bundleID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage bundleID](v6, "bundleID");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v33 == (void *)v34)
        {

        }
        else
        {
          v35 = (void *)v34;
          -[_REMNSPersistentHistoryTransactionStorage bundleID](self, "bundleID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[_REMNSPersistentHistoryTransactionStorage bundleID](v6, "bundleID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isEqual:", v37);

          if (!v38)
            goto LABEL_35;
        }
        -[_REMNSPersistentHistoryTransactionStorage processID](self, "processID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage processID](v6, "processID");
        v40 = objc_claimAutoreleasedReturnValue();
        if (v39 == (void *)v40)
        {

        }
        else
        {
          v41 = (void *)v40;
          -[_REMNSPersistentHistoryTransactionStorage processID](self, "processID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_REMNSPersistentHistoryTransactionStorage processID](v6, "processID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "isEqual:", v43);

          if (!v44)
            goto LABEL_35;
        }
        -[_REMNSPersistentHistoryTransactionStorage contextName](self, "contextName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage contextName](v6, "contextName");
        v46 = objc_claimAutoreleasedReturnValue();
        if (v45 == (void *)v46)
        {

        }
        else
        {
          v47 = (void *)v46;
          -[_REMNSPersistentHistoryTransactionStorage contextName](self, "contextName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[_REMNSPersistentHistoryTransactionStorage contextName](v6, "contextName");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "isEqual:", v49);

          if (!v50)
            goto LABEL_35;
        }
        -[_REMNSPersistentHistoryTransactionStorage author](self, "author");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage author](v6, "author");
        v52 = objc_claimAutoreleasedReturnValue();
        if (v51 == (void *)v52)
        {

        }
        else
        {
          v53 = (void *)v52;
          -[_REMNSPersistentHistoryTransactionStorage author](self, "author");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[_REMNSPersistentHistoryTransactionStorage author](v6, "author");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v54, "isEqual:", v55);

          if (!v56)
            goto LABEL_35;
        }
        -[_REMNSPersistentHistoryTransactionStorage token](self, "token");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMNSPersistentHistoryTransactionStorage token](v6, "token");
        v59 = objc_claimAutoreleasedReturnValue();
        if (v58 == (void *)v59)
        {
          v13 = 1;
          v60 = v58;
        }
        else
        {
          v60 = (void *)v59;
          -[_REMNSPersistentHistoryTransactionStorage token](self, "token");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[_REMNSPersistentHistoryTransactionStorage token](v6, "token");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v61, "isEqual:", v62);

        }
        goto LABEL_36;
      }
    }
LABEL_35:
    v13 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v13 = 1;
LABEL_37:

  return v13;
}

@end
