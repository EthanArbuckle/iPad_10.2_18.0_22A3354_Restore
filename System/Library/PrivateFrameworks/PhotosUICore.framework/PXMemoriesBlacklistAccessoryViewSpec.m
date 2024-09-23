@implementation PXMemoriesBlacklistAccessoryViewSpec

- (PXMemoriesBlacklistAccessoryViewSpec)initWithContentViewFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PXMemoriesBlacklistAccessoryViewSpec *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PXMemoriesBlacklistAccessoryViewSpec;
  result = -[PXMemoriesBlacklistAccessoryViewSpec init](&v8, sel_init);
  if (result)
  {
    result->_contentViewFrame.origin.x = x;
    result->_contentViewFrame.origin.y = y;
    result->_contentViewFrame.size.width = width;
    result->_contentViewFrame.size.height = height;
    result->_accessoryViewFrame.origin = (CGPoint)kDefaultAccessoryViewRect;
    result->_accessoryViewFrame.size = (CGSize)unk_1A7C0B6A8;
    result->_type = 0;
  }
  return result;
}

- (CGRect)contentViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentViewFrame.origin.x;
  y = self->_contentViewFrame.origin.y;
  width = self->_contentViewFrame.size.width;
  height = self->_contentViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)accessoryViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_accessoryViewFrame.origin.x;
  y = self->_accessoryViewFrame.origin.y;
  width = self->_accessoryViewFrame.size.width;
  height = self->_accessoryViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

+ (PXMemoriesBlacklistAccessoryViewSpec)specWithFrame:(CGRect)a3
{
  return -[PXMemoriesBlacklistAccessoryViewSpec initWithContentViewFrame:]([PXMemoriesBlacklistAccessoryViewSpec alloc], "initWithContentViewFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end
