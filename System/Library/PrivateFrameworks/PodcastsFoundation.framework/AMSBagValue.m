@implementation AMSBagValue

uint64_t __53__AMSBagValue_MTAdditions__asyncValuePromiseOnQueue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

uint64_t __61__AMSBagValue_MTAdditions__asyncValueOnQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__AMSBagValue_MTAdditions__asyncValueOnQueue_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__AMSBagValue_MTAdditions__asyncValueOnQueue_withCompletion___block_invoke_2;
  v2[3] = &unk_1E54D1A48;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "valueWithCompletion:", v2);

}

void __53__AMSBagValue_MTAdditions__asyncValuePromiseOnQueue___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "valuePromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__AMSBagValue_MTAdditions__asyncValuePromiseOnQueue___block_invoke_2;
  v3[3] = &unk_1E54D1A70;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "addFinishBlock:", v3);

}

@end
