@implementation NSString(CRTextDecoder)

- (id)combinedTokenSequenceString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E98DC948);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFC"), CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
