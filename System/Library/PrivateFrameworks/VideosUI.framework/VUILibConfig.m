@implementation VUILibConfig

- (void)setCollectionItemLimit:(int64_t)a3
{
  self->_collectionItemLimit = a3;
}

- (VUILibConfig)init
{
  VUILibConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILibConfig;
  result = -[VUILibConfig init](&v3, sel_init);
  if (result)
    result->_collectionItemLimit = 2000;
  return result;
}

- (int64_t)collectionItemLimit
{
  return self->_collectionItemLimit;
}

@end
