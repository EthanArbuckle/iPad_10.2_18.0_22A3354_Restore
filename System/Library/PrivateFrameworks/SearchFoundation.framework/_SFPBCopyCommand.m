@implementation _SFPBCopyCommand

- (_SFPBCopyCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBCopyCommand *v5;
  void *v6;
  _SFPBCopyItem *v7;
  void *v8;
  _SFPBCopyItem *v9;
  _SFPBCopyCommand *v10;

  v4 = a3;
  v5 = -[_SFPBCopyCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "copyableItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBCopyItem alloc];
      objc_msgSend(v4, "copyableItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBCopyItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBCopyCommand setCopyableItem:](v5, "setCopyableItem:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setCopyableItem:(id)a3
{
  objc_storeStrong((id *)&self->_copyableItem, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCopyCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBCopyCommand copyableItem](self, "copyableItem");
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
    -[_SFPBCopyCommand copyableItem](self, "copyableItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "copyableItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBCopyCommand copyableItem](self, "copyableItem");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBCopyCommand copyableItem](self, "copyableItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "copyableItem");
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
  return -[_SFPBCopyItem hash](self->_copyableItem, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_copyableItem)
  {
    -[_SFPBCopyCommand copyableItem](self, "copyableItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("copyableItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("copyableItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCopyCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCopyCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCopyCommand *v5;
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
    self = -[_SFPBCopyCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCopyCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCopyCommand *v5;
  void *v6;
  _SFPBCopyItem *v7;
  _SFPBCopyCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBCopyCommand;
  v5 = -[_SFPBCopyCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("copyableItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCopyItem initWithDictionary:]([_SFPBCopyItem alloc], "initWithDictionary:", v6);
      -[_SFPBCopyCommand setCopyableItem:](v5, "setCopyableItem:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (_SFPBCopyItem)copyableItem
{
  return self->_copyableItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copyableItem, 0);
}

@end
