@implementation UIFont

void __77__UIFont_PosterUIFoundation__pui_fontWithFallbacks_beforeFontContainingName___block_invoke(uint64_t a1, CTFontDescriptorRef descriptor, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = (id)CTFontDescriptorCopyAttribute(descriptor, (CFStringRef)*MEMORY[0x24BDC4D70]);
  if (objc_msgSend(v7, "rangeOfString:", *(_QWORD *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

void __59__UIFont_PosterUIFoundation__pui_replaceFallbackFontNames___block_invoke(uint64_t a1, CTFontDescriptorRef descriptor, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *MatchingFontDescriptorsWithOptions;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)CTFontDescriptorCopyAttribute(descriptor, (CFStringRef)*MEMORY[0x24BDC4D70]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x24BDF6A78];
    v14 = *MEMORY[0x24BDF7750];
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithFontAttributes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    MatchingFontDescriptorsWithOptions = (void *)CTFontDescriptorCreateMatchingFontDescriptorsWithOptions();
    v12 = MatchingFontDescriptorsWithOptions;
    if (MatchingFontDescriptorsWithOptions)
    {
      objc_msgSend(MatchingFontDescriptorsWithOptions, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v13, a3);

    }
  }

}

@end
