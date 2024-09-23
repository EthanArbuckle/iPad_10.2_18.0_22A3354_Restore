@implementation MTSchemaMTClientEventV2

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[MTSchemaMTClientEventV2 eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mtId");
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
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)MTSchemaMTClientEventV2;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v55, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSchemaMTClientEventV2 eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MTSchemaMTClientEventV2 deleteEventMetadata](self, "deleteEventMetadata");
  -[MTSchemaMTClientEventV2 batchRequestContext](self, "batchRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MTSchemaMTClientEventV2 deleteBatchRequestContext](self, "deleteBatchRequestContext");
  -[MTSchemaMTClientEventV2 invocationContext](self, "invocationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MTSchemaMTClientEventV2 deleteInvocationContext](self, "deleteInvocationContext");
  -[MTSchemaMTClientEventV2 asrStateUpdated](self, "asrStateUpdated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[MTSchemaMTClientEventV2 deleteAsrStateUpdated](self, "deleteAsrStateUpdated");
  -[MTSchemaMTClientEventV2 localePairResolved](self, "localePairResolved");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[MTSchemaMTClientEventV2 deleteLocalePairResolved](self, "deleteLocalePairResolved");
  -[MTSchemaMTClientEventV2 invocationStartedTier1](self, "invocationStartedTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[MTSchemaMTClientEventV2 deleteInvocationStartedTier1](self, "deleteInvocationStartedTier1");
  -[MTSchemaMTClientEventV2 appNextButtonTapped](self, "appNextButtonTapped");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[MTSchemaMTClientEventV2 deleteAppNextButtonTapped](self, "deleteAppNextButtonTapped");
  -[MTSchemaMTClientEventV2 appTextBoxDismissed](self, "appTextBoxDismissed");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[MTSchemaMTClientEventV2 deleteAppTextBoxDismissed](self, "deleteAppTextBoxDismissed");
  -[MTSchemaMTClientEventV2 appTimedOut](self, "appTimedOut");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[MTSchemaMTClientEventV2 deleteAppTimedOut](self, "deleteAppTimedOut");
  -[MTSchemaMTClientEventV2 frameworkRequestSent](self, "frameworkRequestSent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[MTSchemaMTClientEventV2 deleteFrameworkRequestSent](self, "deleteFrameworkRequestSent");
  -[MTSchemaMTClientEventV2 frameworkRequestResponseReceived](self, "frameworkRequestResponseReceived");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[MTSchemaMTClientEventV2 deleteFrameworkRequestResponseReceived](self, "deleteFrameworkRequestResponseReceived");
  -[MTSchemaMTClientEventV2 appBackgrounded](self, "appBackgrounded");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[MTSchemaMTClientEventV2 deleteAppBackgrounded](self, "deleteAppBackgrounded");
  -[MTSchemaMTClientEventV2 languageIdentificationCompleted](self, "languageIdentificationCompleted");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[MTSchemaMTClientEventV2 deleteLanguageIdentificationCompleted](self, "deleteLanguageIdentificationCompleted");
  -[MTSchemaMTClientEventV2 languageDisambiguationUIShown](self, "languageDisambiguationUIShown");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[MTSchemaMTClientEventV2 deleteLanguageDisambiguationUIShown](self, "deleteLanguageDisambiguationUIShown");
  -[MTSchemaMTClientEventV2 languageDisambiguationUISelected](self, "languageDisambiguationUISelected");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[MTSchemaMTClientEventV2 deleteLanguageDisambiguationUISelected](self, "deleteLanguageDisambiguationUISelected");
  -[MTSchemaMTClientEventV2 translationTTSPlayed](self, "translationTTSPlayed");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[MTSchemaMTClientEventV2 deleteTranslationTTSPlayed](self, "deleteTranslationTTSPlayed");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[MTSchemaMTClientEventV2 whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0xE)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629E48[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0xE)
    return 0;
  else
    return off_1E5629EC0[a3 - 101];
}

- (int)clockIsolationLevel
{
  if (-[MTSchemaMTClientEventV2 whichEvent_Type](self, "whichEvent_Type") - 101 >= 0xF)
    return 1;
  else
    return 2;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[MTSchemaMTClientEventV2 whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0xE)
    return CFSTR("com.apple.aiml.mi.mt.MTClientEventV2");
  else
    return off_1E5630870[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[MTSchemaMTClientEventV2 setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setBatchRequestContext:(id)a3
{
  MTSchemaMTBatchRequestContext *v4;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTBatchRequestContext *batchRequestContext;

  v4 = (MTSchemaMTBatchRequestContext *)a3;
  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 101;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = v4;

}

- (MTSchemaMTBatchRequestContext)batchRequestContext
{
  if (self->_whichEvent_Type == 101)
    return self->_batchRequestContext;
  else
    return (MTSchemaMTBatchRequestContext *)0;
}

- (void)deleteBatchRequestContext
{
  MTSchemaMTBatchRequestContext *batchRequestContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    batchRequestContext = self->_batchRequestContext;
    self->_batchRequestContext = 0;

  }
}

- (void)setInvocationContext:(id)a3
{
  MTSchemaMTInvocationContext *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTInvocationContext *invocationContext;

  v4 = (MTSchemaMTInvocationContext *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 102;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  invocationContext = self->_invocationContext;
  self->_invocationContext = v4;

}

- (MTSchemaMTInvocationContext)invocationContext
{
  if (self->_whichEvent_Type == 102)
    return self->_invocationContext;
  else
    return (MTSchemaMTInvocationContext *)0;
}

- (void)deleteInvocationContext
{
  MTSchemaMTInvocationContext *invocationContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    invocationContext = self->_invocationContext;
    self->_invocationContext = 0;

  }
}

- (void)setAsrStateUpdated:(id)a3
{
  MTSchemaMTASRStateUpdated *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTASRStateUpdated *asrStateUpdated;

  v4 = (MTSchemaMTASRStateUpdated *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 103;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = v4;

}

- (MTSchemaMTASRStateUpdated)asrStateUpdated
{
  if (self->_whichEvent_Type == 103)
    return self->_asrStateUpdated;
  else
    return (MTSchemaMTASRStateUpdated *)0;
}

- (void)deleteAsrStateUpdated
{
  MTSchemaMTASRStateUpdated *asrStateUpdated;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    asrStateUpdated = self->_asrStateUpdated;
    self->_asrStateUpdated = 0;

  }
}

- (void)setLocalePairResolved:(id)a3
{
  MTSchemaMTLocalePairResolved *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTLocalePairResolved *localePairResolved;

  v4 = (MTSchemaMTLocalePairResolved *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 104;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = v4;

}

- (MTSchemaMTLocalePairResolved)localePairResolved
{
  if (self->_whichEvent_Type == 104)
    return self->_localePairResolved;
  else
    return (MTSchemaMTLocalePairResolved *)0;
}

- (void)deleteLocalePairResolved
{
  MTSchemaMTLocalePairResolved *localePairResolved;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    localePairResolved = self->_localePairResolved;
    self->_localePairResolved = 0;

  }
}

- (void)setInvocationStartedTier1:(id)a3
{
  MTSchemaMTInvocationStartedTier1 *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;

  v4 = (MTSchemaMTInvocationStartedTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 105;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = v4;

}

- (MTSchemaMTInvocationStartedTier1)invocationStartedTier1
{
  if (self->_whichEvent_Type == 105)
    return self->_invocationStartedTier1;
  else
    return (MTSchemaMTInvocationStartedTier1 *)0;
}

- (void)deleteInvocationStartedTier1
{
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    invocationStartedTier1 = self->_invocationStartedTier1;
    self->_invocationStartedTier1 = 0;

  }
}

- (void)setAppNextButtonTapped:(id)a3
{
  MTSchemaMTAppNextButtonTappedTier1 *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;

  v4 = (MTSchemaMTAppNextButtonTappedTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 106;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = v4;

}

- (MTSchemaMTAppNextButtonTappedTier1)appNextButtonTapped
{
  if (self->_whichEvent_Type == 106)
    return self->_appNextButtonTapped;
  else
    return (MTSchemaMTAppNextButtonTappedTier1 *)0;
}

- (void)deleteAppNextButtonTapped
{
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    appNextButtonTapped = self->_appNextButtonTapped;
    self->_appNextButtonTapped = 0;

  }
}

- (void)setAppTextBoxDismissed:(id)a3
{
  MTSchemaMTAppTextBoxDismissedTier1 *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;

  v4 = (MTSchemaMTAppTextBoxDismissedTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 107;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = v4;

}

- (MTSchemaMTAppTextBoxDismissedTier1)appTextBoxDismissed
{
  if (self->_whichEvent_Type == 107)
    return self->_appTextBoxDismissed;
  else
    return (MTSchemaMTAppTextBoxDismissedTier1 *)0;
}

- (void)deleteAppTextBoxDismissed
{
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    appTextBoxDismissed = self->_appTextBoxDismissed;
    self->_appTextBoxDismissed = 0;

  }
}

- (void)setAppTimedOut:(id)a3
{
  MTSchemaMTAppTimedOutTier1 *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;

  v4 = (MTSchemaMTAppTimedOutTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 108;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = v4;

}

- (MTSchemaMTAppTimedOutTier1)appTimedOut
{
  if (self->_whichEvent_Type == 108)
    return self->_appTimedOut;
  else
    return (MTSchemaMTAppTimedOutTier1 *)0;
}

- (void)deleteAppTimedOut
{
  MTSchemaMTAppTimedOutTier1 *appTimedOut;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    appTimedOut = self->_appTimedOut;
    self->_appTimedOut = 0;

  }
}

- (void)setFrameworkRequestSent:(id)a3
{
  MTSchemaMTFrameworkRequestSent *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;

  v4 = (MTSchemaMTFrameworkRequestSent *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 109;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = v4;

}

- (MTSchemaMTFrameworkRequestSent)frameworkRequestSent
{
  if (self->_whichEvent_Type == 109)
    return self->_frameworkRequestSent;
  else
    return (MTSchemaMTFrameworkRequestSent *)0;
}

- (void)deleteFrameworkRequestSent
{
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    frameworkRequestSent = self->_frameworkRequestSent;
    self->_frameworkRequestSent = 0;

  }
}

- (void)setFrameworkRequestResponseReceived:(id)a3
{
  MTSchemaMTFrameworkRequestResponseReceived *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;

  v4 = (MTSchemaMTFrameworkRequestResponseReceived *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 110;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = v4;

}

- (MTSchemaMTFrameworkRequestResponseReceived)frameworkRequestResponseReceived
{
  if (self->_whichEvent_Type == 110)
    return self->_frameworkRequestResponseReceived;
  else
    return (MTSchemaMTFrameworkRequestResponseReceived *)0;
}

- (void)deleteFrameworkRequestResponseReceived
{
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
    self->_frameworkRequestResponseReceived = 0;

  }
}

- (void)setAppBackgrounded:(id)a3
{
  MTSchemaMTAppBackgroundedTier1 *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;

  v4 = (MTSchemaMTAppBackgroundedTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 111;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = v4;

}

- (MTSchemaMTAppBackgroundedTier1)appBackgrounded
{
  if (self->_whichEvent_Type == 111)
    return self->_appBackgrounded;
  else
    return (MTSchemaMTAppBackgroundedTier1 *)0;
}

- (void)deleteAppBackgrounded
{
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    appBackgrounded = self->_appBackgrounded;
    self->_appBackgrounded = 0;

  }
}

- (void)setLanguageIdentificationCompleted:(id)a3
{
  MTSchemaMTLanguageIdentificationCompleted *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;

  v4 = (MTSchemaMTLanguageIdentificationCompleted *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 112;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = v4;

}

- (MTSchemaMTLanguageIdentificationCompleted)languageIdentificationCompleted
{
  if (self->_whichEvent_Type == 112)
    return self->_languageIdentificationCompleted;
  else
    return (MTSchemaMTLanguageIdentificationCompleted *)0;
}

- (void)deleteLanguageIdentificationCompleted
{
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    languageIdentificationCompleted = self->_languageIdentificationCompleted;
    self->_languageIdentificationCompleted = 0;

  }
}

- (void)setLanguageDisambiguationUIShown:(id)a3
{
  MTSchemaMTLanguageDisambiguationUIShown *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;

  v4 = (MTSchemaMTLanguageDisambiguationUIShown *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 113;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = v4;

}

- (MTSchemaMTLanguageDisambiguationUIShown)languageDisambiguationUIShown
{
  if (self->_whichEvent_Type == 113)
    return self->_languageDisambiguationUIShown;
  else
    return (MTSchemaMTLanguageDisambiguationUIShown *)0;
}

- (void)deleteLanguageDisambiguationUIShown
{
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
    self->_languageDisambiguationUIShown = 0;

  }
}

- (void)setLanguageDisambiguationUISelected:(id)a3
{
  MTSchemaMTLanguageDisambiguationUISelected *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;
  unint64_t v19;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;

  v4 = (MTSchemaMTLanguageDisambiguationUISelected *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  v19 = 114;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = v4;

}

- (MTSchemaMTLanguageDisambiguationUISelected)languageDisambiguationUISelected
{
  if (self->_whichEvent_Type == 114)
    return self->_languageDisambiguationUISelected;
  else
    return (MTSchemaMTLanguageDisambiguationUISelected *)0;
}

- (void)deleteLanguageDisambiguationUISelected
{
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;

  if (self->_whichEvent_Type == 114)
  {
    self->_whichEvent_Type = 0;
    languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
    self->_languageDisambiguationUISelected = 0;

  }
}

- (void)setTranslationTTSPlayed:(id)a3
{
  MTSchemaMTTranslationTTSPlayed *v4;
  MTSchemaMTBatchRequestContext *batchRequestContext;
  MTSchemaMTInvocationContext *invocationContext;
  MTSchemaMTASRStateUpdated *asrStateUpdated;
  MTSchemaMTLocalePairResolved *localePairResolved;
  MTSchemaMTInvocationStartedTier1 *invocationStartedTier1;
  MTSchemaMTAppNextButtonTappedTier1 *appNextButtonTapped;
  MTSchemaMTAppTextBoxDismissedTier1 *appTextBoxDismissed;
  MTSchemaMTAppTimedOutTier1 *appTimedOut;
  MTSchemaMTFrameworkRequestSent *frameworkRequestSent;
  MTSchemaMTFrameworkRequestResponseReceived *frameworkRequestResponseReceived;
  MTSchemaMTAppBackgroundedTier1 *appBackgrounded;
  MTSchemaMTLanguageIdentificationCompleted *languageIdentificationCompleted;
  MTSchemaMTLanguageDisambiguationUIShown *languageDisambiguationUIShown;
  MTSchemaMTLanguageDisambiguationUISelected *languageDisambiguationUISelected;
  unint64_t v19;
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;

  v4 = (MTSchemaMTTranslationTTSPlayed *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  v19 = 115;
  if (!v4)
    v19 = 0;
  self->_whichEvent_Type = v19;
  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = v4;

}

- (MTSchemaMTTranslationTTSPlayed)translationTTSPlayed
{
  if (self->_whichEvent_Type == 115)
    return self->_translationTTSPlayed;
  else
    return (MTSchemaMTTranslationTTSPlayed *)0;
}

- (void)deleteTranslationTTSPlayed
{
  MTSchemaMTTranslationTTSPlayed *translationTTSPlayed;

  if (self->_whichEvent_Type == 115)
  {
    self->_whichEvent_Type = 0;
    translationTTSPlayed = self->_translationTTSPlayed;
    self->_translationTTSPlayed = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTClientEventV2ReadFrom(self, (uint64_t)a3);
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  -[MTSchemaMTClientEventV2 eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTSchemaMTClientEventV2 eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 batchRequestContext](self, "batchRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MTSchemaMTClientEventV2 batchRequestContext](self, "batchRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 invocationContext](self, "invocationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MTSchemaMTClientEventV2 invocationContext](self, "invocationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 asrStateUpdated](self, "asrStateUpdated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MTSchemaMTClientEventV2 asrStateUpdated](self, "asrStateUpdated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 localePairResolved](self, "localePairResolved");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MTSchemaMTClientEventV2 localePairResolved](self, "localePairResolved");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 invocationStartedTier1](self, "invocationStartedTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MTSchemaMTClientEventV2 invocationStartedTier1](self, "invocationStartedTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 appNextButtonTapped](self, "appNextButtonTapped");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MTSchemaMTClientEventV2 appNextButtonTapped](self, "appNextButtonTapped");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 appTextBoxDismissed](self, "appTextBoxDismissed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MTSchemaMTClientEventV2 appTextBoxDismissed](self, "appTextBoxDismissed");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 appTimedOut](self, "appTimedOut");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[MTSchemaMTClientEventV2 appTimedOut](self, "appTimedOut");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 frameworkRequestSent](self, "frameworkRequestSent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MTSchemaMTClientEventV2 frameworkRequestSent](self, "frameworkRequestSent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 frameworkRequestResponseReceived](self, "frameworkRequestResponseReceived");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MTSchemaMTClientEventV2 frameworkRequestResponseReceived](self, "frameworkRequestResponseReceived");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 appBackgrounded](self, "appBackgrounded");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[MTSchemaMTClientEventV2 appBackgrounded](self, "appBackgrounded");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 languageIdentificationCompleted](self, "languageIdentificationCompleted");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[MTSchemaMTClientEventV2 languageIdentificationCompleted](self, "languageIdentificationCompleted");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 languageDisambiguationUIShown](self, "languageDisambiguationUIShown");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[MTSchemaMTClientEventV2 languageDisambiguationUIShown](self, "languageDisambiguationUIShown");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 languageDisambiguationUISelected](self, "languageDisambiguationUISelected");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[MTSchemaMTClientEventV2 languageDisambiguationUISelected](self, "languageDisambiguationUISelected");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTClientEventV2 translationTTSPlayed](self, "translationTTSPlayed");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[MTSchemaMTClientEventV2 translationTTSPlayed](self, "translationTTSPlayed");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  BOOL v88;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_83;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_83;
  -[MTSchemaMTClientEventV2 eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MTSchemaMTClientEventV2 eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 batchRequestContext](self, "batchRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "batchRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 batchRequestContext](self, "batchRequestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[MTSchemaMTClientEventV2 batchRequestContext](self, "batchRequestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "batchRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 invocationContext](self, "invocationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invocationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 invocationContext](self, "invocationContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[MTSchemaMTClientEventV2 invocationContext](self, "invocationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invocationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 asrStateUpdated](self, "asrStateUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrStateUpdated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 asrStateUpdated](self, "asrStateUpdated");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[MTSchemaMTClientEventV2 asrStateUpdated](self, "asrStateUpdated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrStateUpdated");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 localePairResolved](self, "localePairResolved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localePairResolved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 localePairResolved](self, "localePairResolved");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[MTSchemaMTClientEventV2 localePairResolved](self, "localePairResolved");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localePairResolved");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 invocationStartedTier1](self, "invocationStartedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invocationStartedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 invocationStartedTier1](self, "invocationStartedTier1");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[MTSchemaMTClientEventV2 invocationStartedTier1](self, "invocationStartedTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invocationStartedTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 appNextButtonTapped](self, "appNextButtonTapped");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appNextButtonTapped");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 appNextButtonTapped](self, "appNextButtonTapped");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[MTSchemaMTClientEventV2 appNextButtonTapped](self, "appNextButtonTapped");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appNextButtonTapped");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 appTextBoxDismissed](self, "appTextBoxDismissed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appTextBoxDismissed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 appTextBoxDismissed](self, "appTextBoxDismissed");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[MTSchemaMTClientEventV2 appTextBoxDismissed](self, "appTextBoxDismissed");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appTextBoxDismissed");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 appTimedOut](self, "appTimedOut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appTimedOut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 appTimedOut](self, "appTimedOut");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[MTSchemaMTClientEventV2 appTimedOut](self, "appTimedOut");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appTimedOut");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 frameworkRequestSent](self, "frameworkRequestSent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameworkRequestSent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 frameworkRequestSent](self, "frameworkRequestSent");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[MTSchemaMTClientEventV2 frameworkRequestSent](self, "frameworkRequestSent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameworkRequestSent");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 frameworkRequestResponseReceived](self, "frameworkRequestResponseReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameworkRequestResponseReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 frameworkRequestResponseReceived](self, "frameworkRequestResponseReceived");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[MTSchemaMTClientEventV2 frameworkRequestResponseReceived](self, "frameworkRequestResponseReceived");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameworkRequestResponseReceived");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 appBackgrounded](self, "appBackgrounded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBackgrounded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 appBackgrounded](self, "appBackgrounded");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[MTSchemaMTClientEventV2 appBackgrounded](self, "appBackgrounded");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBackgrounded");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 languageIdentificationCompleted](self, "languageIdentificationCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageIdentificationCompleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 languageIdentificationCompleted](self, "languageIdentificationCompleted");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[MTSchemaMTClientEventV2 languageIdentificationCompleted](self, "languageIdentificationCompleted");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageIdentificationCompleted");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 languageDisambiguationUIShown](self, "languageDisambiguationUIShown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageDisambiguationUIShown");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 languageDisambiguationUIShown](self, "languageDisambiguationUIShown");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[MTSchemaMTClientEventV2 languageDisambiguationUIShown](self, "languageDisambiguationUIShown");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageDisambiguationUIShown");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 languageDisambiguationUISelected](self, "languageDisambiguationUISelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageDisambiguationUISelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_82;
  -[MTSchemaMTClientEventV2 languageDisambiguationUISelected](self, "languageDisambiguationUISelected");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[MTSchemaMTClientEventV2 languageDisambiguationUISelected](self, "languageDisambiguationUISelected");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageDisambiguationUISelected");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_83;
  }
  else
  {

  }
  -[MTSchemaMTClientEventV2 translationTTSPlayed](self, "translationTTSPlayed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationTTSPlayed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[MTSchemaMTClientEventV2 translationTTSPlayed](self, "translationTTSPlayed");
    v83 = objc_claimAutoreleasedReturnValue();
    if (!v83)
    {

LABEL_86:
      v88 = 1;
      goto LABEL_84;
    }
    v84 = (void *)v83;
    -[MTSchemaMTClientEventV2 translationTTSPlayed](self, "translationTTSPlayed");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationTTSPlayed");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if ((v87 & 1) != 0)
      goto LABEL_86;
  }
  else
  {
LABEL_82:

  }
LABEL_83:
  v88 = 0;
LABEL_84:

  return v88;
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
  unint64_t v16;
  unint64_t v17;

  v3 = -[MTSchemaMTClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[MTSchemaMTBatchRequestContext hash](self->_batchRequestContext, "hash") ^ v3;
  v5 = -[MTSchemaMTInvocationContext hash](self->_invocationContext, "hash");
  v6 = v4 ^ v5 ^ -[MTSchemaMTASRStateUpdated hash](self->_asrStateUpdated, "hash");
  v7 = -[MTSchemaMTLocalePairResolved hash](self->_localePairResolved, "hash");
  v8 = v7 ^ -[MTSchemaMTInvocationStartedTier1 hash](self->_invocationStartedTier1, "hash");
  v9 = v6 ^ v8 ^ -[MTSchemaMTAppNextButtonTappedTier1 hash](self->_appNextButtonTapped, "hash");
  v10 = -[MTSchemaMTAppTextBoxDismissedTier1 hash](self->_appTextBoxDismissed, "hash");
  v11 = v10 ^ -[MTSchemaMTAppTimedOutTier1 hash](self->_appTimedOut, "hash");
  v12 = v11 ^ -[MTSchemaMTFrameworkRequestSent hash](self->_frameworkRequestSent, "hash");
  v13 = v9 ^ v12 ^ -[MTSchemaMTFrameworkRequestResponseReceived hash](self->_frameworkRequestResponseReceived, "hash");
  v14 = -[MTSchemaMTAppBackgroundedTier1 hash](self->_appBackgrounded, "hash");
  v15 = v14 ^ -[MTSchemaMTLanguageIdentificationCompleted hash](self->_languageIdentificationCompleted, "hash");
  v16 = v15 ^ -[MTSchemaMTLanguageDisambiguationUIShown hash](self->_languageDisambiguationUIShown, "hash");
  v17 = v16 ^ -[MTSchemaMTLanguageDisambiguationUISelected hash](self->_languageDisambiguationUISelected, "hash");
  return v13 ^ v17 ^ -[MTSchemaMTTranslationTTSPlayed hash](self->_translationTTSPlayed, "hash");
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appBackgrounded)
  {
    -[MTSchemaMTClientEventV2 appBackgrounded](self, "appBackgrounded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appBackgrounded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appBackgrounded"));

    }
  }
  if (self->_appNextButtonTapped)
  {
    -[MTSchemaMTClientEventV2 appNextButtonTapped](self, "appNextButtonTapped");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appNextButtonTapped"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appNextButtonTapped"));

    }
  }
  if (self->_appTextBoxDismissed)
  {
    -[MTSchemaMTClientEventV2 appTextBoxDismissed](self, "appTextBoxDismissed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appTextBoxDismissed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appTextBoxDismissed"));

    }
  }
  if (self->_appTimedOut)
  {
    -[MTSchemaMTClientEventV2 appTimedOut](self, "appTimedOut");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appTimedOut"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("appTimedOut"));

    }
  }
  if (self->_asrStateUpdated)
  {
    -[MTSchemaMTClientEventV2 asrStateUpdated](self, "asrStateUpdated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("asrStateUpdated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("asrStateUpdated"));

    }
  }
  if (self->_batchRequestContext)
  {
    -[MTSchemaMTClientEventV2 batchRequestContext](self, "batchRequestContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("batchRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("batchRequestContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[MTSchemaMTClientEventV2 eventMetadata](self, "eventMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("eventMetadata"));

    }
  }
  if (self->_frameworkRequestResponseReceived)
  {
    -[MTSchemaMTClientEventV2 frameworkRequestResponseReceived](self, "frameworkRequestResponseReceived");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("frameworkRequestResponseReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("frameworkRequestResponseReceived"));

    }
  }
  if (self->_frameworkRequestSent)
  {
    -[MTSchemaMTClientEventV2 frameworkRequestSent](self, "frameworkRequestSent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("frameworkRequestSent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("frameworkRequestSent"));

    }
  }
  if (self->_invocationContext)
  {
    -[MTSchemaMTClientEventV2 invocationContext](self, "invocationContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("invocationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("invocationContext"));

    }
  }
  if (self->_invocationStartedTier1)
  {
    -[MTSchemaMTClientEventV2 invocationStartedTier1](self, "invocationStartedTier1");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("invocationStartedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("invocationStartedTier1"));

    }
  }
  if (self->_languageDisambiguationUISelected)
  {
    -[MTSchemaMTClientEventV2 languageDisambiguationUISelected](self, "languageDisambiguationUISelected");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("languageDisambiguationUISelected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("languageDisambiguationUISelected"));

    }
  }
  if (self->_languageDisambiguationUIShown)
  {
    -[MTSchemaMTClientEventV2 languageDisambiguationUIShown](self, "languageDisambiguationUIShown");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("languageDisambiguationUIShown"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("languageDisambiguationUIShown"));

    }
  }
  if (self->_languageIdentificationCompleted)
  {
    -[MTSchemaMTClientEventV2 languageIdentificationCompleted](self, "languageIdentificationCompleted");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("languageIdentificationCompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("languageIdentificationCompleted"));

    }
  }
  if (self->_localePairResolved)
  {
    -[MTSchemaMTClientEventV2 localePairResolved](self, "localePairResolved");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("localePairResolved"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("localePairResolved"));

    }
  }
  if (self->_translationTTSPlayed)
  {
    -[MTSchemaMTClientEventV2 translationTTSPlayed](self, "translationTTSPlayed");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("translationTTSPlayed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("translationTTSPlayed"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTClientEventV2 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTClientEventV2)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTClientEventV2 *v5;
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
    self = -[MTSchemaMTClientEventV2 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTClientEventV2)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTClientEventV2 *v5;
  uint64_t v6;
  MTSchemaMTClientEventMetadata *v7;
  uint64_t v8;
  MTSchemaMTBatchRequestContext *v9;
  uint64_t v10;
  MTSchemaMTInvocationContext *v11;
  uint64_t v12;
  MTSchemaMTASRStateUpdated *v13;
  uint64_t v14;
  MTSchemaMTLocalePairResolved *v15;
  uint64_t v16;
  MTSchemaMTInvocationStartedTier1 *v17;
  uint64_t v18;
  MTSchemaMTAppNextButtonTappedTier1 *v19;
  uint64_t v20;
  MTSchemaMTAppTextBoxDismissedTier1 *v21;
  uint64_t v22;
  MTSchemaMTAppTimedOutTier1 *v23;
  uint64_t v24;
  MTSchemaMTFrameworkRequestSent *v25;
  void *v26;
  MTSchemaMTFrameworkRequestResponseReceived *v27;
  void *v28;
  MTSchemaMTAppBackgroundedTier1 *v29;
  void *v30;
  MTSchemaMTLanguageIdentificationCompleted *v31;
  void *v32;
  void *v33;
  MTSchemaMTLanguageDisambiguationUIShown *v34;
  void *v35;
  MTSchemaMTLanguageDisambiguationUISelected *v36;
  void *v37;
  MTSchemaMTTranslationTTSPlayed *v38;
  MTSchemaMTClientEventV2 *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MTSchemaMTClientEventV2;
  v5 = -[MTSchemaMTClientEventV2 init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[MTSchemaMTClientEventMetadata initWithDictionary:]([MTSchemaMTClientEventMetadata alloc], "initWithDictionary:", v6);
      -[MTSchemaMTClientEventV2 setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchRequestContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[MTSchemaMTBatchRequestContext initWithDictionary:]([MTSchemaMTBatchRequestContext alloc], "initWithDictionary:", v8);
      -[MTSchemaMTClientEventV2 setBatchRequestContext:](v5, "setBatchRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invocationContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[MTSchemaMTInvocationContext initWithDictionary:]([MTSchemaMTInvocationContext alloc], "initWithDictionary:", v10);
      -[MTSchemaMTClientEventV2 setInvocationContext:](v5, "setInvocationContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrStateUpdated"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[MTSchemaMTASRStateUpdated initWithDictionary:]([MTSchemaMTASRStateUpdated alloc], "initWithDictionary:", v12);
      -[MTSchemaMTClientEventV2 setAsrStateUpdated:](v5, "setAsrStateUpdated:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localePairResolved"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[MTSchemaMTLocalePairResolved initWithDictionary:]([MTSchemaMTLocalePairResolved alloc], "initWithDictionary:", v14);
      -[MTSchemaMTClientEventV2 setLocalePairResolved:](v5, "setLocalePairResolved:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invocationStartedTier1"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[MTSchemaMTInvocationStartedTier1 initWithDictionary:]([MTSchemaMTInvocationStartedTier1 alloc], "initWithDictionary:", v16);
      -[MTSchemaMTClientEventV2 setInvocationStartedTier1:](v5, "setInvocationStartedTier1:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appNextButtonTapped"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[MTSchemaMTAppNextButtonTappedTier1 initWithDictionary:]([MTSchemaMTAppNextButtonTappedTier1 alloc], "initWithDictionary:", v18);
      -[MTSchemaMTClientEventV2 setAppNextButtonTapped:](v5, "setAppNextButtonTapped:", v19);

    }
    v48 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appTextBoxDismissed"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[MTSchemaMTAppTextBoxDismissedTier1 initWithDictionary:]([MTSchemaMTAppTextBoxDismissedTier1 alloc], "initWithDictionary:", v20);
      -[MTSchemaMTClientEventV2 setAppTextBoxDismissed:](v5, "setAppTextBoxDismissed:", v21);

    }
    v42 = (void *)v20;
    v47 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appTimedOut"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[MTSchemaMTAppTimedOutTier1 initWithDictionary:]([MTSchemaMTAppTimedOutTier1 alloc], "initWithDictionary:", v22);
      -[MTSchemaMTClientEventV2 setAppTimedOut:](v5, "setAppTimedOut:", v23);

    }
    v46 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameworkRequestSent"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[MTSchemaMTFrameworkRequestSent initWithDictionary:]([MTSchemaMTFrameworkRequestSent alloc], "initWithDictionary:", v24);
      -[MTSchemaMTClientEventV2 setFrameworkRequestSent:](v5, "setFrameworkRequestSent:", v25);

    }
    v45 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameworkRequestResponseReceived"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[MTSchemaMTFrameworkRequestResponseReceived initWithDictionary:]([MTSchemaMTFrameworkRequestResponseReceived alloc], "initWithDictionary:", v26);
      -[MTSchemaMTClientEventV2 setFrameworkRequestResponseReceived:](v5, "setFrameworkRequestResponseReceived:", v27);

    }
    v44 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBackgrounded"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[MTSchemaMTAppBackgroundedTier1 initWithDictionary:]([MTSchemaMTAppBackgroundedTier1 alloc], "initWithDictionary:", v28);
      -[MTSchemaMTClientEventV2 setAppBackgrounded:](v5, "setAppBackgrounded:", v29);

    }
    v41 = (void *)v24;
    v43 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageIdentificationCompleted"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[MTSchemaMTLanguageIdentificationCompleted initWithDictionary:]([MTSchemaMTLanguageIdentificationCompleted alloc], "initWithDictionary:", v30);
      -[MTSchemaMTClientEventV2 setLanguageIdentificationCompleted:](v5, "setLanguageIdentificationCompleted:", v31);

    }
    v32 = (void *)v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageDisambiguationUIShown"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[MTSchemaMTLanguageDisambiguationUIShown initWithDictionary:]([MTSchemaMTLanguageDisambiguationUIShown alloc], "initWithDictionary:", v33);
      -[MTSchemaMTClientEventV2 setLanguageDisambiguationUIShown:](v5, "setLanguageDisambiguationUIShown:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageDisambiguationUISelected"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = -[MTSchemaMTLanguageDisambiguationUISelected initWithDictionary:]([MTSchemaMTLanguageDisambiguationUISelected alloc], "initWithDictionary:", v35);
      -[MTSchemaMTClientEventV2 setLanguageDisambiguationUISelected:](v5, "setLanguageDisambiguationUISelected:", v36);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("translationTTSPlayed"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[MTSchemaMTTranslationTTSPlayed initWithDictionary:]([MTSchemaMTTranslationTTSPlayed alloc], "initWithDictionary:", v37);
      -[MTSchemaMTClientEventV2 setTranslationTTSPlayed:](v5, "setTranslationTTSPlayed:", v38);

    }
    v39 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (MTSchemaMTClientEventMetadata)eventMetadata
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

- (BOOL)hasBatchRequestContext
{
  return self->_hasBatchRequestContext;
}

- (void)setHasBatchRequestContext:(BOOL)a3
{
  self->_hasBatchRequestContext = a3;
}

- (BOOL)hasInvocationContext
{
  return self->_hasInvocationContext;
}

- (void)setHasInvocationContext:(BOOL)a3
{
  self->_hasInvocationContext = a3;
}

- (BOOL)hasAsrStateUpdated
{
  return self->_hasAsrStateUpdated;
}

- (void)setHasAsrStateUpdated:(BOOL)a3
{
  self->_hasAsrStateUpdated = a3;
}

- (BOOL)hasLocalePairResolved
{
  return self->_hasLocalePairResolved;
}

- (void)setHasLocalePairResolved:(BOOL)a3
{
  self->_hasLocalePairResolved = a3;
}

- (BOOL)hasInvocationStartedTier1
{
  return self->_hasInvocationStartedTier1;
}

- (void)setHasInvocationStartedTier1:(BOOL)a3
{
  self->_hasInvocationStartedTier1 = a3;
}

- (BOOL)hasAppNextButtonTapped
{
  return self->_hasAppNextButtonTapped;
}

- (void)setHasAppNextButtonTapped:(BOOL)a3
{
  self->_hasAppNextButtonTapped = a3;
}

- (BOOL)hasAppTextBoxDismissed
{
  return self->_hasAppTextBoxDismissed;
}

- (void)setHasAppTextBoxDismissed:(BOOL)a3
{
  self->_hasAppTextBoxDismissed = a3;
}

- (BOOL)hasAppTimedOut
{
  return self->_hasAppTimedOut;
}

- (void)setHasAppTimedOut:(BOOL)a3
{
  self->_hasAppTimedOut = a3;
}

- (BOOL)hasFrameworkRequestSent
{
  return self->_hasFrameworkRequestSent;
}

- (void)setHasFrameworkRequestSent:(BOOL)a3
{
  self->_hasFrameworkRequestSent = a3;
}

- (BOOL)hasFrameworkRequestResponseReceived
{
  return self->_hasFrameworkRequestResponseReceived;
}

- (void)setHasFrameworkRequestResponseReceived:(BOOL)a3
{
  self->_hasFrameworkRequestResponseReceived = a3;
}

- (BOOL)hasAppBackgrounded
{
  return self->_hasAppBackgrounded;
}

- (void)setHasAppBackgrounded:(BOOL)a3
{
  self->_hasAppBackgrounded = a3;
}

- (BOOL)hasLanguageIdentificationCompleted
{
  return self->_hasLanguageIdentificationCompleted;
}

- (void)setHasLanguageIdentificationCompleted:(BOOL)a3
{
  self->_hasLanguageIdentificationCompleted = a3;
}

- (BOOL)hasLanguageDisambiguationUIShown
{
  return self->_hasLanguageDisambiguationUIShown;
}

- (void)setHasLanguageDisambiguationUIShown:(BOOL)a3
{
  self->_hasLanguageDisambiguationUIShown = a3;
}

- (BOOL)hasLanguageDisambiguationUISelected
{
  return self->_hasLanguageDisambiguationUISelected;
}

- (void)setHasLanguageDisambiguationUISelected:(BOOL)a3
{
  self->_hasLanguageDisambiguationUISelected = a3;
}

- (BOOL)hasTranslationTTSPlayed
{
  return self->_hasTranslationTTSPlayed;
}

- (void)setHasTranslationTTSPlayed:(BOOL)a3
{
  self->_hasTranslationTTSPlayed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationTTSPlayed, 0);
  objc_storeStrong((id *)&self->_languageDisambiguationUISelected, 0);
  objc_storeStrong((id *)&self->_languageDisambiguationUIShown, 0);
  objc_storeStrong((id *)&self->_languageIdentificationCompleted, 0);
  objc_storeStrong((id *)&self->_appBackgrounded, 0);
  objc_storeStrong((id *)&self->_frameworkRequestResponseReceived, 0);
  objc_storeStrong((id *)&self->_frameworkRequestSent, 0);
  objc_storeStrong((id *)&self->_appTimedOut, 0);
  objc_storeStrong((id *)&self->_appTextBoxDismissed, 0);
  objc_storeStrong((id *)&self->_appNextButtonTapped, 0);
  objc_storeStrong((id *)&self->_invocationStartedTier1, 0);
  objc_storeStrong((id *)&self->_localePairResolved, 0);
  objc_storeStrong((id *)&self->_asrStateUpdated, 0);
  objc_storeStrong((id *)&self->_invocationContext, 0);
  objc_storeStrong((id *)&self->_batchRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 43;
}

@end
