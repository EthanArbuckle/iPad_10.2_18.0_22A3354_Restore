@implementation SFUpdateSearchQueryCommand

- (SFUpdateSearchQueryCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFUpdateSearchQueryCommand *v5;
  void *v6;
  void *v7;
  SFUpdateSearchQueryCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFUpdateSearchQueryCommand;
  v5 = -[SFUpdateSearchQueryCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUpdateSearchQueryCommand setSearchString:](v5, "setSearchString:", v7);

    }
    if (objc_msgSend(v4, "querySource"))
      -[SFUpdateSearchQueryCommand setQuerySource:](v5, "setQuerySource:", objc_msgSend(v4, "querySource"));
    v8 = v5;
  }

  return v5;
}

- (void)setQuerySource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_querySource = a3;
}

- (BOOL)hasQuerySource
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFUpdateSearchQueryCommand)initWithCoder:(id)a3
{
  id v4;
  SFUpdateSearchQueryCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFUpdateSearchQueryCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand searchString](v8, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUpdateSearchQueryCommand setSearchString:](v5, "setSearchString:", v9);

    -[SFUpdateSearchQueryCommand setQuerySource:](v5, "setQuerySource:", -[SFCommand querySource](v8, "querySource"));
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
  v3.super_class = (Class)SFUpdateSearchQueryCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBUpdateSearchQueryCommand *v2;
  void *v3;

  v2 = -[_SFPBUpdateSearchQueryCommand initWithFacade:]([_SFPBUpdateSearchQueryCommand alloc], "initWithFacade:", self);
  -[_SFPBUpdateSearchQueryCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBUpdateSearchQueryCommand *v2;
  void *v3;

  v2 = -[_SFPBUpdateSearchQueryCommand initWithFacade:]([_SFPBUpdateSearchQueryCommand alloc], "initWithFacade:", self);
  -[_SFPBUpdateSearchQueryCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFUpdateSearchQueryCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFUpdateSearchQueryCommand searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSearchString:", v6);

  objc_msgSend(v4, "setQuerySource:", -[SFUpdateSearchQueryCommand querySource](self, "querySource"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFUpdateSearchQueryCommand *v6;
  SFUpdateSearchQueryCommand *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  objc_super v14;

  v6 = (SFUpdateSearchQueryCommand *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFUpdateSearchQueryCommand isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFUpdateSearchQueryCommand;
      if (-[SFCommand isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFUpdateSearchQueryCommand searchString](self, "searchString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUpdateSearchQueryCommand searchString](v7, "searchString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFUpdateSearchQueryCommand searchString](self, "searchString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFUpdateSearchQueryCommand searchString](self, "searchString"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFUpdateSearchQueryCommand searchString](v7, "searchString"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFUpdateSearchQueryCommand querySource](self, "querySource");
          v11 = v12 == -[SFUpdateSearchQueryCommand querySource](v7, "querySource");
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_13;
      }
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFUpdateSearchQueryCommand;
  v3 = -[SFCommand hash](&v8, sel_hash);
  -[SFUpdateSearchQueryCommand searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFUpdateSearchQueryCommand querySource](self, "querySource") ^ v3;

  return v6;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)querySource
{
  return self->_querySource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
