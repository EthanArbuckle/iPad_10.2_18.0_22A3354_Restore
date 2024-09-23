@implementation RMModelNetworkEAPDeclaration_EAPFAST

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("UsePrivateAccessToken");
  v6[1] = CFSTR("UsePAC");
  v6[2] = CFSTR("ProvisionPAC");
  v6[3] = CFSTR("ProvisionPACAnonymously");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithUsePrivateAccessToken:(id)a3 usePAC:(id)a4 provisionPAC:(id)a5 provisionPACAnonymously:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  v15 = (void *)MEMORY[0x24BDBD1C0];
  if (v12)
    v16 = v12;
  else
    v16 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v13, "setPayloadUsePrivateAccessToken:", v16);

  if (v11)
    v17 = v11;
  else
    v17 = v15;
  objc_msgSend(v14, "setPayloadUsePAC:", v17);

  if (v10)
    v18 = v10;
  else
    v18 = v15;
  objc_msgSend(v14, "setPayloadProvisionPAC:", v18);

  if (v9)
    v19 = v9;
  else
    v19 = v15;
  objc_msgSend(v14, "setPayloadProvisionPACAnonymously:", v19);

  return v14;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelNetworkEAPDeclaration_EAPFAST allowedPayloadKeys](RMModelNetworkEAPDeclaration_EAPFAST, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("UsePrivateAccessToken"), CFSTR("payloadUsePrivateAccessToken"), 0, MEMORY[0x24BDBD1C0], a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("UsePAC"), CFSTR("payloadUsePAC"), 0, MEMORY[0x24BDBD1C0], a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ProvisionPAC"), CFSTR("payloadProvisionPAC"), 0, MEMORY[0x24BDBD1C0], a5))
      {
        v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ProvisionPACAnonymously"), CFSTR("payloadProvisionPACAnonymously"), 0, MEMORY[0x24BDBD1C0], a5);
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  -[RMModelNetworkEAPDeclaration_EAPFAST payloadUsePrivateAccessToken](self, "payloadUsePrivateAccessToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("UsePrivateAccessToken"), v5, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelNetworkEAPDeclaration_EAPFAST payloadUsePAC](self, "payloadUsePAC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("UsePAC"), v7, 0, v6);

  -[RMModelNetworkEAPDeclaration_EAPFAST payloadProvisionPAC](self, "payloadProvisionPAC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ProvisionPAC"), v8, 0, v6);

  -[RMModelNetworkEAPDeclaration_EAPFAST payloadProvisionPACAnonymously](self, "payloadProvisionPACAnonymously");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ProvisionPACAnonymously"), v9, 0, v6);

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
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
  v14.super_class = (Class)RMModelNetworkEAPDeclaration_EAPFAST;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadUsePrivateAccessToken, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadUsePAC, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadProvisionPAC, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadProvisionPACAnonymously, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadUsePrivateAccessToken
{
  return self->_payloadUsePrivateAccessToken;
}

- (void)setPayloadUsePrivateAccessToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadUsePAC
{
  return self->_payloadUsePAC;
}

- (void)setPayloadUsePAC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadProvisionPAC
{
  return self->_payloadProvisionPAC;
}

- (void)setPayloadProvisionPAC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadProvisionPACAnonymously
{
  return self->_payloadProvisionPACAnonymously;
}

- (void)setPayloadProvisionPACAnonymously:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProvisionPACAnonymously, 0);
  objc_storeStrong((id *)&self->_payloadProvisionPAC, 0);
  objc_storeStrong((id *)&self->_payloadUsePAC, 0);
  objc_storeStrong((id *)&self->_payloadUsePrivateAccessToken, 0);
}

@end
