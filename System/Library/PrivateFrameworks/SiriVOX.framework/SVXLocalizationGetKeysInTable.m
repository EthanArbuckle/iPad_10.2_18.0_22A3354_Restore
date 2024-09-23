@implementation SVXLocalizationGetKeysInTable

void __SVXLocalizationGetKeysInTable_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "hasSuffix:", CFSTR("_FEMALE")))
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(v8, "length");
    v5 = CFSTR("_FEMALE");
  }
  else
  {
    v6 = objc_msgSend(v8, "hasSuffix:", CFSTR("_MALE"));
    v3 = *(void **)(a1 + 32);
    if (!v6)
    {
      objc_msgSend(v3, "addObject:", v8);
      goto LABEL_7;
    }
    v4 = objc_msgSend(v8, "length");
    v5 = CFSTR("_MALE");
  }
  objc_msgSend(v8, "substringToIndex:", v4 - -[__CFString length](v5, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

LABEL_7:
}

@end
