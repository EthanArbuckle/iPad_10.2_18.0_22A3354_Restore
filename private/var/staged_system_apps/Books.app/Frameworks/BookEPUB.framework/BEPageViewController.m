@implementation BEPageViewController

- (BOOL)_shouldNavigateInDirection:(int64_t *)a3 inResponseToVelocity:(double *)a4 ofGestureRecognizedByPanGestureRecognizer:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEPageViewController;
  return -[BEPageViewController _shouldNavigateInDirection:inResponseToVelocity:ofGestureRecognizedByPanGestureRecognizer:](&v6, "_shouldNavigateInDirection:inResponseToVelocity:ofGestureRecognizedByPanGestureRecognizer:", a3, a4, a5);
}

- (BOOL)_shouldNavigateInDirection:(int64_t *)a3 inResponseToTapGestureRecognizer:(id)a4
{
  _BOOL4 v6;
  int64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BEPageViewController;
  v6 = -[BEPageViewController _shouldNavigateInDirection:inResponseToTapGestureRecognizer:](&v9, "_shouldNavigateInDirection:inResponseToTapGestureRecognizer:", a3, a4);
  if (v6)
  {
    v7 = -[BEPageViewController validateTapDirection:](self, "validateTapDirection:", *a3);
    *a3 = v7;
    LOBYTE(v6) = -[BEPageViewController canNavigateInDirection:](self, "canNavigateInDirection:", v7);
  }
  return v6;
}

- (BOOL)_shouldBeginNavigationInDirection:(int64_t *)a3 inResponseToPanGestureRecognizer:(id)a4
{
  _BOOL4 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BEPageViewController;
  v6 = -[BEPageViewController _shouldBeginNavigationInDirection:inResponseToPanGestureRecognizer:](&v8, "_shouldBeginNavigationInDirection:inResponseToPanGestureRecognizer:", a3, a4);
  if (v6)
    LOBYTE(v6) = -[BEPageViewController canNavigateInDirection:](self, "canNavigateInDirection:", *a3);
  return v6;
}

- (int64_t)validateTapDirection:(int64_t)a3
{
  return a3;
}

- (BOOL)canNavigateInDirection:(int64_t)a3
{
  return 1;
}

@end
