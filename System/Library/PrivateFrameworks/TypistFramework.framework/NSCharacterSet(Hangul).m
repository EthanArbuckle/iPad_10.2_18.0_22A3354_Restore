@implementation NSCharacterSet(Hangul)

+ (uint64_t)hangulHorizontalVowels
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㅗㅛㅜㅠㅡ"));
}

+ (uint64_t)hangulVerticalVowels
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㅏㅐㅑㅒㅓㅔㅕㅖㅣ"));
}

+ (uint64_t)hangulMixedVowels
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㅘㅙㅚㅝㅞㅟㅢ"));
}

+ (uint64_t)hangulLeadingConsonants
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ"));
}

+ (uint64_t)hangulTrailingConsonants
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ"));
}

+ (uint64_t)hangulConsonantVariants
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ㄱㄲㅋ"));
}

@end
