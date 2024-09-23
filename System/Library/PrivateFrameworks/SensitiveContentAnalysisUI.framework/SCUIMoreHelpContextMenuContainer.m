@implementation SCUIMoreHelpContextMenuContainer

- (SCUIMoreHelpContextMenuContainer)initWithOptions:(int64_t)a3 interventionType:(int64_t)a4
{
  SCUIMoreHelpContextMenuContainer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCUIMoreHelpContextMenuContainer;
  result = -[SCUIMoreHelpContextMenuContainer init](&v7, sel_init);
  if (result)
  {
    result->_options = a3;
    result->_interventionType = a4;
  }
  return result;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)interventionType
{
  return self->_interventionType;
}

@end
