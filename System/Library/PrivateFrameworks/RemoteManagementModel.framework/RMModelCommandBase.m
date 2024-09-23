@implementation RMModelCommandBase

+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v6 = a4;
  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("Type"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("(nil)");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  if (+[RMModelClasses classForCommandType:](RMModelClasses, "classForCommandType:", v11))
  {
    v12 = (void *)objc_opt_new();
    if (objc_msgSend(v12, "loadFromDictionary:serializationType:error:", v7, v6, a5))
      a5 = v12;
    else
      a5 = 0;

  }
  else if (a5)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not match command type: %@"), v11, *MEMORY[0x24BDD0FC8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v6 = a4;
  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Type"), CFSTR("commandType"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Identifier"), CFSTR("commandIdentifier"), 1, 0, a5))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Payload"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x24BDBD1B8];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LOBYTE(a5) = -[RMModelCommandBase loadPayloadFromDictionary:serializationType:error:](self, "loadPayloadFromDictionary:serializationType:error:", v12, v6, a5);
    }
    else if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid nested item in key: %@"), CFSTR("Payload"), *MEMORY[0x24BDD0FC8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }

  }
  else
  {
    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMModelCommandBase commandType](self, "commandType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Type"), v6, 1, 0);

  -[RMModelCommandBase commandIdentifier](self, "commandIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Identifier"), v7, 1, 0);

  -[RMModelCommandBase serializePayloadWithType:](self, "serializePayloadWithType:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Payload"));
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RMModelCommandBase;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_commandType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_commandIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[RMModelAnyPayload copy](self->_commandPayload, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)commandIdentifier
{
  return self->_commandIdentifier;
}

- (void)setCommandIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RMModelAnyPayload)commandPayload
{
  return self->_commandPayload;
}

- (void)setCommandPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandPayload, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
  objc_storeStrong((id *)&self->_commandType, 0);
}

@end
