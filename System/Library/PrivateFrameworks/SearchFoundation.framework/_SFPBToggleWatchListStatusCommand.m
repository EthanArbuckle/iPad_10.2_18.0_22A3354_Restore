@implementation _SFPBToggleWatchListStatusCommand

- (_SFPBToggleWatchListStatusCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBToggleWatchListStatusCommand *v5;
  void *v6;
  _SFPBWatchListItem *v7;
  void *v8;
  _SFPBWatchListItem *v9;
  _SFPBToggleWatchListStatusCommand *v10;

  v4 = a3;
  v5 = -[_SFPBToggleWatchListStatusCommand init](self, "init");
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
      -[_SFPBToggleWatchListStatusCommand setWatchListItem:](v5, "setWatchListItem:", v9);

    }
    if (objc_msgSend(v4, "hasShouldAddToWatchList"))
      -[_SFPBToggleWatchListStatusCommand setShouldAddToWatchList:](v5, "setShouldAddToWatchList:", objc_msgSend(v4, "shouldAddToWatchList"));
    v10 = v5;
  }

  return v5;
}

- (void)setWatchListItem:(id)a3
{
  objc_storeStrong((id *)&self->_watchListItem, a3);
}

- (void)setShouldAddToWatchList:(BOOL)a3
{
  self->_shouldAddToWatchList = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBToggleWatchListStatusCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBToggleWatchListStatusCommand watchListItem](self, "watchListItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBToggleWatchListStatusCommand shouldAddToWatchList](self, "shouldAddToWatchList"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  int shouldAddToWatchList;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBToggleWatchListStatusCommand watchListItem](self, "watchListItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBToggleWatchListStatusCommand watchListItem](self, "watchListItem");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        shouldAddToWatchList = self->_shouldAddToWatchList;
        v13 = shouldAddToWatchList == objc_msgSend(v4, "shouldAddToWatchList");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBToggleWatchListStatusCommand watchListItem](self, "watchListItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "watchListItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_SFPBWatchListItem hash](self->_watchListItem, "hash");
  v4 = 2654435761;
  if (!self->_shouldAddToWatchList)
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldAddToWatchList)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBToggleWatchListStatusCommand shouldAddToWatchList](self, "shouldAddToWatchList"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("shouldAddToWatchList"));

  }
  if (self->_watchListItem)
  {
    -[_SFPBToggleWatchListStatusCommand watchListItem](self, "watchListItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("watchListItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("watchListItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBToggleWatchListStatusCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBToggleWatchListStatusCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBToggleWatchListStatusCommand *v5;
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
    self = -[_SFPBToggleWatchListStatusCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBToggleWatchListStatusCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBToggleWatchListStatusCommand *v5;
  void *v6;
  _SFPBWatchListItem *v7;
  void *v8;
  _SFPBToggleWatchListStatusCommand *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBToggleWatchListStatusCommand;
  v5 = -[_SFPBToggleWatchListStatusCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBWatchListItem initWithDictionary:]([_SFPBWatchListItem alloc], "initWithDictionary:", v6);
      -[_SFPBToggleWatchListStatusCommand setWatchListItem:](v5, "setWatchListItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldAddToWatchList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBToggleWatchListStatusCommand setShouldAddToWatchList:](v5, "setShouldAddToWatchList:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (_SFPBWatchListItem)watchListItem
{
  return self->_watchListItem;
}

- (BOOL)shouldAddToWatchList
{
  return self->_shouldAddToWatchList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

@end
