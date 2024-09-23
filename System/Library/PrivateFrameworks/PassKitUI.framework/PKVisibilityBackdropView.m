@implementation PKVisibilityBackdropView

uint64_t __56___PKVisibilityBackdropView_pkui_commitBackdropSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionIncrementallyToPrivateStyle:weighting:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 872), 0.0);
}

uint64_t __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionIncrementallyToPrivateStyle:weighting:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 872), *(double *)(*(_QWORD *)(a1 + 32) + 840));
}

uint64_t __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionIncrementallyToPrivateStyle:weighting:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 872), *(double *)(*(_QWORD *)(a1 + 32) + 848));
}

void __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  _QWORD v6[4];
  id v7;
  int v8;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_DWORD *)WeakRetained + 215) == *(_DWORD *)(a1 + 40))
    {
      v5 = *((_DWORD *)WeakRetained + 214) - 1;
      *((_DWORD *)WeakRetained + 214) = v5;
      if (!v5)
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_3;
        v6[3] = &unk_1E3E69140;
        objc_copyWeak(&v7, v2);
        v8 = *(_DWORD *)(a1 + 40);
        dispatch_async(MEMORY[0x1E0C80D38], v6);
        objc_destroyWeak(&v7);
      }
    }
  }

}

void __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_3(uint64_t a1)
{
  double *WeakRetained;
  double *v3;
  double v4;
  double *v5;
  _QWORD v6[5];

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_DWORD *)WeakRetained + 215) == *(_DWORD *)(a1 + 40) && !*((_DWORD *)WeakRetained + 214))
    {
      v4 = WeakRetained[105];
      if (WeakRetained[106] != v4)
      {
        WeakRetained[106] = v4;
        v6[1] = 3221225472;
        v6[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_4;
        v6[3] = &unk_1E3E612E8;
        v6[4] = WeakRetained;
        v5 = WeakRetained;
        v6[0] = MEMORY[0x1E0C809B0];
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
        v3 = v5;
      }
    }
  }

}

uint64_t __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionIncrementallyToPrivateStyle:weighting:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 872), *(double *)(*(_QWORD *)(a1 + 32) + 840));
}

@end
