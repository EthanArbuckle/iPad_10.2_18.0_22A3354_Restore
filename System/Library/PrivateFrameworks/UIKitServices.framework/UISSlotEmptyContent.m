@implementation UISSlotEmptyContent

+ (id)contentWithSize:(CGSize)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:", a3.width, a3.height);
}

- (UISSlotEmptyContent)initWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  UISSlotEmptyContent *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)UISSlotEmptyContent;
  result = -[UISSlotEmptyContent init](&v6, sel_init);
  if (result)
  {
    result->_contentSize.width = width;
    result->_contentSize.height = height;
  }
  return result;
}

- (unsigned)contentScale
{
  return 1;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isRemote
{
  return 0;
}

- (BOOL)shouldReplaceExistingContent
{
  return 0;
}

- (id)image
{
  return 0;
}

@end
