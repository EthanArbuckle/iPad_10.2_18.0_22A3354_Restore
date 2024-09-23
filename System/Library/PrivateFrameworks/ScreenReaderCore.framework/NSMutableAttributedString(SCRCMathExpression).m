@implementation NSMutableAttributedString(SCRCMathExpression)

- (void)scrcAppendFormat:()SCRCMathExpression
{
  void *v10;

  objc_msgSend(MEMORY[0x24BDD1458], "_scrcStringWithFormat:args:", a3, &a9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendAttributedString:", v10);

}

@end
