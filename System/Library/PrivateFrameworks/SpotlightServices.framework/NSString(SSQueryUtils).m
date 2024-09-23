@implementation NSString(SSQueryUtils)

- (id)escapedStringForSearchQuery
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "decomposedStringWithCanonicalMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("\\'"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("*"), CFSTR("\\*"), 0, 0, objc_msgSend(v4, "length"));
  return v4;
}

@end
