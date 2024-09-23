@implementation FLOWLINKSchemaFLOWLINKClientEvent

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

  -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flowId");
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
  -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
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
  -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
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

  -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flowId");
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
    LODWORD(v9) = 3;
  }
  else
  {
LABEL_5:
    -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
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
      -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
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
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)FLOWLINKSchemaFLOWLINKClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v49, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[FLOWLINKSchemaFLOWLINKClientEvent linkActionContext](self, "linkActionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteLinkActionContext](self, "deleteLinkActionContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent entityDisambiguationContext](self, "entityDisambiguationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteEntityDisambiguationContext](self, "deleteEntityDisambiguationContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent actionConversionContext](self, "actionConversionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteActionConversionContext](self, "deleteActionConversionContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent actionExecutionContext](self, "actionExecutionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteActionExecutionContext](self, "deleteActionExecutionContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent actionPromptForValueContext](self, "actionPromptForValueContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteActionPromptForValueContext](self, "deleteActionPromptForValueContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterDisambiguationContext](self, "actionParameterDisambiguationContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteActionParameterDisambiguationContext](self, "deleteActionParameterDisambiguationContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterConfirmationContext](self, "actionParameterConfirmationContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteActionParameterConfirmationContext](self, "deleteActionParameterConfirmationContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent actionConfirmationContext](self, "actionConfirmationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteActionConfirmationContext](self, "deleteActionConfirmationContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent autoShortcutTemplateUsed](self, "autoShortcutTemplateUsed");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteAutoShortcutTemplateUsed](self, "deleteAutoShortcutTemplateUsed");
  -[FLOWLINKSchemaFLOWLINKClientEvent linkActionTier1](self, "linkActionTier1");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteLinkActionTier1](self, "deleteLinkActionTier1");
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterUpdated](self, "actionParameterUpdated");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteActionParameterUpdated](self, "deleteActionParameterUpdated");
  -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutFirstRunConfirmationContext](self, "appShortcutFirstRunConfirmationContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteAppShortcutFirstRunConfirmationContext](self, "deleteAppShortcutFirstRunConfirmationContext");
  -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutGeneralizedExecutionUsed](self, "appShortcutGeneralizedExecutionUsed");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[FLOWLINKSchemaFLOWLINKClientEvent deleteAppShortcutGeneralizedExecutionUsed](self, "deleteAppShortcutGeneralizedExecutionUsed");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[FLOWLINKSchemaFLOWLINKClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 100 > 0xC)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629578[v3 - 100]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 100 > 0xC)
    return 0;
  else
    return off_1E56295E0[a3 - 100];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[FLOWLINKSchemaFLOWLINKClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 100 > 0xC)
    return CFSTR("com.apple.aiml.siri.flow.link.FLOWLINKClientEvent");
  else
    return off_1E562D760[v2 - 100];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[FLOWLINKSchemaFLOWLINKClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setLinkActionContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionContext *v4;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;

  v4 = (FLOWLINKSchemaFLOWLINKActionContext *)a3;
  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 100;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = v4;

}

- (FLOWLINKSchemaFLOWLINKActionContext)linkActionContext
{
  if (self->_whichEvent_Type == 100)
    return self->_linkActionContext;
  else
    return (FLOWLINKSchemaFLOWLINKActionContext *)0;
}

- (void)deleteLinkActionContext
{
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;

  if (self->_whichEvent_Type == 100)
  {
    self->_whichEvent_Type = 0;
    linkActionContext = self->_linkActionContext;
    self->_linkActionContext = 0;

  }
}

- (void)setEntityDisambiguationContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;

  v4 = (FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 101;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = v4;

}

- (FLOWLINKSchemaFLOWLINKEntityDisambiguationContext)entityDisambiguationContext
{
  if (self->_whichEvent_Type == 101)
    return self->_entityDisambiguationContext;
  else
    return (FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *)0;
}

- (void)deleteEntityDisambiguationContext
{
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    entityDisambiguationContext = self->_entityDisambiguationContext;
    self->_entityDisambiguationContext = 0;

  }
}

- (void)setActionConversionContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionConversionContext *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;

  v4 = (FLOWLINKSchemaFLOWLINKActionConversionContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 102;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = v4;

}

- (FLOWLINKSchemaFLOWLINKActionConversionContext)actionConversionContext
{
  if (self->_whichEvent_Type == 102)
    return self->_actionConversionContext;
  else
    return (FLOWLINKSchemaFLOWLINKActionConversionContext *)0;
}

- (void)deleteActionConversionContext
{
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    actionConversionContext = self->_actionConversionContext;
    self->_actionConversionContext = 0;

  }
}

- (void)setActionExecutionContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionExecutionContext *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;

  v4 = (FLOWLINKSchemaFLOWLINKActionExecutionContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 103;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = v4;

}

- (FLOWLINKSchemaFLOWLINKActionExecutionContext)actionExecutionContext
{
  if (self->_whichEvent_Type == 103)
    return self->_actionExecutionContext;
  else
    return (FLOWLINKSchemaFLOWLINKActionExecutionContext *)0;
}

- (void)deleteActionExecutionContext
{
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    actionExecutionContext = self->_actionExecutionContext;
    self->_actionExecutionContext = 0;

  }
}

- (void)setActionPromptForValueContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;

  v4 = (FLOWLINKSchemaFLOWLINKActionPromptForValueContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 104;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = v4;

}

- (FLOWLINKSchemaFLOWLINKActionPromptForValueContext)actionPromptForValueContext
{
  if (self->_whichEvent_Type == 104)
    return self->_actionPromptForValueContext;
  else
    return (FLOWLINKSchemaFLOWLINKActionPromptForValueContext *)0;
}

- (void)deleteActionPromptForValueContext
{
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    actionPromptForValueContext = self->_actionPromptForValueContext;
    self->_actionPromptForValueContext = 0;

  }
}

- (void)setActionParameterDisambiguationContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;

  v4 = (FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 105;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = v4;

}

- (FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext)actionParameterDisambiguationContext
{
  if (self->_whichEvent_Type == 105)
    return self->_actionParameterDisambiguationContext;
  else
    return (FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *)0;
}

- (void)deleteActionParameterDisambiguationContext
{
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
    self->_actionParameterDisambiguationContext = 0;

  }
}

- (void)setActionParameterConfirmationContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;

  v4 = (FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 106;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = v4;

}

- (FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext)actionParameterConfirmationContext
{
  if (self->_whichEvent_Type == 106)
    return self->_actionParameterConfirmationContext;
  else
    return (FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *)0;
}

- (void)deleteActionParameterConfirmationContext
{
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
    self->_actionParameterConfirmationContext = 0;

  }
}

- (void)setActionConfirmationContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;

  v4 = (FLOWLINKSchemaFLOWLINKActionConfirmationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 107;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = v4;

}

- (FLOWLINKSchemaFLOWLINKActionConfirmationContext)actionConfirmationContext
{
  if (self->_whichEvent_Type == 107)
    return self->_actionConfirmationContext;
  else
    return (FLOWLINKSchemaFLOWLINKActionConfirmationContext *)0;
}

- (void)deleteActionConfirmationContext
{
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    actionConfirmationContext = self->_actionConfirmationContext;
    self->_actionConfirmationContext = 0;

  }
}

- (void)setAutoShortcutTemplateUsed:(id)a3
{
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;

  v4 = (FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 108;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = v4;

}

- (FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed)autoShortcutTemplateUsed
{
  if (self->_whichEvent_Type == 108)
    return self->_autoShortcutTemplateUsed;
  else
    return (FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *)0;
}

- (void)deleteAutoShortcutTemplateUsed
{
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
    self->_autoShortcutTemplateUsed = 0;

  }
}

- (void)setLinkActionTier1:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionTier1 *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;

  v4 = (FLOWLINKSchemaFLOWLINKActionTier1 *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 109;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = v4;

}

- (FLOWLINKSchemaFLOWLINKActionTier1)linkActionTier1
{
  if (self->_whichEvent_Type == 109)
    return self->_linkActionTier1;
  else
    return (FLOWLINKSchemaFLOWLINKActionTier1 *)0;
}

- (void)deleteLinkActionTier1
{
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    linkActionTier1 = self->_linkActionTier1;
    self->_linkActionTier1 = 0;

  }
}

- (void)setActionParameterUpdated:(id)a3
{
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;

  v4 = (FLOWLINKSchemaFLOWLINKActionParametersUpdated *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 110;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = v4;

}

- (FLOWLINKSchemaFLOWLINKActionParametersUpdated)actionParameterUpdated
{
  if (self->_whichEvent_Type == 110)
    return self->_actionParameterUpdated;
  else
    return (FLOWLINKSchemaFLOWLINKActionParametersUpdated *)0;
}

- (void)deleteActionParameterUpdated
{
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    actionParameterUpdated = self->_actionParameterUpdated;
    self->_actionParameterUpdated = 0;

  }
}

- (void)setAppShortcutFirstRunConfirmationContext:(id)a3
{
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;

  v4 = (FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  v17 = 111;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = v4;

}

- (FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext)appShortcutFirstRunConfirmationContext
{
  if (self->_whichEvent_Type == 111)
    return self->_appShortcutFirstRunConfirmationContext;
  else
    return (FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *)0;
}

- (void)deleteAppShortcutFirstRunConfirmationContext
{
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
    self->_appShortcutFirstRunConfirmationContext = 0;

  }
}

- (void)setAppShortcutGeneralizedExecutionUsed:(id)a3
{
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *v4;
  FLOWLINKSchemaFLOWLINKActionContext *linkActionContext;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *entityDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionConversionContext *actionConversionContext;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *actionExecutionContext;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *actionPromptForValueContext;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *actionParameterDisambiguationContext;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *actionParameterConfirmationContext;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *actionConfirmationContext;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *autoShortcutTemplateUsed;
  FLOWLINKSchemaFLOWLINKActionTier1 *linkActionTier1;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *actionParameterUpdated;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *appShortcutFirstRunConfirmationContext;
  unint64_t v17;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;

  v4 = (FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  v17 = 112;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = v4;

}

- (FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed)appShortcutGeneralizedExecutionUsed
{
  if (self->_whichEvent_Type == 112)
    return self->_appShortcutGeneralizedExecutionUsed;
  else
    return (FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *)0;
}

- (void)deleteAppShortcutGeneralizedExecutionUsed
{
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *appShortcutGeneralizedExecutionUsed;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
    self->_appShortcutGeneralizedExecutionUsed = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLINKClientEventReadFrom(self, (uint64_t)a3);
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent linkActionContext](self, "linkActionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent linkActionContext](self, "linkActionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent entityDisambiguationContext](self, "entityDisambiguationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent entityDisambiguationContext](self, "entityDisambiguationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionConversionContext](self, "actionConversionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionConversionContext](self, "actionConversionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionExecutionContext](self, "actionExecutionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionExecutionContext](self, "actionExecutionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionPromptForValueContext](self, "actionPromptForValueContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionPromptForValueContext](self, "actionPromptForValueContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterDisambiguationContext](self, "actionParameterDisambiguationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterDisambiguationContext](self, "actionParameterDisambiguationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterConfirmationContext](self, "actionParameterConfirmationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterConfirmationContext](self, "actionParameterConfirmationContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionConfirmationContext](self, "actionConfirmationContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionConfirmationContext](self, "actionConfirmationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent autoShortcutTemplateUsed](self, "autoShortcutTemplateUsed");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent autoShortcutTemplateUsed](self, "autoShortcutTemplateUsed");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent linkActionTier1](self, "linkActionTier1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent linkActionTier1](self, "linkActionTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterUpdated](self, "actionParameterUpdated");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterUpdated](self, "actionParameterUpdated");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutFirstRunConfirmationContext](self, "appShortcutFirstRunConfirmationContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutFirstRunConfirmationContext](self, "appShortcutFirstRunConfirmationContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutGeneralizedExecutionUsed](self, "appShortcutGeneralizedExecutionUsed");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutGeneralizedExecutionUsed](self, "appShortcutGeneralizedExecutionUsed");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  BOOL v78;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_73;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_73;
  -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent linkActionContext](self, "linkActionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkActionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent linkActionContext](self, "linkActionContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[FLOWLINKSchemaFLOWLINKClientEvent linkActionContext](self, "linkActionContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkActionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent entityDisambiguationContext](self, "entityDisambiguationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityDisambiguationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent entityDisambiguationContext](self, "entityDisambiguationContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[FLOWLINKSchemaFLOWLINKClientEvent entityDisambiguationContext](self, "entityDisambiguationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityDisambiguationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionConversionContext](self, "actionConversionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionConversionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent actionConversionContext](self, "actionConversionContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[FLOWLINKSchemaFLOWLINKClientEvent actionConversionContext](self, "actionConversionContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionConversionContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionExecutionContext](self, "actionExecutionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionExecutionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent actionExecutionContext](self, "actionExecutionContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[FLOWLINKSchemaFLOWLINKClientEvent actionExecutionContext](self, "actionExecutionContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionExecutionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionPromptForValueContext](self, "actionPromptForValueContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionPromptForValueContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent actionPromptForValueContext](self, "actionPromptForValueContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[FLOWLINKSchemaFLOWLINKClientEvent actionPromptForValueContext](self, "actionPromptForValueContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionPromptForValueContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterDisambiguationContext](self, "actionParameterDisambiguationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionParameterDisambiguationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterDisambiguationContext](self, "actionParameterDisambiguationContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterDisambiguationContext](self, "actionParameterDisambiguationContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionParameterDisambiguationContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterConfirmationContext](self, "actionParameterConfirmationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionParameterConfirmationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterConfirmationContext](self, "actionParameterConfirmationContext");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterConfirmationContext](self, "actionParameterConfirmationContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionParameterConfirmationContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionConfirmationContext](self, "actionConfirmationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionConfirmationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent actionConfirmationContext](self, "actionConfirmationContext");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[FLOWLINKSchemaFLOWLINKClientEvent actionConfirmationContext](self, "actionConfirmationContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionConfirmationContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent autoShortcutTemplateUsed](self, "autoShortcutTemplateUsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoShortcutTemplateUsed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent autoShortcutTemplateUsed](self, "autoShortcutTemplateUsed");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[FLOWLINKSchemaFLOWLINKClientEvent autoShortcutTemplateUsed](self, "autoShortcutTemplateUsed");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autoShortcutTemplateUsed");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent linkActionTier1](self, "linkActionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkActionTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent linkActionTier1](self, "linkActionTier1");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[FLOWLINKSchemaFLOWLINKClientEvent linkActionTier1](self, "linkActionTier1");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkActionTier1");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterUpdated](self, "actionParameterUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionParameterUpdated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterUpdated](self, "actionParameterUpdated");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterUpdated](self, "actionParameterUpdated");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionParameterUpdated");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutFirstRunConfirmationContext](self, "appShortcutFirstRunConfirmationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appShortcutFirstRunConfirmationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutFirstRunConfirmationContext](self, "appShortcutFirstRunConfirmationContext");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutFirstRunConfirmationContext](self, "appShortcutFirstRunConfirmationContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appShortcutFirstRunConfirmationContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_73;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutGeneralizedExecutionUsed](self, "appShortcutGeneralizedExecutionUsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appShortcutGeneralizedExecutionUsed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutGeneralizedExecutionUsed](self, "appShortcutGeneralizedExecutionUsed");
    v73 = objc_claimAutoreleasedReturnValue();
    if (!v73)
    {

LABEL_76:
      v78 = 1;
      goto LABEL_74;
    }
    v74 = (void *)v73;
    -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutGeneralizedExecutionUsed](self, "appShortcutGeneralizedExecutionUsed");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appShortcutGeneralizedExecutionUsed");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if ((v77 & 1) != 0)
      goto LABEL_76;
  }
  else
  {
LABEL_72:

  }
LABEL_73:
  v78 = 0;
LABEL_74:

  return v78;
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
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v3 = -[FLOWSchemaFLOWEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[FLOWLINKSchemaFLOWLINKActionContext hash](self->_linkActionContext, "hash") ^ v3;
  v5 = -[FLOWLINKSchemaFLOWLINKEntityDisambiguationContext hash](self->_entityDisambiguationContext, "hash");
  v6 = v4 ^ v5 ^ -[FLOWLINKSchemaFLOWLINKActionConversionContext hash](self->_actionConversionContext, "hash");
  v7 = -[FLOWLINKSchemaFLOWLINKActionExecutionContext hash](self->_actionExecutionContext, "hash");
  v8 = v7 ^ -[FLOWLINKSchemaFLOWLINKActionPromptForValueContext hash](self->_actionPromptForValueContext, "hash");
  v9 = v6 ^ v8 ^ -[FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext hash](self->_actionParameterDisambiguationContext, "hash");
  v10 = -[FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext hash](self->_actionParameterConfirmationContext, "hash");
  v11 = v10 ^ -[FLOWLINKSchemaFLOWLINKActionConfirmationContext hash](self->_actionConfirmationContext, "hash");
  v12 = v11 ^ -[FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed hash](self->_autoShortcutTemplateUsed, "hash");
  v13 = v9 ^ v12 ^ -[FLOWLINKSchemaFLOWLINKActionTier1 hash](self->_linkActionTier1, "hash");
  v14 = -[FLOWLINKSchemaFLOWLINKActionParametersUpdated hash](self->_actionParameterUpdated, "hash");
  v15 = v14 ^ -[FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext hash](self->_appShortcutFirstRunConfirmationContext, "hash");
  return v13 ^ v15 ^ -[FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed hash](self->_appShortcutGeneralizedExecutionUsed, "hash");
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionConfirmationContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionConfirmationContext](self, "actionConfirmationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionConfirmationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionConfirmationContext"));

    }
  }
  if (self->_actionConversionContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionConversionContext](self, "actionConversionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("actionConversionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("actionConversionContext"));

    }
  }
  if (self->_actionExecutionContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionExecutionContext](self, "actionExecutionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("actionExecutionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("actionExecutionContext"));

    }
  }
  if (self->_actionParameterConfirmationContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterConfirmationContext](self, "actionParameterConfirmationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("actionParameterConfirmationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("actionParameterConfirmationContext"));

    }
  }
  if (self->_actionParameterDisambiguationContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterDisambiguationContext](self, "actionParameterDisambiguationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("actionParameterDisambiguationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("actionParameterDisambiguationContext"));

    }
  }
  if (self->_actionParameterUpdated)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionParameterUpdated](self, "actionParameterUpdated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("actionParameterUpdated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("actionParameterUpdated"));

    }
  }
  if (self->_actionPromptForValueContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent actionPromptForValueContext](self, "actionPromptForValueContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("actionPromptForValueContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("actionPromptForValueContext"));

    }
  }
  if (self->_appShortcutFirstRunConfirmationContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutFirstRunConfirmationContext](self, "appShortcutFirstRunConfirmationContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("appShortcutFirstRunConfirmationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("appShortcutFirstRunConfirmationContext"));

    }
  }
  if (self->_appShortcutGeneralizedExecutionUsed)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent appShortcutGeneralizedExecutionUsed](self, "appShortcutGeneralizedExecutionUsed");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("appShortcutGeneralizedExecutionUsed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("appShortcutGeneralizedExecutionUsed"));

    }
  }
  if (self->_autoShortcutTemplateUsed)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent autoShortcutTemplateUsed](self, "autoShortcutTemplateUsed");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("autoShortcutTemplateUsed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("autoShortcutTemplateUsed"));

    }
  }
  if (self->_entityDisambiguationContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent entityDisambiguationContext](self, "entityDisambiguationContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("entityDisambiguationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("entityDisambiguationContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent eventMetadata](self, "eventMetadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("eventMetadata"));

    }
  }
  if (self->_linkActionContext)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent linkActionContext](self, "linkActionContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("linkActionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("linkActionContext"));

    }
  }
  if (self->_linkActionTier1)
  {
    -[FLOWLINKSchemaFLOWLINKClientEvent linkActionTier1](self, "linkActionTier1");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("linkActionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("linkActionTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWLINKSchemaFLOWLINKClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWLINKSchemaFLOWLINKClientEvent)initWithJSON:(id)a3
{
  void *v4;
  FLOWLINKSchemaFLOWLINKClientEvent *v5;
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
    self = -[FLOWLINKSchemaFLOWLINKClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWLINKSchemaFLOWLINKClientEvent)initWithDictionary:(id)a3
{
  id v4;
  FLOWLINKSchemaFLOWLINKClientEvent *v5;
  uint64_t v6;
  FLOWSchemaFLOWEventMetadata *v7;
  uint64_t v8;
  FLOWLINKSchemaFLOWLINKActionContext *v9;
  uint64_t v10;
  FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *v11;
  uint64_t v12;
  FLOWLINKSchemaFLOWLINKActionConversionContext *v13;
  uint64_t v14;
  FLOWLINKSchemaFLOWLINKActionExecutionContext *v15;
  uint64_t v16;
  FLOWLINKSchemaFLOWLINKActionPromptForValueContext *v17;
  uint64_t v18;
  FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *v19;
  uint64_t v20;
  FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *v21;
  void *v22;
  FLOWLINKSchemaFLOWLINKActionConfirmationContext *v23;
  void *v24;
  FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *v25;
  void *v26;
  FLOWLINKSchemaFLOWLINKActionTier1 *v27;
  void *v28;
  void *v29;
  FLOWLINKSchemaFLOWLINKActionParametersUpdated *v30;
  void *v31;
  FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *v32;
  void *v33;
  FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *v34;
  FLOWLINKSchemaFLOWLINKClientEvent *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FLOWLINKSchemaFLOWLINKClientEvent;
  v5 = -[FLOWLINKSchemaFLOWLINKClientEvent init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLOWSchemaFLOWEventMetadata initWithDictionary:]([FLOWSchemaFLOWEventMetadata alloc], "initWithDictionary:", v6);
      -[FLOWLINKSchemaFLOWLINKClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkActionContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLOWLINKSchemaFLOWLINKActionContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionContext alloc], "initWithDictionary:", v8);
      -[FLOWLINKSchemaFLOWLINKClientEvent setLinkActionContext:](v5, "setLinkActionContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityDisambiguationContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[FLOWLINKSchemaFLOWLINKEntityDisambiguationContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKEntityDisambiguationContext alloc], "initWithDictionary:", v10);
      -[FLOWLINKSchemaFLOWLINKClientEvent setEntityDisambiguationContext:](v5, "setEntityDisambiguationContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionConversionContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[FLOWLINKSchemaFLOWLINKActionConversionContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionConversionContext alloc], "initWithDictionary:", v12);
      -[FLOWLINKSchemaFLOWLINKClientEvent setActionConversionContext:](v5, "setActionConversionContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionExecutionContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[FLOWLINKSchemaFLOWLINKActionExecutionContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionExecutionContext alloc], "initWithDictionary:", v14);
      -[FLOWLINKSchemaFLOWLINKClientEvent setActionExecutionContext:](v5, "setActionExecutionContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionPromptForValueContext"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[FLOWLINKSchemaFLOWLINKActionPromptForValueContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionPromptForValueContext alloc], "initWithDictionary:", v16);
      -[FLOWLINKSchemaFLOWLINKClientEvent setActionPromptForValueContext:](v5, "setActionPromptForValueContext:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionParameterDisambiguationContext"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext alloc], "initWithDictionary:", v18);
      -[FLOWLINKSchemaFLOWLINKClientEvent setActionParameterDisambiguationContext:](v5, "setActionParameterDisambiguationContext:", v19);

    }
    v42 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionParameterConfirmationContext"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext alloc], "initWithDictionary:", v20);
      -[FLOWLINKSchemaFLOWLINKClientEvent setActionParameterConfirmationContext:](v5, "setActionParameterConfirmationContext:", v21);

    }
    v37 = (void *)v20;
    v41 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionConfirmationContext"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[FLOWLINKSchemaFLOWLINKActionConfirmationContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionConfirmationContext alloc], "initWithDictionary:", v22);
      -[FLOWLINKSchemaFLOWLINKClientEvent setActionConfirmationContext:](v5, "setActionConfirmationContext:", v23);

    }
    v40 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoShortcutTemplateUsed"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed initWithDictionary:]([FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed alloc], "initWithDictionary:", v24);
      -[FLOWLINKSchemaFLOWLINKClientEvent setAutoShortcutTemplateUsed:](v5, "setAutoShortcutTemplateUsed:", v25);

    }
    v38 = (void *)v16;
    v39 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkActionTier1"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[FLOWLINKSchemaFLOWLINKActionTier1 initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionTier1 alloc], "initWithDictionary:", v26);
      -[FLOWLINKSchemaFLOWLINKClientEvent setLinkActionTier1:](v5, "setLinkActionTier1:", v27);

    }
    v28 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionParameterUpdated"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[FLOWLINKSchemaFLOWLINKActionParametersUpdated initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionParametersUpdated alloc], "initWithDictionary:", v29);
      -[FLOWLINKSchemaFLOWLINKClientEvent setActionParameterUpdated:](v5, "setActionParameterUpdated:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appShortcutFirstRunConfirmationContext"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext initWithDictionary:]([FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext alloc], "initWithDictionary:", v31);
      -[FLOWLINKSchemaFLOWLINKClientEvent setAppShortcutFirstRunConfirmationContext:](v5, "setAppShortcutFirstRunConfirmationContext:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appShortcutGeneralizedExecutionUsed"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed initWithDictionary:]([FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed alloc], "initWithDictionary:", v33);
      -[FLOWLINKSchemaFLOWLINKClientEvent setAppShortcutGeneralizedExecutionUsed:](v5, "setAppShortcutGeneralizedExecutionUsed:", v34);

    }
    v35 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (FLOWSchemaFLOWEventMetadata)eventMetadata
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

- (BOOL)hasLinkActionContext
{
  return self->_hasLinkActionContext;
}

- (void)setHasLinkActionContext:(BOOL)a3
{
  self->_hasLinkActionContext = a3;
}

- (BOOL)hasEntityDisambiguationContext
{
  return self->_hasEntityDisambiguationContext;
}

- (void)setHasEntityDisambiguationContext:(BOOL)a3
{
  self->_hasEntityDisambiguationContext = a3;
}

- (BOOL)hasActionConversionContext
{
  return self->_hasActionConversionContext;
}

- (void)setHasActionConversionContext:(BOOL)a3
{
  self->_hasActionConversionContext = a3;
}

- (BOOL)hasActionExecutionContext
{
  return self->_hasActionExecutionContext;
}

- (void)setHasActionExecutionContext:(BOOL)a3
{
  self->_hasActionExecutionContext = a3;
}

- (BOOL)hasActionPromptForValueContext
{
  return self->_hasActionPromptForValueContext;
}

- (void)setHasActionPromptForValueContext:(BOOL)a3
{
  self->_hasActionPromptForValueContext = a3;
}

- (BOOL)hasActionParameterDisambiguationContext
{
  return self->_hasActionParameterDisambiguationContext;
}

- (void)setHasActionParameterDisambiguationContext:(BOOL)a3
{
  self->_hasActionParameterDisambiguationContext = a3;
}

- (BOOL)hasActionParameterConfirmationContext
{
  return self->_hasActionParameterConfirmationContext;
}

- (void)setHasActionParameterConfirmationContext:(BOOL)a3
{
  self->_hasActionParameterConfirmationContext = a3;
}

- (BOOL)hasActionConfirmationContext
{
  return self->_hasActionConfirmationContext;
}

- (void)setHasActionConfirmationContext:(BOOL)a3
{
  self->_hasActionConfirmationContext = a3;
}

- (BOOL)hasAutoShortcutTemplateUsed
{
  return self->_hasAutoShortcutTemplateUsed;
}

- (void)setHasAutoShortcutTemplateUsed:(BOOL)a3
{
  self->_hasAutoShortcutTemplateUsed = a3;
}

- (BOOL)hasLinkActionTier1
{
  return self->_hasLinkActionTier1;
}

- (void)setHasLinkActionTier1:(BOOL)a3
{
  self->_hasLinkActionTier1 = a3;
}

- (BOOL)hasActionParameterUpdated
{
  return self->_hasActionParameterUpdated;
}

- (void)setHasActionParameterUpdated:(BOOL)a3
{
  self->_hasActionParameterUpdated = a3;
}

- (BOOL)hasAppShortcutFirstRunConfirmationContext
{
  return self->_hasAppShortcutFirstRunConfirmationContext;
}

- (void)setHasAppShortcutFirstRunConfirmationContext:(BOOL)a3
{
  self->_hasAppShortcutFirstRunConfirmationContext = a3;
}

- (BOOL)hasAppShortcutGeneralizedExecutionUsed
{
  return self->_hasAppShortcutGeneralizedExecutionUsed;
}

- (void)setHasAppShortcutGeneralizedExecutionUsed:(BOOL)a3
{
  self->_hasAppShortcutGeneralizedExecutionUsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appShortcutGeneralizedExecutionUsed, 0);
  objc_storeStrong((id *)&self->_appShortcutFirstRunConfirmationContext, 0);
  objc_storeStrong((id *)&self->_actionParameterUpdated, 0);
  objc_storeStrong((id *)&self->_linkActionTier1, 0);
  objc_storeStrong((id *)&self->_autoShortcutTemplateUsed, 0);
  objc_storeStrong((id *)&self->_actionConfirmationContext, 0);
  objc_storeStrong((id *)&self->_actionParameterConfirmationContext, 0);
  objc_storeStrong((id *)&self->_actionParameterDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_actionPromptForValueContext, 0);
  objc_storeStrong((id *)&self->_actionExecutionContext, 0);
  objc_storeStrong((id *)&self->_actionConversionContext, 0);
  objc_storeStrong((id *)&self->_entityDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_linkActionContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 53;
}

@end
