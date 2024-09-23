@implementation NSAttributedString

void __73__NSAttributedString_IMAdditions__attributedStringWithDefaultLineSpacing__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "lineSpacing");
  objc_msgSend(v7, "setLineSpacing:");
  objc_msgSend(*(id *)(a1 + 32), "lineHeightMultiple");
  objc_msgSend(v7, "setLineHeightMultiple:");
  objc_msgSend(*(id *)(a1 + 32), "paragraphSpacingBefore");
  objc_msgSend(v7, "setParagraphSpacingBefore:");
  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v7, a3, a4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __75__NSAttributedString_IMAdditions__safeAttributedStringWithHTML_attributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *MEMORY[0x1E0DC1160];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", v10))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "host");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);

        }
        else if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

void __111__NSAttributedString_MTMPUDynamicType__MTMPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "fontDescriptor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0DC13B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v13, "symbolicTraits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    v11 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);

  }
}

void __71__NSAttributedString_MTMPUDynamicType__MTMPU_tallestFontFromAttributes__block_invoke(uint64_t a1, void *a2)
{
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_msgSend(v6, "_bodyLeading");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v4 > *(double *)(v5 + 24))
    {
      *(double *)(v5 + 24) = v4;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
  }

}

@end
