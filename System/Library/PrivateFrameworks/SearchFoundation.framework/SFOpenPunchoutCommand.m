@implementation SFOpenPunchoutCommand

- (SFOpenPunchoutCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFOpenPunchoutCommand *v5;
  void *v6;
  SFPunchout *v7;
  void *v8;
  SFPunchout *v9;
  SFOpenPunchoutCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFOpenPunchoutCommand;
  v5 = -[SFOpenPunchoutCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFPunchout alloc];
      objc_msgSend(v4, "punchout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFPunchout initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFOpenPunchoutCommand setPunchout:](v5, "setPunchout:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (SFOpenPunchoutCommand)initWithCoder:(id)a3
{
  id v4;
  SFOpenPunchoutCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFOpenPunchoutCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand punchout](v8, "punchout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenPunchoutCommand setPunchout:](v5, "setPunchout:", v9);

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
  v3.super_class = (Class)SFOpenPunchoutCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBOpenPunchoutCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenPunchoutCommand initWithFacade:]([_SFPBOpenPunchoutCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenPunchoutCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBOpenPunchoutCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenPunchoutCommand initWithFacade:]([_SFPBOpenPunchoutCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenPunchoutCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFOpenPunchoutCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFOpenPunchoutCommand punchout](self, "punchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPunchout:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFOpenPunchoutCommand *v4;
  SFOpenPunchoutCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFOpenPunchoutCommand *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFOpenPunchoutCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFOpenPunchoutCommand,
             -[SFCommand isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFOpenPunchoutCommand punchout](self, "punchout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenPunchoutCommand punchout](v5, "punchout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFOpenPunchoutCommand punchout](self, "punchout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFOpenPunchoutCommand punchout](self, "punchout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenPunchoutCommand punchout](v5, "punchout");
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
  v7.super_class = (Class)SFOpenPunchoutCommand;
  v3 = -[SFCommand hash](&v7, sel_hash);
  -[SFOpenPunchoutCommand punchout](self, "punchout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchout, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
