@implementation SBSystemActionCoachingHUDViewController

- (id)initWithRingerControl:(void *)a3 activityManager:(void *)a4 applicationController:(void *)a5 doNotDisturbStateMonitor:(void *)a6 flashlightActivityManager:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id *v17;
  id *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v30;

  v12 = a2;
  v29 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  v28 = v12;
  if (a1)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("ringerControl != ((void *)0)"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:].cold.1();
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0B1B280);
    }
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("activityManager != ((void *)0)"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:].cold.2();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0B1B2E8);
    }
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("applicationController != ((void *)0)"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:].cold.3();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0B1B350);
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("doNotDisturbStateMonitor != ((void *)0)"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:].cold.4();
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0B1B3B8);
    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("flashlightActivityManager != ((void *)0)"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:].cold.5();
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0B1B420);
    }
    v30.receiver = a1;
    v30.super_class = (Class)SBSystemActionCoachingHUDViewController;
    v17 = (id *)objc_msgSendSuper2(&v30, sel_initWithNibName_bundle_, 0, 0);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 129, a2);
      objc_storeStrong(v18 + 130, a3);
      objc_storeStrong(v18 + 131, a4);
      objc_storeStrong(v18 + 132, a5);
      objc_storeStrong(v18 + 133, a6);
      +[SBSystemActionDomain rootSettings](SBSystemActionDomain, "rootSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "coachingSettings");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v18[134];
      v18[134] = (id)v20;

      *((_BYTE *)v18 + 992) = 0;
      v18[128] = 0;
      v18[137] = 0;
      *((_BYTE *)v18 + 993) = 0;
      v18[138] = (id)1;
      objc_msgSend(v18, "setTransitioningDelegate:", v18);
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)setAction:(id *)a1
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a2;
  if (a1)
  {
    v5 = a1[126];
    if (v5 != v4)
    {
      v9 = v4;
      objc_msgSend(v5, "controlAction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBControlSystemAction removeObserver:]((uint64_t)v6, (uint64_t)a1);

      objc_msgSend(a1[135], "invalidate");
      v7 = a1[135];
      a1[135] = 0;

      objc_storeStrong(a1 + 126, a2);
      objc_msgSend(v9, "controlAction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBControlSystemAction addObserver:]((uint64_t)v8, a1);

      -[SBSystemActionCoachingHUDViewController _updateContentVisibilityAssertion]((uint64_t)a1);
      -[SBSystemActionCoachingHUDViewController _setNeedsUpdateCoachingLabelText](a1);
      v4 = v9;
    }
  }

}

- (void)_updateContentVisibilityAssertion
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1008), "controlAction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = *(void **)(a1 + 1080);
      if (*(_QWORD *)(a1 + 1024))
      {
        if (!v3)
        {
          v6 = v2;
          -[SBControlSystemAction acquireContentVisibilityAssertionForReason:]((uint64_t)v2, CFSTR("Coaching HUD"));
          v4 = objc_claimAutoreleasedReturnValue();
          v5 = *(void **)(a1 + 1080);
          *(_QWORD *)(a1 + 1080) = v4;
LABEL_8:

          v2 = v6;
        }
      }
      else if (v3)
      {
        v6 = v2;
        objc_msgSend(v3, "invalidate");
        v5 = *(void **)(a1 + 1080);
        *(_QWORD *)(a1 + 1080) = 0;
        goto LABEL_8;
      }
    }

  }
}

- (void)_setNeedsUpdateCoachingLabelText
{
  id v1;

  if (a1)
  {
    a1[993] = 1;
    objc_msgSend(a1, "viewIfLoaded");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setNeedsLayout");

  }
}

- (void)setSystemApertureFrames:(uint64_t)a1
{
  id v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    v4 = BSEqualArrays();
    v3 = v7;
    if ((v4 & 1) == 0)
    {
      v5 = objc_msgSend(v7, "copy");
      v6 = *(void **)(a1 + 1016);
      *(_QWORD *)(a1 + 1016) = v5;

      -[SBSystemActionCoachingHUDViewController _updateCoachingLabelOccluded](a1);
      v3 = v7;
    }
  }

}

- (void)_updateCoachingLabelOccluded
{
  id v2;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  int v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(id *)(a1 + 1016);
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "CGRectValue");
          v33.origin.x = v11;
          v33.origin.y = v12;
          v33.size.width = v13;
          v33.size.height = v14;
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = width;
          v29.size.height = height;
          v30 = CGRectUnion(v29, v33);
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
        }
        v8 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    if (CGRectIsNull(v31))
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend((id)a1, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(a1 + 1152);
      objc_msgSend(v17, "bounds");
      objc_msgSend(v17, "convertRect:toView:", v16);
      objc_msgSend(v16, "convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:");
      v34.origin.x = v18;
      v34.origin.y = v19;
      v34.size.width = v20;
      v34.size.height = v21;
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v15 = CGRectIntersectsRect(v32, v34);

    }
    if (*(unsigned __int8 *)(a1 + 994) != v15)
    {
      *(_BYTE *)(a1 + 994) = v15;
      if (objc_msgSend((id)a1, "isViewLoaded"))
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __71__SBSystemActionCoachingHUDViewController__updateCoachingLabelOccluded__block_invoke;
        v22[3] = &unk_1E8E9DED8;
        v22[4] = a1;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v22, 0.2);
      }
    }

  }
}

- (void)transitionToState:(int)a3 animated:(void *)a4 completion:
{
  id v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[6];

  v7 = a4;
  if (a1)
  {
    -[SBSystemActionCoachingHUDViewController _animationSettingsForTransitionFromState:toState:]((id *)a1, *(_QWORD *)(a1 + 1024), a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      v9 = 3;
    else
      v9 = 2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1000));
    v11 = *(_QWORD *)(a1 + 1024);
    *(_QWORD *)(a1 + 1024) = a2;
    ++*(_QWORD *)(a1 + 1096);
    -[SBSystemActionCoachingHUDViewController _updateCoachingLabelTextIfNeeded](a1);
    -[SBSystemActionCoachingHUDViewController _updateContentVisibilityAssertion](a1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "systemActionCoachingHUDViewController:didBeginTransitionToState:", a1, a2);
    if (a2 && !v11)
      -[SBSystemActionCoachingHUDViewController setIsAttached:](a1, 1);
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v17 = a2;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__SBSystemActionCoachingHUDViewController_transitionToState_animated_completion___block_invoke;
    v18[3] = &unk_1E8E9DE88;
    v18[4] = a1;
    v18[5] = a2;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__SBSystemActionCoachingHUDViewController_transitionToState_animated_completion___block_invoke_229;
    v14[3] = &unk_1E8EB6F38;
    v14[4] = a1;
    v15 = WeakRetained;
    v16 = v7;
    v13 = WeakRetained;
    objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", v8, v9, v18, v14);

  }
}

- (id)_animationSettingsForTransitionFromState:(uint64_t)a3 toState:
{
  id v3;

  if (a1)
  {
    if (a3 == 2)
    {
      objc_msgSend(a1[134], "expansionSettings");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 1)
    {
      v3 = a1[134];
      if (a2 == 2)
        objc_msgSend(v3, "contractionSettings");
      else
        objc_msgSend(v3, "presentationSettings");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
        return (id *)0;
      objc_msgSend(a1[134], "dismissalSettings");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)_updateCoachingLabelTextIfNeeded
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 993))
    {
      objc_msgSend((id)a1, "viewIfLoaded");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        if (*(_QWORD *)(a1 + 1024) || !*(_QWORD *)(a1 + 1096))
        {
          -[SBSystemActionCoachingHUDViewController _coachingLabelText]((id *)a1);
          v4 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 1152), "setText:", v4);
          *(_BYTE *)(a1 + 993) = 0;

        }
      }
    }
  }
}

- (void)setIsAttached:(uint64_t)a1
{
  id WeakRetained;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 996) != a2)
    {
      *(_BYTE *)(a1 + 996) = a2;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 968));
      objc_msgSend(WeakRetained, "updateAttachmentStateForHUDViewController:", a1);

    }
  }
}

void __81__SBSystemActionCoachingHUDViewController_transitionToState_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  id v17;

  -[SBSystemActionCoachingHUDViewController _layoutCoachingContentView](*(_QWORD *)(a1 + 32));
  -[SBSystemActionCoachingHUDViewController _layoutCoachingButton](*(_QWORD **)(a1 + 32));
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabelWrapperView](*(void **)(a1 + 32));
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabel](*(id **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v2 - 1) >= 2)
  {
    if (v2)
      return;
    v11 = 0.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setAlpha:", 0.0);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1128);
    objc_msgSend(*(id *)(v12 + 1112), "bounds");
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 0;
    objc_msgSend(v14, "setShadowOpacity:", v15);

    v16 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v16 + 994) && (unint64_t)(*(_QWORD *)(v16 + 1024) - 1) <= 1)
    {
      if (*(_BYTE *)(v16 + 992))
        v11 = 0.0;
      else
        v11 = 1.0;
    }
    objc_msgSend(*(id *)(v16 + 1144), "setAlpha:", v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = &unk_1E91CF8A8;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1120);
    objc_msgSend(*(id *)(v3 + 1072), "dimmingAlpha");
    objc_msgSend(v4, "setAlpha:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "coachingButtonShadowOpacity");
    *(float *)&v6 = v6;
    objc_msgSend(v5, "setShadowOpacity:", v6);

    v7 = *(_QWORD *)(a1 + 32);
    v8 = 0.0;
    if (!*(_BYTE *)(v7 + 994) && (unint64_t)(*(_QWORD *)(v7 + 1024) - 1) <= 1 && !*(_BYTE *)(v7 + 992))
      v8 = 1.0;
    objc_msgSend(*(id *)(v7 + 1144), "setAlpha:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = &unk_1E91CF8B8;
  }
  v17 = v9;
  objc_msgSend(v9, "setValue:forKeyPath:", v10, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (uint64_t)_layoutCoachingContentView
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 1112), "bounds");
    v2 = *(void **)(v1 + 1128);
    UIRectGetCenter();
    objc_msgSend(v2, "setCenter:");
    v3 = *(void **)(v1 + 1128);
    BSRectWithSize();
    return objc_msgSend(v3, "setBounds:");
  }
  return result;
}

- (_QWORD)_layoutCoachingButton
{
  _QWORD *v1;
  void *v2;
  double v3;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGRect v14;
  CGRect v15;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");

    v3 = -[SBSystemActionCoachingHUDViewController _ringerButtonFrame](v1);
    y = v14.origin.y;
    width = v14.size.width;
    height = v14.size.height;
    v14.origin.x = v3;
    CGRectGetHeight(v14);
    v15.origin.x = v3;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    CGRectGetMinY(v15);
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    -[SBSystemActionCoachingHUDViewController _xTranslationTransformForCurrentState]((uint64_t)v1, (uint64_t)&v11);
    v7 = (void *)v1[142];
    UIRectGetCenter();
    objc_msgSend(v7, "setCenter:");
    v8 = (void *)v1[142];
    BSRectWithSize();
    objc_msgSend(v8, "setBounds:");
    v9 = (void *)v1[142];
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    return (_QWORD *)objc_msgSend(v9, "setTransform:", v10);
  }
  return result;
}

- (void)_layoutCoachingLabelWrapperView
{
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  unint64_t v6;
  CGFloat v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CGAffineTransform v20;
  CGAffineTransform t2;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform t1;

  if (result)
  {
    v1 = (uint64_t)result;
    objc_msgSend(result, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");

    -[SBSystemActionCoachingHUDViewController _ringerButtonFrame]((void *)v1);
    v3 = -[SBSystemActionCoachingHUDViewController _coachingLabelWrapperViewSize]((void *)v1);
    if (v3 >= v4)
      v5 = v3;
    else
      v5 = v4;
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    memset(&v24, 0, sizeof(v24));
    v6 = *(_QWORD *)(v1 + 1024);
    v7 = 0.0;
    if (v6 <= 2)
      v7 = dbl_1D0E8AD28[v6];
    CGAffineTransformMakeScale(&v24, v7, v7);
    memset(&v23, 0, sizeof(v23));
    -[SBSystemActionCoachingHUDViewController _xTranslationTransformForCurrentState](v1, (uint64_t)&v23);
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v22.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v22.c = v8;
    *(_OWORD *)&v22.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&t1.a = *(_OWORD *)&v22.a;
    *(_OWORD *)&t1.c = v8;
    *(_OWORD *)&t1.tx = *(_OWORD *)&v22.tx;
    t2 = v24;
    CGAffineTransformConcat(&v22, &t1, &t2);
    t2 = v22;
    v20 = v23;
    CGAffineTransformConcat(&t1, &t2, &v20);
    *(_OWORD *)&v22.tx = *(_OWORD *)&t1.tx;
    UIRectGetCenter();
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)(v1 + 1144), "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anchorPoint");
    v15 = v14;
    v17 = v16;

    objc_msgSend(*(id *)(v1 + 1144), "setCenter:", v10 + (v15 + -0.5) * v5, v12 + (v17 + -0.5) * v5);
    v18 = *(void **)(v1 + 1144);
    BSRectWithSize();
    objc_msgSend(v18, "setBounds:");
    v19 = *(void **)(v1 + 1144);
    v24 = t1;
    return (void *)objc_msgSend(v19, "setTransform:", &v24);
  }
  return result;
}

- (void)_layoutCoachingLabel
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  __int128 v12;
  id v13;
  id v14;
  id v15;
  CGFloat tx;
  CGFloat ty;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;

  if (a1)
  {
    objc_msgSend(a1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");

    objc_msgSend(a1[143], "bounds");
    objc_msgSend(a1[144], "sizeThatFits:", -[SBSystemActionCoachingHUDViewController _coachingLabelWrapperViewSize](a1));
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    memset(&v24, 0, sizeof(v24));
    SBFTransformFromOrientationToOrientation();
    memset(&v23, 0, sizeof(v23));
    BSFloatRoundForScale();
    CGAffineTransformMakeTranslation(&v23, v11, 0.0);
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&t1.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t1.c = v12;
    *(_OWORD *)&t1.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    t2 = v24;
    CGAffineTransformConcat(&v20, &t1, &t2);
    v21 = *(_OWORD *)&v20.a;
    v22 = *(_OWORD *)&v20.c;
    t1 = v20;
    t2 = v23;
    CGAffineTransformConcat(&v20, &t1, &t2);
    v21 = *(_OWORD *)&v20.a;
    tx = v20.tx;
    ty = v20.ty;
    v24 = v20;
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    CGRectApplyAffineTransform(v25, &v24);
    UIRectGetCenter();
    SBUnintegralizedRectCenteredAboutPoint();
    BSPointRoundForScale();
    v13 = a1[144];
    UIRectGetCenter();
    objc_msgSend(v13, "setCenter:");
    v14 = a1[144];
    BSRectWithSize();
    objc_msgSend(v14, "setBounds:");
    v15 = a1[144];
    *(_OWORD *)&v24.a = *(_OWORD *)&v20.a;
    *(_OWORD *)&v24.c = *(_OWORD *)&v20.c;
    v24.tx = tx;
    v24.ty = ty;
    objc_msgSend(v15, "setTransform:", &v24);
    -[SBSystemActionCoachingHUDViewController _updateCoachingLabelOccluded]((uint64_t)a1);
  }
}

- (double)_coachingLabelWrapperViewAlpha
{
  double result;

  result = 0.0;
  if (a1 && !*(_BYTE *)(a1 + 994) && (unint64_t)(*(_QWORD *)(a1 + 1024) - 1) <= 1 && !*(_BYTE *)(a1 + 992))
    return 1.0;
  return result;
}

uint64_t __81__SBSystemActionCoachingHUDViewController_transitionToState_animated_completion___block_invoke_229(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1096) || (v3 = *(_QWORD *)(v2 + 1024), v3 != *(_QWORD *)(a1 + 56)))
  {
    v4 = 0;
  }
  else
  {
    if (!v3)
      -[SBSystemActionCoachingHUDViewController setIsAttached:](v2, 0);
    v4 = 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "systemActionCoachingHUDViewController:didEndTransitionToState:completed:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v4);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *contentView;
  UIView *v6;
  UIView *dimmingView;
  id v8;
  UIView *v9;
  UIView *coachingContentView;
  UIView *v11;
  UIView *coachingButton;
  UIView *v13;
  UIView *coachingLabelWrapperView;
  UILabel *v15;
  UILabel *coachingLabel;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBSystemActionCoachingHUDViewController;
  -[SBSystemActionCoachingHUDViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[SBOrientationTransformWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCounterTransformView:", 1);
  objc_msgSend(v3, "bs_setHitTestingDisabled:", 1);
  -[SBSystemActionCoachingHUDViewController _makeContentView](self);
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v4;

  objc_msgSend(v3, "addContentView:", self->_contentView);
  -[SBSystemActionCoachingHUDViewController _makeDimmingView]((uint64_t)self);
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  dimmingView = self->_dimmingView;
  self->_dimmingView = v6;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_dimmingView);
  v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[UIView bounds](self->_contentView, "bounds");
  v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
  coachingContentView = self->_coachingContentView;
  self->_coachingContentView = v9;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_coachingContentView);
  -[SBSystemActionCoachingHUDViewController _makeCoachingButton]((uint64_t)self);
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  coachingButton = self->_coachingButton;
  self->_coachingButton = v11;

  -[UIView addSubview:](self->_coachingContentView, "addSubview:", self->_coachingButton);
  -[SBSystemActionCoachingHUDViewController _makeCoachingLabelWrapperView]((uint64_t)self);
  v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  coachingLabelWrapperView = self->_coachingLabelWrapperView;
  self->_coachingLabelWrapperView = v13;

  -[UIView addSubview:](self->_coachingContentView, "addSubview:", self->_coachingLabelWrapperView);
  -[SBSystemActionCoachingHUDViewController _makeCoachingLabel]((uint64_t)self);
  v15 = (UILabel *)objc_claimAutoreleasedReturnValue();
  coachingLabel = self->_coachingLabel;
  self->_coachingLabel = v15;

  -[UIView addSubview:](self->_coachingLabelWrapperView, "addSubview:", self->_coachingLabel);
}

- (id)_makeContentView
{
  id v1;

  if (a1)
  {
    v1 = objc_alloc(MEMORY[0x1E0CEABB0]);
    a1 = (void *)objc_msgSend(v1, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  return a1;
}

- (id)_makeDimmingView
{
  id v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v2 = (void *)objc_msgSend(v1, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v2, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_makeCoachingButton
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  double v8;

  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("system-action-coaching-button"));
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

    objc_msgSend(v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    v6 = 2.5;
    if (!*(_BYTE *)(a1 + 995))
      v6 = 5.0;
    objc_msgSend(v5, "setCornerRadius:", v6);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    LODWORD(v8) = 0;
    objc_msgSend(v5, "setShadowOpacity:", v8);
    objc_msgSend(v5, "setShadowPathIsBounds:", 1);
    objc_msgSend(*(id *)(a1 + 1072), "coachingButtonShadowRadius");
    objc_msgSend(v5, "setShadowRadius:");

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_makeCoachingLabelWrapperView
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  v5 = 0.0;
  if (!*(_BYTE *)(a1 + 994) && (unint64_t)(*(_QWORD *)(a1 + 1024) - 1) <= 1 && !*(_BYTE *)(a1 + 992))
    v5 = 1.0;
  objc_msgSend(v3, "setAlpha:", v5);
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnchorPoint:", 0.0, 0.5);
  -[SBSystemActionCoachingHUDViewController _makeGaussianBlurFilter](a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", v8);

  return v4;
}

- (id)_makeCoachingLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;

  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0CEA700]);
    v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("system-action-coaching-label"));
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 19.0, *MEMORY[0x1E0CEB5F0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFont:", v4);

    objc_msgSend(v3, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v5);

    objc_msgSend(v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v6, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(*(id *)(a1 + 1072), "coachingLabelShadowOpacity");
    *(float *)&v8 = v8;
    objc_msgSend(v6, "setShadowOpacity:", v8);
    objc_msgSend(*(id *)(a1 + 1072), "coachingLabelShadowRadius");
    objc_msgSend(v6, "setShadowRadius:");

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSystemActionCoachingHUDViewController;
  -[SBSystemActionCoachingHUDViewController viewIsAppearing:](&v8, sel_viewIsAppearing_, a3);
  -[SBOrientationTransformWrapperViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  objc_msgSend(v4, "setContainerOrientation:", v6);
  objc_msgSend(v4, "setContentOrientation:", 1);
  if (self && self->_coachingLabelOrientation != v6)
  {
    self->_coachingLabelOrientation = v6;
    if ((unint64_t)(v6 - 3) < 2)
      v7 = 1;
    else
      v7 = 4;
    -[UILabel setTextAlignment:](self->_coachingLabel, "setTextAlignment:", v7);
  }
  -[SBSystemActionCoachingHUDViewController _updateLiveRenderingAssertionIfNeeded]((id *)&self->super.super.super.super.isa);
  -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)self, 0, 0, 0);

}

- (uint64_t)setCoachingLabelOrientation:(uint64_t)result
{
  uint64_t v2;

  if (result && *(_QWORD *)(result + 1104) != a2)
  {
    *(_QWORD *)(result + 1104) = a2;
    if ((unint64_t)(a2 - 3) < 2)
      v2 = 1;
    else
      v2 = 4;
    return objc_msgSend(*(id *)(result + 1152), "setTextAlignment:", v2);
  }
  return result;
}

- (void)_updateLiveRenderingAssertionIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  char v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  char v17;
  id v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = objc_msgSend(a1, "_appearState") != 0;
    else
      v5 = 0;
    v6 = a1[136];
    if (v6)
    {
      v7 = objc_msgSend(a1[136], "isAcquired");
      if (!v5)
        goto LABEL_11;
    }
    else
    {
      v7 = 0;
      if (!v5)
        goto LABEL_11;
    }
    if ((v7 & 1) == 0)
    {
      objc_msgSend(a1[136], "invalidate");
      v8 = (void *)MEMORY[0x1E0D00F48];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00FB0], "requestLiveUpdatingForScene:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerateForScene:", v4, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v12;
      objc_msgSend(MEMORY[0x1E0D00FC8], "ignoreWhenBacklightInactivates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "acquireWithExplanation:observer:attributes:", v10, 0, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = a1[136];
      a1[136] = (id)v15;

LABEL_16:
      return;
    }
LABEL_11:
    if (v6)
      v17 = v5;
    else
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      objc_msgSend(a1[136], "invalidate");
      v18 = a1[136];
      a1[136] = 0;

    }
    goto LABEL_16;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemActionCoachingHUDViewController;
  -[SBSystemActionCoachingHUDViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBSystemActionCoachingHUDViewController _updateLiveRenderingAssertionIfNeeded]((id *)&self->super.super.super.super.isa);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionCoachingHUDViewController;
  -[SBSystemActionCoachingHUDViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBSystemActionCoachingHUDViewController _updateCoachingLabelTextIfNeeded]((uint64_t)self);
  -[SBSystemActionCoachingHUDViewController _layoutDimmingView]((uint64_t)self);
  -[SBSystemActionCoachingHUDViewController _layoutCoachingContentView]((uint64_t)self);
  -[SBSystemActionCoachingHUDViewController _layoutCoachingButton](self);
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabelWrapperView](self);
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabel]((id *)&self->super.super.super.super.isa);
}

- (uint64_t)_layoutDimmingView
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 1112), "bounds");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v10 = *(void **)(v1 + 1120);
    UIRectGetCenter();
    objc_msgSend(v10, "setCenter:");
    return objc_msgSend(*(id *)(v1 + 1120), "setBounds:", v3, v5, v7, v9);
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[7];
  _QWORD v12[6];
  _QWORD v13[5];
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)SBSystemActionCoachingHUDViewController;
  v7 = a4;
  -[SBSystemActionCoachingHUDViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  self->_rotating = 1;
  SBFWindowForViewControllerTransition();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_toWindowOrientation");

  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E8E9DED8;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v13, 0.2);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E8EB6F60;
  v12[4] = self;
  v12[5] = v9;
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v11[3] = &unk_1E8EAC0A0;
  v11[4] = self;
  v11[5] = v9;
  v11[6] = 0x3FC999999999999ALL;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v12, v11);

}

uint64_t __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 0.0;
  if (!*(_BYTE *)(v1 + 994) && (unint64_t)(*(_QWORD *)(v1 + 1024) - 1) <= 1 && !*(_BYTE *)(v1 + 992))
    v2 = 1.0;
  return objc_msgSend(*(id *)(v1 + 1144), "setAlpha:", v2);
}

void __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContainerOrientation:", *(_QWORD *)(a1 + 40));

}

uint64_t __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(double *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  _QWORD v7[5];

  *(_BYTE *)(*((_QWORD *)a1 + 4) + 992) = 0;
  v2 = *((_QWORD *)a1 + 4);
  if (v2)
  {
    v3 = *((_QWORD *)a1 + 5);
    if (*(_QWORD *)(v2 + 1104) != v3)
    {
      *(_QWORD *)(v2 + 1104) = v3;
      if ((unint64_t)(v3 - 3) < 2)
        v4 = 1;
      else
        v4 = 4;
      objc_msgSend(*(id *)(v2 + 1152), "setTextAlignment:", v4);
      v2 = *((_QWORD *)a1 + 4);
    }
  }
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabel]((id *)v2);
  v5 = a1[6];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v7[3] = &unk_1E8E9DED8;
  *(double *)&v7[4] = a1[4];
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v7, v5);
}

uint64_t __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 0.0;
  if (!*(_BYTE *)(v1 + 994) && (unint64_t)(*(_QWORD *)(v1 + 1024) - 1) <= 1 && !*(_BYTE *)(v1 + 992))
    v2 = 1.0;
  return objc_msgSend(*(id *)(v1 + 1144), "setAlpha:", v2);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)physicalButtonSceneTargets
{
  return 0;
}

- (BOOL)definesAnimatedDismissal
{
  return 1;
}

- (void)dismissAnimatedWithCompletion:(id)a3
{
  -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)self, 0, 1, a3);
}

- (void)setAttachmentDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_attachmentDelegate, obj);
    -[SBSystemActionCoachingHUDViewController setShouldLayoutForButtonHints:]((uint64_t)self, obj != 0);
  }

}

- (void)setShouldLayoutForButtonHints:(uint64_t)a1
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 995) != a2)
    {
      *(_BYTE *)(a1 + 995) = a2;
      v3 = *(void **)(a1 + 1136);
      if (v3)
      {
        objc_msgSend(v3, "layer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v4;
        v5 = 2.5;
        if (!*(_BYTE *)(a1 + 995))
          v5 = 5.0;
        objc_msgSend(v4, "setCornerRadius:", v5);

      }
    }
  }
}

- (int64_t)triggerButton
{
  return 8;
}

- (unint64_t)attachmentIgnoredOrientations
{
  return 0;
}

- (BOOL)isHUDAttached
{
  return self->_isAttached;
}

- (void)setPositionOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  _QWORD v12[5];

  y = a3.y;
  x = a3.x;
  -[SBOrientationTransformWrapperViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containerOrientation");

  v8 = v7 - 3;
  if (v7 == 2)
    v9 = -x;
  else
    v9 = x;
  if (v8 >= 2)
    v10 = y;
  else
    v10 = x;
  if (v8 < 2)
    v9 = y;
  if (self->_positionOffset.x != v9 || self->_positionOffset.y != v10)
  {
    self->_positionOffset.x = v9;
    self->_positionOffset.y = v10;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__SBSystemActionCoachingHUDViewController_setPositionOffset___block_invoke;
    v12[3] = &unk_1E8E9DED8;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v12);
  }
}

uint64_t __61__SBSystemActionCoachingHUDViewController_setPositionOffset___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  CGAffineTransform v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1128);
  CGAffineTransformMakeTranslation(&v4, *(CGFloat *)(v1 + 976), *(CGFloat *)(v1 + 984));
  return objc_msgSend(v2, "setTransform:", &v4);
}

- (void)controlSystemAction:(id)a3 propertiesDidChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[SBHomeScreenConfigurationServer connections]((uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlSystemAction properties]((uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenConfigurationServer connections]((uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = BSEqualStrings();

  if ((v10 & 1) == 0)
    -[SBSystemActionCoachingHUDViewController _setNeedsUpdateCoachingLabelText](self);
}

- (SBUIAnimationPropertyAnimator)_makeViewControllerTransitionAnimationController
{
  if (a1)
    a1 = -[SBUIAnimationPropertyAnimator initWithPropertyAnimatorGenerator:]([SBUIAnimationPropertyAnimator alloc], "initWithPropertyAnimatorGenerator:", &__block_literal_global_259);
  return a1;
}

- (void)_updateCoachingButtonLayer:(uint64_t)a1
{
  id v3;
  double v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v4 = 2.5;
    if (!*(_BYTE *)(a1 + 995))
      v4 = 5.0;
    v5 = v3;
    objc_msgSend(v3, "setCornerRadius:", v4);
    v3 = v5;
  }

}

- (id)_makeGaussianBlurFilter
{
  void *v1;
  uint64_t v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v1, "setValue:forKey:", CFSTR("default"), *MEMORY[0x1E0CD2D88]);
    objc_msgSend(v1, "setValue:forKey:", CFSTR("default"), *MEMORY[0x1E0CD2D60]);
    objc_msgSend(v1, "setValue:forKey:", &unk_1E91CF8A8, *MEMORY[0x1E0CD2D90]);
    v2 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v1, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2D70]);
    objc_msgSend(v1, "setValue:forKey:", v2, *MEMORY[0x1E0CD2D58]);
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

id __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_2;
  v11[3] = &unk_1E8E9DED8;
  v5 = v2;
  v12 = v5;
  v6 = (void *)objc_msgSend(v3, "initWithDuration:curve:animations:", 3, v11, 0.001);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_3;
  v9[3] = &unk_1E8EA2880;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "addCompletion:", v9);

  return v6;
}

void __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

  }
  objc_msgSend(v2, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (__CFString)_coachingLabelText
{
  __CFString *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = (__CFString *)a1;
  if (a1)
  {
    objc_msgSend(a1[126], "configuredAction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sectionIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("SilentMode")))
    {
      -[SBSystemActionCoachingHUDViewController _silentModeCoachingLabelText]((uint64_t)v1);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Focus")))
    {
      -[SBSystemActionCoachingHUDViewController _focusCoachingLabelText]((uint64_t)v1);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("Camera")))
        goto LABEL_7;
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceMemos")))
      {
        -[SBSystemActionCoachingHUDViewController _voiceMemosCoachingLabelText]((uint64_t)v1);
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("Flashlight")))
      {
        -[SBSystemActionCoachingHUDViewController _flashlightCoachingLabelText]((uint64_t)v1);
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("Accessibility")))
      {
        -[SBSystemActionCoachingHUDViewController _accessibilityCoachingLabelTextForConfiguredAction:](v1, v2);
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("Translate")))
      {
        -[SBSystemActionCoachingHUDViewController _translateCoachingLabelText]((uint64_t)v1);
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("Magnifier")))
      {
LABEL_7:
        -[SBSystemActionCoachingHUDViewController _cameraCoachingLabelText]((uint64_t)v1);
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MusicRecognition")))
      {
        -[SBSystemActionCoachingHUDViewController _musicRecognitionCoachingLabelText]((uint64_t)v1);
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("Controls")))
        {
          objc_msgSend(v1[31].data, "controlAction");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSystemActionCoachingHUDViewController _controlCoachingLabelTextForAction:](v1, v5);
          v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_24:
          return v1;
        }
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Shortcuts")))
        {
          v1 = &stru_1E8EC7EC0;
          goto LABEL_24;
        }
        -[SBSystemActionCoachingHUDViewController _shortcutCoachingLabelTextForConfiguredAction:](v1, v2);
        v4 = objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_23:
    v1 = (__CFString *)v4;
    goto LABEL_24;
  }
  return v1;
}

- (double)_xTranslationTransformForCurrentState
{
  unint64_t v2;
  double v3;
  double result;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 1024);
    if (*(_BYTE *)(a1 + 995))
    {
      v3 = 0.0;
      if (v2 == 2)
        v3 = 2.0;
      if (!v2)
        v3 = -13.0;
    }
    else
    {
      v3 = 0.0;
      if (v2 <= 2)
        v3 = dbl_1D0E8AD40[v2];
    }
    CGAffineTransformMakeTranslation((CGAffineTransform *)a2, v3, 0.0);
  }
  else
  {
    result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  return result;
}

- (double)_ringerButtonFrame
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (!a1)
    return 0.0;
  +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel](SBButtonBezelGeometryInfo, "buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonHWRectForButton:inView:", 8, v3);
  v5 = v4;

  return v5;
}

- (double)_coachingLabelWrapperViewSize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double result;
  CGRect v7;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");

  objc_msgSend(a1, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interfaceOrientation");

  objc_msgSend(a1, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");

  v7.origin.x = -[SBSystemActionCoachingHUDViewController _ringerButtonFrame](a1);
  CGRectGetMidY(v7);
  BSFloatRoundForScale();
  return result;
}

- (uint64_t)systemApertureFrames
{
  if (result)
    return *(_QWORD *)(result + 1016);
  return result;
}

uint64_t __71__SBSystemActionCoachingHUDViewController__updateCoachingLabelOccluded__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 0.0;
  if (!*(_BYTE *)(v1 + 994) && (unint64_t)(*(_QWORD *)(v1 + 1024) - 1) <= 1 && !*(_BYTE *)(v1 + 992))
    v2 = 1.0;
  return objc_msgSend(*(id *)(v1 + 1144), "setAlpha:", v2);
}

- (id)_silentModeCoachingLabelText
{
  int v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  if (a1)
  {
    v1 = -[SBRingerControl isRingerMuted](*(_QWORD *)(a1 + 1032));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v1)
      v4 = CFSTR("SYSTEM_ACTION_COACHING_RING");
    else
      v4 = CFSTR("SYSTEM_ACTION_COACHING_SILENT");
    objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_focusCoachingLabelText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1008), "configuredAction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sb_configuredIntentAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAACD0]))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_SHOW_FOCUS_LIST"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 1056), "state");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeModeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isActive"))
        v8 = v7 == 0;
      else
        v8 = 1;
      if (v8 || !objc_msgSend(v4, "isEqualToString:", v7))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("SYSTEM_ACTION_COACHING_TURN_ON");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("SYSTEM_ACTION_COACHING_TURN_OFF");
      }
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_cameraCoachingLabelText
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_OPEN"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_voiceMemosCoachingLabelText
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 1040), "activities", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v30;
LABEL_4:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v4)
        objc_enumerationMutation(v1);
      v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v5);
      objc_msgSend(v6, "descriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "platterTargetBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.VoiceMemos"));

      if (v9)
      {
        objc_msgSend(v6, "contentUpdate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "content");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          break;
      }
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v3)
          goto LABEL_4;
        goto LABEL_11;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = v13;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    objc_msgSend(v17, "objectForKey:", CFSTR("isRecording"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    v20 = v18;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v22 = v21;

    v23 = objc_msgSend(v22, "BOOLValue");
    if ((v23 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = CFSTR("SYSTEM_ACTION_COACHING_STOP");
      goto LABEL_25;
    }
  }
  else
  {
LABEL_11:

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v26 = CFSTR("SYSTEM_ACTION_COACHING_RECORD");
LABEL_25:
  objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_flashlightCoachingLabelText
{
  _BOOL4 v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  if (a1)
  {
    v1 = -[SBFlashlightActivityManager isFlashlightOn](*(_QWORD *)(a1 + 1064));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v1)
      v4 = CFSTR("SYSTEM_ACTION_COACHING_TURN_OFF");
    else
      v4 = CFSTR("SYSTEM_ACTION_COACHING_TURN_ON");
    objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_accessibilityCoachingLabelTextForConfiguredAction:(_QWORD *)a1
{
  id v2;
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
  const __CFString *v14;
  void *v15;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend(a2, "sb_configuredIntentAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFConfiguredStaccatoIntentAction sb_accessibilityTripleClickState](v4);
  if (v5 == (void *)2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v14 = CFSTR("SYSTEM_ACTION_COACHING_TURN_ON");
    goto LABEL_9;
  }
  if (v5 == (void *)1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v14 = CFSTR("SYSTEM_ACTION_COACHING_TURN_OFF");
LABEL_9:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  if (!v5)
  {
    objc_msgSend(v4, "templateParameterValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4998]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_ACCESSIBILITY_FORMAT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SBSystemActionCoachingHUDViewController _canFitTextInCoachingLabel:](a1, v12))
    {
      v2 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_ACCESSIBILITY_FALLBACK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
LABEL_13:

  return v2;
}

- (id)_translateCoachingLabelText
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_TRANSLATE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_musicRecognitionCoachingLabelText
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_MUSIC_RECOGNITION"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_controlCoachingLabelTextForAction:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_19;
  }
  -[SBControlSystemAction properties]((uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenConfigurationServer connections]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)v5);
  if (v6)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v4, "configuredAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "associatedBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v10, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v11, "localizedShortName");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v14;

    v8 = 0;
  }
  if (!objc_msgSend(v6, "length"))
    goto LABEL_17;
  if (v8 == 1)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("SYSTEM_ACTION_COACHING_CONTROL_VERB_FORMAT");
    goto LABEL_13;
  }
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("SYSTEM_ACTION_COACHING_CONTROL_DEFAULT_FORMAT");
LABEL_13:
    objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v20 = 0;
LABEL_15:
  if ((-[SBSystemActionCoachingHUDViewController _canFitTextInCoachingLabel:](a1, v20) & 1) == 0)
  {

LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_CONTROL_FALLBACK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_19:

  return v20;
}

- (_QWORD)_shortcutCoachingLabelTextForConfiguredAction:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("is.workflow.actions.openapp"));

    if (v6)
    {
      v7 = (void *)a1[131];
      objc_msgSend(v4, "associatedBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationWithBundleIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_OPEN_APP_FORMAT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", v12, v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 && -[SBSystemActionCoachingHUDViewController _canFitTextInCoachingLabel:](a1, v14))
        {
          v15 = v14;
          v14 = v15;
LABEL_10:
          a1 = v15;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_OPEN_APP_FALLBACK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_SHORTCUT_FORMAT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18, v19);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (-[SBSystemActionCoachingHUDViewController _canFitTextInCoachingLabel:](a1, v14))
    {
      v14 = v14;
      a1 = v14;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ACTION_COACHING_SHORTCUT_FALLBACK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_15:

  return a1;
}

- (void)_canFitTextInCoachingLabel:(_QWORD *)a1
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v2 = a1;
  v9[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = *MEMORY[0x1E0CEA098];
    v3 = (void *)a1[144];
    v4 = a2;
    objc_msgSend(v3, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 3, v6, 0, 1.79769313e308, 1.79769313e308);
    -[SBSystemActionCoachingHUDViewController _coachingLabelWrapperViewSize](v2);
    if (BSFloatLessThanOrEqualToFloat())
      v2 = (void *)BSFloatLessThanOrEqualToFloat();
    else
      v2 = 0;

  }
  return v2;
}

- (SBHUDAttachmentDelegate)attachmentDelegate
{
  return (SBHUDAttachmentDelegate *)objc_loadWeakRetained((id *)&self->_attachmentDelegate);
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 125);
  return WeakRetained;
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 125, a2);
  return result;
}

- (uint64_t)action
{
  if (result)
    return *(_QWORD *)(result + 1008);
  return result;
}

- (uint64_t)state
{
  if (result)
    return *(_QWORD *)(result + 1024);
  return result;
}

- (uint64_t)ringerControl
{
  if (result)
    return *(_QWORD *)(result + 1032);
  return result;
}

- (uint64_t)activityManager
{
  if (result)
    return *(_QWORD *)(result + 1040);
  return result;
}

- (uint64_t)applicationController
{
  if (result)
    return *(_QWORD *)(result + 1048);
  return result;
}

- (uint64_t)doNotDisturbStateMonitor
{
  if (result)
    return *(_QWORD *)(result + 1056);
  return result;
}

- (uint64_t)flashlightActivityManager
{
  if (result)
    return *(_QWORD *)(result + 1064);
  return result;
}

- (uint64_t)settings
{
  if (result)
    return *(_QWORD *)(result + 1072);
  return result;
}

- (uint64_t)contentVisibilityAssertion
{
  if (result)
    return *(_QWORD *)(result + 1080);
  return result;
}

- (uint64_t)liveRenderingAssertion
{
  if (result)
    return *(_QWORD *)(result + 1088);
  return result;
}

- (BOOL)isRotating
{
  if (result)
    return *(_BYTE *)(result + 992) != 0;
  return result;
}

- (uint64_t)stateTransitionAnimationCount
{
  if (result)
    return *(_QWORD *)(result + 1096);
  return result;
}

- (BOOL)coachingLabelTextNeedsUpdate
{
  if (result)
    return *(_BYTE *)(result + 993) != 0;
  return result;
}

- (uint64_t)coachingLabelOrientation
{
  if (result)
    return *(_QWORD *)(result + 1104);
  return result;
}

- (BOOL)isCoachingLabelOccluded
{
  if (result)
    return *(_BYTE *)(result + 994) != 0;
  return result;
}

- (uint64_t)contentView
{
  if (result)
    return *(_QWORD *)(result + 1112);
  return result;
}

- (uint64_t)dimmingView
{
  if (result)
    return *(_QWORD *)(result + 1120);
  return result;
}

- (uint64_t)coachingContentView
{
  if (result)
    return *(_QWORD *)(result + 1128);
  return result;
}

- (uint64_t)coachingButton
{
  if (result)
    return *(_QWORD *)(result + 1136);
  return result;
}

- (uint64_t)coachingLabelWrapperView
{
  if (result)
    return *(_QWORD *)(result + 1144);
  return result;
}

- (uint64_t)coachingLabel
{
  if (result)
    return *(_QWORD *)(result + 1152);
  return result;
}

- (BOOL)shouldLayoutForButtonHints
{
  if (result)
    return *(_BYTE *)(result + 995) != 0;
  return result;
}

- (BOOL)isAttached
{
  if (result)
    return *(_BYTE *)(result + 996) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingLabel, 0);
  objc_storeStrong((id *)&self->_coachingLabelWrapperView, 0);
  objc_storeStrong((id *)&self->_coachingButton, 0);
  objc_storeStrong((id *)&self->_coachingContentView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_contentVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_flashlightActivityManager, 0);
  objc_storeStrong((id *)&self->_doNotDisturbStateMonitor, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_ringerControl, 0);
  objc_storeStrong((id *)&self->_systemApertureFrames, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_attachmentDelegate);
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
