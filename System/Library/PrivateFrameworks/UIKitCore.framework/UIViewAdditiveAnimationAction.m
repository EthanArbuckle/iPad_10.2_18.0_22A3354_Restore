@implementation UIViewAdditiveAnimationAction

void __67___UIViewAdditiveAnimationAction_runActionForKey_object_arguments___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v36, "fromValue");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16 = *(void **)(a1 + 32);
  objc_msgSend(v36, "keyPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKeyPath:", v17);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 40), "animationObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setOriginalToValue:forKey:inLayer:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
LABEL_4:
  objc_msgSend(v36, "fromValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CA_addValue:multipliedBy:", v7, 0xFFFFFFFFLL);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "setAdditive:", 1);
  v35 = (void *)v12;
  objc_msgSend(v36, "setFromValue:", v12);
  objc_msgSend(v7, "CA_addValue:multipliedBy:", v7, 0xFFFFFFFFLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setToValue:", v13);

  objc_msgSend(*(id *)(a1 + 40), "animationObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = 0;
  }
  else
  {
    objc_getAssociatedObject(*(id *)(a1 + 32), &unk_1EDDCA601);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", *(_QWORD *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFromValue:", v9);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(v15, "setToValue:", v7);

  }
  v19 = *(void **)(a1 + 32);
  objc_msgSend(v36, "keyPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UniqueAnimationKeyForLayer(v19, v20, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "keyPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v21 == v22)
  {
    v23 = (void *)v9;
    objc_msgSend(v36, "keyPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingString:", v8);
    v25 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v25;
  }
  else
  {
    v23 = (void *)v9;
  }
  objc_msgSend(*(id *)(a1 + 40), "animationObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "_isTrackingEnabled");

    if (v29)
      objc_msgSend(v36, "setRemovedOnCompletion:", 0);
  }
  v30 = *(id *)(a1 + 32);
  if (+[UIView _shouldTrackActionWithAnimator:](UIView, "_shouldTrackActionWithAnimator:", v36))
  {
    objc_msgSend(v36, "keyPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIViewPropertyAnimator _trackAdditiveAnimationWithAnimator:nonAdditiveAnimation:withAnimationKey:forKeyPath:forLayer:](UIViewPropertyAnimator, "_trackAdditiveAnimationWithAnimator:nonAdditiveAnimation:withAnimationKey:forKeyPath:forLayer:", v36, v15, v21, v31, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "_setOriginalToValue:forKey:inLayer:", v7, *(_QWORD *)(a1 + 48), v30);
  }
  objc_msgSend(v30, "addAnimation:forKey:", v36, v21);
  if (+[UIView _isAnimationTracking](UIView, "_isAnimationTracking"))
  {
    v33 = (void *)__currentViewAnimationState;
    objc_msgSend(v36, "keyPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_trackAnimation:nonAdditiveAnimation:withAnimationKey:forKeyPath:inLayer:", v36, v15, v21, v34, v30);

  }
}

void __67___UIViewAdditiveAnimationAction_runActionForKey_object_arguments___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "animationObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_explicitAnimationUpdateForProperty:forView:withValue:", v7, v8, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "animationObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "_newAnimationUpdateForProperty:implicit:additive:", *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 56));

  }
  objc_msgSend(v4, "fromValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromValue:", v11);

  objc_msgSend(v9, "setToValue:", v16);
  objc_msgSend(v4, "duration");
  v13 = v12;

  objc_msgSend(v9, "setDuration:", v13);
  objc_msgSend(*(id *)(a1 + 32), "convertTime:fromLayer:", 0, CACurrentMediaTime());
  objc_msgSend(v9, "setStartTime:");
  objc_msgSend(*(id *)(a1 + 40), "animationObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_notePropertyAnimationUpdate:forView:", v9, v15);

}

@end
