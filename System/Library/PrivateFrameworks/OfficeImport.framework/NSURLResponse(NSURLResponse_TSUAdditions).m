@implementation NSURLResponse(NSURLResponse_TSUAdditions)

- (uint64_t)tsu_isHTTPSuccess
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = objc_opt_class();
  TSUDynamicCast(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "tsu_isSuccess");
  else
    v5 = 0;

  return v5;
}

@end
