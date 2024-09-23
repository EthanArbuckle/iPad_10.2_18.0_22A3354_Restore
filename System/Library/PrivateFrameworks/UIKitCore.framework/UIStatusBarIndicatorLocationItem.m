@implementation UIStatusBarIndicatorLocationItem

void __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_2;
  v16[3] = &unk_1E16B1B28;
  v17 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_3;
  v11[3] = &unk_1E16C2090;
  v12 = *(id *)(a1 + 32);
  v13 = v17;
  v14 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v9 = v7;
  v10 = v17;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v16, v11, 0.166666667);

}

uint64_t __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.66, 0.66);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.25);
}

void __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v8.receiver = *(id *)(a1 + 48);
    v8.super_class = (Class)_UIStatusBarIndicatorLocationItem;
    v5 = objc_msgSendSuper2(&v8, sel_applyUpdate_toDisplayItem_, v4, v3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_4;
    v6[3] = &unk_1E16B1B28;
    v7 = *(id *)(a1 + 40);
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, *(_QWORD *)(a1 + 56), 0.166666667);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

@end
