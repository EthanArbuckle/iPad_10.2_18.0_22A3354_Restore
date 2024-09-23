@implementation NSMutableString(SCRCMathLatex)

- (uint64_t)addMathIndicators
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    objc_msgSend(a1, "insertString:atIndex:", CFSTR("$"), 0);
    return objc_msgSend(a1, "appendString:", CFSTR("$"));
  }
  return result;
}

@end
