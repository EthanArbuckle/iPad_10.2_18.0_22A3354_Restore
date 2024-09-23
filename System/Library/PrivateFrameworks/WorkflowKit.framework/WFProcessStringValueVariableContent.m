@implementation WFProcessStringValueVariableContent

void __WFProcessStringValueVariableContent_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
