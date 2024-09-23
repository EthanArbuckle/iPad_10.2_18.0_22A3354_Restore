@implementation FLOWSchemaFLOWLanguageConfidence

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setLanguageCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_languageCode = a3;
}

- (BOOL)hasLanguageCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLanguageCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLanguageCode
{
  -[FLOWSchemaFLOWLanguageConfidence setLanguageCode:](self, "setLanguageCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setConfidenceScore:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidenceScore = a3;
}

- (BOOL)hasConfidenceScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteConfidenceScore
{
  -[FLOWSchemaFLOWLanguageConfidence setConfidenceScore:](self, "setConfidenceScore:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWLanguageConfidenceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $A97081F5871CDDAB7F2273266D61D7C5 has;
  unsigned int v6;
  int languageCode;
  int v8;
  unint64_t confidenceScore;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    languageCode = self->_languageCode;
    if (languageCode != objc_msgSend(v4, "languageCode"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    confidenceScore = self->_confidenceScore;
    if (confidenceScore != objc_msgSend(v4, "confidenceScore"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_languageCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761u * self->_confidenceScore;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[FLOWSchemaFLOWLanguageConfidence confidenceScore](self, "confidenceScore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confidenceScore"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = -[FLOWSchemaFLOWLanguageConfidence languageCode](self, "languageCode") - 1;
    if (v6 > 0xB8)
      v7 = CFSTR("ISOLANGUAGECODE_UNKNOWN");
    else
      v7 = off_1E562DCD8[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("languageCode"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWLanguageConfidence dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWLanguageConfidence)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWLanguageConfidence *v5;
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
    self = -[FLOWSchemaFLOWLanguageConfidence initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWLanguageConfidence)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWLanguageConfidence *v5;
  void *v6;
  void *v7;
  FLOWSchemaFLOWLanguageConfidence *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLOWSchemaFLOWLanguageConfidence;
  v5 = -[FLOWSchemaFLOWLanguageConfidence init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWLanguageConfidence setLanguageCode:](v5, "setLanguageCode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidenceScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWLanguageConfidence setConfidenceScore:](v5, "setConfidenceScore:", objc_msgSend(v7, "unsignedLongLongValue"));
    v8 = v5;

  }
  return v5;
}

- (int)languageCode
{
  return self->_languageCode;
}

- (unint64_t)confidenceScore
{
  return self->_confidenceScore;
}

@end
