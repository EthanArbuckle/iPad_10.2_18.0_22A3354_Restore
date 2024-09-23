@implementation SFClearProactiveCategoryCommand

- (SFClearProactiveCategoryCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFClearProactiveCategoryCommand *v5;
  void *v6;
  void *v7;
  SFClearProactiveCategoryCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFClearProactiveCategoryCommand;
  v5 = -[SFClearProactiveCategoryCommand init](&v10, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "category"))
      -[SFClearProactiveCategoryCommand setCategory:](v5, "setCategory:", objc_msgSend(v4, "category"));
    if (objc_msgSend(v4, "shouldClearWholeSection"))
      -[SFClearProactiveCategoryCommand setShouldClearWholeSection:](v5, "setShouldClearWholeSection:", objc_msgSend(v4, "shouldClearWholeSection"));
    objc_msgSend(v4, "proactiveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "proactiveIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFClearProactiveCategoryCommand setProactiveIdentifier:](v5, "setProactiveIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (void)setCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_category = a3;
}

- (BOOL)hasCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setShouldClearWholeSection:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldClearWholeSection = a3;
}

- (BOOL)hasShouldClearWholeSection
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFClearProactiveCategoryCommand)initWithCoder:(id)a3
{
  id v4;
  SFClearProactiveCategoryCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFClearProactiveCategoryCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFClearProactiveCategoryCommand setCategory:](v5, "setCategory:", -[SFCommand category](v8, "category"));
    -[SFClearProactiveCategoryCommand setShouldClearWholeSection:](v5, "setShouldClearWholeSection:", -[SFCommand shouldClearWholeSection](v8, "shouldClearWholeSection"));
    -[SFCommand proactiveIdentifier](v8, "proactiveIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFClearProactiveCategoryCommand setProactiveIdentifier:](v5, "setProactiveIdentifier:", v9);

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
  v3.super_class = (Class)SFClearProactiveCategoryCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBClearProactiveCategoryCommand *v2;
  void *v3;

  v2 = -[_SFPBClearProactiveCategoryCommand initWithFacade:]([_SFPBClearProactiveCategoryCommand alloc], "initWithFacade:", self);
  -[_SFPBClearProactiveCategoryCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBClearProactiveCategoryCommand *v2;
  void *v3;

  v2 = -[_SFPBClearProactiveCategoryCommand initWithFacade:]([_SFPBClearProactiveCategoryCommand alloc], "initWithFacade:", self);
  -[_SFPBClearProactiveCategoryCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFClearProactiveCategoryCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setCategory:", -[SFClearProactiveCategoryCommand category](self, "category"));
  objc_msgSend(v4, "setShouldClearWholeSection:", -[SFClearProactiveCategoryCommand shouldClearWholeSection](self, "shouldClearWholeSection"));
  -[SFClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setProactiveIdentifier:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFClearProactiveCategoryCommand *v4;
  SFClearProactiveCategoryCommand *v5;
  int v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = (SFClearProactiveCategoryCommand *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[SFClearProactiveCategoryCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v15.receiver = self,
             v15.super_class = (Class)SFClearProactiveCategoryCommand,
             -[SFCommand isEqual:](&v15, sel_isEqual_, v4)))
  {
    v5 = v4;
    v6 = -[SFClearProactiveCategoryCommand category](self, "category");
    if (v6 == -[SFClearProactiveCategoryCommand category](v5, "category")
      && (v7 = -[SFClearProactiveCategoryCommand shouldClearWholeSection](self, "shouldClearWholeSection"),
          v7 == -[SFClearProactiveCategoryCommand shouldClearWholeSection](v5, "shouldClearWholeSection")))
    {
      -[SFClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFClearProactiveCategoryCommand proactiveIdentifier](v5, "proactiveIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v9 == 0) == (v10 != 0))
      {
        v8 = 0;
      }
      else
      {
        -[SFClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[SFClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFClearProactiveCategoryCommand proactiveIdentifier](v5, "proactiveIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v12, "isEqual:", v13);

        }
        else
        {
          v8 = 1;
        }

      }
    }
    else
    {
      v8 = 0;
    }

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
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFClearProactiveCategoryCommand;
  v3 = -[SFCommand hash](&v9, sel_hash);
  v4 = -[SFClearProactiveCategoryCommand category](self, "category");
  v5 = v4 ^ -[SFClearProactiveCategoryCommand shouldClearWholeSection](self, "shouldClearWholeSection");
  -[SFClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3 ^ v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (int)category
{
  return self->_category;
}

- (BOOL)shouldClearWholeSection
{
  return self->_shouldClearWholeSection;
}

- (NSString)proactiveIdentifier
{
  return self->_proactiveIdentifier;
}

- (void)setProactiveIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
