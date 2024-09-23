@implementation PDSetExpressPassConfigurations

uint64_t __PDSetExpressPassConfigurations_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passInformation");
}

uint64_t __PDSetExpressPassConfigurations_block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  CFPreferencesSetAppValue(CFSTR("PDExpressPasses-2"), v2, CFSTR("com.apple.stockholm"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.stockholm"));
  return _PDSetExpressPassesInformation(*(void **)(a1 + 40));
}

@end
