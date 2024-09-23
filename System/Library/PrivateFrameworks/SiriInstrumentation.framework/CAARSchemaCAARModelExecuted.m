@implementation CAARSchemaCAARModelExecuted

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
  v16.super_class = (Class)CAARSchemaCAARModelExecuted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAARSchemaCAARModelExecuted asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CAARSchemaCAARModelExecuted deleteAsset](self, "deleteAsset");
  -[CAARSchemaCAARModelExecuted modelOutput](self, "modelOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CAARSchemaCAARModelExecuted deleteModelOutput](self, "deleteModelOutput");
  -[CAARSchemaCAARModelExecuted trialEnrollment](self, "trialEnrollment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CAARSchemaCAARModelExecuted deleteTrialEnrollment](self, "deleteTrialEnrollment");

  return v5;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (void)deleteAsset
{
  -[CAARSchemaCAARModelExecuted setAsset:](self, "setAsset:", 0);
}

- (void)setIsShadowLog:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isShadowLog = a3;
}

- (BOOL)hasIsShadowLog
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsShadowLog:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsShadowLog
{
  -[CAARSchemaCAARModelExecuted setIsShadowLog:](self, "setIsShadowLog:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasModelOutput
{
  return self->_modelOutput != 0;
}

- (void)deleteModelOutput
{
  -[CAARSchemaCAARModelExecuted setModelOutput:](self, "setModelOutput:", 0);
}

- (BOOL)hasTrialEnrollment
{
  return self->_trialEnrollment != 0;
}

- (void)deleteTrialEnrollment
{
  -[CAARSchemaCAARModelExecuted setTrialEnrollment:](self, "setTrialEnrollment:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARModelExecutedReadFrom(self, (uint64_t)a3);
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
  -[CAARSchemaCAARModelExecuted asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAARSchemaCAARModelExecuted asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[CAARSchemaCAARModelExecuted modelOutput](self, "modelOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAARSchemaCAARModelExecuted modelOutput](self, "modelOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAARSchemaCAARModelExecuted trialEnrollment](self, "trialEnrollment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[CAARSchemaCAARModelExecuted trialEnrollment](self, "trialEnrollment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
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
  int isShadowLog;
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
  -[CAARSchemaCAARModelExecuted asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[CAARSchemaCAARModelExecuted asset](self, "asset");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CAARSchemaCAARModelExecuted asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isShadowLog = self->_isShadowLog;
    if (isShadowLog != objc_msgSend(v4, "isShadowLog"))
      goto LABEL_20;
  }
  -[CAARSchemaCAARModelExecuted modelOutput](self, "modelOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[CAARSchemaCAARModelExecuted modelOutput](self, "modelOutput");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CAARSchemaCAARModelExecuted modelOutput](self, "modelOutput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelOutput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[CAARSchemaCAARModelExecuted trialEnrollment](self, "trialEnrollment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trialEnrollment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[CAARSchemaCAARModelExecuted trialEnrollment](self, "trialEnrollment");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[CAARSchemaCAARModelExecuted trialEnrollment](self, "trialEnrollment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trialEnrollment");
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
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[SISchemaAsset hash](self->_asset, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isShadowLog;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[CAARSchemaCAARModelOutput hash](self->_modelOutput, "hash");
  return v5 ^ v6 ^ -[CAARSchemaCAARTrialEnrollment hash](self->_trialEnrollment, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_asset)
  {
    -[CAARSchemaCAARModelExecuted asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asset"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asset"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARModelExecuted isShadowLog](self, "isShadowLog"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isShadowLog"));

  }
  if (self->_modelOutput)
  {
    -[CAARSchemaCAARModelExecuted modelOutput](self, "modelOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("modelOutput"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("modelOutput"));

    }
  }
  if (self->_trialEnrollment)
  {
    -[CAARSchemaCAARModelExecuted trialEnrollment](self, "trialEnrollment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("trialEnrollment"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("trialEnrollment"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARModelExecuted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARModelExecuted)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARModelExecuted *v5;
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
    self = -[CAARSchemaCAARModelExecuted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARModelExecuted)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARModelExecuted *v5;
  void *v6;
  SISchemaAsset *v7;
  void *v8;
  void *v9;
  CAARSchemaCAARModelOutput *v10;
  void *v11;
  CAARSchemaCAARTrialEnrollment *v12;
  CAARSchemaCAARModelExecuted *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAARSchemaCAARModelExecuted;
  v5 = -[CAARSchemaCAARModelExecuted init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v6);
      -[CAARSchemaCAARModelExecuted setAsset:](v5, "setAsset:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShadowLog"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARModelExecuted setIsShadowLog:](v5, "setIsShadowLog:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelOutput"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[CAARSchemaCAARModelOutput initWithDictionary:]([CAARSchemaCAARModelOutput alloc], "initWithDictionary:", v9);
      -[CAARSchemaCAARModelExecuted setModelOutput:](v5, "setModelOutput:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialEnrollment"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[CAARSchemaCAARTrialEnrollment initWithDictionary:]([CAARSchemaCAARTrialEnrollment alloc], "initWithDictionary:", v11);
      -[CAARSchemaCAARModelExecuted setTrialEnrollment:](v5, "setTrialEnrollment:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (SISchemaAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (BOOL)isShadowLog
{
  return self->_isShadowLog;
}

- (CAARSchemaCAARModelOutput)modelOutput
{
  return self->_modelOutput;
}

- (void)setModelOutput:(id)a3
{
  objc_storeStrong((id *)&self->_modelOutput, a3);
}

- (CAARSchemaCAARTrialEnrollment)trialEnrollment
{
  return self->_trialEnrollment;
}

- (void)setTrialEnrollment:(id)a3
{
  objc_storeStrong((id *)&self->_trialEnrollment, a3);
}

- (void)setHasAsset:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasModelOutput:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTrialEnrollment:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialEnrollment, 0);
  objc_storeStrong((id *)&self->_modelOutput, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
