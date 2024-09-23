@implementation NSHTTPURLResponse

- (BOOL)statusCodeIndicatesSucess
{
  return -[NSHTTPURLResponse statusCode](self, "statusCode") >= 200
      && -[NSHTTPURLResponse statusCode](self, "statusCode") < 300;
}

@end
