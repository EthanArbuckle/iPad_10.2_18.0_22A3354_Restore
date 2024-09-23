@implementation USOSchemaUSOUtteranceSpan

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startIndex = a3;
}

- (BOOL)hasStartIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStartIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStartIndex
{
  -[USOSchemaUSOUtteranceSpan setStartIndex:](self, "setStartIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endIndex = a3;
}

- (BOOL)hasEndIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEndIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEndIndex
{
  -[USOSchemaUSOUtteranceSpan setEndIndex:](self, "setEndIndex:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setStartUnicodeScalarIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startUnicodeScalarIndex = a3;
}

- (BOOL)hasStartUnicodeScalarIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasStartUnicodeScalarIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteStartUnicodeScalarIndex
{
  -[USOSchemaUSOUtteranceSpan setStartUnicodeScalarIndex:](self, "setStartUnicodeScalarIndex:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setEndUnicodeScalarIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_endUnicodeScalarIndex = a3;
}

- (BOOL)hasEndUnicodeScalarIndex
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasEndUnicodeScalarIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteEndUnicodeScalarIndex
{
  -[USOSchemaUSOUtteranceSpan setEndUnicodeScalarIndex:](self, "setEndUnicodeScalarIndex:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setStartMilliseconds:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_startMilliseconds = a3;
}

- (BOOL)hasStartMilliseconds
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasStartMilliseconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteStartMilliseconds
{
  -[USOSchemaUSOUtteranceSpan setStartMilliseconds:](self, "setStartMilliseconds:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setEndMilliseconds:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_endMilliseconds = a3;
}

- (BOOL)hasEndMilliseconds
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasEndMilliseconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteEndMilliseconds
{
  -[USOSchemaUSOUtteranceSpan setEndMilliseconds:](self, "setEndMilliseconds:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOUtteranceSpanReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $D57A5C819C3B84C6E0DE05EE76B05801 has;
  unsigned int v6;
  unsigned int startIndex;
  int v8;
  unsigned int endIndex;
  int v10;
  unsigned int startUnicodeScalarIndex;
  int v12;
  unsigned int endUnicodeScalarIndex;
  int v14;
  int startMilliseconds;
  int v16;
  int endMilliseconds;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    startIndex = self->_startIndex;
    if (startIndex != objc_msgSend(v4, "startIndex"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v8)
  {
    endIndex = self->_endIndex;
    if (endIndex != objc_msgSend(v4, "endIndex"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v10)
  {
    startUnicodeScalarIndex = self->_startUnicodeScalarIndex;
    if (startUnicodeScalarIndex != objc_msgSend(v4, "startUnicodeScalarIndex"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v12)
  {
    endUnicodeScalarIndex = self->_endUnicodeScalarIndex;
    if (endUnicodeScalarIndex != objc_msgSend(v4, "endUnicodeScalarIndex"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v14)
  {
    startMilliseconds = self->_startMilliseconds;
    if (startMilliseconds == objc_msgSend(v4, "startMilliseconds"))
    {
      has = self->_has;
      v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_26;
  if (v16)
  {
    endMilliseconds = self->_endMilliseconds;
    if (endMilliseconds != objc_msgSend(v4, "endMilliseconds"))
      goto LABEL_26;
  }
  v18 = 1;
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_startIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_endIndex;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_startUnicodeScalarIndex;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_endUnicodeScalarIndex;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_startMilliseconds;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_endMilliseconds;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceSpan endIndex](self, "endIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("endIndex"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[USOSchemaUSOUtteranceSpan endMilliseconds](self, "endMilliseconds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("endMilliseconds"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceSpan endUnicodeScalarIndex](self, "endUnicodeScalarIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("endUnicodeScalarIndex"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[USOSchemaUSOUtteranceSpan startMilliseconds](self, "startMilliseconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("startMilliseconds"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceSpan startIndex](self, "startIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("startIndex"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceSpan startUnicodeScalarIndex](self, "startUnicodeScalarIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("startUnicodeScalarIndex"));

  }
LABEL_8:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOUtteranceSpan dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOUtteranceSpan)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOUtteranceSpan *v5;
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
    self = -[USOSchemaUSOUtteranceSpan initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOUtteranceSpan)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOUtteranceSpan *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  USOSchemaUSOUtteranceSpan *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSchemaUSOUtteranceSpan;
  v5 = -[USOSchemaUSOUtteranceSpan init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOUtteranceSpan setStartIndex:](v5, "setStartIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOUtteranceSpan setEndIndex:](v5, "setEndIndex:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startUnicodeScalarIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOUtteranceSpan setStartUnicodeScalarIndex:](v5, "setStartUnicodeScalarIndex:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endUnicodeScalarIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOUtteranceSpan setEndUnicodeScalarIndex:](v5, "setEndUnicodeScalarIndex:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startMilliseconds"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOUtteranceSpan setStartMilliseconds:](v5, "setStartMilliseconds:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endMilliseconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOUtteranceSpan setEndMilliseconds:](v5, "setEndMilliseconds:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (unsigned)startUnicodeScalarIndex
{
  return self->_startUnicodeScalarIndex;
}

- (unsigned)endUnicodeScalarIndex
{
  return self->_endUnicodeScalarIndex;
}

- (int)startMilliseconds
{
  return self->_startMilliseconds;
}

- (int)endMilliseconds
{
  return self->_endMilliseconds;
}

@end
