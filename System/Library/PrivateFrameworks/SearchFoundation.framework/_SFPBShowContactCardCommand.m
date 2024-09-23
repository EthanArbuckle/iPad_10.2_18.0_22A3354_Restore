@implementation _SFPBShowContactCardCommand

- (_SFPBShowContactCardCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBShowContactCardCommand *v5;
  void *v6;
  void *v7;
  _SFPBShowContactCardCommand *v8;

  v4 = a3;
  v5 = -[_SFPBShowContactCardCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "contactIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBShowContactCardCommand setContactIdentifier:](v5, "setContactIdentifier:", v7);

    }
    if (objc_msgSend(v4, "hasIsSuggestedContact"))
      -[_SFPBShowContactCardCommand setIsSuggestedContact:](v5, "setIsSuggestedContact:", objc_msgSend(v4, "isSuggestedContact"));
    v8 = v5;
  }

  return v5;
}

- (void)setContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

}

- (void)setIsSuggestedContact:(BOOL)a3
{
  self->_isSuggestedContact = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBShowContactCardCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBShowContactCardCommand contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBShowContactCardCommand isSuggestedContact](self, "isSuggestedContact"))
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
  int isSuggestedContact;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBShowContactCardCommand contactIdentifier](self, "contactIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBShowContactCardCommand contactIdentifier](self, "contactIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        isSuggestedContact = self->_isSuggestedContact;
        v13 = isSuggestedContact == objc_msgSend(v4, "isSuggestedContact");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBShowContactCardCommand contactIdentifier](self, "contactIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactIdentifier");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_contactIdentifier, "hash");
  v4 = 2654435761;
  if (!self->_isSuggestedContact)
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contactIdentifier)
  {
    -[_SFPBShowContactCardCommand contactIdentifier](self, "contactIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactIdentifier"));

  }
  if (self->_isSuggestedContact)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBShowContactCardCommand isSuggestedContact](self, "isSuggestedContact"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isSuggestedContact"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBShowContactCardCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBShowContactCardCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBShowContactCardCommand *v5;
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
    self = -[_SFPBShowContactCardCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBShowContactCardCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBShowContactCardCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBShowContactCardCommand *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBShowContactCardCommand;
  v5 = -[_SFPBShowContactCardCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBShowContactCardCommand setContactIdentifier:](v5, "setContactIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuggestedContact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBShowContactCardCommand setIsSuggestedContact:](v5, "setIsSuggestedContact:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (BOOL)isSuggestedContact
{
  return self->_isSuggestedContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
