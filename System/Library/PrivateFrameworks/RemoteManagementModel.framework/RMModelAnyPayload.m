@implementation RMModelAnyPayload

+ (id)buildFromDictionary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "loadFromDictionary:serializationType:error:", v3, 0, 0);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  NSDictionary *v6;
  NSDictionary *dictKeys;

  v6 = (NSDictionary *)objc_msgSend(a3, "copy");
  dictKeys = self->_dictKeys;
  self->_dictKeys = v6;

  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  return (id)-[NSDictionary copy](self->_dictKeys, "copy", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMModelAnyPayload;
  v4 = -[RMModelPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDictionary copy](self->_dictKeys, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSDictionary)dictKeys
{
  return self->_dictKeys;
}

- (void)setDictKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictKeys, 0);
}

@end
