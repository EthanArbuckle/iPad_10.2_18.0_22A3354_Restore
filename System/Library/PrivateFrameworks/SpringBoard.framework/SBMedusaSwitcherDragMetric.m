@implementation SBMedusaSwitcherDragMetric

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
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  if (a3 == 50)
  {
    v5 = a4;
    objc_msgSend(v5, "eventPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF28]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF30]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF20]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    v13 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__SBMedusaSwitcherDragMetric_handleEvent_withContext___block_invoke;
    v17[3] = &unk_1E8EB5C08;
    v18 = v7;
    v19 = v8;
    v20 = v10;
    v21 = v12;
    v22 = v13;
    v14 = v8;
    v15 = v7;
    objc_msgSend(v5, "stateForQueryName:completion:", 5, v17);

  }
  return a3 == 50;
}

void __54__SBMedusaSwitcherDragMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
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

id __54__SBMedusaSwitcherDragMetric_handleEvent_withContext___block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  unint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("DraggingBundleID");
  v11[1] = CFSTR("IntersectingBundleID");
  v2 = *(const __CFString **)(a1 + 40);
  if (!v2)
    v2 = CFSTR("none");
  v12[0] = *(_QWORD *)(a1 + 32);
  v12[1] = v2;
  v11[2] = CFSTR("DropRegion");
  v3 = *(_QWORD *)(a1 + 48) - 1;
  if (v3 > 6)
    v4 = CFSTR("None");
  else
    v4 = off_1E8EB5C28[v3];
  v12[2] = v4;
  v11[3] = CFSTR("DropAction");
  v5 = *(_QWORD *)(a1 + 56) - 1;
  if (v5 > 8)
    v6 = CFSTR("None");
  else
    v6 = off_1E8EB5C60[v5];
  v12[3] = v6;
  v11[4] = CFSTR("IsDoNotDisturbActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("IsHardwareKeyboardAttached");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
