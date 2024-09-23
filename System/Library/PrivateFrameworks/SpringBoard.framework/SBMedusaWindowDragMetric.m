@implementation SBMedusaWindowDragMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  __CFString *v20;
  char v21;

  v5 = a4;
  v6 = v5;
  if (a3 == 51)
  {
    objc_msgSend(v5, "eventPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF78]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF80]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
    if (v12 == 2)
    {
      v14 = CFSTR("PeekPrimary");
    }
    else if (v12 == 3)
    {
      v14 = CFSTR("PeekSide");
    }
    else
    {
      SBStringForWindowDragGestureDestination(v10);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__SBMedusaWindowDragMetric_handleEvent_withContext___block_invoke;
    v18[3] = &unk_1E8EACAE0;
    v19 = v8;
    v20 = v14;
    v21 = v13;
    v15 = v14;
    v16 = v8;
    objc_msgSend(v6, "stateForQueryName:completion:", 5, v18);

  }
  return a3 == 51;
}

void __52__SBMedusaWindowDragMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLValue");

  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();

}

id __52__SBMedusaWindowDragMetric_handleEvent_withContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("BundleID");
  v7[1] = CFSTR("Result");
  v2 = *(_QWORD *)(a1 + 40);
  v8[0] = *(_QWORD *)(a1 + 32);
  v8[1] = v2;
  v7[2] = CFSTR("IsDoNotDisturbActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  v7[3] = CFSTR("IsHardwareKeyboardAttached");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
