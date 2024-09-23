@implementation NSHTTPURLResponse(NSHTTPURLResponse_TSUAdditions)

- (BOOL)tsu_isSuccess
{
  return objc_msgSend(a1, "statusCode") >= 200 && objc_msgSend(a1, "statusCode") < 300;
}

@end
