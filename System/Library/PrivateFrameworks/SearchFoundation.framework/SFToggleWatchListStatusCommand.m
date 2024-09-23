@implementation SFToggleWatchListStatusCommand

- (void)setShouldAddToWatchList:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldAddToWatchList = a3;
}

- (BOOL)hasShouldAddToWatchList
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFToggleWatchListStatusCommand)initWithCoder:(id)a3
{
  id v4;
  SFToggleWatchListStatusCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFToggleWatchListStatusCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand watchListItem](v8, "watchListItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFToggleWatchListStatusCommand setWatchListItem:](v5, "setWatchListItem:", v9);

    -[SFToggleWatchListStatusCommand setShouldAddToWatchList:](v5, "setShouldAddToWatchList:", -[SFCommand shouldAddToWatchList](v8, "shouldAddToWatchList"));
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
  v3.super_class = (Class)SFToggleWatchListStatusCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBToggleWatchListStatusCommand *v2;
  void *v3;

  v2 = -[_SFPBToggleWatchListStatusCommand initWithFacade:]([_SFPBToggleWatchListStatusCommand alloc], "initWithFacade:", self);
  -[_SFPBToggleWatchListStatusCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBToggleWatchListStatusCommand *v2;
  void *v3;

  v2 = -[_SFPBToggleWatchListStatusCommand initWithFacade:]([_SFPBToggleWatchListStatusCommand alloc], "initWithFacade:", self);
  -[_SFPBToggleWatchListStatusCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFToggleWatchListStatusCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFToggleWatchListStatusCommand watchListItem](self, "watchListItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setWatchListItem:", v6);

  objc_msgSend(v4, "setShouldAddToWatchList:", -[SFToggleWatchListStatusCommand shouldAddToWatchList](self, "shouldAddToWatchList"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFToggleWatchListStatusCommand *v6;
  SFToggleWatchListStatusCommand *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  objc_super v14;

  v6 = (SFToggleWatchListStatusCommand *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[SFToggleWatchListStatusCommand isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFToggleWatchListStatusCommand;
      if (-[SFCommand isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFToggleWatchListStatusCommand watchListItem](self, "watchListItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFToggleWatchListStatusCommand watchListItem](v7, "watchListItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFToggleWatchListStatusCommand watchListItem](self, "watchListItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFToggleWatchListStatusCommand watchListItem](self, "watchListItem"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFToggleWatchListStatusCommand watchListItem](v7, "watchListItem"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFToggleWatchListStatusCommand shouldAddToWatchList](self, "shouldAddToWatchList");
          v11 = v12 ^ -[SFToggleWatchListStatusCommand shouldAddToWatchList](v7, "shouldAddToWatchList") ^ 1;
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_13;
      }
    }
    LOBYTE(v11) = 0;
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
  v8.super_class = (Class)SFToggleWatchListStatusCommand;
  v3 = -[SFCommand hash](&v8, sel_hash);
  -[SFToggleWatchListStatusCommand watchListItem](self, "watchListItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFToggleWatchListStatusCommand shouldAddToWatchList](self, "shouldAddToWatchList") ^ v3;

  return v6;
}

- (SFWatchListItem)watchListItem
{
  return self->_watchListItem;
}

- (void)setWatchListItem:(id)a3
{
  objc_storeStrong((id *)&self->_watchListItem, a3);
}

- (BOOL)shouldAddToWatchList
{
  return self->_shouldAddToWatchList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFToggleWatchListStatusCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFToggleWatchListStatusCommand *v5;
  void *v6;
  SFWatchListItem *v7;
  void *v8;
  SFWatchListItem *v9;
  SFToggleWatchListStatusCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFToggleWatchListStatusCommand;
  v5 = -[SFToggleWatchListStatusCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "watchListItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFWatchListItem alloc];
      objc_msgSend(v4, "watchListItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFWatchListItem initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFToggleWatchListStatusCommand setWatchListItem:](v5, "setWatchListItem:", v9);

    }
    if (objc_msgSend(v4, "shouldAddToWatchList"))
      -[SFToggleWatchListStatusCommand setShouldAddToWatchList:](v5, "setShouldAddToWatchList:", objc_msgSend(v4, "shouldAddToWatchList"));
    v10 = v5;
  }

  return v5;
}

@end
