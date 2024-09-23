@implementation PSGInputSuggesterMetricsLogger

- (PSGInputSuggesterMetricsLogger)init
{
  void *v3;
  PSGInputSuggesterMetricsLogger *v4;

  objc_msgSend(MEMORY[0x24BE799E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSGInputSuggesterMetricsLogger initWithTracker:](self, "initWithTracker:", v3);

  return v4;
}

- (PSGInputSuggesterMetricsLogger)initWithTracker:(id)a3
{
  id v5;
  PSGInputSuggesterMetricsLogger *v6;
  PSGInputSuggesterMetricsLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSGInputSuggesterMetricsLogger;
  v6 = -[PSGInputSuggesterMetricsLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tracker, a3);

  return v7;
}

- (void)logQuery:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_opt_new();
  -[PSGInputSuggesterMetricsLogger _populateTreatmentFields:proto:](self, "_populateTreatmentFields:proto:", v6, v8);

  -[PSGInputSuggesterMetricsLogger _populateQueryFields:proto:](self, "_populateQueryFields:proto:", v7, v8);
  -[PETEventTracker2 trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v8);

}

- (void)logTrigger:(id)a3 request:(id)a4 config:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_opt_new();
  -[PSGInputSuggesterMetricsLogger _populateTreatmentFields:proto:](self, "_populateTreatmentFields:proto:", v8, v11);

  -[PSGInputSuggesterMetricsLogger _populateQueryFields:proto:](self, "_populateQueryFields:proto:", v9, v11);
  -[PSGInputSuggesterMetricsLogger _populateTriggerFields:proto:](self, "_populateTriggerFields:proto:", v10, v11);

  -[PETEventTracker2 trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v11);
}

- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5 config:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  -[PSGInputSuggesterMetricsLogger _populateTreatmentFields:proto:](self, "_populateTreatmentFields:proto:", v11, v13);

  -[PSGInputSuggesterMetricsLogger _populateQueryFields:proto:](self, "_populateQueryFields:proto:", v12, v13);
  objc_msgSend(v10, "responseItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v10, "responseItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGInputSuggesterMetricsLogger _populatePredictionItems:proto:](self, "_populatePredictionItems:proto:", v16, v13);

  }
  else
  {
    objc_msgSend(v10, "explanationSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      objc_msgSend(v10, "explanationSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __77__PSGInputSuggesterMetricsLogger_logPrediction_request_latencyMillis_config___block_invoke;
      v20[3] = &unk_24FCB4D80;
      v21 = v13;
      objc_msgSend(v19, "enumerateExplanationCodeWithBlock:", v20);

    }
  }
  -[PETEventTracker2 trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v13, a5);

}

- (void)logImpression:(id)a3 request:(id)a4 config:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_opt_new();
    -[PSGInputSuggesterMetricsLogger _populateTreatmentFields:proto:](self, "_populateTreatmentFields:proto:", v10, v11);
    -[PSGInputSuggesterMetricsLogger _populateQueryFields:proto:](self, "_populateQueryFields:proto:", v9, v11);
    -[PSGInputSuggesterMetricsLogger _populatePredictionItems:proto:](self, "_populatePredictionItems:proto:", v8, v11);
    -[PETEventTracker2 trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v11);

  }
  else
  {
    psg_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_22F6A5000, v12, OS_LOG_TYPE_ERROR, "logImpression called with zero item.", v13, 2u);
    }

  }
}

- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5 config:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_opt_new();
    -[PSGInputSuggesterMetricsLogger _populateTreatmentFields:proto:](self, "_populateTreatmentFields:proto:", v12, v13);
    -[PSGInputSuggesterMetricsLogger _populateQueryFields:proto:](self, "_populateQueryFields:proto:", v11, v13);
    -[PSGInputSuggesterMetricsLogger _populatePredictionItems:proto:](self, "_populatePredictionItems:proto:", v10, v13);
    objc_msgSend(v13, "setPosition:", a5);
    -[PETEventTracker2 trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v13);

  }
  else
  {
    psg_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_22F6A5000, v14, OS_LOG_TYPE_ERROR, "logEngagement called with zero item.", v15, 2u);
    }

  }
}

- (void)logError:(unsigned __int8)a3 request:(id)a4 trigger:(id)a5 config:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = a3;
  v13 = a5;
  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  -[PSGInputSuggesterMetricsLogger _populateTreatmentFields:proto:](self, "_populateTreatmentFields:proto:", v10, v12);

  -[PSGInputSuggesterMetricsLogger _populateQueryFields:proto:](self, "_populateQueryFields:proto:", v11, v12);
  if (v13)
    -[PSGInputSuggesterMetricsLogger _populateTriggerFields:proto:](self, "_populateTriggerFields:proto:", v13, v12);
  objc_msgSend(v12, "setErrorType:", -[PSGInputSuggesterMetricsLogger _errorTypeProto:](self, "_errorTypeProto:", v8));
  -[PETEventTracker2 trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v12);

}

- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6 zkwConfig:(id)a7 wordBoundaryConfig:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
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
  id v27;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v14 = a8;
  v15 = a7;
  v16 = a3;
  v27 = (id)objc_opt_new();
  objc_msgSend(v15, "experimentIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "experimentId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setZkwExperimentId:", v18);

  objc_msgSend(v15, "experimentIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "treatmentId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setZkwTreatmentId:", v20);

  objc_msgSend(v15, "treatmentName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setZkwTreatmentName:", v21);
  objc_msgSend(v14, "experimentIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "experimentId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWbExperimentId:", v23);

  objc_msgSend(v14, "experimentIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "treatmentId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWbTreatmentId:", v25);

  objc_msgSend(v14, "treatmentName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setWbTreatmentName:", v26);
  objc_msgSend(v27, "setLocaleIdentifier:", v16);

  objc_msgSend(v27, "setMessageDurationMilliseconds:", v11);
  objc_msgSend(v27, "setMessageLength:", v10);
  objc_msgSend(v27, "setMessageWords:", v9);
  -[PETEventTracker2 trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v27);

}

- (void)_populateTreatmentFields:(id)a3 proto:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "experimentIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "experimentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExperimentId:", v8);

  objc_msgSend(v6, "experimentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "treatmentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTreatmentId:", v10);

  objc_msgSend(v6, "treatmentName");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTreatmentName:", v11);
}

- (void)_populatePredictionItems:(id)a3 proto:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v26;
    v22 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "textualResponseSuggestion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v11 = (v11 + 1);
          if ((v9 & 1) != 0)
          {
            v9 = 1;
            continue;
          }
          objc_msgSend(v15, "textualResponseSuggestion");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "responseCategory");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setTextualResponseCategory:", v19);
          v9 = 1;
        }
        else
        {
          objc_msgSend(v15, "structuredInfoSuggestion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
            continue;
          v12 = (v12 + 1);
          if ((v10 & 1) != 0)
          {
            v10 = 1;
            continue;
          }
          objc_msgSend(v15, "structuredInfoSuggestion");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "proactiveTrigger");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSGInputSuggesterMetricsLogger _populateTriggerFields:proto:](self, "_populateTriggerFields:proto:", v21, v6);

          objc_msgSend(v15, "structuredInfoSuggestion");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "portraitItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v22;
          objc_msgSend(v6, "setDataSourceType:", -[PSGInputSuggesterMetricsLogger _predictionDataSourceTypeProto:](self, "_predictionDataSourceTypeProto:", objc_msgSend(v19, "source")));
          v10 = 1;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v8)
        goto LABEL_19;
    }
  }
  v11 = 0;
  v12 = 0;
LABEL_19:
  objc_msgSend(v6, "setNumTextualResponseItems:", v11);
  objc_msgSend(v6, "setNumStructuredInfoItems:", v12);

}

- (void)_populateQueryFields:(id)a3 proto:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "responseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasResponseContext:", objc_msgSend(v7, "length") != 0);

  objc_msgSend(v5, "setIsResponseContextBlacklisted:", objc_msgSend(v6, "isResponseContextBlacklisted"));
  objc_msgSend(v5, "setIsDocumentEmpty:", objc_msgSend(v6, "isDocumentEmpty"));
  objc_msgSend(v6, "textContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextContentType:", v8);

  objc_msgSend(v6, "contextBeforeInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasContextBeforeInput:", objc_msgSend(v9, "length") != 0);

  objc_msgSend(v6, "recipientNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasRecipientNames:", objc_msgSend(v10, "count") != 0);

  objc_msgSend(v6, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocaleIdentifier:", v11);

  objc_msgSend(v6, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIdentifier:", v12);

  objc_msgSend(v5, "setMaxTextualResponseItems:", objc_msgSend(v6, "textualResponseLimit"));
  objc_msgSend(v5, "setMaxStructuredInfoItems:", objc_msgSend(v6, "structuredInfoLimit"));
  objc_msgSend(v5, "setMaxPredictionItems:", objc_msgSend(v6, "totalSuggestionsLimit"));
  objc_msgSend(v6, "initiatingProcess");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInitiatingProcess:", v13);
}

- (void)_populateTriggerFields:(id)a3 proto:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "setTriggerSourceType:", -[PSGInputSuggesterMetricsLogger _triggerSourceTypeProto:](self, "_triggerSourceTypeProto:", objc_msgSend(v7, "triggerSourceType")));
  objc_msgSend(v7, "triggerCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTriggerCategory:", v8);

  objc_msgSend(v7, "triggerAttributes");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PSGInputSuggesterMetricsLogger _populateTriggerAttributeFields:proto:](self, "_populateTriggerAttributeFields:proto:", v9, v6);
}

- (int)_triggerSourceTypeProto:(unint64_t)a3
{
  if (a3 < 6)
    return a3 + 1;
  else
    return 0;
}

- (int)_predictionDataSourceTypeProto:(unsigned __int8)a3
{
  if ((a3 - 1) < 0xA)
    return (a3 - 1) + 1;
  else
    return 0;
}

- (void)_populateTriggerAttributeFields:(id)a3 proto:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (_populateTriggerAttributeFields_proto__once != -1)
    dispatch_once(&_populateTriggerAttributeFields_proto__once, &__block_literal_global_1772);
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BE5EE58]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BE5EE48]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTriggerAttributeType:", v7);
  objc_msgSend(v6, "setTriggerAttributeSubtype:", v8);
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BE79A78]);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)_populateTriggerAttributeFields_proto__map, "objectForKeyedSubscript:", v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v10, "length"))
    {
      v11 = v6;
      v12 = v10;
    }
    else
    {
      psg_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v17 = 138412290;
        v18 = v5;
        _os_log_fault_impl(&dword_22F6A5000, v14, OS_LOG_TYPE_FAULT, "Invalid search field for Contacts Autocomplete trigger: %@", (uint8_t *)&v17, 0xCu);
      }

      v12 = CFSTR("Invalid");
      v11 = v6;
    }
    objc_msgSend(v11, "setTriggerAttributeField:", v12);

  }
  else
  {
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BE5EE40]);
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BE5EE00]);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v6;
        v16 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_17;
        v16 = CFSTR("NSNull");
        v15 = v6;
      }
      objc_msgSend(v15, "setTriggerAttributeField:", v16);
      goto LABEL_17;
    }
    objc_msgSend(v6, "setTriggerAttributeField:", v13);
    v9 = (__CFString *)v13;
  }
LABEL_17:

}

- (int)_errorTypeProto:(unsigned __int8)a3
{
  if (a3 < 4u)
    return a3 + 1;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

void __72__PSGInputSuggesterMetricsLogger__populateTriggerAttributeFields_proto___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE5EE30];
  v4[0] = &unk_24FCBB9C0;
  v4[1] = &unk_24FCBB9D8;
  v1 = *MEMORY[0x24BE5EE08];
  v5[0] = v0;
  v5[1] = v1;
  v4[2] = &unk_24FCBB9F0;
  v5[2] = *MEMORY[0x24BE5EDF0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_populateTriggerAttributeFields_proto__map;
  _populateTriggerAttributeFields_proto__map = v2;

}

uint64_t __77__PSGInputSuggesterMetricsLogger_logPrediction_request_latencyMillis_config___block_invoke(uint64_t result, int a2)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(result + 32), "setRequiredAppUnavailable:", 1);
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "setPortraitTimeout:", 1);
  return result;
}

@end
