@implementation PKPGSVTransitionInterstitialController

+ (id)createInView:(id)a3 withProvider:(id)a4 containerAlpha:(double)a5 deactivationHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKPGSVTransitionInterstitialController *v13;
  id v14;
  id v15;
  id result;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t (**v32)(void *, void *);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id WeakRetained;
  void *v38;
  void *v39;
  uint64_t v40;
  id *location;
  id v42;
  void *v43;
  _QWORD aBlock[4];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  objc_super v51;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v12 = 0;
LABEL_22:

    return v12;
  }
  v13 = [PKPGSVTransitionInterstitialController alloc];
  v14 = v9;
  v15 = v10;
  result = v11;
  v17 = result;
  if (!v13)
    goto LABEL_10;
  if (v14 && v15)
  {
    v51.receiver = v13;
    v51.super_class = (Class)PKPGSVTransitionInterstitialController;
    v18 = objc_msgSendSuper2(&v51, sel_init);
    if (v18)
    {
      v19 = (uint64_t)v18;
      v43 = v17;
      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(v19 + 120);
      *(_QWORD *)(v19 + 120) = v20;

      v22 = objc_msgSend(MEMORY[0x1E0CB3748], "pk_createStrongPointerPersonalityToStrongObjects");
      v23 = *(void **)(v19 + 32);
      *(_QWORD *)(v19 + 32) = v22;

      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = *(void **)(v19 + 72);
      *(_QWORD *)(v19 + 72) = v24;

      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = *(void **)(v19 + 80);
      *(_QWORD *)(v19 + 80) = v26;

      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithSpringState:", 1.0, 246.820852, 31.4210663, 0.0);
      v29 = *(void **)(v19 + 56);
      *(_QWORD *)(v19 + 56) = v28;

      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithSpringState:", 2.0, 300.0, 50.0, 0.0);
      v31 = *(void **)(v19 + 64);
      *(_QWORD *)(v19 + 64) = v30;

      objc_msgSend(*(id *)(v19 + 64), "setSpeed:", 1.6);
      v42 = v14;
      objc_storeWeak((id *)(v19 + 8), v14);
      *(double *)(v19 + 16) = a5;
      *(_BYTE *)(v19 + 106) = 1;
      location = (id *)(v19 + 112);
      objc_storeWeak((id *)(v19 + 112), v15);
      -[PKPGSVTransitionInterstitialController _updateBindings](v19);
      *(_BYTE *)(v19 + 104) = 1;
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __102__PKPGSVTransitionInterstitialController__initInView_withProvider_containerAlpha_deactivationHandler___block_invoke;
      aBlock[3] = &unk_1E3E64CD0;
      v46 = &v47;
      v12 = (id)v19;
      v45 = v12;
      v32 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
      objc_msgSend(v15, "leadingViewsForInterstitialController:", v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v32[2](v32, v33);

      objc_msgSend(v15, "trailingViewsForInterstitialController:", v12);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)v32[2](v32, v35);

      -[PKPGSVTransitionInterstitialController _createDefaultInterstitialsIn:forViews:]((uint64_t)v12, *(void **)(v19 + 72), v34);
      -[PKPGSVTransitionInterstitialController _createDefaultInterstitialsIn:forViews:]((uint64_t)v12, *(void **)(v19 + 80), v36);
      *(_BYTE *)(v19 + 104) = 0;
      if (*((_BYTE *)v12 + 105))
      {
        WeakRetained = objc_loadWeakRetained(location);
        if (WeakRetained)
          objc_msgSend(v12, "setNeedsUpdateForProvider:", WeakRetained);
        else
          *((_BYTE *)v12 + 105) = 0;

      }
      if (objc_msgSend(*(id *)(v19 + 72), "count") || objc_msgSend(*(id *)(v19 + 80), "count") || *((_BYTE *)v48 + 24))
      {
        v38 = _Block_copy(v43);
        v39 = (void *)*((_QWORD *)v12 + 5);
        *((_QWORD *)v12 + 5) = v38;

        -[PKPGSVTransitionInterstitialController _beginTimeout]((uint64_t)v12);
        if (!*((_BYTE *)v12 + 137))
        {
          v40 = *((_QWORD *)v12 + 5);
          if (v40)
            (*(void (**)(uint64_t, id))(v40 + 16))(v40, v12);
        }

        _Block_object_dispose(&v47, 8);
      }
      else
      {
        *(_BYTE *)(v19 + 106) = 0;
        objc_storeWeak(location, 0);
        -[PKPGSVTransitionInterstitialController _updateBindings]((uint64_t)v12);

        _Block_object_dispose(&v47, 8);
        v12 = 0;
      }
      v14 = v42;
      v17 = v43;
      goto LABEL_21;
    }
LABEL_10:
    v12 = 0;
LABEL_21:

    goto LABEL_22;
  }
  __break(1u);
  return result;
}

- (PKPGSVTransitionInterstitialController)init
{

  return 0;
}

- (void)_updateBindings
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void (**v6)(void *, id);
  id WeakRetained;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD aBlock[4];
  id v37;
  uint64_t v38;
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 120), "allObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    if (*(_BYTE *)(a1 + 136))
    {
      v4 = 0;
    }
    else
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__PKPGSVTransitionInterstitialController__updateBindings__block_invoke;
      aBlock[3] = &unk_1E3E64CF8;
      v37 = v3;
      v38 = a1;
      v4 = v5;
      v39 = v4;
      v6 = (void (**)(void *, id))_Block_copy(aBlock);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      v6[2](v6, WeakRetained);

      v8 = objc_loadWeakRetained((id *)(a1 + 112));
      v6[2](v6, v8);

    }
    if (objc_msgSend(v3, "count"))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v9 = v3;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v33 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(a1 + 120), "removeObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        }
        while (v11);
      }

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "unbindInterstitialController:", a1);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        }
        while (v16);
      }

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v4;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * k), "bindInterstitialController:", a1, (_QWORD)v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
      }
      while (v21);
    }

  }
}

id __102__PKPGSVTransitionInterstitialController__initInView_withProvider_containerAlpha_deactivationHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  float v16;
  float v17;
  double v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
    __break(1u);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    v8 = (void *)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        objc_msgSend(v10, "layer", (_QWORD)v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "presentationLayer");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (void *)v12;
        else
          v14 = v11;
        v15 = v14;

        objc_msgSend(v15, "opacity");
        v17 = v16;

        v18 = *(double *)(*(_QWORD *)(a1 + 32) + 16) * v17;
        if (v18 > 0.0)
        {
          v8 = v4;
          goto LABEL_16;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_16:

  v19 = v8;
  return v19;
}

- (void)_createDefaultInterstitialsIn:(void *)a3 forViews:
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  PKPGSVTransitionInterstitialView *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id WeakRetained;
  unint64_t v26;
  _QWORD aBlock[4];
  id v28;
  id location;

  v5 = a2;
  v6 = a3;
  if (v5 && (v7 = v6) != 0)
  {
    v8 = objc_msgSend(v5, "count");
    v26 = objc_msgSend(v7, "count");
    if (v8 < v26)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      if (WeakRetained)
      {
        v24 = v5;
        objc_initWeak(&location, (id)a1);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __81__PKPGSVTransitionInterstitialController__createDefaultInterstitialsIn_forViews___block_invoke;
        aBlock[3] = &unk_1E3E61C58;
        objc_copyWeak(&v28, &location);
        v23 = _Block_copy(aBlock);
        v9 = *MEMORY[0x1E0C9D820];
        v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        do
        {
          v11 = v7;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = -[PKPGSVTransitionInterstitialItem initWithView:]((id *)[PKPGSVTransitionInterstitialItem alloc], v12);
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v13, v12);
          }
          v14 = [PKPGSVTransitionInterstitialView alloc];
          v15 = *(void **)(a1 + 56);
          v16 = *(void **)(a1 + 64);
          v17 = *(double *)(a1 + 16);
          v18 = v13;
          v19 = WeakRetained;
          v20 = v15;
          v21 = v16;
          v22 = v23;
          if (v14)
          {
            if (!v18)
              goto LABEL_15;
            v14 = (PKPGSVTransitionInterstitialView *)-[PKPGSVTransitionInterstitialView _initForItem:inView:withSpringFactory:dismissalSpringFactory:defaultSize:containerAlpha:activationObserver:](v14, v18, v19, v20, v21, v22, v9, v10, v17);
          }

          objc_msgSend(v24, "addObject:", v14);
          ++v8;
          v7 = v11;
        }
        while (v26 != v8);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        v5 = v24;
      }

    }
  }
  else
  {
LABEL_15:
    __break(1u);
  }
}

- (void)_beginTimeout
{
  NSObject *v2;
  void *v3;
  dispatch_source_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (a1 && !*(_BYTE *)(a1 + 136))
  {
    v2 = *(NSObject **)(a1 + 48);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v4;

    v6 = *(NSObject **)(a1 + 48);
    v7 = dispatch_time(0, 750000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    objc_initWeak(&location, (id)a1);
    v8 = *(NSObject **)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__PKPGSVTransitionInterstitialController__beginTimeout__block_invoke;
    v9[3] = &unk_1E3E61310;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v8, v9);
    dispatch_resume(*(dispatch_object_t *)(a1 + 48));
    -[PKPGSVTransitionInterstitialController _updateActive](a1);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  NSObject *timeout;
  OS_dispatch_source *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD block[4];
  id v9;

  timeout = self->_timeout;
  if (timeout)
  {
    dispatch_source_cancel(timeout);
    v4 = self->_timeout;
    self->_timeout = 0;

  }
  if (!self->_invalidated)
  {
    -[NSMapTable objectEnumerator](self->_items, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__PKPGSVTransitionInterstitialController_dealloc__block_invoke;
      block[3] = &unk_1E3E612E8;
      v9 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)PKPGSVTransitionInterstitialController;
  -[PKPGSVTransitionInterstitialController dealloc](&v7, sel_dealloc);
}

void __49__PKPGSVTransitionInterstitialController_dealloc__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        -[PKPGSVTransitionInterstitialItem invalidate](*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_updateActive
{
  uint64_t v2;
  void (*v3)(uint64_t, id);
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 136))
    {
      if (!*(_BYTE *)(a1 + 137))
        return;
      *(_BYTE *)(a1 + 137) = 0;
      goto LABEL_5;
    }
    if (*(_BYTE *)(a1 + 24))
      return;
    if (*(_QWORD *)(a1 + 128))
    {
      if (!*(_BYTE *)(a1 + 137))
        *(_BYTE *)(a1 + 137) = 1;
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = v5 != 0;
      if (*(unsigned __int8 *)(a1 + 137) != v6)
      {
        *(_BYTE *)(a1 + 137) = v6;
        if (!v5)
        {
          objc_msgSend(*(id *)(a1 + 32), "keyEnumerator");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "allObjects");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v18;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v18 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
                objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14, (_QWORD)v17);
                v15 = objc_claimAutoreleasedReturnValue();
                v16 = (void *)v15;
                if (!v15 || *(_BYTE *)(v15 + 40) || !objc_msgSend(*(id *)(v15 + 32), "count"))
                {
                  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v14);
                  -[PKPGSVTransitionInterstitialItem invalidate]((uint64_t)v16);
                }

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
            }
            while (v11);
          }

LABEL_5:
          v2 = *(_QWORD *)(a1 + 40);
          if (v2)
          {
            v3 = *(void (**)(uint64_t, id))(v2 + 16);
            v4 = (id)a1;
            v3(v2, v4);

          }
        }
      }
    }
  }
}

void __55__PKPGSVTransitionInterstitialController__beginTimeout__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  NSObject **v5;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[6];
    v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = v5[6];
      v5[6] = 0;

      v2 = v5;
    }
    -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)v2);
    v2 = v5;
  }

}

- (void)invalidate
{
  NSObject *timeout;
  OS_dispatch_source *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    timeout = self->_timeout;
    if (timeout)
    {
      dispatch_source_cancel(timeout);
      v4 = self->_timeout;
      self->_timeout = 0;

    }
    -[PKPGSVTransitionInterstitialController _updateBindings]((uint64_t)self);
    v5 = (void *)-[NSMutableArray copy](self->_leadingInterstitials, "copy");
    -[NSMutableArray removeAllObjects](self->_leadingInterstitials, "removeAllObjects");
    v6 = (void *)-[NSMutableArray copy](self->_trailingInterstitials, "copy");
    -[NSMutableArray removeAllObjects](self->_trailingInterstitials, "removeAllObjects");
    -[NSMapTable objectEnumerator](self->_items, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable removeAllObjects](self->_items, "removeAllObjects");
    __52__PKPGSVTransitionInterstitialController_invalidate__block_invoke(v5);
    __52__PKPGSVTransitionInterstitialController_invalidate__block_invoke(v6);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[PKPGSVTransitionInterstitialItem invalidate](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

    -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)self);
  }
}

void __52__PKPGSVTransitionInterstitialController_invalidate__block_invoke(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  const void *v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a1;
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v20 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v5 && !*(_BYTE *)(v5 + 421))
        {
          *(_BYTE *)(v5 + 421) = 1;
          v6 = (void *)objc_msgSend(*(id *)(v5 + 536), "mutableCopy");
          objc_msgSend(*(id *)(v5 + 536), "removeAllObjects");
          v7 = *(const void **)(v5 + 480);
          if (v7)
          {
            v8 = _Block_copy(v7);
            objc_msgSend(v6, "addObject:", v8);

            v9 = *(void **)(v5 + 480);
            *(_QWORD *)(v5 + 480) = 0;

          }
          v10 = *(const void **)(v5 + 512);
          if (v10)
          {
            v11 = _Block_copy(v10);
            objc_msgSend(v6, "addObject:", v11);

            v12 = *(void **)(v5 + 512);
            *(_QWORD *)(v5 + 512) = 0;

          }
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v13 = v6;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j) + 16))();
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
            }
            while (v15);
          }

          -[PKPGSVTransitionInterstitialView _updateActive](v5);
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __46__PKPGSVTransitionInterstitialView_invalidate__block_invoke;
          v23[3] = &unk_1E3E612E8;
          v23[4] = v5;
          objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v23);

        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v2);
  }

}

void __57__PKPGSVTransitionInterstitialController__updateBindings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "addObject:", v5);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v4);
    }
    v3 = v5;
  }

}

- (void)_createPlaceholderInterstitialsIn:(unint64_t)a3 forCount:(int)a4 push:
{
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id WeakRetained;
  void *v12;
  unint64_t v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 IsNull;
  unint64_t v24;
  double v25;
  double v26;
  PKPGSVTransitionInterstitialView *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, char);
  void *v32;
  id v33;
  id location;
  CGRect v35;

  v7 = a2;
  v8 = v7;
  if (!a1)
  {
LABEL_26:

    return;
  }
  if (v7)
  {
    v9 = objc_msgSend(v7, "count");
    if (v9 < a3)
    {
      v10 = v9;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      if (WeakRetained)
      {
        objc_initWeak(&location, (id)a1);
        v29 = MEMORY[0x1E0C809B0];
        v30 = 3221225472;
        v31 = __90__PKPGSVTransitionInterstitialController__createPlaceholderInterstitialsIn_forCount_push___block_invoke;
        v32 = &unk_1E3E61C58;
        objc_copyWeak(&v33, &location);
        v12 = _Block_copy(&v29);
        v13 = 0;
        v14 = *MEMORY[0x1E0C9D628];
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        if (v10 && a4)
        {
          for (i = 0; i != v10; ++i)
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", i, v29, v30, v31, v32);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v19, 1, v14, v15, v16, v17);
            v15 = v20;
            v16 = v21;
            v17 = v22;

          }
          v13 = v10;
        }
        v35.origin.x = v14;
        v35.origin.y = v15;
        v35.size.width = v16;
        v35.size.height = v17;
        IsNull = CGRectIsNull(v35);
        v24 = a3 - v13;
        if (a3 > v13)
        {
          if (IsNull)
            v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          else
            v25 = v17;
          if (IsNull)
            v26 = *MEMORY[0x1E0C9D820];
          else
            v26 = v16;
          do
          {
            v27 = [PKPGSVTransitionInterstitialView alloc];
            if (v27)
              v28 = -[PKPGSVTransitionInterstitialView _initForItem:inView:withSpringFactory:dismissalSpringFactory:defaultSize:containerAlpha:activationObserver:](v27, 0, WeakRetained, *(void **)(a1 + 56), *(void **)(a1 + 64), v12, v26, v25, *(double *)(a1 + 16));
            else
              v28 = 0;
            objc_msgSend(v8, "addObject:", v28, v29, v30, v31, v32);
            if (a4)
              -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v28, 1, v14, v15, v16, v17);

            --v24;
          }
          while (v24);
        }

        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
      }

    }
    goto LABEL_26;
  }
  __break(1u);
}

void __90__PKPGSVTransitionInterstitialController__createPlaceholderInterstitialsIn_forCount_push___block_invoke(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_7;
  v4 = WeakRetained[16];
  if ((a2 & 1) != 0)
  {
    v5 = 1;
LABEL_6:
    WeakRetained[16] = v5 + v4;
    v6 = WeakRetained;
    -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)WeakRetained);
    WeakRetained = v6;
LABEL_7:

    return;
  }
  if (v4)
  {
    v5 = -1;
    goto LABEL_6;
  }
  __break(1u);
}

void __81__PKPGSVTransitionInterstitialController__createDefaultInterstitialsIn_forViews___block_invoke(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_7;
  v4 = WeakRetained[16];
  if ((a2 & 1) != 0)
  {
    v5 = 1;
LABEL_6:
    WeakRetained[16] = v5 + v4;
    v6 = WeakRetained;
    -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)WeakRetained);
    WeakRetained = v6;
LABEL_7:

    return;
  }
  if (v4)
  {
    v5 = -1;
    goto LABEL_6;
  }
  __break(1u);
}

- (void)setNeedsUpdateForProvider:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    if (!self->_invalidated)
    {
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);

      v4 = v7;
      if (WeakRetained == v7
        || (v6 = objc_loadWeakRetained((id *)&self->_previousProvider), v6, v4 = v7, v6 == v7))
      {
        -[PKPGSVTransitionInterstitialController _setNeedsUpdateForCurrentProvider:]((uint64_t)self, WeakRetained == v4);
        v4 = v7;
      }
    }

  }
  else
  {
    __break(1u);
  }
}

- (void)_setNeedsUpdateForCurrentProvider:(uint64_t)a1
{
  id WeakRetained;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t (**v8)(void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  char v15;
  _QWORD v16[5];
  char v17;
  _QWORD aBlock[5];
  char v19;

  if (a1 && !*(_BYTE *)(a1 + 136))
  {
    if ((_DWORD)a2)
    {
      if (*(_BYTE *)(a1 + 104))
      {
        *(_BYTE *)(a1 + 105) = 1;
        return;
      }
      *(_WORD *)(a1 + 104) = 1;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      v5 = WeakRetained == 0;
    }
    else
    {
      if (*(_BYTE *)(a1 + 88))
      {
        *(_BYTE *)(a1 + 89) = 1;
        return;
      }
      *(_WORD *)(a1 + 88) = 1;
      v6 = objc_loadWeakRetained((id *)(a1 + 96));
      if (!v6)
      {
        *(_BYTE *)(a1 + 88) = 0;
        return;
      }
      WeakRetained = v6;
      v5 = 0;
    }
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PKPGSVTransitionInterstitialController__setNeedsUpdateForCurrentProvider___block_invoke;
    aBlock[3] = &unk_1E3E64D20;
    v19 = a2;
    aBlock[4] = a1;
    v8 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
    if (v5)
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(WeakRetained, "leadingViewsForInterstitialController:", a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)v8[2](v8, v11);

      objc_msgSend(WeakRetained, "trailingViewsForInterstitialController:", a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8[2](v8, v12);

    }
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __76__PKPGSVTransitionInterstitialController__setNeedsUpdateForCurrentProvider___block_invoke_2;
    v16[3] = &unk_1E3E64D48;
    v16[4] = a1;
    v17 = a2;
    v13 = _Block_copy(v16);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
    v15 = *(_BYTE *)(a1 + 24);
    *(_BYTE *)(a1 + 24) = 1;
    if ((_DWORD)a2)
    {
      -[PKPGSVTransitionInterstitialController _createPlaceholderInterstitialsIn:forCount:push:](a1, *(void **)(a1 + 72), objc_msgSend(v10, "count"), 0);
      -[PKPGSVTransitionInterstitialController _createPlaceholderInterstitialsIn:forCount:push:](a1, *(void **)(a1 + 80), objc_msgSend(v9, "count"), 0);
      ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, *(_QWORD *)(a1 + 72), v10);
      ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, *(_QWORD *)(a1 + 80), v9);
      *(_BYTE *)(a1 + 104) = 0;
      if (!*(_BYTE *)(a1 + 105))
        goto LABEL_20;
    }
    else
    {
      (*((void (**)(void *, _QWORD, void *))v13 + 2))(v13, *(_QWORD *)(a1 + 72), v10);
      ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, *(_QWORD *)(a1 + 80), v9);
      *(_BYTE *)(a1 + 88) = 0;
      if (!*(_BYTE *)(a1 + 89))
      {
LABEL_20:
        *(_BYTE *)(a1 + 24) = v15;
        -[PKPGSVTransitionInterstitialController _updateActive](a1);

        return;
      }
    }
    -[PKPGSVTransitionInterstitialController _setNeedsUpdateForCurrentProvider:](a1, a2);
    goto LABEL_20;
  }
}

id __76__PKPGSVTransitionInterstitialController__setNeedsUpdateForCurrentProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  float v18;
  float v19;
  double v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
    __break(1u);
  v4 = v3;
  v5 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      v5 = (void *)MEMORY[0x1E0C9AA60];
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v11, (_QWORD)v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {

LABEL_18:
            v5 = v6;
            goto LABEL_19;
          }
          objc_msgSend(v11, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "presentationLayer");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
            v16 = (void *)v14;
          else
            v16 = v13;
          v17 = v16;

          objc_msgSend(v17, "opacity");
          v19 = v18;

          v20 = *(double *)(*(_QWORD *)(a1 + 32) + 16) * v19;
          if (v20 > 0.0)
            goto LABEL_18;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C9AA60];
    }
LABEL_19:

  }
  v21 = v5;

  return v21;
}

void __76__PKPGSVTransitionInterstitialController__setNeedsUpdateForCurrentProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  v32 = a2;
  v5 = a3;
  v6 = objc_msgSend(v32, "count");
  v7 = objc_msgSend(v5, "count");
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = *MEMORY[0x1E0C9D628];
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v6 >= v7)
    v15 = v7;
  else
    v15 = v6;
  if (v15)
  {
    v16 = 0;
    v17 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      objc_msgSend(v32, "objectAtIndexedSubscript:", v16);
      v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v21 = -[PKPGSVTransitionInterstitialItem initWithView:]((id *)[PKPGSVTransitionInterstitialItem alloc], v20);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v21, v20);
      }
      if (*(_BYTE *)(a1 + 40))
      {
        v17 = -[PKPGSVTransitionInterstitialView updateCurrentItem:withDefaultSize:containerAlpha:](v19, v21, v17, v18, *(double *)(*(_QWORD *)(a1 + 32) + 16));
        v18 = v22;
        v11 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v19, 1, v11, v12, v13, v14);
        v12 = v23;
        v13 = v24;
        v14 = v25;
      }
      else if (v19)
      {
        -[PKPGSVTransitionInterstitialView _setPreviousItem:withDefaultSize:force:animated:]((uint64_t)v19, v21, 0, 1, v9, v10);
      }

      ++v16;
    }
    while (v15 != v16);
  }
  else
  {
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v17 = *MEMORY[0x1E0C9D820];
  }
  if (v6 > v8)
  {
    do
    {
      objc_msgSend(v32, "objectAtIndexedSubscript:", v15);
      v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (*(_BYTE *)(a1 + 40))
      {
        v17 = -[PKPGSVTransitionInterstitialView updateCurrentItem:withDefaultSize:containerAlpha:](v26, 0, v17, v18, *(double *)(*(_QWORD *)(a1 + 32) + 16));
        v18 = v28;
        v11 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v27, 1, v11, v12, v13, v14);
        v12 = v29;
        v13 = v30;
        v14 = v31;
      }
      else if (v26)
      {
        -[PKPGSVTransitionInterstitialView _setPreviousItem:withDefaultSize:force:animated:]((uint64_t)v26, 0, 0, 1, v9, v10);
      }

      ++v15;
    }
    while (v6 != v15);
  }

}

- (BOOL)isInView:(id)a3
{
  BOOL v3;
  UIView **p_container;
  id v5;
  id WeakRetained;

  v3 = 0;
  if (a3 && !self->_invalidated)
  {
    p_container = &self->_container;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_container);
    v3 = WeakRetained == v5;

  }
  return v3;
}

- (void)transferToView:(id)a3 withDeactivationHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id deactivation;
  void (**v11)(void *, NSMutableArray *);
  _QWORD aBlock[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (!self->_invalidated)
    {
      objc_storeWeak((id *)&self->_container, v6);
      v9 = _Block_copy(v8);
      deactivation = self->_deactivation;
      self->_deactivation = v9;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__PKPGSVTransitionInterstitialController_transferToView_withDeactivationHandler___block_invoke;
      aBlock[3] = &unk_1E3E61E98;
      v13 = v6;
      v11 = (void (**)(void *, NSMutableArray *))_Block_copy(aBlock);
      self->_deferUpdateActive = 1;
      v11[2](v11, self->_leadingInterstitials);
      v11[2](v11, self->_trailingInterstitials);
      -[PKPGSVTransitionInterstitialController _beginTimeout]((uint64_t)self);
      self->_deferUpdateActive = 0;
      -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)self);

    }
  }
  else
  {
    __break(1u);
  }
}

void __81__PKPGSVTransitionInterstitialController_transferToView_withDeactivationHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[9];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_BYTE **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v8 = *(id *)(a1 + 32);
        v9 = v8;
        if (v7)
        {
          if (!v8 || v7[418])
            __break(1u);
          v7[418] = 1;
          objc_msgSend(v7, "superview");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          if (v10)
          {
            if ((void *)v10 != v9 && v7[419] != 0)
            {
              objc_msgSend(v7, "bounds");
              objc_msgSend(v9, "convertRect:fromView:", v7);
              v14 = v13;
              v16 = v15;
              v18 = v17;
              v20 = v19;
              objc_msgSend(v9, "addSubview:", v7);
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __51__PKPGSVTransitionInterstitialView_transferToView___block_invoke;
              v26[3] = &unk_1E3E62900;
              v26[4] = v7;
              v26[5] = v14;
              v26[6] = v16;
              v26[7] = v18;
              v26[8] = v20;
              objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v26);
            }
          }
          else
          {
            objc_msgSend(v9, "addSubview:", v7);
            v7[419] = 0;
          }
          v7[418] = 0;

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

}

- (void)pushProvider:(id)a3 withContainerAlpha:(double)a4 context:(void *)a5
{
  id v8;
  void *v9;
  NSObject *timeout;
  OS_dispatch_source *v11;
  id WeakRetained;
  uint64_t v13;
  uint64_t (**v14)(void *, void *);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void *, NSMutableArray *, void *);
  id v20;
  _QWORD v21[6];
  _QWORD aBlock[6];

  v8 = a3;
  if (self->_updatingCurrentProvider
    || self->_updatingPreviousProvider
    || self->_currentProviderDirty
    || self->_previousProviderDirty)
  {
    __break(1u);
  }
  else
  {
    v9 = v8;
    if (!self->_invalidated)
    {
      timeout = self->_timeout;
      if (timeout)
      {
        dispatch_source_cancel(timeout);
        v11 = self->_timeout;
        self->_timeout = 0;

      }
      self->_alpha = a4;
      self->_context = a5;
      WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);
      objc_storeWeak((id *)&self->_previousProvider, WeakRetained);

      self->_currentProviderExisted = v9 != 0;
      objc_storeWeak((id *)&self->_currentProvider, v9);
      -[PKPGSVTransitionInterstitialController _updateBindings]((uint64_t)self);
      self->_updatingCurrentProvider = 1;
      v13 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__PKPGSVTransitionInterstitialController_pushProvider_withContainerAlpha_context___block_invoke;
      aBlock[3] = &unk_1E3E64D70;
      aBlock[4] = self;
      *(double *)&aBlock[5] = a4;
      v14 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
      if (v9)
      {
        objc_msgSend(v9, "leadingViewsForInterstitialController:", self);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)v14[2](v14, v15);

        objc_msgSend(v9, "trailingViewsForInterstitialController:", self);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)v14[2](v14, v17);

      }
      else
      {
        v18 = (void *)MEMORY[0x1E0C9AA60];
        v16 = (void *)MEMORY[0x1E0C9AA60];
      }
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __82__PKPGSVTransitionInterstitialController_pushProvider_withContainerAlpha_context___block_invoke_2;
      v21[3] = &unk_1E3E64D98;
      v21[4] = self;
      *(double *)&v21[5] = a4;
      v19 = (void (**)(void *, NSMutableArray *, void *))_Block_copy(v21);
      self->_deferUpdateActive = 1;
      -[PKPGSVTransitionInterstitialController _createPlaceholderInterstitialsIn:forCount:push:]((uint64_t)self, self->_leadingInterstitials, objc_msgSend(v16, "count"), 1);
      -[PKPGSVTransitionInterstitialController _createPlaceholderInterstitialsIn:forCount:push:]((uint64_t)self, self->_trailingInterstitials, objc_msgSend(v18, "count"), 1);
      v19[2](v19, self->_leadingInterstitials, v16);
      v19[2](v19, self->_trailingInterstitials, v18);
      self->_updatingCurrentProvider = 0;
      if (self->_currentProviderDirty)
      {
        v20 = objc_loadWeakRetained((id *)&self->_currentProvider);
        if (v20)
          -[PKPGSVTransitionInterstitialController setNeedsUpdateForProvider:](self, "setNeedsUpdateForProvider:", v20);
        else
          self->_currentProviderDirty = 0;

      }
      self->_deferUpdateActive = 0;
      -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)self);

    }
  }
}

id __82__PKPGSVTransitionInterstitialController_pushProvider_withContainerAlpha_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  float v17;
  float v18;
  double v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
    __break(1u);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v8 = (void *)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v10, (_QWORD)v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {

LABEL_17:
          v8 = v4;
          goto LABEL_18;
        }
        objc_msgSend(v10, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "presentationLayer");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = (void *)v13;
        else
          v15 = v12;
        v16 = v15;

        objc_msgSend(v16, "opacity");
        v18 = v17;

        v19 = *(double *)(a1 + 40) * v18;
        if (v19 > 0.0)
          goto LABEL_17;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_18:

  v20 = v8;
  return v20;
}

void __82__PKPGSVTransitionInterstitialController_pushProvider_withContainerAlpha_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  v29 = a2;
  v5 = a3;
  v6 = objc_msgSend(v29, "count");
  v7 = objc_msgSend(v5, "count");
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = *MEMORY[0x1E0C9D628];
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v6 >= v7)
    v15 = v7;
  else
    v15 = v6;
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v19 = -[PKPGSVTransitionInterstitialItem initWithView:]((id *)[PKPGSVTransitionInterstitialItem alloc], v18);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v19, v18);
      }
      v9 = -[PKPGSVTransitionInterstitialView pushItem:withDefaultSize:containerAlpha:]((uint64_t)v17, v19, v9, v10, *(double *)(a1 + 40));
      v10 = v20;
      v11 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v17, 1, v11, v12, v13, v14);
      v12 = v21;
      v13 = v22;
      v14 = v23;

    }
  }
  if (v6 > v8)
  {
    do
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPGSVTransitionInterstitialView pushItem:withDefaultSize:containerAlpha:]((uint64_t)v24, 0, v9, v10, *(double *)(a1 + 40));
      v10 = v25;
      v11 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v24, 1, v11, v12, v13, v14);
      v12 = v26;
      v13 = v27;
      v14 = v28;

      ++v15;
    }
    while (v6 != v15);
  }

}

- (BOOL)isCurrentProvider:(id)a3
{
  PKPGSVTransitionInterstitialProvider **p_currentProvider;
  id v4;
  id WeakRetained;
  BOOL v6;

  if (!a3)
    return !self->_currentProviderExisted;
  p_currentProvider = &self->_currentProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_currentProvider);
  v6 = WeakRetained == v4;

  return v6;
}

- (void)updateCurrentProvider:(id)a3 withContainerAlpha:(double)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  if (*(_WORD *)&self->_updatingCurrentProvider)
  {
    __break(1u);
  }
  else
  {
    v7 = v6;
    if (!self->_invalidated)
    {
      self->_alpha = a4;
      self->_currentProviderExisted = v6 != 0;
      v8 = v6;
      objc_storeWeak((id *)&self->_currentProvider, v6);
      -[PKPGSVTransitionInterstitialController _updateBindings]((uint64_t)self);
      -[PKPGSVTransitionInterstitialController _setNeedsUpdateForCurrentProvider:]((uint64_t)self, 1);
      v7 = v8;
    }

  }
}

- (void)updateExistingViewsForCurrentProviderAnimated:(BOOL)a3 withContainerAlpha:(double)a4
{
  void (**v5)(void *, NSMutableArray *);
  _QWORD v6[5];
  BOOL v7;

  if (self->_updatingCurrentProvider || self->_currentProviderDirty)
  {
    __break(1u);
  }
  else if (!self->_invalidated)
  {
    self->_alpha = a4;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __107__PKPGSVTransitionInterstitialController_updateExistingViewsForCurrentProviderAnimated_withContainerAlpha___block_invoke;
    v6[3] = &unk_1E3E64DC0;
    v7 = a3;
    v6[4] = self;
    v5 = (void (**)(void *, NSMutableArray *))_Block_copy(v6);
    v5[2](v5, self->_leadingInterstitials);
    v5[2](v5, self->_trailingInterstitials);

  }
}

void __107__PKPGSVTransitionInterstitialController_updateExistingViewsForCurrentProviderAnimated_withContainerAlpha___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if (v12)
        {
          v13 = *(double *)(*(_QWORD *)(a1 + 32) + 16);
          -[PKPGSVTransitionInterstitialView _updatePositionAnimated:](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11), *(unsigned __int8 *)(a1 + 40));
          -[PKPGSVTransitionInterstitialView _setContainerAlpha:animated:](v12, 1, v13);
        }
        v6 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v12, *(unsigned __int8 *)(a1 + 40), v6, v7, v8, v9);
        v7 = v14;
        v8 = v15;
        v9 = v16;
        ++v11;
      }
      while (v5 != v11);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundProviders, 0);
  objc_destroyWeak((id *)&self->_currentProvider);
  objc_destroyWeak((id *)&self->_previousProvider);
  objc_storeStrong((id *)&self->_trailingInterstitials, 0);
  objc_storeStrong((id *)&self->_leadingInterstitials, 0);
  objc_storeStrong((id *)&self->_dismissalSpringFactory, 0);
  objc_storeStrong((id *)&self->_springFactory, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong(&self->_deactivation, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end
