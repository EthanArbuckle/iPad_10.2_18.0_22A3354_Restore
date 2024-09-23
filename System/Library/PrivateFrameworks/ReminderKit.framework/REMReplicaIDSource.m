@implementation REMReplicaIDSource

+ (id)crdtIDWithObjectID:(id)a3 property:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(a3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (REMReplicaIDSource)initWithAccountID:(id)a3 objectID:(id)a4 property:(id)a5
{
  id v8;
  void *v9;
  REMReplicaIDSource *v10;

  v8 = a3;
  +[REMReplicaIDSource crdtIDWithObjectID:property:](REMReplicaIDSource, "crdtIDWithObjectID:property:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REMReplicaIDSource initWithAccountID:crdtID:](self, "initWithAccountID:crdtID:", v8, v9);

  return v10;
}

- (REMReplicaIDSource)initWithAccountID:(id)a3 crdtID:(id)a4
{
  id v7;
  id v8;
  REMReplicaIDSource *v9;
  REMReplicaIDSource *v10;
  uint64_t v11;
  NSString *crdtID;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMReplicaIDSource;
  v9 = -[REMReplicaIDSource init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountID, a3);
    v11 = objc_msgSend(v8, "copy");
    crdtID = v10->_crdtID;
    v10->_crdtID = (NSString *)v11;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMReplicaIDSource accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountID"));

  -[REMReplicaIDSource crdtID](self, "crdtID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("crdtID"));

}

- (REMReplicaIDSource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  REMReplicaIDSource *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crdtID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[REMReplicaIDSource initWithAccountID:crdtID:](self, "initWithAccountID:crdtID:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMReplicaIDSource *v4;
  void *v5;
  void *v6;
  REMReplicaIDSource *v7;

  v4 = [REMReplicaIDSource alloc];
  -[REMReplicaIDSource accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReplicaIDSource crdtID](self, "crdtID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMReplicaIDSource initWithAccountID:crdtID:](v4, "initWithAccountID:crdtID:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  REMReplicaIDSource *v4;
  REMReplicaIDSource *v5;
  REMReplicaIDSource *v6;
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

  v4 = (REMReplicaIDSource *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMReplicaIDSource accountID](self, "accountID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReplicaIDSource accountID](v6, "accountID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMReplicaIDSource accountID](self, "accountID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReplicaIDSource accountID](v6, "accountID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[REMReplicaIDSource crdtID](self, "crdtID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReplicaIDSource crdtID](v6, "crdtID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {
        v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        -[REMReplicaIDSource crdtID](self, "crdtID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReplicaIDSource crdtID](v6, "crdtID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "isEqual:", v18);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMReplicaIDSource accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReplicaIDSource crdtID](self, "crdtID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (account=%@, crdtId=%@)"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (NSString)crdtID
{
  return self->_crdtID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crdtID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
