@implementation TSKToolbarSpace

+ (id)spaceWithWidth:(double)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setWidth:", a3);
  return v4;
}

- (BOOL)isEnabled
{
  return 0;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

@end
