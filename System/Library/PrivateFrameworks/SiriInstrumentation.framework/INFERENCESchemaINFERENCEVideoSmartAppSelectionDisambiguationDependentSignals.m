@implementation INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsDisambiguatedApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isDisambiguatedApp = a3;
}

- (BOOL)hasIsDisambiguatedApp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsDisambiguatedApp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsDisambiguatedApp
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setIsDisambiguatedApp:](self, "setIsDisambiguatedApp:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setModelAppConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_modelAppConfidence = a3;
}

- (BOOL)hasModelAppConfidence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasModelAppConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteModelAppConfidence
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setModelAppConfidence:](self, "setModelAppConfidence:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setDisambiguationAppOrdinal:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_disambiguationAppOrdinal = a3;
}

- (BOOL)hasDisambiguationAppOrdinal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasDisambiguationAppOrdinal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteDisambiguationAppOrdinal
{
  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setDisambiguationAppOrdinal:](self, "setDisambiguationAppOrdinal:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignalsReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $9D9EFB1136A05CC2DAFC4A107E1E7449 has;
  unsigned int v6;
  int isDisambiguatedApp;
  int v8;
  int modelAppConfidence;
  int v10;
  int disambiguationAppOrdinal;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isDisambiguatedApp = self->_isDisambiguatedApp;
    if (isDisambiguatedApp != objc_msgSend(v4, "isDisambiguatedApp"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    modelAppConfidence = self->_modelAppConfidence;
    if (modelAppConfidence == objc_msgSend(v4, "modelAppConfidence"))
    {
      has = self->_has;
      v6 = v4[20];
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
    disambiguationAppOrdinal = self->_disambiguationAppOrdinal;
    if (disambiguationAppOrdinal != objc_msgSend(v4, "disambiguationAppOrdinal"))
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
  v2 = 2654435761 * self->_isDisambiguatedApp;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_modelAppConfidence;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_disambiguationAppOrdinal;
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
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals isDisambiguatedApp](self, "isDisambiguatedApp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isDisambiguatedApp"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals disambiguationAppOrdinal](self, "disambiguationAppOrdinal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("disambiguationAppOrdinal"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals modelAppConfidence](self, "modelAppConfidence"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("modelAppConfidence"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals;
  v5 = -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDisambiguatedApp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setIsDisambiguatedApp:](v5, "setIsDisambiguatedApp:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelAppConfidence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setModelAppConfidence:](v5, "setModelAppConfidence:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationAppOrdinal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setDisambiguationAppOrdinal:](v5, "setDisambiguationAppOrdinal:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)isDisambiguatedApp
{
  return self->_isDisambiguatedApp;
}

- (int)modelAppConfidence
{
  return self->_modelAppConfidence;
}

- (int)disambiguationAppOrdinal
{
  return self->_disambiguationAppOrdinal;
}

@end
