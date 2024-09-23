@implementation PASRemoveSomePunctuation

CFCharacterSetRef ___PASRemoveSomePunctuation_block_invoke()
{
  CFCharacterSetRef result;

  result = CFCharacterSetCreateWithCharactersInString(0, CFSTR("\"\\/'<>"));
  _PASRemoveSomePunctuation_charset = (uint64_t)result;
  return result;
}

@end
