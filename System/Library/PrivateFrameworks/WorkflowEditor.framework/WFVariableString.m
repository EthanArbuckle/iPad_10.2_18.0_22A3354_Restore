@implementation WFVariableString

id __63__WFVariableString_AttributedString__initWithAttributedString___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB318], a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "variable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end
