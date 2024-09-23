@implementation UISystemGestureManager

void __41___UISystemGestureManager_sharedInstance__block_invoke()
{
  _UISystemGestureManager *v0;
  void *v1;

  v0 = objc_alloc_init(_UISystemGestureManager);
  v1 = (void *)qword_1ECD7E050;
  qword_1ECD7E050 = (uint64_t)v0;

}

void __72___UISystemGestureManager_allowGestureRecognizersOnDisplayWithIdentity___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3[1], "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      objc_msgSend(v4, "gestureRecognizers", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(v5, "removeGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

      objc_msgSend(v3[1], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    }

  }
}

id __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke(id *a1)
{
  id v2;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(id *);
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = objc_alloc_init(MEMORY[0x1E0D01750]);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_2;
  v13 = &unk_1E16C9318;
  v4 = v2;
  v14 = v4;
  objc_copyWeak(&v15, a1 + 5);
  objc_copyWeak(&v16, a1 + 6);
  objc_copyWeak(&v17, a1 + 7);
  objc_msgSend(v4, "appendBodySectionWithName:block:", 0, &v10);
  objc_msgSend(v4, "description");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(WeakRetained, "recursiveDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@\n\n%@"), v5, v8, v10, v11, v12, v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

  return v6;
}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_2(id *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD aBlock[4];
  id v12;
  id v13;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_4;
  aBlock[3] = &unk_1E16C92C8;
  v12 = a1[4];
  v13 = &__block_literal_global_263;
  v3 = _Block_copy(aBlock);
  v4 = a1[4];
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_7;
  v6[3] = &unk_1E16C92F0;
  v5 = v3;
  v7 = v5;
  objc_copyWeak(&v8, a1 + 5);
  objc_copyWeak(&v9, a1 + 6);
  objc_copyWeak(&v10, a1 + 7);
  objc_msgSend(v4, "appendBodySectionWithName:block:", CFSTR("gestures"), v6);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);

}

id __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _UIGestureRecognizerStateString(objc_msgSend(a2, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "isEnabled");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%p; state = %@; enabled: %@"), a2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_5;
  v7[3] = &unk_1E16C92A0;
  v8 = v6;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v8, "appendCollection:withName:itemBlock:", a3, a2, v7);

}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_6;
  v6[3] = &unk_1E16B46D0;
  v7 = v4;
  v5 = *(id *)(a1 + 40);
  v8 = a2;
  v9 = v5;
  objc_msgSend(v7, "appendProem:block:", 0, v6);

}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", v7, v3);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v2, "appendObject:withName:", v7, v5);

  }
}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, const __CFString *, id))(v2 + 16))(v2, CFSTR("internal"), WeakRetained);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, const __CFString *, id))(v4 + 16))(v4, CFSTR("external"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, const __CFString *, id))(v6 + 16))(v6, CFSTR("externalEdgeSwipe"), v7);

}

uint64_t __55____UISystemGestureManager__addInternalGesturesToView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addGestureRecognizer:", a2);
}

uint64_t __51____UISystemGestureManager__removeInternalGestures__block_invoke(uint64_t a1, void *a2)
{
  void *v4;

  objc_msgSend(a2, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", a2);

  return objc_msgSend(a2, "removeTarget:action:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __113____UISystemGestureManager_exclusiveTouchGestureRecognizer_achievedMaximumAbsoluteAccumulatedMovement_timestamp___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAchievedMaximumMovement:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_handleTooMuchMovementWithLastTouchTimestamp:", *(double *)(a1 + 40));
}

uint64_t __62____UISystemGestureManager__externalGestureRecognizerChanged___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  return result;
}

void __73____UISystemGestureManager__handleTooMuchMovementWithLastTouchTimestamp___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73____UISystemGestureManager__handleTooMuchMovementWithLastTouchTimestamp___block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v5 = v3;
  v6 = a2;
  objc_msgSend(v5, "appendProem:block:", 0, v4);

}

void __73____UISystemGestureManager__handleTooMuchMovementWithLastTouchTimestamp___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", v7, v3);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v2, "appendObject:withName:", v7, v5);

  }
}

@end
