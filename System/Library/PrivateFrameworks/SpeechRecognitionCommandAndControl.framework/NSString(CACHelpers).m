@implementation NSString(CACHelpers)

- (id)cac_stringByFilteringPunctuation
{
  void *v2;
  void *v3;

  if (cac_stringByFilteringPunctuation_onceToken != -1)
    dispatch_once(&cac_stringByFilteringPunctuation_onceToken, &__block_literal_global_34);
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", cac_stringByFilteringPunctuation___punctuationSet);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", &stru_24F2ADCC8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cac_stringByCollapsingWhitespace
{
  void *v2;
  void *v3;
  void *v4;

  if (cac_stringByCollapsingWhitespace_onceToken != -1)
    dispatch_once(&cac_stringByCollapsingWhitespace_onceToken, &__block_literal_global_181);
  objc_msgSend((id)cac_stringByCollapsingWhitespace___regex, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cac_stringByPreparingForAX
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("feat."), CFSTR("featuring"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cac_stringByFilteringPunctuation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "cac_stringByCollapsingWhitespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "substringWithRange:", 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uppercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

@end
