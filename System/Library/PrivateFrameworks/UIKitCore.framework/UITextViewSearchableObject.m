@implementation UITextViewSearchableObject

uint64_t __94___UITextViewSearchableObject_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "foundRange:forSearchString:inDocument:", a2, *(_QWORD *)(a1 + 40), 0);
}

uint64_t __88___UITextViewSearchableObject_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __57___UITextViewSearchableObject_clearAllDecoratedFoundText__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

uint64_t __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 1.0);
}

uint64_t __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke_3(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  BOOL v6;
  void *v8;
  void *v9;
  _QWORD *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
    v6 = 1;
  else
    v6 = a2 == 0;
  if (!v6 && WeakRetained != 0)
  {
    v8 = *(void **)(a1 + 40);
    if (v8 == (void *)v5[3])
    {
      v10 = v5;
      objc_msgSend(v8, "removeFromSuperview");
      v9 = (void *)v10[3];
      v10[3] = 0;

      objc_msgSend(v10, "_ensureSubviewOrder");
      v5 = v10;
    }
  }

}

id __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  void *v4;
  int v5;
  void *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained(WeakRetained + 9);
  v3 = WeakRetained[7];
  if (v3
    && (objc_msgSend(v2, "_fullRange"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v2, "_range:containsRange:", v4, v3),
        v4,
        v5))
  {
    objc_msgSend(v2, "_targetedPreviewForHighlightRange:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", 1.0);
}

uint64_t __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", 0.0);
}

void __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (a2)
    {
      v5 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v5 + 41))
        objc_msgSend(*(id *)(v5 + 32), "removeFromSuperview");
    }
    objc_msgSend(v6, "_ensureSubviewOrder");
    WeakRetained = v6;
  }

}

uint64_t __68___UITextViewSearchableObject__updateHighlightLabelForMatchedRange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_usesTransientHighlightBehavior");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "fadeAwayWithCompletion:", 0);
  return result;
}

uint64_t __52___UITextViewSearchableObject_layoutManagedSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setContentInset:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTextRects:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

@end
