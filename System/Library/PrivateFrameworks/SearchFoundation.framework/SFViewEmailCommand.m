@implementation SFViewEmailCommand

- (SFViewEmailCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFViewEmailCommand *v5;
  SFViewEmailCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFViewEmailCommand;
  v5 = -[SFViewEmailCommand init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "placeHolderProperty"))
      -[SFViewEmailCommand setPlaceHolderProperty:](v5, "setPlaceHolderProperty:", objc_msgSend(v4, "placeHolderProperty"));
    v6 = v5;
  }

  return v5;
}

- (void)setPlaceHolderProperty:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_placeHolderProperty = a3;
}

- (BOOL)hasPlaceHolderProperty
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFViewEmailCommand)initWithCoder:(id)a3
{
  id v4;
  SFViewEmailCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[SFViewEmailCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFViewEmailCommand setPlaceHolderProperty:](v5, "setPlaceHolderProperty:", -[SFCommand placeHolderProperty](v8, "placeHolderProperty"));
    -[SFCommand commandDetail](v8, "commandDetail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v9);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v10);

    -[SFCommand backendData](v8, "backendData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v11);

    -[SFCommand commandReference](v8, "commandReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFViewEmailCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBViewEmailCommand *v2;
  void *v3;

  v2 = -[_SFPBViewEmailCommand initWithFacade:]([_SFPBViewEmailCommand alloc], "initWithFacade:", self);
  -[_SFPBViewEmailCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBViewEmailCommand *v2;
  void *v3;

  v2 = -[_SFPBViewEmailCommand initWithFacade:]([_SFPBViewEmailCommand alloc], "initWithFacade:", self);
  -[_SFPBViewEmailCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFViewEmailCommand;
  v4 = -[SFCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPlaceHolderProperty:", -[SFViewEmailCommand placeHolderProperty](self, "placeHolderProperty"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFViewEmailCommand *v4;
  SFViewEmailCommand *v5;
  BOOL v6;
  BOOL v7;
  char v8;
  objc_super v10;

  v4 = (SFViewEmailCommand *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[SFViewEmailCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v10.receiver = self,
             v10.super_class = (Class)SFViewEmailCommand,
             -[SFCommand isEqual:](&v10, sel_isEqual_, v4)))
  {
    v5 = v4;
    v6 = -[SFViewEmailCommand placeHolderProperty](self, "placeHolderProperty");
    v7 = -[SFViewEmailCommand placeHolderProperty](v5, "placeHolderProperty");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFViewEmailCommand;
  v3 = -[SFCommand hash](&v5, sel_hash);
  return v3 ^ -[SFViewEmailCommand placeHolderProperty](self, "placeHolderProperty");
}

- (BOOL)placeHolderProperty
{
  return self->_placeHolderProperty;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
