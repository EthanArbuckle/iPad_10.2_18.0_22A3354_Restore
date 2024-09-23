@implementation RMModelNetworkWiFiDeclaration_HotSpot

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("DisplayedOperatorName");
  v6[1] = CFSTR("DomainName");
  v6[2] = CFSTR("RoamingConsortiumOIs");
  v6[3] = CFSTR("ServiceProviderRoamingEnabled");
  v6[4] = CFSTR("HESSID");
  v6[5] = CFSTR("NAIRealmNames");
  v6[6] = CFSTR("MCCAndMNCs");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDisplayedOperatorName:(id)a3 domainName:(id)a4 roamingConsortiumOIs:(id)a5 serviceProviderRoamingEnabled:(id)a6 HESSID:(id)a7 naiRealmNames:(id)a8 mccAndMNCs:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setPayloadDisplayedOperatorName:", v21);

  objc_msgSend(v22, "setPayloadDomainName:", v20);
  objc_msgSend(v22, "setPayloadRoamingConsortiumOIs:", v19);

  if (v18)
    v23 = v18;
  else
    v23 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v22, "setPayloadServiceProviderRoamingEnabled:", v23);

  objc_msgSend(v22, "setPayloadHESSID:", v17);
  objc_msgSend(v22, "setPayloadNAIRealmNames:", v16);

  objc_msgSend(v22, "setPayloadMCCAndMNCs:", v15);
  return v22;
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

  +[RMModelNetworkWiFiDeclaration_HotSpot allowedPayloadKeys](RMModelNetworkWiFiDeclaration_HotSpot, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("DisplayedOperatorName"), CFSTR("payloadDisplayedOperatorName"), 0, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("DomainName"), CFSTR("payloadDomainName"), 0, 0, a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("RoamingConsortiumOIs"), CFSTR("payloadRoamingConsortiumOIs"), &__block_literal_global_309, 0, 0, a5))
      {
        v13 = 0;
        if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ServiceProviderRoamingEnabled"), CFSTR("payloadServiceProviderRoamingEnabled"), 0, MEMORY[0x24BDBD1C0], a5))
        {
          v13 = 0;
          if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("HESSID"), CFSTR("payloadHESSID"), 0, 0, a5))
          {
            v13 = 0;
            if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("NAIRealmNames"), CFSTR("payloadNAIRealmNames"), &__block_literal_global_316, 0, 0, a5))
            {
              v13 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("MCCAndMNCs"), CFSTR("payloadMCCAndMNCs"), &__block_literal_global_319, 0, 0, a5);
            }
          }
        }
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_opt_new();
  -[RMModelNetworkWiFiDeclaration_HotSpot payloadDisplayedOperatorName](self, "payloadDisplayedOperatorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("DisplayedOperatorName"), v5, 0, 0);

  -[RMModelNetworkWiFiDeclaration_HotSpot payloadDomainName](self, "payloadDomainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("DomainName"), v6, 0, 0);

  -[RMModelNetworkWiFiDeclaration_HotSpot payloadRoamingConsortiumOIs](self, "payloadRoamingConsortiumOIs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("RoamingConsortiumOIs"), v7, &__block_literal_global_320, 0, 0);

  -[RMModelNetworkWiFiDeclaration_HotSpot payloadServiceProviderRoamingEnabled](self, "payloadServiceProviderRoamingEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ServiceProviderRoamingEnabled"), v8, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelNetworkWiFiDeclaration_HotSpot payloadHESSID](self, "payloadHESSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("HESSID"), v9, 0, 0);

  -[RMModelNetworkWiFiDeclaration_HotSpot payloadNAIRealmNames](self, "payloadNAIRealmNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("NAIRealmNames"), v10, &__block_literal_global_321, 0, 0);

  -[RMModelNetworkWiFiDeclaration_HotSpot payloadMCCAndMNCs](self, "payloadMCCAndMNCs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("MCCAndMNCs"), v11, &__block_literal_global_322, 0, 0);

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)RMModelNetworkWiFiDeclaration_HotSpot;
  v4 = -[RMModelPayloadBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadDisplayedOperatorName, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadDomainName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadRoamingConsortiumOIs, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadServiceProviderRoamingEnabled, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadHESSID, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSArray copy](self->_payloadNAIRealmNames, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSArray copy](self->_payloadMCCAndMNCs, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  return v4;
}

- (NSString)payloadDisplayedOperatorName
{
  return self->_payloadDisplayedOperatorName;
}

- (void)setPayloadDisplayedOperatorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadDomainName
{
  return self->_payloadDomainName;
}

- (void)setPayloadDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadRoamingConsortiumOIs
{
  return self->_payloadRoamingConsortiumOIs;
}

- (void)setPayloadRoamingConsortiumOIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadServiceProviderRoamingEnabled
{
  return self->_payloadServiceProviderRoamingEnabled;
}

- (void)setPayloadServiceProviderRoamingEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadHESSID
{
  return self->_payloadHESSID;
}

- (void)setPayloadHESSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadNAIRealmNames
{
  return self->_payloadNAIRealmNames;
}

- (void)setPayloadNAIRealmNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadMCCAndMNCs
{
  return self->_payloadMCCAndMNCs;
}

- (void)setPayloadMCCAndMNCs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMCCAndMNCs, 0);
  objc_storeStrong((id *)&self->_payloadNAIRealmNames, 0);
  objc_storeStrong((id *)&self->_payloadHESSID, 0);
  objc_storeStrong((id *)&self->_payloadServiceProviderRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_payloadRoamingConsortiumOIs, 0);
  objc_storeStrong((id *)&self->_payloadDomainName, 0);
  objc_storeStrong((id *)&self->_payloadDisplayedOperatorName, 0);
}

@end
