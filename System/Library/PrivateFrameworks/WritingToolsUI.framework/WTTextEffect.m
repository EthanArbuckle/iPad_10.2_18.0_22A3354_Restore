@implementation WTTextEffect

void __28___WTTextEffect_invalidate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(void);

  objc_msgSend(*(id *)(a1 + 32), "rootLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperlayer");

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

@end
