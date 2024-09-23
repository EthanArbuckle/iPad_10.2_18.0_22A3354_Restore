@implementation MHSchemaMHOdldFalseTriggerMitigated

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHOdldFalseTriggerMitigated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHOdldFalseTriggerMitigated anchorRequestId](self, "anchorRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MHSchemaMHOdldFalseTriggerMitigated deleteAnchorRequestId](self, "deleteAnchorRequestId");
  -[MHSchemaMHOdldFalseTriggerMitigated previousRequestId](self, "previousRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MHSchemaMHOdldFalseTriggerMitigated deletePreviousRequestId](self, "deletePreviousRequestId");

  return v5;
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[MHSchemaMHOdldFalseTriggerMitigated setModelVersion:](self, "setModelVersion:", 0);
}

- (void)setOdldScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_odldScore = a3;
}

- (BOOL)hasOdldScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOdldScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteOdldScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHOdldFalseTriggerMitigated setOdldScore:](self, "setOdldScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setOdldScoreThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_odldScoreThreshold = a3;
}

- (BOOL)hasOdldScoreThreshold
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasOdldScoreThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteOdldScoreThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHOdldFalseTriggerMitigated setOdldScoreThreshold:](self, "setOdldScoreThreshold:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteErrorMessage
{
  -[MHSchemaMHOdldFalseTriggerMitigated setErrorMessage:](self, "setErrorMessage:", 0);
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteErrorCode
{
  -[MHSchemaMHOdldFalseTriggerMitigated setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasAnchorRequestId
{
  return self->_anchorRequestId != 0;
}

- (void)deleteAnchorRequestId
{
  -[MHSchemaMHOdldFalseTriggerMitigated setAnchorRequestId:](self, "setAnchorRequestId:", 0);
}

- (BOOL)hasPreviousRequestId
{
  return self->_previousRequestId != 0;
}

- (void)deletePreviousRequestId
{
  -[MHSchemaMHOdldFalseTriggerMitigated setPreviousRequestId:](self, "setPreviousRequestId:", 0);
}

- (void)setAnchorSocialScore:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_anchorSocialScore = a3;
}

- (BOOL)hasAnchorSocialScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAnchorSocialScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAnchorSocialScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHOdldFalseTriggerMitigated setAnchorSocialScore:](self, "setAnchorSocialScore:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setSocialScore:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_socialScore = a3;
}

- (BOOL)hasSocialScore
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasSocialScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteSocialScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHOdldFalseTriggerMitigated setSocialScore:](self, "setSocialScore:", v2);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHOdldFalseTriggerMitigatedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  -[MHSchemaMHOdldFalseTriggerMitigated modelVersion](self, "modelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();
  -[MHSchemaMHOdldFalseTriggerMitigated errorMessage](self, "errorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  -[MHSchemaMHOdldFalseTriggerMitigated anchorRequestId](self, "anchorRequestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MHSchemaMHOdldFalseTriggerMitigated anchorRequestId](self, "anchorRequestId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHOdldFalseTriggerMitigated previousRequestId](self, "previousRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MHSchemaMHOdldFalseTriggerMitigated previousRequestId](self, "previousRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    v11 = (char)self->_has;
  }
  v12 = v13;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    v12 = v13;
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
  $9D793095168BCD38F487A55CA31C8252 has;
  unsigned int v13;
  float odldScore;
  float v15;
  int v16;
  float odldScoreThreshold;
  float v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  unsigned int errorCode;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  $9D793095168BCD38F487A55CA31C8252 v38;
  int v39;
  unsigned int v40;
  float anchorSocialScore;
  float v42;
  int v43;
  float socialScore;
  float v45;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[MHSchemaMHOdldFalseTriggerMitigated modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[MHSchemaMHOdldFalseTriggerMitigated modelVersion](self, "modelVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHOdldFalseTriggerMitigated modelVersion](self, "modelVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_32;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    odldScore = self->_odldScore;
    objc_msgSend(v4, "odldScore");
    if (odldScore != v15)
      goto LABEL_32;
    has = self->_has;
    v13 = v4[64];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1))
    goto LABEL_32;
  if (v16)
  {
    odldScoreThreshold = self->_odldScoreThreshold;
    objc_msgSend(v4, "odldScoreThreshold");
    if (odldScoreThreshold != v18)
      goto LABEL_32;
  }
  -[MHSchemaMHOdldFalseTriggerMitigated errorMessage](self, "errorMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[MHSchemaMHOdldFalseTriggerMitigated errorMessage](self, "errorMessage");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[MHSchemaMHOdldFalseTriggerMitigated errorMessage](self, "errorMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_32;
  }
  else
  {

  }
  v24 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v24 != ((v4[64] >> 2) & 1))
    goto LABEL_32;
  if (v24)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_32;
  }
  -[MHSchemaMHOdldFalseTriggerMitigated anchorRequestId](self, "anchorRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchorRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[MHSchemaMHOdldFalseTriggerMitigated anchorRequestId](self, "anchorRequestId");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[MHSchemaMHOdldFalseTriggerMitigated anchorRequestId](self, "anchorRequestId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anchorRequestId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_32;
  }
  else
  {

  }
  -[MHSchemaMHOdldFalseTriggerMitigated previousRequestId](self, "previousRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[MHSchemaMHOdldFalseTriggerMitigated previousRequestId](self, "previousRequestId");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[MHSchemaMHOdldFalseTriggerMitigated previousRequestId](self, "previousRequestId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousRequestId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_32;
  }
  else
  {

  }
  v38 = self->_has;
  v39 = (*(unsigned int *)&v38 >> 3) & 1;
  v40 = v4[64];
  if (v39 == ((v40 >> 3) & 1))
  {
    if (v39)
    {
      anchorSocialScore = self->_anchorSocialScore;
      objc_msgSend(v4, "anchorSocialScore");
      if (anchorSocialScore != v42)
        goto LABEL_32;
      v38 = self->_has;
      v40 = v4[64];
    }
    v43 = (*(unsigned int *)&v38 >> 4) & 1;
    if (v43 == ((v40 >> 4) & 1))
    {
      if (!v43 || (socialScore = self->_socialScore, objc_msgSend(v4, "socialScore"), socialScore == v45))
      {
        v36 = 1;
        goto LABEL_33;
      }
    }
  }
LABEL_32:
  v36 = 0;
LABEL_33:

  return v36;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float odldScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float odldScoreThreshold;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  float anchorSocialScore;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  float socialScore;
  double v26;
  long double v27;
  double v28;
  NSUInteger v30;

  v30 = -[NSString hash](self->_modelVersion, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    odldScore = self->_odldScore;
    v6 = odldScore;
    if (odldScore < 0.0)
      v6 = -odldScore;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    odldScoreThreshold = self->_odldScoreThreshold;
    v11 = odldScoreThreshold;
    if (odldScoreThreshold < 0.0)
      v11 = -odldScoreThreshold;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[NSString hash](self->_errorMessage, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_errorCode;
  else
    v15 = 0;
  v16 = -[SISchemaUUID hash](self->_anchorRequestId, "hash");
  v17 = -[SISchemaUUID hash](self->_previousRequestId, "hash");
  v18 = (char)self->_has;
  if ((v18 & 8) != 0)
  {
    anchorSocialScore = self->_anchorSocialScore;
    v21 = anchorSocialScore;
    if (anchorSocialScore < 0.0)
      v21 = -anchorSocialScore;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((v18 & 0x10) != 0)
  {
    socialScore = self->_socialScore;
    v26 = socialScore;
    if (socialScore < 0.0)
      v26 = -socialScore;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  return v4 ^ v30 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v19 ^ v24;
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
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_anchorRequestId)
  {
    -[MHSchemaMHOdldFalseTriggerMitigated anchorRequestId](self, "anchorRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anchorRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("anchorRequestId"));

    }
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHOdldFalseTriggerMitigated anchorSocialScore](self, "anchorSocialScore");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("anchorSocialScore"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHOdldFalseTriggerMitigated errorCode](self, "errorCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("errorCode"));

  }
  if (self->_errorMessage)
  {
    -[MHSchemaMHOdldFalseTriggerMitigated errorMessage](self, "errorMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("errorMessage"));

  }
  if (self->_modelVersion)
  {
    -[MHSchemaMHOdldFalseTriggerMitigated modelVersion](self, "modelVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("modelVersion"));

  }
  v15 = (char)self->_has;
  if ((v15 & 1) != 0)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHOdldFalseTriggerMitigated odldScore](self, "odldScore");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("odldScore"));

    v15 = (char)self->_has;
  }
  if ((v15 & 2) != 0)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHOdldFalseTriggerMitigated odldScoreThreshold](self, "odldScoreThreshold");
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("odldScoreThreshold"));

  }
  if (self->_previousRequestId)
  {
    -[MHSchemaMHOdldFalseTriggerMitigated previousRequestId](self, "previousRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("previousRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("previousRequestId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHOdldFalseTriggerMitigated socialScore](self, "socialScore");
    objc_msgSend(v23, "numberWithFloat:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("socialScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHOdldFalseTriggerMitigated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHOdldFalseTriggerMitigated)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHOdldFalseTriggerMitigated *v5;
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
    self = -[MHSchemaMHOdldFalseTriggerMitigated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHOdldFalseTriggerMitigated)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHOdldFalseTriggerMitigated *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SISchemaUUID *v14;
  void *v15;
  SISchemaUUID *v16;
  void *v17;
  void *v18;
  MHSchemaMHOdldFalseTriggerMitigated *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MHSchemaMHOdldFalseTriggerMitigated;
  v5 = -[MHSchemaMHOdldFalseTriggerMitigated init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHOdldFalseTriggerMitigated setModelVersion:](v5, "setModelVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("odldScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[MHSchemaMHOdldFalseTriggerMitigated setOdldScore:](v5, "setOdldScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("odldScoreThreshold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[MHSchemaMHOdldFalseTriggerMitigated setOdldScoreThreshold:](v5, "setOdldScoreThreshold:");
    }
    v22 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorMessage"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[MHSchemaMHOdldFalseTriggerMitigated setErrorMessage:](v5, "setErrorMessage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHOdldFalseTriggerMitigated setErrorCode:](v5, "setErrorCode:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anchorRequestId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v13);
      -[MHSchemaMHOdldFalseTriggerMitigated setAnchorRequestId:](v5, "setAnchorRequestId:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousRequestId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v15);
      -[MHSchemaMHOdldFalseTriggerMitigated setPreviousRequestId:](v5, "setPreviousRequestId:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anchorSocialScore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "floatValue");
      -[MHSchemaMHOdldFalseTriggerMitigated setAnchorSocialScore:](v5, "setAnchorSocialScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("socialScore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "floatValue");
      -[MHSchemaMHOdldFalseTriggerMitigated setSocialScore:](v5, "setSocialScore:");
    }
    v19 = v5;

  }
  return v5;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)odldScore
{
  return self->_odldScore;
}

- (float)odldScoreThreshold
{
  return self->_odldScoreThreshold;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (SISchemaUUID)anchorRequestId
{
  return self->_anchorRequestId;
}

- (void)setAnchorRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_anchorRequestId, a3);
}

- (SISchemaUUID)previousRequestId
{
  return self->_previousRequestId;
}

- (void)setPreviousRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_previousRequestId, a3);
}

- (float)anchorSocialScore
{
  return self->_anchorSocialScore;
}

- (float)socialScore
{
  return self->_socialScore;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAnchorRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasPreviousRequestId:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRequestId, 0);
  objc_storeStrong((id *)&self->_anchorRequestId, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end
