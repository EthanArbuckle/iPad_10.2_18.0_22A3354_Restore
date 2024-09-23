@implementation UIPhysicalKeyTranslationMap

void __78___UIPhysicalKeyTranslationMap_populateAllCombinationsOfModifiers_translator___block_invoke(uint64_t a1, uint64_t a2)
{
  NSMapTable *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "translationMap");
  v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v5 = NSMapGet(v4, (const void *)(a2 + 1));

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "translationForHIDUsageCode:modifiers:", (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "keyCode"), a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(*(id *)(a1 + 32), "setKeyTranslation:modifiers:", v6, a2);
      v6 = v7;
    }

  }
}

void __124___UIPhysicalKeyTranslationMap_areModifiers_minimalExcessOfMask_matching_translator_matchedModifierSubset_betterMatchFound___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  int v7;
  int8x8_t v8;
  uint8x8_t v9;
  _BYTE *v10;

  objc_msgSend(*(id *)(a1 + 32), "keyTranslationWithModifiers:translator:", a2, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if (v7)
  {
    v8.i32[0] = *(_DWORD *)(a1 + 72) | a2;
    v9 = (uint8x8_t)vcnt_s8(v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.i32[0] >= *(_DWORD *)(a1 + 88))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a3 = 1;
      v10 = *(_BYTE **)(a1 + 80);
      if (v10)
        *v10 = 1;
    }
  }
}

@end
