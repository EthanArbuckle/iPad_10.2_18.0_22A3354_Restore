@implementation PKRemoveableAnimationTracker

- (void)_preempt
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void (**v9)(void);

  if (a1 && !*(_BYTE *)(a1 + 11))
  {
    *(_BYTE *)(a1 + 11) = 1;
    v9 = (void (**)(void))_Block_copy(*(const void **)(a1 + 16));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (*(_BYTE *)(a1 + 8) || *(_BYTE *)(a1 + 9))
      goto LABEL_17;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v4 = WeakRetained;
    if (!WeakRetained)
    {
      -[PKRemoveableAnimationTracker _removeWithLayer:](a1, 0);
LABEL_16:

LABEL_17:
      return;
    }
    objc_msgSend(WeakRetained, "animationForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "pkui_elapsedDurationForAnimation:", v5);
      if (v6 > 0.0)
      {
LABEL_15:

        goto LABEL_16;
      }
      if (v9)
        v9[2]();
      v7 = a1;
      v8 = v4;
    }
    else
    {
      v7 = a1;
      v8 = 0;
    }
    -[PKRemoveableAnimationTracker _removeWithLayer:](v7, v8);
    goto LABEL_15;
  }
}

- (void)_remove
{
  id WeakRetained;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 8))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      -[PKRemoveableAnimationTracker _removeWithLayer:](a1, WeakRetained);

    }
  }
}

+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5
{
  return (id)objc_msgSend(a1, "createForAnimation:inLayer:store:withPreemptAction:completionAction:", a3, a4, a5, 0, 0);
}

+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5 withPreemptAction:(id)a6
{
  return (id)objc_msgSend(a1, "createForAnimation:inLayer:store:withPreemptAction:completionAction:", a3, a4, a5, a6, 0);
}

+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5 withPreemptAction:(id)a6 completionAction:(id)a7
{
  id v11;
  id v12;
  id *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  PKRemoveableAnimationTracker *v18;
  id *v19;
  void *v20;
  id v21;
  id *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id *v26;
  _QWORD v28[4];
  id *v29;
  id v30;
  id v31;
  objc_super v32;

  v11 = a3;
  v12 = a4;
  v13 = (id *)a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (v11 && v12)
  {
    objc_msgSend(v11, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      __break(1u);
    }
    else
    {
      v18 = [PKRemoveableAnimationTracker alloc];
      if (v18)
      {
        v32.receiver = v18;
        v32.super_class = (Class)PKRemoveableAnimationTracker;
        v19 = objc_msgSendSuper2(&v32, sel_init);
LABEL_6:
        objc_storeWeak(v19 + 3, v12);
        v20 = _Block_copy(v14);
        v21 = v19[2];
        v19[2] = v20;

        if (v13)
        {
          *((_BYTE *)v19 + 10) = 1;
          objc_msgSend(v13[1], "addObject:", v19);
        }
        objc_initWeak(&v32.receiver, v13);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __100__PKRemoveableAnimationTracker_createForAnimation_inLayer_store_withPreemptAction_completionAction___block_invoke;
        v28[3] = &unk_1E2ADB318;
        v22 = v19;
        v29 = v22;
        objc_copyWeak(&v31, &v32.receiver);
        v30 = v16;
        objc_msgSend(v11, "pkui_setCompletionHandler:", v28);
        objc_msgSend(v12, "pkui_addAdditiveAnimation:", v11);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v22[4];
        v22[4] = (id)v23;

        *((_BYTE *)v22 + 8) = v22[4] == 0;
        v25 = v30;
        v26 = v22;

        objc_destroyWeak(&v31);
        objc_destroyWeak(&v32.receiver);
        goto LABEL_12;
      }
    }
    v19 = 0;
    goto LABEL_6;
  }
  if (v15)
    (*((void (**)(id, BOOL))v15 + 2))(v15, v11 == 0);
  v26 = 0;
LABEL_12:

  return v26;
}

uint64_t __100__PKRemoveableAnimationTracker_createForAnimation_inLayer_store_withPreemptAction_completionAction___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 10))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v5 = *(id *)(a1 + 32);
      v6 = v5;
      if (v5)
        *((_BYTE *)v5 + 10) = 0;
      v7 = objc_msgSend(WeakRetained[1], "indexOfObjectIdenticalTo:", v5);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(WeakRetained[1], "removeObjectAtIndex:", v7);

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (PKRemoveableAnimationTracker)init
{

  return 0;
}

- (void)_removeWithLayer:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 8) && !*(_BYTE *)(a1 + 9))
  {
    if (*(_BYTE *)(a1 + 11) || (v4 = v3, -[PKRemoveableAnimationTracker _preempt](a1), v3 = v4, !*(_BYTE *)(a1 + 8)))
    {
      *(_BYTE *)(a1 + 8) = 1;
      if (v3)
      {
        v5 = v3;
        objc_msgSend(v3, "removeAnimationForKey:", *(_QWORD *)(a1 + 32));
        v3 = v5;
      }
    }
  }

}

- (CALayer)layer
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_layer);
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_layer);
  objc_storeStrong(&self->_preemptAction, 0);
}

@end
