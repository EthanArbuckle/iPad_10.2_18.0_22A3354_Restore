@implementation EXPSiriSchemaEXPSiriServerEvent

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
  v13.super_class = (Class)EXPSiriSchemaEXPSiriServerEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSiriSchemaEXPSiriServerEvent experimentTriggered](self, "experimentTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[EXPSiriSchemaEXPSiriServerEvent deleteExperimentTriggered](self, "deleteExperimentTriggered");
  -[EXPSiriSchemaEXPSiriServerEvent counterfactualTriggered](self, "counterfactualTriggered");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[EXPSiriSchemaEXPSiriServerEvent deleteCounterfactualTriggered](self, "deleteCounterfactualTriggered");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[EXPSiriSchemaEXPSiriServerEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 101)
  {
    v4 = &OBJC_IVAR___EXPSiriSchemaEXPSiriServerEvent__experimentTriggered;
  }
  else
  {
    if (v3 != 102)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___EXPSiriSchemaEXPSiriServerEvent__counterfactualTriggered;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("counterfactualTriggered");
  if (a3 != 102)
    v3 = 0;
  if (a3 == 101)
    return CFSTR("experimentTriggered");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[EXPSiriSchemaEXPSiriServerEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.exp.siri.EXPSiriServerEvent");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.exp.siri.EXPSiriServerEvent.EXPServerCounterfactualTriggeredTier1");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.exp.siri.EXPSiriServerEvent.EXPServerExperimentTriggeredTier1");
  else
    return (id)v3;
}

- (void)setExperimentTriggered:(id)a3
{
  EXPSiriSchemaEXPServerExperimentTriggeredTier1 *v4;
  EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *counterfactualTriggered;
  unint64_t v6;
  EXPSiriSchemaEXPServerExperimentTriggeredTier1 *experimentTriggered;

  v4 = (EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)a3;
  counterfactualTriggered = self->_counterfactualTriggered;
  self->_counterfactualTriggered = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = v4;

}

- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)experimentTriggered
{
  if (self->_whichEvent_Type == 101)
    return self->_experimentTriggered;
  else
    return (EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)0;
}

- (void)deleteExperimentTriggered
{
  EXPSiriSchemaEXPServerExperimentTriggeredTier1 *experimentTriggered;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    experimentTriggered = self->_experimentTriggered;
    self->_experimentTriggered = 0;

  }
}

- (void)setCounterfactualTriggered:(id)a3
{
  EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *v4;
  EXPSiriSchemaEXPServerExperimentTriggeredTier1 *experimentTriggered;
  unint64_t v6;
  EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *counterfactualTriggered;

  v4 = (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)a3;
  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  counterfactualTriggered = self->_counterfactualTriggered;
  self->_counterfactualTriggered = v4;

}

- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)counterfactualTriggered
{
  if (self->_whichEvent_Type == 102)
    return self->_counterfactualTriggered;
  else
    return (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)0;
}

- (void)deleteCounterfactualTriggered
{
  EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *counterfactualTriggered;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    counterfactualTriggered = self->_counterfactualTriggered;
    self->_counterfactualTriggered = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSiriSchemaEXPSiriServerEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EXPSiriSchemaEXPSiriServerEvent experimentTriggered](self, "experimentTriggered");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EXPSiriSchemaEXPSiriServerEvent experimentTriggered](self, "experimentTriggered");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[EXPSiriSchemaEXPSiriServerEvent counterfactualTriggered](self, "counterfactualTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EXPSiriSchemaEXPSiriServerEvent counterfactualTriggered](self, "counterfactualTriggered");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_13;
  -[EXPSiriSchemaEXPSiriServerEvent experimentTriggered](self, "experimentTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[EXPSiriSchemaEXPSiriServerEvent experimentTriggered](self, "experimentTriggered");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[EXPSiriSchemaEXPSiriServerEvent experimentTriggered](self, "experimentTriggered");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentTriggered");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPSiriServerEvent counterfactualTriggered](self, "counterfactualTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "counterfactualTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[EXPSiriSchemaEXPSiriServerEvent counterfactualTriggered](self, "counterfactualTriggered");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[EXPSiriSchemaEXPSiriServerEvent counterfactualTriggered](self, "counterfactualTriggered");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "counterfactualTriggered");
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

  v3 = -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 hash](self->_experimentTriggered, "hash");
  return -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 hash](self->_counterfactualTriggered, "hash") ^ v3;
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
  if (self->_counterfactualTriggered)
  {
    -[EXPSiriSchemaEXPSiriServerEvent counterfactualTriggered](self, "counterfactualTriggered");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("counterfactualTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("counterfactualTriggered"));

    }
  }
  if (self->_experimentTriggered)
  {
    -[EXPSiriSchemaEXPSiriServerEvent experimentTriggered](self, "experimentTriggered");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("experimentTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("experimentTriggered"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSiriSchemaEXPSiriServerEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSiriSchemaEXPSiriServerEvent)initWithJSON:(id)a3
{
  void *v4;
  EXPSiriSchemaEXPSiriServerEvent *v5;
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
    self = -[EXPSiriSchemaEXPSiriServerEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSiriSchemaEXPSiriServerEvent)initWithDictionary:(id)a3
{
  id v4;
  EXPSiriSchemaEXPSiriServerEvent *v5;
  void *v6;
  EXPSiriSchemaEXPServerExperimentTriggeredTier1 *v7;
  void *v8;
  EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *v9;
  EXPSiriSchemaEXPSiriServerEvent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EXPSiriSchemaEXPSiriServerEvent;
  v5 = -[EXPSiriSchemaEXPSiriServerEvent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentTriggered"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 initWithDictionary:]([EXPSiriSchemaEXPServerExperimentTriggeredTier1 alloc], "initWithDictionary:", v6);
      -[EXPSiriSchemaEXPSiriServerEvent setExperimentTriggered:](v5, "setExperimentTriggered:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("counterfactualTriggered"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 initWithDictionary:]([EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 alloc], "initWithDictionary:", v8);
      -[EXPSiriSchemaEXPSiriServerEvent setCounterfactualTriggered:](v5, "setCounterfactualTriggered:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (BOOL)hasExperimentTriggered
{
  return self->_hasExperimentTriggered;
}

- (void)setHasExperimentTriggered:(BOOL)a3
{
  self->_hasExperimentTriggered = a3;
}

- (BOOL)hasCounterfactualTriggered
{
  return self->_hasCounterfactualTriggered;
}

- (void)setHasCounterfactualTriggered:(BOOL)a3
{
  self->_hasCounterfactualTriggered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterfactualTriggered, 0);
  objc_storeStrong((id *)&self->_experimentTriggered, 0);
}

- (int)getAnyEventType
{
  return 51;
}

@end
