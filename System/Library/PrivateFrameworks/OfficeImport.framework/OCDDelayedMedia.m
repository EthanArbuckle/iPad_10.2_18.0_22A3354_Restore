@implementation OCDDelayedMedia

- (BOOL)saveMediaToFile:(id)a3
{
  id v4;
  BOOL v5;
  OCDDelayedNodeContext *mDelayedContext;

  v4 = a3;
  if (-[OCDDelayedNode isLoaded](self, "isLoaded"))
  {
    v5 = 1;
  }
  else if (-[OCDDelayedNodeContext saveDelayedMedia:toFile:](self->super.mDelayedContext, "saveDelayedMedia:toFile:", self, v4))
  {
    mDelayedContext = self->super.mDelayedContext;
    self->super.mDelayedContext = 0;

    v5 = 1;
    self->super.mLoaded = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
