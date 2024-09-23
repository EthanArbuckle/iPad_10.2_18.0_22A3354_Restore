@implementation NSValue(FstArc)

+ (id)valueWithArc:()FstArc
{
  uint64_t v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v4, "{_FstArc=ii}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)arcValue
{
  uint64_t v2;

  objc_msgSend(a1, "getValue:", &v2);
  return v2;
}

@end
