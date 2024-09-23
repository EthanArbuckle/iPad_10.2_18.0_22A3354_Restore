@implementation _SFPBWatchListButtonItem

- (_SFPBWatchListButtonItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBWatchListButtonItem *v5;
  void *v6;
  _SFPBWatchListItem *v7;
  void *v8;
  _SFPBWatchListItem *v9;
  void *v10;
  _SFPBToggleButtonConfiguration *v11;
  void *v12;
  _SFPBToggleButtonConfiguration *v13;
  _SFPBWatchListButtonItem *v14;

  v4 = a3;
  v5 = -[_SFPBWatchListButtonItem init](self, "init");
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
      -[_SFPBWatchListButtonItem setWatchListItem:](v5, "setWatchListItem:", v9);

    }
    objc_msgSend(v4, "toggleButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBToggleButtonConfiguration alloc];
      objc_msgSend(v4, "toggleButtonConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBToggleButtonConfiguration initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBWatchListButtonItem setToggleButtonConfiguration:](v5, "setToggleButtonConfiguration:", v13);

    }
    if (objc_msgSend(v4, "hasUniqueId"))
      -[_SFPBWatchListButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v14 = v5;
  }

  return v5;
}

- (void)setWatchListItem:(id)a3
{
  objc_storeStrong((id *)&self->_watchListItem, a3);
}

- (void)setToggleButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBWatchListButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBWatchListButtonItem watchListItem](self, "watchListItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBWatchListButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  v6 = -[_SFPBWatchListButtonItem uniqueId](self, "uniqueId");
  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteUint64Field();
    v7 = v8;
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
  BOOL v17;
  unint64_t uniqueId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBWatchListButtonItem watchListItem](self, "watchListItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBWatchListButtonItem watchListItem](self, "watchListItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBWatchListButtonItem watchListItem](self, "watchListItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBWatchListButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBWatchListButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      uniqueId = self->_uniqueId;
      v17 = uniqueId == objc_msgSend(v4, "uniqueId");
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBWatchListButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleButtonConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_SFPBWatchListItem hash](self->_watchListItem, "hash");
  return -[_SFPBToggleButtonConfiguration hash](self->_toggleButtonConfiguration, "hash") ^ v3 ^ (2654435761u
                                                                                                * self->_uniqueId);
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_toggleButtonConfiguration)
  {
    -[_SFPBWatchListButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("toggleButtonConfiguration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("toggleButtonConfiguration"));

    }
  }
  if (self->_uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBWatchListButtonItem uniqueId](self, "uniqueId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("uniqueId"));

  }
  if (self->_watchListItem)
  {
    -[_SFPBWatchListButtonItem watchListItem](self, "watchListItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("watchListItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("watchListItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBWatchListButtonItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBWatchListButtonItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBWatchListButtonItem *v5;
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
    self = -[_SFPBWatchListButtonItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBWatchListButtonItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBWatchListButtonItem *v5;
  void *v6;
  _SFPBWatchListItem *v7;
  void *v8;
  _SFPBToggleButtonConfiguration *v9;
  void *v10;
  _SFPBWatchListButtonItem *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBWatchListButtonItem;
  v5 = -[_SFPBWatchListButtonItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBWatchListItem initWithDictionary:]([_SFPBWatchListItem alloc], "initWithDictionary:", v6);
      -[_SFPBWatchListButtonItem setWatchListItem:](v5, "setWatchListItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toggleButtonConfiguration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBToggleButtonConfiguration initWithDictionary:]([_SFPBToggleButtonConfiguration alloc], "initWithDictionary:", v8);
      -[_SFPBWatchListButtonItem setToggleButtonConfiguration:](v5, "setToggleButtonConfiguration:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBWatchListButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v10, "unsignedLongLongValue"));
    v11 = v5;

  }
  return v5;
}

- (_SFPBWatchListItem)watchListItem
{
  return self->_watchListItem;
}

- (_SFPBToggleButtonConfiguration)toggleButtonConfiguration
{
  return self->_toggleButtonConfiguration;
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

@end
