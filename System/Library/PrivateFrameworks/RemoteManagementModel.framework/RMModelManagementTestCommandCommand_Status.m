@implementation RMModelManagementTestCommandCommand_Status

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Echo");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  return (NSSet *)(id)objc_opt_new();
}

+ (id)buildWithEcho:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusEcho:", v3);

  return v4;
}

+ (id)buildRequiredOnlyWithEcho:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusEcho:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDBCEF0];
  v8 = a3;
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelManagementTestCommandCommand_Status allowedStatusKeys](RMModelManagementTestCommandCommand_Status, "allowedStatusKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  LOBYTE(a5) = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Echo"), CFSTR("statusEcho"), 1, 0, a5);
  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[RMModelManagementTestCommandCommand_Status statusEcho](self, "statusEcho");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Echo"), v5, 1, 0);

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (NSString)statusEcho
{
  return self->_statusEcho;
}

- (void)setStatusEcho:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusEcho, 0);
}

@end
