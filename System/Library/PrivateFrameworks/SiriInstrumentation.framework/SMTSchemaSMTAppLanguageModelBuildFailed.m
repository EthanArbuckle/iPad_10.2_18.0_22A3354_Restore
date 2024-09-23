@implementation SMTSchemaSMTAppLanguageModelBuildFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasAssetName
{
  return self->_assetName != 0;
}

- (void)deleteAssetName
{
  -[SMTSchemaSMTAppLanguageModelBuildFailed setAssetName:](self, "setAssetName:", 0);
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteReason
{
  -[SMTSchemaSMTAppLanguageModelBuildFailed setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTAppLanguageModelBuildFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SMTSchemaSMTAppLanguageModelBuildFailed assetName](self, "assetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int reason;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SMTSchemaSMTAppLanguageModelBuildFailed assetName](self, "assetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[SMTSchemaSMTAppLanguageModelBuildFailed assetName](self, "assetName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SMTSchemaSMTAppLanguageModelBuildFailed assetName](self, "assetName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[20] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reason = self->_reason;
    if (reason != objc_msgSend(v4, "reason"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_assetName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_reason;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assetName)
  {
    -[SMTSchemaSMTAppLanguageModelBuildFailed assetName](self, "assetName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetName"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = -[SMTSchemaSMTAppLanguageModelBuildFailed reason](self, "reason");
    v7 = CFSTR("SMTAPPLANGUAGEMODELBUILDFAILUREREASON_UNKNOWN");
    if (v6 == 1)
      v7 = CFSTR("SMTAPPLANGUAGEMODELBUILDFAILUREREASON_DATAPACK");
    if (v6 == 2)
      v8 = CFSTR("SMTAPPLANGUAGEMODELBUILDFAILUREREASON_TRANSITION");
    else
      v8 = v7;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SMTSchemaSMTAppLanguageModelBuildFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SMTSchemaSMTAppLanguageModelBuildFailed)initWithJSON:(id)a3
{
  void *v4;
  SMTSchemaSMTAppLanguageModelBuildFailed *v5;
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
    self = -[SMTSchemaSMTAppLanguageModelBuildFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SMTSchemaSMTAppLanguageModelBuildFailed)initWithDictionary:(id)a3
{
  id v4;
  SMTSchemaSMTAppLanguageModelBuildFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  SMTSchemaSMTAppLanguageModelBuildFailed *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMTSchemaSMTAppLanguageModelBuildFailed;
  v5 = -[SMTSchemaSMTAppLanguageModelBuildFailed init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SMTSchemaSMTAppLanguageModelBuildFailed setAssetName:](v5, "setAssetName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelBuildFailed setReason:](v5, "setReason:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)reason
{
  return self->_reason;
}

- (void)setHasAssetName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetName, 0);
}

@end
