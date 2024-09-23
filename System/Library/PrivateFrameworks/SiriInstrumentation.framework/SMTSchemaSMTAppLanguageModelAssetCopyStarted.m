@implementation SMTSchemaSMTAppLanguageModelAssetCopyStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_locale = a3;
}

- (BOOL)hasLocale
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLocale:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLocale
{
  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted setLocale:](self, "setLocale:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)deleteAppBundleId
{
  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted setAppBundleId:](self, "setAppBundleId:", 0);
}

- (BOOL)hasAppAssetPath
{
  return self->_appAssetPath != 0;
}

- (void)deleteAppAssetPath
{
  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted setAppAssetPath:](self, "setAppAssetPath:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTAppLanguageModelAssetCopyStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appBundleId](self, "appBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appAssetPath](self, "appAssetPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int locale;
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
    locale = self->_locale;
    if (locale != objc_msgSend(v4, "locale"))
      goto LABEL_15;
  }
  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appBundleId](self, "appBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appBundleId](self, "appBundleId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appBundleId](self, "appBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appAssetPath](self, "appAssetPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appAssetPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appAssetPath](self, "appAssetPath");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appAssetPath](self, "appAssetPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appAssetPath");
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
    v3 = 2654435761 * self->_locale;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_appBundleId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_appAssetPath, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appAssetPath)
  {
    -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appAssetPath](self, "appAssetPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appAssetPath"));

  }
  if (self->_appBundleId)
  {
    -[SMTSchemaSMTAppLanguageModelAssetCopyStarted appBundleId](self, "appBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appBundleId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = -[SMTSchemaSMTAppLanguageModelAssetCopyStarted locale](self, "locale") - 1;
    if (v8 > 0x3D)
      v9 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v9 = off_1E5637C30[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("locale"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SMTSchemaSMTAppLanguageModelAssetCopyStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SMTSchemaSMTAppLanguageModelAssetCopyStarted)initWithJSON:(id)a3
{
  void *v4;
  SMTSchemaSMTAppLanguageModelAssetCopyStarted *v5;
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
    self = -[SMTSchemaSMTAppLanguageModelAssetCopyStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SMTSchemaSMTAppLanguageModelAssetCopyStarted)initWithDictionary:(id)a3
{
  id v4;
  SMTSchemaSMTAppLanguageModelAssetCopyStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SMTSchemaSMTAppLanguageModelAssetCopyStarted *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SMTSchemaSMTAppLanguageModelAssetCopyStarted;
  v5 = -[SMTSchemaSMTAppLanguageModelAssetCopyStarted init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SMTSchemaSMTAppLanguageModelAssetCopyStarted setLocale:](v5, "setLocale:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SMTSchemaSMTAppLanguageModelAssetCopyStarted setAppBundleId:](v5, "setAppBundleId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appAssetPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SMTSchemaSMTAppLanguageModelAssetCopyStarted setAppAssetPath:](v5, "setAppAssetPath:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)locale
{
  return self->_locale;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appAssetPath
{
  return self->_appAssetPath;
}

- (void)setAppAssetPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasAppBundleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAppAssetPath:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAssetPath, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
