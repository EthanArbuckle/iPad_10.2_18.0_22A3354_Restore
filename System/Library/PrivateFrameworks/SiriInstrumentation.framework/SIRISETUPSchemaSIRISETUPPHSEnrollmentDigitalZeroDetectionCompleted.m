@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setPageNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pageNumber = a3;
}

- (BOOL)hasPageNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPageNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePageNumber
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setPageNumber:](self, "setPageNumber:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasPhraseId
{
  return self->_phraseId != 0;
}

- (void)deletePhraseId
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setPhraseId:](self, "setPhraseId:", 0);
}

- (void)setMaxNumContinuousZeros:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maxNumContinuousZeros = a3;
}

- (BOOL)hasMaxNumContinuousZeros
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMaxNumContinuousZeros:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMaxNumContinuousZeros
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setMaxNumContinuousZeros:](self, "setMaxNumContinuousZeros:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMaxNumAllowedContinuousZeros:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_maxNumAllowedContinuousZeros = a3;
}

- (BOOL)hasMaxNumAllowedContinuousZeros
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMaxNumAllowedContinuousZeros:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMaxNumAllowedContinuousZeros
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setMaxNumAllowedContinuousZeros:](self, "setMaxNumAllowedContinuousZeros:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsMaxNumContinuousZerosOverThreshold:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isMaxNumContinuousZerosOverThreshold = a3;
}

- (BOOL)hasIsMaxNumContinuousZerosOverThreshold
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsMaxNumContinuousZerosOverThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsMaxNumContinuousZerosOverThreshold
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setIsMaxNumContinuousZerosOverThreshold:](self, "setIsMaxNumContinuousZerosOverThreshold:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasVtAssetConfigVersion
{
  return self->_vtAssetConfigVersion != 0;
}

- (void)deleteVtAssetConfigVersion
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setVtAssetConfigVersion:](self, "setVtAssetConfigVersion:", 0);
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteLocale
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setLocale:](self, "setLocale:", 0);
}

- (void)setStageStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_stageStatus = a3;
}

- (BOOL)hasStageStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasStageStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteStageStatus
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setStageStatus:](self, "setStageStatus:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompletedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted phraseId](self, "phraseId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted vtAssetConfigVersion](self, "vtAssetConfigVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int pageNumber;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $057181A5B918859FBE6917C2319BC98B has;
  int v14;
  unsigned int v15;
  unsigned int maxNumContinuousZeros;
  int v17;
  unsigned int maxNumAllowedContinuousZeros;
  int v19;
  int isMaxNumContinuousZerosOverThreshold;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  BOOL v31;
  int v33;
  int stageStatus;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != (v4[60] & 1))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    pageNumber = self->_pageNumber;
    if (pageNumber != objc_msgSend(v4, "pageNumber"))
      goto LABEL_31;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted phraseId](self, "phraseId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phraseId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted phraseId](self, "phraseId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted phraseId](self, "phraseId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phraseId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_31;
  }
  else
  {

  }
  has = self->_has;
  v14 = (*(unsigned int *)&has >> 1) & 1;
  v15 = v4[60];
  if (v14 != ((v15 >> 1) & 1))
    goto LABEL_31;
  if (v14)
  {
    maxNumContinuousZeros = self->_maxNumContinuousZeros;
    if (maxNumContinuousZeros != objc_msgSend(v4, "maxNumContinuousZeros"))
      goto LABEL_31;
    has = self->_has;
    v15 = v4[60];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1))
    goto LABEL_31;
  if (v17)
  {
    maxNumAllowedContinuousZeros = self->_maxNumAllowedContinuousZeros;
    if (maxNumAllowedContinuousZeros != objc_msgSend(v4, "maxNumAllowedContinuousZeros"))
      goto LABEL_31;
    has = self->_has;
    v15 = v4[60];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v15 >> 3) & 1))
    goto LABEL_31;
  if (v19)
  {
    isMaxNumContinuousZerosOverThreshold = self->_isMaxNumContinuousZerosOverThreshold;
    if (isMaxNumContinuousZerosOverThreshold != objc_msgSend(v4, "isMaxNumContinuousZerosOverThreshold"))
      goto LABEL_31;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted vtAssetConfigVersion](self, "vtAssetConfigVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vtAssetConfigVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted vtAssetConfigVersion](self, "vtAssetConfigVersion");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted vtAssetConfigVersion](self, "vtAssetConfigVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vtAssetConfigVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_31;
  }
  else
  {

  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted locale](self, "locale");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted locale](self, "locale");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_31;
  }
  else
  {

  }
  v33 = (*(_BYTE *)&self->_has >> 4) & 1;
  if (v33 == ((v4[60] >> 4) & 1))
  {
    if (!v33 || (stageStatus = self->_stageStatus, stageStatus == objc_msgSend(v4, "stageStatus")))
    {
      v31 = 1;
      goto LABEL_32;
    }
  }
LABEL_31:
  v31 = 0;
LABEL_32:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_pageNumber;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_phraseId, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v5 = 2654435761 * self->_maxNumContinuousZeros;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_maxNumAllowedContinuousZeros;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_isMaxNumContinuousZerosOverThreshold;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
LABEL_11:
  v8 = -[NSString hash](self->_vtAssetConfigVersion, "hash");
  v9 = -[NSString hash](self->_locale, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v10 = 2654435761 * self->_stageStatus;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
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
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted isMaxNumContinuousZerosOverThreshold](self, "isMaxNumContinuousZerosOverThreshold"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isMaxNumContinuousZerosOverThreshold"));

  }
  if (self->_locale)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("locale"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted maxNumAllowedContinuousZeros](self, "maxNumAllowedContinuousZeros"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("maxNumAllowedContinuousZeros"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted maxNumContinuousZeros](self, "maxNumContinuousZeros"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("maxNumContinuousZeros"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted pageNumber](self, "pageNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pageNumber"));

  }
LABEL_9:
  if (self->_phraseId)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted phraseId](self, "phraseId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("phraseId"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v11 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted stageStatus](self, "stageStatus") - 1;
    if (v11 > 7)
      v12 = CFSTR("SIRISETUPTRAININGMANAGERSTAGESTATUS_UNKNOWN");
    else
      v12 = off_1E5638B88[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("stageStatus"));
  }
  if (self->_vtAssetConfigVersion)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted vtAssetConfigVersion](self, "vtAssetConfigVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("vtAssetConfigVersion"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)initWithJSON:(id)a3
{
  void *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *v5;
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
    self = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)initWithDictionary:(id)a3
{
  id v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *v5;
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
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *v17;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted;
  v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setPageNumber:](v5, "setPageNumber:", objc_msgSend(v6, "unsignedIntValue"));
    v19 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phraseId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setPhraseId:](v5, "setPhraseId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumContinuousZeros"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setMaxNumContinuousZeros:](v5, "setMaxNumContinuousZeros:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumAllowedContinuousZeros"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setMaxNumAllowedContinuousZeros:](v5, "setMaxNumAllowedContinuousZeros:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMaxNumContinuousZerosOverThreshold"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setIsMaxNumContinuousZerosOverThreshold:](v5, "setIsMaxNumContinuousZerosOverThreshold:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vtAssetConfigVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setVtAssetConfigVersion:](v5, "setVtAssetConfigVersion:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setLocale:](v5, "setLocale:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stageStatus"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setStageStatus:](v5, "setStageStatus:", objc_msgSend(v16, "intValue"));
    v17 = v5;

  }
  return v5;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (NSString)phraseId
{
  return self->_phraseId;
}

- (void)setPhraseId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)maxNumContinuousZeros
{
  return self->_maxNumContinuousZeros;
}

- (unsigned)maxNumAllowedContinuousZeros
{
  return self->_maxNumAllowedContinuousZeros;
}

- (BOOL)isMaxNumContinuousZerosOverThreshold
{
  return self->_isMaxNumContinuousZerosOverThreshold;
}

- (NSString)vtAssetConfigVersion
{
  return self->_vtAssetConfigVersion;
}

- (void)setVtAssetConfigVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)stageStatus
{
  return self->_stageStatus;
}

- (void)setHasPhraseId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasVtAssetConfigVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_vtAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_phraseId, 0);
}

@end
