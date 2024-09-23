@implementation UIFocusRotaryIndicatorView

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_2;
  v6[3] = &unk_1E16B1B28;
  v6[4] = *(_QWORD *)(a1 + 32);
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.15);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 496);
  *(_QWORD *)(v1 + 496) = 0;

}

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  memset(&v13, 0, sizeof(v13));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 456);
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    memset(&v12, 0, sizeof(v12));
  }
  CGAffineTransformRotate(&v13, &v12, 1.96349541);
  v4 = *(void **)(v2 + 456);
  v11 = v13;
  objc_msgSend(v4, "setTransform:", &v11);
  memset(&v11, 0, sizeof(v11));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 456);
  if (v6)
  {
    objc_msgSend(v6, "transform");
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
  }
  CGAffineTransformRotate(&v11, &v10, 1.96349541);
  v7 = *(void **)(v5 + 456);
  v9 = v11;
  return objc_msgSend(v7, "setTransform:", &v9);
}

void __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 504);
  *(_QWORD *)(v1 + 504) = 0;

}

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_7(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  __int128 v5;
  void *v6;
  CGAffineTransform v8;
  CGAffineTransform v9;

  memset(&v9, 0, sizeof(v9));
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, (uint64_t)CFSTR("RotaryFocusRingHiddenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v2 = 0.1;
  else
    v2 = *(double *)&qword_1EDDA8528;
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, (uint64_t)CFSTR("RotaryFocusRingHiddenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v3 = 0.1;
  else
    v3 = *(double *)&qword_1EDDA8528;
  CGAffineTransformMakeScale(&v9, v2, v3);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v8.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setTransform:", &v8);
  v6 = *(void **)(a1 + 32);
  v8 = v9;
  objc_msgSend(v6, "setTransform:", &v8);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 488);
  *(_QWORD *)(v2 + 488) = 0;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10 = *MEMORY[0x1E0C9BAA8];
  v8 = v10;
  v11 = v9;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v7 = v12;
  objc_msgSend(v4, "setTransform:", &v10);
  v5 = *(void **)(a1 + 32);
  v10 = v8;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v5, "setTransform:", &v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", 0);

}

@end
