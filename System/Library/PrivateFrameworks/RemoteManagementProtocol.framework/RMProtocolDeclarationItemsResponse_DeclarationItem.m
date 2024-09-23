@implementation RMProtocolDeclarationItemsResponse_DeclarationItem

+ (NSSet)allowedResponseKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Identifier");
  v6[1] = CFSTR("ServerToken");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 serverToken:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setResponseIdentifier:", v6);

  objc_msgSend(v7, "setResponseServerToken:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 serverToken:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setResponseIdentifier:", v6);

  objc_msgSend(v7, "setResponseServerToken:", v5);
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMProtocolDeclarationItemsResponse_DeclarationItem allowedResponseKeys](RMProtocolDeclarationItemsResponse_DeclarationItem, "allowedResponseKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  if (objc_msgSend(v10, "count"))
  {
    if (a5)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v10, *MEMORY[0x24BDD0FC8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Identifier"), CFSTR("responseIdentifier"), 1, 0, a5))goto LABEL_6;
    LOBYTE(a5) = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ServerToken"), CFSTR("responseServerToken"), 1, 0, a5);
  }

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[RMProtocolDeclarationItemsResponse_DeclarationItem responseIdentifier](self, "responseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Identifier"), v5, 1, 0);

  -[RMProtocolDeclarationItemsResponse_DeclarationItem responseServerToken](self, "responseServerToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ServerToken"), v6, 1, 0);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RMProtocolDeclarationItemsResponse_DeclarationItem;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_responseIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_responseServerToken, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)responseIdentifier
{
  return self->_responseIdentifier;
}

- (void)setResponseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)responseServerToken
{
  return self->_responseServerToken;
}

- (void)setResponseServerToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseServerToken, 0);
  objc_storeStrong((id *)&self->_responseIdentifier, 0);
}

@end
