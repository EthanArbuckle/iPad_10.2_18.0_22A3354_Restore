@implementation SMTSchemaSMTAppLanguageModelBuildEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setTrainingDataSizeInTokens:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_trainingDataSizeInTokens = a3;
}

- (BOOL)hasTrainingDataSizeInTokens
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTrainingDataSizeInTokens:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTrainingDataSizeInTokens
{
  -[SMTSchemaSMTAppLanguageModelBuildEnded setTrainingDataSizeInTokens:](self, "setTrainingDataSizeInTokens:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumOutOfVocabulary:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numOutOfVocabulary = a3;
}

- (BOOL)hasNumOutOfVocabulary
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumOutOfVocabulary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumOutOfVocabulary
{
  -[SMTSchemaSMTAppLanguageModelBuildEnded setNumOutOfVocabulary:](self, "setNumOutOfVocabulary:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumCustomPronunciations:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numCustomPronunciations = a3;
}

- (BOOL)hasNumCustomPronunciations
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumCustomPronunciations:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumCustomPronunciations
{
  -[SMTSchemaSMTAppLanguageModelBuildEnded setNumCustomPronunciations:](self, "setNumCustomPronunciations:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasAssetName
{
  return self->_assetName != 0;
}

- (void)deleteAssetName
{
  -[SMTSchemaSMTAppLanguageModelBuildEnded setAssetName:](self, "setAssetName:", 0);
}

- (void)setTrainingTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_trainingTimeInNs = a3;
}

- (BOOL)hasTrainingTimeInNs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTrainingTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteTrainingTimeInNs
{
  -[SMTSchemaSMTAppLanguageModelBuildEnded setTrainingTimeInNs:](self, "setTrainingTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setLanguageModelFileSizeInBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_languageModelFileSizeInBytes = a3;
}

- (BOOL)hasLanguageModelFileSizeInBytes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasLanguageModelFileSizeInBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteLanguageModelFileSizeInBytes
{
  -[SMTSchemaSMTAppLanguageModelBuildEnded setLanguageModelFileSizeInBytes:](self, "setLanguageModelFileSizeInBytes:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasArtifactFilepath
{
  return self->_artifactFilepath != 0;
}

- (void)deleteArtifactFilepath
{
  -[SMTSchemaSMTAppLanguageModelBuildEnded setArtifactFilepath:](self, "setArtifactFilepath:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTAppLanguageModelBuildEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  -[SMTSchemaSMTAppLanguageModelBuildEnded assetName](self, "assetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
    PBDataWriterWriteUint64Field();
  -[SMTSchemaSMTAppLanguageModelBuildEnded artifactFilepath](self, "artifactFilepath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8494B2B5C7B53500B5CF4A754BF27F2A has;
  unsigned int v6;
  unint64_t trainingDataSizeInTokens;
  int v8;
  unint64_t numOutOfVocabulary;
  int v10;
  unint64_t numCustomPronunciations;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  $8494B2B5C7B53500B5CF4A754BF27F2A v19;
  int v20;
  unsigned int v21;
  unint64_t trainingTimeInNs;
  int v23;
  unint64_t languageModelFileSizeInBytes;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  BOOL v30;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  has = self->_has;
  v6 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    trainingDataSizeInTokens = self->_trainingDataSizeInTokens;
    if (trainingDataSizeInTokens != objc_msgSend(v4, "trainingDataSizeInTokens"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[64];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_30;
  if (v8)
  {
    numOutOfVocabulary = self->_numOutOfVocabulary;
    if (numOutOfVocabulary != objc_msgSend(v4, "numOutOfVocabulary"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[64];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_30;
  if (v10)
  {
    numCustomPronunciations = self->_numCustomPronunciations;
    if (numCustomPronunciations != objc_msgSend(v4, "numCustomPronunciations"))
      goto LABEL_30;
  }
  -[SMTSchemaSMTAppLanguageModelBuildEnded assetName](self, "assetName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_29;
  -[SMTSchemaSMTAppLanguageModelBuildEnded assetName](self, "assetName");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[SMTSchemaSMTAppLanguageModelBuildEnded assetName](self, "assetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_30;
  }
  else
  {

  }
  v19 = self->_has;
  v20 = (*(unsigned int *)&v19 >> 3) & 1;
  v21 = v4[64];
  if (v20 != ((v21 >> 3) & 1))
    goto LABEL_30;
  if (v20)
  {
    trainingTimeInNs = self->_trainingTimeInNs;
    if (trainingTimeInNs != objc_msgSend(v4, "trainingTimeInNs"))
      goto LABEL_30;
    v19 = self->_has;
    v21 = v4[64];
  }
  v23 = (*(unsigned int *)&v19 >> 4) & 1;
  if (v23 != ((v21 >> 4) & 1))
    goto LABEL_30;
  if (v23)
  {
    languageModelFileSizeInBytes = self->_languageModelFileSizeInBytes;
    if (languageModelFileSizeInBytes != objc_msgSend(v4, "languageModelFileSizeInBytes"))
      goto LABEL_30;
  }
  -[SMTSchemaSMTAppLanguageModelBuildEnded artifactFilepath](self, "artifactFilepath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artifactFilepath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
  {
LABEL_29:

    goto LABEL_30;
  }
  -[SMTSchemaSMTAppLanguageModelBuildEnded artifactFilepath](self, "artifactFilepath");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {

LABEL_33:
    v30 = 1;
    goto LABEL_31;
  }
  v26 = (void *)v25;
  -[SMTSchemaSMTAppLanguageModelBuildEnded artifactFilepath](self, "artifactFilepath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artifactFilepath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqual:", v28);

  if ((v29 & 1) != 0)
    goto LABEL_33;
LABEL_30:
  v30 = 0;
LABEL_31:

  return v30;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761u * self->_trainingDataSizeInTokens;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_numOutOfVocabulary;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_numCustomPronunciations;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_assetName, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v7 = 2654435761u * self->_trainingTimeInNs;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6 ^ -[NSString hash](self->_artifactFilepath, "hash");
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_10:
  v8 = 2654435761u * self->_languageModelFileSizeInBytes;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6 ^ -[NSString hash](self->_artifactFilepath, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_artifactFilepath)
  {
    -[SMTSchemaSMTAppLanguageModelBuildEnded artifactFilepath](self, "artifactFilepath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("artifactFilepath"));

  }
  if (self->_assetName)
  {
    -[SMTSchemaSMTAppLanguageModelBuildEnded assetName](self, "assetName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("assetName"));

  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded languageModelFileSizeInBytes](self, "languageModelFileSizeInBytes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("languageModelFileSizeInBytes"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded numCustomPronunciations](self, "numCustomPronunciations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numCustomPronunciations"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded trainingDataSizeInTokens](self, "trainingDataSizeInTokens"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("trainingDataSizeInTokens"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded numOutOfVocabulary](self, "numOutOfVocabulary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numOutOfVocabulary"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 8) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded trainingTimeInNs](self, "trainingTimeInNs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("trainingTimeInNs"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SMTSchemaSMTAppLanguageModelBuildEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SMTSchemaSMTAppLanguageModelBuildEnded)initWithJSON:(id)a3
{
  void *v4;
  SMTSchemaSMTAppLanguageModelBuildEnded *v5;
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
    self = -[SMTSchemaSMTAppLanguageModelBuildEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SMTSchemaSMTAppLanguageModelBuildEnded)initWithDictionary:(id)a3
{
  id v4;
  SMTSchemaSMTAppLanguageModelBuildEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SMTSchemaSMTAppLanguageModelBuildEnded *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SMTSchemaSMTAppLanguageModelBuildEnded;
  v5 = -[SMTSchemaSMTAppLanguageModelBuildEnded init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trainingDataSizeInTokens"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelBuildEnded setTrainingDataSizeInTokens:](v5, "setTrainingDataSizeInTokens:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numOutOfVocabulary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelBuildEnded setNumOutOfVocabulary:](v5, "setNumOutOfVocabulary:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCustomPronunciations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelBuildEnded setNumCustomPronunciations:](v5, "setNumCustomPronunciations:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SMTSchemaSMTAppLanguageModelBuildEnded setAssetName:](v5, "setAssetName:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trainingTimeInNs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelBuildEnded setTrainingTimeInNs:](v5, "setTrainingTimeInNs:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageModelFileSizeInBytes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelBuildEnded setLanguageModelFileSizeInBytes:](v5, "setLanguageModelFileSizeInBytes:", objc_msgSend(v12, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artifactFilepath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[SMTSchemaSMTAppLanguageModelBuildEnded setArtifactFilepath:](v5, "setArtifactFilepath:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (unint64_t)trainingDataSizeInTokens
{
  return self->_trainingDataSizeInTokens;
}

- (unint64_t)numOutOfVocabulary
{
  return self->_numOutOfVocabulary;
}

- (unint64_t)numCustomPronunciations
{
  return self->_numCustomPronunciations;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)trainingTimeInNs
{
  return self->_trainingTimeInNs;
}

- (unint64_t)languageModelFileSizeInBytes
{
  return self->_languageModelFileSizeInBytes;
}

- (NSString)artifactFilepath
{
  return self->_artifactFilepath;
}

- (void)setArtifactFilepath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setHasAssetName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasArtifactFilepath:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artifactFilepath, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
}

@end
