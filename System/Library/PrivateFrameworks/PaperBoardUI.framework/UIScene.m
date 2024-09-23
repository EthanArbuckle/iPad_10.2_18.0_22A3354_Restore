@implementation UIScene

id __40__UIScene_PaperBoard__pb_performUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionContextClass");
  v7 = (void *)objc_opt_new();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return v7;
}

@end
