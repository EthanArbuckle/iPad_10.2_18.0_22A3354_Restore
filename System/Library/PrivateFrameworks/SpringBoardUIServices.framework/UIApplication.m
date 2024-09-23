@implementation UIApplication

void __120__UIApplication_SBSUIInCallAdditions__SBSUI_requestInCallSceneSessionDestruction_withReason_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v5)
      objc_msgSend(v5, "error");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBSUIInCallErrorDomain"), -1001, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
