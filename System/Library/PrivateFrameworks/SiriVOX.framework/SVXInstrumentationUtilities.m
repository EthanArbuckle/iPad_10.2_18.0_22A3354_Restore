@implementation SVXInstrumentationUtilities

- (SVXInstrumentationUtilities)init
{
  SVXAssistantSiriAnalyticsProvider *v3;
  SVXPowerInstrumentation *v4;
  SVXInstrumentationUtilities *v5;

  v3 = objc_alloc_init(SVXAssistantSiriAnalyticsProvider);
  v4 = objc_alloc_init(SVXPowerInstrumentation);
  v5 = -[SVXInstrumentationUtilities initWithSiriAnalyticsProvider:powerInstrumentation:](self, "initWithSiriAnalyticsProvider:powerInstrumentation:", v3, v4);

  return v5;
}

- (SVXInstrumentationUtilities)initWithSiriAnalyticsProvider:(id)a3 powerInstrumentation:(id)a4
{
  id v7;
  id v8;
  SVXInstrumentationUtilities *v9;
  SVXInstrumentationUtilities *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXInstrumentationUtilities;
  v9 = -[SVXInstrumentationUtilities init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_siriAnalyticsProvider, a3);
    objc_storeStrong((id *)&v10->_powerInstrumentation, a4);
  }

  return v10;
}

- (void)emitUUFRSaid:(id)a3 dialogIdentifier:(id)a4 dialogPhase:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BE95B70];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setDialogPhase:", v8);
  objc_msgSend(v11, "setPresentationType:", 6);
  objc_msgSend(v11, "setSiriResponseMode:", 1);
  v12 = objc_alloc_init(MEMORY[0x24BE95C50]);
  objc_msgSend(v12, "setDialogIdentifier:", v7);
  objc_msgSend(v12, "setSiriResponseContext:", v11);
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v14 = 136315650;
    v15 = "-[SVXInstrumentationUtilities emitUUFRSaid:dialogIdentifier:dialogPhase:]";
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit UUFR said event (dialogIdentifier: %@, dialogPhase: %@)", (uint8_t *)&v14, 0x20u);
  }
  objc_msgSend(v10, "emitInstrumentation:", v12);

}

- (void)_emitUUFRSaidWithModeSupport:(id)a3 dialogIdentifier:(id)a4 dialogPhase:(id)a5 speakableText:(id)a6 currentMode:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  int v19;
  os_log_t *v20;
  os_log_t v21;
  NSObject *v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  _BYTE v26[24];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (objc_class *)MEMORY[0x24BE95B70];
  v16 = a3;
  v17 = objc_alloc_init(v15);
  objc_msgSend(v17, "setDialogPhase:", v13);
  objc_msgSend(v17, "setPresentationType:", 6);
  objc_msgSend(v17, "setSiriResponseMode:", -[SVXInstrumentationUtilities convertModeToResponseMode:](self, "convertModeToResponseMode:", a7));
  v18 = objc_alloc_init(MEMORY[0x24BE95C50]);
  objc_msgSend(v18, "setDialogIdentifier:", v12);
  objc_msgSend(v18, "setSiriResponseContext:", v17);
  v19 = objc_msgSend(v14, "containsString:", CFSTR("\\audio=/successSonicResponse"));
  v20 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v19)
  {
    objc_msgSend(v18, "setHasSonicResponse:", 1);
    if (objc_msgSend(v14, "containsString:", CFSTR("\\audio=/successSonicResponse&overlap")))
    {
      objc_msgSend(v18, "setSonicResponse:", 2);
      v21 = *v20;
      if (!os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(v18, "setSonicResponse:", 4);
      v21 = *v20;
      if (!os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        goto LABEL_7;
    }
    v22 = v21;
    *(_DWORD *)v26 = 136315394;
    *(_QWORD *)&v26[4] = "-[SVXInstrumentationUtilities _emitUUFRSaidWithModeSupport:dialogIdentifier:dialogPhase:speakab"
                         "leText:currentMode:]";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = objc_msgSend(v18, "sonicResponse");
    _os_log_impl(&dword_214934000, v22, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Added sonic response to UUFR said event (type: %d)", v26, 0x12u);

  }
LABEL_7:
  v23 = *v20;
  if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    MDModeGetName();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 136315906;
    *(_QWORD *)&v26[4] = "-[SVXInstrumentationUtilities _emitUUFRSaidWithModeSupport:dialogIdentifier:dialogPhase:speakab"
                         "leText:currentMode:]";
    *(_WORD *)&v26[12] = 2112;
    *(_QWORD *)&v26[14] = v12;
    *(_WORD *)&v26[22] = 2112;
    v27 = v13;
    v28 = 2112;
    v29 = v25;
    _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit UUFR said event (dialogIdentifier: %@, dialogPhase: %@, mode: %@)", v26, 0x2Au);

  }
  objc_msgSend(v16, "emitInstrumentation:", v18, *(_OWORD *)v26, *(_QWORD *)&v26[16]);

}

- (void)emitPatternExecutedEvent:(id)a3 addViews:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "patternId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BE95998]);
    objc_msgSend(v7, "patternId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPatternId:", v10);

    objc_msgSend(v7, "patternType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPattern:", -[SVXInstrumentationUtilities rfSchemaRFPatternFromPatternType:](self, "rfSchemaRFPatternFromPatternType:", v11));

    objc_msgSend(v7, "responseMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMode:", -[SVXInstrumentationUtilities rfSchemaRFSiriModeFromResponseMode:](self, "rfSchemaRFSiriModeFromResponseMode:", v12));

    v13 = objc_alloc_init(MEMORY[0x24BE95968]);
    v14 = objc_alloc(MEMORY[0x24BE95C78]);
    objc_msgSend(v6, "turnIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithNSUUID:", v15);
    objc_msgSend(v13, "setTurnId:", v16);

    v17 = objc_alloc_init(MEMORY[0x24BE95960]);
    objc_msgSend(v17, "setEventMetadata:", v13);
    objc_msgSend(v17, "setPatternExecuted:", v9);
    v18 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v21 = 136315394;
      v22 = "-[SVXInstrumentationUtilities emitPatternExecutedEvent:addViews:]";
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit Pattern Executed event (addViews: %@)", (uint8_t *)&v21, 0x16u);
    }
    -[SVXAssistantSiriAnalyticsProvider get](self->_siriAnalyticsProvider, "get");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "defaultMessageStream");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "emitMessage:", v17);

  }
}

- (int)rfSchemaRFSiriModeFromResponseMode:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x24BE827C8]))
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", *MEMORY[0x24BE827C0]))
      {
        if (objc_msgSend(v4, "caseInsensitiveCompare:", *MEMORY[0x24BE827D8]))
        {
          if (objc_msgSend(v4, "caseInsensitiveCompare:", *MEMORY[0x24BE827D0]))
            v5 = 0;
          else
            v5 = 3;
        }
        else
        {
          v5 = 4;
        }
      }
      else
      {
        v5 = 2;
      }
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)rfSchemaRFPatternFromPatternType:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("pattern.ResultSet")))
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.TableSet")))
      {
        if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.SimpleResult")))
        {
          if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.DetailedResult")))
          {
            if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.SuccessStatus")))
            {
              if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.CancelledStatus")))
              {
                if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.ErrorStatus")))
                {
                  if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.ProgressStatus")))
                  {
                    if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.OpenEndedClarification")))
                    {
                      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.YesNoClarification")))
                      {
                        if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.SimpleDisambiguationClarification")))
                        {
                          if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.DetailedDisambiguationClarification")))
                          {
                            if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.MultiLevelResultSet")))
                            {
                              if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.DetailedDisambiguationPrompt")))
                              {
                                if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.OpenEndedPrompt")))
                                {
                                  if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.SimpleDisambiguationPrompt")))
                                  {
                                    if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pattern.YesNoPrompt")))
                                      v5 = 0;
                                    else
                                      v5 = 18;
                                  }
                                  else
                                  {
                                    v5 = 17;
                                  }
                                }
                                else
                                {
                                  v5 = 16;
                                }
                              }
                              else
                              {
                                v5 = 15;
                              }
                            }
                            else
                            {
                              v5 = 4;
                            }
                          }
                          else
                          {
                            v5 = 10;
                          }
                        }
                        else
                        {
                          v5 = 9;
                        }
                      }
                      else
                      {
                        v5 = 7;
                      }
                    }
                    else
                    {
                      v5 = 8;
                    }
                  }
                  else
                  {
                    v5 = 14;
                  }
                }
                else
                {
                  v5 = 12;
                }
              }
              else
              {
                v5 = 13;
              }
            }
            else
            {
              v5 = 11;
            }
          }
          else
          {
            v5 = 2;
          }
        }
        else
        {
          v5 = 1;
        }
      }
      else
      {
        v5 = 5;
      }
    }
    else
    {
      v5 = 3;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)convertModeToResponseMode:(unint64_t)a3
{
  int result;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a3 < 3)
    return a3 + 1;
  v4 = *MEMORY[0x24BE08FB0];
  result = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR);
  if (result)
  {
    v5 = 136315138;
    v6 = "-[SVXInstrumentationUtilities convertModeToResponseMode:]";
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s #SVXInstrumentation - Unable to convert. Using unknown MDMode.", (uint8_t *)&v5, 0xCu);
    return 0;
  }
  return result;
}

- (void)emitSiriWasUnavailable:(id)a3 reason:(int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x24BE95C00];
  v7 = a3;
  v15 = objc_alloc_init(v6);
  objc_msgSend(v15, "setReason:", v4);
  objc_msgSend(v15, "setProduct:", 1);
  v8 = objc_alloc_init(MEMORY[0x24BE95AE0]);
  AFTurnIdentifierGenerate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AFTurnIdentifierGetBytes();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTurnID:", v10);

  v11 = objc_alloc_init(MEMORY[0x24BE95AD8]);
  objc_msgSend(v11, "setUeiSiriWasUnavailable:", v15);
  objc_msgSend(v11, "setEventMetadata:", v8);
  -[SVXAssistantSiriAnalyticsProvider get](self->_siriAnalyticsProvider, "get");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultMessageStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "timestamp");

  objc_msgSend(v13, "emitMessage:timestamp:", v11, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerInstrumentation, 0);
  objc_storeStrong((id *)&self->_siriAnalyticsProvider, 0);
}

@end
