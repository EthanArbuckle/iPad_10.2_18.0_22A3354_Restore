@implementation SFUpdateSportsFollowingStatusCommand

- (SFUpdateSportsFollowingStatusCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFUpdateSportsFollowingStatusCommand *v5;
  void *v6;
  SFSportsItem *v7;
  void *v8;
  SFSportsItem *v9;
  SFUpdateSportsFollowingStatusCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
  v5 = -[SFUpdateSportsFollowingStatusCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sportsItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFSportsItem alloc];
      objc_msgSend(v4, "sportsItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFSportsItem initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFUpdateSportsFollowingStatusCommand setSportsItem:](v5, "setSportsItem:", v9);

    }
    if (objc_msgSend(v4, "follow"))
      -[SFUpdateSportsFollowingStatusCommand setFollow:](v5, "setFollow:", objc_msgSend(v4, "follow"));
    v10 = v5;
  }

  return v5;
}

- (void)setFollow:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_follow = a3;
}

- (BOOL)hasFollow
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFUpdateSportsFollowingStatusCommand)initWithCoder:(id)a3
{
  id v4;
  SFUpdateSportsFollowingStatusCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFUpdateSportsFollowingStatusCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand sportsItem](v8, "sportsItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUpdateSportsFollowingStatusCommand setSportsItem:](v5, "setSportsItem:", v9);

    -[SFUpdateSportsFollowingStatusCommand setFollow:](v5, "setFollow:", -[SFCommand follow](v8, "follow"));
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
  v3.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBUpdateSportsFollowingStatusCommand *v2;
  void *v3;

  v2 = -[_SFPBUpdateSportsFollowingStatusCommand initWithFacade:]([_SFPBUpdateSportsFollowingStatusCommand alloc], "initWithFacade:", self);
  -[_SFPBUpdateSportsFollowingStatusCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBUpdateSportsFollowingStatusCommand *v2;
  void *v3;

  v2 = -[_SFPBUpdateSportsFollowingStatusCommand initWithFacade:]([_SFPBUpdateSportsFollowingStatusCommand alloc], "initWithFacade:", self);
  -[_SFPBUpdateSportsFollowingStatusCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSportsItem:", v6);

  objc_msgSend(v4, "setFollow:", -[SFUpdateSportsFollowingStatusCommand follow](self, "follow"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFUpdateSportsFollowingStatusCommand *v6;
  SFUpdateSportsFollowingStatusCommand *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  objc_super v14;

  v6 = (SFUpdateSportsFollowingStatusCommand *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[SFUpdateSportsFollowingStatusCommand isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
      if (-[SFCommand isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUpdateSportsFollowingStatusCommand sportsItem](v7, "sportsItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFUpdateSportsFollowingStatusCommand sportsItem](v7, "sportsItem"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFUpdateSportsFollowingStatusCommand follow](self, "follow");
          v11 = v12 ^ -[SFUpdateSportsFollowingStatusCommand follow](v7, "follow") ^ 1;
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
  v8.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
  v3 = -[SFCommand hash](&v8, sel_hash);
  -[SFUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFUpdateSportsFollowingStatusCommand follow](self, "follow") ^ v3;

  return v6;
}

- (SFSportsItem)sportsItem
{
  return self->_sportsItem;
}

- (void)setSportsItem:(id)a3
{
  objc_storeStrong((id *)&self->_sportsItem, a3);
}

- (BOOL)follow
{
  return self->_follow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
