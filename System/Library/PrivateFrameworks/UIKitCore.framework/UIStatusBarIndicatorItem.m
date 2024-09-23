@implementation UIStatusBarIndicatorItem

void __55___UIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v6[4];
  id v7;
  id v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55___UIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, a4, 0.333, 0.0);

}

uint64_t __55___UIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

@end
