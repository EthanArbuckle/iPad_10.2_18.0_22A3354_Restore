@implementation PLResourceDataStoreOptions

- (BOOL)assumeNoExistingResources
{
  return self->_assumeNoExistingResources;
}

- (void)setAssumeNoExistingResources:(BOOL)a3
{
  self->_assumeNoExistingResources = a3;
}

@end
