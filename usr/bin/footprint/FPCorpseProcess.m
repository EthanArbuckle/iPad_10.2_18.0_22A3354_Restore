@implementation FPCorpseProcess

- (BOOL)_populateTask
{
  return self->super._task != 0;
}

- (BOOL)_isAlive
{
  return 0;
}

@end
