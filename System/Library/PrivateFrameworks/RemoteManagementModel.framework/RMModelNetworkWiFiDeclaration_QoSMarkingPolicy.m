@implementation RMModelNetworkWiFiDeclaration_QoSMarkingPolicy

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AllowListAppIdentifiers");
  v6[1] = CFSTR("AppleAudioVideoCalls");
  v6[2] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithAllowListAppIdentifiers:(id)a3 appleAudioVideoCalls:(id)a4 enabled:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadAllowListAppIdentifiers:", v9);

  v11 = (void *)MEMORY[0x24BDBD1C8];
  if (v8)
    v12 = v8;
  else
    v12 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v10, "setPayloadAppleAudioVideoCalls:", v12);

  if (v7)
    v13 = v7;
  else
    v13 = v11;
  objc_msgSend(v10, "setPayloadEnabled:", v13);

  return v10;
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

  +[RMModelNetworkWiFiDeclaration_QoSMarkingPolicy allowedPayloadKeys](RMModelNetworkWiFiDeclaration_QoSMarkingPolicy, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("AllowListAppIdentifiers"), CFSTR("payloadAllowListAppIdentifiers"), &__block_literal_global_374, 0, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AppleAudioVideoCalls"), CFSTR("payloadAppleAudioVideoCalls"), 0, MEMORY[0x24BDBD1C8], a5))
    {
      v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Enabled"), CFSTR("payloadEnabled"), 0, MEMORY[0x24BDBD1C8], a5);
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_opt_new();
  -[RMModelNetworkWiFiDeclaration_QoSMarkingPolicy payloadAllowListAppIdentifiers](self, "payloadAllowListAppIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AllowListAppIdentifiers"), v5, &__block_literal_global_379, 0, 0);

  -[RMModelNetworkWiFiDeclaration_QoSMarkingPolicy payloadAppleAudioVideoCalls](self, "payloadAppleAudioVideoCalls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDBD1C8];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AppleAudioVideoCalls"), v6, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelNetworkWiFiDeclaration_QoSMarkingPolicy payloadEnabled](self, "payloadEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Enabled"), v8, 0, v7);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
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
  v12.super_class = (Class)RMModelNetworkWiFiDeclaration_QoSMarkingPolicy;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadAllowListAppIdentifiers, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadAppleAudioVideoCalls, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadEnabled, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSArray)payloadAllowListAppIdentifiers
{
  return self->_payloadAllowListAppIdentifiers;
}

- (void)setPayloadAllowListAppIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadAppleAudioVideoCalls
{
  return self->_payloadAppleAudioVideoCalls;
}

- (void)setPayloadAppleAudioVideoCalls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
  objc_storeStrong((id *)&self->_payloadAppleAudioVideoCalls, 0);
  objc_storeStrong((id *)&self->_payloadAllowListAppIdentifiers, 0);
}

@end
