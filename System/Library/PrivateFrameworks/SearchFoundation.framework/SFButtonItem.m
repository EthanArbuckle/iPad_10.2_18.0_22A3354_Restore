@implementation SFButtonItem

- (SFButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFButtonItem *v5;
  void *v6;
  SFButtonItemAppearance *v7;
  void *v8;
  SFButtonItemAppearance *v9;
  void *v10;
  SFCommandButtonItem *v11;
  uint64_t v12;
  SFButtonItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SFButtonItemAppearance *v24;
  void *v25;
  SFButtonItemAppearance *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SFButtonItem;
  v5 = -[SFButtonItem init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "buttonAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFButtonItemAppearance alloc];
      objc_msgSend(v4, "buttonAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFButtonItemAppearance initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFButtonItem setButtonAppearance:](v5, "setButtonAppearance:", v9);

    }
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    objc_msgSend(v4, "commandButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFCommandButtonItem alloc];
      objc_msgSend(v4, "commandButtonItem");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "contactButtonItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v11 = [SFContactButtonItem alloc];
        objc_msgSend(v4, "contactButtonItem");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "coreSpotlightButtonItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v11 = [SFCoreSpotlightButtonItem alloc];
          objc_msgSend(v4, "coreSpotlightButtonItem");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "watchListButtonItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v11 = [SFWatchListButtonItem alloc];
            objc_msgSend(v4, "watchListButtonItem");
            v12 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v4, "appActionsButtonItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v11 = [SFAppAutoShortcutsButtonItem alloc];
              objc_msgSend(v4, "appActionsButtonItem");
              v12 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v4, "sportsFollowButtonItem");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                v11 = [SFSportsFollowButtonItem alloc];
                objc_msgSend(v4, "sportsFollowButtonItem");
                v12 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v4, "playWatchListItemButtonItem");
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  v11 = [SFPlayWatchListItemButtonItem alloc];
                  objc_msgSend(v4, "playWatchListItemButtonItem");
                  v12 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v4, "playAudioButtonItem");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v20)
                  {
                    v11 = [SFPlayAudioButtonItem alloc];
                    objc_msgSend(v4, "playAudioButtonItem");
                    v12 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(v4, "storeButtonItem");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v21)
                    {
                      v13 = v5;
                      goto LABEL_29;
                    }
                    v11 = [SFStoreButtonItem alloc];
                    objc_msgSend(v4, "storeButtonItem");
                    v12 = objc_claimAutoreleasedReturnValue();
                  }
                }
              }
            }
          }
        }
      }
    }
    v22 = (void *)v12;
    v13 = -[SFCommandButtonItem initWithProtobuf:](v11, "initWithProtobuf:", v12);

    objc_msgSend(v4, "buttonAppearance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = [SFButtonItemAppearance alloc];
      objc_msgSend(v4, "buttonAppearance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[SFButtonItemAppearance initWithProtobuf:](v24, "initWithProtobuf:", v25);
      -[SFButtonItem setButtonAppearance:](v13, "setButtonAppearance:", v26);

    }
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v13, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
  }
  else
  {
    v13 = 0;
  }
LABEL_29:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUniqueId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_uniqueId = a3;
}

- (BOOL)hasUniqueId
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBButtonItem *v6;
  SFButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBButtonItem initWithData:]([_SFPBButtonItem alloc], "initWithData:", v5);
  v7 = -[SFButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", self);
  -[_SFPBButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBButtonItem *v2;
  void *v3;

  v2 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", self);
  -[_SFPBButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBButtonItem *v2;
  void *v3;

  v2 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", self);
  -[_SFPBButtonItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFButtonItem buttonAppearance](self, "buttonAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setButtonAppearance:", v6);

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFButtonItem *v6;
  SFButtonItem *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;

  v6 = (SFButtonItem *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFButtonItem isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[SFButtonItem buttonAppearance](self, "buttonAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFButtonItem buttonAppearance](v7, "buttonAppearance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[SFButtonItem buttonAppearance](self, "buttonAppearance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[SFButtonItem buttonAppearance](self, "buttonAppearance"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFButtonItem buttonAppearance](v7, "buttonAppearance"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[SFButtonItem uniqueId](self, "uniqueId");
        v11 = v12 == -[SFButtonItem uniqueId](v7, "uniqueId");
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[SFButtonItem buttonAppearance](self, "buttonAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SFButtonItem uniqueId](self, "uniqueId") ^ v4;

  return v5;
}

- (SFButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (void)setButtonAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_buttonAppearance, a3);
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonAppearance, 0);
}

@end
