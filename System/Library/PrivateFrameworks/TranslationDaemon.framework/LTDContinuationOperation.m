@implementation LTDContinuationOperation

void __72___LTDContinuationOperation_initWithGroupID_delegate_continuationBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __72___LTDContinuationOperation_initWithGroupID_delegate_continuationBlock___block_invoke_2;
    v5[3] = &unk_251A11A70;
    v6 = WeakRetained;
    (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v5);

  }
}

uint64_t __72___LTDContinuationOperation_initWithGroupID_delegate_continuationBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Continuation operation finish: %p", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

void __34___LTDContinuationOperation_start__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  char v5;
  id v6;
  NSObject *v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = objc_loadWeakRetained(v1);
    v5 = objc_msgSend(v4, "isFinished");

    if ((v5 & 1) == 0)
    {
      v6 = objc_loadWeakRetained(v1);
      objc_msgSend(v6, "cancel");

      v7 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __34___LTDContinuationOperation_start__block_invoke_cold_1(v7);
    }
  }
}

void __34___LTDContinuationOperation_start__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2491B9000, log, OS_LOG_TYPE_FAULT, "Continuation operation encountered wait timeout event", v1, 2u);
}

@end
