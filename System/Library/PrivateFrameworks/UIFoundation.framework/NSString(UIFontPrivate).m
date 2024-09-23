@implementation NSString(UIFontPrivate)

- (uint64_t)stringByStrippingLeadingAndTrailingWhitespaceAndQuotes
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;

  if (stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_onceToken != -1)
    dispatch_once(&stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_onceToken, &__block_literal_global_36);
  v2 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_nonWhitespaceCharacterSet, 0);
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_nonWhitespaceCharacterSet, 4);
  v5 = v3 + v4;
  result = (uint64_t)a1;
  if (v5 >= v2)
    return objc_msgSend(a1, "substringWithRange:", v2, v5 - v2);
  return result;
}

@end
