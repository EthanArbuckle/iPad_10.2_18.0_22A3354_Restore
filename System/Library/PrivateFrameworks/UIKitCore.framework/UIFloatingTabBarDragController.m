@implementation UIFloatingTabBarDragController

void __87___UIFloatingTabBarDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id location[7];

  if (!a2)
  {
    location[5] = v2;
    location[6] = v3;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "currentDragTab");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabDragController:hideDraggedTab:", v6, v7);

    objc_msgSend(*(id *)(a1 + 32), "currentDragTab");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pendingFavoriteOrder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v9);

    objc_msgSend(*(id *)(a1 + 32), "pendingExcludedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v9);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    objc_initWeak(location, *(id *)(a1 + 32));
    v12 = dispatch_time(0, 300000000);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87___UIFloatingTabBarDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
    v13[3] = &unk_1E16B3F40;
    objc_copyWeak(&v14, location);
    dispatch_after(v12, MEMORY[0x1E0C80D38], v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);

  }
}

void __87___UIFloatingTabBarDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[8])
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateFavoriteOrderAnimated:", 1);
    WeakRetained = v2;
  }

}

void __84___UIFloatingTabBarDragController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_storeWeak(WeakRetained + 4, 0);
    WeakRetained = v2;
  }

}

@end
