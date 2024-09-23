@implementation NSString

id __81__NSString_UIFontPrivate__stringByStrippingLeadingAndTrailingWhitespaceAndQuotes__block_invoke()
{
  void *v0;
  id result;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceCharacterSet");
  objc_msgSend(v0, "addCharactersInString:", CFSTR("\"));
  result = (id)objc_msgSend(v0, "invertedSet");
  stringByStrippingLeadingAndTrailingWhitespaceAndQuotes_nonWhitespaceCharacterSet = (uint64_t)result;
  return result;
}

@end
