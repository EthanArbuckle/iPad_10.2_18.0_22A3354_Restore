@implementation _SFPBShowSFCardCommand

- (_SFPBShowSFCardCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBShowSFCardCommand *v5;
  void *v6;
  _SFPBCard *v7;
  void *v8;
  _SFPBCard *v9;
  _SFPBShowSFCardCommand *v10;

  v4 = a3;
  v5 = -[_SFPBShowSFCardCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBCard alloc];
      objc_msgSend(v4, "card");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBCard initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBShowSFCardCommand setCard:](v5, "setCard:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBShowSFCardCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBShowSFCardCommand card](self, "card");
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
    -[_SFPBShowSFCardCommand card](self, "card");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBShowSFCardCommand card](self, "card");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBShowSFCardCommand card](self, "card");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "card");
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
  return -[_SFPBCard hash](self->_card, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_card)
  {
    -[_SFPBShowSFCardCommand card](self, "card");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("card"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("card"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBShowSFCardCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBShowSFCardCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBShowSFCardCommand *v5;
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
    self = -[_SFPBShowSFCardCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBShowSFCardCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBShowSFCardCommand *v5;
  void *v6;
  _SFPBCard *v7;
  _SFPBShowSFCardCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBShowSFCardCommand;
  v5 = -[_SFPBShowSFCardCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("card"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCard initWithDictionary:]([_SFPBCard alloc], "initWithDictionary:", v6);
      -[_SFPBShowSFCardCommand setCard:](v5, "setCard:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (_SFPBCard)card
{
  return self->_card;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
}

@end
