@implementation NSString(SZAdditions)

- (id)SZ_stringByDeletingTrailingSlashes
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByAppendingPathComponent:", CFSTR("XX_REMOVEME_XX"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
