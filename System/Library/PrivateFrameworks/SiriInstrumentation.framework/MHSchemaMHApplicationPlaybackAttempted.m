@implementation MHSchemaMHApplicationPlaybackAttempted

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
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MHSchemaMHApplicationPlaybackAttempted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v8, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6)
    -[MHSchemaMHApplicationPlaybackAttempted deleteAppBundleName](self, "deleteAppBundleName");
  return v5;
}

- (BOOL)hasAppBundleName
{
  return self->_appBundleName != 0;
}

- (void)deleteAppBundleName
{
  -[MHSchemaMHApplicationPlaybackAttempted setAppBundleName:](self, "setAppBundleName:", 0);
}

- (BOOL)hasAppBundleVersion
{
  return self->_appBundleVersion != 0;
}

- (void)deleteAppBundleVersion
{
  -[MHSchemaMHApplicationPlaybackAttempted setAppBundleVersion:](self, "setAppBundleVersion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHApplicationPlaybackAttemptedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MHSchemaMHApplicationPlaybackAttempted appBundleName](self, "appBundleName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[MHSchemaMHApplicationPlaybackAttempted appBundleVersion](self, "appBundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[MHSchemaMHApplicationPlaybackAttempted appBundleName](self, "appBundleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[MHSchemaMHApplicationPlaybackAttempted appBundleName](self, "appBundleName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHApplicationPlaybackAttempted appBundleName](self, "appBundleName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBundleName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[MHSchemaMHApplicationPlaybackAttempted appBundleVersion](self, "appBundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[MHSchemaMHApplicationPlaybackAttempted appBundleVersion](self, "appBundleVersion");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[MHSchemaMHApplicationPlaybackAttempted appBundleVersion](self, "appBundleVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBundleVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_appBundleName, "hash");
  return -[NSString hash](self->_appBundleVersion, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appBundleName)
  {
    -[MHSchemaMHApplicationPlaybackAttempted appBundleName](self, "appBundleName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appBundleName"));

  }
  if (self->_appBundleVersion)
  {
    -[MHSchemaMHApplicationPlaybackAttempted appBundleVersion](self, "appBundleVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appBundleVersion"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHApplicationPlaybackAttempted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHApplicationPlaybackAttempted)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHApplicationPlaybackAttempted *v5;
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
    self = -[MHSchemaMHApplicationPlaybackAttempted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHApplicationPlaybackAttempted)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHApplicationPlaybackAttempted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MHSchemaMHApplicationPlaybackAttempted *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MHSchemaMHApplicationPlaybackAttempted;
  v5 = -[MHSchemaMHApplicationPlaybackAttempted init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHApplicationPlaybackAttempted setAppBundleName:](v5, "setAppBundleName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[MHSchemaMHApplicationPlaybackAttempted setAppBundleVersion:](v5, "setAppBundleVersion:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)appBundleName
{
  return self->_appBundleName;
}

- (void)setAppBundleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appBundleVersion
{
  return self->_appBundleVersion;
}

- (void)setAppBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasAppBundleName:(BOOL)a3
{
  self->_hasAppBundleName = a3;
}

- (void)setHasAppBundleVersion:(BOOL)a3
{
  self->_hasAppBundleVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleVersion, 0);
  objc_storeStrong((id *)&self->_appBundleName, 0);
}

@end
