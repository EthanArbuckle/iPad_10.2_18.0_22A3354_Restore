@implementation TIProactiveQuickTypeManagerMock

- (TIProactiveQuickTypeManagerMock)init
{
  TIProactiveQuickTypeManagerMock *v2;
  uint64_t v3;
  NSMutableDictionary *metrics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIProactiveQuickTypeManagerMock;
  v2 = -[TIProactiveQuickTypeManagerMock init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    metrics = v2->_metrics;
    v2->_metrics = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v19 = a3;
  v20 = a4;
  v33 = a5;
  v21 = a6;
  v32 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a13;
  v27 = a14;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1507;
  v40 = __Block_byref_object_dispose__1508;
  v41 = 0;
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __269__TIProactiveQuickTypeManagerMock_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_isContinuousPath_withAvailableApps_logBlock___block_invoke;
  v35[3] = &unk_24FD49470;
  v35[4] = &v36;
  LOBYTE(v31) = 0;
  LOBYTE(v30) = a12;
  -[TIProactiveQuickTypeManagerMock generateAndRenderProactiveSuggestionsWithTriggers:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:isContinuousPath:withAvailableApps:logBlock:async:completion:](self, "generateAndRenderProactiveSuggestionsWithTriggers:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:isContinuousPath:withAvailableApps:logBlock:async:completion:", v19, v20, v33, v21, v32, v22, v23, v24, v25, v30, v26, v27, v31, v35);
  v28 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  return v28;
}

- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14 async:(BOOL)a15 completion:(id)a16
{
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void (**v21)(id, void *);

  v21 = (void (**)(id, void *))a16;
  v17 = objc_msgSend(a3, "count");
  if (v17)
  {
    v18 = v17;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v17);
    do
    {
      objc_msgSend(MEMORY[0x24BEB4E20], "secureCandidateForInput:slotID:", &stru_24FD49B78, 100);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

      --v18;
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }
  v21[2](v21, v19);

}

- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6
{
  return 0;
}

- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8
{
  (*((void (**)(id, _QWORD))a8 + 2))(a8, 0);
}

- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18
{
  void (**v19)(id, void *);
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v19 = (void (**)(id, void *))a18;
  v20 = (void *)MEMORY[0x24BDBCE70];
  v21 = a8;
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:", &unk_24FD5FCA8, &unk_24FD5FCC0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsSeparatedByCharactersInSet:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "lastObject");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "objectForKey:", v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(MEMORY[0x24BEB4E20], "secureCandidateForInput:slotID:", v25, 100);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v26);

  }
  else
  {
    v27 = 0;
  }
  v19[2](v19, v27);

}

- (BOOL)isEnabled
{
  return 1;
}

- (BOOL)isAutoPopupEnabled
{
  return 1;
}

- (BOOL)isAutoCompleteEnabled
{
  return 1;
}

- (BOOL)usePQT2Flow
{
  return 1;
}

- (id)getMeCardEmailAddresses
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_metrics, "setObject:forKey:", a4, a3);
}

- (id)searchForMeCardEmailAddresses
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)searchForMeCardRegions
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (NSDictionary)metrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

void __269__TIProactiveQuickTypeManagerMock_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_isContinuousPath_withAvailableApps_logBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
