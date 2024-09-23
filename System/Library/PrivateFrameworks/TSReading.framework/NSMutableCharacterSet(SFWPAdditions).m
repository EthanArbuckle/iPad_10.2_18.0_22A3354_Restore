@implementation NSMutableCharacterSet(SFWPAdditions)

- (void)initWithCharacters:()SFWPAdditions length:
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", a3, a4);
    objc_msgSend(v6, "addCharactersInString:", v7);

  }
  return v6;
}

@end
