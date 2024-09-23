@implementation WFActionDrawerImageLoadTask

- (void)cancel
{
  self->_canceled = 1;
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

@end
