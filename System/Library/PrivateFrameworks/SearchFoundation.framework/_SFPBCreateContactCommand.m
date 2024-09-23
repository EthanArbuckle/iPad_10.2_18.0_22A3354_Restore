@implementation _SFPBCreateContactCommand

- (_SFPBCreateContactCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBCreateContactCommand *v5;
  void *v6;
  _SFPBPerson *v7;
  void *v8;
  _SFPBPerson *v9;
  _SFPBCreateContactCommand *v10;

  v4 = a3;
  v5 = -[_SFPBCreateContactCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBPerson alloc];
      objc_msgSend(v4, "person");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBPerson initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBCreateContactCommand setPerson:](v5, "setPerson:", v9);

    }
    if (objc_msgSend(v4, "hasAddToExistingContact"))
      -[_SFPBCreateContactCommand setAddToExistingContact:](v5, "setAddToExistingContact:", objc_msgSend(v4, "addToExistingContact"));
    v10 = v5;
  }

  return v5;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (void)setAddToExistingContact:(BOOL)a3
{
  self->_addToExistingContact = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCreateContactCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBCreateContactCommand person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBCreateContactCommand addToExistingContact](self, "addToExistingContact"))
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
  int addToExistingContact;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBCreateContactCommand person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBCreateContactCommand person](self, "person");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        addToExistingContact = self->_addToExistingContact;
        v13 = addToExistingContact == objc_msgSend(v4, "addToExistingContact");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBCreateContactCommand person](self, "person");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "person");
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

  v3 = -[_SFPBPerson hash](self->_person, "hash");
  v4 = 2654435761;
  if (!self->_addToExistingContact)
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
  if (self->_addToExistingContact)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCreateContactCommand addToExistingContact](self, "addToExistingContact"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("addToExistingContact"));

  }
  if (self->_person)
  {
    -[_SFPBCreateContactCommand person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("person"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("person"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCreateContactCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCreateContactCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCreateContactCommand *v5;
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
    self = -[_SFPBCreateContactCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCreateContactCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCreateContactCommand *v5;
  void *v6;
  _SFPBPerson *v7;
  void *v8;
  _SFPBCreateContactCommand *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBCreateContactCommand;
  v5 = -[_SFPBCreateContactCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("person"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBPerson initWithDictionary:]([_SFPBPerson alloc], "initWithDictionary:", v6);
      -[_SFPBCreateContactCommand setPerson:](v5, "setPerson:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("addToExistingContact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCreateContactCommand setAddToExistingContact:](v5, "setAddToExistingContact:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (_SFPBPerson)person
{
  return self->_person;
}

- (BOOL)addToExistingContact
{
  return self->_addToExistingContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

@end
