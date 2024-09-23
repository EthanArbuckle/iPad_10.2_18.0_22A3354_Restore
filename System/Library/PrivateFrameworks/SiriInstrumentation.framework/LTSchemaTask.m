@implementation LTSchemaTask

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasTranslationTask
{
  return self->_translationTask != 0;
}

- (void)deleteTranslationTask
{
  -[LTSchemaTask setTranslationTask:](self, "setTranslationTask:", 0);
}

- (BOOL)hasSourceLanguage
{
  return self->_sourceLanguage != 0;
}

- (void)deleteSourceLanguage
{
  -[LTSchemaTask setSourceLanguage:](self, "setSourceLanguage:", 0);
}

- (BOOL)hasTargetLanguage
{
  return self->_targetLanguage != 0;
}

- (void)deleteTargetLanguage
{
  -[LTSchemaTask setTargetLanguage:](self, "setTargetLanguage:", 0);
}

- (BOOL)hasDeviceOS
{
  return self->_deviceOS != 0;
}

- (void)deleteDeviceOS
{
  -[LTSchemaTask setDeviceOS:](self, "setDeviceOS:", 0);
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteDeviceType
{
  -[LTSchemaTask setDeviceType:](self, "setDeviceType:", 0);
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (void)deleteOsVersion
{
  -[LTSchemaTask setOsVersion:](self, "setOsVersion:", 0);
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (void)deleteBundleIdentifier
{
  -[LTSchemaTask setBundleIdentifier:](self, "setBundleIdentifier:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaTaskReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[LTSchemaTask translationTask](self, "translationTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[LTSchemaTask sourceLanguage](self, "sourceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[LTSchemaTask targetLanguage](self, "targetLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[LTSchemaTask deviceOS](self, "deviceOS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[LTSchemaTask deviceType](self, "deviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[LTSchemaTask osVersion](self, "osVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[LTSchemaTask bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  if (v10)
  {
    PBDataWriterWriteStringField();
    v11 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[LTSchemaTask translationTask](self, "translationTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaTask translationTask](self, "translationTask");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LTSchemaTask translationTask](self, "translationTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationTask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[LTSchemaTask sourceLanguage](self, "sourceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaTask sourceLanguage](self, "sourceLanguage");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LTSchemaTask sourceLanguage](self, "sourceLanguage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceLanguage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[LTSchemaTask targetLanguage](self, "targetLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaTask targetLanguage](self, "targetLanguage");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[LTSchemaTask targetLanguage](self, "targetLanguage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetLanguage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[LTSchemaTask deviceOS](self, "deviceOS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceOS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaTask deviceOS](self, "deviceOS");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[LTSchemaTask deviceOS](self, "deviceOS");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceOS");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[LTSchemaTask deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaTask deviceType](self, "deviceType");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[LTSchemaTask deviceType](self, "deviceType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[LTSchemaTask osVersion](self, "osVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "osVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaTask osVersion](self, "osVersion");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[LTSchemaTask osVersion](self, "osVersion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "osVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[LTSchemaTask bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[LTSchemaTask bundleIdentifier](self, "bundleIdentifier");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[LTSchemaTask bundleIdentifier](self, "bundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if ((v41 & 1) != 0)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v42 = 0;
LABEL_38:

  return v42;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_translationTask, "hash");
  v4 = -[NSString hash](self->_sourceLanguage, "hash") ^ v3;
  v5 = -[NSString hash](self->_targetLanguage, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_deviceOS, "hash");
  v7 = -[NSString hash](self->_deviceType, "hash");
  v8 = v7 ^ -[NSString hash](self->_osVersion, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_bundleIdentifier, "hash");
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
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleIdentifier)
  {
    -[LTSchemaTask bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleIdentifier"));

  }
  if (self->_deviceOS)
  {
    -[LTSchemaTask deviceOS](self, "deviceOS");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceOS"));

  }
  if (self->_deviceType)
  {
    -[LTSchemaTask deviceType](self, "deviceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceType"));

  }
  if (self->_osVersion)
  {
    -[LTSchemaTask osVersion](self, "osVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("osVersion"));

  }
  if (self->_sourceLanguage)
  {
    -[LTSchemaTask sourceLanguage](self, "sourceLanguage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("sourceLanguage"));

  }
  if (self->_targetLanguage)
  {
    -[LTSchemaTask targetLanguage](self, "targetLanguage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("targetLanguage"));

  }
  if (self->_translationTask)
  {
    -[LTSchemaTask translationTask](self, "translationTask");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("translationTask"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaTask dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaTask)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaTask *v5;
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
    self = -[LTSchemaTask initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaTask)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaTask *v5;
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
  void *v18;
  void *v19;
  LTSchemaTask *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LTSchemaTask;
  v5 = -[LTSchemaTask init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("translationTask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[LTSchemaTask setTranslationTask:](v5, "setTranslationTask:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceLanguage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[LTSchemaTask setSourceLanguage:](v5, "setSourceLanguage:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetLanguage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[LTSchemaTask setTargetLanguage:](v5, "setTargetLanguage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceOS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[LTSchemaTask setDeviceOS:](v5, "setDeviceOS:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[LTSchemaTask setDeviceType:](v5, "setDeviceType:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[LTSchemaTask setOsVersion:](v5, "setOsVersion:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[LTSchemaTask setBundleIdentifier:](v5, "setBundleIdentifier:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (NSString)translationTask
{
  return self->_translationTask;
}

- (void)setTranslationTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sourceLanguage
{
  return self->_sourceLanguage;
}

- (void)setSourceLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)targetLanguage
{
  return self->_targetLanguage;
}

- (void)setTargetLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)deviceOS
{
  return self->_deviceOS;
}

- (void)setDeviceOS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setHasTranslationTask:(BOOL)a3
{
  self->_hasTranslationTask = a3;
}

- (void)setHasSourceLanguage:(BOOL)a3
{
  self->_hasSourceLanguage = a3;
}

- (void)setHasTargetLanguage:(BOOL)a3
{
  self->_hasTargetLanguage = a3;
}

- (void)setHasDeviceOS:(BOOL)a3
{
  self->_hasDeviceOS = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasOsVersion:(BOOL)a3
{
  self->_hasOsVersion = a3;
}

- (void)setHasBundleIdentifier:(BOOL)a3
{
  self->_hasBundleIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceOS, 0);
  objc_storeStrong((id *)&self->_targetLanguage, 0);
  objc_storeStrong((id *)&self->_sourceLanguage, 0);
  objc_storeStrong((id *)&self->_translationTask, 0);
}

@end
