@implementation NSCharacterSet

void __65__NSCharacterSet_Latex__charactersRequiringExtentionCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-√=−"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)charactersRequiringExtentionCharacterSet_charSet;
  charactersRequiringExtentionCharacterSet_charSet = v0;

}

@end
