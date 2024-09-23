@implementation UIFormSheetPresentationController

void __82___UIFormSheetPresentationController__changeLayoutModeToAvoidKeyboard_withOrigin___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82___UIFormSheetPresentationController__changeLayoutModeToAvoidKeyboard_withOrigin___block_invoke_2;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

void __82___UIFormSheetPresentationController__changeLayoutModeToAvoidKeyboard_withOrigin___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentedView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

@end
