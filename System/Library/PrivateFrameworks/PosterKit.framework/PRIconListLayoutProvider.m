@implementation PRIconListLayoutProvider

- (PRIconListLayoutProvider)initWithGridSize:(SBHIconGridSize)a3
{
  PRIconListLayoutProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRIconListLayoutProvider;
  result = -[PRIconListLayoutProvider init](&v5, sel_init);
  if (result)
    result->_gridSize = a3;
  return result;
}

- (id)layoutForIconLocation:(id)a3
{
  return -[_PRIconListLayout initWithGridSize:]([_PRIconListLayout alloc], "initWithGridSize:", *(_DWORD *)&self->_gridSize);
}

@end
