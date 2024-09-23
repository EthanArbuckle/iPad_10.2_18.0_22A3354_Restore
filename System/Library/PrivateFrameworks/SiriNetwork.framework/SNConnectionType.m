@implementation SNConnectionType

- (SNConnectionType)initWithTechnology:(int64_t)a3
{
  SNConnectionType *v4;
  SNConnectionTypeInternal *v5;
  SNConnectionTypeInternal *underlyingConnectionType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SNConnectionType;
  v4 = -[SNConnectionType init](&v8, sel_init);
  if (v4)
  {
    v5 = -[SNConnectionTypeInternal init:]([SNConnectionTypeInternal alloc], "init:", a3);
    underlyingConnectionType = v4->_underlyingConnectionType;
    v4->_underlyingConnectionType = v5;

  }
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNConnectionTypeInternal connectionTypeStringRawValue](self->_underlyingConnectionType, "connectionTypeStringRawValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%p %@: technology=%@>"), self, v4, v5);

  return v6;
}

- (int64_t)technology
{
  return -[SNConnectionTypeInternal connectionTypeRawValue](self->_underlyingConnectionType, "connectionTypeRawValue");
}

- (id)technologyDescription
{
  return -[SNConnectionTypeInternal connectionTypeStringRawValue](self->_underlyingConnectionType, "connectionTypeStringRawValue");
}

- (BOOL)isWWAN
{
  return -[SNConnectionTypeInternal isWWAN](self->_underlyingConnectionType, "isWWAN");
}

- (BOOL)isEdge
{
  return -[SNConnectionTypeInternal isEdge](self->_underlyingConnectionType, "isEdge");
}

- (BOOL)canUseWiFiDirectly
{
  return -[SNConnectionTypeInternal canUseWiFiDirectly](self->_underlyingConnectionType, "canUseWiFiDirectly");
}

- (int64_t)diagnosticConnectionType
{
  return -[SNConnectionTypeInternal diagnosticConnectionType](self->_underlyingConnectionType, "diagnosticConnectionType");
}

- (unint64_t)aggregatorConnectionType
{
  return -[SNConnectionTypeInternal aggregatorConnectionType](self->_underlyingConnectionType, "aggregatorConnectionType");
}

- (SNConnectionTypeInternal)underlyingConnectionType
{
  return self->_underlyingConnectionType;
}

- (void)setUnderlyingConnectionType:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingConnectionType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingConnectionType, 0);
}

@end
