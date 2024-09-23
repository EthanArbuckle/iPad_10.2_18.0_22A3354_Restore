@implementation MHSchemaMHVoiceTriggerFirstPassDailyMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (void)deleteConfigVersion
{
  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata setConfigVersion:](self, "setConfigVersion:", 0);
}

- (void)setHardwareSampleRate:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hardwareSampleRate = a3;
}

- (BOOL)hasHardwareSampleRate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHardwareSampleRate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHardwareSampleRate
{
  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata setHardwareSampleRate:](self, "setHardwareSampleRate:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasMitigationAssetVersion
{
  return self->_mitigationAssetVersion != 0;
}

- (void)deleteMitigationAssetVersion
{
  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata setMitigationAssetVersion:](self, "setMitigationAssetVersion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceTriggerFirstPassDailyMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata configVersion](self, "configVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata mitigationAssetVersion](self, "mitigationAssetVersion");
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
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int hardwareSampleRate;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata configVersion](self, "configVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata configVersion](self, "configVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata configVersion](self, "configVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    hardwareSampleRate = self->_hardwareSampleRate;
    if (hardwareSampleRate != objc_msgSend(v4, "hardwareSampleRate"))
      goto LABEL_15;
  }
  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata mitigationAssetVersion](self, "mitigationAssetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mitigationAssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata mitigationAssetVersion](self, "mitigationAssetVersion");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata mitigationAssetVersion](self, "mitigationAssetVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mitigationAssetVersion");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_configVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_hardwareSampleRate;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_mitigationAssetVersion, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_configVersion)
  {
    -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata configVersion](self, "configVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("configVersion"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata hardwareSampleRate](self, "hardwareSampleRate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hardwareSampleRate"));

  }
  if (self->_mitigationAssetVersion)
  {
    -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata mitigationAssetVersion](self, "mitigationAssetVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mitigationAssetVersion"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHVoiceTriggerFirstPassDailyMetadata *v5;
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
    self = -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHVoiceTriggerFirstPassDailyMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MHSchemaMHVoiceTriggerFirstPassDailyMetadata *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHVoiceTriggerFirstPassDailyMetadata;
  v5 = -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata setConfigVersion:](v5, "setConfigVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareSampleRate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata setHardwareSampleRate:](v5, "setHardwareSampleRate:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mitigationAssetVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata setMitigationAssetVersion:](v5, "setMitigationAssetVersion:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)hardwareSampleRate
{
  return self->_hardwareSampleRate;
}

- (NSString)mitigationAssetVersion
{
  return self->_mitigationAssetVersion;
}

- (void)setMitigationAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasConfigVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasMitigationAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mitigationAssetVersion, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
}

@end
