@implementation UIFloatingTabBarListItem

void __46___UIFloatingTabBarListItem_initWithChildren___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id *v7;

  v7 = a2;
  objc_msgSend(v7, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UIFloatingTabBarListItem.m"), 40, CFSTR("List item with children cannot also have a parent item."));

  }
  objc_storeWeak(v7 + 2, *(id *)(a1 + 32));
  v7[3] = a3;

}

@end
