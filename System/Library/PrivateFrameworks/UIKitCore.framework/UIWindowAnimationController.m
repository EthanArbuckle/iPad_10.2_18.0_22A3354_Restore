@implementation UIWindowAnimationController

void __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "snapshotView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v2, "setFrame:");
  objc_msgSend(v2, "setAutoresizingMask:", objc_msgSend(*(id *)(a1 + 40), "autoresizingMask"));
  objc_msgSend(*(id *)(a1 + 48), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertSubview:below:", v2, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 56), "transitionDuration:", *(_QWORD *)(a1 + 64));
  v5 = v4;
  v6 = objc_msgSend(*(id *)(a1 + 64), "_completionCurve");
  v7 = MEMORY[0x1E0C809B0];
  v8 = v6 << 16;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_2;
  v17[3] = &unk_1E16B47A8;
  v18 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 64);
  v20 = *(id *)(a1 + 40);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_3;
  v10[3] = &unk_1E16C1148;
  v11 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 96);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = v9;
  v16 = *(_OWORD *)(a1 + 112);
  v12 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 64);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v8, v17, v10, v5, 0.0);

}

uint64_t __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finalFrameForViewController:", v4);
  objc_msgSend(v2, "setFrame:");

  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

uint64_t __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  _OWORD v7[3];

  +[UIWindow _synchronizeDrawing](UIWindow, "_synchronizeDrawing");
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 88);
  objc_msgSend(v2, "setTransform:", v7);
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 568);
  *(_QWORD *)(v4 + 568) = 0;

  objc_msgSend(*(id *)(a1 + 48), "completeTransition:", 1);
  objc_msgSend(*(id *)(a1 + 48), "_setAnimator:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setAnimationController:", 0);
}

uint64_t __95___UIWindowAnimationController__performLayoutAnimationWithContext_windowGeometryUpdatingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
}

uint64_t __95___UIWindowAnimationController__performLayoutAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_setAnimator:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_setAnimationController:", 0);
}

uint64_t __50___UIWindowAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
