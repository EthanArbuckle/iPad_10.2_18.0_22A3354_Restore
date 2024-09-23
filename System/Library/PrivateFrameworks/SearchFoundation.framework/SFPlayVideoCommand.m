@implementation SFPlayVideoCommand

- (SFPlayVideoCommand)initWithCoder:(id)a3
{
  id v4;
  SFPlayVideoCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFPlayVideoCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand url](v8, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPlayVideoCommand setUrl:](v5, "setUrl:", v9);

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
  v3.super_class = (Class)SFPlayVideoCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPlayVideoCommand *v2;
  void *v3;

  v2 = -[_SFPBPlayVideoCommand initWithFacade:]([_SFPBPlayVideoCommand alloc], "initWithFacade:", self);
  -[_SFPBPlayVideoCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPlayVideoCommand *v2;
  void *v3;

  v2 = -[_SFPBPlayVideoCommand initWithFacade:]([_SFPBPlayVideoCommand alloc], "initWithFacade:", self);
  -[_SFPBPlayVideoCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFPlayVideoCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFPlayVideoCommand url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUrl:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFPlayVideoCommand *v4;
  SFPlayVideoCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFPlayVideoCommand *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFPlayVideoCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFPlayVideoCommand,
             -[SFCommand isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFPlayVideoCommand url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPlayVideoCommand url](v5, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFPlayVideoCommand url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFPlayVideoCommand url](self, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPlayVideoCommand url](v5, "url");
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
  v7.super_class = (Class)SFPlayVideoCommand;
  v3 = -[SFCommand hash](&v7, sel_hash);
  -[SFPlayVideoCommand url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPlayVideoCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFPlayVideoCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  SFPlayVideoCommand *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFPlayVideoCommand;
  v5 = -[SFPlayVideoCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPlayVideoCommand setUrl:](v5, "setUrl:", v8);

    }
    v9 = v5;
  }

  return v5;
}

@end
