@implementation UIKeyboardArbiterClientSpringBoard

void __56___UIKeyboardArbiterClientSpringBoard_forceKeyboardAway__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56___UIKeyboardArbiterClientSpringBoard_forceKeyboardAway__block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performAsync:", v4);

}

uint64_t __56___UIKeyboardArbiterClientSpringBoard_forceKeyboardAway__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(_QWORD *)(a1 + 40), 0, 1);
}

void __62___UIKeyboardArbiterClientSpringBoard_preserveKeyboardWithId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62___UIKeyboardArbiterClientSpringBoard_preserveKeyboardWithId___block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performAsync:", v4);

}

uint64_t __62___UIKeyboardArbiterClientSpringBoard_preserveKeyboardWithId___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(_QWORD *)(a1 + 40), 0, 1);
}

void __61___UIKeyboardArbiterClientSpringBoard_restoreKeyboardWithId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61___UIKeyboardArbiterClientSpringBoard_restoreKeyboardWithId___block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performAsync:", v4);

}

uint64_t __61___UIKeyboardArbiterClientSpringBoard_restoreKeyboardWithId___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(_QWORD *)(a1 + 40), 0, 1);
}

uint64_t __75___UIKeyboardArbiterClientSpringBoard_queue_keyboardIAVChanged_onComplete___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHeightForRemoteIAVPlaceholderIfNecessary:", *(double *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 32), "keyboardVisible") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 32), "currentInputDestination"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setUpdatingHeight:", 1);
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "forceReloadInputViews");

    objc_msgSend(*(id *)(a1 + 32), "setUpdatingHeight:", 0);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
