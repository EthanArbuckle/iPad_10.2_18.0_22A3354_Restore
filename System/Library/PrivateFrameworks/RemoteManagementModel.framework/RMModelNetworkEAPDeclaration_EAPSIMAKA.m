@implementation RMModelNetworkEAPDeclaration_EAPSIMAKA

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("NumberOfRANDs");
  v6[1] = CFSTR("Realm");
  v6[2] = CFSTR("NotificationActions");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithNumberOfRANDs:(id)a3 realm:(id)a4 notificationActions:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = &unk_251629CE8;
  objc_msgSend(v10, "setPayloadNumberOfRANDs:", v12);

  objc_msgSend(v11, "setPayloadRealm:", v8);
  objc_msgSend(v11, "setPayloadNotificationActions:", v7);

  return v11;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
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

  +[RMModelNetworkEAPDeclaration_EAPSIMAKA allowedPayloadKeys](RMModelNetworkEAPDeclaration_EAPSIMAKA, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("NumberOfRANDs"), CFSTR("payloadNumberOfRANDs"), 0, &unk_251629CE8, a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Realm"), CFSTR("payloadRealm"), 0, 0, a5))
    {
      LOWORD(v16) = a4;
      v14 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("NotificationActions"), CFSTR("payloadNotificationActions"), objc_opt_class(), 0, 0, 0, v16, a5);
    }
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
  _QWORD v11[4];
  signed __int16 v12;

  v5 = (void *)objc_opt_new();
  -[RMModelNetworkEAPDeclaration_EAPSIMAKA payloadNumberOfRANDs](self, "payloadNumberOfRANDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("NumberOfRANDs"), v6, 0, &unk_251629CE8);

  -[RMModelNetworkEAPDeclaration_EAPSIMAKA payloadRealm](self, "payloadRealm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Realm"), v7, 0, 0);

  -[RMModelNetworkEAPDeclaration_EAPSIMAKA payloadNotificationActions](self, "payloadNotificationActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__RMModelNetworkEAPDeclaration_EAPSIMAKA_serializeWithType___block_invoke;
  v11[3] = &__block_descriptor_34_e80___NSDictionary_16__0__RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction_8l;
  v12 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("NotificationActions"), v8, v11, 0, 0);

  v9 = (void *)objc_msgSend(v5, "copy");
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
  v12.super_class = (Class)RMModelNetworkEAPDeclaration_EAPSIMAKA;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadNumberOfRANDs, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadRealm, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadNotificationActions, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)payloadNumberOfRANDs
{
  return self->_payloadNumberOfRANDs;
}

- (void)setPayloadNumberOfRANDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadRealm
{
  return self->_payloadRealm;
}

- (void)setPayloadRealm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadNotificationActions
{
  return self->_payloadNotificationActions;
}

- (void)setPayloadNotificationActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNotificationActions, 0);
  objc_storeStrong((id *)&self->_payloadRealm, 0);
  objc_storeStrong((id *)&self->_payloadNumberOfRANDs, 0);
}

@end
