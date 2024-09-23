@implementation UITextItemActionSheet

void __54___UITextItemActionSheet__alertActionsWithController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)_MergedGlobals_1046;
  v14 = _MergedGlobals_1046;
  if (!_MergedGlobals_1046)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getDDDetectionControllerClass_block_invoke_0;
    v10[3] = &unk_1E16B14C0;
    v10[4] = &v11;
    __getDDDetectionControllerClass_block_invoke_0((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v5, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "performAction:fromView:alertController:interactionDelegate:", v7, WeakRetained, v9, 0);

}

uint64_t __54___UITextItemActionSheet__alertActionsWithController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasUserInterface") ^ 1;
}

@end
