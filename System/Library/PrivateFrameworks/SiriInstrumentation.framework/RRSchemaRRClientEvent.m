@implementation RRSchemaRRClientEvent

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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rrID");
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
        goto LABEL_11;
    }
  }
  -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "value");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v4 = v10;
LABEL_11:
        v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "value");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
      goto LABEL_11;
    goto LABEL_12;
  }
LABEL_13:

  return v16;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rrID");
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
    LODWORD(v9) = 15;
  }
  else
  {
LABEL_5:
    -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_9;
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
    v13 = (void *)v12;
    objc_msgSend(v11, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subRequestId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v4, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (v18)
            LODWORD(v9) = 43;
          else
            LODWORD(v9) = 0;
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
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
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RRSchemaRRClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[RRSchemaRRClientEvent deleteRrUsoGraphTier1](self, "deleteRrUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[RRSchemaRRClientEvent deleteRrUsoGraphTier1](self, "deleteRrUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[RRSchemaRRClientEvent deleteRrUsoGraphTier1](self, "deleteRrUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[RRSchemaRRClientEvent deleteRrUsoGraphTier1](self, "deleteRrUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[RRSchemaRRClientEvent deleteRrUsoGraphTier1](self, "deleteRrUsoGraphTier1");
  -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RRSchemaRRClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[RRSchemaRRClientEvent entityPoolReturned](self, "entityPoolReturned");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RRSchemaRRClientEvent deleteEntityPoolReturned](self, "deleteEntityPoolReturned");
  -[RRSchemaRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[RRSchemaRRClientEvent deleteEntityPoolResolveContext](self, "deleteEntityPoolResolveContext");
  -[RRSchemaRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[RRSchemaRRClientEvent deleteRrUsoGraphTier1](self, "deleteRrUsoGraphTier1");
  -[RRSchemaRRClientEvent pullerContext](self, "pullerContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[RRSchemaRRClientEvent deletePullerContext](self, "deletePullerContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[RRSchemaRRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 3)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AC28[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 3)
    return 0;
  else
    return off_1E562AC48[a3 - 2];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[RRSchemaRRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 3)
    return CFSTR("com.apple.aiml.siri.rr.RRClientEvent");
  else
    return off_1E5633718[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[RRSchemaRRClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setEntityPoolReturned:(id)a3
{
  RRSchemaRREntityPoolReturned *v4;
  RRSchemaRREntityPoolResolveContext *entityPoolResolveContext;
  RRSchemaRRUsoGraphTier1 *rrUsoGraphTier1;
  RRSchemaRRPullerContext *pullerContext;
  RRSchemaRREntityPoolReturned *entityPoolReturned;

  v4 = (RRSchemaRREntityPoolReturned *)a3;
  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = v4;

}

- (RRSchemaRREntityPoolReturned)entityPoolReturned
{
  if (self->_whichEvent_Type == 2)
    return self->_entityPoolReturned;
  else
    return (RRSchemaRREntityPoolReturned *)0;
}

- (void)deleteEntityPoolReturned
{
  RRSchemaRREntityPoolReturned *entityPoolReturned;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    entityPoolReturned = self->_entityPoolReturned;
    self->_entityPoolReturned = 0;

  }
}

- (void)setEntityPoolResolveContext:(id)a3
{
  RRSchemaRREntityPoolResolveContext *v4;
  RRSchemaRREntityPoolReturned *entityPoolReturned;
  RRSchemaRRUsoGraphTier1 *rrUsoGraphTier1;
  RRSchemaRRPullerContext *pullerContext;
  unint64_t v8;
  RRSchemaRREntityPoolResolveContext *entityPoolResolveContext;

  v4 = (RRSchemaRREntityPoolResolveContext *)a3;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  v8 = 3;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = v4;

}

- (RRSchemaRREntityPoolResolveContext)entityPoolResolveContext
{
  if (self->_whichEvent_Type == 3)
    return self->_entityPoolResolveContext;
  else
    return (RRSchemaRREntityPoolResolveContext *)0;
}

- (void)deleteEntityPoolResolveContext
{
  RRSchemaRREntityPoolResolveContext *entityPoolResolveContext;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    entityPoolResolveContext = self->_entityPoolResolveContext;
    self->_entityPoolResolveContext = 0;

  }
}

- (void)setRrUsoGraphTier1:(id)a3
{
  RRSchemaRRUsoGraphTier1 *v4;
  RRSchemaRREntityPoolReturned *entityPoolReturned;
  RRSchemaRREntityPoolResolveContext *entityPoolResolveContext;
  RRSchemaRRPullerContext *pullerContext;
  RRSchemaRRUsoGraphTier1 *rrUsoGraphTier1;

  v4 = (RRSchemaRRUsoGraphTier1 *)a3;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = v4;

}

- (RRSchemaRRUsoGraphTier1)rrUsoGraphTier1
{
  if (self->_whichEvent_Type == 4)
    return self->_rrUsoGraphTier1;
  else
    return (RRSchemaRRUsoGraphTier1 *)0;
}

- (void)deleteRrUsoGraphTier1
{
  RRSchemaRRUsoGraphTier1 *rrUsoGraphTier1;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    rrUsoGraphTier1 = self->_rrUsoGraphTier1;
    self->_rrUsoGraphTier1 = 0;

  }
}

- (void)setPullerContext:(id)a3
{
  RRSchemaRRPullerContext *v4;
  RRSchemaRREntityPoolReturned *entityPoolReturned;
  RRSchemaRREntityPoolResolveContext *entityPoolResolveContext;
  RRSchemaRRUsoGraphTier1 *rrUsoGraphTier1;
  unint64_t v8;
  RRSchemaRRPullerContext *pullerContext;

  v4 = (RRSchemaRRPullerContext *)a3;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  v8 = 5;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  pullerContext = self->_pullerContext;
  self->_pullerContext = v4;

}

- (RRSchemaRRPullerContext)pullerContext
{
  if (self->_whichEvent_Type == 5)
    return self->_pullerContext;
  else
    return (RRSchemaRRPullerContext *)0;
}

- (void)deletePullerContext
{
  RRSchemaRRPullerContext *pullerContext;

  if (self->_whichEvent_Type == 5)
  {
    self->_whichEvent_Type = 0;
    pullerContext = self->_pullerContext;
    self->_pullerContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaRRClientEventReadFrom(self, (uint64_t)a3);
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
  id v14;

  v14 = a3;
  -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaRRClientEvent entityPoolReturned](self, "entityPoolReturned");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RRSchemaRRClientEvent entityPoolReturned](self, "entityPoolReturned");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RRSchemaRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RRSchemaRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaRRClientEvent pullerContext](self, "pullerContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RRSchemaRRClientEvent pullerContext](self, "pullerContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_28;
  -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[RRSchemaRRClientEvent entityPoolReturned](self, "entityPoolReturned");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityPoolReturned");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[RRSchemaRRClientEvent entityPoolReturned](self, "entityPoolReturned");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RRSchemaRRClientEvent entityPoolReturned](self, "entityPoolReturned");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityPoolReturned");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[RRSchemaRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityPoolResolveContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[RRSchemaRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[RRSchemaRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityPoolResolveContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[RRSchemaRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rrUsoGraphTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[RRSchemaRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[RRSchemaRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rrUsoGraphTier1");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[RRSchemaRRClientEvent pullerContext](self, "pullerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pullerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RRSchemaRRClientEvent pullerContext](self, "pullerContext");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[RRSchemaRRClientEvent pullerContext](self, "pullerContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pullerContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
LABEL_27:

  }
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[RRSchemaRRClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[RRSchemaRREntityPoolReturned hash](self->_entityPoolReturned, "hash") ^ v3;
  v5 = -[RRSchemaRREntityPoolResolveContext hash](self->_entityPoolResolveContext, "hash");
  v6 = v4 ^ v5 ^ -[RRSchemaRRUsoGraphTier1 hash](self->_rrUsoGraphTier1, "hash");
  return v6 ^ -[RRSchemaRRPullerContext hash](self->_pullerContext, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entityPoolResolveContext)
  {
    -[RRSchemaRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityPoolResolveContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entityPoolResolveContext"));

    }
  }
  if (self->_entityPoolReturned)
  {
    -[RRSchemaRRClientEvent entityPoolReturned](self, "entityPoolReturned");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entityPoolReturned"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityPoolReturned"));

    }
  }
  if (self->_eventMetadata)
  {
    -[RRSchemaRRClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_pullerContext)
  {
    -[RRSchemaRRClientEvent pullerContext](self, "pullerContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pullerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pullerContext"));

    }
  }
  if (self->_rrUsoGraphTier1)
  {
    -[RRSchemaRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rrUsoGraphTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("rrUsoGraphTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RRSchemaRRClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RRSchemaRRClientEvent)initWithJSON:(id)a3
{
  void *v4;
  RRSchemaRRClientEvent *v5;
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
    self = -[RRSchemaRRClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RRSchemaRRClientEvent)initWithDictionary:(id)a3
{
  id v4;
  RRSchemaRRClientEvent *v5;
  void *v6;
  RRSchemaRRClientEventMetadata *v7;
  void *v8;
  RRSchemaRREntityPoolReturned *v9;
  void *v10;
  RRSchemaRREntityPoolResolveContext *v11;
  void *v12;
  RRSchemaRRUsoGraphTier1 *v13;
  void *v14;
  RRSchemaRRPullerContext *v15;
  RRSchemaRRClientEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RRSchemaRRClientEvent;
  v5 = -[RRSchemaRRClientEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RRSchemaRRClientEventMetadata initWithDictionary:]([RRSchemaRRClientEventMetadata alloc], "initWithDictionary:", v6);
      -[RRSchemaRRClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPoolReturned"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RRSchemaRREntityPoolReturned initWithDictionary:]([RRSchemaRREntityPoolReturned alloc], "initWithDictionary:", v8);
      -[RRSchemaRRClientEvent setEntityPoolReturned:](v5, "setEntityPoolReturned:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPoolResolveContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RRSchemaRREntityPoolResolveContext initWithDictionary:]([RRSchemaRREntityPoolResolveContext alloc], "initWithDictionary:", v10);
      -[RRSchemaRRClientEvent setEntityPoolResolveContext:](v5, "setEntityPoolResolveContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rrUsoGraphTier1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[RRSchemaRRUsoGraphTier1 initWithDictionary:]([RRSchemaRRUsoGraphTier1 alloc], "initWithDictionary:", v12);
      -[RRSchemaRRClientEvent setRrUsoGraphTier1:](v5, "setRrUsoGraphTier1:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pullerContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[RRSchemaRRPullerContext initWithDictionary:]([RRSchemaRRPullerContext alloc], "initWithDictionary:", v14);
      -[RRSchemaRRClientEvent setPullerContext:](v5, "setPullerContext:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RRSchemaRRClientEventMetadata)eventMetadata
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

- (BOOL)hasEntityPoolReturned
{
  return self->_hasEntityPoolReturned;
}

- (void)setHasEntityPoolReturned:(BOOL)a3
{
  self->_hasEntityPoolReturned = a3;
}

- (BOOL)hasEntityPoolResolveContext
{
  return self->_hasEntityPoolResolveContext;
}

- (void)setHasEntityPoolResolveContext:(BOOL)a3
{
  self->_hasEntityPoolResolveContext = a3;
}

- (BOOL)hasRrUsoGraphTier1
{
  return self->_hasRrUsoGraphTier1;
}

- (void)setHasRrUsoGraphTier1:(BOOL)a3
{
  self->_hasRrUsoGraphTier1 = a3;
}

- (BOOL)hasPullerContext
{
  return self->_hasPullerContext;
}

- (void)setHasPullerContext:(BOOL)a3
{
  self->_hasPullerContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pullerContext, 0);
  objc_storeStrong((id *)&self->_rrUsoGraphTier1, 0);
  objc_storeStrong((id *)&self->_entityPoolResolveContext, 0);
  objc_storeStrong((id *)&self->_entityPoolReturned, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 26;
}

@end
