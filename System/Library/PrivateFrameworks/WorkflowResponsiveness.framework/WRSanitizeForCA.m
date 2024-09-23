@implementation WRSanitizeForCA

void __WRSanitizeForCA_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WRSanitizeForCA_removedCharacters;
  WRSanitizeForCA_removedCharacters = v0;

}

@end
