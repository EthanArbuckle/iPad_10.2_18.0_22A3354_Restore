@implementation _SFPBShareCommand

- (_SFPBShareCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBShareCommand *v5;
  void *v6;
  _SFPBShareItem *v7;
  void *v8;
  _SFPBShareItem *v9;
  _SFPBShareCommand *v10;

  v4 = a3;
  v5 = -[_SFPBShareCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "shareItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBShareItem alloc];
      objc_msgSend(v4, "shareItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBShareItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBShareCommand setShareItem:](v5, "setShareItem:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setShareItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareItem, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBShareCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBShareCommand shareItem](self, "shareItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

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
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBShareCommand shareItem](self, "shareItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shareItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBShareCommand shareItem](self, "shareItem");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBShareCommand shareItem](self, "shareItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shareItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
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
  return -[_SFPBShareItem hash](self->_shareItem, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shareItem)
  {
    -[_SFPBShareCommand shareItem](self, "shareItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("shareItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("shareItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBShareCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBShareCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBShareCommand *v5;
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
    self = -[_SFPBShareCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBShareCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBShareCommand *v5;
  void *v6;
  _SFPBShareItem *v7;
  _SFPBShareCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBShareCommand;
  v5 = -[_SFPBShareCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shareItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBShareItem initWithDictionary:]([_SFPBShareItem alloc], "initWithDictionary:", v6);
      -[_SFPBShareCommand setShareItem:](v5, "setShareItem:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (_SFPBShareItem)shareItem
{
  return self->_shareItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareItem, 0);
}

@end
