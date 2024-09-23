@implementation UIInteractiveHighlightEnvironment

uint64_t __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentationValue");
  v4 = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setFractionComplete:", v4);
  v5 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v5 + 120);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, *(_QWORD *)(v5 + 32), v4);
  return result;
}

void __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke_2(uint64_t a1)
{
  double v1;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setValue:", v1);

}

uint64_t __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 56)
    && (a3 & 1) == 0
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "finalizeBackgroundEffect");
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __68___UIInteractiveHighlightEnvironment_setHidden_animated_completion___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", v1);
}

uint64_t __68___UIInteractiveHighlightEnvironment_setHidden_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setHidden:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", 1.0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

BOOL __63___UIInteractiveHighlightEnvironment_indexOfViewRecordForView___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a2, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
    *a4 = 1;
  return v6 == v7;
}

BOOL __63___UIInteractiveHighlightEnvironment_removeViewRecordsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "interactiveHighlightEffects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __63___UIInteractiveHighlightEnvironment_removeViewRecordsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalizeViewRecord:", a2);
}

uint64_t __58___UIInteractiveHighlightEnvironment_removeAllViewRecords__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalizeViewRecord:", a2);
}

void __65___UIInteractiveHighlightEnvironment_newBackgroundEffectAnimator__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backgroundVisualEffectForProgress:", 1.6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setBackgroundEffects:", v2);

}

@end
