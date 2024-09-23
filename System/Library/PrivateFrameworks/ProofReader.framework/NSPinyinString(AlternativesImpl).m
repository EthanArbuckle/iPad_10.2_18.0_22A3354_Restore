@implementation NSPinyinString(AlternativesImpl)

+ (uint64_t)_alternativesForInputString:()AlternativesImpl
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return (uint64_t)-[AppleSpell spellServer:alternativesForPinyinInputString:](v4, "spellServer:alternativesForPinyinInputString:", 0, a3);
}

+ (uint64_t)_prefixesForInputString:()AlternativesImpl
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return (uint64_t)-[AppleSpell spellServer:prefixesForPinyinInputString:](v4, "spellServer:prefixesForPinyinInputString:", 0, a3);
}

+ (uint64_t)_correctionsForInputString:()AlternativesImpl
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return (uint64_t)-[AppleSpell spellServer:correctionsForPinyinInputString:](v4, "spellServer:correctionsForPinyinInputString:", 0, a3);
}

@end
