@implementation SFShowSFCardCommand

- (SFShowSFCardCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFShowSFCardCommand *v5;
  void *v6;
  SFCard *v7;
  void *v8;
  SFCard *v9;
  SFShowSFCardCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFShowSFCardCommand;
  v5 = -[SFShowSFCardCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFCard alloc];
      objc_msgSend(v4, "card");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFCard initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFShowSFCardCommand setCard:](v5, "setCard:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (SFShowSFCardCommand)initWithCoder:(id)a3
{
  id v4;
  SFShowSFCardCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFShowSFCardCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand card](v8, "card");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowSFCardCommand setCard:](v5, "setCard:", v9);

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
  v3.super_class = (Class)SFShowSFCardCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBShowSFCardCommand *v2;
  void *v3;

  v2 = -[_SFPBShowSFCardCommand initWithFacade:]([_SFPBShowSFCardCommand alloc], "initWithFacade:", self);
  -[_SFPBShowSFCardCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBShowSFCardCommand *v2;
  void *v3;

  v2 = -[_SFPBShowSFCardCommand initWithFacade:]([_SFPBShowSFCardCommand alloc], "initWithFacade:", self);
  -[_SFPBShowSFCardCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFShowSFCardCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFShowSFCardCommand card](self, "card");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCard:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFShowSFCardCommand *v4;
  SFShowSFCardCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFShowSFCardCommand *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFShowSFCardCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFShowSFCardCommand,
             -[SFCommand isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFShowSFCardCommand card](self, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowSFCardCommand card](v5, "card");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFShowSFCardCommand card](self, "card");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFShowSFCardCommand card](self, "card");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFShowSFCardCommand card](v5, "card");
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
  v7.super_class = (Class)SFShowSFCardCommand;
  v3 = -[SFCommand hash](&v7, sel_hash);
  -[SFShowSFCardCommand card](self, "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (SFCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)embeddedCards
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShowSFCardCommand card](self, "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SFShowSFCardCommand card](self, "card");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SFShowSFCardCommand card](self, "card", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "embeddedCards");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  return v3;
}

@end
