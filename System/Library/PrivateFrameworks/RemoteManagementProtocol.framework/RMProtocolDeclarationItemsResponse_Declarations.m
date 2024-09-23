@implementation RMProtocolDeclarationItemsResponse_Declarations

+ (NSSet)allowedResponseKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Activations");
  v6[1] = CFSTR("Configurations");
  v6[2] = CFSTR("Assets");
  v6[3] = CFSTR("Management");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setResponseActivations:", v12);

  objc_msgSend(v13, "setResponseConfigurations:", v11);
  objc_msgSend(v13, "setResponseAssets:", v10);

  objc_msgSend(v13, "setResponseManagement:", v9);
  return v13;
}

+ (id)buildRequiredOnlyWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setResponseActivations:", v12);

  objc_msgSend(v13, "setResponseConfigurations:", v11);
  objc_msgSend(v13, "setResponseAssets:", v10);

  objc_msgSend(v13, "setResponseManagement:", v9);
  return v13;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMProtocolDeclarationItemsResponse_Declarations allowedResponseKeys](RMProtocolDeclarationItemsResponse_Declarations, "allowedResponseKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  if (objc_msgSend(v11, "count"))
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = 0;
  }
  else
  {
    LOWORD(v18) = a4;
    v16 = 0;
    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Activations"), CFSTR("responseActivations"), objc_opt_class(), 0, 1, 0, v18, a5))
    {
      LOWORD(v19) = a4;
      v16 = 0;
      if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Configurations"), CFSTR("responseConfigurations"), objc_opt_class(), 0, 1, 0, v19, a5))
      {
        LOWORD(v20) = a4;
        v16 = 0;
        if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Assets"), CFSTR("responseAssets"), objc_opt_class(), 0, 1, 0, v20, a5))
        {
          LOWORD(v21) = a4;
          v16 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Management"), CFSTR("responseManagement"), objc_opt_class(), 0, 1, 0, v21, a5);
        }
      }
    }
  }

  return v16;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  signed __int16 v14;
  _QWORD v15[4];
  signed __int16 v16;
  _QWORD v17[4];
  signed __int16 v18;
  _QWORD v19[4];
  signed __int16 v20;

  v5 = (void *)objc_opt_new();
  -[RMProtocolDeclarationItemsResponse_Declarations responseActivations](self, "responseActivations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke;
  v19[3] = &__block_descriptor_34_e74___NSDictionary_16__0__RMProtocolDeclarationItemsResponse_DeclarationItem_8l;
  v20 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Activations"), v6, v19, 1, 0);

  -[RMProtocolDeclarationItemsResponse_Declarations responseConfigurations](self, "responseConfigurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_2;
  v17[3] = &__block_descriptor_34_e74___NSDictionary_16__0__RMProtocolDeclarationItemsResponse_DeclarationItem_8l;
  v18 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Configurations"), v8, v17, 1, 0);

  -[RMProtocolDeclarationItemsResponse_Declarations responseAssets](self, "responseAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_3;
  v15[3] = &__block_descriptor_34_e74___NSDictionary_16__0__RMProtocolDeclarationItemsResponse_DeclarationItem_8l;
  v16 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Assets"), v9, v15, 1, 0);

  -[RMProtocolDeclarationItemsResponse_Declarations responseManagement](self, "responseManagement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_4;
  v13[3] = &__block_descriptor_34_e74___NSDictionary_16__0__RMProtocolDeclarationItemsResponse_DeclarationItem_8l;
  v14 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Management"), v10, v13, 1, 0);

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
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
  v14.super_class = (Class)RMProtocolDeclarationItemsResponse_Declarations;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_responseActivations, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_responseConfigurations, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_responseAssets, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_responseManagement, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSArray)responseActivations
{
  return self->_responseActivations;
}

- (void)setResponseActivations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)responseConfigurations
{
  return self->_responseConfigurations;
}

- (void)setResponseConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)responseAssets
{
  return self->_responseAssets;
}

- (void)setResponseAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)responseManagement
{
  return self->_responseManagement;
}

- (void)setResponseManagement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseManagement, 0);
  objc_storeStrong((id *)&self->_responseAssets, 0);
  objc_storeStrong((id *)&self->_responseConfigurations, 0);
  objc_storeStrong((id *)&self->_responseActivations, 0);
}

@end
