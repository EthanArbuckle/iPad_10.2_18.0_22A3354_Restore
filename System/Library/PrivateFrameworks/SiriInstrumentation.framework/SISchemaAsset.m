@implementation SISchemaAsset

- (void)setTrialNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (void)setAssetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAssetLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_assetLocale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_trialNamespace, 0);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaAsset trialNamespace](self, "trialNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaAsset assetName](self, "assetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaAsset assetVersion](self, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaAsset assetVersion](self, "assetVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (SISchemaVersion)assetVersion
{
  return self->_assetVersion;
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (NSString)assetName
{
  return self->_assetName;
}

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
  v9.super_class = (Class)SISchemaAsset;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaAsset assetVersion](self, "assetVersion", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaAsset deleteAssetVersion](self, "deleteAssetVersion");
  return v5;
}

- (BOOL)hasTrialNamespace
{
  return self->_trialNamespace != 0;
}

- (void)deleteTrialNamespace
{
  -[SISchemaAsset setTrialNamespace:](self, "setTrialNamespace:", 0);
}

- (BOOL)hasAssetName
{
  return self->_assetName != 0;
}

- (void)deleteAssetName
{
  -[SISchemaAsset setAssetName:](self, "setAssetName:", 0);
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)deleteAssetVersion
{
  -[SISchemaAsset setAssetVersion:](self, "setAssetVersion:", 0);
}

- (BOOL)hasAssetLocale
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAssetLocale:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAssetLocale
{
  -[SISchemaAsset setAssetLocale:](self, "setAssetLocale:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAssetReadFrom(self, (uint64_t)a3);
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
  BOOL v22;
  int assetLocale;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[SISchemaAsset trialNamespace](self, "trialNamespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trialNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaAsset trialNamespace](self, "trialNamespace");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaAsset trialNamespace](self, "trialNamespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trialNamespace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaAsset assetName](self, "assetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaAsset assetName](self, "assetName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaAsset assetName](self, "assetName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaAsset assetVersion](self, "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[SISchemaAsset assetVersion](self, "assetVersion");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaAsset assetVersion](self, "assetVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (assetLocale = self->_assetLocale, assetLocale == objc_msgSend(v4, "assetLocale")))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_trialNamespace, "hash");
  v4 = -[NSString hash](self->_assetName, "hash");
  v5 = -[SISchemaVersion hash](self->_assetVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_assetLocale;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[SISchemaAsset assetLocale](self, "assetLocale") - 1;
    if (v4 > 0x3D)
      v5 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v5 = off_1E56341F0[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetLocale"));
  }
  if (self->_assetName)
  {
    -[SISchemaAsset assetName](self, "assetName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("assetName"));

  }
  if (self->_assetVersion)
  {
    -[SISchemaAsset assetVersion](self, "assetVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("assetVersion"));

    }
  }
  if (self->_trialNamespace)
  {
    -[SISchemaAsset trialNamespace](self, "trialNamespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("trialNamespace"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaAsset dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaAsset)initWithJSON:(id)a3
{
  void *v4;
  SISchemaAsset *v5;
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
    self = -[SISchemaAsset initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaAsset)initWithDictionary:(id)a3
{
  id v4;
  SISchemaAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaVersion *v11;
  void *v12;
  SISchemaAsset *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISchemaAsset;
  v5 = -[SISchemaAsset init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialNamespace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaAsset setTrialNamespace:](v5, "setTrialNamespace:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaAsset setAssetName:](v5, "setAssetName:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v10);
      -[SISchemaAsset setAssetVersion:](v5, "setAssetVersion:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAsset setAssetLocale:](v5, "setAssetLocale:", objc_msgSend(v12, "intValue"));
    v13 = v5;

  }
  return v5;
}

- (int)assetLocale
{
  return self->_assetLocale;
}

- (void)setHasTrialNamespace:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAssetName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

@end
