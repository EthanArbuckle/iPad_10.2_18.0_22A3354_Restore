@implementation ASCLockupRequest(VSUIAdditions)

+ (id)tvProviderLockupRequestWithAdamID:()VSUIAdditions
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BE04450];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithStringValue:", v4);

  v6 = objc_alloc(MEMORY[0x24BE04478]);
  v7 = (void *)objc_msgSend(v6, "initWithID:kind:context:", v5, *MEMORY[0x24BE04430], *MEMORY[0x24BE04428]);
  objc_msgSend(v7, "lockupRequestWithClientID:", CFSTR("TVProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
