@implementation UIAccessibilityControlCenterCloseModuleCustomAction

uint64_t __UIAccessibilityControlCenterCloseModuleCustomAction_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _UIAXCCFindAncestorContentModuleContainerViewController(WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v5;
  AXPerformSafeBlock();
  v6 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __UIAccessibilityControlCenterCloseModuleCustomAction_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dismissExpandedModuleAnimated:", 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end
