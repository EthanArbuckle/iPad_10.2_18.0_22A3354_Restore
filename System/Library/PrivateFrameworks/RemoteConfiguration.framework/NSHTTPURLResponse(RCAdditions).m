@implementation NSHTTPURLResponse(RCAdditions)

- (BOOL)isSuccess
{
  return objc_msgSend(a1, "statusCode") >= 200 && objc_msgSend(a1, "statusCode") < 300
      || objc_msgSend(a1, "statusCode") == 304;
}

- (uint64_t)isFailure
{
  return objc_msgSend(a1, "isSuccess") ^ 1;
}

@end
