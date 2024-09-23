@implementation RKPaymentIdentifier

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_12);
  return (id)sharedManager_sharedPaymentIdentifier;
}

void __36__RKPaymentIdentifier_sharedManager__block_invoke()
{
  RKPaymentIdentifier *v0;
  void *v1;

  v0 = objc_alloc_init(RKPaymentIdentifier);
  v1 = (void *)sharedManager_sharedPaymentIdentifier;
  sharedManager_sharedPaymentIdentifier = (uint64_t)v0;

}

- (id)amountsFromMessage:(id)a3
{
  id v3;
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  id v7;
  CFIndex i;
  uint64_t Value;
  RKCurrencyAmount *v10;
  _QWORD block[5];
  _QWORD v13[4];

  v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__RKPaymentIdentifier_amountsFromMessage___block_invoke;
  block[3] = &unk_24C6AF080;
  block[4] = v13;
  if (amountsFromMessage__onceToken != -1)
    dispatch_once(&amountsFromMessage__onceToken, block);
  if (amountsFromMessage__scanner
    && DDScannerScanString()
    && (v4 = (const __CFArray *)DDScannerCopyResultsWithOptions(), (v5 = v4) != 0))
  {
    Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      v7 = 0;
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      for (i = 0; i != Count; ++i)
      {
        CFArrayGetValueAtIndex(v5, i);
        if (DDResultHasType())
        {
          Value = DDResultGetValue();
          if (DDResultCurrencyExtraction())
          {
            v10 = -[RKCurrencyAmount initWithString:currency:value:]([RKCurrencyAmount alloc], "initWithString:currency:value:", Value, 0, 0.0);
            objc_msgSend(v7, "addObject:", v10);

          }
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(v13, 8);

  return v7;
}

uint64_t __42__RKPaymentIdentifier_amountsFromMessage___block_invoke()
{
  uint64_t result;

  result = DDScannerCreateWithType();
  amountsFromMessage__scanner = result;
  return result;
}

- (id)copyAttributedTokensForText:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[RKPaymentIdentifier amountsFromMessage:](self, "amountsFromMessage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v5, "setValue:forKey:", CFSTR("money"), *MEMORY[0x24BE5EE58]);
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("xCURRENCYAMOUNTx"));
    objc_msgSend(v5, "setValue:forKey:", v6, *MEMORY[0x24BE5EE38]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
