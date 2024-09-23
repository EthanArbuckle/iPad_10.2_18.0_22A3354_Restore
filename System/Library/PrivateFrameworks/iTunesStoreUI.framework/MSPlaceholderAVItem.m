@implementation MSPlaceholderAVItem

- (MSPlaceholderAVItem)initWithAVItemType:(int64_t)a3
{
  MSPlaceholderAVItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSPlaceholderAVItem;
  result = -[MSPlaceholderAVItem init](&v5, sel_init);
  if (result)
    result->_itemType = a3;
  return result;
}

- (int64_t)type
{
  return self->_itemType;
}

@end
