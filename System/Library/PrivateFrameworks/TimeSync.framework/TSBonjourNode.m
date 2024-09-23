@implementation TSBonjourNode

- (TSBonjourNode)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TSBonjourNode init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (TSBonjourNode)initWithServiceName:(id)a3 type:(id)a4 andDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  TSBonjourNode *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *type;
  uint64_t v16;
  NSString *domain;
  uint64_t v18;
  NSDictionary *interfaces;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TSBonjourNode;
  v11 = -[TSBonjourNode init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    type = v11->_type;
    v11->_type = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    domain = v11->_domain;
    v11->_domain = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    interfaces = v11->_interfaces;
    v11->_interfaces = (NSDictionary *)v18;

  }
  return v11;
}

- (void)addedOnInterface:(unsigned int)a3 named:(id)a4
{
  uint64_t v4;
  TSBonjourInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  TSBonjourInterface *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *(_QWORD *)&a3;
  v15 = a4;
  v6 = [TSBonjourInterface alloc];
  -[TSBonjourNode name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSBonjourNode type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSBonjourNode domain](self, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TSBonjourInterface initWithServiceName:type:andDomain:onInterfaceIndex:andName:](v6, "initWithServiceName:type:andDomain:onInterfaceIndex:andName:", v7, v8, v9, v4, v15);

  -[TSBonjourInterface setNode:](v10, "setNode:", self);
  -[TSBonjourNode interfaces](self, "interfaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E08];
  if (v11)
  {
    -[TSBonjourNode interfaces](self, "interfaces");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "setObject:forKey:", v10, v15);
  -[TSBonjourNode setInterfaces:](self, "setInterfaces:", v14);

}

- (void)removedFromInterface:(unsigned int)a3 named:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[TSBonjourNode interfaces](self, "interfaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E08];
  if (v6)
  {
    -[TSBonjourNode interfaces](self, "interfaces");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "removeObjectForKey:", v5);

  -[TSBonjourNode setInterfaces:](self, "setInterfaces:", v9);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSDictionary)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
