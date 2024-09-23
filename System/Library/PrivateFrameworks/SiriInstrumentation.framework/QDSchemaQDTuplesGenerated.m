@implementation QDSchemaQDTuplesGenerated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumberOfTuples:(unsigned int)a3
{
  *(&self->_wasToolTupleLimitReached + 1) |= 1u;
  self->_numberOfTuples = a3;
}

- (BOOL)hasNumberOfTuples
{
  return *(&self->_wasToolTupleLimitReached + 1);
}

- (void)setHasNumberOfTuples:(BOOL)a3
{
  *(&self->_wasToolTupleLimitReached + 1) = *(&self->_wasToolTupleLimitReached + 1) & 0xFE | a3;
}

- (void)deleteNumberOfTuples
{
  -[QDSchemaQDTuplesGenerated setNumberOfTuples:](self, "setNumberOfTuples:", 0);
  *(&self->_wasToolTupleLimitReached + 1) &= ~1u;
}

- (void)setMaximumTupleWidth:(unsigned int)a3
{
  *(&self->_wasToolTupleLimitReached + 1) |= 2u;
  self->_maximumTupleWidth = a3;
}

- (BOOL)hasMaximumTupleWidth
{
  return (*((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1) >> 1) & 1;
}

- (void)setHasMaximumTupleWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_wasToolTupleLimitReached + 1) = *(&self->_wasToolTupleLimitReached + 1) & 0xFD | v3;
}

- (void)deleteMaximumTupleWidth
{
  -[QDSchemaQDTuplesGenerated setMaximumTupleWidth:](self, "setMaximumTupleWidth:", 0);
  *(&self->_wasToolTupleLimitReached + 1) &= ~2u;
}

- (void)setWasToolTupleLimitReached:(BOOL)a3
{
  *(&self->_wasToolTupleLimitReached + 1) |= 4u;
  self->_wasToolTupleLimitReached = a3;
}

- (BOOL)hasWasToolTupleLimitReached
{
  return (*((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1) >> 2) & 1;
}

- (void)setHasWasToolTupleLimitReached:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_wasToolTupleLimitReached + 1) = *(&self->_wasToolTupleLimitReached + 1) & 0xFB | v3;
}

- (void)deleteWasToolTupleLimitReached
{
  -[QDSchemaQDTuplesGenerated setWasToolTupleLimitReached:](self, "setWasToolTupleLimitReached:", 0);
  *(&self->_wasToolTupleLimitReached + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDTuplesGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_wasToolTupleLimitReached + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_wasToolTupleLimitReached + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(&self->_wasToolTupleLimitReached + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  v5 = *(&self->_wasToolTupleLimitReached + 1);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int numberOfTuples;
  int v8;
  unsigned int maximumTupleWidth;
  int v10;
  int wasToolTupleLimitReached;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1);
  v6 = v4[17];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    numberOfTuples = self->_numberOfTuples;
    if (numberOfTuples != objc_msgSend(v4, "numberOfTuples"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1);
    v6 = v4[17];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    maximumTupleWidth = self->_maximumTupleWidth;
    if (maximumTupleWidth == objc_msgSend(v4, "maximumTupleWidth"))
    {
      v5 = *((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1);
      v6 = v4[17];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    wasToolTupleLimitReached = self->_wasToolTupleLimitReached;
    if (wasToolTupleLimitReached != objc_msgSend(v4, "wasToolTupleLimitReached"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!*(&self->_wasToolTupleLimitReached + 1))
  {
    v2 = 0;
    if ((*(&self->_wasToolTupleLimitReached + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_wasToolTupleLimitReached + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_numberOfTuples;
  if ((*(&self->_wasToolTupleLimitReached + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_maximumTupleWidth;
  if ((*(&self->_wasToolTupleLimitReached + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_wasToolTupleLimitReached;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_wasToolTupleLimitReached + 1);
  if ((v4 & 2) == 0)
  {
    if (!*(&self->_wasToolTupleLimitReached + 1))
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[QDSchemaQDTuplesGenerated numberOfTuples](self, "numberOfTuples"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numberOfTuples"));

    if ((*(&self->_wasToolTupleLimitReached + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[QDSchemaQDTuplesGenerated maximumTupleWidth](self, "maximumTupleWidth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("maximumTupleWidth"));

  v4 = *(&self->_wasToolTupleLimitReached + 1);
  if ((v4 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[QDSchemaQDTuplesGenerated wasToolTupleLimitReached](self, "wasToolTupleLimitReached"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("wasToolTupleLimitReached"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDTuplesGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDTuplesGenerated)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDTuplesGenerated *v5;
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
    self = -[QDSchemaQDTuplesGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDTuplesGenerated)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDTuplesGenerated *v5;
  void *v6;
  void *v7;
  void *v8;
  QDSchemaQDTuplesGenerated *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QDSchemaQDTuplesGenerated;
  v5 = -[QDSchemaQDTuplesGenerated init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfTuples"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDTuplesGenerated setNumberOfTuples:](v5, "setNumberOfTuples:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumTupleWidth"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDTuplesGenerated setMaximumTupleWidth:](v5, "setMaximumTupleWidth:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasToolTupleLimitReached"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDTuplesGenerated setWasToolTupleLimitReached:](v5, "setWasToolTupleLimitReached:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (unsigned)numberOfTuples
{
  return self->_numberOfTuples;
}

- (unsigned)maximumTupleWidth
{
  return self->_maximumTupleWidth;
}

- (BOOL)wasToolTupleLimitReached
{
  return self->_wasToolTupleLimitReached;
}

@end
