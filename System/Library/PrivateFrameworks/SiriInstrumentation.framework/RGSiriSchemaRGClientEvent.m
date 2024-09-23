@implementation RGSiriSchemaRGClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ifRequestId");
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

- (int)componentName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ifRequestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
        LODWORD(v4) = 45;
      else
        LODWORD(v4) = 0;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
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
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)RGSiriSchemaRGClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v37, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RGSiriSchemaRGClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[RGSiriSchemaRGClientEvent requestContext](self, "requestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RGSiriSchemaRGClientEvent deleteRequestContext](self, "deleteRequestContext");
  -[RGSiriSchemaRGClientEvent requestEndedTier1](self, "requestEndedTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[RGSiriSchemaRGClientEvent deleteRequestEndedTier1](self, "deleteRequestEndedTier1");
  -[RGSiriSchemaRGClientEvent overrideContext](self, "overrideContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[RGSiriSchemaRGClientEvent deleteOverrideContext](self, "deleteOverrideContext");
  -[RGSiriSchemaRGClientEvent validationContext](self, "validationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[RGSiriSchemaRGClientEvent deleteValidationContext](self, "deleteValidationContext");
  -[RGSiriSchemaRGClientEvent catalogContext](self, "catalogContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[RGSiriSchemaRGClientEvent deleteCatalogContext](self, "deleteCatalogContext");
  -[RGSiriSchemaRGClientEvent inferenceContext](self, "inferenceContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[RGSiriSchemaRGClientEvent deleteInferenceContext](self, "deleteInferenceContext");
  -[RGSiriSchemaRGClientEvent hallucinationDetectionContext](self, "hallucinationDetectionContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[RGSiriSchemaRGClientEvent deleteHallucinationDetectionContext](self, "deleteHallucinationDetectionContext");
  -[RGSiriSchemaRGClientEvent RGGMSCallContext](self, "RGGMSCallContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[RGSiriSchemaRGClientEvent deleteRGGMSCallContext](self, "deleteRGGMSCallContext");
  -[RGSiriSchemaRGClientEvent RGCacheManagerCallContext](self, "RGCacheManagerCallContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[RGSiriSchemaRGClientEvent deleteRGCacheManagerCallContext](self, "deleteRGCacheManagerCallContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[RGSiriSchemaRGClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 10 > 8)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AB98[v3 - 10]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 10 > 8)
    return 0;
  else
    return off_1E562ABE0[a3 - 10];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[RGSiriSchemaRGClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 10 > 8)
    return CFSTR("com.apple.aiml.siri.rg.RGClientEvent");
  else
    return off_1E563D6D8[v2 - 10];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[RGSiriSchemaRGClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setRequestContext:(id)a3
{
  RGSiriSchemaRGRequestContext *v4;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;
  RGSiriSchemaRGOverrideContext *overrideContext;
  RGSiriSchemaRGValidationContext *validationContext;
  RGSiriSchemaRGCatalogContext *catalogContext;
  RGSiriSchemaRGInferenceContext *inferenceContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;
  unint64_t v13;
  RGSiriSchemaRGRequestContext *requestContext;

  v4 = (RGSiriSchemaRGRequestContext *)a3;
  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  overrideContext = self->_overrideContext;
  self->_overrideContext = 0;

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  catalogContext = self->_catalogContext;
  self->_catalogContext = 0;

  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = 0;

  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = 0;

  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = 0;

  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = 0;

  v13 = 10;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  requestContext = self->_requestContext;
  self->_requestContext = v4;

}

- (RGSiriSchemaRGRequestContext)requestContext
{
  if (self->_whichEvent_Type == 10)
    return self->_requestContext;
  else
    return (RGSiriSchemaRGRequestContext *)0;
}

- (void)deleteRequestContext
{
  RGSiriSchemaRGRequestContext *requestContext;

  if (self->_whichEvent_Type == 10)
  {
    self->_whichEvent_Type = 0;
    requestContext = self->_requestContext;
    self->_requestContext = 0;

  }
}

- (void)setRequestEndedTier1:(id)a3
{
  RGSiriSchemaRGRequestEndedTier1 *v4;
  RGSiriSchemaRGRequestContext *requestContext;
  RGSiriSchemaRGOverrideContext *overrideContext;
  RGSiriSchemaRGValidationContext *validationContext;
  RGSiriSchemaRGCatalogContext *catalogContext;
  RGSiriSchemaRGInferenceContext *inferenceContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;
  unint64_t v13;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;

  v4 = (RGSiriSchemaRGRequestEndedTier1 *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  overrideContext = self->_overrideContext;
  self->_overrideContext = 0;

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  catalogContext = self->_catalogContext;
  self->_catalogContext = 0;

  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = 0;

  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = 0;

  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = 0;

  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = 0;

  v13 = 11;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = v4;

}

- (RGSiriSchemaRGRequestEndedTier1)requestEndedTier1
{
  if (self->_whichEvent_Type == 11)
    return self->_requestEndedTier1;
  else
    return (RGSiriSchemaRGRequestEndedTier1 *)0;
}

- (void)deleteRequestEndedTier1
{
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;

  if (self->_whichEvent_Type == 11)
  {
    self->_whichEvent_Type = 0;
    requestEndedTier1 = self->_requestEndedTier1;
    self->_requestEndedTier1 = 0;

  }
}

- (void)setOverrideContext:(id)a3
{
  RGSiriSchemaRGOverrideContext *v4;
  RGSiriSchemaRGRequestContext *requestContext;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;
  RGSiriSchemaRGValidationContext *validationContext;
  RGSiriSchemaRGCatalogContext *catalogContext;
  RGSiriSchemaRGInferenceContext *inferenceContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;
  unint64_t v13;
  RGSiriSchemaRGOverrideContext *overrideContext;

  v4 = (RGSiriSchemaRGOverrideContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  catalogContext = self->_catalogContext;
  self->_catalogContext = 0;

  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = 0;

  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = 0;

  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = 0;

  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = 0;

  v13 = 12;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  overrideContext = self->_overrideContext;
  self->_overrideContext = v4;

}

- (RGSiriSchemaRGOverrideContext)overrideContext
{
  if (self->_whichEvent_Type == 12)
    return self->_overrideContext;
  else
    return (RGSiriSchemaRGOverrideContext *)0;
}

- (void)deleteOverrideContext
{
  RGSiriSchemaRGOverrideContext *overrideContext;

  if (self->_whichEvent_Type == 12)
  {
    self->_whichEvent_Type = 0;
    overrideContext = self->_overrideContext;
    self->_overrideContext = 0;

  }
}

- (void)setValidationContext:(id)a3
{
  RGSiriSchemaRGValidationContext *v4;
  RGSiriSchemaRGRequestContext *requestContext;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;
  RGSiriSchemaRGOverrideContext *overrideContext;
  RGSiriSchemaRGCatalogContext *catalogContext;
  RGSiriSchemaRGInferenceContext *inferenceContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;
  unint64_t v13;
  RGSiriSchemaRGValidationContext *validationContext;

  v4 = (RGSiriSchemaRGValidationContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  overrideContext = self->_overrideContext;
  self->_overrideContext = 0;

  catalogContext = self->_catalogContext;
  self->_catalogContext = 0;

  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = 0;

  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = 0;

  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = 0;

  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = 0;

  v13 = 13;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  validationContext = self->_validationContext;
  self->_validationContext = v4;

}

- (RGSiriSchemaRGValidationContext)validationContext
{
  if (self->_whichEvent_Type == 13)
    return self->_validationContext;
  else
    return (RGSiriSchemaRGValidationContext *)0;
}

- (void)deleteValidationContext
{
  RGSiriSchemaRGValidationContext *validationContext;

  if (self->_whichEvent_Type == 13)
  {
    self->_whichEvent_Type = 0;
    validationContext = self->_validationContext;
    self->_validationContext = 0;

  }
}

- (void)setCatalogContext:(id)a3
{
  RGSiriSchemaRGCatalogContext *v4;
  RGSiriSchemaRGRequestContext *requestContext;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;
  RGSiriSchemaRGOverrideContext *overrideContext;
  RGSiriSchemaRGValidationContext *validationContext;
  RGSiriSchemaRGInferenceContext *inferenceContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;
  unint64_t v13;
  RGSiriSchemaRGCatalogContext *catalogContext;

  v4 = (RGSiriSchemaRGCatalogContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  overrideContext = self->_overrideContext;
  self->_overrideContext = 0;

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = 0;

  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = 0;

  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = 0;

  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = 0;

  v13 = 14;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  catalogContext = self->_catalogContext;
  self->_catalogContext = v4;

}

- (RGSiriSchemaRGCatalogContext)catalogContext
{
  if (self->_whichEvent_Type == 14)
    return self->_catalogContext;
  else
    return (RGSiriSchemaRGCatalogContext *)0;
}

- (void)deleteCatalogContext
{
  RGSiriSchemaRGCatalogContext *catalogContext;

  if (self->_whichEvent_Type == 14)
  {
    self->_whichEvent_Type = 0;
    catalogContext = self->_catalogContext;
    self->_catalogContext = 0;

  }
}

- (void)setInferenceContext:(id)a3
{
  RGSiriSchemaRGInferenceContext *v4;
  RGSiriSchemaRGRequestContext *requestContext;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;
  RGSiriSchemaRGOverrideContext *overrideContext;
  RGSiriSchemaRGValidationContext *validationContext;
  RGSiriSchemaRGCatalogContext *catalogContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;
  unint64_t v13;
  RGSiriSchemaRGInferenceContext *inferenceContext;

  v4 = (RGSiriSchemaRGInferenceContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  overrideContext = self->_overrideContext;
  self->_overrideContext = 0;

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  catalogContext = self->_catalogContext;
  self->_catalogContext = 0;

  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = 0;

  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = 0;

  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = 0;

  v13 = 15;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = v4;

}

- (RGSiriSchemaRGInferenceContext)inferenceContext
{
  if (self->_whichEvent_Type == 15)
    return self->_inferenceContext;
  else
    return (RGSiriSchemaRGInferenceContext *)0;
}

- (void)deleteInferenceContext
{
  RGSiriSchemaRGInferenceContext *inferenceContext;

  if (self->_whichEvent_Type == 15)
  {
    self->_whichEvent_Type = 0;
    inferenceContext = self->_inferenceContext;
    self->_inferenceContext = 0;

  }
}

- (void)setHallucinationDetectionContext:(id)a3
{
  RGSiriSchemaRGHallucinationDetectionContext *v4;
  RGSiriSchemaRGRequestContext *requestContext;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;
  RGSiriSchemaRGOverrideContext *overrideContext;
  RGSiriSchemaRGValidationContext *validationContext;
  RGSiriSchemaRGCatalogContext *catalogContext;
  RGSiriSchemaRGInferenceContext *inferenceContext;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;

  v4 = (RGSiriSchemaRGHallucinationDetectionContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  overrideContext = self->_overrideContext;
  self->_overrideContext = 0;

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  catalogContext = self->_catalogContext;
  self->_catalogContext = 0;

  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = 0;

  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = 0;

  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = 0;

  self->_whichEvent_Type = 16 * (v4 != 0);
  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = v4;

}

- (RGSiriSchemaRGHallucinationDetectionContext)hallucinationDetectionContext
{
  if (self->_whichEvent_Type == 16)
    return self->_hallucinationDetectionContext;
  else
    return (RGSiriSchemaRGHallucinationDetectionContext *)0;
}

- (void)deleteHallucinationDetectionContext
{
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;

  if (self->_whichEvent_Type == 16)
  {
    self->_whichEvent_Type = 0;
    hallucinationDetectionContext = self->_hallucinationDetectionContext;
    self->_hallucinationDetectionContext = 0;

  }
}

- (void)setRGGMSCallContext:(id)a3
{
  RGSiriSchemaRGGMSCallContext *v4;
  RGSiriSchemaRGRequestContext *requestContext;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;
  RGSiriSchemaRGOverrideContext *overrideContext;
  RGSiriSchemaRGValidationContext *validationContext;
  RGSiriSchemaRGCatalogContext *catalogContext;
  RGSiriSchemaRGInferenceContext *inferenceContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;
  unint64_t v13;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;

  v4 = (RGSiriSchemaRGGMSCallContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  overrideContext = self->_overrideContext;
  self->_overrideContext = 0;

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  catalogContext = self->_catalogContext;
  self->_catalogContext = 0;

  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = 0;

  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = 0;

  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = 0;

  v13 = 17;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = v4;

}

- (RGSiriSchemaRGGMSCallContext)RGGMSCallContext
{
  if (self->_whichEvent_Type == 17)
    return self->_RGGMSCallContext;
  else
    return (RGSiriSchemaRGGMSCallContext *)0;
}

- (void)deleteRGGMSCallContext
{
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;

  if (self->_whichEvent_Type == 17)
  {
    self->_whichEvent_Type = 0;
    RGGMSCallContext = self->_RGGMSCallContext;
    self->_RGGMSCallContext = 0;

  }
}

- (void)setRGCacheManagerCallContext:(id)a3
{
  RGSiriSchemaRGCacheManagerCallContext *v4;
  RGSiriSchemaRGRequestContext *requestContext;
  RGSiriSchemaRGRequestEndedTier1 *requestEndedTier1;
  RGSiriSchemaRGOverrideContext *overrideContext;
  RGSiriSchemaRGValidationContext *validationContext;
  RGSiriSchemaRGCatalogContext *catalogContext;
  RGSiriSchemaRGInferenceContext *inferenceContext;
  RGSiriSchemaRGHallucinationDetectionContext *hallucinationDetectionContext;
  RGSiriSchemaRGGMSCallContext *RGGMSCallContext;
  unint64_t v13;
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;

  v4 = (RGSiriSchemaRGCacheManagerCallContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  overrideContext = self->_overrideContext;
  self->_overrideContext = 0;

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  catalogContext = self->_catalogContext;
  self->_catalogContext = 0;

  inferenceContext = self->_inferenceContext;
  self->_inferenceContext = 0;

  hallucinationDetectionContext = self->_hallucinationDetectionContext;
  self->_hallucinationDetectionContext = 0;

  RGGMSCallContext = self->_RGGMSCallContext;
  self->_RGGMSCallContext = 0;

  v13 = 18;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
  self->_RGCacheManagerCallContext = v4;

}

- (RGSiriSchemaRGCacheManagerCallContext)RGCacheManagerCallContext
{
  if (self->_whichEvent_Type == 18)
    return self->_RGCacheManagerCallContext;
  else
    return (RGSiriSchemaRGCacheManagerCallContext *)0;
}

- (void)deleteRGCacheManagerCallContext
{
  RGSiriSchemaRGCacheManagerCallContext *RGCacheManagerCallContext;

  if (self->_whichEvent_Type == 18)
  {
    self->_whichEvent_Type = 0;
    RGCacheManagerCallContext = self->_RGCacheManagerCallContext;
    self->_RGCacheManagerCallContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGClientEventReadFrom(self, (uint64_t)a3);
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RGSiriSchemaRGClientEvent requestContext](self, "requestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent requestEndedTier1](self, "requestEndedTier1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RGSiriSchemaRGClientEvent requestEndedTier1](self, "requestEndedTier1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent overrideContext](self, "overrideContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RGSiriSchemaRGClientEvent overrideContext](self, "overrideContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent validationContext](self, "validationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RGSiriSchemaRGClientEvent validationContext](self, "validationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent catalogContext](self, "catalogContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[RGSiriSchemaRGClientEvent catalogContext](self, "catalogContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent inferenceContext](self, "inferenceContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[RGSiriSchemaRGClientEvent inferenceContext](self, "inferenceContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent hallucinationDetectionContext](self, "hallucinationDetectionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[RGSiriSchemaRGClientEvent hallucinationDetectionContext](self, "hallucinationDetectionContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent RGGMSCallContext](self, "RGGMSCallContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[RGSiriSchemaRGClientEvent RGGMSCallContext](self, "RGGMSCallContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGClientEvent RGCacheManagerCallContext](self, "RGCacheManagerCallContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[RGSiriSchemaRGClientEvent RGCacheManagerCallContext](self, "RGCacheManagerCallContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  BOOL v58;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_53;
  -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent requestContext](self, "requestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RGSiriSchemaRGClientEvent requestContext](self, "requestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent requestEndedTier1](self, "requestEndedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestEndedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent requestEndedTier1](self, "requestEndedTier1");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[RGSiriSchemaRGClientEvent requestEndedTier1](self, "requestEndedTier1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestEndedTier1");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent overrideContext](self, "overrideContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent overrideContext](self, "overrideContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[RGSiriSchemaRGClientEvent overrideContext](self, "overrideContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "overrideContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent validationContext](self, "validationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "validationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent validationContext](self, "validationContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[RGSiriSchemaRGClientEvent validationContext](self, "validationContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "validationContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent catalogContext](self, "catalogContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catalogContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent catalogContext](self, "catalogContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[RGSiriSchemaRGClientEvent catalogContext](self, "catalogContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "catalogContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent inferenceContext](self, "inferenceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inferenceContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent inferenceContext](self, "inferenceContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[RGSiriSchemaRGClientEvent inferenceContext](self, "inferenceContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inferenceContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent hallucinationDetectionContext](self, "hallucinationDetectionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hallucinationDetectionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent hallucinationDetectionContext](self, "hallucinationDetectionContext");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[RGSiriSchemaRGClientEvent hallucinationDetectionContext](self, "hallucinationDetectionContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hallucinationDetectionContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent RGGMSCallContext](self, "RGGMSCallContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "RGGMSCallContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[RGSiriSchemaRGClientEvent RGGMSCallContext](self, "RGGMSCallContext");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[RGSiriSchemaRGClientEvent RGGMSCallContext](self, "RGGMSCallContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "RGGMSCallContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_53;
  }
  else
  {

  }
  -[RGSiriSchemaRGClientEvent RGCacheManagerCallContext](self, "RGCacheManagerCallContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "RGCacheManagerCallContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RGSiriSchemaRGClientEvent RGCacheManagerCallContext](self, "RGCacheManagerCallContext");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {

LABEL_56:
      v58 = 1;
      goto LABEL_54;
    }
    v54 = (void *)v53;
    -[RGSiriSchemaRGClientEvent RGCacheManagerCallContext](self, "RGCacheManagerCallContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "RGCacheManagerCallContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if ((v57 & 1) != 0)
      goto LABEL_56;
  }
  else
  {
LABEL_52:

  }
LABEL_53:
  v58 = 0;
LABEL_54:

  return v58;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[RGSiriSchemaRGClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[RGSiriSchemaRGRequestContext hash](self->_requestContext, "hash") ^ v3;
  v5 = -[RGSiriSchemaRGRequestEndedTier1 hash](self->_requestEndedTier1, "hash");
  v6 = v4 ^ v5 ^ -[RGSiriSchemaRGOverrideContext hash](self->_overrideContext, "hash");
  v7 = -[RGSiriSchemaRGValidationContext hash](self->_validationContext, "hash");
  v8 = v7 ^ -[RGSiriSchemaRGCatalogContext hash](self->_catalogContext, "hash");
  v9 = v6 ^ v8 ^ -[RGSiriSchemaRGInferenceContext hash](self->_inferenceContext, "hash");
  v10 = -[RGSiriSchemaRGHallucinationDetectionContext hash](self->_hallucinationDetectionContext, "hash");
  v11 = v10 ^ -[RGSiriSchemaRGGMSCallContext hash](self->_RGGMSCallContext, "hash");
  return v9 ^ v11 ^ -[RGSiriSchemaRGCacheManagerCallContext hash](self->_RGCacheManagerCallContext, "hash");
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_RGCacheManagerCallContext)
  {
    -[RGSiriSchemaRGClientEvent RGCacheManagerCallContext](self, "RGCacheManagerCallContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("RGCacheManagerCallContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("RGCacheManagerCallContext"));

    }
  }
  if (self->_RGGMSCallContext)
  {
    -[RGSiriSchemaRGClientEvent RGGMSCallContext](self, "RGGMSCallContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("RGGMSCallContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("RGGMSCallContext"));

    }
  }
  if (self->_catalogContext)
  {
    -[RGSiriSchemaRGClientEvent catalogContext](self, "catalogContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("catalogContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("catalogContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[RGSiriSchemaRGClientEvent eventMetadata](self, "eventMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("eventMetadata"));

    }
  }
  if (self->_hallucinationDetectionContext)
  {
    -[RGSiriSchemaRGClientEvent hallucinationDetectionContext](self, "hallucinationDetectionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hallucinationDetectionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hallucinationDetectionContext"));

    }
  }
  if (self->_inferenceContext)
  {
    -[RGSiriSchemaRGClientEvent inferenceContext](self, "inferenceContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("inferenceContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("inferenceContext"));

    }
  }
  if (self->_overrideContext)
  {
    -[RGSiriSchemaRGClientEvent overrideContext](self, "overrideContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("overrideContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("overrideContext"));

    }
  }
  if (self->_requestContext)
  {
    -[RGSiriSchemaRGClientEvent requestContext](self, "requestContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("requestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("requestContext"));

    }
  }
  if (self->_requestEndedTier1)
  {
    -[RGSiriSchemaRGClientEvent requestEndedTier1](self, "requestEndedTier1");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("requestEndedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("requestEndedTier1"));

    }
  }
  if (self->_validationContext)
  {
    -[RGSiriSchemaRGClientEvent validationContext](self, "validationContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("validationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("validationContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RGSiriSchemaRGClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RGSiriSchemaRGClientEvent)initWithJSON:(id)a3
{
  void *v4;
  RGSiriSchemaRGClientEvent *v5;
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
    self = -[RGSiriSchemaRGClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RGSiriSchemaRGClientEvent)initWithDictionary:(id)a3
{
  id v4;
  RGSiriSchemaRGClientEvent *v5;
  uint64_t v6;
  RGSiriSchemaRGClientEventMetadata *v7;
  uint64_t v8;
  RGSiriSchemaRGRequestContext *v9;
  uint64_t v10;
  RGSiriSchemaRGRequestEndedTier1 *v11;
  uint64_t v12;
  RGSiriSchemaRGOverrideContext *v13;
  void *v14;
  RGSiriSchemaRGValidationContext *v15;
  void *v16;
  RGSiriSchemaRGCatalogContext *v17;
  void *v18;
  RGSiriSchemaRGInferenceContext *v19;
  void *v20;
  void *v21;
  RGSiriSchemaRGHallucinationDetectionContext *v22;
  void *v23;
  RGSiriSchemaRGGMSCallContext *v24;
  void *v25;
  RGSiriSchemaRGCacheManagerCallContext *v26;
  RGSiriSchemaRGClientEvent *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)RGSiriSchemaRGClientEvent;
  v5 = -[RGSiriSchemaRGClientEvent init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RGSiriSchemaRGClientEventMetadata initWithDictionary:]([RGSiriSchemaRGClientEventMetadata alloc], "initWithDictionary:", v6);
      -[RGSiriSchemaRGClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RGSiriSchemaRGRequestContext initWithDictionary:]([RGSiriSchemaRGRequestContext alloc], "initWithDictionary:", v8);
      -[RGSiriSchemaRGClientEvent setRequestContext:](v5, "setRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestEndedTier1"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RGSiriSchemaRGRequestEndedTier1 initWithDictionary:]([RGSiriSchemaRGRequestEndedTier1 alloc], "initWithDictionary:", v10);
      -[RGSiriSchemaRGClientEvent setRequestEndedTier1:](v5, "setRequestEndedTier1:", v11);

    }
    v30 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[RGSiriSchemaRGOverrideContext initWithDictionary:]([RGSiriSchemaRGOverrideContext alloc], "initWithDictionary:", v12);
      -[RGSiriSchemaRGClientEvent setOverrideContext:](v5, "setOverrideContext:", v13);

    }
    v29 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validationContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[RGSiriSchemaRGValidationContext initWithDictionary:]([RGSiriSchemaRGValidationContext alloc], "initWithDictionary:", v14);
      -[RGSiriSchemaRGClientEvent setValidationContext:](v5, "setValidationContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catalogContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[RGSiriSchemaRGCatalogContext initWithDictionary:]([RGSiriSchemaRGCatalogContext alloc], "initWithDictionary:", v16);
      -[RGSiriSchemaRGClientEvent setCatalogContext:](v5, "setCatalogContext:", v17);

    }
    v31 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferenceContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[RGSiriSchemaRGInferenceContext initWithDictionary:]([RGSiriSchemaRGInferenceContext alloc], "initWithDictionary:", v18);
      -[RGSiriSchemaRGClientEvent setInferenceContext:](v5, "setInferenceContext:", v19);

    }
    v20 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hallucinationDetectionContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[RGSiriSchemaRGHallucinationDetectionContext initWithDictionary:]([RGSiriSchemaRGHallucinationDetectionContext alloc], "initWithDictionary:", v21);
      -[RGSiriSchemaRGClientEvent setHallucinationDetectionContext:](v5, "setHallucinationDetectionContext:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RGGMSCallContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[RGSiriSchemaRGGMSCallContext initWithDictionary:]([RGSiriSchemaRGGMSCallContext alloc], "initWithDictionary:", v23);
      -[RGSiriSchemaRGClientEvent setRGGMSCallContext:](v5, "setRGGMSCallContext:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RGCacheManagerCallContext"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[RGSiriSchemaRGCacheManagerCallContext initWithDictionary:]([RGSiriSchemaRGCacheManagerCallContext alloc], "initWithDictionary:", v25);
      -[RGSiriSchemaRGClientEvent setRGCacheManagerCallContext:](v5, "setRGCacheManagerCallContext:", v26);

    }
    v27 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RGSiriSchemaRGClientEventMetadata)eventMetadata
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

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasRequestEndedTier1
{
  return self->_hasRequestEndedTier1;
}

- (void)setHasRequestEndedTier1:(BOOL)a3
{
  self->_hasRequestEndedTier1 = a3;
}

- (BOOL)hasOverrideContext
{
  return self->_hasOverrideContext;
}

- (void)setHasOverrideContext:(BOOL)a3
{
  self->_hasOverrideContext = a3;
}

- (BOOL)hasValidationContext
{
  return self->_hasValidationContext;
}

- (void)setHasValidationContext:(BOOL)a3
{
  self->_hasValidationContext = a3;
}

- (BOOL)hasCatalogContext
{
  return self->_hasCatalogContext;
}

- (void)setHasCatalogContext:(BOOL)a3
{
  self->_hasCatalogContext = a3;
}

- (BOOL)hasInferenceContext
{
  return self->_hasInferenceContext;
}

- (void)setHasInferenceContext:(BOOL)a3
{
  self->_hasInferenceContext = a3;
}

- (BOOL)hasHallucinationDetectionContext
{
  return self->_hasHallucinationDetectionContext;
}

- (void)setHasHallucinationDetectionContext:(BOOL)a3
{
  self->_hasHallucinationDetectionContext = a3;
}

- (BOOL)hasRGGMSCallContext
{
  return self->_hasRGGMSCallContext;
}

- (void)setHasRGGMSCallContext:(BOOL)a3
{
  self->_hasRGGMSCallContext = a3;
}

- (BOOL)hasRGCacheManagerCallContext
{
  return self->_hasRGCacheManagerCallContext;
}

- (void)setHasRGCacheManagerCallContext:(BOOL)a3
{
  self->_hasRGCacheManagerCallContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_RGCacheManagerCallContext, 0);
  objc_storeStrong((id *)&self->_RGGMSCallContext, 0);
  objc_storeStrong((id *)&self->_hallucinationDetectionContext, 0);
  objc_storeStrong((id *)&self->_inferenceContext, 0);
  objc_storeStrong((id *)&self->_catalogContext, 0);
  objc_storeStrong((id *)&self->_validationContext, 0);
  objc_storeStrong((id *)&self->_overrideContext, 0);
  objc_storeStrong((id *)&self->_requestEndedTier1, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 93;
}

@end
