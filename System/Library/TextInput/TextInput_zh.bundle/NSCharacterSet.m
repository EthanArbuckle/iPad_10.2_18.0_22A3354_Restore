@implementation NSCharacterSet

void __61__NSCharacterSet_ZhuyinAddition__zhuyinConsonantCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)zhuyinConsonantCharacterSet___zhuyinConsonantCharacterSet;
  zhuyinConsonantCharacterSet___zhuyinConsonantCharacterSet = v0;

}

void __58__NSCharacterSet_ZhuyinAddition__zhuyinMedialCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㄧㄨㄩ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)zhuyinMedialCharacterSet___zhuyinMedialCharacterSet;
  zhuyinMedialCharacterSet___zhuyinMedialCharacterSet = v0;

}

void __57__NSCharacterSet_ZhuyinAddition__zhuyinVowelCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)zhuyinVowelCharacterSet___zhuyinVowelCharacterSet;
  zhuyinVowelCharacterSet___zhuyinVowelCharacterSet = v0;

}

void __59__NSCharacterSet_ZhuyinAddition__zhuyinPhonemeCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙㄧㄨㄩㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)zhuyinPhonemeCharacterSet___zhuyinPhonemeCharacterSet;
  zhuyinPhonemeCharacterSet___zhuyinPhonemeCharacterSet = v0;

}

void __56__NSCharacterSet_ZhuyinAddition__zhuyinToneCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ˉˊˇˋ˙"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)zhuyinToneCharacterSet___zhuyinToneCharacterSet;
  zhuyinToneCharacterSet___zhuyinToneCharacterSet = v0;

}

void __52__NSCharacterSet_ZhuyinAddition__zhuyinCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙㄧㄨㄩㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦˉˊˇˋ˙"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)zhuyinCharacterSet___zhuyinCharacterSet;
  zhuyinCharacterSet___zhuyinCharacterSet = v0;

}

void __66__NSCharacterSet_ZhuyinAddition__punctuationAndSymbolCharacterSet__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD14A8], "symbolCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formUnionWithCharacterSet:", v2);

  v3 = (void *)punctuationAndSymbolCharacterSet___punctuationAndSymbolCharacterSet;
  punctuationAndSymbolCharacterSet___punctuationAndSymbolCharacterSet = (uint64_t)v1;

}

@end
