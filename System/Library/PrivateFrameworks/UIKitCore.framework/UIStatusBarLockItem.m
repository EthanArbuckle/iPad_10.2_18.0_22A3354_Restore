@implementation UIStatusBarLockItem

void __50___UIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50___UIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke_2;
    v5[3] = &unk_1E16C4358;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLockDisappearanceTimer:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setShowsLock:", 0);
    objc_msgSend(*(id *)(a1 + 32), "statusBar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
}

void __50___UIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setShowsLock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

}

void __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double x;
  double y;
  double width;
  double height;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "effectiveLayoutDirection");

  objc_msgSend(v6, "absoluteFrame");
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  v15 = v10 == 1;
  v16 = CGRectGetWidth(v35) * 0.5;
  v17 = -v16;
  if (v10 == 1)
    v17 = v16;
  v18 = x + v17;
  objc_msgSend(v6, "setFloating:", 1);
  objc_msgSend(v6, "setAbsoluteFrame:", v18, y, width, height);
  v19 = *(_QWORD *)(a1 + 32);
  v28 = v7;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_2;
  v29[3] = &unk_1E16B20D8;
  v30 = v6;
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_3;
  v27 = &unk_1E16B1BA0;
  v20 = v7;
  v21 = v6;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 0, v19, v29, &v24, 0.91, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "stringView", v24, v25, v26, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setExpandsFromLeftToRight:", v15);

  objc_msgSend(*(id *)(a1 + 32), "stringView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "animateCompletionBlock:", 0);

}

uint64_t __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFloating:", 0);
}

uint64_t __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "absoluteFrame");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (!CGRectEqualToRect(v19, *(CGRect *)(a1 + 40)))
  {
    objc_msgSend(v6, "setFloating:", 1);
    objc_msgSend(v6, "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v12 = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_5;
    v13[3] = &unk_1E16B20D8;
    v14 = v6;
    v15 = x;
    v16 = y;
    v17 = width;
    v18 = height;
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 0, v12, v13, v7, 0.91, 0.0);

  }
}

uint64_t __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFloating:", 0);
}

@end
