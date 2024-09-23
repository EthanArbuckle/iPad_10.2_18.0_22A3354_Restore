@implementation RMModelStatusServicesBackgroundTask

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("_removed");
  v6[2] = CFSTR("code-signature");
  v6[3] = CFSTR("uid");
  v6[4] = CFSTR("path");
  v6[5] = CFSTR("state");
  v6[6] = CFSTR("type");
  v6[7] = CFSTR("launchd");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return CFSTR("services.background-task");
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 codeSignature:(id)a5 uid:(id)a6 path:(id)a7 state:(id)a8 type:(id)a9 launchd:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setStatusIdentifier:", v23);

  if (v22)
    v25 = v22;
  else
    v25 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v24, "setStatusRemoved:", v25);

  objc_msgSend(v24, "setStatusCodeSignature:", v21);
  objc_msgSend(v24, "setStatusUid:", v20);

  objc_msgSend(v24, "setStatusPath:", v19);
  objc_msgSend(v24, "setStatusState:", v18);

  objc_msgSend(v24, "setStatusType:", v17);
  objc_msgSend(v24, "setStatusLaunchd:", v16);

  return v24;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 uid:(id)a4 path:(id)a5 state:(id)a6 type:(id)a7
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

  objc_msgSend(v16, "setStatusUid:", v14);
  objc_msgSend(v16, "setStatusPath:", v13);

  objc_msgSend(v16, "setStatusState:", v12);
  objc_msgSend(v16, "setStatusType:", v11);

  return v16;
}

+ (id)supportedOS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = &unk_25162B290;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628488);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516284A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
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

  +[RMModelStatusServicesBackgroundTask allowedStatusKeys](RMModelStatusServicesBackgroundTask, "allowedStatusKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("identifier"), CFSTR("statusIdentifier"), 1, 0, a5))goto LABEL_9;
  v14 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("_removed"), CFSTR("statusRemoved"), 0, MEMORY[0x24BDBD1C0], a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("code-signature"), CFSTR("statusCodeSignature"), 0, 0, a5))
    {
      if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("uid"), CFSTR("statusUid"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("path"), CFSTR("statusPath"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
             "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
             v8,
             CFSTR("state"),
             CFSTR("statusState"),
             1,
             0,
             a5)
        && -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("type"), CFSTR("statusType"), 1, 0, a5))
      {
        LOWORD(v16) = a4;
        v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("launchd"), CFSTR("statusLaunchd"), objc_opt_class(), 0, 0, v16, a5);
        goto LABEL_10;
      }
LABEL_9:
      v14 = 0;
    }
  }
LABEL_10:

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  signed __int16 v17;

  v5 = (void *)objc_opt_new();
  -[RMModelStatusServicesBackgroundTask statusIdentifier](self, "statusIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("identifier"), v6, 1, 0);

  -[RMModelStatusServicesBackgroundTask statusRemoved](self, "statusRemoved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("_removed"), v7, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelStatusServicesBackgroundTask statusCodeSignature](self, "statusCodeSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("code-signature"), v8, 0, 0);

  -[RMModelStatusServicesBackgroundTask statusUid](self, "statusUid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("uid"), v9, 1, 0);

  -[RMModelStatusServicesBackgroundTask statusPath](self, "statusPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("path"), v10, 1, 0);

  -[RMModelStatusServicesBackgroundTask statusState](self, "statusState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("state"), v11, 1, 0);

  -[RMModelStatusServicesBackgroundTask statusType](self, "statusType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("type"), v12, 1, 0);

  -[RMModelStatusServicesBackgroundTask statusLaunchd](self, "statusLaunchd");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__RMModelStatusServicesBackgroundTask_serializePayloadWithType___block_invoke;
  v16[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v17 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("launchd"), v13, v16, 0, 0);

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

uint64_t __64__RMModelStatusServicesBackgroundTask_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
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
  uint64_t v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)RMModelStatusServicesBackgroundTask;
  v4 = -[RMModelPayloadBase copyWithZone:](&v22, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_statusRemoved, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusCodeSignature, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_statusUid, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_statusPath, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_statusState, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSString copy](self->_statusType, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[RMModelStatusServicesBackgroundTask_Launchd copy](self->_statusLaunchd, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

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

- (NSNumber)statusRemoved
{
  return self->_statusRemoved;
}

- (void)setStatusRemoved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusCodeSignature
{
  return self->_statusCodeSignature;
}

- (void)setStatusCodeSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)statusUid
{
  return self->_statusUid;
}

- (void)setStatusUid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)statusPath
{
  return self->_statusPath;
}

- (void)setStatusPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)statusState
{
  return self->_statusState;
}

- (void)setStatusState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)statusType
{
  return self->_statusType;
}

- (void)setStatusType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (RMModelStatusServicesBackgroundTask_Launchd)statusLaunchd
{
  return self->_statusLaunchd;
}

- (void)setStatusLaunchd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLaunchd, 0);
  objc_storeStrong((id *)&self->_statusType, 0);
  objc_storeStrong((id *)&self->_statusState, 0);
  objc_storeStrong((id *)&self->_statusPath, 0);
  objc_storeStrong((id *)&self->_statusUid, 0);
  objc_storeStrong((id *)&self->_statusCodeSignature, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

uint64_t __90__RMModelStatusServicesBackgroundTask_Launchd_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __65__RMModelStatusServicesBackgroundTask_Launchd_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __65__RMModelStatusServicesBackgroundTask_Launchd_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

@end
