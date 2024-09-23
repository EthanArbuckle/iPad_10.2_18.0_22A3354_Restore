@implementation NLRouterSchemaNLRouterClientEvent

- (id)getComponentId
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nlRouterId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        goto LABEL_8;
    }
  }
  -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v10, "value");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v4 = v10;
LABEL_8:
      v11 = v4;
      v10 = v11;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nlRouterId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = 42;
  }
  else
  {
LABEL_5:
    -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "value");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v11, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v14, "length") != 0;

      }
      else
      {
        v9 = 0;
      }
      v4 = v11;
    }
    else
    {
      v9 = 0;
      v4 = 0;
    }
  }

  return v9;
}

+ (int)joinability
{
  return 2;
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
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NLRouterSchemaNLRouterClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterSubComponentTriggeredHeuristicRuleTier1](self, "deleteNlRouterSubComponentTriggeredHeuristicRuleTier1");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterSubComponentTriggeredHeuristicRuleTier1](self, "deleteNlRouterSubComponentTriggeredHeuristicRuleTier1");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterSubComponentTriggeredHeuristicRuleTier1](self, "deleteNlRouterSubComponentTriggeredHeuristicRuleTier1");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterSubComponentTriggeredHeuristicRuleTier1](self, "deleteNlRouterSubComponentTriggeredHeuristicRuleTier1");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterSubComponentTriggeredHeuristicRuleTier1](self, "deleteNlRouterSubComponentTriggeredHeuristicRuleTier1");
  -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLRouterSchemaNLRouterClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[NLRouterSchemaNLRouterClientEvent nlRouterHandleContext](self, "nlRouterHandleContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterHandleContext](self, "deleteNlRouterHandleContext");
  -[NLRouterSchemaNLRouterClientEvent nlRouterBridgeHandleContext](self, "nlRouterBridgeHandleContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterBridgeHandleContext](self, "deleteNlRouterBridgeHandleContext");
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentHandleContext](self, "nlRouterSubComponentHandleContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterSubComponentHandleContext](self, "deleteNlRouterSubComponentHandleContext");
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentSetupContext](self, "nlRouterSubComponentSetupContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterSubComponentSetupContext](self, "deleteNlRouterSubComponentSetupContext");
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentTriggeredHeuristicRuleTier1](self, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[NLRouterSchemaNLRouterClientEvent deleteNlRouterSubComponentTriggeredHeuristicRuleTier1](self, "deleteNlRouterSubComponentTriggeredHeuristicRuleTier1");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[NLRouterSchemaNLRouterClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 4)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629FF8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4)
    return 0;
  else
    return off_1E562A020[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[NLRouterSchemaNLRouterClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 4)
    return CFSTR("com.apple.aiml.siri.nlrouter.NLRouterClientEvent");
  else
    return off_1E563C320[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[NLRouterSchemaNLRouterClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setNlRouterHandleContext:(id)a3
{
  NLRouterSchemaNLRouterHandleContext *v4;
  NLRouterSchemaNLRouterBridgeHandleContext *nlRouterBridgeHandleContext;
  NLRouterSchemaNLRouterSubComponentHandleContext *nlRouterSubComponentHandleContext;
  NLRouterSchemaNLRouterSubComponentSetupContext *nlRouterSubComponentSetupContext;
  NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *nlRouterSubComponentTriggeredHeuristicRuleTier1;
  unint64_t v9;
  NLRouterSchemaNLRouterHandleContext *nlRouterHandleContext;

  v4 = (NLRouterSchemaNLRouterHandleContext *)a3;
  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  v9 = 101;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = v4;

}

- (NLRouterSchemaNLRouterHandleContext)nlRouterHandleContext
{
  if (self->_whichEvent_Type == 101)
    return self->_nlRouterHandleContext;
  else
    return (NLRouterSchemaNLRouterHandleContext *)0;
}

- (void)deleteNlRouterHandleContext
{
  NLRouterSchemaNLRouterHandleContext *nlRouterHandleContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    nlRouterHandleContext = self->_nlRouterHandleContext;
    self->_nlRouterHandleContext = 0;

  }
}

- (void)setNlRouterBridgeHandleContext:(id)a3
{
  NLRouterSchemaNLRouterBridgeHandleContext *v4;
  NLRouterSchemaNLRouterHandleContext *nlRouterHandleContext;
  NLRouterSchemaNLRouterSubComponentHandleContext *nlRouterSubComponentHandleContext;
  NLRouterSchemaNLRouterSubComponentSetupContext *nlRouterSubComponentSetupContext;
  NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *nlRouterSubComponentTriggeredHeuristicRuleTier1;
  unint64_t v9;
  NLRouterSchemaNLRouterBridgeHandleContext *nlRouterBridgeHandleContext;

  v4 = (NLRouterSchemaNLRouterBridgeHandleContext *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  v9 = 102;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = v4;

}

- (NLRouterSchemaNLRouterBridgeHandleContext)nlRouterBridgeHandleContext
{
  if (self->_whichEvent_Type == 102)
    return self->_nlRouterBridgeHandleContext;
  else
    return (NLRouterSchemaNLRouterBridgeHandleContext *)0;
}

- (void)deleteNlRouterBridgeHandleContext
{
  NLRouterSchemaNLRouterBridgeHandleContext *nlRouterBridgeHandleContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
    self->_nlRouterBridgeHandleContext = 0;

  }
}

- (void)setNlRouterSubComponentHandleContext:(id)a3
{
  NLRouterSchemaNLRouterSubComponentHandleContext *v4;
  NLRouterSchemaNLRouterHandleContext *nlRouterHandleContext;
  NLRouterSchemaNLRouterBridgeHandleContext *nlRouterBridgeHandleContext;
  NLRouterSchemaNLRouterSubComponentSetupContext *nlRouterSubComponentSetupContext;
  NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *nlRouterSubComponentTriggeredHeuristicRuleTier1;
  unint64_t v9;
  NLRouterSchemaNLRouterSubComponentHandleContext *nlRouterSubComponentHandleContext;

  v4 = (NLRouterSchemaNLRouterSubComponentHandleContext *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  v9 = 103;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = v4;

}

- (NLRouterSchemaNLRouterSubComponentHandleContext)nlRouterSubComponentHandleContext
{
  if (self->_whichEvent_Type == 103)
    return self->_nlRouterSubComponentHandleContext;
  else
    return (NLRouterSchemaNLRouterSubComponentHandleContext *)0;
}

- (void)deleteNlRouterSubComponentHandleContext
{
  NLRouterSchemaNLRouterSubComponentHandleContext *nlRouterSubComponentHandleContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
    self->_nlRouterSubComponentHandleContext = 0;

  }
}

- (void)setNlRouterSubComponentSetupContext:(id)a3
{
  NLRouterSchemaNLRouterSubComponentSetupContext *v4;
  NLRouterSchemaNLRouterHandleContext *nlRouterHandleContext;
  NLRouterSchemaNLRouterBridgeHandleContext *nlRouterBridgeHandleContext;
  NLRouterSchemaNLRouterSubComponentHandleContext *nlRouterSubComponentHandleContext;
  NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *nlRouterSubComponentTriggeredHeuristicRuleTier1;
  unint64_t v9;
  NLRouterSchemaNLRouterSubComponentSetupContext *nlRouterSubComponentSetupContext;

  v4 = (NLRouterSchemaNLRouterSubComponentSetupContext *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  v9 = 104;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = v4;

}

- (NLRouterSchemaNLRouterSubComponentSetupContext)nlRouterSubComponentSetupContext
{
  if (self->_whichEvent_Type == 104)
    return self->_nlRouterSubComponentSetupContext;
  else
    return (NLRouterSchemaNLRouterSubComponentSetupContext *)0;
}

- (void)deleteNlRouterSubComponentSetupContext
{
  NLRouterSchemaNLRouterSubComponentSetupContext *nlRouterSubComponentSetupContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
    self->_nlRouterSubComponentSetupContext = 0;

  }
}

- (void)setNlRouterSubComponentTriggeredHeuristicRuleTier1:(id)a3
{
  NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *v4;
  NLRouterSchemaNLRouterHandleContext *nlRouterHandleContext;
  NLRouterSchemaNLRouterBridgeHandleContext *nlRouterBridgeHandleContext;
  NLRouterSchemaNLRouterSubComponentHandleContext *nlRouterSubComponentHandleContext;
  NLRouterSchemaNLRouterSubComponentSetupContext *nlRouterSubComponentSetupContext;
  unint64_t v9;
  NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *nlRouterSubComponentTriggeredHeuristicRuleTier1;

  v4 = (NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  v9 = 105;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = v4;

}

- (NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1)nlRouterSubComponentTriggeredHeuristicRuleTier1
{
  if (self->_whichEvent_Type == 105)
    return self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  else
    return (NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *)0;
}

- (void)deleteNlRouterSubComponentTriggeredHeuristicRuleTier1
{
  NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *nlRouterSubComponentTriggeredHeuristicRuleTier1;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
    self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterClientEventReadFrom(self, (uint64_t)a3);
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterHandleContext](self, "nlRouterHandleContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterHandleContext](self, "nlRouterHandleContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterBridgeHandleContext](self, "nlRouterBridgeHandleContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterBridgeHandleContext](self, "nlRouterBridgeHandleContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentHandleContext](self, "nlRouterSubComponentHandleContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentHandleContext](self, "nlRouterSubComponentHandleContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentSetupContext](self, "nlRouterSubComponentSetupContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentSetupContext](self, "nlRouterSubComponentSetupContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentTriggeredHeuristicRuleTier1](self, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentTriggeredHeuristicRuleTier1](self, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_33;
  -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_33;
  }
  else
  {

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterHandleContext](self, "nlRouterHandleContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlRouterHandleContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[NLRouterSchemaNLRouterClientEvent nlRouterHandleContext](self, "nlRouterHandleContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NLRouterSchemaNLRouterClientEvent nlRouterHandleContext](self, "nlRouterHandleContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlRouterHandleContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_33;
  }
  else
  {

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterBridgeHandleContext](self, "nlRouterBridgeHandleContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlRouterBridgeHandleContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[NLRouterSchemaNLRouterClientEvent nlRouterBridgeHandleContext](self, "nlRouterBridgeHandleContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NLRouterSchemaNLRouterClientEvent nlRouterBridgeHandleContext](self, "nlRouterBridgeHandleContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlRouterBridgeHandleContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_33;
  }
  else
  {

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentHandleContext](self, "nlRouterSubComponentHandleContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlRouterSubComponentHandleContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentHandleContext](self, "nlRouterSubComponentHandleContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentHandleContext](self, "nlRouterSubComponentHandleContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlRouterSubComponentHandleContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_33;
  }
  else
  {

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentSetupContext](self, "nlRouterSubComponentSetupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlRouterSubComponentSetupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentSetupContext](self, "nlRouterSubComponentSetupContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentSetupContext](self, "nlRouterSubComponentSetupContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlRouterSubComponentSetupContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_33;
  }
  else
  {

  }
  -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentTriggeredHeuristicRuleTier1](self, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentTriggeredHeuristicRuleTier1](self, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_36:
      v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentTriggeredHeuristicRuleTier1](self, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_36;
  }
  else
  {
LABEL_32:

  }
LABEL_33:
  v38 = 0;
LABEL_34:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NLRouterSchemaNLRouterClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[NLRouterSchemaNLRouterHandleContext hash](self->_nlRouterHandleContext, "hash") ^ v3;
  v5 = -[NLRouterSchemaNLRouterBridgeHandleContext hash](self->_nlRouterBridgeHandleContext, "hash");
  v6 = v4 ^ v5 ^ -[NLRouterSchemaNLRouterSubComponentHandleContext hash](self->_nlRouterSubComponentHandleContext, "hash");
  v7 = -[NLRouterSchemaNLRouterSubComponentSetupContext hash](self->_nlRouterSubComponentSetupContext, "hash");
  return v6 ^ v7 ^ -[NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 hash](self->_nlRouterSubComponentTriggeredHeuristicRuleTier1, "hash");
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[NLRouterSchemaNLRouterClientEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_nlRouterBridgeHandleContext)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterBridgeHandleContext](self, "nlRouterBridgeHandleContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nlRouterBridgeHandleContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("nlRouterBridgeHandleContext"));

    }
  }
  if (self->_nlRouterHandleContext)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterHandleContext](self, "nlRouterHandleContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("nlRouterHandleContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("nlRouterHandleContext"));

    }
  }
  if (self->_nlRouterSubComponentHandleContext)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentHandleContext](self, "nlRouterSubComponentHandleContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("nlRouterSubComponentHandleContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("nlRouterSubComponentHandleContext"));

    }
  }
  if (self->_nlRouterSubComponentSetupContext)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentSetupContext](self, "nlRouterSubComponentSetupContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("nlRouterSubComponentSetupContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("nlRouterSubComponentSetupContext"));

    }
  }
  if (self->_nlRouterSubComponentTriggeredHeuristicRuleTier1)
  {
    -[NLRouterSchemaNLRouterClientEvent nlRouterSubComponentTriggeredHeuristicRuleTier1](self, "nlRouterSubComponentTriggeredHeuristicRuleTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("nlRouterSubComponentTriggeredHeuristicRuleTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("nlRouterSubComponentTriggeredHeuristicRuleTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLRouterSchemaNLRouterClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLRouterSchemaNLRouterClientEvent)initWithJSON:(id)a3
{
  void *v4;
  NLRouterSchemaNLRouterClientEvent *v5;
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
    self = -[NLRouterSchemaNLRouterClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLRouterSchemaNLRouterClientEvent)initWithDictionary:(id)a3
{
  id v4;
  NLRouterSchemaNLRouterClientEvent *v5;
  void *v6;
  NLRouterSchemaNLRouterClientEventMetadata *v7;
  void *v8;
  NLRouterSchemaNLRouterHandleContext *v9;
  void *v10;
  NLRouterSchemaNLRouterBridgeHandleContext *v11;
  void *v12;
  NLRouterSchemaNLRouterSubComponentHandleContext *v13;
  void *v14;
  NLRouterSchemaNLRouterSubComponentSetupContext *v15;
  void *v16;
  NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *v17;
  NLRouterSchemaNLRouterClientEvent *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NLRouterSchemaNLRouterClientEvent;
  v5 = -[NLRouterSchemaNLRouterClientEvent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NLRouterSchemaNLRouterClientEventMetadata initWithDictionary:]([NLRouterSchemaNLRouterClientEventMetadata alloc], "initWithDictionary:", v6);
      -[NLRouterSchemaNLRouterClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterHandleContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NLRouterSchemaNLRouterHandleContext initWithDictionary:]([NLRouterSchemaNLRouterHandleContext alloc], "initWithDictionary:", v8);
      -[NLRouterSchemaNLRouterClientEvent setNlRouterHandleContext:](v5, "setNlRouterHandleContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterBridgeHandleContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NLRouterSchemaNLRouterBridgeHandleContext initWithDictionary:]([NLRouterSchemaNLRouterBridgeHandleContext alloc], "initWithDictionary:", v10);
      -[NLRouterSchemaNLRouterClientEvent setNlRouterBridgeHandleContext:](v5, "setNlRouterBridgeHandleContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterSubComponentHandleContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[NLRouterSchemaNLRouterSubComponentHandleContext initWithDictionary:]([NLRouterSchemaNLRouterSubComponentHandleContext alloc], "initWithDictionary:", v12);
      -[NLRouterSchemaNLRouterClientEvent setNlRouterSubComponentHandleContext:](v5, "setNlRouterSubComponentHandleContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterSubComponentSetupContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NLRouterSchemaNLRouterSubComponentSetupContext initWithDictionary:]([NLRouterSchemaNLRouterSubComponentSetupContext alloc], "initWithDictionary:", v14);
      -[NLRouterSchemaNLRouterClientEvent setNlRouterSubComponentSetupContext:](v5, "setNlRouterSubComponentSetupContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterSubComponentTriggeredHeuristicRuleTier1"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 initWithDictionary:]([NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 alloc], "initWithDictionary:", v16);
      -[NLRouterSchemaNLRouterClientEvent setNlRouterSubComponentTriggeredHeuristicRuleTier1:](v5, "setNlRouterSubComponentTriggeredHeuristicRuleTier1:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (NLRouterSchemaNLRouterClientEventMetadata)eventMetadata
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

- (BOOL)hasNlRouterHandleContext
{
  return self->_hasNlRouterHandleContext;
}

- (void)setHasNlRouterHandleContext:(BOOL)a3
{
  self->_hasNlRouterHandleContext = a3;
}

- (BOOL)hasNlRouterBridgeHandleContext
{
  return self->_hasNlRouterBridgeHandleContext;
}

- (void)setHasNlRouterBridgeHandleContext:(BOOL)a3
{
  self->_hasNlRouterBridgeHandleContext = a3;
}

- (BOOL)hasNlRouterSubComponentHandleContext
{
  return self->_hasNlRouterSubComponentHandleContext;
}

- (void)setHasNlRouterSubComponentHandleContext:(BOOL)a3
{
  self->_hasNlRouterSubComponentHandleContext = a3;
}

- (BOOL)hasNlRouterSubComponentSetupContext
{
  return self->_hasNlRouterSubComponentSetupContext;
}

- (void)setHasNlRouterSubComponentSetupContext:(BOOL)a3
{
  self->_hasNlRouterSubComponentSetupContext = a3;
}

- (BOOL)hasNlRouterSubComponentTriggeredHeuristicRuleTier1
{
  return self->_hasNlRouterSubComponentTriggeredHeuristicRuleTier1;
}

- (void)setHasNlRouterSubComponentTriggeredHeuristicRuleTier1:(BOOL)a3
{
  self->_hasNlRouterSubComponentTriggeredHeuristicRuleTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlRouterSubComponentTriggeredHeuristicRuleTier1, 0);
  objc_storeStrong((id *)&self->_nlRouterSubComponentSetupContext, 0);
  objc_storeStrong((id *)&self->_nlRouterSubComponentHandleContext, 0);
  objc_storeStrong((id *)&self->_nlRouterBridgeHandleContext, 0);
  objc_storeStrong((id *)&self->_nlRouterHandleContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 85;
}

@end
