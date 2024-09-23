@implementation UIStatusBarSecondaryDataNetworkItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "rawData");
  return -[UIStatusBarDataNetworkItemView _updateWithData:networkType:](self, "_updateWithData:networkType:", v5, *(unsigned int *)(v5 + 2100));
}

@end
