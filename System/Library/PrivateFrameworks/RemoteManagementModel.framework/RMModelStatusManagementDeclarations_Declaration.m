@implementation RMModelStatusManagementDeclarations_Declaration

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("server-token");
  v6[2] = CFSTR("active");
  v6[3] = CFSTR("valid");
  v6[4] = CFSTR("reasons");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 serverToken:(id)a4 active:(id)a5 valid:(id)a6 reasons:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setStatusIdentifier:", v15);

  objc_msgSend(v16, "setStatusServerToken:", v14);
  objc_msgSend(v16, "setStatusActive:", v13);

  objc_msgSend(v16, "setStatusValid:", v12);
  objc_msgSend(v16, "setStatusReasons:", v11);

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 serverToken:(id)a4 active:(id)a5 valid:(id)a6
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
  objc_msgSend(v13, "setStatusIdentifier:", v12);

  objc_msgSend(v13, "setStatusServerToken:", v11);
  objc_msgSend(v13, "setStatusActive:", v10);

  objc_msgSend(v13, "setStatusValid:", v9);
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
  BOOL v14;
  uint64_t v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelStatusManagementDeclarations_Declaration allowedStatusKeys](RMModelStatusManagementDeclarations_Declaration, "allowedStatusKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("identifier"), CFSTR("statusIdentifier"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("server-token"), CFSTR("statusServerToken"), 1, 0, a5)&& -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
         "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
         v8,
         CFSTR("active"),
         CFSTR("statusActive"),
         1,
         0,
         a5)
    && -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("valid"), CFSTR("statusValid"), 1, 0, a5))
  {
    LOWORD(v16) = a4;
    v14 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("reasons"), CFSTR("statusReasons"), objc_opt_class(), 0, 0, 0, v16, a5);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  signed __int16 v14;

  v5 = (void *)objc_opt_new();
  -[RMModelStatusManagementDeclarations_Declaration statusIdentifier](self, "statusIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("identifier"), v6, 1, 0);

  -[RMModelStatusManagementDeclarations_Declaration statusServerToken](self, "statusServerToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("server-token"), v7, 1, 0);

  -[RMModelStatusManagementDeclarations_Declaration statusActive](self, "statusActive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("active"), v8, 1, 0);

  -[RMModelStatusManagementDeclarations_Declaration statusValid](self, "statusValid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("valid"), v9, 1, 0);

  -[RMModelStatusManagementDeclarations_Declaration statusReasons](self, "statusReasons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__RMModelStatusManagementDeclarations_Declaration_serializeWithType___block_invoke;
  v13[3] = &__block_descriptor_34_e43___NSDictionary_16__0__RMModelStatusReason_8l;
  v14 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("reasons"), v10, v13, 0, 0);

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
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RMModelStatusManagementDeclarations_Declaration;
  v4 = -[RMModelPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusServerToken, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_statusActive, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_statusValid, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSArray copy](self->_statusReasons, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusServerToken
{
  return self->_statusServerToken;
}

- (void)setStatusServerToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)statusActive
{
  return self->_statusActive;
}

- (void)setStatusActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)statusValid
{
  return self->_statusValid;
}

- (void)setStatusValid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)statusReasons
{
  return self->_statusReasons;
}

- (void)setStatusReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusReasons, 0);
  objc_storeStrong((id *)&self->_statusValid, 0);
  objc_storeStrong((id *)&self->_statusActive, 0);
  objc_storeStrong((id *)&self->_statusServerToken, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end
