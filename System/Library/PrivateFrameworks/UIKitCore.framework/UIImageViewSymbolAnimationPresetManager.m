@implementation UIImageViewSymbolAnimationPresetManager

uint64_t __74___UIImageViewSymbolAnimationPresetManager_activeSymbolEffectDidComplete___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "symbolEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  return v8;
}

uint64_t __118___UIImageViewSymbolAnimationPresetManager__removeSymbolEffectsOfType_options_animated_completion_forAddingNewEffect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "symbolEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_symbolEffect:collidesWithSymbolEffect:forAddingEffect:", v4, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  return v5;
}

uint64_t __118___UIImageViewSymbolAnimationPresetManager__removeSymbolEffectsOfType_options_animated_completion_forAddingNewEffect___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "symbolEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_symbolEffect:collidesWithSymbolEffect:forAddingEffect:", v4, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  return v5;
}

@end
