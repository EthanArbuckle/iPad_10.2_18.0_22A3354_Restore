@implementation SFPlayWatchListItemButtonItem

- (SFPlayWatchListItemButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPlayWatchListItemButtonItem *v6;
  SFPlayWatchListItemButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPlayWatchListItemButtonItem initWithData:]([_SFPBPlayWatchListItemButtonItem alloc], "initWithData:", v5);
  v7 = -[SFPlayWatchListItemButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPlayWatchListItemButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBPlayWatchListItemButtonItem initWithFacade:]([_SFPBPlayWatchListItemButtonItem alloc], "initWithFacade:", self);
  -[_SFPBPlayWatchListItemButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPlayWatchListItemButtonItem *v2;
  void *v3;

  v2 = -[_SFPBPlayWatchListItemButtonItem initWithFacade:]([_SFPBPlayWatchListItemButtonItem alloc], "initWithFacade:", self);
  -[_SFPBPlayWatchListItemButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPlayWatchListItemButtonItem *v2;
  void *v3;

  v2 = -[_SFPBPlayWatchListItemButtonItem initWithFacade:]([_SFPBPlayWatchListItemButtonItem alloc], "initWithFacade:", self);
  -[_SFPBPlayWatchListItemButtonItem jsonData](v2, "jsonData");
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
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFPlayWatchListItemButtonItem;
  v4 = -[SFButtonItem copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setWatchListItem:", v6);

  -[SFPlayWatchListItemButtonItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTitle:", v8);

  -[SFPlayWatchListItemButtonItem image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setImage:", v10);

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFPlayWatchListItemButtonItem *v5;
  SFPlayWatchListItemButtonItem *v6;
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
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v5 = (SFPlayWatchListItemButtonItem *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFPlayWatchListItemButtonItem isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v33.receiver = self;
      v33.super_class = (Class)SFPlayWatchListItemButtonItem;
      if (-[SFButtonItem isEqual:](&v33, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPlayWatchListItemButtonItem watchListItem](v6, "watchListItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        -[SFPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPlayWatchListItemButtonItem watchListItem](v6, "watchListItem");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        -[SFPlayWatchListItemButtonItem title](self, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPlayWatchListItemButtonItem title](v6, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_30;
        }
        -[SFPlayWatchListItemButtonItem title](self, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v26 = v12;
          -[SFPlayWatchListItemButtonItem title](self, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPlayWatchListItemButtonItem title](v6, "title");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        -[SFPlayWatchListItemButtonItem image](self, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPlayWatchListItemButtonItem image](v6, "image");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          v11 = 0;
          v15 = v31;
          v3 = v28;
          if (!v31)
            goto LABEL_29;
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        -[SFPlayWatchListItemButtonItem image](self, "image");
        v15 = v31;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27
          || (-[SFPlayWatchListItemButtonItem image](self, "image"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFPlayWatchListItemButtonItem image](v6, "image"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          v3 = v28;
          v20 = -[SFButtonItem uniqueId](self, "uniqueId");
          v11 = v20 == -[SFButtonItem uniqueId](v6, "uniqueId");
          if (!v27)
            goto LABEL_27;
        }
        else
        {
          v11 = 0;
          v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    v11 = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFPlayWatchListItemButtonItem;
  v3 = -[SFButtonItem hash](&v12, sel_hash);
  -[SFPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFPlayWatchListItemButtonItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFPlayWatchListItemButtonItem image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFButtonItem uniqueId](self, "uniqueId") ^ v3;

  return v10;
}

- (SFWatchListItem)watchListItem
{
  return self->_watchListItem;
}

- (void)setWatchListItem:(id)a3
{
  objc_storeStrong((id *)&self->_watchListItem, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPlayWatchListItemButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFPlayWatchListItemButtonItem *v5;
  void *v6;
  SFWatchListItem *v7;
  void *v8;
  SFWatchListItem *v9;
  void *v10;
  void *v11;
  void *v12;
  SFImage *v13;
  void *v14;
  SFImage *v15;
  SFPlayWatchListItemButtonItem *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFPlayWatchListItemButtonItem;
  v5 = -[SFPlayWatchListItemButtonItem init](&v18, sel_init);
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
      -[SFPlayWatchListItemButtonItem setWatchListItem:](v5, "setWatchListItem:", v9);

    }
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPlayWatchListItemButtonItem setTitle:](v5, "setTitle:", v11);

    }
    objc_msgSend(v4, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SFImage initWithProtobuf:](v13, "initWithProtobuf:", v14);
      -[SFPlayWatchListItemButtonItem setImage:](v5, "setImage:", v15);

    }
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v16 = v5;
  }

  return v5;
}

@end
