@implementation FLOWSchemaFLOWKeyboardUsageMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumCharsAdded:(unsigned int)a3
{
  *(&self->_isEmojiUsed + 1) |= 1u;
  self->_numCharsAdded = a3;
}

- (BOOL)hasNumCharsAdded
{
  return *(&self->_isEmojiUsed + 1);
}

- (void)setHasNumCharsAdded:(BOOL)a3
{
  *(&self->_isEmojiUsed + 1) = *(&self->_isEmojiUsed + 1) & 0xFE | a3;
}

- (void)deleteNumCharsAdded
{
  -[FLOWSchemaFLOWKeyboardUsageMetadata setNumCharsAdded:](self, "setNumCharsAdded:", 0);
  *(&self->_isEmojiUsed + 1) &= ~1u;
}

- (void)setNumCharsDeleted:(unsigned int)a3
{
  *(&self->_isEmojiUsed + 1) |= 2u;
  self->_numCharsDeleted = a3;
}

- (BOOL)hasNumCharsDeleted
{
  return (*((unsigned __int8 *)&self->_isEmojiUsed + 1) >> 1) & 1;
}

- (void)setHasNumCharsDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isEmojiUsed + 1) = *(&self->_isEmojiUsed + 1) & 0xFD | v3;
}

- (void)deleteNumCharsDeleted
{
  -[FLOWSchemaFLOWKeyboardUsageMetadata setNumCharsDeleted:](self, "setNumCharsDeleted:", 0);
  *(&self->_isEmojiUsed + 1) &= ~2u;
}

- (void)setLevenshteinEditDistance:(unsigned int)a3
{
  *(&self->_isEmojiUsed + 1) |= 4u;
  self->_levenshteinEditDistance = a3;
}

- (BOOL)hasLevenshteinEditDistance
{
  return (*((unsigned __int8 *)&self->_isEmojiUsed + 1) >> 2) & 1;
}

- (void)setHasLevenshteinEditDistance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isEmojiUsed + 1) = *(&self->_isEmojiUsed + 1) & 0xFB | v3;
}

- (void)deleteLevenshteinEditDistance
{
  -[FLOWSchemaFLOWKeyboardUsageMetadata setLevenshteinEditDistance:](self, "setLevenshteinEditDistance:", 0);
  *(&self->_isEmojiUsed + 1) &= ~4u;
}

- (void)setIsEmojiUsed:(BOOL)a3
{
  *(&self->_isEmojiUsed + 1) |= 8u;
  self->_isEmojiUsed = a3;
}

- (BOOL)hasIsEmojiUsed
{
  return (*((unsigned __int8 *)&self->_isEmojiUsed + 1) >> 3) & 1;
}

- (void)setHasIsEmojiUsed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isEmojiUsed + 1) = *(&self->_isEmojiUsed + 1) & 0xF7 | v3;
}

- (void)deleteIsEmojiUsed
{
  -[FLOWSchemaFLOWKeyboardUsageMetadata setIsEmojiUsed:](self, "setIsEmojiUsed:", 0);
  *(&self->_isEmojiUsed + 1) &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWKeyboardUsageMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_isEmojiUsed + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = *(&self->_isEmojiUsed + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(&self->_isEmojiUsed + 1) & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(&self->_isEmojiUsed + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = *(&self->_isEmojiUsed + 1);
  if ((v4 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 8) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int numCharsAdded;
  int v8;
  unsigned int numCharsDeleted;
  int v10;
  unsigned int levenshteinEditDistance;
  int v12;
  int isEmojiUsed;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  v5 = *((unsigned __int8 *)&self->_isEmojiUsed + 1);
  v6 = v4[21];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_18;
  if ((v5 & 1) != 0)
  {
    numCharsAdded = self->_numCharsAdded;
    if (numCharsAdded != objc_msgSend(v4, "numCharsAdded"))
      goto LABEL_18;
    v5 = *((unsigned __int8 *)&self->_isEmojiUsed + 1);
    v6 = v4[21];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    numCharsDeleted = self->_numCharsDeleted;
    if (numCharsDeleted != objc_msgSend(v4, "numCharsDeleted"))
      goto LABEL_18;
    v5 = *((unsigned __int8 *)&self->_isEmojiUsed + 1);
    v6 = v4[21];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    levenshteinEditDistance = self->_levenshteinEditDistance;
    if (levenshteinEditDistance == objc_msgSend(v4, "levenshteinEditDistance"))
    {
      v5 = *((unsigned __int8 *)&self->_isEmojiUsed + 1);
      v6 = v4[21];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    isEmojiUsed = self->_isEmojiUsed;
    if (isEmojiUsed != objc_msgSend(v4, "isEmojiUsed"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*(&self->_isEmojiUsed + 1))
  {
    v2 = 2654435761 * self->_numCharsAdded;
    if ((*(&self->_isEmojiUsed + 1) & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_numCharsDeleted;
      if ((*(&self->_isEmojiUsed + 1) & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(&self->_isEmojiUsed + 1) & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(&self->_isEmojiUsed + 1) & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(&self->_isEmojiUsed + 1) & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_levenshteinEditDistance;
  if ((*(&self->_isEmojiUsed + 1) & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_isEmojiUsed;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isEmojiUsed + 1);
  if ((v4 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWKeyboardUsageMetadata isEmojiUsed](self, "isEmojiUsed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isEmojiUsed"));

    v4 = *(&self->_isEmojiUsed + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWKeyboardUsageMetadata numCharsAdded](self, "numCharsAdded"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numCharsAdded"));

      if ((*(&self->_isEmojiUsed + 1) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(&self->_isEmojiUsed + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWKeyboardUsageMetadata levenshteinEditDistance](self, "levenshteinEditDistance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("levenshteinEditDistance"));

  v4 = *(&self->_isEmojiUsed + 1);
  if ((v4 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWKeyboardUsageMetadata numCharsDeleted](self, "numCharsDeleted"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numCharsDeleted"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWKeyboardUsageMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWKeyboardUsageMetadata)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWKeyboardUsageMetadata *v5;
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
    self = -[FLOWSchemaFLOWKeyboardUsageMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWKeyboardUsageMetadata)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWKeyboardUsageMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FLOWSchemaFLOWKeyboardUsageMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWKeyboardUsageMetadata;
  v5 = -[FLOWSchemaFLOWKeyboardUsageMetadata init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCharsAdded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWKeyboardUsageMetadata setNumCharsAdded:](v5, "setNumCharsAdded:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCharsDeleted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWKeyboardUsageMetadata setNumCharsDeleted:](v5, "setNumCharsDeleted:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("levenshteinEditDistance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWKeyboardUsageMetadata setLevenshteinEditDistance:](v5, "setLevenshteinEditDistance:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmojiUsed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWKeyboardUsageMetadata setIsEmojiUsed:](v5, "setIsEmojiUsed:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (unsigned)numCharsAdded
{
  return self->_numCharsAdded;
}

- (unsigned)numCharsDeleted
{
  return self->_numCharsDeleted;
}

- (unsigned)levenshteinEditDistance
{
  return self->_levenshteinEditDistance;
}

- (BOOL)isEmojiUsed
{
  return self->_isEmojiUsed;
}

@end
