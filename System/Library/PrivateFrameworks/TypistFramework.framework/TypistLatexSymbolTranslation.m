@implementation TypistLatexSymbolTranslation

+ (id)charactersRequiringExtentionCharacterSet
{
  if (charactersRequiringExtentionCharacterSet_onceToken_0 != -1)
    dispatch_once(&charactersRequiringExtentionCharacterSet_onceToken_0, &__block_literal_global_11);
  return (id)charactersRequiringExtentionCharacterSet_charSet_0;
}

void __72__TypistLatexSymbolTranslation_charactersRequiringExtentionCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-√"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)charactersRequiringExtentionCharacterSet_charSet_0;
  charactersRequiringExtentionCharacterSet_charSet_0 = v0;

}

+ (id)latexSymbolMap
{
  if (latexSymbolMap_onceToken != -1)
    dispatch_once(&latexSymbolMap_onceToken, &__block_literal_global_2);
  return (id)latexSymbolMap_latexSymbolMap;
}

void __46__TypistLatexSymbolTranslation_latexSymbolMap__block_invoke()
{
  void *v0;

  v0 = (void *)latexSymbolMap_latexSymbolMap;
  latexSymbolMap_latexSymbolMap = (uint64_t)&unk_251A99588;

}

@end
