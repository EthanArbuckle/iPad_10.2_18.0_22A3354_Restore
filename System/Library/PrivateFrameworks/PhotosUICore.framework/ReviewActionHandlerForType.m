@implementation ReviewActionHandlerForType

uint64_t ___ReviewActionHandlerForType_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a3;
  PXStickersReviewViewController(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pushViewController:animated:", v6, 1);
  return 1;
}

@end
