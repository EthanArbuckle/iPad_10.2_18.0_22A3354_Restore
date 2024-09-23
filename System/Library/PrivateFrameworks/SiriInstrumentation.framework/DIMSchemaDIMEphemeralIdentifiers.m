@implementation DIMSchemaDIMEphemeralIdentifiers

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DIMSchemaDIMEphemeralIdentifiers;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIMSchemaDIMEphemeralIdentifiers userEphemeralId](self, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DIMSchemaDIMEphemeralIdentifiers deleteUserEphemeralId](self, "deleteUserEphemeralId");
  -[DIMSchemaDIMEphemeralIdentifiers homeEphemeralId](self, "homeEphemeralId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DIMSchemaDIMEphemeralIdentifiers deleteHomeEphemeralId](self, "deleteHomeEphemeralId");

  return v5;
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

- (void)deleteUserEphemeralId
{
  -[DIMSchemaDIMEphemeralIdentifiers setUserEphemeralId:](self, "setUserEphemeralId:", 0);
}

- (BOOL)hasHomeEphemeralId
{
  return self->_homeEphemeralId != 0;
}

- (void)deleteHomeEphemeralId
{
  -[DIMSchemaDIMEphemeralIdentifiers setHomeEphemeralId:](self, "setHomeEphemeralId:", 0);
}

- (void)setSecondsSinceEphemeralIdCreation:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secondsSinceEphemeralIdCreation = a3;
}

- (BOOL)hasSecondsSinceEphemeralIdCreation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSecondsSinceEphemeralIdCreation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSecondsSinceEphemeralIdCreation
{
  -[DIMSchemaDIMEphemeralIdentifiers setSecondsSinceEphemeralIdCreation:](self, "setSecondsSinceEphemeralIdCreation:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMEphemeralIdentifiersReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[DIMSchemaDIMEphemeralIdentifiers userEphemeralId](self, "userEphemeralId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DIMSchemaDIMEphemeralIdentifiers userEphemeralId](self, "userEphemeralId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMEphemeralIdentifiers homeEphemeralId](self, "homeEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DIMSchemaDIMEphemeralIdentifiers homeEphemeralId](self, "homeEphemeralId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
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
  unint64_t secondsSinceEphemeralIdCreation;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[DIMSchemaDIMEphemeralIdentifiers userEphemeralId](self, "userEphemeralId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[DIMSchemaDIMEphemeralIdentifiers userEphemeralId](self, "userEphemeralId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DIMSchemaDIMEphemeralIdentifiers userEphemeralId](self, "userEphemeralId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userEphemeralId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[DIMSchemaDIMEphemeralIdentifiers homeEphemeralId](self, "homeEphemeralId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[DIMSchemaDIMEphemeralIdentifiers homeEphemeralId](self, "homeEphemeralId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DIMSchemaDIMEphemeralIdentifiers homeEphemeralId](self, "homeEphemeralId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeEphemeralId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (secondsSinceEphemeralIdCreation = self->_secondsSinceEphemeralIdCreation,
          secondsSinceEphemeralIdCreation == objc_msgSend(v4, "secondsSinceEphemeralIdCreation")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[SISchemaUUID hash](self->_userEphemeralId, "hash");
  v4 = -[SISchemaUUID hash](self->_homeEphemeralId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_secondsSinceEphemeralIdCreation;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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
  if (self->_homeEphemeralId)
  {
    -[DIMSchemaDIMEphemeralIdentifiers homeEphemeralId](self, "homeEphemeralId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homeEphemeralId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("homeEphemeralId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralIdentifiers secondsSinceEphemeralIdCreation](self, "secondsSinceEphemeralIdCreation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("secondsSinceEphemeralIdCreation"));

  }
  if (self->_userEphemeralId)
  {
    -[DIMSchemaDIMEphemeralIdentifiers userEphemeralId](self, "userEphemeralId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("userEphemeralId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("userEphemeralId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DIMSchemaDIMEphemeralIdentifiers dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DIMSchemaDIMEphemeralIdentifiers)initWithJSON:(id)a3
{
  void *v4;
  DIMSchemaDIMEphemeralIdentifiers *v5;
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
    self = -[DIMSchemaDIMEphemeralIdentifiers initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DIMSchemaDIMEphemeralIdentifiers)initWithDictionary:(id)a3
{
  id v4;
  DIMSchemaDIMEphemeralIdentifiers *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  DIMSchemaDIMEphemeralIdentifiers *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DIMSchemaDIMEphemeralIdentifiers;
  v5 = -[DIMSchemaDIMEphemeralIdentifiers init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userEphemeralId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[DIMSchemaDIMEphemeralIdentifiers setUserEphemeralId:](v5, "setUserEphemeralId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeEphemeralId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[DIMSchemaDIMEphemeralIdentifiers setHomeEphemeralId:](v5, "setHomeEphemeralId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondsSinceEphemeralIdCreation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMEphemeralIdentifiers setSecondsSinceEphemeralIdCreation:](v5, "setSecondsSinceEphemeralIdCreation:", objc_msgSend(v10, "unsignedLongLongValue"));
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (void)setUserEphemeralId:(id)a3
{
  objc_storeStrong((id *)&self->_userEphemeralId, a3);
}

- (SISchemaUUID)homeEphemeralId
{
  return self->_homeEphemeralId;
}

- (void)setHomeEphemeralId:(id)a3
{
  objc_storeStrong((id *)&self->_homeEphemeralId, a3);
}

- (unint64_t)secondsSinceEphemeralIdCreation
{
  return self->_secondsSinceEphemeralIdCreation;
}

- (void)setHasUserEphemeralId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasHomeEphemeralId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeEphemeralId, 0);
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
}

@end
