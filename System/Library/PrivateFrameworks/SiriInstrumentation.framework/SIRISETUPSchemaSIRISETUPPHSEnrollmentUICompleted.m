@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted

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
  v9.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted locale](self, "locale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted deleteLocale](self, "deleteLocale");
  return v5;
}

- (void)setEnrollmentMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enrollmentMode = a3;
}

- (BOOL)hasEnrollmentMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEnrollmentMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEnrollmentMode
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setEnrollmentMode:](self, "setEnrollmentMode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteLocale
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setLocale:](self, "setLocale:", 0);
}

- (void)setEnrollmentOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_enrollmentOutcome = a3;
}

- (BOOL)hasEnrollmentOutcome
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEnrollmentOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEnrollmentOutcome
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setEnrollmentOutcome:](self, "setEnrollmentOutcome:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPageNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_pageNumber = a3;
}

- (BOOL)hasPageNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPageNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePageNumber
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setPageNumber:](self, "setPageNumber:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompletedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int enrollmentMode;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  $94DF0BD37169BFE72FA37FC8BB2DCBE1 has;
  int v15;
  unsigned int v16;
  int enrollmentOutcome;
  int v18;
  unsigned int pageNumber;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    enrollmentMode = self->_enrollmentMode;
    if (enrollmentMode != objc_msgSend(v4, "enrollmentMode"))
      goto LABEL_19;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_19;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted locale](self, "locale");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v15 = (*(unsigned int *)&has >> 1) & 1;
  v16 = v4[32];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_19:
    v20 = 0;
    goto LABEL_20;
  }
  if (v15)
  {
    enrollmentOutcome = self->_enrollmentOutcome;
    if (enrollmentOutcome == objc_msgSend(v4, "enrollmentOutcome"))
    {
      has = self->_has;
      v16 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v16 >> 2) & 1))
    goto LABEL_19;
  if (v18)
  {
    pageNumber = self->_pageNumber;
    if (pageNumber != objc_msgSend(v4, "pageNumber"))
      goto LABEL_19;
  }
  v20 = 1;
LABEL_20:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_enrollmentMode;
  else
    v3 = 0;
  v4 = -[SISchemaISOLocale hash](self->_locale, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_enrollmentOutcome;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_pageNumber;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted enrollmentMode](self, "enrollmentMode") - 1;
    if (v5 > 6)
      v6 = CFSTR("SIRISETUPENROLLMENTUIMODE_UNKNOWN");
    else
      v6 = off_1E563D7B8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("enrollmentMode"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted enrollmentOutcome](self, "enrollmentOutcome") - 1;
    if (v7 > 2)
      v8 = CFSTR("SIRISETUPENROLLMENTUISESSIONOUTCOME_UNKNOWN");
    else
      v8 = off_1E563D7F0[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("enrollmentOutcome"));
  }
  if (self->_locale)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted locale](self, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("locale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("locale"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted pageNumber](self, "pageNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("pageNumber"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)initWithJSON:(id)a3
{
  void *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *v5;
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
    self = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)initWithDictionary:(id)a3
{
  id v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *v5;
  void *v6;
  void *v7;
  SISchemaISOLocale *v8;
  void *v9;
  void *v10;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted;
  v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setEnrollmentMode:](v5, "setEnrollmentMode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v7);
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setLocale:](v5, "setLocale:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentOutcome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setEnrollmentOutcome:](v5, "setEnrollmentOutcome:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setPageNumber:](v5, "setPageNumber:", objc_msgSend(v10, "unsignedIntValue"));
    v11 = v5;

  }
  return v5;
}

- (int)enrollmentMode
{
  return self->_enrollmentMode;
}

- (SISchemaISOLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (int)enrollmentOutcome
{
  return self->_enrollmentOutcome;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (void)setHasLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
