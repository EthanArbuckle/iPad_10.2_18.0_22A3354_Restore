@implementation XBLaunchInterface

- (XBLaunchInterface)initWithCoder:(id)a3
{
  id v5;
  XBLaunchInterface *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  void *v15;
  uint64_t v16;
  XBLaunchInterfaceConfiguration *configuration;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *urlSchemes;
  void *v27;
  void *v28;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)XBLaunchInterface;
  v6 = -[XBLaunchInterface init](&v29, sel_init);
  if (v6)
  {
    if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_type = objc_msgSend(v5, "decodeInt64ForKey:", v28);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v9;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    configuration = v6->_configuration;
    v6->_configuration = (XBLaunchInterfaceConfiguration *)v16;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "default");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_default = objc_msgSend(v5, "decodeBoolForKey:", v18);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "urlSchemes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v22, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    urlSchemes = v6->_urlSchemes;
    v6->_urlSchemes = (NSArray *)v24;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_urlSchemes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (XBLaunchInterface)initWithType:(unint64_t)a3 name:(id)a4 identifier:(id)a5 urlSchemes:(id)a6 isDefault:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  XBLaunchInterface *v15;
  XBLaunchInterface *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  NSArray *urlSchemes;
  objc_super v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)XBLaunchInterface;
  v15 = -[XBLaunchInterface init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v17 = objc_msgSend(v12, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    urlSchemes = v16->_urlSchemes;
    v16->_urlSchemes = (NSArray *)v21;

    v16->_default = a7;
  }

  return v16;
}

- (XBLaunchInterface)initWithConfiguration:(id)a3 identifier:(id)a4 urlSchemes:(id)a5 isDefault:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  XBLaunchInterface *v14;
  XBLaunchInterface *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSArray *urlSchemes;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)XBLaunchInterface;
  v14 = -[XBLaunchInterface init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = 2;
    v16 = objc_msgSend(v12, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    urlSchemes = v15->_urlSchemes;
    v15->_urlSchemes = (NSArray *)v18;

    v15->_default = a6;
    objc_storeStrong((id *)&v15->_configuration, a3);
  }

  return v15;
}

- (XBLaunchInterface)initWithXPCDictionary:(id)a3
{
  id v4;
  XBLaunchInterface *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  XBLaunchInterfaceConfiguration *configuration;
  uint64_t v12;
  NSArray *urlSchemes;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)XBLaunchInterface;
  v5 = -[XBLaunchInterface init](&v15, sel_init);
  if (v5)
  {
    v5->_type = xpc_dictionary_get_int64(v4, "type");
    v6 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v10 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (XBLaunchInterfaceConfiguration *)v10;

    v5->_default = xpc_dictionary_get_BOOL(v4, "default");
    v12 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    urlSchemes = v5->_urlSchemes;
    v5->_urlSchemes = (NSArray *)v12;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  int64_t type;
  xpc_object_t xdict;

  type = self->_type;
  xdict = a3;
  xpc_dictionary_set_int64(xdict, "type", type);
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "default", self->_default);
  BSSerializeCFValueToXPCDictionaryWithKey();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "type");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, v12);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_configuration, v8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "default");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", self->_default, v9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "urlSchemes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlSchemes, v10);

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t type;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_configuration, CFSTR("configuration"));
  type = self->_type;
  v8 = CFSTR("(null)");
  if (type == 1)
    v8 = CFSTR("Storyboard");
  if (type)
    v9 = v8;
  else
    v9 = CFSTR("XIB");
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("type"));
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", self->_urlSchemes, CFSTR("urlSchemes"));
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", self->_default, CFSTR("default"));
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)isStoryboard
{
  return self->_type == 1;
}

- (BOOL)isXIB
{
  return self->_type == 0;
}

- (BOOL)isConfiguration
{
  return self->_type == 2;
}

- (BOOL)_isDefault
{
  return self->_default;
}

- (void)set_default:(BOOL)a3
{
  self->_default = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)urlSchemes
{
  return self->_urlSchemes;
}

- (void)setUrlSchemes:(id)a3
{
  objc_storeStrong((id *)&self->_urlSchemes, a3);
}

- (XBLaunchInterfaceConfiguration)configuration
{
  return self->_configuration;
}

@end
