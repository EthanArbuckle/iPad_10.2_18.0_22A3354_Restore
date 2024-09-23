@implementation LTSchemaMTClientEvent

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
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)LTSchemaMTClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v31, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTSchemaMTClientEvent safariFeedbackEvent](self, "safariFeedbackEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[LTSchemaMTClientEvent deleteSafariFeedbackEvent](self, "deleteSafariFeedbackEvent");
  -[LTSchemaMTClientEvent batchTranslationEvent](self, "batchTranslationEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[LTSchemaMTClientEvent deleteBatchTranslationEvent](self, "deleteBatchTranslationEvent");
  -[LTSchemaMTClientEvent speechTranslationEvent](self, "speechTranslationEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[LTSchemaMTClientEvent deleteSpeechTranslationEvent](self, "deleteSpeechTranslationEvent");
  -[LTSchemaMTClientEvent lidSpeechTranslationEvent](self, "lidSpeechTranslationEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[LTSchemaMTClientEvent deleteLidSpeechTranslationEvent](self, "deleteLidSpeechTranslationEvent");
  -[LTSchemaMTClientEvent disambiguationSpeechTranslationEvent](self, "disambiguationSpeechTranslationEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[LTSchemaMTClientEvent deleteDisambiguationSpeechTranslationEvent](self, "deleteDisambiguationSpeechTranslationEvent");
  -[LTSchemaMTClientEvent asrSpeechTranslationEvent](self, "asrSpeechTranslationEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[LTSchemaMTClientEvent deleteAsrSpeechTranslationEvent](self, "deleteAsrSpeechTranslationEvent");
  -[LTSchemaMTClientEvent mtSpeechTranslationEvent](self, "mtSpeechTranslationEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[LTSchemaMTClientEvent deleteMtSpeechTranslationEvent](self, "deleteMtSpeechTranslationEvent");
  -[LTSchemaMTClientEvent ttsspeechTranslationEvent](self, "ttsspeechTranslationEvent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[LTSchemaMTClientEvent deleteTtsspeechTranslationEvent](self, "deleteTtsspeechTranslationEvent");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[LTSchemaMTClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 7)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629DC8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 7)
    return 0;
  else
    return off_1E5629E08[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[LTSchemaMTClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 7)
    return CFSTR("com.apple.aiml.mi.translation.MTClientEvent");
  else
    return off_1E562FE38[v2 - 101];
}

- (void)setSafariFeedbackEvent:(id)a3
{
  LTSchemaSafariFeedbackEvent *v4;
  LTSchemaBatchTranslationEvent *batchTranslationEvent;
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;
  unint64_t v12;
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;

  v4 = (LTSchemaSafariFeedbackEvent *)a3;
  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  v12 = 101;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = v4;

}

- (LTSchemaSafariFeedbackEvent)safariFeedbackEvent
{
  if (self->_whichEvent_Type == 101)
    return self->_safariFeedbackEvent;
  else
    return (LTSchemaSafariFeedbackEvent *)0;
}

- (void)deleteSafariFeedbackEvent
{
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    safariFeedbackEvent = self->_safariFeedbackEvent;
    self->_safariFeedbackEvent = 0;

  }
}

- (void)setBatchTranslationEvent:(id)a3
{
  LTSchemaBatchTranslationEvent *v4;
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;
  unint64_t v12;
  LTSchemaBatchTranslationEvent *batchTranslationEvent;

  v4 = (LTSchemaBatchTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  v12 = 102;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = v4;

}

- (LTSchemaBatchTranslationEvent)batchTranslationEvent
{
  if (self->_whichEvent_Type == 102)
    return self->_batchTranslationEvent;
  else
    return (LTSchemaBatchTranslationEvent *)0;
}

- (void)deleteBatchTranslationEvent
{
  LTSchemaBatchTranslationEvent *batchTranslationEvent;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    batchTranslationEvent = self->_batchTranslationEvent;
    self->_batchTranslationEvent = 0;

  }
}

- (void)setSpeechTranslationEvent:(id)a3
{
  LTSchemaSpeechTranslationEvent *v4;
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;
  LTSchemaBatchTranslationEvent *batchTranslationEvent;
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;
  unint64_t v12;
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;

  v4 = (LTSchemaSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  v12 = 103;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = v4;

}

- (LTSchemaSpeechTranslationEvent)speechTranslationEvent
{
  if (self->_whichEvent_Type == 103)
    return self->_speechTranslationEvent;
  else
    return (LTSchemaSpeechTranslationEvent *)0;
}

- (void)deleteSpeechTranslationEvent
{
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    speechTranslationEvent = self->_speechTranslationEvent;
    self->_speechTranslationEvent = 0;

  }
}

- (void)setLidSpeechTranslationEvent:(id)a3
{
  LTSchemaLIDSpeechTranslationEvent *v4;
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;
  LTSchemaBatchTranslationEvent *batchTranslationEvent;
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;
  unint64_t v12;
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;

  v4 = (LTSchemaLIDSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  v12 = 104;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = v4;

}

- (LTSchemaLIDSpeechTranslationEvent)lidSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 104)
    return self->_lidSpeechTranslationEvent;
  else
    return (LTSchemaLIDSpeechTranslationEvent *)0;
}

- (void)deleteLidSpeechTranslationEvent
{
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
    self->_lidSpeechTranslationEvent = 0;

  }
}

- (void)setDisambiguationSpeechTranslationEvent:(id)a3
{
  LTSchemaDisambiguationSpeechTranslationEvent *v4;
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;
  LTSchemaBatchTranslationEvent *batchTranslationEvent;
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;
  unint64_t v12;
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;

  v4 = (LTSchemaDisambiguationSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  v12 = 105;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = v4;

}

- (LTSchemaDisambiguationSpeechTranslationEvent)disambiguationSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 105)
    return self->_disambiguationSpeechTranslationEvent;
  else
    return (LTSchemaDisambiguationSpeechTranslationEvent *)0;
}

- (void)deleteDisambiguationSpeechTranslationEvent
{
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
    self->_disambiguationSpeechTranslationEvent = 0;

  }
}

- (void)setAsrSpeechTranslationEvent:(id)a3
{
  LTSchemaASRSpeechTranslationEvent *v4;
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;
  LTSchemaBatchTranslationEvent *batchTranslationEvent;
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;
  unint64_t v12;
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;

  v4 = (LTSchemaASRSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  v12 = 106;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = v4;

}

- (LTSchemaASRSpeechTranslationEvent)asrSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 106)
    return self->_asrSpeechTranslationEvent;
  else
    return (LTSchemaASRSpeechTranslationEvent *)0;
}

- (void)deleteAsrSpeechTranslationEvent
{
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
    self->_asrSpeechTranslationEvent = 0;

  }
}

- (void)setMtSpeechTranslationEvent:(id)a3
{
  LTSchemaMTSpeechTranslationEvent *v4;
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;
  LTSchemaBatchTranslationEvent *batchTranslationEvent;
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;
  unint64_t v12;
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;

  v4 = (LTSchemaMTSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  v12 = 107;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = v4;

}

- (LTSchemaMTSpeechTranslationEvent)mtSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 107)
    return self->_mtSpeechTranslationEvent;
  else
    return (LTSchemaMTSpeechTranslationEvent *)0;
}

- (void)deleteMtSpeechTranslationEvent
{
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
    self->_mtSpeechTranslationEvent = 0;

  }
}

- (void)setTtsspeechTranslationEvent:(id)a3
{
  LTSchemaTTSSpeechTranslationEvent *v4;
  LTSchemaSafariFeedbackEvent *safariFeedbackEvent;
  LTSchemaBatchTranslationEvent *batchTranslationEvent;
  LTSchemaSpeechTranslationEvent *speechTranslationEvent;
  LTSchemaLIDSpeechTranslationEvent *lidSpeechTranslationEvent;
  LTSchemaDisambiguationSpeechTranslationEvent *disambiguationSpeechTranslationEvent;
  LTSchemaASRSpeechTranslationEvent *asrSpeechTranslationEvent;
  LTSchemaMTSpeechTranslationEvent *mtSpeechTranslationEvent;
  unint64_t v12;
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;

  v4 = (LTSchemaTTSSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  v12 = 108;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = v4;

}

- (LTSchemaTTSSpeechTranslationEvent)ttsspeechTranslationEvent
{
  if (self->_whichEvent_Type == 108)
    return self->_ttsspeechTranslationEvent;
  else
    return (LTSchemaTTSSpeechTranslationEvent *)0;
}

- (void)deleteTtsspeechTranslationEvent
{
  LTSchemaTTSSpeechTranslationEvent *ttsspeechTranslationEvent;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
    self->_ttsspeechTranslationEvent = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaMTClientEventReadFrom(self, (uint64_t)a3);
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
  id v20;

  v20 = a3;
  -[LTSchemaMTClientEvent safariFeedbackEvent](self, "safariFeedbackEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LTSchemaMTClientEvent safariFeedbackEvent](self, "safariFeedbackEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaMTClientEvent batchTranslationEvent](self, "batchTranslationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LTSchemaMTClientEvent batchTranslationEvent](self, "batchTranslationEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaMTClientEvent speechTranslationEvent](self, "speechTranslationEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LTSchemaMTClientEvent speechTranslationEvent](self, "speechTranslationEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaMTClientEvent lidSpeechTranslationEvent](self, "lidSpeechTranslationEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[LTSchemaMTClientEvent lidSpeechTranslationEvent](self, "lidSpeechTranslationEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaMTClientEvent disambiguationSpeechTranslationEvent](self, "disambiguationSpeechTranslationEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[LTSchemaMTClientEvent disambiguationSpeechTranslationEvent](self, "disambiguationSpeechTranslationEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaMTClientEvent asrSpeechTranslationEvent](self, "asrSpeechTranslationEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[LTSchemaMTClientEvent asrSpeechTranslationEvent](self, "asrSpeechTranslationEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaMTClientEvent mtSpeechTranslationEvent](self, "mtSpeechTranslationEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[LTSchemaMTClientEvent mtSpeechTranslationEvent](self, "mtSpeechTranslationEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaMTClientEvent ttsspeechTranslationEvent](self, "ttsspeechTranslationEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[LTSchemaMTClientEvent ttsspeechTranslationEvent](self, "ttsspeechTranslationEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v47;
  BOOL v48;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_43;
  -[LTSchemaMTClientEvent safariFeedbackEvent](self, "safariFeedbackEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safariFeedbackEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[LTSchemaMTClientEvent safariFeedbackEvent](self, "safariFeedbackEvent");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[LTSchemaMTClientEvent safariFeedbackEvent](self, "safariFeedbackEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safariFeedbackEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_43;
  }
  else
  {

  }
  -[LTSchemaMTClientEvent batchTranslationEvent](self, "batchTranslationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "batchTranslationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[LTSchemaMTClientEvent batchTranslationEvent](self, "batchTranslationEvent");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[LTSchemaMTClientEvent batchTranslationEvent](self, "batchTranslationEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "batchTranslationEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_43;
  }
  else
  {

  }
  -[LTSchemaMTClientEvent speechTranslationEvent](self, "speechTranslationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechTranslationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[LTSchemaMTClientEvent speechTranslationEvent](self, "speechTranslationEvent");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[LTSchemaMTClientEvent speechTranslationEvent](self, "speechTranslationEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechTranslationEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_43;
  }
  else
  {

  }
  -[LTSchemaMTClientEvent lidSpeechTranslationEvent](self, "lidSpeechTranslationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lidSpeechTranslationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[LTSchemaMTClientEvent lidSpeechTranslationEvent](self, "lidSpeechTranslationEvent");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[LTSchemaMTClientEvent lidSpeechTranslationEvent](self, "lidSpeechTranslationEvent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lidSpeechTranslationEvent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_43;
  }
  else
  {

  }
  -[LTSchemaMTClientEvent disambiguationSpeechTranslationEvent](self, "disambiguationSpeechTranslationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disambiguationSpeechTranslationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[LTSchemaMTClientEvent disambiguationSpeechTranslationEvent](self, "disambiguationSpeechTranslationEvent");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[LTSchemaMTClientEvent disambiguationSpeechTranslationEvent](self, "disambiguationSpeechTranslationEvent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disambiguationSpeechTranslationEvent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_43;
  }
  else
  {

  }
  -[LTSchemaMTClientEvent asrSpeechTranslationEvent](self, "asrSpeechTranslationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrSpeechTranslationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[LTSchemaMTClientEvent asrSpeechTranslationEvent](self, "asrSpeechTranslationEvent");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[LTSchemaMTClientEvent asrSpeechTranslationEvent](self, "asrSpeechTranslationEvent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrSpeechTranslationEvent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_43;
  }
  else
  {

  }
  -[LTSchemaMTClientEvent mtSpeechTranslationEvent](self, "mtSpeechTranslationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mtSpeechTranslationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[LTSchemaMTClientEvent mtSpeechTranslationEvent](self, "mtSpeechTranslationEvent");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[LTSchemaMTClientEvent mtSpeechTranslationEvent](self, "mtSpeechTranslationEvent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mtSpeechTranslationEvent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_43;
  }
  else
  {

  }
  -[LTSchemaMTClientEvent ttsspeechTranslationEvent](self, "ttsspeechTranslationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ttsspeechTranslationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[LTSchemaMTClientEvent ttsspeechTranslationEvent](self, "ttsspeechTranslationEvent");
    v43 = objc_claimAutoreleasedReturnValue();
    if (!v43)
    {

LABEL_46:
      v48 = 1;
      goto LABEL_44;
    }
    v44 = (void *)v43;
    -[LTSchemaMTClientEvent ttsspeechTranslationEvent](self, "ttsspeechTranslationEvent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ttsspeechTranslationEvent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if ((v47 & 1) != 0)
      goto LABEL_46;
  }
  else
  {
LABEL_42:

  }
LABEL_43:
  v48 = 0;
LABEL_44:

  return v48;
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

  v3 = -[LTSchemaSafariFeedbackEvent hash](self->_safariFeedbackEvent, "hash");
  v4 = -[LTSchemaBatchTranslationEvent hash](self->_batchTranslationEvent, "hash") ^ v3;
  v5 = -[LTSchemaSpeechTranslationEvent hash](self->_speechTranslationEvent, "hash");
  v6 = v4 ^ v5 ^ -[LTSchemaLIDSpeechTranslationEvent hash](self->_lidSpeechTranslationEvent, "hash");
  v7 = -[LTSchemaDisambiguationSpeechTranslationEvent hash](self->_disambiguationSpeechTranslationEvent, "hash");
  v8 = v7 ^ -[LTSchemaASRSpeechTranslationEvent hash](self->_asrSpeechTranslationEvent, "hash");
  v9 = v6 ^ v8 ^ -[LTSchemaMTSpeechTranslationEvent hash](self->_mtSpeechTranslationEvent, "hash");
  return v9 ^ -[LTSchemaTTSSpeechTranslationEvent hash](self->_ttsspeechTranslationEvent, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_asrSpeechTranslationEvent)
  {
    -[LTSchemaMTClientEvent asrSpeechTranslationEvent](self, "asrSpeechTranslationEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrSpeechTranslationEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asrSpeechTranslationEvent"));

    }
  }
  if (self->_batchTranslationEvent)
  {
    -[LTSchemaMTClientEvent batchTranslationEvent](self, "batchTranslationEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("batchTranslationEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("batchTranslationEvent"));

    }
  }
  if (self->_disambiguationSpeechTranslationEvent)
  {
    -[LTSchemaMTClientEvent disambiguationSpeechTranslationEvent](self, "disambiguationSpeechTranslationEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("disambiguationSpeechTranslationEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("disambiguationSpeechTranslationEvent"));

    }
  }
  if (self->_lidSpeechTranslationEvent)
  {
    -[LTSchemaMTClientEvent lidSpeechTranslationEvent](self, "lidSpeechTranslationEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("lidSpeechTranslationEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("lidSpeechTranslationEvent"));

    }
  }
  if (self->_mtSpeechTranslationEvent)
  {
    -[LTSchemaMTClientEvent mtSpeechTranslationEvent](self, "mtSpeechTranslationEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("mtSpeechTranslationEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("mtSpeechTranslationEvent"));

    }
  }
  if (self->_safariFeedbackEvent)
  {
    -[LTSchemaMTClientEvent safariFeedbackEvent](self, "safariFeedbackEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("safariFeedbackEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("safariFeedbackEvent"));

    }
  }
  if (self->_speechTranslationEvent)
  {
    -[LTSchemaMTClientEvent speechTranslationEvent](self, "speechTranslationEvent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("speechTranslationEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("speechTranslationEvent"));

    }
  }
  if (self->_ttsspeechTranslationEvent)
  {
    -[LTSchemaMTClientEvent ttsspeechTranslationEvent](self, "ttsspeechTranslationEvent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("ttsspeechTranslationEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("ttsspeechTranslationEvent"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaMTClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaMTClientEvent)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaMTClientEvent *v5;
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
    self = -[LTSchemaMTClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaMTClientEvent)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaMTClientEvent *v5;
  uint64_t v6;
  LTSchemaSafariFeedbackEvent *v7;
  void *v8;
  LTSchemaBatchTranslationEvent *v9;
  void *v10;
  LTSchemaSpeechTranslationEvent *v11;
  void *v12;
  LTSchemaLIDSpeechTranslationEvent *v13;
  void *v14;
  LTSchemaDisambiguationSpeechTranslationEvent *v15;
  void *v16;
  LTSchemaASRSpeechTranslationEvent *v17;
  void *v18;
  LTSchemaMTSpeechTranslationEvent *v19;
  void *v20;
  LTSchemaTTSSpeechTranslationEvent *v21;
  LTSchemaMTClientEvent *v22;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)LTSchemaMTClientEvent;
  v5 = -[LTSchemaMTClientEvent init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("safariFeedbackEvent"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[LTSchemaSafariFeedbackEvent initWithDictionary:]([LTSchemaSafariFeedbackEvent alloc], "initWithDictionary:", v6);
      -[LTSchemaMTClientEvent setSafariFeedbackEvent:](v5, "setSafariFeedbackEvent:", v7);

    }
    v24 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchTranslationEvent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[LTSchemaBatchTranslationEvent initWithDictionary:]([LTSchemaBatchTranslationEvent alloc], "initWithDictionary:", v8);
      -[LTSchemaMTClientEvent setBatchTranslationEvent:](v5, "setBatchTranslationEvent:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechTranslationEvent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[LTSchemaSpeechTranslationEvent initWithDictionary:]([LTSchemaSpeechTranslationEvent alloc], "initWithDictionary:", v10);
      -[LTSchemaMTClientEvent setSpeechTranslationEvent:](v5, "setSpeechTranslationEvent:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lidSpeechTranslationEvent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[LTSchemaLIDSpeechTranslationEvent initWithDictionary:]([LTSchemaLIDSpeechTranslationEvent alloc], "initWithDictionary:", v12);
      -[LTSchemaMTClientEvent setLidSpeechTranslationEvent:](v5, "setLidSpeechTranslationEvent:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationSpeechTranslationEvent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[LTSchemaDisambiguationSpeechTranslationEvent initWithDictionary:]([LTSchemaDisambiguationSpeechTranslationEvent alloc], "initWithDictionary:", v14);
      -[LTSchemaMTClientEvent setDisambiguationSpeechTranslationEvent:](v5, "setDisambiguationSpeechTranslationEvent:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrSpeechTranslationEvent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[LTSchemaASRSpeechTranslationEvent initWithDictionary:]([LTSchemaASRSpeechTranslationEvent alloc], "initWithDictionary:", v16);
      -[LTSchemaMTClientEvent setAsrSpeechTranslationEvent:](v5, "setAsrSpeechTranslationEvent:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mtSpeechTranslationEvent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[LTSchemaMTSpeechTranslationEvent initWithDictionary:]([LTSchemaMTSpeechTranslationEvent alloc], "initWithDictionary:", v18);
      -[LTSchemaMTClientEvent setMtSpeechTranslationEvent:](v5, "setMtSpeechTranslationEvent:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttsspeechTranslationEvent"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[LTSchemaTTSSpeechTranslationEvent initWithDictionary:]([LTSchemaTTSSpeechTranslationEvent alloc], "initWithDictionary:", v20);
      -[LTSchemaMTClientEvent setTtsspeechTranslationEvent:](v5, "setTtsspeechTranslationEvent:", v21);

    }
    v22 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (BOOL)hasSafariFeedbackEvent
{
  return self->_hasSafariFeedbackEvent;
}

- (void)setHasSafariFeedbackEvent:(BOOL)a3
{
  self->_hasSafariFeedbackEvent = a3;
}

- (BOOL)hasBatchTranslationEvent
{
  return self->_hasBatchTranslationEvent;
}

- (void)setHasBatchTranslationEvent:(BOOL)a3
{
  self->_hasBatchTranslationEvent = a3;
}

- (BOOL)hasSpeechTranslationEvent
{
  return self->_hasSpeechTranslationEvent;
}

- (void)setHasSpeechTranslationEvent:(BOOL)a3
{
  self->_hasSpeechTranslationEvent = a3;
}

- (BOOL)hasLidSpeechTranslationEvent
{
  return self->_hasLidSpeechTranslationEvent;
}

- (void)setHasLidSpeechTranslationEvent:(BOOL)a3
{
  self->_hasLidSpeechTranslationEvent = a3;
}

- (BOOL)hasDisambiguationSpeechTranslationEvent
{
  return self->_hasDisambiguationSpeechTranslationEvent;
}

- (void)setHasDisambiguationSpeechTranslationEvent:(BOOL)a3
{
  self->_hasDisambiguationSpeechTranslationEvent = a3;
}

- (BOOL)hasAsrSpeechTranslationEvent
{
  return self->_hasAsrSpeechTranslationEvent;
}

- (void)setHasAsrSpeechTranslationEvent:(BOOL)a3
{
  self->_hasAsrSpeechTranslationEvent = a3;
}

- (BOOL)hasMtSpeechTranslationEvent
{
  return self->_hasMtSpeechTranslationEvent;
}

- (void)setHasMtSpeechTranslationEvent:(BOOL)a3
{
  self->_hasMtSpeechTranslationEvent = a3;
}

- (BOOL)hasTtsspeechTranslationEvent
{
  return self->_hasTtsspeechTranslationEvent;
}

- (void)setHasTtsspeechTranslationEvent:(BOOL)a3
{
  self->_hasTtsspeechTranslationEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsspeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_mtSpeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_asrSpeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_disambiguationSpeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_lidSpeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_speechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_batchTranslationEvent, 0);
  objc_storeStrong((id *)&self->_safariFeedbackEvent, 0);
}

- (int)getAnyEventType
{
  return 4;
}

@end
