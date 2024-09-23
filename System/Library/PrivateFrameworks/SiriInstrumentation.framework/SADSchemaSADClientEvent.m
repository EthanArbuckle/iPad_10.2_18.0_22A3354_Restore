@implementation SADSchemaSADClientEvent

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
  v16.super_class = (Class)SADSchemaSADClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADSchemaSADClientEvent uodAssetsPrepared](self, "uodAssetsPrepared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SADSchemaSADClientEvent deleteUodAssetsPrepared](self, "deleteUodAssetsPrepared");
  -[SADSchemaSADClientEvent availableAssetDailyStatus](self, "availableAssetDailyStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SADSchemaSADClientEvent deleteAvailableAssetDailyStatus](self, "deleteAvailableAssetDailyStatus");
  -[SADSchemaSADClientEvent immediateDownloadTriggered](self, "immediateDownloadTriggered");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SADSchemaSADClientEvent deleteImmediateDownloadTriggered](self, "deleteImmediateDownloadTriggered");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[SADSchemaSADClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AD38[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2)
    return 0;
  else
    return off_1E562AD50[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[SADSchemaSADClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 2)
    return CFSTR("com.apple.aiml.siri.sad.SADClientEvent");
  else
    return off_1E5633960[v2 - 101];
}

- (void)setUodAssetsPrepared:(id)a3
{
  SADSchemaSADUODAssetsPrepared *v4;
  SADSchemaSADAvailableAssetDailyStatus *availableAssetDailyStatus;
  SADSchemaSADImmediateDownloadTriggered *immediateDownloadTriggered;
  unint64_t v7;
  SADSchemaSADUODAssetsPrepared *uodAssetsPrepared;

  v4 = (SADSchemaSADUODAssetsPrepared *)a3;
  availableAssetDailyStatus = self->_availableAssetDailyStatus;
  self->_availableAssetDailyStatus = 0;

  immediateDownloadTriggered = self->_immediateDownloadTriggered;
  self->_immediateDownloadTriggered = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  uodAssetsPrepared = self->_uodAssetsPrepared;
  self->_uodAssetsPrepared = v4;

}

- (SADSchemaSADUODAssetsPrepared)uodAssetsPrepared
{
  if (self->_whichEvent_Type == 101)
    return self->_uodAssetsPrepared;
  else
    return (SADSchemaSADUODAssetsPrepared *)0;
}

- (void)deleteUodAssetsPrepared
{
  SADSchemaSADUODAssetsPrepared *uodAssetsPrepared;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    uodAssetsPrepared = self->_uodAssetsPrepared;
    self->_uodAssetsPrepared = 0;

  }
}

- (void)setAvailableAssetDailyStatus:(id)a3
{
  SADSchemaSADAvailableAssetDailyStatus *v4;
  SADSchemaSADUODAssetsPrepared *uodAssetsPrepared;
  SADSchemaSADImmediateDownloadTriggered *immediateDownloadTriggered;
  unint64_t v7;
  SADSchemaSADAvailableAssetDailyStatus *availableAssetDailyStatus;

  v4 = (SADSchemaSADAvailableAssetDailyStatus *)a3;
  uodAssetsPrepared = self->_uodAssetsPrepared;
  self->_uodAssetsPrepared = 0;

  immediateDownloadTriggered = self->_immediateDownloadTriggered;
  self->_immediateDownloadTriggered = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  availableAssetDailyStatus = self->_availableAssetDailyStatus;
  self->_availableAssetDailyStatus = v4;

}

- (SADSchemaSADAvailableAssetDailyStatus)availableAssetDailyStatus
{
  if (self->_whichEvent_Type == 102)
    return self->_availableAssetDailyStatus;
  else
    return (SADSchemaSADAvailableAssetDailyStatus *)0;
}

- (void)deleteAvailableAssetDailyStatus
{
  SADSchemaSADAvailableAssetDailyStatus *availableAssetDailyStatus;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    availableAssetDailyStatus = self->_availableAssetDailyStatus;
    self->_availableAssetDailyStatus = 0;

  }
}

- (void)setImmediateDownloadTriggered:(id)a3
{
  SADSchemaSADImmediateDownloadTriggered *v4;
  SADSchemaSADUODAssetsPrepared *uodAssetsPrepared;
  SADSchemaSADAvailableAssetDailyStatus *availableAssetDailyStatus;
  unint64_t v7;
  SADSchemaSADImmediateDownloadTriggered *immediateDownloadTriggered;

  v4 = (SADSchemaSADImmediateDownloadTriggered *)a3;
  uodAssetsPrepared = self->_uodAssetsPrepared;
  self->_uodAssetsPrepared = 0;

  availableAssetDailyStatus = self->_availableAssetDailyStatus;
  self->_availableAssetDailyStatus = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  immediateDownloadTriggered = self->_immediateDownloadTriggered;
  self->_immediateDownloadTriggered = v4;

}

- (SADSchemaSADImmediateDownloadTriggered)immediateDownloadTriggered
{
  if (self->_whichEvent_Type == 103)
    return self->_immediateDownloadTriggered;
  else
    return (SADSchemaSADImmediateDownloadTriggered *)0;
}

- (void)deleteImmediateDownloadTriggered
{
  SADSchemaSADImmediateDownloadTriggered *immediateDownloadTriggered;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    immediateDownloadTriggered = self->_immediateDownloadTriggered;
    self->_immediateDownloadTriggered = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SADSchemaSADClientEvent uodAssetsPrepared](self, "uodAssetsPrepared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SADSchemaSADClientEvent uodAssetsPrepared](self, "uodAssetsPrepared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SADSchemaSADClientEvent availableAssetDailyStatus](self, "availableAssetDailyStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SADSchemaSADClientEvent availableAssetDailyStatus](self, "availableAssetDailyStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SADSchemaSADClientEvent immediateDownloadTriggered](self, "immediateDownloadTriggered");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SADSchemaSADClientEvent immediateDownloadTriggered](self, "immediateDownloadTriggered");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
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
    goto LABEL_18;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_18;
  -[SADSchemaSADClientEvent uodAssetsPrepared](self, "uodAssetsPrepared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uodAssetsPrepared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[SADSchemaSADClientEvent uodAssetsPrepared](self, "uodAssetsPrepared");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SADSchemaSADClientEvent uodAssetsPrepared](self, "uodAssetsPrepared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uodAssetsPrepared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[SADSchemaSADClientEvent availableAssetDailyStatus](self, "availableAssetDailyStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableAssetDailyStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[SADSchemaSADClientEvent availableAssetDailyStatus](self, "availableAssetDailyStatus");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SADSchemaSADClientEvent availableAssetDailyStatus](self, "availableAssetDailyStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableAssetDailyStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[SADSchemaSADClientEvent immediateDownloadTriggered](self, "immediateDownloadTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "immediateDownloadTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SADSchemaSADClientEvent immediateDownloadTriggered](self, "immediateDownloadTriggered");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[SADSchemaSADClientEvent immediateDownloadTriggered](self, "immediateDownloadTriggered");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "immediateDownloadTriggered");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SADSchemaSADUODAssetsPrepared hash](self->_uodAssetsPrepared, "hash");
  v4 = -[SADSchemaSADAvailableAssetDailyStatus hash](self->_availableAssetDailyStatus, "hash") ^ v3;
  return v4 ^ -[SADSchemaSADImmediateDownloadTriggered hash](self->_immediateDownloadTriggered, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_availableAssetDailyStatus)
  {
    -[SADSchemaSADClientEvent availableAssetDailyStatus](self, "availableAssetDailyStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("availableAssetDailyStatus"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("availableAssetDailyStatus"));

    }
  }
  if (self->_immediateDownloadTriggered)
  {
    -[SADSchemaSADClientEvent immediateDownloadTriggered](self, "immediateDownloadTriggered");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("immediateDownloadTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("immediateDownloadTriggered"));

    }
  }
  if (self->_uodAssetsPrepared)
  {
    -[SADSchemaSADClientEvent uodAssetsPrepared](self, "uodAssetsPrepared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("uodAssetsPrepared"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("uodAssetsPrepared"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SADSchemaSADClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SADSchemaSADClientEvent)initWithJSON:(id)a3
{
  void *v4;
  SADSchemaSADClientEvent *v5;
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
    self = -[SADSchemaSADClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SADSchemaSADClientEvent)initWithDictionary:(id)a3
{
  id v4;
  SADSchemaSADClientEvent *v5;
  void *v6;
  SADSchemaSADUODAssetsPrepared *v7;
  void *v8;
  SADSchemaSADAvailableAssetDailyStatus *v9;
  void *v10;
  SADSchemaSADImmediateDownloadTriggered *v11;
  SADSchemaSADClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SADSchemaSADClientEvent;
  v5 = -[SADSchemaSADClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uodAssetsPrepared"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SADSchemaSADUODAssetsPrepared initWithDictionary:]([SADSchemaSADUODAssetsPrepared alloc], "initWithDictionary:", v6);
      -[SADSchemaSADClientEvent setUodAssetsPrepared:](v5, "setUodAssetsPrepared:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availableAssetDailyStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SADSchemaSADAvailableAssetDailyStatus initWithDictionary:]([SADSchemaSADAvailableAssetDailyStatus alloc], "initWithDictionary:", v8);
      -[SADSchemaSADClientEvent setAvailableAssetDailyStatus:](v5, "setAvailableAssetDailyStatus:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("immediateDownloadTriggered"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SADSchemaSADImmediateDownloadTriggered initWithDictionary:]([SADSchemaSADImmediateDownloadTriggered alloc], "initWithDictionary:", v10);
      -[SADSchemaSADClientEvent setImmediateDownloadTriggered:](v5, "setImmediateDownloadTriggered:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (BOOL)hasUodAssetsPrepared
{
  return self->_hasUodAssetsPrepared;
}

- (void)setHasUodAssetsPrepared:(BOOL)a3
{
  self->_hasUodAssetsPrepared = a3;
}

- (BOOL)hasAvailableAssetDailyStatus
{
  return self->_hasAvailableAssetDailyStatus;
}

- (void)setHasAvailableAssetDailyStatus:(BOOL)a3
{
  self->_hasAvailableAssetDailyStatus = a3;
}

- (BOOL)hasImmediateDownloadTriggered
{
  return self->_hasImmediateDownloadTriggered;
}

- (void)setHasImmediateDownloadTriggered:(BOOL)a3
{
  self->_hasImmediateDownloadTriggered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immediateDownloadTriggered, 0);
  objc_storeStrong((id *)&self->_availableAssetDailyStatus, 0);
  objc_storeStrong((id *)&self->_uodAssetsPrepared, 0);
}

- (int)getAnyEventType
{
  return 33;
}

@end
