@implementation SBLockToAppStatusBarAnimator

- (void)animateStatusBarFromLockToHome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  SBLockToAppStatusBarAnimator *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  SBLockToAppStatusBarAnimator *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coverSheetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "statusBarManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBReduceMotion())
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateStatusBarLegibilityForWindowScene:", v5);

    objc_msgSend(v3, "updateSpringBoardStatusBarForLockScreenTeardown");
    if (objc_msgSend(v6, "isStatusBarEffectivelyHidden"))
    {
      v18 = (void *)MEMORY[0x1E0D01908];
      objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "iconAnimationSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reducedMotionSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "centralAnimationSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "BSAnimationSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "factoryWithSettings:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = MEMORY[0x1E0C809B0];
      v15 = (void *)MEMORY[0x1E0D01908];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke;
      v33[3] = &unk_1E8E9E820;
      v33[4] = self;
      v34 = v7;
      v32[0] = v14;
      v32[1] = 3221225472;
      v32[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_2;
      v32[3] = &unk_1E8E9E980;
      v32[4] = self;
      objc_msgSend(v15, "animateWithFactory:actions:completion:", v19, v33, v32);

    }
  }
  else
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__87;
    v30[4] = __Block_byref_object_dispose__87;
    v31 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = (void *)MEMORY[0x1E0CEABB0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_13;
    v26[3] = &unk_1E8E9FD30;
    v29 = v30;
    v27 = v7;
    v28 = self;
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_2_17;
    v20[3] = &unk_1E8EB7B38;
    v21 = v5;
    v22 = v3;
    v23 = self;
    v24 = v30;
    v25 = 0x3FD0000000000000;
    objc_msgSend(v17, "animateWithDuration:animations:completion:", v26, v20, 0.25);

    _Block_object_dispose(v30, 8);
  }

}

void __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "acquireDisableAlphaChangesAssertionWithReason:", CFSTR("SBLockToAppStatusBarAnimator"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

void __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

void __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[SBLockToAppStatusBarAnimator animateStatusBarFromLockToHome]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 8, v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "acquire");
  objc_msgSend(*(id *)(a1 + 32), "acquireDisableAlphaChangesAssertionWithReason:", CFSTR("SBLockToAppStatusBarAnimator"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v7;

}

uint64_t __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_2_17(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  _QWORD v7[5];

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStatusBarLegibilityForWindowScene:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "updateSpringBoardStatusBarForLockScreenTeardown");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "invalidate");
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

  v5 = *(double *)(a1 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_3;
  v7[3] = &unk_1E8E9ED40;
  v7[4] = *(_QWORD *)(a1 + 56);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v7, v5);
}

void __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableStatusBarAlphaChangeAssertion, 0);
}

@end
