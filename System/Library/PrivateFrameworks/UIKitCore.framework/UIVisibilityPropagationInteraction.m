@implementation UIVisibilityPropagationInteraction

void __58___UIVisibilityPropagationInteraction__enqueuedUpdateBody__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTarget:", v3);
  objc_msgSend(v4, "setInheritingEnvironment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D87D00], "grantWithNamespace:sourceEnvironment:attributes:", *MEMORY[0x1E0DC5DA8], *(_QWORD *)(a1 + 40), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalAttributes:", v6);

}

void __79___UIVisibilityPropagationInteraction__visibilityLock_enqueueUpdateIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v2 = (void *)MEMORY[0x186DC9484]();
    os_unfair_lock_lock((os_unfair_lock_t)v12 + 21);
    os_unfair_lock_lock((os_unfair_lock_t)v12 + 20);
    v3 = v12;
    if (*((_BYTE *)v12 + 93))
    {
      v4 = 0;
      v5 = 0;
    }
    else
    {
      v5 = (void *)objc_msgSend(*((id *)v12 + 1), "copy");
      v4 = (void *)objc_msgSend(*((id *)v12 + 6), "copy");
      v3 = v12;
    }
    v3[92] = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)v12 + 20);
    if (!BSEqualObjects() || (BSEqualStrings() & 1) == 0)
    {
      objc_storeStrong((id *)v12 + 7, v5);
      objc_storeStrong((id *)v12 + 8, v4);
      v6 = (void *)*((_QWORD *)v12 + 9);
      if (v5 && v4)
      {
        v7 = (void *)MEMORY[0x1E0D23020];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __58___UIVisibilityPropagationInteraction__enqueuedUpdateBody__block_invoke;
        v13[3] = &unk_1E16E8CE0;
        v14 = v5;
        v15 = v4;
        v8 = v6;
        objc_msgSend(v7, "injectorWithConfigurator:", v13);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)*((_QWORD *)v12 + 9);
        *((_QWORD *)v12 + 9) = v9;

        v11 = v14;
      }
      else
      {
        *((_QWORD *)v12 + 9) = 0;
        v11 = v6;
      }

      objc_msgSend(v6, "invalidate");
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v12 + 21);

    objc_autoreleasePoolPop(v2);
    WeakRetained = v12;
  }

}

void __71___UIVisibilityPropagationInteraction__visibilityLock_didMoveToWindow___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 20);
    -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility]((uint64_t)WeakRetained);
    os_unfair_lock_unlock(WeakRetained + 20);
  }

}

@end
