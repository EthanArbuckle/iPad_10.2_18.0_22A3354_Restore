@implementation SSFormattedCalculationExpression

void __SSFormattedCalculationExpression_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[=＝]\\s*$"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SSFormattedCalculationExpression_regex;
  SSFormattedCalculationExpression_regex = v0;

}

@end
