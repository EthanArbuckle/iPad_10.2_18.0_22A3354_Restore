@implementation RMModelDeclarationBase

+ (BOOL)isDeclarationTypeKnown:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (+[RMModelClasses classForDeclarationType:](RMModelClasses, "classForDeclarationType:", v3))
  {
    v4 = 1;
  }
  else
  {
    +[RMModelConfigurationSchema schemas](RMModelConfigurationSchema, "schemas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6 != 0;

  }
  return v4;
}

+ (BOOL)isSupportedDeclaration:(id)a3 platform:(int64_t)a4 scope:(int64_t)a5
{
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v7 = a3;
  v8 = +[RMModelClasses classForDeclarationType:](RMModelClasses, "classForDeclarationType:", v7);
  if (v8)
  {
    if ((-[objc_class isSupportedForPlatform:scope:](v8, "isSupportedForPlatform:scope:", a4, a5) & 1) == 0)
      goto LABEL_9;
  }
  else
  {
    +[RMModelConfigurationSchema schemas](RMModelConfigurationSchema, "schemas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || (objc_msgSend(v10, "isSupportedForPlatform:scope:", a4, a5) & 1) == 0)
    {

LABEL_9:
      v11 = 0;
      goto LABEL_10;
    }

  }
  v11 = 1;
LABEL_10:

  return v11;
}

- (NSString)declarationClassType
{
  return (NSString *)&stru_25160BAF0;
}

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
  int v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("Type"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("(nil)");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  if (!+[RMModelClasses classForDeclarationType:](RMModelClasses, "classForDeclarationType:", v11))
  {
    +[RMModelConfigurationSchema schemas](RMModelConfigurationSchema, "schemas");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
  }
  v14 = (void *)objc_opt_new();
  v15 = objc_msgSend(v14, "loadFromDictionary:serializationType:error:", v7, v6, a5);

  if (v15)
    v16 = v14;
  else
    v16 = 0;

  return v16;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v6 = a4;
  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Type"), CFSTR("declarationType"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Identifier"), CFSTR("declarationIdentifier"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
         "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
         v8,
         CFSTR("ServerToken"),
         CFSTR("declarationServerToken"),
         1,
         0,
         a5))
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
      LOBYTE(a5) = -[RMModelDeclarationBase loadPayloadFromDictionary:serializationType:error:](self, "loadPayloadFromDictionary:serializationType:error:", v12, v6, a5);
    }
    else if (a5)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid nested item in key: %@"), CFSTR("Payload"), *MEMORY[0x24BDD0FC8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v16);
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
  void *v10;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMModelDeclarationBase declarationType](self, "declarationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Type"), v6, 1, 0);

  -[RMModelDeclarationBase declarationIdentifier](self, "declarationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Identifier"), v7, 1, 0);

  -[RMModelDeclarationBase declarationServerToken](self, "declarationServerToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ServerToken"), v8, 1, 0);

  -[RMModelDeclarationBase serializePayloadWithType:](self, "serializePayloadWithType:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("Payload"));

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (void)updateServerToken
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD1770];
  -[RMModelDeclarationBase serializePayloadWithType:](self, "serializePayloadWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 100, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "RMModelSHA1HexString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_25160BAF0;
  }
  objc_storeStrong((id *)&self->_declarationServerToken, v5);
  v6 = v7;
  if (v7)
  {

    v6 = v7;
  }

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
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RMModelDeclarationBase;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_declarationType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_declarationIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_declarationServerToken, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[RMModelAnyPayload copy](self->_declarationPayload, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)declarationType
{
  return self->_declarationType;
}

- (void)setDeclarationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)declarationServerToken
{
  return self->_declarationServerToken;
}

- (void)setDeclarationServerToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (RMModelAnyPayload)declarationPayload
{
  return self->_declarationPayload;
}

- (void)setDeclarationPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationPayload, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
}

@end
