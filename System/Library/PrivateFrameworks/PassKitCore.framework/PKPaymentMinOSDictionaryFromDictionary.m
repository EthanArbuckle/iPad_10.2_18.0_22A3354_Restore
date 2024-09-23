@implementation PKPaymentMinOSDictionaryFromDictionary

void __PKPaymentMinOSDictionaryFromDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("minOSVersion")) & 1) != 0)
    {
      v7 = CFSTR("iPhone");
LABEL_11:
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);
      goto LABEL_12;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("miniPadOSVersion")) & 1) != 0)
    {
      v7 = CFSTR("iPad");
      goto LABEL_11;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("minWatchOSVersion")) & 1) != 0)
    {
      v7 = CFSTR("Watch");
      goto LABEL_11;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("minMacOSVersion")))
    {
      v7 = CFSTR("Mac");
      goto LABEL_11;
    }
  }
LABEL_12:

}

@end
