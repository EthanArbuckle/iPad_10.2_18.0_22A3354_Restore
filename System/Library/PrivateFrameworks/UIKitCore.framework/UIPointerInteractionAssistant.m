@implementation UIPointerInteractionAssistant

void __52___UIPointerInteractionAssistant__assistantForView___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id *v7;
  id *v8;
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained(v7 + 1);

    if (WeakRetained)
    {
      if (-[UIView _containsView:]((uint64_t)WeakRetained, *(_QWORD *)(a1 + 40)))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
        *a4 = 1;
      }
    }
  }

}

BOOL __91___UIPointerInteractionAssistant__updatePointerInteractionForSubtree_suppressInteractions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  _assistedButtonForView(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v5 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      objc_msgSend(v3, "_proxyPointerInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);

      if (v6 != v7)
        goto LABEL_6;
      v5 = 0;
    }
    objc_msgSend(v4, "_setProxyPointerInteraction:", v5);
  }
LABEL_6:

  return v4 == 0;
}

void __84___UIPointerInteractionAssistant_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t *a1, void *a2, void *a3, _BYTE *a4)
{
  id *v8;
  id *v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a2;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained(v8 + 1);
    v11 = WeakRetained;
    if (WeakRetained && -[UIView _containsView:]((uint64_t)WeakRetained, a1[4]))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

}

@end
