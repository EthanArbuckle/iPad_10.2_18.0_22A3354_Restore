@implementation SBTopAffordanceMenuInteractionMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  char v16;

  if (a3 == 52)
  {
    v5 = a4;
    objc_msgSend(v5, "eventPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF68]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF70]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    v10 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__SBTopAffordanceMenuInteractionMetric_handleEvent_withContext___block_invoke;
    v13[3] = &unk_1E8EB7D58;
    v14 = v7;
    v15 = v9;
    v16 = v10;
    v11 = v7;
    objc_msgSend(v5, "stateForQueryName:completion:", 5, v13);

  }
  return a3 == 52;
}

void __64__SBTopAffordanceMenuInteractionMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLValue");

  v4 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __64__SBTopAffordanceMenuInteractionMetric_handleEvent_withContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v9[0] = *(_QWORD *)(a1 + 32);
  v8[0] = CFSTR("BundleID");
  v8[1] = CFSTR("Result");
  if ((unint64_t)(v2 - 1) > 0x12)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E8EB7D78[v2 - 1];
  v9[1] = v3;
  v8[2] = CFSTR("IsDoNotDisturbActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("IsHardwareKeyboardAttached");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
