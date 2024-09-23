@implementation NSMutableAttributedString(VSSpeechAdditions)

- (uint64_t)appendString:()VSSpeechAdditions withAttributes:
{
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend(a3, "length");
  v8 = objc_msgSend(a1, "length");
  objc_msgSend(a1, "replaceCharactersInRange:withString:", v8, 0, a3);
  return objc_msgSend(a1, "setAttributes:range:", a4, v8, v7);
}

@end
