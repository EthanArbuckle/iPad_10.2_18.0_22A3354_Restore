@implementation CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted classifierModelAsset](self, "classifierModelAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted deleteClassifierModelAsset](self, "deleteClassifierModelAsset");
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted deleteNlv4AssetVersion](self, "deleteNlv4AssetVersion");
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted deleteNlv4AssetVersionOverride](self, "deleteNlv4AssetVersionOverride");

  return v5;
}

- (void)setClassifierModelType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_classifierModelType = a3;
}

- (BOOL)hasClassifierModelType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasClassifierModelType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteClassifierModelType
{
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setClassifierModelType:](self, "setClassifierModelType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasClassifierModelAsset
{
  return self->_classifierModelAsset != 0;
}

- (void)deleteClassifierModelAsset
{
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setClassifierModelAsset:](self, "setClassifierModelAsset:", 0);
}

- (BOOL)hasNlv4AssetVersion
{
  return self->_nlv4AssetVersion != 0;
}

- (void)deleteNlv4AssetVersion
{
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setNlv4AssetVersion:](self, "setNlv4AssetVersion:", 0);
}

- (BOOL)hasNlv4AssetVersionOverride
{
  return self->_nlv4AssetVersionOverride != 0;
}

- (void)deleteNlv4AssetVersionOverride
{
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setNlv4AssetVersionOverride:](self, "setNlv4AssetVersionOverride:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCurareAppIntentTaskClassificationStartedReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted classifierModelAsset](self, "classifierModelAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted classifierModelAsset](self, "classifierModelAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int classifierModelType;
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
    classifierModelType = self->_classifierModelType;
    if (classifierModelType != objc_msgSend(v4, "classifierModelType"))
      goto LABEL_20;
  }
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted classifierModelAsset](self, "classifierModelAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classifierModelAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted classifierModelAsset](self, "classifierModelAsset");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted classifierModelAsset](self, "classifierModelAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "classifierModelAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv4AssetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlv4AssetVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv4AssetVersionOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlv4AssetVersionOverride");
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
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_classifierModelType;
  else
    v3 = 0;
  v4 = -[SISchemaAsset hash](self->_classifierModelAsset, "hash") ^ v3;
  v5 = -[SISchemaAsset hash](self->_nlv4AssetVersion, "hash");
  return v4 ^ v5 ^ -[SISchemaAsset hash](self->_nlv4AssetVersionOverride, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_classifierModelAsset)
  {
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted classifierModelAsset](self, "classifierModelAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("classifierModelAsset"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("classifierModelAsset"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted classifierModelType](self, "classifierModelType");
    v8 = CFSTR("CLPAPPINTENTCLASSIFIERMODELTYPE_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("CLPAPPINTENTCLASSIFIERMODELTYPE_SIMPLE_HEURISTIC_HARDCODED");
    if (v7 == 2)
      v9 = CFSTR("CLPAPPINTENTCLASSIFIERMODELTYPE_COREML");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("classifierModelType"));
  }
  if (self->_nlv4AssetVersion)
  {
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("nlv4AssetVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("nlv4AssetVersion"));

    }
  }
  if (self->_nlv4AssetVersionOverride)
  {
    -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("nlv4AssetVersionOverride"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("nlv4AssetVersionOverride"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *v5;
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
    self = -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *v5;
  void *v6;
  void *v7;
  SISchemaAsset *v8;
  void *v9;
  SISchemaAsset *v10;
  void *v11;
  SISchemaAsset *v12;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted;
  v5 = -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classifierModelType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setClassifierModelType:](v5, "setClassifierModelType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classifierModelAsset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v7);
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setClassifierModelAsset:](v5, "setClassifierModelAsset:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlv4AssetVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v9);
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setNlv4AssetVersion:](v5, "setNlv4AssetVersion:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlv4AssetVersionOverride"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v11);
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setNlv4AssetVersionOverride:](v5, "setNlv4AssetVersionOverride:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (int)classifierModelType
{
  return self->_classifierModelType;
}

- (SISchemaAsset)classifierModelAsset
{
  return self->_classifierModelAsset;
}

- (void)setClassifierModelAsset:(id)a3
{
  objc_storeStrong((id *)&self->_classifierModelAsset, a3);
}

- (SISchemaAsset)nlv4AssetVersion
{
  return self->_nlv4AssetVersion;
}

- (void)setNlv4AssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_nlv4AssetVersion, a3);
}

- (SISchemaAsset)nlv4AssetVersionOverride
{
  return self->_nlv4AssetVersionOverride;
}

- (void)setNlv4AssetVersionOverride:(id)a3
{
  objc_storeStrong((id *)&self->_nlv4AssetVersionOverride, a3);
}

- (void)setHasClassifierModelAsset:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasNlv4AssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasNlv4AssetVersionOverride:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlv4AssetVersionOverride, 0);
  objc_storeStrong((id *)&self->_nlv4AssetVersion, 0);
  objc_storeStrong((id *)&self->_classifierModelAsset, 0);
}

@end
