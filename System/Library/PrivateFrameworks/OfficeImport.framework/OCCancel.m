@implementation OCCancel

- (OCCancel)init
{
  OCCancel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OCCancel;
  result = -[OCCancel init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->mIsCancelled = 0;
  return result;
}

- (void)cancel
{
  self->mIsCancelled = 1;
}

- (BOOL)isCancelled
{
  return self->mIsCancelled;
}

- (void)quit
{
  *(_WORD *)&self->mIsCancelled = 257;
}

- (BOOL)isQuit
{
  return self->mIsQuit;
}

@end
