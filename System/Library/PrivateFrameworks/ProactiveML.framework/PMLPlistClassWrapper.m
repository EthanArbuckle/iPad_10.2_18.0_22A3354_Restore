@implementation PMLPlistClassWrapper

- (PMLPlistClassWrapper)initWithClassNameKey:(id)a3
{
  id v5;
  PMLPlistClassWrapper *v6;
  PMLPlistClassWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLPlistClassWrapper;
  v6 = -[PMLPlistClassWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_classNameKey, a3);

  return v7;
}

- (id)writeToPlistWithObject:(id)a3 andChunks:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *classNameKey;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  classNameKey = self->_classNameKey;
  v5 = a4;
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &classNameKey, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v6, "toPlistWithChunks:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addEntriesFromDictionary:", v11);
  return v10;
}

- (id)readObjectWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  Class v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPlistClassWrapper.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plist"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", self->_classNameKey);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = NSClassFromString(v12);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPlistClassWrapper.m"), 42, CFSTR("Invalid plan. Unknown class: %@"), 0);

  }
  if ((-[objc_class conformsToProtocol:](v13, "conformsToProtocol:", &unk_254DF50D0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPlistClassWrapper.m"), 45, CFSTR("Invalid plan. class %@ doesn't conform to %@"), v13, &unk_254DF50D0);

  }
  v14 = (void *)objc_msgSend([v13 alloc], "initWithPlist:chunks:context:", v9, v10, v11);

  return v14;
}

- (id)writeToDataWithObject:(id)a3 andChunks:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1770];
  -[PMLPlistClassWrapper writeToPlistWithObject:andChunks:](self, "writeToPlistWithObject:andChunks:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (!v6)
  {
    PML_LogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_2159BB000, v8, OS_LOG_TYPE_ERROR, "Error writing object to NSData: %@", buf, 0xCu);
    }

  }
  return v6;
}

- (id)readObjectWithData:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v10)
  {
    -[PMLPlistClassWrapper readObjectWithPlist:chunks:context:](self, "readObjectWithPlist:chunks:context:", v10, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PML_LogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_error_impl(&dword_2159BB000, v13, OS_LOG_TYPE_ERROR, "Error reading object from NSData: %@", buf, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classNameKey, 0);
}

@end
