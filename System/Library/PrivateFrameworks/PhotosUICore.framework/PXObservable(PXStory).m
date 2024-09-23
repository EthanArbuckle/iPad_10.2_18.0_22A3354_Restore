@implementation PXObservable(PXStory)

- (void)pxStory_enumerateStatesWithTimeout:()PXStory watchingChanges:usingBlock:timeoutHandler:
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  dispatch_time_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;

  v10 = a5;
  v11 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __102__PXObservable_PXStory__pxStory_enumerateStatesWithTimeout_watchingChanges_usingBlock_timeoutHandler___block_invoke;
  v22[3] = &unk_1E5131448;
  v13 = v10;
  v23 = v13;
  v24 = v25;
  objc_msgSend(a1, "pxStory_enumerateStatesByWatchingChanges:usingBlock:", a4, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "storyQueue");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
    }
    dispatch_assert_queue_V2(v15);
    v17 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __102__PXObservable_PXStory__pxStory_enumerateStatesWithTimeout_watchingChanges_usingBlock_timeoutHandler___block_invoke_2;
    block[3] = &unk_1E5140330;
    v19 = v14;
    v20 = v11;
    v21 = v25;
    dispatch_after(v17, v15, block);

  }
  _Block_object_dispose(v25, 8);

}

- (id)pxStory_enumerateStatesByWatchingChanges:()PXStory usingBlock:
{
  void (**v6)(id, void *, uint64_t, _BYTE *);
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  void (**v12)(id, void *, uint64_t, _BYTE *);
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  _BYTE v25[8];

  v6 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25[0] = 0;
  v6[2](v6, a1, a3, v25);
  if (*((_BYTE *)v23 + 24))
  {
    v7 = 0;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__170981;
    v20 = __Block_byref_object_dispose__170982;
    v21 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__PXObservable_PXStory__pxStory_enumerateStatesByWatchingChanges_usingBlock___block_invoke;
    v11[3] = &unk_1E5131470;
    v11[4] = a1;
    v13 = &v22;
    v15 = a3;
    v12 = v6;
    v14 = &v16;
    objc_msgSend(a1, "_pxStoryPPT_observeChangesUsingChangeHandler:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v17[5];
    v17[5] = v8;

    v7 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

  }
  _Block_object_dispose(&v22, 8);

  return v7;
}

- (_PXStoryObservation)_pxStoryPPT_observeChangesUsingChangeHandler:()PXStory
{
  id v4;
  _PXStoryObservation *v5;

  v4 = a3;
  v5 = -[_PXStoryObservation initWithObservable:changeHandler:]([_PXStoryObservation alloc], "initWithObservable:changeHandler:", a1, v4);

  return v5;
}

@end
