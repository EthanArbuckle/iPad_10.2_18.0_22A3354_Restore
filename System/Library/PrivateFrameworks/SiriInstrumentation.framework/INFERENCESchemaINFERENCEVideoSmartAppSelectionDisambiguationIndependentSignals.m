@implementation INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals

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
  v9.super_class = (Class)INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialTreatmentId](self, "trialTreatmentId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals deleteTrialTreatmentId](self, "deleteTrialTreatmentId");
  return v5;
}

- (void)setDisambiguationAppsOrder:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_disambiguationAppsOrder = a3;
}

- (BOOL)hasDisambiguationAppsOrder
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDisambiguationAppsOrder:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDisambiguationAppsOrder
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setDisambiguationAppsOrder:](self, "setDisambiguationAppsOrder:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDisambiguationReasons:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_disambiguationReasons = a3;
}

- (BOOL)hasDisambiguationReasons
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDisambiguationReasons:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDisambiguationReasons
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setDisambiguationReasons:](self, "setDisambiguationReasons:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setModelVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_modelVersion = a3;
}

- (BOOL)hasModelVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasModelVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteModelVersion
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setModelVersion:](self, "setModelVersion:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNumDisambiguationApps:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numDisambiguationApps = a3;
}

- (BOOL)hasNumDisambiguationApps
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNumDisambiguationApps:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumDisambiguationApps
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setNumDisambiguationApps:](self, "setNumDisambiguationApps:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setTrialDeploymentId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_trialDeploymentId = a3;
}

- (BOOL)hasTrialDeploymentId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasTrialDeploymentId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteTrialDeploymentId
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setTrialDeploymentId:](self, "setTrialDeploymentId:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (void)deleteTrialTreatmentId
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setTrialTreatmentId:](self, "setTrialTreatmentId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteInt64Field();
LABEL_7:
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialTreatmentId](self, "trialTreatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialTreatmentId](self, "trialTreatmentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $3816F60C6D45B941EFFABFC1855A65ED has;
  unsigned int v6;
  int disambiguationAppsOrder;
  int v8;
  int disambiguationReasons;
  int v10;
  int64_t modelVersion;
  int v12;
  int numDisambiguationApps;
  int v14;
  int64_t trialDeploymentId;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    disambiguationAppsOrder = self->_disambiguationAppsOrder;
    if (disambiguationAppsOrder != objc_msgSend(v4, "disambiguationAppsOrder"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[48];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      disambiguationReasons = self->_disambiguationReasons;
      if (disambiguationReasons != objc_msgSend(v4, "disambiguationReasons"))
        goto LABEL_26;
      has = self->_has;
      v6 = v4[48];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        modelVersion = self->_modelVersion;
        if (modelVersion != objc_msgSend(v4, "modelVersion"))
          goto LABEL_26;
        has = self->_has;
        v6 = v4[48];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          numDisambiguationApps = self->_numDisambiguationApps;
          if (numDisambiguationApps != objc_msgSend(v4, "numDisambiguationApps"))
            goto LABEL_26;
          has = self->_has;
          v6 = v4[48];
        }
        v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (!v14
            || (trialDeploymentId = self->_trialDeploymentId, trialDeploymentId == objc_msgSend(v4, "trialDeploymentId")))
          {
            -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialTreatmentId](self, "trialTreatmentId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "trialTreatmentId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if ((v16 == 0) != (v17 != 0))
            {
              -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialTreatmentId](self, "trialTreatmentId");
              v19 = objc_claimAutoreleasedReturnValue();
              if (!v19)
              {

LABEL_29:
                v24 = 1;
                goto LABEL_27;
              }
              v20 = (void *)v19;
              -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialTreatmentId](self, "trialTreatmentId");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "trialTreatmentId");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "isEqual:", v22);

              if ((v23 & 1) != 0)
                goto LABEL_29;
            }
            else
            {

            }
          }
        }
      }
    }
  }
LABEL_26:
  v24 = 0;
LABEL_27:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_disambiguationAppsOrder;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_disambiguationReasons;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
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
    v4 = 2654435761 * self->_modelVersion;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_trialTreatmentId, "hash");
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_numDisambiguationApps;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_trialDeploymentId;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_trialTreatmentId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals disambiguationAppsOrder](self, "disambiguationAppsOrder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("disambiguationAppsOrder"));

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals disambiguationReasons](self, "disambiguationReasons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("disambiguationReasons"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals modelVersion](self, "modelVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("modelVersion"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals numDisambiguationApps](self, "numDisambiguationApps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numDisambiguationApps"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialDeploymentId](self, "trialDeploymentId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("trialDeploymentId"));

  }
LABEL_7:
  if (self->_trialTreatmentId)
  {
    -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialTreatmentId](self, "trialTreatmentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("trialTreatmentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("trialTreatmentId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SISchemaUUID *v12;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals;
  v5 = -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationAppsOrder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setDisambiguationAppsOrder:](v5, "setDisambiguationAppsOrder:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationReasons"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setDisambiguationReasons:](v5, "setDisambiguationReasons:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setModelVersion:](v5, "setModelVersion:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDisambiguationApps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setNumDisambiguationApps:](v5, "setNumDisambiguationApps:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialDeploymentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setTrialDeploymentId:](v5, "setTrialDeploymentId:", objc_msgSend(v10, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialTreatmentId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setTrialTreatmentId:](v5, "setTrialTreatmentId:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (int)disambiguationAppsOrder
{
  return self->_disambiguationAppsOrder;
}

- (int)disambiguationReasons
{
  return self->_disambiguationReasons;
}

- (int64_t)modelVersion
{
  return self->_modelVersion;
}

- (int)numDisambiguationApps
{
  return self->_numDisambiguationApps;
}

- (int64_t)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (SISchemaUUID)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentId, a3);
}

- (void)setHasTrialTreatmentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
}

@end
