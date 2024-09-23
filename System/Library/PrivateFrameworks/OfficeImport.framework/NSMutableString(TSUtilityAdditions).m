@implementation NSMutableString(TSUtilityAdditions)

- (void)tsu_appendCharacter:()TSUtilityAdditions
{
  UniChar chars;

  chars = a3;
  CFStringAppendCharacters(a1, &chars, 1);
}

- (void)tsu_insertCharacter:()TSUtilityAdditions atIndex:
{
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), a3);
  objc_msgSend(a1, "insertString:atIndex:", v6, a4);

}

- (uint64_t)tsu_appendSeparator:()TSUtilityAdditions format:
{
  if (objc_msgSend(a1, "length"))
    objc_msgSend(a1, "appendString:", a3);
  return objc_msgSend(a1, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringWithFormat:arguments:", a4, &a9));
}

@end
