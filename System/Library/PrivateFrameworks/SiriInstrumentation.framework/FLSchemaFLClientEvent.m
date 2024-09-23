@implementation FLSchemaFLClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[FLSchemaFLClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 1;
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
  v16.super_class = (Class)FLSchemaFLClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLSchemaFLClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[FLSchemaFLClientEvent evaluationContext](self, "evaluationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLSchemaFLClientEvent deleteEvaluationContext](self, "deleteEvaluationContext");
  -[FLSchemaFLClientEvent donationContext](self, "donationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLSchemaFLClientEvent deleteDonationContext](self, "deleteDonationContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[FLSchemaFLClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 101)
  {
    v4 = &OBJC_IVAR___FLSchemaFLClientEvent__evaluationContext;
  }
  else
  {
    if (v3 != 102)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___FLSchemaFLClientEvent__donationContext;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("donationContext");
  if (a3 != 102)
    v3 = 0;
  if (a3 == 101)
    return CFSTR("evaluationContext");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[FLSchemaFLClientEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.siri.fl.FLClientEvent");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.siri.fl.FLClientEvent.FLInteractionDonationContext");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.siri.fl.FLClientEvent.FLActionEvaluationContext");
  else
    return (id)v3;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[FLSchemaFLClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setEvaluationContext:(id)a3
{
  FLSchemaFLActionEvaluationContext *v4;
  FLSchemaFLInteractionDonationContext *donationContext;
  unint64_t v6;
  FLSchemaFLActionEvaluationContext *evaluationContext;

  v4 = (FLSchemaFLActionEvaluationContext *)a3;
  donationContext = self->_donationContext;
  self->_donationContext = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  evaluationContext = self->_evaluationContext;
  self->_evaluationContext = v4;

}

- (FLSchemaFLActionEvaluationContext)evaluationContext
{
  if (self->_whichEvent_Type == 101)
    return self->_evaluationContext;
  else
    return (FLSchemaFLActionEvaluationContext *)0;
}

- (void)deleteEvaluationContext
{
  FLSchemaFLActionEvaluationContext *evaluationContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    evaluationContext = self->_evaluationContext;
    self->_evaluationContext = 0;

  }
}

- (void)setDonationContext:(id)a3
{
  FLSchemaFLInteractionDonationContext *v4;
  FLSchemaFLActionEvaluationContext *evaluationContext;
  unint64_t v6;
  FLSchemaFLInteractionDonationContext *donationContext;

  v4 = (FLSchemaFLInteractionDonationContext *)a3;
  evaluationContext = self->_evaluationContext;
  self->_evaluationContext = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  donationContext = self->_donationContext;
  self->_donationContext = v4;

}

- (FLSchemaFLInteractionDonationContext)donationContext
{
  if (self->_whichEvent_Type == 102)
    return self->_donationContext;
  else
    return (FLSchemaFLInteractionDonationContext *)0;
}

- (void)deleteDonationContext
{
  FLSchemaFLInteractionDonationContext *donationContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    donationContext = self->_donationContext;
    self->_donationContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLClientEventReadFrom(self, (uint64_t)a3);
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
  -[FLSchemaFLClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLSchemaFLClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLSchemaFLClientEvent evaluationContext](self, "evaluationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLSchemaFLClientEvent evaluationContext](self, "evaluationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLSchemaFLClientEvent donationContext](self, "donationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FLSchemaFLClientEvent donationContext](self, "donationContext");
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
  -[FLSchemaFLClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[FLSchemaFLClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLSchemaFLClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[FLSchemaFLClientEvent evaluationContext](self, "evaluationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evaluationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[FLSchemaFLClientEvent evaluationContext](self, "evaluationContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[FLSchemaFLClientEvent evaluationContext](self, "evaluationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evaluationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[FLSchemaFLClientEvent donationContext](self, "donationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "donationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLSchemaFLClientEvent donationContext](self, "donationContext");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[FLSchemaFLClientEvent donationContext](self, "donationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "donationContext");
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

  v3 = -[FLSchemaFLClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[FLSchemaFLActionEvaluationContext hash](self->_evaluationContext, "hash") ^ v3;
  return v4 ^ -[FLSchemaFLInteractionDonationContext hash](self->_donationContext, "hash");
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
  if (self->_donationContext)
  {
    -[FLSchemaFLClientEvent donationContext](self, "donationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("donationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("donationContext"));

    }
  }
  if (self->_evaluationContext)
  {
    -[FLSchemaFLClientEvent evaluationContext](self, "evaluationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("evaluationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("evaluationContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[FLSchemaFLClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("eventMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLSchemaFLClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLSchemaFLClientEvent)initWithJSON:(id)a3
{
  void *v4;
  FLSchemaFLClientEvent *v5;
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
    self = -[FLSchemaFLClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLSchemaFLClientEvent)initWithDictionary:(id)a3
{
  id v4;
  FLSchemaFLClientEvent *v5;
  void *v6;
  FLSchemaFLClientEventMetadata *v7;
  void *v8;
  FLSchemaFLActionEvaluationContext *v9;
  void *v10;
  FLSchemaFLInteractionDonationContext *v11;
  FLSchemaFLClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLSchemaFLClientEvent;
  v5 = -[FLSchemaFLClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLSchemaFLClientEventMetadata initWithDictionary:]([FLSchemaFLClientEventMetadata alloc], "initWithDictionary:", v6);
      -[FLSchemaFLClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLSchemaFLActionEvaluationContext initWithDictionary:]([FLSchemaFLActionEvaluationContext alloc], "initWithDictionary:", v8);
      -[FLSchemaFLClientEvent setEvaluationContext:](v5, "setEvaluationContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("donationContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[FLSchemaFLInteractionDonationContext initWithDictionary:]([FLSchemaFLInteractionDonationContext alloc], "initWithDictionary:", v10);
      -[FLSchemaFLClientEvent setDonationContext:](v5, "setDonationContext:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (FLSchemaFLClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasEvaluationContext
{
  return self->_hasEvaluationContext;
}

- (void)setHasEvaluationContext:(BOOL)a3
{
  self->_hasEvaluationContext = a3;
}

- (BOOL)hasDonationContext
{
  return self->_hasDonationContext;
}

- (void)setHasDonationContext:(BOOL)a3
{
  self->_hasDonationContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationContext, 0);
  objc_storeStrong((id *)&self->_evaluationContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 101;
}

@end
