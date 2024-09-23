@implementation NAFuture

void __61__NAFuture_HKSPSleep__hksp_BOOLErrorCompletionHandlerAdapter__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8 = v5;
  if (a2)
  {
    NAEmptyResult();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", v7);
LABEL_6:

    goto LABEL_7;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v7);
    goto LABEL_6;
  }
  objc_msgSend(v6, "finishWithError:", v5);
LABEL_7:

}

void __54__NAFuture_HKSPSleep__hksp_expiringFutureWithTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_timeoutError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v3);

  }
}

id __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48) + 1;
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  else
    objc_msgSend(*(id *)(a1 + 56), "_hksp_chainFutureHelperWithFutures:index:block:ignoreErrors:", *(_QWORD *)(a1 + 32), v2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
