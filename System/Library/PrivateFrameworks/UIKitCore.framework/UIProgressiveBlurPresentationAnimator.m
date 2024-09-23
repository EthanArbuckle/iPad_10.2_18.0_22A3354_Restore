@implementation UIProgressiveBlurPresentationAnimator

void __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (*(_BYTE *)(a1 + 144))
    v2 = 56;
  else
    v2 = 72;
  v3 = 20.0;
  if (!*(_BYTE *)(a1 + 144))
    v3 = 15.0;
  v4 = *(double *)(a1 + 64) * (v3 / *(double *)(a1 + v2));
  v5 = *(double *)(a1 + 80);
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_2;
  v17[3] = &unk_1E16BF720;
  v7 = *(_QWORD *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v19 = *(_OWORD *)(a1 + 88);
  v20 = *(_OWORD *)(a1 + 104);
  v21 = *(_OWORD *)(a1 + 120);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_3;
  v15[3] = &unk_1E16B3FD8;
  v16 = *(id *)(a1 + 40);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393248, v7, v17, v15, v4, v5);
  if (*(_BYTE *)(a1 + 144))
    v8 = 56;
  else
    v8 = 72;
  v9 = 15.0 / *(double *)(a1 + v8) * *(double *)(a1 + 64);
  v10 = *(double *)(a1 + 80);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_4;
  v12[3] = &unk_1E16B1888;
  v11 = *(_QWORD *)(a1 + 48);
  v13 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 136);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393248, v11, v12, 0, v9, v10);

}

uint64_t __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

@end
