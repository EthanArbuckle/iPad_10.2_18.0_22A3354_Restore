@implementation UIViewController(StocksUI)

- (BOOL)su_isAppeared
{
  return objc_msgSend(a1, "_appearState") == 2;
}

@end
