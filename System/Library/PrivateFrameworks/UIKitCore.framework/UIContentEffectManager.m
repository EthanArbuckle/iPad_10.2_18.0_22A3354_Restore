@implementation UIContentEffectManager

void __40___UIContentEffectManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD81B70;
  qword_1ECD81B70 = v0;

  v2 = objc_opt_new();
  v3 = *(void **)(qword_1ECD81B70 + 8);
  *(_QWORD *)(qword_1ECD81B70 + 8) = v2;

}

void __73___UIContentEffectManager_compatibleEffectForKey_descriptor_constructor___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  int canTransitionBetweenEffects;
  id v11;

  v11 = a2;
  v8 = a3;
  objc_msgSend(v8, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  canTransitionBetweenEffects = _canTransitionBetweenEffects(v9, *(void **)(a1 + 32));

  if (canTransitionBetweenEffects)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __73___UIContentEffectManager_compatibleEffectForKey_descriptor_constructor___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_stopManagingEffect:", v3);

}

@end
