@implementation UINavigationItem(Additions)

- (uint64_t)setStackedSearchBarPlacement
{
  return objc_msgSend(a1, "_dci_setPreferredSearchBarPlacement:", 2);
}

@end
