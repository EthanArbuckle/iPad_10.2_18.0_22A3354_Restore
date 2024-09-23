@implementation NSString(SCRCMathLatex)

- (id)stringWithMathIndicators
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_msgSend(a1, "copy");
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("$%@$"), v1);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  return v1;
}

@end
