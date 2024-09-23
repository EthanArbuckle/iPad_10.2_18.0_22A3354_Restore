@implementation UIToolbarVisualProviderLegacyIOS

void __125___UIToolbarVisualProviderLegacyIOS__positionToolbarButtons_ignoringItem_resetFontScaleAdjustment_actuallyRepositionButtons___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40) && *(_BYTE *)(a1 + 41))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v1 = *(id *)(a1 + 32);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v9;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "view", (_QWORD)v8);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v6, "_isBorderedOtherThanAccessibility") & 1) == 0)
          {
            objc_msgSend(v6, "_info");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v7, "_isFontScaleInvalid"))
            {
              objc_msgSend(v7, "_updateStyle");
              objc_msgSend(v7, "layoutIfNeeded");
            }

          }
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v3);
    }

  }
}

void __125___UIToolbarVisualProviderLegacyIOS__positionToolbarButtons_ignoringItem_resetFontScaleAdjustment_actuallyRepositionButtons___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGRectValue");
  objc_msgSend(v1, "setFrame:");

}

void __74___UIToolbarVisualProviderLegacyIOS_updateWithItems_fromOldItems_animate___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v6), "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", 0.0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[5], "positionToolbarButtonsAndResetFontScaleAdjustment:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = a1[6];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "view", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAlpha:", 1.0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

void __74___UIToolbarVisualProviderLegacyIOS_updateWithItems_fromOldItems_animate___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7, (_QWORD)v9) & 1) == 0)
        {
          objc_msgSend(v7, "view");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeFromSuperview");

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

@end
