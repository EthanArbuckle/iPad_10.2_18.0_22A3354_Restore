@implementation NSString

- (id)mf_fancyRedactedString
{
  NSUInteger v2;
  __CFString *v3;

  v2 = -[NSString length](self, "length");
  if (v2)
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@; length = %lu]"),
                           CFSTR("<REDACTED>"),
                           v2));
  else
    v3 = CFSTR("[Empty String]");
  return v3;
}

@end
