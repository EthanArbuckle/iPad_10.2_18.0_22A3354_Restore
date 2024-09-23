@implementation SISchemaCardSectionKeyboardInvocationContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setKeyboardPresented:(BOOL)a3
{
  *(&self->_existingText + 1) |= 1u;
  self->_keyboardPresented = a3;
}

- (BOOL)hasKeyboardPresented
{
  return *(&self->_existingText + 1);
}

- (void)setHasKeyboardPresented:(BOOL)a3
{
  *(&self->_existingText + 1) = *(&self->_existingText + 1) & 0xFE | a3;
}

- (void)deleteKeyboardPresented
{
  -[SISchemaCardSectionKeyboardInvocationContext setKeyboardPresented:](self, "setKeyboardPresented:", 0);
  *(&self->_existingText + 1) &= ~1u;
}

- (void)setKeyboardLocale:(int)a3
{
  *(&self->_existingText + 1) |= 2u;
  self->_keyboardLocale = a3;
}

- (BOOL)hasKeyboardLocale
{
  return (*((unsigned __int8 *)&self->_existingText + 1) >> 1) & 1;
}

- (void)setHasKeyboardLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_existingText + 1) = *(&self->_existingText + 1) & 0xFD | v3;
}

- (void)deleteKeyboardLocale
{
  -[SISchemaCardSectionKeyboardInvocationContext setKeyboardLocale:](self, "setKeyboardLocale:", 0);
  *(&self->_existingText + 1) &= ~2u;
}

- (void)setExistingText:(BOOL)a3
{
  *(&self->_existingText + 1) |= 4u;
  self->_existingText = a3;
}

- (BOOL)hasExistingText
{
  return (*((unsigned __int8 *)&self->_existingText + 1) >> 2) & 1;
}

- (void)setHasExistingText:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_existingText + 1) = *(&self->_existingText + 1) & 0xFB | v3;
}

- (void)deleteExistingText
{
  -[SISchemaCardSectionKeyboardInvocationContext setExistingText:](self, "setExistingText:", 0);
  *(&self->_existingText + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCardSectionKeyboardInvocationContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_existingText + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_existingText + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(&self->_existingText + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  v5 = *(&self->_existingText + 1);
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
  int keyboardPresented;
  int v8;
  int keyboardLocale;
  int v10;
  int existingText;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_existingText + 1);
  v6 = v4[17];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    keyboardPresented = self->_keyboardPresented;
    if (keyboardPresented != objc_msgSend(v4, "keyboardPresented"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_existingText + 1);
    v6 = v4[17];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    keyboardLocale = self->_keyboardLocale;
    if (keyboardLocale == objc_msgSend(v4, "keyboardLocale"))
    {
      v5 = *((unsigned __int8 *)&self->_existingText + 1);
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
    existingText = self->_existingText;
    if (existingText != objc_msgSend(v4, "existingText"))
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

  if (!*(&self->_existingText + 1))
  {
    v2 = 0;
    if ((*(&self->_existingText + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_existingText + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_keyboardPresented;
  if ((*(&self->_existingText + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_keyboardLocale;
  if ((*(&self->_existingText + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_existingText;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_existingText + 1);
  if ((v4 & 4) == 0)
  {
    if ((*(&self->_existingText + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v8 = -[SISchemaCardSectionKeyboardInvocationContext keyboardLocale](self, "keyboardLocale") - 1;
    if (v8 > 0x3D)
      v9 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v9 = off_1E56345A0[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("keyboardLocale"));
    if (*(&self->_existingText + 1))
      goto LABEL_4;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaCardSectionKeyboardInvocationContext existingText](self, "existingText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("existingText"));

  v4 = *(&self->_existingText + 1);
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaCardSectionKeyboardInvocationContext keyboardPresented](self, "keyboardPresented"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("keyboardPresented"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaCardSectionKeyboardInvocationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaCardSectionKeyboardInvocationContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaCardSectionKeyboardInvocationContext *v5;
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
    self = -[SISchemaCardSectionKeyboardInvocationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaCardSectionKeyboardInvocationContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaCardSectionKeyboardInvocationContext *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaCardSectionKeyboardInvocationContext *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaCardSectionKeyboardInvocationContext;
  v5 = -[SISchemaCardSectionKeyboardInvocationContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardPresented"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCardSectionKeyboardInvocationContext setKeyboardPresented:](v5, "setKeyboardPresented:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardLocale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCardSectionKeyboardInvocationContext setKeyboardLocale:](v5, "setKeyboardLocale:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("existingText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCardSectionKeyboardInvocationContext setExistingText:](v5, "setExistingText:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)keyboardPresented
{
  return self->_keyboardPresented;
}

- (int)keyboardLocale
{
  return self->_keyboardLocale;
}

- (BOOL)existingText
{
  return self->_existingText;
}

@end
