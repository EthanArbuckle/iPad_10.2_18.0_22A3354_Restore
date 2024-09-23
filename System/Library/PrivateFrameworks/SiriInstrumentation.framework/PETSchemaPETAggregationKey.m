@implementation PETSchemaPETAggregationKey

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
  v9.super_class = (Class)PETSchemaPETAggregationKey;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETSchemaPETAggregationKey raw_message](self, "raw_message", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PETSchemaPETAggregationKey deleteRaw_message](self, "deleteRaw_message");
  return v5;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteType
{
  -[PETSchemaPETAggregationKey setType:](self, "setType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDatestamp:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_datestamp = a3;
}

- (BOOL)hasDatestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDatestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDatestamp
{
  -[PETSchemaPETAggregationKey setDatestamp:](self, "setDatestamp:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setBucket:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_bucket = a3;
}

- (BOOL)hasBucket
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteBucket
{
  -[PETSchemaPETAggregationKey setBucket:](self, "setBucket:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasRaw_message
{
  return self->_raw_message != 0;
}

- (void)deleteRaw_message
{
  -[PETSchemaPETAggregationKey setRaw_message:](self, "setRaw_message:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETAggregationKeyReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteDoubleField();
LABEL_5:
  -[PETSchemaPETAggregationKey raw_message](self, "raw_message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[PETSchemaPETAggregationKey raw_message](self, "raw_message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $E632653AB99B7EB6710B7D6523E5A2E9 has;
  unsigned int v6;
  int type;
  int v8;
  unsigned int datestamp;
  int v10;
  double bucket;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    type = self->_type;
    if (type != objc_msgSend(v4, "type"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      datestamp = self->_datestamp;
      if (datestamp != objc_msgSend(v4, "datestamp"))
        goto LABEL_18;
      has = self->_has;
      v6 = v4[32];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10 || (bucket = self->_bucket, objc_msgSend(v4, "bucket"), bucket == v12))
      {
        -[PETSchemaPETAggregationKey raw_message](self, "raw_message");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "raw_message");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if ((v13 == 0) != (v14 != 0))
        {
          -[PETSchemaPETAggregationKey raw_message](self, "raw_message");
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
          {

LABEL_21:
            v21 = 1;
            goto LABEL_19;
          }
          v17 = (void *)v16;
          -[PETSchemaPETAggregationKey raw_message](self, "raw_message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "raw_message");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if ((v20 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

        }
      }
    }
  }
LABEL_18:
  v21 = 0;
LABEL_19:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double bucket;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    return v4 ^ v3 ^ v9 ^ -[PETSchemaPETRawMessage hash](self->_raw_message, "hash");
  }
  v3 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_datestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  bucket = self->_bucket;
  v6 = -bucket;
  if (bucket >= 0.0)
    v6 = self->_bucket;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ -[PETSchemaPETRawMessage hash](self->_raw_message, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[PETSchemaPETAggregationKey bucket](self, "bucket");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bucket"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PETSchemaPETAggregationKey datestamp](self, "datestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("datestamp"));

  }
  if (self->_raw_message)
  {
    -[PETSchemaPETAggregationKey raw_message](self, "raw_message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rawMessage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("rawMessage"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11 = -[PETSchemaPETAggregationKey type](self, "type") - 1;
    if (v11 > 2)
      v12 = CFSTR("UNKNOWN");
    else
      v12 = off_1E5632AA0[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("type"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PETSchemaPETAggregationKey dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PETSchemaPETAggregationKey)initWithJSON:(id)a3
{
  void *v4;
  PETSchemaPETAggregationKey *v5;
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
    self = -[PETSchemaPETAggregationKey initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PETSchemaPETAggregationKey)initWithDictionary:(id)a3
{
  id v4;
  PETSchemaPETAggregationKey *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PETSchemaPETRawMessage *v10;
  PETSchemaPETAggregationKey *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PETSchemaPETAggregationKey;
  v5 = -[PETSchemaPETAggregationKey init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETAggregationKey setType:](v5, "setType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("datestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETAggregationKey setDatestamp:](v5, "setDatestamp:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bucket"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[PETSchemaPETAggregationKey setBucket:](v5, "setBucket:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[PETSchemaPETRawMessage initWithDictionary:]([PETSchemaPETRawMessage alloc], "initWithDictionary:", v9);
      -[PETSchemaPETAggregationKey setRaw_message:](v5, "setRaw_message:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)type
{
  return self->_type;
}

- (unsigned)datestamp
{
  return self->_datestamp;
}

- (double)bucket
{
  return self->_bucket;
}

- (PETSchemaPETRawMessage)raw_message
{
  return self->_raw_message;
}

- (void)setRaw_message:(id)a3
{
  objc_storeStrong((id *)&self->_raw_message, a3);
}

- (void)setHasRaw_message:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raw_message, 0);
}

@end
