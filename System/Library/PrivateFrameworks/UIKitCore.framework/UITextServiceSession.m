@implementation UITextServiceSession

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)_MergedGlobals_1268;
  _MergedGlobals_1268 = (uint64_t)v0;

}

uint64_t __56___UITextServiceSession_showServiceForType_withContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSession");
}

uint64_t __56___UITextServiceSession_showServiceForType_withContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSession");
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void (**v3)(void);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissCompletionHandler");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  if (v3)
    v3[2]();
  objc_msgSend(*(id *)(a1 + 32), "_endSession");

}

uint64_t __56___UITextServiceSession_showServiceForType_withContext___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSession");
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_6(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "replaceRange:withText:", v5, v6);
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_7(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "replaceSelectedText:withText:", v5, v6);
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_8(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "replaceText:withText:", v5, v6);
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_9(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "replaceText:withText:", v5, v6);
}

uint64_t __56___UITextServiceSession_showServiceForType_withContext___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSession");
}

@end
