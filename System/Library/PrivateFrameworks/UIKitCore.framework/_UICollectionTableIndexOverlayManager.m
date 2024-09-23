@implementation _UICollectionTableIndexOverlayManager

- (void)hostDidMoveToWindow:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v5 = WeakRetained;
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "_screen");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "_userInterfaceIdiom");

        if (v7 == 3)
        {
          -[_UICollectionTableIndexOverlayManager _configureIndexOverlayIndicatorViewIfNecessary](a1);
          -[_UICollectionTableIndexOverlayManager _configureIndexOverlaySelectionViewIfNecessary](a1);
        }
        else
        {
          -[_UICollectionTableIndexOverlayManager tearDown](a1);
        }
      }

    }
    else
    {
      -[_UICollectionTableIndexOverlayManager tearDown](a1);
    }
    v3 = v8;
  }

}

- (id)initWithHost:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UICollectionTableIndexOverlayManager;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (void)tearDown
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "removeFromSuperview");
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    objc_msgSend(*(id *)(a1 + 24), "removeFromSuperview");
    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

- (void)_configureIndexOverlayIndicatorViewIfNecessary
{
  id WeakRetained;
  _UICollectionTableIndexOverlayIndicatorView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      if (!*(_QWORD *)(a1 + 16))
      {
        v3 = -[_UICollectionTableIndexOverlayIndicatorView initWithHost:]([_UICollectionTableIndexOverlayIndicatorView alloc], "initWithHost:", WeakRetained);
        v4 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v3;

      }
      objc_msgSend(v7, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      objc_msgSend(*(id *)(a1 + 16), "setFrame:");

      objc_msgSend(*(id *)(a1 + 16), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(a1 + 16), "setHidden:", 1);
      objc_msgSend(*(id *)(a1 + 16), "setAutoresizingMask:", 18);
      objc_msgSend(v7, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", *(_QWORD *)(a1 + 16));

      WeakRetained = v7;
    }

  }
}

- (void)_configureIndexOverlaySelectionViewIfNecessary
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _UICollectionTableIndexOverlaySelectionView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      v11 = WeakRetained;
      objc_msgSend(WeakRetained, "window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_screen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_capabilityForKey:", CFSTR("UIScreenCapabilityTouchLevelsKey"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");

      WeakRetained = v11;
      if (v6 != 2)
      {
        if (!*(_QWORD *)(a1 + 24))
        {
          v7 = -[_UICollectionTableIndexOverlaySelectionView initWithHost:]([_UICollectionTableIndexOverlaySelectionView alloc], "initWithHost:", v11);
          v8 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v7;

        }
        objc_msgSend(v11, "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bounds");
        objc_msgSend(*(id *)(a1 + 24), "setFrame:");

        objc_msgSend(*(id *)(a1 + 24), "setAlpha:", 0.0);
        objc_msgSend(*(id *)(a1 + 24), "setHidden:", 1);
        objc_msgSend(*(id *)(a1 + 24), "setAutoresizingMask:", 18);
        objc_msgSend(v11, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", *(_QWORD *)(a1 + 24));

        WeakRetained = v11;
      }
    }

  }
}

- (void)transitionIndexOverlayIndicatorViewToVisible:(int)a3 shouldFadeBackToInvisible:
{
  double v6;
  void *v7;
  _QWORD v8[5];
  char v9;
  _QWORD v10[5];
  char v11;

  if (a1 && ((((*(_BYTE *)(a1 + 48) & 1) == 0) ^ a2) & 1) == 0)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 16), "setHidden:", 0);
      v6 = 0.15;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v7 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      v6 = 0.25;
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __112___UICollectionTableIndexOverlayManager_transitionIndexOverlayIndicatorViewToVisible_shouldFadeBackToInvisible___block_invoke;
    v10[3] = &unk_1E16B1B78;
    v10[4] = a1;
    v11 = a2;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __112___UICollectionTableIndexOverlayManager_transitionIndexOverlayIndicatorViewToVisible_shouldFadeBackToInvisible___block_invoke_2;
    v8[3] = &unk_1E16B7F38;
    v9 = a2;
    v8[4] = a1;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v10, v8, v6, 0.0);
    if (a2)
    {
      *(_BYTE *)(a1 + 48) |= 1u;
      if (a3)
        -[_UICollectionTableIndexOverlayManager _hideIndicatorAfterDelay:]((id)a1, 2.0);
    }
  }
}

- (void)_hideIndicatorAfterDelay:(id)val
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v4 = (void *)MEMORY[0x1E0C99E88];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66___UICollectionTableIndexOverlayManager__hideIndicatorAfterDelay___block_invoke;
    v7[3] = &unk_1E16B26E0;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)val + 4);
    *((_QWORD *)val + 4) = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)setIndexOverlayIndicatorViewText:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;

  if (a1)
  {
    v5 = a2;
    v3 = objc_msgSend(v5, "copy");
    v4 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v3;

    objc_msgSend(*(id *)(a1 + 16), "setCurrentText:", v5);
  }
}

- (uint64_t)transitionIndexOverlaySelectionViewToVisible:(uint64_t)result
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  _QWORD v6[5];
  char v7;
  _QWORD v8[5];
  char v9;

  if (result)
  {
    v3 = result;
    if (((((*(_BYTE *)(result + 48) & 2) == 0) ^ a2) & 1) == 0)
    {
      v4 = 0.25;
      if (a2)
      {
        objc_msgSend(*(id *)(result + 24), "setHidden:", 0, 0.25);
        v4 = 0.15;
      }
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __86___UICollectionTableIndexOverlayManager_transitionIndexOverlaySelectionViewToVisible___block_invoke;
      v8[3] = &unk_1E16B1B78;
      v8[4] = v3;
      v9 = a2;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __86___UICollectionTableIndexOverlayManager_transitionIndexOverlaySelectionViewToVisible___block_invoke_2;
      v6[3] = &unk_1E16B7F38;
      v7 = a2;
      v6[4] = v3;
      result = +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v8, v6, v4, 0.0);
      if (a2)
      {
        *(_BYTE *)(v3 + 48) |= 2u;
        v5 = *(_QWORD *)(v3 + 24);
      }
      else
      {
        v5 = 0;
      }
      if (__UIAccessibilityBroadcastCallback)
        return __UIAccessibilityBroadcastCallback(1000, v5);
    }
  }
  return result;
}

- (uint64_t)handleWheelChangedEvent:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  double v5;
  uint64_t v6;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      objc_msgSend(v3, "_wheelVelocity");
      if ((*(_BYTE *)(a1 + 48) & 1) != 0 || fabs(v5) < 20.0)
      {
        -[_UICollectionTableIndexOverlayManager _prolongIndicatorHideTimer]((_QWORD *)a1);
        v6 = 0;
      }
      else
      {
        objc_msgSend(WeakRetained, "_recomputeSectionIndexTitleIndex");
        v6 = 1;
        -[_UICollectionTableIndexOverlayManager transitionIndexOverlayIndicatorViewToVisible:shouldFadeBackToInvisible:](a1, 1, 1);
        *(CFTimeInterval *)(a1 + 40) = CACurrentMediaTime();
      }
    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_prolongIndicatorHideTimer
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = (void *)a1[4];
    if (v2)
    {
      objc_msgSend(v2, "invalidate");
      v3 = (void *)a1[4];
      a1[4] = 0;

      -[_UICollectionTableIndexOverlayManager _hideIndicatorAfterDelay:](a1, 2.0);
    }
  }
}

- (void)handleMoveEvent:(uint64_t)a1
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained && CACurrentMediaTime() - *(double *)(a1 + 40) >= 0.25)
    {
      if (objc_msgSend(v5, "_moveDirection") == 1)
        v4 = 1;
      else
        v4 = -1;
      objc_msgSend(WeakRetained, "_shiftSectionIndexTitleIndexByAmount:", v4);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexOverlayIndicatorViewText, 0);
  objc_storeStrong((id *)&self->_indicatorHideTimer, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_destroyWeak((id *)&self->_host);
}

@end
