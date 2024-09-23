@implementation SISchemaDictationTranscriptionMetadata

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
  v9.super_class = (Class)SISchemaDictationTranscriptionMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDictationTranscriptionMetadata dictationAlternativesPresent](self, "dictationAlternativesPresent", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaDictationTranscriptionMetadata deleteDictationAlternativesPresent](self, "deleteDictationAlternativesPresent");
  return v5;
}

- (void)setDictationModel:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dictationModel = a3;
}

- (BOOL)hasDictationModel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDictationModel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDictationModel
{
  -[SISchemaDictationTranscriptionMetadata setDictationModel:](self, "setDictationModel:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasDictationModelVersion
{
  return self->_dictationModelVersion != 0;
}

- (void)deleteDictationModelVersion
{
  -[SISchemaDictationTranscriptionMetadata setDictationModelVersion:](self, "setDictationModelVersion:", 0);
}

- (BOOL)hasDictationAlternativesPresent
{
  return self->_dictationAlternativesPresent != 0;
}

- (void)deleteDictationAlternativesPresent
{
  -[SISchemaDictationTranscriptionMetadata setDictationAlternativesPresent:](self, "setDictationAlternativesPresent:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationTranscriptionMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaDictationTranscriptionMetadata dictationModelVersion](self, "dictationModelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaDictationTranscriptionMetadata dictationAlternativesPresent](self, "dictationAlternativesPresent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[SISchemaDictationTranscriptionMetadata dictationAlternativesPresent](self, "dictationAlternativesPresent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int dictationModel;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    dictationModel = self->_dictationModel;
    if (dictationModel != objc_msgSend(v4, "dictationModel"))
      goto LABEL_15;
  }
  -[SISchemaDictationTranscriptionMetadata dictationModelVersion](self, "dictationModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationModelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[SISchemaDictationTranscriptionMetadata dictationModelVersion](self, "dictationModelVersion");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaDictationTranscriptionMetadata dictationModelVersion](self, "dictationModelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationModelVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[SISchemaDictationTranscriptionMetadata dictationAlternativesPresent](self, "dictationAlternativesPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationAlternativesPresent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SISchemaDictationTranscriptionMetadata dictationAlternativesPresent](self, "dictationAlternativesPresent");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SISchemaDictationTranscriptionMetadata dictationAlternativesPresent](self, "dictationAlternativesPresent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationAlternativesPresent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_dictationModel;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_dictationModelVersion, "hash") ^ v3;
  return v4 ^ -[SISchemaDictationAlternativesPresent hash](self->_dictationAlternativesPresent, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dictationAlternativesPresent)
  {
    -[SISchemaDictationTranscriptionMetadata dictationAlternativesPresent](self, "dictationAlternativesPresent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dictationAlternativesPresent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dictationAlternativesPresent"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[SISchemaDictationTranscriptionMetadata dictationModel](self, "dictationModel");
    v8 = CFSTR("DICTATIONMODEL_UNKNOWN_DICTATION_MODEL_SOURCE");
    if (v7 == 1)
      v8 = CFSTR("DICTATIONMODEL_CLIENT");
    if (v7 == 2)
      v9 = CFSTR("DICTATIONMODEL_SERVER");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dictationModel"));
  }
  if (self->_dictationModelVersion)
  {
    -[SISchemaDictationTranscriptionMetadata dictationModelVersion](self, "dictationModelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("dictationModelVersion"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDictationTranscriptionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDictationTranscriptionMetadata)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDictationTranscriptionMetadata *v5;
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
    self = -[SISchemaDictationTranscriptionMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDictationTranscriptionMetadata)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDictationTranscriptionMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaDictationAlternativesPresent *v10;
  SISchemaDictationTranscriptionMetadata *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDictationTranscriptionMetadata;
  v5 = -[SISchemaDictationTranscriptionMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationTranscriptionMetadata setDictationModel:](v5, "setDictationModel:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationModelVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SISchemaDictationTranscriptionMetadata setDictationModelVersion:](v5, "setDictationModelVersion:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationAlternativesPresent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaDictationAlternativesPresent initWithDictionary:]([SISchemaDictationAlternativesPresent alloc], "initWithDictionary:", v9);
      -[SISchemaDictationTranscriptionMetadata setDictationAlternativesPresent:](v5, "setDictationAlternativesPresent:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)dictationModel
{
  return self->_dictationModel;
}

- (NSString)dictationModelVersion
{
  return self->_dictationModelVersion;
}

- (void)setDictationModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaDictationAlternativesPresent)dictationAlternativesPresent
{
  return self->_dictationAlternativesPresent;
}

- (void)setDictationAlternativesPresent:(id)a3
{
  objc_storeStrong((id *)&self->_dictationAlternativesPresent, a3);
}

- (void)setHasDictationModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasDictationAlternativesPresent:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationAlternativesPresent, 0);
  objc_storeStrong((id *)&self->_dictationModelVersion, 0);
}

@end
