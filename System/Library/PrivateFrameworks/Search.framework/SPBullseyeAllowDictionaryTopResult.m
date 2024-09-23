@implementation SPBullseyeAllowDictionaryTopResult

void __SPBullseyeAllowDictionaryTopResult_block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  objc_msgSend(v0, "objectForKey:", CFSTR("SPBullseyeAllowDictionaryTopResult"));
  v1 = (id)objc_claimAutoreleasedReturnValue();

  SPBullseyeAllowDictionaryTopResult__useBullseyeAllowDictionaryTopResult = objc_msgSend(v1, "BOOLValue");
}

@end
