@implementation ASRSchemaASRStarted

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
  v9.super_class = (Class)ASRSchemaASRStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRStarted dictationUiInteractionId](self, "dictationUiInteractionId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ASRSchemaASRStarted deleteDictationUiInteractionId](self, "deleteDictationUiInteractionId");
  return v5;
}

- (void)setTask:(int)a3
{
  *(&self->_isEmptyTextField + 1) |= 1u;
  self->_task = a3;
}

- (BOOL)hasTask
{
  return *(&self->_isEmptyTextField + 1);
}

- (void)setHasTask:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xFE | a3;
}

- (void)deleteTask
{
  -[ASRSchemaASRStarted setTask:](self, "setTask:", 0);
  *(&self->_isEmptyTextField + 1) &= ~1u;
}

- (void)setModelLocale:(int)a3
{
  *(&self->_isEmptyTextField + 1) |= 2u;
  self->_modelLocale = a3;
}

- (BOOL)hasModelLocale
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 1) & 1;
}

- (void)setHasModelLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xFD | v3;
}

- (void)deleteModelLocale
{
  -[ASRSchemaASRStarted setModelLocale:](self, "setModelLocale:", 0);
  *(&self->_isEmptyTextField + 1) &= ~2u;
}

- (BOOL)hasDatapackVersion
{
  return self->_datapackVersion != 0;
}

- (void)deleteDatapackVersion
{
  -[ASRSchemaASRStarted setDatapackVersion:](self, "setDatapackVersion:", 0);
}

- (void)setIsHighQualityAsset:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) |= 4u;
  self->_isHighQualityAsset = a3;
}

- (BOOL)hasIsHighQualityAsset
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 2) & 1;
}

- (void)setHasIsHighQualityAsset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xFB | v3;
}

- (void)deleteIsHighQualityAsset
{
  -[ASRSchemaASRStarted setIsHighQualityAsset:](self, "setIsHighQualityAsset:", 0);
  *(&self->_isEmptyTextField + 1) &= ~4u;
}

- (BOOL)hasHammerVersion
{
  return self->_hammerVersion != 0;
}

- (void)deleteHammerVersion
{
  -[ASRSchemaASRStarted setHammerVersion:](self, "setHammerVersion:", 0);
}

- (BOOL)hasGeoLanguageModelRegion
{
  return self->_geoLanguageModelRegion != 0;
}

- (void)deleteGeoLanguageModelRegion
{
  -[ASRSchemaASRStarted setGeoLanguageModelRegion:](self, "setGeoLanguageModelRegion:", 0);
}

- (void)setGeoLanguageModelLoaded:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) |= 8u;
  self->_geoLanguageModelLoaded = a3;
}

- (BOOL)hasGeoLanguageModelLoaded
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 3) & 1;
}

- (void)setHasGeoLanguageModelLoaded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xF7 | v3;
}

- (void)deleteGeoLanguageModelLoaded
{
  -[ASRSchemaASRStarted setGeoLanguageModelLoaded:](self, "setGeoLanguageModelLoaded:", 0);
  *(&self->_isEmptyTextField + 1) &= ~8u;
}

- (void)setSpeechProfileAgeInNs:(unint64_t)a3
{
  *(&self->_isEmptyTextField + 1) |= 0x10u;
  self->_speechProfileAgeInNs = a3;
}

- (BOOL)hasSpeechProfileAgeInNs
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 4) & 1;
}

- (void)setHasSpeechProfileAgeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xEF | v3;
}

- (void)deleteSpeechProfileAgeInNs
{
  -[ASRSchemaASRStarted setSpeechProfileAgeInNs:](self, "setSpeechProfileAgeInNs:", 0);
  *(&self->_isEmptyTextField + 1) &= ~0x10u;
}

- (BOOL)hasDictationUiInteractionId
{
  return self->_dictationUiInteractionId != 0;
}

- (void)deleteDictationUiInteractionId
{
  -[ASRSchemaASRStarted setDictationUiInteractionId:](self, "setDictationUiInteractionId:", 0);
}

- (BOOL)hasPortraitExperimentVariantName
{
  return self->_portraitExperimentVariantName != 0;
}

- (void)deletePortraitExperimentVariantName
{
  -[ASRSchemaASRStarted setPortraitExperimentVariantName:](self, "setPortraitExperimentVariantName:", 0);
}

- (void)setStartState:(int)a3
{
  *(&self->_isEmptyTextField + 1) |= 0x20u;
  self->_startState = a3;
}

- (BOOL)hasStartState
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 5) & 1;
}

- (void)setHasStartState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xDF | v3;
}

- (void)deleteStartState
{
  -[ASRSchemaASRStarted setStartState:](self, "setStartState:", 0);
  *(&self->_isEmptyTextField + 1) &= ~0x20u;
}

- (void)setAtypicalSpeechEnabled:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) |= 0x40u;
  self->_atypicalSpeechEnabled = a3;
}

- (BOOL)hasAtypicalSpeechEnabled
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 6) & 1;
}

- (void)setHasAtypicalSpeechEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xBF | v3;
}

- (void)deleteAtypicalSpeechEnabled
{
  -[ASRSchemaASRStarted setAtypicalSpeechEnabled:](self, "setAtypicalSpeechEnabled:", 0);
  *(&self->_isEmptyTextField + 1) &= ~0x40u;
}

- (void)setIsEmptyTextField:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) |= 0x80u;
  self->_isEmptyTextField = a3;
}

- (BOOL)hasIsEmptyTextField
{
  return *((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 7;
}

- (void)setHasIsEmptyTextField:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(&self->_isEmptyTextField + 1) = v3 & 0x80 | *(&self->_isEmptyTextField + 1) & 0x7F;
}

- (void)deleteIsEmptyTextField
{
  -[ASRSchemaASRStarted setIsEmptyTextField:](self, "setIsEmptyTextField:", 0);
  *(&self->_isEmptyTextField + 1) &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  v4 = *(&self->_isEmptyTextField + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = *(&self->_isEmptyTextField + 1);
  }
  if ((v4 & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[ASRSchemaASRStarted datapackVersion](self, "datapackVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(&self->_isEmptyTextField + 1) & 4) != 0)
    PBDataWriterWriteBOOLField();
  -[ASRSchemaASRStarted hammerVersion](self, "hammerVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRStarted geoLanguageModelRegion](self, "geoLanguageModelRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v8 = *(&self->_isEmptyTextField + 1);
  if ((v8 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = *(&self->_isEmptyTextField + 1);
  }
  if ((v8 & 0x10) != 0)
    PBDataWriterWriteUint64Field();
  -[ASRSchemaASRStarted dictationUiInteractionId](self, "dictationUiInteractionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ASRSchemaASRStarted dictationUiInteractionId](self, "dictationUiInteractionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRStarted portraitExperimentVariantName](self, "portraitExperimentVariantName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  v12 = *(&self->_isEmptyTextField + 1);
  if ((v12 & 0x20) == 0)
  {
    if ((*(&self->_isEmptyTextField + 1) & 0x40) == 0)
      goto LABEL_23;
LABEL_26:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isEmptyTextField + 1) & 0x80) == 0)
      goto LABEL_24;
LABEL_27:
    PBDataWriterWriteBOOLField();
    goto LABEL_24;
  }
  PBDataWriterWriteInt32Field();
  v12 = *(&self->_isEmptyTextField + 1);
  if ((v12 & 0x40) != 0)
    goto LABEL_26;
LABEL_23:
  if (v12 < 0)
    goto LABEL_27;
LABEL_24:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int task;
  int v8;
  int modelLocale;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int isHighQualityAsset;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int geoLanguageModelLoaded;
  int v33;
  unint64_t speechProfileAgeInNs;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  BOOL v45;
  unsigned int v47;
  int v48;
  unsigned int v49;
  int startState;
  int v51;
  int atypicalSpeechEnabled;
  int isEmptyTextField;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  v5 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
  v6 = v4[86];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_44;
  if ((v5 & 1) != 0)
  {
    task = self->_task;
    if (task != objc_msgSend(v4, "task"))
      goto LABEL_44;
    v5 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
    v6 = v4[86];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_44;
  if (v8)
  {
    modelLocale = self->_modelLocale;
    if (modelLocale != objc_msgSend(v4, "modelLocale"))
      goto LABEL_44;
  }
  -[ASRSchemaASRStarted datapackVersion](self, "datapackVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datapackVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_43;
  -[ASRSchemaASRStarted datapackVersion](self, "datapackVersion");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRStarted datapackVersion](self, "datapackVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datapackVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_44;
  }
  else
  {

  }
  v17 = (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 2) & 1;
  if (v17 != ((v4[86] >> 2) & 1))
    goto LABEL_44;
  if (v17)
  {
    isHighQualityAsset = self->_isHighQualityAsset;
    if (isHighQualityAsset != objc_msgSend(v4, "isHighQualityAsset"))
      goto LABEL_44;
  }
  -[ASRSchemaASRStarted hammerVersion](self, "hammerVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hammerVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_43;
  -[ASRSchemaASRStarted hammerVersion](self, "hammerVersion");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[ASRSchemaASRStarted hammerVersion](self, "hammerVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hammerVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_44;
  }
  else
  {

  }
  -[ASRSchemaASRStarted geoLanguageModelRegion](self, "geoLanguageModelRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geoLanguageModelRegion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_43;
  -[ASRSchemaASRStarted geoLanguageModelRegion](self, "geoLanguageModelRegion");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[ASRSchemaASRStarted geoLanguageModelRegion](self, "geoLanguageModelRegion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geoLanguageModelRegion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_44;
  }
  else
  {

  }
  v29 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
  v30 = (v29 >> 3) & 1;
  v31 = v4[86];
  if (v30 != ((v31 >> 3) & 1))
    goto LABEL_44;
  if (v30)
  {
    geoLanguageModelLoaded = self->_geoLanguageModelLoaded;
    if (geoLanguageModelLoaded != objc_msgSend(v4, "geoLanguageModelLoaded"))
      goto LABEL_44;
    v29 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
    v31 = v4[86];
  }
  v33 = (v29 >> 4) & 1;
  if (v33 != ((v31 >> 4) & 1))
    goto LABEL_44;
  if (v33)
  {
    speechProfileAgeInNs = self->_speechProfileAgeInNs;
    if (speechProfileAgeInNs != objc_msgSend(v4, "speechProfileAgeInNs"))
      goto LABEL_44;
  }
  -[ASRSchemaASRStarted dictationUiInteractionId](self, "dictationUiInteractionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationUiInteractionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_43;
  -[ASRSchemaASRStarted dictationUiInteractionId](self, "dictationUiInteractionId");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    -[ASRSchemaASRStarted dictationUiInteractionId](self, "dictationUiInteractionId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationUiInteractionId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if (!v39)
      goto LABEL_44;
  }
  else
  {

  }
  -[ASRSchemaASRStarted portraitExperimentVariantName](self, "portraitExperimentVariantName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "portraitExperimentVariantName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  -[ASRSchemaASRStarted portraitExperimentVariantName](self, "portraitExperimentVariantName");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[ASRSchemaASRStarted portraitExperimentVariantName](self, "portraitExperimentVariantName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "portraitExperimentVariantName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "isEqual:", v43);

    if (!v44)
      goto LABEL_44;
  }
  else
  {

  }
  v47 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
  v48 = (v47 >> 5) & 1;
  v49 = v4[86];
  if (v48 == ((v49 >> 5) & 1))
  {
    if (v48)
    {
      startState = self->_startState;
      if (startState != objc_msgSend(v4, "startState"))
        goto LABEL_44;
      v47 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
      v49 = v4[86];
    }
    v51 = (v47 >> 6) & 1;
    if (v51 == ((v49 >> 6) & 1))
    {
      if (v51)
      {
        atypicalSpeechEnabled = self->_atypicalSpeechEnabled;
        if (atypicalSpeechEnabled != objc_msgSend(v4, "atypicalSpeechEnabled"))
          goto LABEL_44;
        v47 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
        v49 = v4[86];
      }
      if (((v49 ^ v47) & 0x80) == 0)
      {
        if ((v47 & 0x80) == 0
          || (isEmptyTextField = self->_isEmptyTextField,
              isEmptyTextField == objc_msgSend(v4, "isEmptyTextField")))
        {
          v45 = 1;
          goto LABEL_45;
        }
      }
    }
  }
LABEL_44:
  v45 = 0;
LABEL_45:

  return v45;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v17;

  if (*(&self->_isEmptyTextField + 1))
  {
    v3 = 2654435761 * self->_task;
    if ((*(&self->_isEmptyTextField + 1) & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(&self->_isEmptyTextField + 1) & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_modelLocale;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_datapackVersion, "hash");
  if ((*(&self->_isEmptyTextField + 1) & 4) != 0)
    v6 = 2654435761 * self->_isHighQualityAsset;
  else
    v6 = 0;
  v17 = -[NSString hash](self->_hammerVersion, "hash");
  v7 = -[NSString hash](self->_geoLanguageModelRegion, "hash");
  if ((*(&self->_isEmptyTextField + 1) & 8) != 0)
    v8 = 2654435761 * self->_geoLanguageModelLoaded;
  else
    v8 = 0;
  v9 = v7;
  if ((*(&self->_isEmptyTextField + 1) & 0x10) != 0)
    v10 = 2654435761u * self->_speechProfileAgeInNs;
  else
    v10 = 0;
  v11 = -[SISchemaUUID hash](self->_dictationUiInteractionId, "hash");
  v12 = -[NSString hash](self->_portraitExperimentVariantName, "hash");
  if ((*(&self->_isEmptyTextField + 1) & 0x20) != 0)
    v13 = 2654435761 * self->_startState;
  else
    v13 = 0;
  if ((*(&self->_isEmptyTextField + 1) & 0x40) != 0)
  {
    v14 = 2654435761 * self->_atypicalSpeechEnabled;
    if (*(&self->_isEmptyTextField + 1) < 0)
      goto LABEL_20;
LABEL_22:
    v15 = 0;
    return v4 ^ v3 ^ v6 ^ v5 ^ v17 ^ v9 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
  v14 = 0;
  if ((*(&self->_isEmptyTextField + 1) & 0x80) == 0)
    goto LABEL_22;
LABEL_20:
  v15 = 2654435761 * self->_isEmptyTextField;
  return v4 ^ v3 ^ v6 ^ v5 ^ v17 ^ v9 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  unsigned int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  unsigned int v24;
  const __CFString *v25;
  unsigned int v26;
  const __CFString *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(&self->_isEmptyTextField + 1) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRStarted atypicalSpeechEnabled](self, "atypicalSpeechEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("atypicalSpeechEnabled"));

  }
  if (self->_datapackVersion)
  {
    -[ASRSchemaASRStarted datapackVersion](self, "datapackVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("datapackVersion"));

  }
  if (self->_dictationUiInteractionId)
  {
    -[ASRSchemaASRStarted dictationUiInteractionId](self, "dictationUiInteractionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dictationUiInteractionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dictationUiInteractionId"));

    }
  }
  if ((*(&self->_isEmptyTextField + 1) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRStarted geoLanguageModelLoaded](self, "geoLanguageModelLoaded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("geoLanguageModelLoaded"));

  }
  if (self->_geoLanguageModelRegion)
  {
    -[ASRSchemaASRStarted geoLanguageModelRegion](self, "geoLanguageModelRegion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("geoLanguageModelRegion"));

  }
  if (self->_hammerVersion)
  {
    -[ASRSchemaASRStarted hammerVersion](self, "hammerVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hammerVersion"));

  }
  v15 = *((char *)&self->_isEmptyTextField + 1);
  if ((v15 & 0x80000000) == 0)
  {
    if ((v15 & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRStarted isEmptyTextField](self, "isEmptyTextField"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isEmptyTextField"));

  LOBYTE(v15) = *(&self->_isEmptyTextField + 1);
  if ((v15 & 4) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRStarted isHighQualityAsset](self, "isHighQualityAsset"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isHighQualityAsset"));

    LOBYTE(v15) = *(&self->_isEmptyTextField + 1);
  }
LABEL_19:
  if ((v15 & 2) != 0)
  {
    v17 = -[ASRSchemaASRStarted modelLocale](self, "modelLocale") - 1;
    if (v17 > 0x3D)
      v18 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v18 = off_1E562B680[v17];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("modelLocale"));
  }
  if (self->_portraitExperimentVariantName)
  {
    -[ASRSchemaASRStarted portraitExperimentVariantName](self, "portraitExperimentVariantName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("portraitExperimentVariantName"));

  }
  v22 = *(&self->_isEmptyTextField + 1);
  if ((v22 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRStarted speechProfileAgeInNs](self, "speechProfileAgeInNs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("speechProfileAgeInNs"));

    v22 = *(&self->_isEmptyTextField + 1);
    if ((v22 & 0x20) == 0)
    {
LABEL_30:
      if ((v22 & 1) == 0)
        goto LABEL_41;
      goto LABEL_37;
    }
  }
  else if ((*(&self->_isEmptyTextField + 1) & 0x20) == 0)
  {
    goto LABEL_30;
  }
  v24 = -[ASRSchemaASRStarted startState](self, "startState") - 1;
  if (v24 > 2)
    v25 = CFSTR("ASRSTARTSTATE_UNKNOWN");
  else
    v25 = off_1E562B870[v24];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("startState"));
  if (*(&self->_isEmptyTextField + 1))
  {
LABEL_37:
    v26 = -[ASRSchemaASRStarted task](self, "task") - 1;
    if (v26 > 7)
      v27 = CFSTR("ASRDATAPACKTASK_UNKNOWN");
    else
      v27 = off_1E562B888[v26];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("task"));
  }
LABEL_41:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRStarted)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRStarted *v5;
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
    self = -[ASRSchemaASRStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRStarted)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRStarted *v5;
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
  void *v17;
  SISchemaUUID *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ASRSchemaASRStarted *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASRSchemaASRStarted;
  v5 = -[ASRSchemaASRStarted init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("task"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRStarted setTask:](v5, "setTask:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelLocale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRStarted setModelLocale:](v5, "setModelLocale:", objc_msgSend(v7, "intValue"));
    v29 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("datapackVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ASRSchemaASRStarted setDatapackVersion:](v5, "setDatapackVersion:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHighQualityAsset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRStarted setIsHighQualityAsset:](v5, "setIsHighQualityAsset:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hammerVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[ASRSchemaASRStarted setHammerVersion:](v5, "setHammerVersion:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("geoLanguageModelRegion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[ASRSchemaASRStarted setGeoLanguageModelRegion:](v5, "setGeoLanguageModelRegion:", v14);

    }
    v27 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("geoLanguageModelLoaded"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRStarted setGeoLanguageModelLoaded:](v5, "setGeoLanguageModelLoaded:", objc_msgSend(v15, "BOOLValue"));
    v30 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechProfileAgeInNs"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRStarted setSpeechProfileAgeInNs:](v5, "setSpeechProfileAgeInNs:", objc_msgSend(v16, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationUiInteractionId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v17);
      -[ASRSchemaASRStarted setDictationUiInteractionId:](v5, "setDictationUiInteractionId:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("portraitExperimentVariantName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)objc_msgSend(v19, "copy");
      -[ASRSchemaASRStarted setPortraitExperimentVariantName:](v5, "setPortraitExperimentVariantName:", v20);

    }
    v28 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRStarted setStartState:](v5, "setStartState:", objc_msgSend(v21, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("atypicalSpeechEnabled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRStarted setAtypicalSpeechEnabled:](v5, "setAtypicalSpeechEnabled:", objc_msgSend(v22, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmptyTextField"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRStarted setIsEmptyTextField:](v5, "setIsEmptyTextField:", objc_msgSend(v23, "BOOLValue"));
    v24 = v5;

  }
  return v5;
}

- (int)task
{
  return self->_task;
}

- (int)modelLocale
{
  return self->_modelLocale;
}

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (void)setDatapackVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isHighQualityAsset
{
  return self->_isHighQualityAsset;
}

- (NSString)hammerVersion
{
  return self->_hammerVersion;
}

- (void)setHammerVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)geoLanguageModelRegion
{
  return self->_geoLanguageModelRegion;
}

- (void)setGeoLanguageModelRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)geoLanguageModelLoaded
{
  return self->_geoLanguageModelLoaded;
}

- (unint64_t)speechProfileAgeInNs
{
  return self->_speechProfileAgeInNs;
}

- (SISchemaUUID)dictationUiInteractionId
{
  return self->_dictationUiInteractionId;
}

- (void)setDictationUiInteractionId:(id)a3
{
  objc_storeStrong((id *)&self->_dictationUiInteractionId, a3);
}

- (NSString)portraitExperimentVariantName
{
  return self->_portraitExperimentVariantName;
}

- (void)setPortraitExperimentVariantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)startState
{
  return self->_startState;
}

- (BOOL)atypicalSpeechEnabled
{
  return self->_atypicalSpeechEnabled;
}

- (BOOL)isEmptyTextField
{
  return self->_isEmptyTextField;
}

- (void)setHasDatapackVersion:(BOOL)a3
{
  *(&self->_isEmptyTextField + 2) = a3;
}

- (void)setHasHammerVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasGeoLanguageModelRegion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasDictationUiInteractionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasPortraitExperimentVariantName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitExperimentVariantName, 0);
  objc_storeStrong((id *)&self->_dictationUiInteractionId, 0);
  objc_storeStrong((id *)&self->_geoLanguageModelRegion, 0);
  objc_storeStrong((id *)&self->_hammerVersion, 0);
  objc_storeStrong((id *)&self->_datapackVersion, 0);
}

@end
