@implementation NSString

void __54__NSString_SCROBrailleAdditions___illegalCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\r\n\t"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_illegalCharacterSet___illegalCharacterSet;
  _illegalCharacterSet___illegalCharacterSet = v0;

}

void __53__NSString_SCROBrailleAdditions___legalWhiteSpaceSet__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_illegalCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = (void *)_legalWhiteSpaceSet___legalWhiteSpaceSet;
  _legalWhiteSpaceSet___legalWhiteSpaceSet = v3;

  objc_msgSend((id)_legalWhiteSpaceSet___legalWhiteSpaceSet, "formIntersectionWithCharacterSet:", v5);
}

@end
