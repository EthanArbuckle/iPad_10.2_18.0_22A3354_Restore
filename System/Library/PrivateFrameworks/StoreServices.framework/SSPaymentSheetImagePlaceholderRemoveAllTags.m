@implementation SSPaymentSheetImagePlaceholderRemoveAllTags

void __SSPaymentSheetImagePlaceholderRemoveAllTags_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mutableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", v9);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    v6 = v4;
    do
    {
      v7 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("%%"), 0, v6 + 1, objc_msgSend(v3, "length") + ~v6);
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v6, v8 - v6 + v7, &stru_1E47D72B0);
      objc_msgSend(*(id *)(a1 + 32), "mutableString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v5, "rangeOfString:", v9);
      v3 = v5;
    }
    while (v6 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

@end
