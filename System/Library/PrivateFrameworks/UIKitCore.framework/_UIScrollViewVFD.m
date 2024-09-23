@implementation _UIScrollViewVFD

- (void)updateBounds:(CGFloat)a3 scale:(CGFloat)a4
{
  uint64_t v7;
  uint64_t v12;
  double v14;
  double v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  unsigned __int16 v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  float *v27;
  uint64_t v28;
  __int128 v29;
  _OWORD v30[2];
  uint64_t v31;

  if (a1)
  {
    if (*(_DWORD *)(a1 + 24))
    {
      v7 = *(_QWORD *)(a1 + 64);
      if (v7 == a1 + 32)
      {
        v12 = *(_QWORD *)(a1 + 104);
        if (v12
          && off_1ECD75C00
          && *((_DWORD *)off_1ECD75C00 + 160) == 1
          && (v14 = _UIMediaDurationForMachDuration(*((_QWORD *)off_1ECD75C00 + 84) - v12), v14 > 0.0)
          && v14 < 0.064)
        {
          v15 = hypot(*(double *)(a1 + 112) - a2, *(double *)(a1 + 120) - a3) * a6 / v14;
          v16 = (1.0 / v14 + 0.5);
          if (qword_1EDDB0C80[0] != -1)
            dispatch_once(qword_1EDDB0C80, &__block_literal_global_527);
          v17 = v15;
          *(_QWORD *)&v30[0] = 0;
          v31 = 0;
          v18 = _UIScrollViewVFDTableLookup(*(_DWORD *)qword_1EDDB0C78, *(_QWORD *)(qword_1EDDB0C78 + 8), v16, (uint64_t *)v30, &v31, v17);
          v19 = v15;
          v20 = _UIScrollViewVFDTableLookup(*(_DWORD *)qword_1EDDB0C70, *(_QWORD *)(qword_1EDDB0C70 + 8), v16, (uint64_t *)v30, &v31, v19);
          *(_QWORD *)(a1 + 88) = v20;
          if (*(_QWORD *)(a1 + 80) == v20)
          {
            v26 = *(unsigned __int16 *)(a1 + 96);
            v22 = _MergedGlobals_34;
            if (_MergedGlobals_34 <= v26)
            {
              v21 = *(_WORD *)(a1 + 98);
            }
            else
            {
              v21 = v26 + 1;
              *(_WORD *)(a1 + 98) = v21;
            }
          }
          else
          {
            v21 = 0;
            *(_WORD *)(a1 + 98) = 0;
            v22 = _MergedGlobals_34;
          }
          if (v22 <= v21)
            v27 = (float *)v20;
          else
            v27 = (float *)v18;
          v23 = v27[1];
          v25 = v27[2];
          v24 = *v27;
          kdebug_trace();
          v28 = *(_QWORD *)(a1 + 16);
          v29 = *(_OWORD *)(v7 + 16);
          v30[0] = *(_OWORD *)v7;
          v30[1] = v29;
          -[_UIScrollViewFPSHUD displayUpdateRequest:reportedRateForPreviousFrame:](v28, (uint64_t)v30, v16);
        }
        else
        {
          kdebug_trace();
          v23 = 120;
          v24 = 80;
          v25 = 120;
        }
        _UIUpdateCompletionObservationAddObserver(mainCompletionObservation, a1, 0);
        *(_DWORD *)(a1 + 36) = v24;
        *(_DWORD *)(a1 + 40) = v25;
        *(_DWORD *)(a1 + 44) = v23;
        _UIUpdateRequestRegistryMutableRequestChanged((uint64_t)&mainRegistry, (_BYTE *)v7);
        -[_UIScrollViewFPSHUD updateDebugOverlayBounds:withScrollView:](*(void **)(a1 + 16), *(void **)(a1 + 8), a2, a3, a4, a5);
      }
    }
  }
}

- (_OWORD)initWithScrollView:(void *)a1
{
  _OWORD *v3;
  _OWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_UIScrollViewVFD;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = xmmword_186684450;
    *((_QWORD *)v3 + 1) = a2;
    *((_QWORD *)v3 + 11) = 0;
    *((_QWORD *)v3 + 12) = 0;
    *((_QWORD *)v3 + 10) = 0;
    *((_QWORD *)v3 + 8) = v3 + 2;
    *((_DWORD *)v3 + 18) = 1048577;
    +[_UIScrollViewFPSHUD createFPSHUD]();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v5;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOverlay, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[_UIScrollViewVFD reset]((unint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewVFD;
  -[_UIScrollViewVFD dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 24))
    {
      -[_UIScrollViewVFD _deactivateActiveSubreasons:](a1, a1 + 64);
      *(_DWORD *)(a1 + 24) = 0;
    }
    _UIUpdateCompletionObservationRemoveObserver((uint64_t)mainCompletionObservation, a1, 0);
  }
}

- (uint64_t)deactivateSubreason:(uint64_t)result
{
  uint64_t v3;
  int v4;
  int v5;
  _DWORD *v6;

  if (result)
  {
    v3 = result;
    v4 = *(_DWORD *)(result + 24);
    if ((v4 & (1 << a2)) != 0)
    {
      v5 = v4 & ~(1 << a2);
      *(_DWORD *)(result + 24) = v5;
      if (!v5)
      {
        result = _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, *(_DWORD **)(result + 64), *(_DWORD *)(result + 72));
        *(_QWORD *)(v3 + 36) = 0x7800000050;
        *(_DWORD *)(v3 + 44) = 120;
      }
      v6 = *(_DWORD **)(v3 + 64);
      if (v6 == (_DWORD *)(v3 + 32))
        return _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, v6, a2 + 1048577);
    }
  }
  return result;
}

- (uint64_t)_deactivateActiveSubreasons:(uint64_t)result
{
  _DWORD *v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;

  if (result)
  {
    v3 = *(_DWORD **)a2;
    if (*(_QWORD *)a2 == result + 32)
    {
      v4 = *(_DWORD *)(result + 24);
      if (v4)
      {
        v5 = 1048577;
        do
        {
          if ((v4 & 1) != 0)
            _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, v3, v5);
          ++v5;
          v6 = v4 > 1;
          v4 >>= 1;
        }
        while (v6);
        v3 = *(_DWORD **)a2;
      }
    }
    return _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, v3, *(_DWORD *)(a2 + 8));
  }
  return result;
}

- (uint64_t)activateSubreason:(uint64_t)result
{
  uint64_t v3;
  int v4;
  int v5;
  int *v6;

  if (result)
  {
    v3 = result;
    v4 = 1 << a2;
    v5 = *(_DWORD *)(result + 24);
    if ((v5 & (1 << a2)) == 0)
    {
      if (!v5)
        result = _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, *(int **)(result + 64), *(_DWORD *)(result + 72));
      v6 = *(int **)(v3 + 64);
      if (v6 == (int *)(v3 + 32))
        result = _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, v6, a2 + 1048577);
      *(_DWORD *)(v3 + 24) |= v4;
    }
  }
  return result;
}

- (uint64_t)updateDisplayLink:(uint64_t)result
{
  CAFrameRateRange v3;

  if (result)
  {
    if (a2)
    {
      v3 = CAFrameRateRangeMake((float)*(unsigned int *)(*(_QWORD *)(result + 64) + 4), (float)*(unsigned int *)(*(_QWORD *)(result + 64) + 12), (float)*(unsigned int *)(*(_QWORD *)(result + 64) + 8));
      return objc_msgSend(a2, "setPreferredFrameRateRange:", *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
    }
  }
  return result;
}

- (void)_updateCompleted
{
  char *v3;
  CGFloat v4;
  CGFloat v5;
  UIScrollView *scrollView;

  self->_lookupState.staticRateRangePrevious = self->_lookupState.staticRateRangeCurrent;
  self->_lookupState.staticRateRangeFramesPrevious = self->_lookupState.staticRateRangeFramesCurrent;
  v3 = (char *)off_1ECD75C00 + 648;
  if (*((_DWORD *)off_1ECD75C00 + 160) != 1)
    v3 = 0;
  self->_displayedPresentationTime = *((_QWORD *)v3 + 3);
  -[UIView bounds](self->_scrollView, "bounds");
  self->_displayedOrigin.x = v4;
  self->_displayedOrigin.y = v5;
  scrollView = self->_scrollView;
  if (scrollView)
    -[_UIScrollViewVFD updateDisplayLink:]((uint64_t)scrollView->_vfd, scrollView->_scrollHeartbeat);
}

- (uint64_t)setUpdateRequestRecord:(uint64_t)result
{
  uint64_t v2;
  _OWORD *v3;
  __int128 v4;

  if (result)
  {
    v2 = result;
    v3 = (_OWORD *)(result + 64);
    v4 = *(_OWORD *)(result + 64);
    if (a2)
    {
      *v3 = *a2;
    }
    else
    {
      *(_QWORD *)(result + 64) = result + 32;
      *(_DWORD *)(result + 72) = 1048577;
    }
    if (*(_DWORD *)(result + 24) && (_QWORD)v4 != *(_QWORD *)v3 && DWORD2(v4) != *(_DWORD *)(result + 72))
    {
      -[_UIScrollViewVFD _deactivateActiveSubreasons:](result, (uint64_t)&v4);
      return -[_UIScrollViewVFD _activateActiveSubreasons:](v2, (uint64_t)v3);
    }
  }
  return result;
}

- (uint64_t)_activateActiveSubreasons:(uint64_t)result
{
  int *v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;

  if (result)
  {
    v3 = *(int **)a2;
    if (*(_QWORD *)a2 == result + 32)
    {
      v4 = *(_DWORD *)(result + 24);
      if (v4)
      {
        v5 = 1048577;
        do
        {
          if ((v4 & 1) != 0)
            _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, v3, v5);
          ++v5;
          v6 = v4 > 1;
          v4 >>= 1;
        }
        while (v6);
        v3 = *(int **)a2;
      }
    }
    return _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, v3, *(_DWORD *)(a2 + 8));
  }
  return result;
}

@end
