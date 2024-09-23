@implementation _SVXMainQueuePerformer

- (BOOL)_isExecutingInContext
{
  return pthread_main_np() != 0;
}

@end
