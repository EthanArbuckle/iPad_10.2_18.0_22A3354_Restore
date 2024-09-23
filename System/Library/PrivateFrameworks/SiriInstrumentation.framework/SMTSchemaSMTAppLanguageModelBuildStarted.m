@implementation SMTSchemaSMTAppLanguageModelBuildStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setArtifactSizeInBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_artifactSizeInBytes = a3;
}

- (BOOL)hasArtifactSizeInBytes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasArtifactSizeInBytes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteArtifactSizeInBytes
{
  -[SMTSchemaSMTAppLanguageModelBuildStarted setArtifactSizeInBytes:](self, "setArtifactSizeInBytes:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)deleteAppBundleId
{
  -[SMTSchemaSMTAppLanguageModelBuildStarted setAppBundleId:](self, "setAppBundleId:", 0);
}

- (void)setLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_locale = a3;
}

- (BOOL)hasLocale
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteLocale
{
  -[SMTSchemaSMTAppLanguageModelBuildStarted setLocale:](self, "setLocale:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTAppLanguageModelBuildStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  -[SMTSchemaSMTAppLanguageModelBuildStarted appBundleId](self, "appBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t artifactSizeInBytes;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int locale;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[28] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    artifactSizeInBytes = self->_artifactSizeInBytes;
    if (artifactSizeInBytes != objc_msgSend(v4, "artifactSizeInBytes"))
      goto LABEL_15;
  }
  -[SMTSchemaSMTAppLanguageModelBuildStarted appBundleId](self, "appBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[SMTSchemaSMTAppLanguageModelBuildStarted appBundleId](self, "appBundleId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[SMTSchemaSMTAppLanguageModelBuildStarted appBundleId](self, "appBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  v14 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1))
    goto LABEL_15;
  if (v14)
  {
    locale = self->_locale;
    if (locale != objc_msgSend(v4, "locale"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_artifactSizeInBytes;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_appBundleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_locale;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appBundleId)
  {
    -[SMTSchemaSMTAppLanguageModelBuildStarted appBundleId](self, "appBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appBundleId"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildStarted artifactSizeInBytes](self, "artifactSizeInBytes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("artifactSizeInBytes"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = -[SMTSchemaSMTAppLanguageModelBuildStarted locale](self, "locale") - 1;
    if (v8 > 0x3D)
      v9 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v9 = off_1E5637E20[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("locale"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SMTSchemaSMTAppLanguageModelBuildStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SMTSchemaSMTAppLanguageModelBuildStarted)initWithJSON:(id)a3
{
  void *v4;
  SMTSchemaSMTAppLanguageModelBuildStarted *v5;
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
    self = -[SMTSchemaSMTAppLanguageModelBuildStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SMTSchemaSMTAppLanguageModelBuildStarted)initWithDictionary:(id)a3
{
  id v4;
  SMTSchemaSMTAppLanguageModelBuildStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SMTSchemaSMTAppLanguageModelBuildStarted *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SMTSchemaSMTAppLanguageModelBuildStarted;
  v5 = -[SMTSchemaSMTAppLanguageModelBuildStarted init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artifactSizeInBytes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelBuildStarted setArtifactSizeInBytes:](v5, "setArtifactSizeInBytes:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SMTSchemaSMTAppLanguageModelBuildStarted setAppBundleId:](v5, "setAppBundleId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelBuildStarted setLocale:](v5, "setLocale:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (unint64_t)artifactSizeInBytes
{
  return self->_artifactSizeInBytes;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)locale
{
  return self->_locale;
}

- (void)setHasAppBundleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
