@implementation WDEndnoteIterator

- (BOOL)test:(id)a3
{
  return objc_msgSend(a3, "runType") == 2;
}

@end
