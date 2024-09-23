@implementation NSString

void __56__NSString_CACHelpers__cac_stringByFilteringPunctuation__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1690], "alphanumericCharacterSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v0);

  objc_msgSend(v3, "addCharactersInString:", CFSTR("&+'’-"));
  objc_msgSend(v3, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cac_stringByFilteringPunctuation___punctuationSet;
  cac_stringByFilteringPunctuation___punctuationSet = v1;

}

void __56__NSString_CACHelpers__cac_stringByCollapsingWhitespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("  +"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cac_stringByCollapsingWhitespace___regex;
  cac_stringByCollapsingWhitespace___regex = v0;

}

@end
