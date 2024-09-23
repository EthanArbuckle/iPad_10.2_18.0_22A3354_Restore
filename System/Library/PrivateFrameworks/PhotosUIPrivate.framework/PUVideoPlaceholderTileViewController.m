@implementation PUVideoPlaceholderTileViewController

- (id)loadView
{
  return -[PHPlaceholderView initWithType:]([PHPlaceholderView alloc], "initWithType:", 0);
}

@end
