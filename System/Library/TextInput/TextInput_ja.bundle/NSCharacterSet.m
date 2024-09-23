@implementation NSCharacterSet

void __55__NSCharacterSet_RomajiAdditions__alphabetCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)alphabetCharacterSet___alphabetCharacterSet;
  alphabetCharacterSet___alphabetCharacterSet = v0;

}

@end
