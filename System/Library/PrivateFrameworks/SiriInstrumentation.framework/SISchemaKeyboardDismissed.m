@implementation SISchemaKeyboardDismissed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setKeyboardUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_keyboardUsed = a3;
}

- (BOOL)hasKeyboardUsed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasKeyboardUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteKeyboardUsed
{
  -[SISchemaKeyboardDismissed setKeyboardUsed:](self, "setKeyboardUsed:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setLengthInWords:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lengthInWords = a3;
}

- (BOOL)hasLengthInWords
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasLengthInWords:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteLengthInWords
{
  -[SISchemaKeyboardDismissed setLengthInWords:](self, "setLengthInWords:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setLengthInChars:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_lengthInChars = a3;
}

- (BOOL)hasLengthInChars
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLengthInChars:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteLengthInChars
{
  -[SISchemaKeyboardDismissed setLengthInChars:](self, "setLengthInChars:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNumCharsAdded:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numCharsAdded = a3;
}

- (BOOL)hasNumCharsAdded
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNumCharsAdded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumCharsAdded
{
  -[SISchemaKeyboardDismissed setNumCharsAdded:](self, "setNumCharsAdded:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setNumCharsDeleted:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numCharsDeleted = a3;
}

- (BOOL)hasNumCharsDeleted
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasNumCharsDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteNumCharsDeleted
{
  -[SISchemaKeyboardDismissed setNumCharsDeleted:](self, "setNumCharsDeleted:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setEditDistance:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_editDistance = a3;
}

- (BOOL)hasEditDistance
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasEditDistance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteEditDistance
{
  -[SISchemaKeyboardDismissed setEditDistance:](self, "setEditDistance:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setEmojiUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_emojiUsed = a3;
}

- (BOOL)hasEmojiUsed
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasEmojiUsed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteEmojiUsed
{
  -[SISchemaKeyboardDismissed setEmojiUsed:](self, "setEmojiUsed:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setKeyboardLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_keyboardLocale = a3;
}

- (BOOL)hasKeyboardLocale
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasKeyboardLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteKeyboardLocale
{
  -[SISchemaKeyboardDismissed setKeyboardLocale:](self, "setKeyboardLocale:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaKeyboardDismissedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    PBDataWriterWriteInt32Field();
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8E079A7A5CF814B4C0E98CCF88148813 has;
  unsigned int v6;
  int keyboardUsed;
  int v8;
  int lengthInWords;
  int v10;
  int lengthInChars;
  int v12;
  int numCharsAdded;
  int v14;
  int numCharsDeleted;
  int v16;
  int editDistance;
  int v18;
  int emojiUsed;
  int keyboardLocale;
  BOOL v21;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    keyboardUsed = self->_keyboardUsed;
    if (keyboardUsed != objc_msgSend(v4, "keyboardUsed"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_34;
  if (v8)
  {
    lengthInWords = self->_lengthInWords;
    if (lengthInWords != objc_msgSend(v4, "lengthInWords"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[40];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_34;
  if (v10)
  {
    lengthInChars = self->_lengthInChars;
    if (lengthInChars != objc_msgSend(v4, "lengthInChars"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[40];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_34;
  if (v12)
  {
    numCharsAdded = self->_numCharsAdded;
    if (numCharsAdded != objc_msgSend(v4, "numCharsAdded"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[40];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_34;
  if (v14)
  {
    numCharsDeleted = self->_numCharsDeleted;
    if (numCharsDeleted != objc_msgSend(v4, "numCharsDeleted"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[40];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_34;
  if (v16)
  {
    editDistance = self->_editDistance;
    if (editDistance != objc_msgSend(v4, "editDistance"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[40];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_34;
  if (v18)
  {
    emojiUsed = self->_emojiUsed;
    if (emojiUsed == objc_msgSend(v4, "emojiUsed"))
    {
      has = self->_has;
      v6 = v4[40];
      goto LABEL_30;
    }
LABEL_34:
    v21 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ *(_DWORD *)&has) & 0x80) != 0)
    goto LABEL_34;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    keyboardLocale = self->_keyboardLocale;
    if (keyboardLocale != objc_msgSend(v4, "keyboardLocale"))
      goto LABEL_34;
  }
  v21 = 1;
LABEL_35:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_keyboardUsed;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_lengthInWords;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
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
    v4 = 2654435761 * self->_lengthInChars;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_numCharsAdded;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_numCharsDeleted;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_editDistance;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_emojiUsed;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_keyboardLocale;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaKeyboardDismissed editDistance](self, "editDistance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("editDistance"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaKeyboardDismissed emojiUsed](self, "emojiUsed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("emojiUsed"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_13:
  v9 = -[SISchemaKeyboardDismissed keyboardLocale](self, "keyboardLocale") - 1;
  if (v9 > 0x3D)
    v10 = CFSTR("LOCALE_UNKNOWN_LOCALE");
  else
    v10 = off_1E5636C60[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("keyboardLocale"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaKeyboardDismissed keyboardUsed](self, "keyboardUsed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("keyboardUsed"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaKeyboardDismissed lengthInChars](self, "lengthInChars"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lengthInChars"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaKeyboardDismissed numCharsAdded](self, "numCharsAdded"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numCharsAdded"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaKeyboardDismissed lengthInWords](self, "lengthInWords"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("lengthInWords"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_20;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaKeyboardDismissed numCharsDeleted](self, "numCharsDeleted"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numCharsDeleted"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaKeyboardDismissed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaKeyboardDismissed)initWithJSON:(id)a3
{
  void *v4;
  SISchemaKeyboardDismissed *v5;
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
    self = -[SISchemaKeyboardDismissed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaKeyboardDismissed)initWithDictionary:(id)a3
{
  id v4;
  SISchemaKeyboardDismissed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SISchemaKeyboardDismissed *v14;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SISchemaKeyboardDismissed;
  v5 = -[SISchemaKeyboardDismissed init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardUsed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaKeyboardDismissed setKeyboardUsed:](v5, "setKeyboardUsed:", objc_msgSend(v6, "BOOLValue"));
    v16 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lengthInWords"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaKeyboardDismissed setLengthInWords:](v5, "setLengthInWords:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lengthInChars"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaKeyboardDismissed setLengthInChars:](v5, "setLengthInChars:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCharsAdded"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaKeyboardDismissed setNumCharsAdded:](v5, "setNumCharsAdded:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCharsDeleted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaKeyboardDismissed setNumCharsDeleted:](v5, "setNumCharsDeleted:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("editDistance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaKeyboardDismissed setEditDistance:](v5, "setEditDistance:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emojiUsed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaKeyboardDismissed setEmojiUsed:](v5, "setEmojiUsed:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardLocale"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaKeyboardDismissed setKeyboardLocale:](v5, "setKeyboardLocale:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (BOOL)keyboardUsed
{
  return self->_keyboardUsed;
}

- (int)lengthInWords
{
  return self->_lengthInWords;
}

- (int)lengthInChars
{
  return self->_lengthInChars;
}

- (int)numCharsAdded
{
  return self->_numCharsAdded;
}

- (int)numCharsDeleted
{
  return self->_numCharsDeleted;
}

- (int)editDistance
{
  return self->_editDistance;
}

- (BOOL)emojiUsed
{
  return self->_emojiUsed;
}

- (int)keyboardLocale
{
  return self->_keyboardLocale;
}

@end
