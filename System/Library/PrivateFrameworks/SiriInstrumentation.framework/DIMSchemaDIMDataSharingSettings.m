@implementation DIMSchemaDIMDataSharingSettings

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3
{
  *(&self->_isAppAnalyticsEnabled + 1) |= 1u;
  self->_isDiagnosticsAndUsageEnabled = a3;
}

- (BOOL)hasIsDiagnosticsAndUsageEnabled
{
  return *(&self->_isAppAnalyticsEnabled + 1);
}

- (void)setHasIsDiagnosticsAndUsageEnabled:(BOOL)a3
{
  *(&self->_isAppAnalyticsEnabled + 1) = *(&self->_isAppAnalyticsEnabled + 1) & 0xFE | a3;
}

- (void)deleteIsDiagnosticsAndUsageEnabled
{
  -[DIMSchemaDIMDataSharingSettings setIsDiagnosticsAndUsageEnabled:](self, "setIsDiagnosticsAndUsageEnabled:", 0);
  *(&self->_isAppAnalyticsEnabled + 1) &= ~1u;
}

- (void)setIsAppAnalyticsEnabled:(BOOL)a3
{
  *(&self->_isAppAnalyticsEnabled + 1) |= 2u;
  self->_isAppAnalyticsEnabled = a3;
}

- (BOOL)hasIsAppAnalyticsEnabled
{
  return (*((unsigned __int8 *)&self->_isAppAnalyticsEnabled + 1) >> 1) & 1;
}

- (void)setHasIsAppAnalyticsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isAppAnalyticsEnabled + 1) = *(&self->_isAppAnalyticsEnabled + 1) & 0xFD | v3;
}

- (void)deleteIsAppAnalyticsEnabled
{
  -[DIMSchemaDIMDataSharingSettings setIsAppAnalyticsEnabled:](self, "setIsAppAnalyticsEnabled:", 0);
  *(&self->_isAppAnalyticsEnabled + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMDataSharingSettingsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isAppAnalyticsEnabled + 1);
  v6 = v4;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    v5 = *(&self->_isAppAnalyticsEnabled + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isDiagnosticsAndUsageEnabled;
  int v8;
  int isAppAnalyticsEnabled;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  v5 = *((unsigned __int8 *)&self->_isAppAnalyticsEnabled + 1);
  v6 = v4[10];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_10;
  if ((v5 & 1) != 0)
  {
    isDiagnosticsAndUsageEnabled = self->_isDiagnosticsAndUsageEnabled;
    if (isDiagnosticsAndUsageEnabled != objc_msgSend(v4, "isDiagnosticsAndUsageEnabled"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    v5 = *((unsigned __int8 *)&self->_isAppAnalyticsEnabled + 1);
    v6 = v4[10];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    isAppAnalyticsEnabled = self->_isAppAnalyticsEnabled;
    if (isAppAnalyticsEnabled != objc_msgSend(v4, "isAppAnalyticsEnabled"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if (*(&self->_isAppAnalyticsEnabled + 1))
  {
    v2 = 2654435761 * self->_isDiagnosticsAndUsageEnabled;
    if ((*(&self->_isAppAnalyticsEnabled + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(&self->_isAppAnalyticsEnabled + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_isAppAnalyticsEnabled;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isAppAnalyticsEnabled + 1);
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DIMSchemaDIMDataSharingSettings isAppAnalyticsEnabled](self, "isAppAnalyticsEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isAppAnalyticsEnabled"));

    v4 = *(&self->_isAppAnalyticsEnabled + 1);
  }
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DIMSchemaDIMDataSharingSettings isDiagnosticsAndUsageEnabled](self, "isDiagnosticsAndUsageEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isDiagnosticsAndUsageEnabled"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DIMSchemaDIMDataSharingSettings dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DIMSchemaDIMDataSharingSettings)initWithJSON:(id)a3
{
  void *v4;
  DIMSchemaDIMDataSharingSettings *v5;
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
    self = -[DIMSchemaDIMDataSharingSettings initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DIMSchemaDIMDataSharingSettings)initWithDictionary:(id)a3
{
  id v4;
  DIMSchemaDIMDataSharingSettings *v5;
  void *v6;
  void *v7;
  DIMSchemaDIMDataSharingSettings *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DIMSchemaDIMDataSharingSettings;
  v5 = -[DIMSchemaDIMDataSharingSettings init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDiagnosticsAndUsageEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDataSharingSettings setIsDiagnosticsAndUsageEnabled:](v5, "setIsDiagnosticsAndUsageEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppAnalyticsEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDataSharingSettings setIsAppAnalyticsEnabled:](v5, "setIsAppAnalyticsEnabled:", objc_msgSend(v7, "BOOLValue"));
    v8 = v5;

  }
  return v5;
}

- (BOOL)isDiagnosticsAndUsageEnabled
{
  return self->_isDiagnosticsAndUsageEnabled;
}

- (BOOL)isAppAnalyticsEnabled
{
  return self->_isAppAnalyticsEnabled;
}

@end
