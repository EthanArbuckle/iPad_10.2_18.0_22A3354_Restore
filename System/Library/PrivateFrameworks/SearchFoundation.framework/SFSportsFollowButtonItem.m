@implementation SFSportsFollowButtonItem

- (SFSportsFollowButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFSportsFollowButtonItem *v5;
  void *v6;
  SFSportsItem *v7;
  void *v8;
  SFSportsItem *v9;
  void *v10;
  SFToggleButtonConfiguration *v11;
  void *v12;
  SFToggleButtonConfiguration *v13;
  SFSportsFollowButtonItem *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFSportsFollowButtonItem;
  v5 = -[SFSportsFollowButtonItem init](&v16, sel_init);
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
      -[SFSportsFollowButtonItem setSportsItem:](v5, "setSportsItem:", v9);

    }
    objc_msgSend(v4, "toggleButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFToggleButtonConfiguration alloc];
      objc_msgSend(v4, "toggleButtonConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFToggleButtonConfiguration initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFSportsFollowButtonItem setToggleButtonConfiguration:](v5, "setToggleButtonConfiguration:", v13);

    }
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v14 = v5;
  }

  return v5;
}

- (SFSportsFollowButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSportsFollowButtonItem *v6;
  SFSportsFollowButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBSportsFollowButtonItem initWithData:]([_SFPBSportsFollowButtonItem alloc], "initWithData:", v5);
  v7 = -[SFSportsFollowButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSportsFollowButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBSportsFollowButtonItem initWithFacade:]([_SFPBSportsFollowButtonItem alloc], "initWithFacade:", self);
  -[_SFPBSportsFollowButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSportsFollowButtonItem *v2;
  void *v3;

  v2 = -[_SFPBSportsFollowButtonItem initWithFacade:]([_SFPBSportsFollowButtonItem alloc], "initWithFacade:", self);
  -[_SFPBSportsFollowButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSportsFollowButtonItem *v2;
  void *v3;

  v2 = -[_SFPBSportsFollowButtonItem initWithFacade:]([_SFPBSportsFollowButtonItem alloc], "initWithFacade:", self);
  -[_SFPBSportsFollowButtonItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFSportsFollowButtonItem;
  v4 = -[SFButtonItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFSportsFollowButtonItem sportsItem](self, "sportsItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSportsItem:", v6);

  -[SFSportsFollowButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setToggleButtonConfiguration:", v8);

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFSportsFollowButtonItem *v5;
  SFSportsFollowButtonItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v5 = (SFSportsFollowButtonItem *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFSportsFollowButtonItem isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v23.receiver = self;
      v23.super_class = (Class)SFSportsFollowButtonItem;
      if (-[SFButtonItem isEqual:](&v23, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFSportsFollowButtonItem sportsItem](self, "sportsItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSportsFollowButtonItem sportsItem](v6, "sportsItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[SFSportsFollowButtonItem sportsItem](self, "sportsItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFSportsFollowButtonItem sportsItem](self, "sportsItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSportsFollowButtonItem sportsItem](v6, "sportsItem");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_23;
          }
          v22 = v10;
        }
        -[SFSportsFollowButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSportsFollowButtonItem toggleButtonConfiguration](v6, "toggleButtonConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_22;
        }
        -[SFSportsFollowButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v19 = v3;
          -[SFSportsFollowButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSportsFollowButtonItem toggleButtonConfiguration](v6, "toggleButtonConfiguration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v3 = v19;
LABEL_20:

LABEL_21:
LABEL_22:
            v10 = v22;
            if (!v9)
            {
LABEL_24:

              goto LABEL_25;
            }
LABEL_23:

            goto LABEL_24;
          }
          v3 = v19;
        }
        v17 = -[SFButtonItem uniqueId](self, "uniqueId");
        v11 = v17 == -[SFButtonItem uniqueId](v6, "uniqueId");
        if (!v15)
          goto LABEL_21;
        goto LABEL_20;
      }
    }
    v11 = 0;
  }
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFSportsFollowButtonItem;
  v3 = -[SFButtonItem hash](&v10, sel_hash);
  -[SFSportsFollowButtonItem sportsItem](self, "sportsItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFSportsFollowButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFButtonItem uniqueId](self, "uniqueId") ^ v3;

  return v8;
}

- (SFSportsItem)sportsItem
{
  return self->_sportsItem;
}

- (void)setSportsItem:(id)a3
{
  objc_storeStrong((id *)&self->_sportsItem, a3);
}

- (SFToggleButtonConfiguration)toggleButtonConfiguration
{
  return self->_toggleButtonConfiguration;
}

- (void)setToggleButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_sportsItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
