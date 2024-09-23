@implementation USOSchemaUSOEdgeLabel

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
  v9.super_class = (Class)USOSchemaUSOEdgeLabel;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOEdgeLabel baseEdgeLabel](self, "baseEdgeLabel", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[USOSchemaUSOEdgeLabel deleteBaseEdgeLabel](self, "deleteBaseEdgeLabel");
  return v5;
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
  -[USOSchemaUSOEdgeLabel setUsoElementId:](self, "setUsoElementId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEnumeration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_enumeration = a3;
}

- (BOOL)hasEnumeration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEnumeration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEnumeration
{
  -[USOSchemaUSOEdgeLabel setEnumeration:](self, "setEnumeration:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasBaseEdgeLabel
{
  return self->_baseEdgeLabel != 0;
}

- (void)deleteBaseEdgeLabel
{
  -[USOSchemaUSOEdgeLabel setBaseEdgeLabel:](self, "setBaseEdgeLabel:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEdgeLabelReadFrom(self, (uint64_t)a3);
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
  -[USOSchemaUSOEdgeLabel baseEdgeLabel](self, "baseEdgeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[USOSchemaUSOEdgeLabel baseEdgeLabel](self, "baseEdgeLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $A707DC69A882463B7BE27AD89EBF152C has;
  unsigned int v6;
  unsigned int usoElementId;
  int v8;
  unsigned int enumeration;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    usoElementId = self->_usoElementId;
    if (usoElementId != objc_msgSend(v4, "usoElementId"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (enumeration = self->_enumeration, enumeration == objc_msgSend(v4, "enumeration")))
    {
      -[USOSchemaUSOEdgeLabel baseEdgeLabel](self, "baseEdgeLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "baseEdgeLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[USOSchemaUSOEdgeLabel baseEdgeLabel](self, "baseEdgeLabel");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[USOSchemaUSOEdgeLabel baseEdgeLabel](self, "baseEdgeLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "baseEdgeLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_usoElementId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[USOSchemaUSOLabel hash](self->_baseEdgeLabel, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_enumeration;
  return v3 ^ v2 ^ -[USOSchemaUSOLabel hash](self->_baseEdgeLabel, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_baseEdgeLabel)
  {
    -[USOSchemaUSOEdgeLabel baseEdgeLabel](self, "baseEdgeLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("baseEdgeLabel"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("baseEdgeLabel"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEdgeLabel enumeration](self, "enumeration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("enumeration"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEdgeLabel usoElementId](self, "usoElementId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("usoElementId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOEdgeLabel dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOEdgeLabel)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOEdgeLabel *v5;
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
    self = -[USOSchemaUSOEdgeLabel initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOEdgeLabel)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOEdgeLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  USOSchemaUSOLabel *v9;
  USOSchemaUSOEdgeLabel *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)USOSchemaUSOEdgeLabel;
  v5 = -[USOSchemaUSOEdgeLabel init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usoElementId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEdgeLabel setUsoElementId:](v5, "setUsoElementId:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enumeration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEdgeLabel setEnumeration:](v5, "setEnumeration:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("baseEdgeLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[USOSchemaUSOLabel initWithDictionary:]([USOSchemaUSOLabel alloc], "initWithDictionary:", v8);
      -[USOSchemaUSOEdgeLabel setBaseEdgeLabel:](v5, "setBaseEdgeLabel:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unsigned)usoElementId
{
  return self->_usoElementId;
}

- (unsigned)enumeration
{
  return self->_enumeration;
}

- (USOSchemaUSOLabel)baseEdgeLabel
{
  return self->_baseEdgeLabel;
}

- (void)setBaseEdgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_baseEdgeLabel, a3);
}

- (void)setHasBaseEdgeLabel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseEdgeLabel, 0);
}

@end
