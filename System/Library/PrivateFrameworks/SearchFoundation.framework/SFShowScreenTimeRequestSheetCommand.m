@implementation SFShowScreenTimeRequestSheetCommand

- (SFShowScreenTimeRequestSheetCommand)initWithCoder:(id)a3
{
  id v4;
  SFShowScreenTimeRequestSheetCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFShowScreenTimeRequestSheetCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand requestIdentifier](v8, "requestIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowScreenTimeRequestSheetCommand setRequestIdentifier:](v5, "setRequestIdentifier:", v9);

    -[SFCommand commandDetail](v8, "commandDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v10);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v11);

    -[SFCommand backendData](v8, "backendData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v12);

    -[SFCommand commandReference](v8, "commandReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFShowScreenTimeRequestSheetCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBShowScreenTimeRequestSheetCommand *v2;
  void *v3;

  v2 = -[_SFPBShowScreenTimeRequestSheetCommand initWithFacade:]([_SFPBShowScreenTimeRequestSheetCommand alloc], "initWithFacade:", self);
  -[_SFPBShowScreenTimeRequestSheetCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBShowScreenTimeRequestSheetCommand *v2;
  void *v3;

  v2 = -[_SFPBShowScreenTimeRequestSheetCommand initWithFacade:]([_SFPBShowScreenTimeRequestSheetCommand alloc], "initWithFacade:", self);
  -[_SFPBShowScreenTimeRequestSheetCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFShowScreenTimeRequestSheetCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFShowScreenTimeRequestSheetCommand requestIdentifier](self, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setRequestIdentifier:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFShowScreenTimeRequestSheetCommand *v4;
  SFShowScreenTimeRequestSheetCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFShowScreenTimeRequestSheetCommand *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFShowScreenTimeRequestSheetCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())&& (v13.receiver = self, v13.super_class = (Class)SFShowScreenTimeRequestSheetCommand, -[SFCommand isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFShowScreenTimeRequestSheetCommand requestIdentifier](self, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowScreenTimeRequestSheetCommand requestIdentifier](v5, "requestIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFShowScreenTimeRequestSheetCommand requestIdentifier](self, "requestIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFShowScreenTimeRequestSheetCommand requestIdentifier](self, "requestIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFShowScreenTimeRequestSheetCommand requestIdentifier](v5, "requestIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFShowScreenTimeRequestSheetCommand;
  v3 = -[SFCommand hash](&v7, sel_hash);
  -[SFShowScreenTimeRequestSheetCommand requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShowScreenTimeRequestSheetCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFShowScreenTimeRequestSheetCommand *v5;
  void *v6;
  void *v7;
  SFShowScreenTimeRequestSheetCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFShowScreenTimeRequestSheetCommand;
  v5 = -[SFShowScreenTimeRequestSheetCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "requestIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFShowScreenTimeRequestSheetCommand setRequestIdentifier:](v5, "setRequestIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

@end
