@implementation UITextCursorDictationAnimation

void __46___UITextCursorDictationAnimation_setEnabled___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id WeakRetained;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  if (UIRectIsDiscrete(v2, v3, v4, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAnimatedCursorShapeBounds:", v2, v3, v4, v5);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    objc_msgSend(WeakRetained, "layoutSubviews");

  }
}

uint64_t __46___UITextCursorDictationAnimation_setEnabled___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46___UITextCursorDictationAnimation_setEnabled___block_invoke_3;
  v3[3] = &unk_1E16B1B28;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46___UITextCursorDictationAnimation_setEnabled___block_invoke_4;
  v2[3] = &unk_1E16B3FD8;
  v2[4] = v4;
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v3, v2, 0.175, 0.0);
}

void __46___UITextCursorDictationAnimation_setEnabled___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setAnimatedCursorShapeBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "layoutSubviews");

}

void __46___UITextCursorDictationAnimation_setEnabled___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setSoundReactiveCursorEnabled:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setHidden:", 0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentDictationMenu");

}

void __53___UITextCursorDictationAnimation__displayLinkFired___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double x;
  double y;
  double width;
  double height;
  id v20;
  CGAffineTransform v21;
  CGRect v22;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(v3, "bounds");
  objc_msgSend(WeakRetained, "_cursorShapeRectForBounds:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v21.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v21.c = v12;
  *(_OWORD *)&v21.tx = *(_OWORD *)(a1 + 72);
  v13 = v5;
  *(_QWORD *)&v12 = v7;
  v14 = v9;
  v15 = v11;
  v22 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &v21);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  if (UIRectIsDiscrete(v22.origin.x, v22.origin.y, v22.size.width, v22.size.height))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAnimatedCursorShapeBounds:", x, y, width, height);
    v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    objc_msgSend(v20, "layoutSubviews");

  }
}

@end
