@implementation SYDStoreConfiguration

- (NSString)processName
{
  return self->_processName;
}

- (void)encodeWithCoder:(id)a3
{
  SYDStoreID *storeID;
  id v5;

  storeID = self->_storeID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", storeID, CFSTR("s"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processName, CFSTR("n"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
}

- (SYDStoreConfiguration)initWithCoder:(id)a3
{
  id v4;
  SYDStoreConfiguration *v5;
  uint64_t v6;
  SYDStoreID *storeID;
  uint64_t v8;
  NSString *processName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYDStoreConfiguration;
  v5 = -[SYDStoreConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
    v6 = objc_claimAutoreleasedReturnValue();
    storeID = v5->_storeID;
    v5->_storeID = (SYDStoreID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("n"));
    v8 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDStoreConfiguration storeID](self, "storeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; storeID=%@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (SYDStoreID)storeID
{
  return self->_storeID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYDStoreConfiguration)initWithStoreID:(id)a3
{
  id v6;
  SYDStoreConfiguration *v7;
  SYDStoreConfiguration *v8;
  void *v9;
  uint64_t v10;
  NSString *processName;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDStoreConfiguration.m"), 34, CFSTR("Must specify a non-nil storeID when initializing %@"), v15);

  }
  v16.receiver = self;
  v16.super_class = (Class)SYDStoreConfiguration;
  v7 = -[SYDStoreConfiguration init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_storeID, a3);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = objc_claimAutoreleasedReturnValue();
    processName = v8->_processName;
    v8->_processName = (NSString *)v10;

  }
  return v8;
}

- (SYDStoreConfiguration)init
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithStoreID_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDStoreConfiguration.m"), 45, CFSTR("Use -[%@ %@]"), v6, v7);

  return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SYDStoreConfiguration storeID](self, "storeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SYDStoreConfiguration processName](self, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    objc_msgSend(v5, "storeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDStoreConfiguration storeID](self, "storeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      objc_msgSend(v5, "processName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYDStoreConfiguration processName](self, "processName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SYDStoreConfiguration *v4;
  void *v5;
  void *v6;
  SYDStoreConfiguration *v7;
  void *v8;
  void *v9;

  v4 = [SYDStoreConfiguration alloc];
  -[SYDStoreConfiguration storeID](self, "storeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[SYDStoreConfiguration initWithStoreID:](v4, "initWithStoreID:", v6);

  -[SYDStoreConfiguration processName](self, "processName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[SYDStoreConfiguration setProcessName:](v7, "setProcessName:", v9);

  return v7;
}

- (void)setStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_storeID, a3);
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
