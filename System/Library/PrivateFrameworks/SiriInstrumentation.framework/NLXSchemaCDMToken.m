@implementation NLXSchemaCDMToken

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLXSchemaCDMToken;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[NLXSchemaCDMToken deleteValue](self, "deleteValue");
    -[NLXSchemaCDMToken deleteCleanValue](self, "deleteCleanValue");
    -[NLXSchemaCDMToken deleteNormalizedValues](self, "deleteNormalizedValues");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[NLXSchemaCDMToken deleteValue](self, "deleteValue");
    -[NLXSchemaCDMToken deleteCleanValue](self, "deleteCleanValue");
    -[NLXSchemaCDMToken deleteNormalizedValues](self, "deleteNormalizedValues");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[NLXSchemaCDMToken deleteValue](self, "deleteValue");
    -[NLXSchemaCDMToken deleteCleanValue](self, "deleteCleanValue");
    -[NLXSchemaCDMToken deleteNormalizedValues](self, "deleteNormalizedValues");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[NLXSchemaCDMToken deleteValue](self, "deleteValue");
    -[NLXSchemaCDMToken deleteCleanValue](self, "deleteCleanValue");
    -[NLXSchemaCDMToken deleteNormalizedValues](self, "deleteNormalizedValues");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[NLXSchemaCDMToken deleteValue](self, "deleteValue");
    -[NLXSchemaCDMToken deleteCleanValue](self, "deleteCleanValue");
    -[NLXSchemaCDMToken deleteNormalizedValues](self, "deleteNormalizedValues");
  }

  return v5;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteValue
{
  -[NLXSchemaCDMToken setValue:](self, "setValue:", 0);
}

- (void)setBegin:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_begin = a3;
}

- (BOOL)hasBegin
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBegin:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteBegin
{
  -[NLXSchemaCDMToken setBegin:](self, "setBegin:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEnd:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_end = a3;
}

- (BOOL)hasEnd
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEnd
{
  -[NLXSchemaCDMToken setEnd:](self, "setEnd:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsSignificant:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isSignificant = a3;
}

- (BOOL)hasIsSignificant
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsSignificant
{
  -[NLXSchemaCDMToken setIsSignificant:](self, "setIsSignificant:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsWhitespace:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isWhitespace = a3;
}

- (BOOL)hasIsWhitespace
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsWhitespace:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsWhitespace
{
  -[NLXSchemaCDMToken setIsWhitespace:](self, "setIsWhitespace:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setTokenIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tokenIndex = a3;
}

- (BOOL)hasTokenIndex
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteTokenIndex
{
  -[NLXSchemaCDMToken setTokenIndex:](self, "setTokenIndex:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setNonWhitespaceTokenIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_nonWhitespaceTokenIndex = a3;
}

- (BOOL)hasNonWhitespaceTokenIndex
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasNonWhitespaceTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteNonWhitespaceTokenIndex
{
  -[NLXSchemaCDMToken setNonWhitespaceTokenIndex:](self, "setNonWhitespaceTokenIndex:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)hasCleanValue
{
  return self->_cleanValue != 0;
}

- (void)deleteCleanValue
{
  -[NLXSchemaCDMToken setCleanValue:](self, "setCleanValue:", 0);
}

- (void)clearNormalizedValues
{
  -[NSArray removeAllObjects](self->_normalizedValues, "removeAllObjects");
}

- (void)addNormalizedValues:(id)a3
{
  id v4;
  NSArray *normalizedValues;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  normalizedValues = self->_normalizedValues;
  v8 = v4;
  if (!normalizedValues)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_normalizedValues;
    self->_normalizedValues = v6;

    v4 = v8;
    normalizedValues = self->_normalizedValues;
  }
  -[NSArray addObject:](normalizedValues, "addObject:", v4);

}

- (unint64_t)normalizedValuesCount
{
  return -[NSArray count](self->_normalizedValues, "count");
}

- (id)normalizedValuesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_normalizedValues, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMTokenReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NLXSchemaCDMToken value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field();
LABEL_10:
  -[NLXSchemaCDMToken cleanValue](self, "cleanValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_normalizedValues;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $9833CD79836BCD9C6DC73F6E21AAA665 has;
  unsigned int v13;
  unsigned int begin;
  int v15;
  unsigned int end;
  int v17;
  int isSignificant;
  int v19;
  int isWhitespace;
  int v21;
  unsigned int tokenIndex;
  int v23;
  unsigned int nonWhitespaceTokenIndex;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[NLXSchemaCDMToken value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_39;
  -[NLXSchemaCDMToken value](self, "value");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaCDMToken value](self, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_40;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_40;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    begin = self->_begin;
    if (begin != objc_msgSend(v4, "begin"))
      goto LABEL_40;
    has = self->_has;
    v13 = v4[56];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_40;
  if (v15)
  {
    end = self->_end;
    if (end != objc_msgSend(v4, "end"))
      goto LABEL_40;
    has = self->_has;
    v13 = v4[56];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_40;
  if (v17)
  {
    isSignificant = self->_isSignificant;
    if (isSignificant != objc_msgSend(v4, "isSignificant"))
      goto LABEL_40;
    has = self->_has;
    v13 = v4[56];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_40;
  if (v19)
  {
    isWhitespace = self->_isWhitespace;
    if (isWhitespace != objc_msgSend(v4, "isWhitespace"))
      goto LABEL_40;
    has = self->_has;
    v13 = v4[56];
  }
  v21 = (*(unsigned int *)&has >> 4) & 1;
  if (v21 != ((v13 >> 4) & 1))
    goto LABEL_40;
  if (v21)
  {
    tokenIndex = self->_tokenIndex;
    if (tokenIndex != objc_msgSend(v4, "tokenIndex"))
      goto LABEL_40;
    has = self->_has;
    v13 = v4[56];
  }
  v23 = (*(unsigned int *)&has >> 5) & 1;
  if (v23 != ((v13 >> 5) & 1))
    goto LABEL_40;
  if (v23)
  {
    nonWhitespaceTokenIndex = self->_nonWhitespaceTokenIndex;
    if (nonWhitespaceTokenIndex != objc_msgSend(v4, "nonWhitespaceTokenIndex"))
      goto LABEL_40;
  }
  -[NLXSchemaCDMToken cleanValue](self, "cleanValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_39;
  -[NLXSchemaCDMToken cleanValue](self, "cleanValue");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[NLXSchemaCDMToken cleanValue](self, "cleanValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cleanValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_40;
  }
  else
  {

  }
  -[NLXSchemaCDMToken normalizedValues](self, "normalizedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_39:

    goto LABEL_40;
  }
  -[NLXSchemaCDMToken normalizedValues](self, "normalizedValues");
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
  {

LABEL_43:
    v35 = 1;
    goto LABEL_41;
  }
  v31 = (void *)v30;
  -[NLXSchemaCDMToken normalizedValues](self, "normalizedValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedValues");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "isEqual:", v33);

  if ((v34 & 1) != 0)
    goto LABEL_43;
LABEL_40:
  v35 = 0;
LABEL_41:

  return v35;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_begin;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_end;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_isSignificant;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_isWhitespace;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v8 = 2654435761 * self->_tokenIndex;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v9 = 2654435761 * self->_nonWhitespaceTokenIndex;
LABEL_14:
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_cleanValue, "hash");
  return v10 ^ -[NSArray hash](self->_normalizedValues, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMToken begin](self, "begin"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("begin"));

  }
  if (self->_cleanValue)
  {
    -[NLXSchemaCDMToken cleanValue](self, "cleanValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cleanValue"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMToken end](self, "end"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("end"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NLXSchemaCDMToken isSignificant](self, "isSignificant"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isSignificant"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NLXSchemaCDMToken isWhitespace](self, "isWhitespace"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isWhitespace"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMToken nonWhitespaceTokenIndex](self, "nonWhitespaceTokenIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nonWhitespaceTokenIndex"));

  }
LABEL_10:
  if (self->_normalizedValues)
  {
    -[NLXSchemaCDMToken normalizedValues](self, "normalizedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("normalizedValues"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMToken tokenIndex](self, "tokenIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("tokenIndex"));

  }
  if (self->_value)
  {
    -[NLXSchemaCDMToken value](self, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("value"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMToken dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMToken)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMToken *v5;
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
    self = -[NLXSchemaCDMToken initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMToken)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMToken *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NLXSchemaCDMToken *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NLXSchemaCDMToken;
  v5 = -[NLXSchemaCDMToken init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[NLXSchemaCDMToken setValue:](v5, "setValue:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("begin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMToken setBegin:](v5, "setBegin:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMToken setEnd:](v5, "setEnd:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSignificant"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMToken setIsSignificant:](v5, "setIsSignificant:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWhitespace"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMToken setIsWhitespace:](v5, "setIsWhitespace:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMToken setTokenIndex:](v5, "setTokenIndex:", objc_msgSend(v12, "unsignedIntValue"));
    v32 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nonWhitespaceTokenIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMToken setNonWhitespaceTokenIndex:](v5, "setNonWhitespaceTokenIndex:", objc_msgSend(v13, "unsignedIntValue"));
    v31 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cleanValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[NLXSchemaCDMToken setCleanValue:](v5, "setCleanValue:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("normalizedValues"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v11;
      v27 = v10;
      v28 = v9;
      v29 = v8;
      v30 = v6;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v34;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = (void *)objc_msgSend(v22, "copy");
              -[NLXSchemaCDMToken addNormalizedValues:](v5, "addNormalizedValues:", v23);

            }
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v19);
      }

      v8 = v29;
      v6 = v30;
      v10 = v27;
      v9 = v28;
      v11 = v26;
    }
    v24 = v5;

  }
  return v5;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)begin
{
  return self->_begin;
}

- (unsigned)end
{
  return self->_end;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (BOOL)isWhitespace
{
  return self->_isWhitespace;
}

- (unsigned)tokenIndex
{
  return self->_tokenIndex;
}

- (unsigned)nonWhitespaceTokenIndex
{
  return self->_nonWhitespaceTokenIndex;
}

- (NSString)cleanValue
{
  return self->_cleanValue;
}

- (void)setCleanValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)normalizedValues
{
  return self->_normalizedValues;
}

- (void)setNormalizedValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasValue:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCleanValue:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValues, 0);
  objc_storeStrong((id *)&self->_cleanValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
