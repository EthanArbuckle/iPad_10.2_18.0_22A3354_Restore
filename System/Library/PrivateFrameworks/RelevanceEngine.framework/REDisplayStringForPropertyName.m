@implementation REDisplayStringForPropertyName

void __REDisplayStringForPropertyName_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([a-z])([A-Z])"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REDisplayStringForPropertyName_CamelCaseRegex;
  REDisplayStringForPropertyName_CamelCaseRegex = v0;

}

@end
