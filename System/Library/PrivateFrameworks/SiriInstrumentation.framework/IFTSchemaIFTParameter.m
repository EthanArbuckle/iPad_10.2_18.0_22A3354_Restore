@implementation IFTSchemaIFTParameter

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTParameter;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTParameter candidate](self, "candidate", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTParameter deleteCandidate](self, "deleteCandidate");
  return v5;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)deleteKey
{
  -[IFTSchemaIFTParameter setKey:](self, "setKey:", 0);
}

- (void)setCollectionIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_collectionIndex = a3;
}

- (BOOL)hasCollectionIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCollectionIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCollectionIndex
{
  -[IFTSchemaIFTParameter setCollectionIndex:](self, "setCollectionIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasCandidate
{
  return self->_candidate != 0;
}

- (void)deleteCandidate
{
  -[IFTSchemaIFTParameter setCandidate:](self, "setCandidate:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTParameterReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IFTSchemaIFTParameter key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  -[IFTSchemaIFTParameter candidate](self, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[IFTSchemaIFTParameter candidate](self, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

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
  int64_t collectionIndex;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[IFTSchemaIFTParameter key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[IFTSchemaIFTParameter key](self, "key");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFTSchemaIFTParameter key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    collectionIndex = self->_collectionIndex;
    if (collectionIndex != objc_msgSend(v4, "collectionIndex"))
      goto LABEL_15;
  }
  -[IFTSchemaIFTParameter candidate](self, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IFTSchemaIFTParameter candidate](self, "candidate");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[IFTSchemaIFTParameter candidate](self, "candidate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_collectionIndex;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[IFTSchemaIFTCandidate hash](self->_candidate, "hash");
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
  if (self->_candidate)
  {
    -[IFTSchemaIFTParameter candidate](self, "candidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("candidate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("candidate"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IFTSchemaIFTParameter collectionIndex](self, "collectionIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("collectionIndex"));

  }
  if (self->_key)
  {
    -[IFTSchemaIFTParameter key](self, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("key"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTParameter dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTParameter)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTParameter *v5;
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
    self = -[IFTSchemaIFTParameter initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTParameter)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTParameter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IFTSchemaIFTCandidate *v10;
  IFTSchemaIFTParameter *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTParameter;
  v5 = -[IFTSchemaIFTParameter init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[IFTSchemaIFTParameter setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTParameter setCollectionIndex:](v5, "setCollectionIndex:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[IFTSchemaIFTCandidate initWithDictionary:]([IFTSchemaIFTCandidate alloc], "initWithDictionary:", v9);
      -[IFTSchemaIFTParameter setCandidate:](v5, "setCandidate:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)collectionIndex
{
  return self->_collectionIndex;
}

- (IFTSchemaIFTCandidate)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_candidate, a3);
}

- (void)setHasKey:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCandidate:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
