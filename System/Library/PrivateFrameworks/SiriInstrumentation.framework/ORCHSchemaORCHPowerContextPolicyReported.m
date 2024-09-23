@implementation ORCHSchemaORCHPowerContextPolicyReported

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORCHSchemaORCHPowerContextPolicyReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHPowerContextPolicyReported powerContextPolicies](self, "powerContextPolicies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHPowerContextPolicyReported deletePowerContextPolicies](self, "deletePowerContextPolicies");
  -[ORCHSchemaORCHPowerContextPolicyReported visionPowerState](self, "visionPowerState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHPowerContextPolicyReported deleteVisionPowerState](self, "deleteVisionPowerState");

  return v5;
}

- (BOOL)hasPowerContextPolicies
{
  return self->_powerContextPolicies != 0;
}

- (void)deletePowerContextPolicies
{
  -[ORCHSchemaORCHPowerContextPolicyReported setPowerContextPolicies:](self, "setPowerContextPolicies:", 0);
}

- (void)setVisionPowerState:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichPlatformspecificpowerstates = v3;
  objc_storeStrong((id *)&self->_visionPowerState, a3);
}

- (ORCHSchemaORCHVisionPowerState)visionPowerState
{
  if (self->_whichPlatformspecificpowerstates == 101)
    return self->_visionPowerState;
  else
    return (ORCHSchemaORCHVisionPowerState *)0;
}

- (void)deleteVisionPowerState
{
  ORCHSchemaORCHVisionPowerState *visionPowerState;

  if (self->_whichPlatformspecificpowerstates == 101)
  {
    self->_whichPlatformspecificpowerstates = 0;
    visionPowerState = self->_visionPowerState;
    self->_visionPowerState = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHPowerContextPolicyReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ORCHSchemaORCHPowerContextPolicyReported powerContextPolicies](self, "powerContextPolicies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHPowerContextPolicyReported powerContextPolicies](self, "powerContextPolicies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHPowerContextPolicyReported visionPowerState](self, "visionPowerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHPowerContextPolicyReported visionPowerState](self, "visionPowerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichPlatformspecificpowerstates;
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
    goto LABEL_13;
  whichPlatformspecificpowerstates = self->_whichPlatformspecificpowerstates;
  if (whichPlatformspecificpowerstates != objc_msgSend(v4, "whichPlatformspecificpowerstates"))
    goto LABEL_13;
  -[ORCHSchemaORCHPowerContextPolicyReported powerContextPolicies](self, "powerContextPolicies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "powerContextPolicies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[ORCHSchemaORCHPowerContextPolicyReported powerContextPolicies](self, "powerContextPolicies");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHPowerContextPolicyReported powerContextPolicies](self, "powerContextPolicies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "powerContextPolicies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[ORCHSchemaORCHPowerContextPolicyReported visionPowerState](self, "visionPowerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visionPowerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ORCHSchemaORCHPowerContextPolicyReported visionPowerState](self, "visionPowerState");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[ORCHSchemaORCHPowerContextPolicyReported visionPowerState](self, "visionPowerState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visionPowerState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[ORCHSchemaORCHPowerContextPolicies hash](self->_powerContextPolicies, "hash");
  return -[ORCHSchemaORCHVisionPowerState hash](self->_visionPowerState, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_powerContextPolicies)
  {
    -[ORCHSchemaORCHPowerContextPolicyReported powerContextPolicies](self, "powerContextPolicies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("powerContextPolicies"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("powerContextPolicies"));

    }
  }
  if (self->_visionPowerState)
  {
    -[ORCHSchemaORCHPowerContextPolicyReported visionPowerState](self, "visionPowerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("visionPowerState"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("visionPowerState"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHPowerContextPolicyReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHPowerContextPolicyReported)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHPowerContextPolicyReported *v5;
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
    self = -[ORCHSchemaORCHPowerContextPolicyReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHPowerContextPolicyReported)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHPowerContextPolicyReported *v5;
  void *v6;
  ORCHSchemaORCHPowerContextPolicies *v7;
  void *v8;
  ORCHSchemaORCHVisionPowerState *v9;
  ORCHSchemaORCHPowerContextPolicyReported *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ORCHSchemaORCHPowerContextPolicyReported;
  v5 = -[ORCHSchemaORCHPowerContextPolicyReported init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("powerContextPolicies"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ORCHSchemaORCHPowerContextPolicies initWithDictionary:]([ORCHSchemaORCHPowerContextPolicies alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHPowerContextPolicyReported setPowerContextPolicies:](v5, "setPowerContextPolicies:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visionPowerState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ORCHSchemaORCHVisionPowerState initWithDictionary:]([ORCHSchemaORCHVisionPowerState alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHPowerContextPolicyReported setVisionPowerState:](v5, "setVisionPowerState:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichPlatformspecificpowerstates
{
  return self->_whichPlatformspecificpowerstates;
}

- (ORCHSchemaORCHPowerContextPolicies)powerContextPolicies
{
  return self->_powerContextPolicies;
}

- (void)setPowerContextPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_powerContextPolicies, a3);
}

- (void)setHasPowerContextPolicies:(BOOL)a3
{
  self->_hasPowerContextPolicies = a3;
}

- (BOOL)hasVisionPowerState
{
  return self->_hasVisionPowerState;
}

- (void)setHasVisionPowerState:(BOOL)a3
{
  self->_hasVisionPowerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionPowerState, 0);
  objc_storeStrong((id *)&self->_powerContextPolicies, 0);
}

@end
