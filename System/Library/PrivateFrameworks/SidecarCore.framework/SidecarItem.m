@implementation SidecarItem

- (SidecarItem)initWithData:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  SidecarItem *v9;
  SidecarItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SidecarItem;
  v9 = -[SidecarItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_type, a4);
  }

  return v10;
}

- (SidecarItem)initWithObject:(id)a3 type:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  SidecarItem *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v17 = 0;
  SidecarOPACKEncode(a3, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (!v7 || v8)
  {
    v10 = (void *)MEMORY[0x24BDBCE88];
    v11 = *MEMORY[0x24BDD0E18];
    objc_msgSend(v8, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDD1398];
    v19[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise");

  }
  v15 = -[SidecarItem initWithData:type:](self, "initWithData:type:", v7, v6);

  return v15;
}

- (id)objectValue
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *log;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SidecarItem data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  SidecarOPACKDecode(v2, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;

  v5 = v4;
  if (v5)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      log = v7;
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      v7 = log;
      if (v8)
      {
        objc_msgSend(v5, "domain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v5, "code");
        objc_msgSend(v5, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v15 = v9;
        v16 = 2048;
        v17 = v10;
        v18 = 2113;
        v19 = v11;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v7 = log;
      }
    }

  }
  return v3;
}

- (BOOL)conformsToType:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDF8238], "_typeWithIdentifier:allowUndeclared:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SidecarItem uniformType](self, "uniformType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToType:", v4);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SidecarItem type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SidecarItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu bytes)>"), v4, objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SidecarItem type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SidecarItem data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ (%lu bytes)>"), v5, v6, objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UTType)uniformType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF8238];
  -[SidecarItem type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UTType *)v4;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
