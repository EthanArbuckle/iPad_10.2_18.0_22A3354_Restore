@implementation UITableView(Private)

- (void)sm_withPinsTableHeader:()Private
{
  objc_msgSend(a1, "_setPinsTableHeaderView:");
  return a1;
}

- (void)sm_withFloatingHeadersAndFooters:()Private
{
  objc_msgSend(a1, "_setHeaderAndFooterViewsFloat:");
  return a1;
}

@end
