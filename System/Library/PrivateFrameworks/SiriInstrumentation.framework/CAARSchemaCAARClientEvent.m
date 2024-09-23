@implementation CAARSchemaCAARClientEvent

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

  -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caarId");
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
  -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
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
  -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
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

  -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caarId");
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
    LODWORD(v9) = 30;
  }
  else
  {
LABEL_5:
    -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
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
      -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
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
  v22.super_class = (Class)CAARSchemaCAARClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CAARSchemaCAARClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[CAARSchemaCAARClientEvent caarRequestContext](self, "caarRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CAARSchemaCAARClientEvent deleteCaarRequestContext](self, "deleteCaarRequestContext");
  -[CAARSchemaCAARClientEvent featuresGenerated](self, "featuresGenerated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CAARSchemaCAARClientEvent deleteFeaturesGenerated](self, "deleteFeaturesGenerated");
  -[CAARSchemaCAARClientEvent modelExecuted](self, "modelExecuted");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CAARSchemaCAARClientEvent deleteModelExecuted](self, "deleteModelExecuted");
  -[CAARSchemaCAARClientEvent tieBreakersExecuted](self, "tieBreakersExecuted");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CAARSchemaCAARClientEvent deleteTieBreakersExecuted](self, "deleteTieBreakersExecuted");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[CAARSchemaCAARClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 3)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5628F20[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 3)
    return 0;
  else
    return off_1E5628F40[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[CAARSchemaCAARClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 3)
    return CFSTR("com.apple.aiml.siri.caar.CAARClientEvent");
  else
    return off_1E562B918[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[CAARSchemaCAARClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setCaarRequestContext:(id)a3
{
  CAARSchemaCAARRequestContext *v4;
  CAARSchemaCAARFeaturesGenerated *featuresGenerated;
  CAARSchemaCAARModelExecuted *modelExecuted;
  CAARSchemaCAARTieBreakersExecuted *tieBreakersExecuted;
  unint64_t v8;
  CAARSchemaCAARRequestContext *caarRequestContext;

  v4 = (CAARSchemaCAARRequestContext *)a3;
  featuresGenerated = self->_featuresGenerated;
  self->_featuresGenerated = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  tieBreakersExecuted = self->_tieBreakersExecuted;
  self->_tieBreakersExecuted = 0;

  v8 = 101;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  caarRequestContext = self->_caarRequestContext;
  self->_caarRequestContext = v4;

}

- (CAARSchemaCAARRequestContext)caarRequestContext
{
  if (self->_whichEvent_Type == 101)
    return self->_caarRequestContext;
  else
    return (CAARSchemaCAARRequestContext *)0;
}

- (void)deleteCaarRequestContext
{
  CAARSchemaCAARRequestContext *caarRequestContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    caarRequestContext = self->_caarRequestContext;
    self->_caarRequestContext = 0;

  }
}

- (void)setFeaturesGenerated:(id)a3
{
  CAARSchemaCAARFeaturesGenerated *v4;
  CAARSchemaCAARRequestContext *caarRequestContext;
  CAARSchemaCAARModelExecuted *modelExecuted;
  CAARSchemaCAARTieBreakersExecuted *tieBreakersExecuted;
  unint64_t v8;
  CAARSchemaCAARFeaturesGenerated *featuresGenerated;

  v4 = (CAARSchemaCAARFeaturesGenerated *)a3;
  caarRequestContext = self->_caarRequestContext;
  self->_caarRequestContext = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  tieBreakersExecuted = self->_tieBreakersExecuted;
  self->_tieBreakersExecuted = 0;

  v8 = 102;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  featuresGenerated = self->_featuresGenerated;
  self->_featuresGenerated = v4;

}

- (CAARSchemaCAARFeaturesGenerated)featuresGenerated
{
  if (self->_whichEvent_Type == 102)
    return self->_featuresGenerated;
  else
    return (CAARSchemaCAARFeaturesGenerated *)0;
}

- (void)deleteFeaturesGenerated
{
  CAARSchemaCAARFeaturesGenerated *featuresGenerated;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    featuresGenerated = self->_featuresGenerated;
    self->_featuresGenerated = 0;

  }
}

- (void)setModelExecuted:(id)a3
{
  CAARSchemaCAARModelExecuted *v4;
  CAARSchemaCAARRequestContext *caarRequestContext;
  CAARSchemaCAARFeaturesGenerated *featuresGenerated;
  CAARSchemaCAARTieBreakersExecuted *tieBreakersExecuted;
  unint64_t v8;
  CAARSchemaCAARModelExecuted *modelExecuted;

  v4 = (CAARSchemaCAARModelExecuted *)a3;
  caarRequestContext = self->_caarRequestContext;
  self->_caarRequestContext = 0;

  featuresGenerated = self->_featuresGenerated;
  self->_featuresGenerated = 0;

  tieBreakersExecuted = self->_tieBreakersExecuted;
  self->_tieBreakersExecuted = 0;

  v8 = 103;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = v4;

}

- (CAARSchemaCAARModelExecuted)modelExecuted
{
  if (self->_whichEvent_Type == 103)
    return self->_modelExecuted;
  else
    return (CAARSchemaCAARModelExecuted *)0;
}

- (void)deleteModelExecuted
{
  CAARSchemaCAARModelExecuted *modelExecuted;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    modelExecuted = self->_modelExecuted;
    self->_modelExecuted = 0;

  }
}

- (void)setTieBreakersExecuted:(id)a3
{
  CAARSchemaCAARTieBreakersExecuted *v4;
  CAARSchemaCAARRequestContext *caarRequestContext;
  CAARSchemaCAARFeaturesGenerated *featuresGenerated;
  CAARSchemaCAARModelExecuted *modelExecuted;
  unint64_t v8;
  CAARSchemaCAARTieBreakersExecuted *tieBreakersExecuted;

  v4 = (CAARSchemaCAARTieBreakersExecuted *)a3;
  caarRequestContext = self->_caarRequestContext;
  self->_caarRequestContext = 0;

  featuresGenerated = self->_featuresGenerated;
  self->_featuresGenerated = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  v8 = 104;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  tieBreakersExecuted = self->_tieBreakersExecuted;
  self->_tieBreakersExecuted = v4;

}

- (CAARSchemaCAARTieBreakersExecuted)tieBreakersExecuted
{
  if (self->_whichEvent_Type == 104)
    return self->_tieBreakersExecuted;
  else
    return (CAARSchemaCAARTieBreakersExecuted *)0;
}

- (void)deleteTieBreakersExecuted
{
  CAARSchemaCAARTieBreakersExecuted *tieBreakersExecuted;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    tieBreakersExecuted = self->_tieBreakersExecuted;
    self->_tieBreakersExecuted = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARClientEventReadFrom(self, (uint64_t)a3);
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
  -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAARSchemaCAARClientEvent caarRequestContext](self, "caarRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAARSchemaCAARClientEvent caarRequestContext](self, "caarRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAARSchemaCAARClientEvent featuresGenerated](self, "featuresGenerated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAARSchemaCAARClientEvent featuresGenerated](self, "featuresGenerated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAARSchemaCAARClientEvent modelExecuted](self, "modelExecuted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CAARSchemaCAARClientEvent modelExecuted](self, "modelExecuted");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAARSchemaCAARClientEvent tieBreakersExecuted](self, "tieBreakersExecuted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CAARSchemaCAARClientEvent tieBreakersExecuted](self, "tieBreakersExecuted");
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
  -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
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
  -[CAARSchemaCAARClientEvent caarRequestContext](self, "caarRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caarRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CAARSchemaCAARClientEvent caarRequestContext](self, "caarRequestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CAARSchemaCAARClientEvent caarRequestContext](self, "caarRequestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caarRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[CAARSchemaCAARClientEvent featuresGenerated](self, "featuresGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featuresGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CAARSchemaCAARClientEvent featuresGenerated](self, "featuresGenerated");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CAARSchemaCAARClientEvent featuresGenerated](self, "featuresGenerated");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featuresGenerated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[CAARSchemaCAARClientEvent modelExecuted](self, "modelExecuted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelExecuted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CAARSchemaCAARClientEvent modelExecuted](self, "modelExecuted");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[CAARSchemaCAARClientEvent modelExecuted](self, "modelExecuted");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelExecuted");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[CAARSchemaCAARClientEvent tieBreakersExecuted](self, "tieBreakersExecuted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tieBreakersExecuted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CAARSchemaCAARClientEvent tieBreakersExecuted](self, "tieBreakersExecuted");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[CAARSchemaCAARClientEvent tieBreakersExecuted](self, "tieBreakersExecuted");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tieBreakersExecuted");
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

  v3 = -[CAARSchemaCAARClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[CAARSchemaCAARRequestContext hash](self->_caarRequestContext, "hash") ^ v3;
  v5 = -[CAARSchemaCAARFeaturesGenerated hash](self->_featuresGenerated, "hash");
  v6 = v4 ^ v5 ^ -[CAARSchemaCAARModelExecuted hash](self->_modelExecuted, "hash");
  return v6 ^ -[CAARSchemaCAARTieBreakersExecuted hash](self->_tieBreakersExecuted, "hash");
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
  if (self->_caarRequestContext)
  {
    -[CAARSchemaCAARClientEvent caarRequestContext](self, "caarRequestContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("caarRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("caarRequestContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[CAARSchemaCAARClientEvent eventMetadata](self, "eventMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eventMetadata"));

    }
  }
  if (self->_featuresGenerated)
  {
    -[CAARSchemaCAARClientEvent featuresGenerated](self, "featuresGenerated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("featuresGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("featuresGenerated"));

    }
  }
  if (self->_modelExecuted)
  {
    -[CAARSchemaCAARClientEvent modelExecuted](self, "modelExecuted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("modelExecuted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("modelExecuted"));

    }
  }
  if (self->_tieBreakersExecuted)
  {
    -[CAARSchemaCAARClientEvent tieBreakersExecuted](self, "tieBreakersExecuted");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("tieBreakersExecuted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("tieBreakersExecuted"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARClientEvent)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARClientEvent *v5;
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
    self = -[CAARSchemaCAARClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARClientEvent)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARClientEvent *v5;
  void *v6;
  CAARSchemaCAARClientEventMetadata *v7;
  void *v8;
  CAARSchemaCAARRequestContext *v9;
  void *v10;
  CAARSchemaCAARFeaturesGenerated *v11;
  void *v12;
  CAARSchemaCAARModelExecuted *v13;
  void *v14;
  CAARSchemaCAARTieBreakersExecuted *v15;
  CAARSchemaCAARClientEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAARSchemaCAARClientEvent;
  v5 = -[CAARSchemaCAARClientEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CAARSchemaCAARClientEventMetadata initWithDictionary:]([CAARSchemaCAARClientEventMetadata alloc], "initWithDictionary:", v6);
      -[CAARSchemaCAARClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("caarRequestContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CAARSchemaCAARRequestContext initWithDictionary:]([CAARSchemaCAARRequestContext alloc], "initWithDictionary:", v8);
      -[CAARSchemaCAARClientEvent setCaarRequestContext:](v5, "setCaarRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("featuresGenerated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CAARSchemaCAARFeaturesGenerated initWithDictionary:]([CAARSchemaCAARFeaturesGenerated alloc], "initWithDictionary:", v10);
      -[CAARSchemaCAARClientEvent setFeaturesGenerated:](v5, "setFeaturesGenerated:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelExecuted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[CAARSchemaCAARModelExecuted initWithDictionary:]([CAARSchemaCAARModelExecuted alloc], "initWithDictionary:", v12);
      -[CAARSchemaCAARClientEvent setModelExecuted:](v5, "setModelExecuted:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tieBreakersExecuted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[CAARSchemaCAARTieBreakersExecuted initWithDictionary:]([CAARSchemaCAARTieBreakersExecuted alloc], "initWithDictionary:", v14);
      -[CAARSchemaCAARClientEvent setTieBreakersExecuted:](v5, "setTieBreakersExecuted:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CAARSchemaCAARClientEventMetadata)eventMetadata
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

- (BOOL)hasCaarRequestContext
{
  return self->_hasCaarRequestContext;
}

- (void)setHasCaarRequestContext:(BOOL)a3
{
  self->_hasCaarRequestContext = a3;
}

- (BOOL)hasFeaturesGenerated
{
  return self->_hasFeaturesGenerated;
}

- (void)setHasFeaturesGenerated:(BOOL)a3
{
  self->_hasFeaturesGenerated = a3;
}

- (BOOL)hasModelExecuted
{
  return self->_hasModelExecuted;
}

- (void)setHasModelExecuted:(BOOL)a3
{
  self->_hasModelExecuted = a3;
}

- (BOOL)hasTieBreakersExecuted
{
  return self->_hasTieBreakersExecuted;
}

- (void)setHasTieBreakersExecuted:(BOOL)a3
{
  self->_hasTieBreakersExecuted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tieBreakersExecuted, 0);
  objc_storeStrong((id *)&self->_modelExecuted, 0);
  objc_storeStrong((id *)&self->_featuresGenerated, 0);
  objc_storeStrong((id *)&self->_caarRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 58;
}

@end
