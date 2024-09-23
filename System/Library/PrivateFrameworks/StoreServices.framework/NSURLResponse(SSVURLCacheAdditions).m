@implementation NSURLResponse(SSVURLCacheAdditions)

- (BOOL)ssv_isExpiredResponse
{
  CFAbsoluteTime v1;

  objc_msgSend(a1, "_calculatedExpiration");
  return v1 < CFAbsoluteTimeGetCurrent();
}

@end
