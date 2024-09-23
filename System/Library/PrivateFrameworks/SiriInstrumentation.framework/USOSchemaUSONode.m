@implementation USOSchemaUSONode

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setUsoElementId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_usoElementId = a3;
}

- (BOOL)hasUsoElementId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUsoElementId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUsoElementId
{
  -[USOSchemaUSONode setUsoElementId:](self, "setUsoElementId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUsoVerbElementId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_usoVerbElementId = a3;
}

- (BOOL)hasUsoVerbElementId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUsoVerbElementId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUsoVerbElementId
{
  -[USOSchemaUSONode setUsoVerbElementId:](self, "setUsoVerbElementId:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasEntityLabel
{
  return self->_entityLabel != 0;
}

- (void)deleteEntityLabel
{
  -[USOSchemaUSONode setEntityLabel:](self, "setEntityLabel:", 0);
}

- (BOOL)hasVerbLabel
{
  return self->_verbLabel != 0;
}

- (void)deleteVerbLabel
{
  -[USOSchemaUSONode setVerbLabel:](self, "setVerbLabel:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSONodeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[USOSchemaUSONode entityLabel](self, "entityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[USOSchemaUSONode verbLabel](self, "verbLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $373F46F906BD3509657FAFED3F994DB0 has;
  unsigned int v6;
  unsigned int usoElementId;
  int v8;
  unsigned int usoVerbElementId;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    usoElementId = self->_usoElementId;
    if (usoElementId != objc_msgSend(v4, "usoElementId"))
      goto LABEL_19;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    usoVerbElementId = self->_usoVerbElementId;
    if (usoVerbElementId != objc_msgSend(v4, "usoVerbElementId"))
      goto LABEL_19;
  }
  -[USOSchemaUSONode entityLabel](self, "entityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_18;
  -[USOSchemaUSONode entityLabel](self, "entityLabel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[USOSchemaUSONode entityLabel](self, "entityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_19;
  }
  else
  {

  }
  -[USOSchemaUSONode verbLabel](self, "verbLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "verbLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[USOSchemaUSONode verbLabel](self, "verbLabel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_22:
      v22 = 1;
      goto LABEL_20;
    }
    v18 = (void *)v17;
    -[USOSchemaUSONode verbLabel](self, "verbLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "verbLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
LABEL_18:

  }
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_usoElementId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_usoVerbElementId;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_entityLabel, "hash");
  return v5 ^ -[NSString hash](self->_verbLabel, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entityLabel)
  {
    -[USOSchemaUSONode entityLabel](self, "entityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityLabel"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSONode usoElementId](self, "usoElementId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("usoElementId"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSONode usoVerbElementId](self, "usoVerbElementId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("usoVerbElementId"));

  }
  if (self->_verbLabel)
  {
    -[USOSchemaUSONode verbLabel](self, "verbLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("verbLabel"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSONode dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSONode)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSONode *v5;
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
    self = -[USOSchemaUSONode initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSONode)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSONode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  USOSchemaUSONode *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSchemaUSONode;
  v5 = -[USOSchemaUSONode init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usoElementId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSONode setUsoElementId:](v5, "setUsoElementId:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usoVerbElementId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSONode setUsoVerbElementId:](v5, "setUsoVerbElementId:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[USOSchemaUSONode setEntityLabel:](v5, "setEntityLabel:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verbLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[USOSchemaUSONode setVerbLabel:](v5, "setVerbLabel:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unsigned)usoElementId
{
  return self->_usoElementId;
}

- (unsigned)usoVerbElementId
{
  return self->_usoVerbElementId;
}

- (NSString)entityLabel
{
  return self->_entityLabel;
}

- (void)setEntityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)verbLabel
{
  return self->_verbLabel;
}

- (void)setVerbLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasEntityLabel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasVerbLabel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verbLabel, 0);
  objc_storeStrong((id *)&self->_entityLabel, 0);
}

@end
