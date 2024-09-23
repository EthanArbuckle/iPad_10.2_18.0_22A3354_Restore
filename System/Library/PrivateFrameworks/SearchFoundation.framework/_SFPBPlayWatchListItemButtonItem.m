@implementation _SFPBPlayWatchListItemButtonItem

- (_SFPBPlayWatchListItemButtonItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBPlayWatchListItemButtonItem *v5;
  void *v6;
  _SFPBWatchListItem *v7;
  void *v8;
  _SFPBWatchListItem *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBImage *v13;
  void *v14;
  _SFPBImage *v15;
  _SFPBPlayWatchListItemButtonItem *v16;

  v4 = a3;
  v5 = -[_SFPBPlayWatchListItemButtonItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "watchListItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBWatchListItem alloc];
      objc_msgSend(v4, "watchListItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBWatchListItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBPlayWatchListItemButtonItem setWatchListItem:](v5, "setWatchListItem:", v9);

    }
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPlayWatchListItemButtonItem setTitle:](v5, "setTitle:", v11);

    }
    objc_msgSend(v4, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBImage alloc];
      objc_msgSend(v4, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBImage initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBPlayWatchListItemButtonItem setImage:](v5, "setImage:", v15);

    }
    if (objc_msgSend(v4, "hasUniqueId"))
      -[_SFPBPlayWatchListItemButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v16 = v5;
  }

  return v5;
}

- (void)setWatchListItem:(id)a3
{
  objc_storeStrong((id *)&self->_watchListItem, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPlayWatchListItemButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBPlayWatchListItemButtonItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBPlayWatchListItemButtonItem image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  v7 = -[_SFPBPlayWatchListItemButtonItem uniqueId](self, "uniqueId");
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteUint64Field();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  unint64_t uniqueId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBPlayWatchListItemButtonItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBPlayWatchListItemButtonItem title](self, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBPlayWatchListItemButtonItem title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBPlayWatchListItemButtonItem image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBPlayWatchListItemButtonItem image](self, "image");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      uniqueId = self->_uniqueId;
      v22 = uniqueId == objc_msgSend(v4, "uniqueId");
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBPlayWatchListItemButtonItem image](self, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[_SFPBWatchListItem hash](self->_watchListItem, "hash");
  v4 = -[NSString hash](self->_title, "hash");
  return v4 ^ v3 ^ -[_SFPBImage hash](self->_image, "hash") ^ (2654435761u * self->_uniqueId);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_image)
  {
    -[_SFPBPlayWatchListItemButtonItem image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("image"));

    }
  }
  if (self->_title)
  {
    -[_SFPBPlayWatchListItemButtonItem title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

  }
  if (self->_uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBPlayWatchListItemButtonItem uniqueId](self, "uniqueId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("uniqueId"));

  }
  if (self->_watchListItem)
  {
    -[_SFPBPlayWatchListItemButtonItem watchListItem](self, "watchListItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("watchListItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("watchListItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPlayWatchListItemButtonItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBPlayWatchListItemButtonItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPlayWatchListItemButtonItem *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBPlayWatchListItemButtonItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPlayWatchListItemButtonItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPlayWatchListItemButtonItem *v5;
  void *v6;
  _SFPBWatchListItem *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBImage *v11;
  void *v12;
  _SFPBPlayWatchListItemButtonItem *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBPlayWatchListItemButtonItem;
  v5 = -[_SFPBPlayWatchListItemButtonItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBWatchListItem initWithDictionary:]([_SFPBWatchListItem alloc], "initWithDictionary:", v6);
      -[_SFPBPlayWatchListItemButtonItem setWatchListItem:](v5, "setWatchListItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBPlayWatchListItemButtonItem setTitle:](v5, "setTitle:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v10);
      -[_SFPBPlayWatchListItemButtonItem setImage:](v5, "setImage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPlayWatchListItemButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v12, "unsignedLongLongValue"));
    v13 = v5;

  }
  return v5;
}

- (_SFPBWatchListItem)watchListItem
{
  return self->_watchListItem;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

@end
