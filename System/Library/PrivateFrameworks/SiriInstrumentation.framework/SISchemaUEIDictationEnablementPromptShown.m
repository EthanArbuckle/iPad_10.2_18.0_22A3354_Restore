@implementation SISchemaUEIDictationEnablementPromptShown

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsDictationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isDictationEnabled = a3;
}

- (BOOL)hasIsDictationEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsDictationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsDictationEnabled
{
  -[SISchemaUEIDictationEnablementPromptShown setIsDictationEnabled:](self, "setIsDictationEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsLearnMoreButtonClicked:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isLearnMoreButtonClicked = a3;
}

- (BOOL)hasIsLearnMoreButtonClicked
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsLearnMoreButtonClicked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsLearnMoreButtonClicked
{
  -[SISchemaUEIDictationEnablementPromptShown setIsLearnMoreButtonClicked:](self, "setIsLearnMoreButtonClicked:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPromptVisibilityDurationInMs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_promptVisibilityDurationInMs = a3;
}

- (BOOL)hasPromptVisibilityDurationInMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPromptVisibilityDurationInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePromptVisibilityDurationInMs
{
  -[SISchemaUEIDictationEnablementPromptShown setPromptVisibilityDurationInMs:](self, "setPromptVisibilityDurationInMs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationEnablementPromptShownReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $A1C998D2129E9794F21ED285BB4521A3 has;
  unsigned int v6;
  int isDictationEnabled;
  int v8;
  int isLearnMoreButtonClicked;
  int v10;
  int64_t promptVisibilityDurationInMs;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isDictationEnabled = self->_isDictationEnabled;
    if (isDictationEnabled != objc_msgSend(v4, "isDictationEnabled"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    isLearnMoreButtonClicked = self->_isLearnMoreButtonClicked;
    if (isLearnMoreButtonClicked == objc_msgSend(v4, "isLearnMoreButtonClicked"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    promptVisibilityDurationInMs = self->_promptVisibilityDurationInMs;
    if (promptVisibilityDurationInMs != objc_msgSend(v4, "promptVisibilityDurationInMs"))
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

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_isDictationEnabled;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_isLearnMoreButtonClicked;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_promptVisibilityDurationInMs;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaUEIDictationEnablementPromptShown isLearnMoreButtonClicked](self, "isLearnMoreButtonClicked"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isLearnMoreButtonClicked"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaUEIDictationEnablementPromptShown isDictationEnabled](self, "isDictationEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isDictationEnabled"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SISchemaUEIDictationEnablementPromptShown promptVisibilityDurationInMs](self, "promptVisibilityDurationInMs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("promptVisibilityDurationInMs"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIDictationEnablementPromptShown dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIDictationEnablementPromptShown)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIDictationEnablementPromptShown *v5;
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
    self = -[SISchemaUEIDictationEnablementPromptShown initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIDictationEnablementPromptShown)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIDictationEnablementPromptShown *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUEIDictationEnablementPromptShown *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUEIDictationEnablementPromptShown;
  v5 = -[SISchemaUEIDictationEnablementPromptShown init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDictationEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationEnablementPromptShown setIsDictationEnabled:](v5, "setIsDictationEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLearnMoreButtonClicked"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationEnablementPromptShown setIsLearnMoreButtonClicked:](v5, "setIsLearnMoreButtonClicked:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("promptVisibilityDurationInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationEnablementPromptShown setPromptVisibilityDurationInMs:](v5, "setPromptVisibilityDurationInMs:", objc_msgSend(v8, "longLongValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)isDictationEnabled
{
  return self->_isDictationEnabled;
}

- (BOOL)isLearnMoreButtonClicked
{
  return self->_isLearnMoreButtonClicked;
}

- (int64_t)promptVisibilityDurationInMs
{
  return self->_promptVisibilityDurationInMs;
}

@end
