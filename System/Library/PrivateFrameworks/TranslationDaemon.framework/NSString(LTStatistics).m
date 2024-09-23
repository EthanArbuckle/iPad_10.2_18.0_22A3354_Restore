@implementation NSString(LTStatistics)

- (uint64_t)_ltRemoveAllWhitespaces
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\s"), &stru_251A15610, 1024, 0, objc_msgSend(a1, "length"));
}

- (id)_ltTrimWhitespaces
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
