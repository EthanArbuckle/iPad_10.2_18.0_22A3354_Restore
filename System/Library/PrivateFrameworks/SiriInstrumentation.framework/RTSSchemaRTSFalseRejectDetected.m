@implementation RTSSchemaRTSFalseRejectDetected

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAssetVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_assetVersion = a3;
}

- (BOOL)hasAssetVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAssetVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAssetVersion
{
  -[RTSSchemaRTSFalseRejectDetected setAssetVersion:](self, "setAssetVersion:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasGestureModelVersion
{
  return self->_gestureModelVersion != 0;
}

- (void)deleteGestureModelVersion
{
  -[RTSSchemaRTSFalseRejectDetected setGestureModelVersion:](self, "setGestureModelVersion:", 0);
}

- (BOOL)hasAudioModelVersion
{
  return self->_audioModelVersion != 0;
}

- (void)deleteAudioModelVersion
{
  -[RTSSchemaRTSFalseRejectDetected setAudioModelVersion:](self, "setAudioModelVersion:", 0);
}

- (BOOL)hasPolicyModelVersion
{
  return self->_policyModelVersion != 0;
}

- (void)deletePolicyModelVersion
{
  -[RTSSchemaRTSFalseRejectDetected setPolicyModelVersion:](self, "setPolicyModelVersion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSFalseRejectDetectedReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
  -[RTSSchemaRTSFalseRejectDetected gestureModelVersion](self, "gestureModelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[RTSSchemaRTSFalseRejectDetected audioModelVersion](self, "audioModelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[RTSSchemaRTSFalseRejectDetected policyModelVersion](self, "policyModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int assetVersion;
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
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    assetVersion = self->_assetVersion;
    if (assetVersion != objc_msgSend(v4, "assetVersion"))
      goto LABEL_20;
  }
  -[RTSSchemaRTSFalseRejectDetected gestureModelVersion](self, "gestureModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gestureModelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[RTSSchemaRTSFalseRejectDetected gestureModelVersion](self, "gestureModelVersion");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RTSSchemaRTSFalseRejectDetected gestureModelVersion](self, "gestureModelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gestureModelVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  -[RTSSchemaRTSFalseRejectDetected audioModelVersion](self, "audioModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioModelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[RTSSchemaRTSFalseRejectDetected audioModelVersion](self, "audioModelVersion");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RTSSchemaRTSFalseRejectDetected audioModelVersion](self, "audioModelVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioModelVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[RTSSchemaRTSFalseRejectDetected policyModelVersion](self, "policyModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "policyModelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RTSSchemaRTSFalseRejectDetected policyModelVersion](self, "policyModelVersion");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[RTSSchemaRTSFalseRejectDetected policyModelVersion](self, "policyModelVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "policyModelVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_assetVersion;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_gestureModelVersion, "hash") ^ v3;
  v5 = -[NSString hash](self->_audioModelVersion, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_policyModelVersion, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTSSchemaRTSFalseRejectDetected assetVersion](self, "assetVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("assetVersion"));

  }
  if (self->_audioModelVersion)
  {
    -[RTSSchemaRTSFalseRejectDetected audioModelVersion](self, "audioModelVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioModelVersion"));

  }
  if (self->_gestureModelVersion)
  {
    -[RTSSchemaRTSFalseRejectDetected gestureModelVersion](self, "gestureModelVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("gestureModelVersion"));

  }
  if (self->_policyModelVersion)
  {
    -[RTSSchemaRTSFalseRejectDetected policyModelVersion](self, "policyModelVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("policyModelVersion"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RTSSchemaRTSFalseRejectDetected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RTSSchemaRTSFalseRejectDetected)initWithJSON:(id)a3
{
  void *v4;
  RTSSchemaRTSFalseRejectDetected *v5;
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
    self = -[RTSSchemaRTSFalseRejectDetected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RTSSchemaRTSFalseRejectDetected)initWithDictionary:(id)a3
{
  id v4;
  RTSSchemaRTSFalseRejectDetected *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RTSSchemaRTSFalseRejectDetected *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTSSchemaRTSFalseRejectDetected;
  v5 = -[RTSSchemaRTSFalseRejectDetected init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RTSSchemaRTSFalseRejectDetected setAssetVersion:](v5, "setAssetVersion:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gestureModelVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[RTSSchemaRTSFalseRejectDetected setGestureModelVersion:](v5, "setGestureModelVersion:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioModelVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[RTSSchemaRTSFalseRejectDetected setAudioModelVersion:](v5, "setAudioModelVersion:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("policyModelVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[RTSSchemaRTSFalseRejectDetected setPolicyModelVersion:](v5, "setPolicyModelVersion:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (unsigned)assetVersion
{
  return self->_assetVersion;
}

- (NSString)gestureModelVersion
{
  return self->_gestureModelVersion;
}

- (void)setGestureModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)audioModelVersion
{
  return self->_audioModelVersion;
}

- (void)setAudioModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)policyModelVersion
{
  return self->_policyModelVersion;
}

- (void)setPolicyModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasGestureModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAudioModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasPolicyModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyModelVersion, 0);
  objc_storeStrong((id *)&self->_audioModelVersion, 0);
  objc_storeStrong((id *)&self->_gestureModelVersion, 0);
}

@end
