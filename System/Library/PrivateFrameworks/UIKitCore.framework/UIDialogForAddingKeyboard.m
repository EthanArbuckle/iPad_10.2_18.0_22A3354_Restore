@implementation UIDialogForAddingKeyboard

void __37___UIDialogForAddingKeyboard_dismiss__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___UIDialogForAddingKeyboard_dismiss__block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __37___UIDialogForAddingKeyboard_dismiss__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resignKeyWindow");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

  return objc_msgSend((id)objc_opt_class(), "presentDialogForAddingKeyboard");
}

void __60___UIDialogForAddingKeyboard_presentDialogForAddingKeyboard__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60___UIDialogForAddingKeyboard_presentDialogForAddingKeyboard__block_invoke_2;
  v2[3] = &unk_1E16B1888;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __60___UIDialogForAddingKeyboard_presentDialogForAddingKeyboard__block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 40) == 2)
    return objc_msgSend(*(id *)(a1 + 32), "presentPrivacySheet");
  else
    return objc_msgSend(MEMORY[0x1E0DBDB40], "dismissDialog");
}

@end
