@implementation RMModelAnyDeclaration

+ (id)buildWithType:(id)a3 identifier:(id)a4 payload:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeclarationType:", v9);

  objc_msgSend(v10, "setDeclarationIdentifier:", v8);
  v11 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v10, "setPayload:", v11);
  objc_msgSend(v10, "updateServerToken");
  return v10;
}

+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  LODWORD(a5) = objc_msgSend(v8, "loadFromDictionary:serializationType:error:", v7, v6, a5);

  if ((_DWORD)a5)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (id)declarationClassType
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  -[RMModelDeclarationBase declarationType](self, "declarationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.activation."));

  if ((v4 & 1) != 0)
    return CFSTR("activation");
  -[RMModelDeclarationBase declarationType](self, "declarationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.asset."));

  if ((v7 & 1) != 0)
    return CFSTR("asset");
  -[RMModelDeclarationBase declarationType](self, "declarationType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.configuration."));

  if ((v9 & 1) != 0)
    return CFSTR("configuration");
  -[RMModelDeclarationBase declarationType](self, "declarationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple.management."));

  if (v11)
    return CFSTR("management");
  else
    return CFSTR("unknown");
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  void *v6;

  v6 = (void *)objc_msgSend(a3, "copy");
  -[RMModelAnyDeclaration setPayload:](self, "setPayload:", v6);

  return 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v3;
  void *v4;

  -[RMModelAnyDeclaration payload](self, "payload", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMModelAnyDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDictionary copy](self->_payload, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  return v4;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
