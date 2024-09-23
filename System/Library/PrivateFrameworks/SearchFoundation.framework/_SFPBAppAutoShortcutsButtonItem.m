@implementation _SFPBAppAutoShortcutsButtonItem

- (_SFPBAppAutoShortcutsButtonItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBAppAutoShortcutsButtonItem *v5;
  void *v6;
  _SFPBAppAutoShortcutsItem *v7;
  void *v8;
  _SFPBAppAutoShortcutsItem *v9;
  _SFPBAppAutoShortcutsButtonItem *v10;

  v4 = a3;
  v5 = -[_SFPBAppAutoShortcutsButtonItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "appAutoShortcutsItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBAppAutoShortcutsItem alloc];
      objc_msgSend(v4, "appAutoShortcutsItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBAppAutoShortcutsItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBAppAutoShortcutsButtonItem setAppAutoShortcutsItem:](v5, "setAppAutoShortcutsItem:", v9);

    }
    if (objc_msgSend(v4, "hasUniqueId"))
      -[_SFPBAppAutoShortcutsButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v10 = v5;
  }

  return v5;
}

- (void)setAppAutoShortcutsItem:(id)a3
{
  objc_storeStrong((id *)&self->_appAutoShortcutsItem, a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAppAutoShortcutsButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBAppAutoShortcutsButtonItem uniqueId](self, "uniqueId"))
    PBDataWriterWriteUint64Field();

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
  unint64_t uniqueId;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appAutoShortcutsItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        uniqueId = self->_uniqueId;
        v13 = uniqueId == objc_msgSend(v4, "uniqueId");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appAutoShortcutsItem");
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
  return (2654435761u * self->_uniqueId) ^ -[_SFPBAppAutoShortcutsItem hash](self->_appAutoShortcutsItem, "hash");
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
  if (self->_appAutoShortcutsItem)
  {
    -[_SFPBAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appAutoShortcutsItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appAutoShortcutsItem"));

    }
  }
  if (self->_uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBAppAutoShortcutsButtonItem uniqueId](self, "uniqueId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("uniqueId"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBAppAutoShortcutsButtonItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBAppAutoShortcutsButtonItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBAppAutoShortcutsButtonItem *v5;
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
    self = -[_SFPBAppAutoShortcutsButtonItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBAppAutoShortcutsButtonItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBAppAutoShortcutsButtonItem *v5;
  void *v6;
  _SFPBAppAutoShortcutsItem *v7;
  void *v8;
  _SFPBAppAutoShortcutsButtonItem *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBAppAutoShortcutsButtonItem;
  v5 = -[_SFPBAppAutoShortcutsButtonItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appAutoShortcutsItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBAppAutoShortcutsItem initWithDictionary:]([_SFPBAppAutoShortcutsItem alloc], "initWithDictionary:", v6);
      -[_SFPBAppAutoShortcutsButtonItem setAppAutoShortcutsItem:](v5, "setAppAutoShortcutsItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAppAutoShortcutsButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v8, "unsignedLongLongValue"));
    v9 = v5;

  }
  return v5;
}

- (_SFPBAppAutoShortcutsItem)appAutoShortcutsItem
{
  return self->_appAutoShortcutsItem;
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAutoShortcutsItem, 0);
}

@end
