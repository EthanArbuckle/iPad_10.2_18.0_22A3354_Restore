@implementation _SFPBShareItem

- (_SFPBShareItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBShareItem *v5;
  _SFPBURLShareItem *v6;
  _SFPBCoreSpotlightShareItem *v7;
  _SFPBShareItem *v8;

  v4 = a3;
  v5 = -[_SFPBShareItem init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[_SFPBURLShareItem initWithFacade:]([_SFPBURLShareItem alloc], "initWithFacade:", v4);
      -[_SFPBShareItem setUrlShareItem:](v5, "setUrlShareItem:", v6);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCoreSpotlightShareItem initWithFacade:]([_SFPBCoreSpotlightShareItem alloc], "initWithFacade:", v4);
      -[_SFPBShareItem setSpotlightShareItem:](v5, "setSpotlightShareItem:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (void)setUrlShareItem:(id)a3
{
  _SFPBURLShareItem *v4;
  _SFPBCoreSpotlightShareItem *spotlightShareItem;
  _SFPBURLShareItem *urlShareItem;

  v4 = (_SFPBURLShareItem *)a3;
  spotlightShareItem = self->_spotlightShareItem;
  self->_spotlightShareItem = 0;

  self->_whichValue = v4 != 0;
  urlShareItem = self->_urlShareItem;
  self->_urlShareItem = v4;

}

- (_SFPBURLShareItem)urlShareItem
{
  if (self->_whichValue == 1)
    return self->_urlShareItem;
  else
    return (_SFPBURLShareItem *)0;
}

- (void)setSpotlightShareItem:(id)a3
{
  _SFPBCoreSpotlightShareItem *v4;
  _SFPBURLShareItem *urlShareItem;
  _SFPBCoreSpotlightShareItem *spotlightShareItem;

  v4 = (_SFPBCoreSpotlightShareItem *)a3;
  urlShareItem = self->_urlShareItem;
  self->_urlShareItem = 0;

  self->_whichValue = 2 * (v4 != 0);
  spotlightShareItem = self->_spotlightShareItem;
  self->_spotlightShareItem = v4;

}

- (_SFPBCoreSpotlightShareItem)spotlightShareItem
{
  if (self->_whichValue == 2)
    return self->_spotlightShareItem;
  else
    return (_SFPBCoreSpotlightShareItem *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBShareItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBShareItem urlShareItem](self, "urlShareItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBShareItem spotlightShareItem](self, "spotlightShareItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBShareItem urlShareItem](self, "urlShareItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlShareItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBShareItem urlShareItem](self, "urlShareItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBShareItem urlShareItem](self, "urlShareItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlShareItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBShareItem spotlightShareItem](self, "spotlightShareItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spotlightShareItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBShareItem spotlightShareItem](self, "spotlightShareItem");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBShareItem spotlightShareItem](self, "spotlightShareItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spotlightShareItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
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

  v3 = -[_SFPBURLShareItem hash](self->_urlShareItem, "hash");
  return -[_SFPBCoreSpotlightShareItem hash](self->_spotlightShareItem, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_spotlightShareItem)
  {
    -[_SFPBShareItem spotlightShareItem](self, "spotlightShareItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("spotlightShareItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("spotlightShareItem"));

    }
  }
  if (self->_urlShareItem)
  {
    -[_SFPBShareItem urlShareItem](self, "urlShareItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("urlShareItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("urlShareItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBShareItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBShareItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBShareItem *v5;
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
    self = -[_SFPBShareItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBShareItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBShareItem *v5;
  void *v6;
  _SFPBURLShareItem *v7;
  void *v8;
  _SFPBCoreSpotlightShareItem *v9;
  _SFPBShareItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBShareItem;
  v5 = -[_SFPBShareItem init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urlShareItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBURLShareItem initWithDictionary:]([_SFPBURLShareItem alloc], "initWithDictionary:", v6);
      -[_SFPBShareItem setUrlShareItem:](v5, "setUrlShareItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spotlightShareItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBCoreSpotlightShareItem initWithDictionary:]([_SFPBCoreSpotlightShareItem alloc], "initWithDictionary:", v8);
      -[_SFPBShareItem setSpotlightShareItem:](v5, "setSpotlightShareItem:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightShareItem, 0);
  objc_storeStrong((id *)&self->_urlShareItem, 0);
}

@end
