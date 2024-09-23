@implementation UISlideriOSFluidVisualElement

void __51___UISlideriOSFluidVisualElement__setupInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGRect v19;

  v3 = a2;
  v4 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 568);
  objc_msgSend(v3, "trackBounds");
  *v4 = v5;
  v4[1] = v6;
  v4[2] = v7;
  v4[3] = v8;
  v9 = (__int128 *)(*(_QWORD *)(a1 + 32) + 600);
  if (v3)
  {
    objc_msgSend(v3, "trackTransform");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  v9[1] = v17;
  v9[2] = v18;
  *v9 = v16;
  objc_msgSend(v3, "barFrame", v16, v17, v18);
  *(CGFloat *)(*(_QWORD *)(a1 + 32) + 560) = CGRectGetMaxX(v19);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 648) = objc_msgSend(v3, "isTracking");
  v10 = objc_msgSend(v3, "type");
  v11 = (v10 >> 1) & 1;
  if ((v10 & 4) != 0)
    v11 = 2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656) = v11;
  v12 = objc_msgSend(v3, "interactionState");
  if (v12 == (objc_msgSend(v3, "type") & 6))
  {
    objc_msgSend(*(id *)(a1 + 32), "slider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isContinuous");

  }
  else
  {
    v14 = 0;
  }
  v15 = *(id **)(a1 + 32);
  objc_msgSend(v15[69], "value");
  objc_msgSend(v15, "_updateModelValue:sendAction:", v14);
  objc_msgSend(*(id *)(a1 + 32), "_layoutSubviewsForBoundsChange:", 0);

}

uint64_t __69___UISlideriOSFluidVisualElement__updateConfigurationForFrameChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __69___UISlideriOSFluidVisualElement__setValue_minimum_maximum_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setValue:", *(double *)(a1 + 40));
}

@end
