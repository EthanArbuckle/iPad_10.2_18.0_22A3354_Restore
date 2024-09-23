@implementation NSMutableString(TSUDescription)

- (void)tsu_indentBy:()TSUDescription
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(CFSTR("          "), "mutableCopy");
  v6 = v5;
  while (objc_msgSend(v5, "length") < a3)
  {
    objc_msgSend(v6, "appendString:", v6);
    v5 = v6;
  }
  objc_msgSend(v6, "deleteCharactersInRange:", a3, objc_msgSend(v6, "length") - a3);
  objc_msgSend(a1, "insertString:atIndex:", v6, 0);
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), v6), 0, 0, objc_msgSend(a1, "length"));

}

@end
