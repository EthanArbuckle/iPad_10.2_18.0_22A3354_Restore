@implementation UICollectionTableIndexOverlayManager

uint64_t __112___UICollectionTableIndexOverlayManager_transitionIndexOverlayIndicatorViewToVisible_shouldFadeBackToInvisible___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", v1);
}

uint64_t __112___UICollectionTableIndexOverlayManager_transitionIndexOverlayIndicatorViewToVisible_shouldFadeBackToInvisible___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
  {
    *(_BYTE *)(*(_QWORD *)(result + 32) + 48) &= ~1u;
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 16), "setHidden:", 0);
  }
  return result;
}

uint64_t __86___UICollectionTableIndexOverlayManager_transitionIndexOverlaySelectionViewToVisible___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", v1);
}

uint64_t __86___UICollectionTableIndexOverlayManager_transitionIndexOverlaySelectionViewToVisible___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
  {
    *(_BYTE *)(*(_QWORD *)(result + 32) + 48) &= ~2u;
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "setHidden:", 1);
  }
  return result;
}

void __66___UICollectionTableIndexOverlayManager__hideIndicatorAfterDelay___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[_UICollectionTableIndexOverlayManager transitionIndexOverlayIndicatorViewToVisible:shouldFadeBackToInvisible:](WeakRetained, 0, 0);
    v2 = (void *)v3[4];
    v3[4] = 0;

    WeakRetained = v3;
  }

}

@end
