@implementation SAUIDisambiguationList

void __80__SAUIDisambiguationList_SiriUIFoundationAdditions__sruif_combinedSpeakableText__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "speakableText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_speakableStringFromString:usingParser:", v6, *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_BYTE *)(v7 + 24))
    {
      *(_BYTE *)(v7 + 24) = 0;
    }
    else if (*(_QWORD *)(a1 + 72) - 1 == a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_speakableFinalDelimiterForSpeakableString:usingParser:", v9, *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(*(id *)(a1 + 48), "appendString:", v8);

    }
    else if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 48), "appendString:");
    }
    objc_msgSend(*(id *)(a1 + 48), "appendString:", v9);
  }

}

@end
