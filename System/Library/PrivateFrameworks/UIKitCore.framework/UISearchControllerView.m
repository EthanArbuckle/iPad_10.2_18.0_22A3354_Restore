@implementation UISearchControllerView

void __53___UISearchControllerView__ensureViewOfClassIsOnTop___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v7 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    if (v9 != a3)
    {
      v10.receiver = *(id *)(a1 + 32);
      v10.super_class = (Class)_UISearchControllerView;
      objc_msgSendSuper2(&v10, sel_bringSubviewToFront_, v7);
    }
    *a4 = 1;
  }

}

@end
