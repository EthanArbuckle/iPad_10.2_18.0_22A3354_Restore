@implementation UIFont

uint64_t __60__UIFont_PRTimeFont__pr_downloadableFontWithPostScriptName___block_invoke(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        return 1;
      goto LABEL_8;
    case 4:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_8:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      return 1;
    case 7:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      break;
  }
  return 1;
}

void __68__UIFont_PRTimeFont__pr_fontWithFallbacks_beforeFontContainingName___block_invoke(uint64_t a1, CTFontDescriptorRef descriptor, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = (id)CTFontDescriptorCopyAttribute(descriptor, (CFStringRef)*MEMORY[0x1E0CA8380]);
  if (objc_msgSend(v7, "rangeOfString:", *(_QWORD *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

void __50__UIFont_PRTimeFont__pr_replaceFallbackFontNames___block_invoke(uint64_t a1, CTFontDescriptorRef descriptor, uint64_t a3)
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

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)CTFontDescriptorCopyAttribute(descriptor, (CFStringRef)*MEMORY[0x1E0CA8380]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0DC1358];
    v14 = *MEMORY[0x1E0DC1388];
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
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
