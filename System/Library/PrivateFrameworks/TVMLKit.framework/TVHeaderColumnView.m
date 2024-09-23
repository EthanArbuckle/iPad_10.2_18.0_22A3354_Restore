@implementation TVHeaderColumnView

void __37___TVHeaderColumnView_setLabelViews___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 != v6)
    objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", v7, a3);

}

@end
