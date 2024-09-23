@implementation UIViewFloatAnimatableProperty

void __109__UIViewFloatAnimatableProperty_UserNotificationsUIKit__unui_animatablePropertyWithProgressMilestones_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isInvalidated") & 1) == 0)
  {
    objc_msgSend(v3, "presentationValue");
    v5 = v4;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "floatValue");
          v14 = v13;
          if (BSFloatLessThanOrEqualToFloat())
          {
            (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(v14, v5);
            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v9, "addObject:", v12);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      objc_msgSend(v3, "invalidate");

  }
}

@end
