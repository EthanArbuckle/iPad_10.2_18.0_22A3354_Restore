@implementation MeasureApplication

- (MeasureApplication)init
{
  MeasureApplication *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MeasureApplication;
  result = -[MeasureApplication init](&v3, "init");
  if (result)
  {
    result->_overriddingStatusBarOrientation = 0;
    result->_overriddenStatusBarOrientation = 0;
  }
  return result;
}

+ (MeasureApplication)sharedApplication
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MeasureApplication;
  v2 = objc_msgSendSuper2(&v4, "sharedApplication");
  return (MeasureApplication *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)performWhileOverriddingStatusBarOrientation:(int64_t)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  _BOOL8 v7;
  int64_t v8;

  v6 = (void (**)(_QWORD))a4;
  v7 = -[MeasureApplication isOverriddingStatusBarOrientation](self, "isOverriddingStatusBarOrientation");
  v8 = -[MeasureApplication statusBarOrientation](self, "statusBarOrientation");
  -[MeasureApplication setOverriddingStatusBarOrientation:](self, "setOverriddingStatusBarOrientation:", 1);
  -[MeasureApplication setOverriddenStatusBarOrientation:](self, "setOverriddenStatusBarOrientation:", a3);
  v6[2](v6);

  -[MeasureApplication setOverriddingStatusBarOrientation:](self, "setOverriddingStatusBarOrientation:", v7);
  -[MeasureApplication setOverriddenStatusBarOrientation:](self, "setOverriddenStatusBarOrientation:", v8);
}

- (int64_t)statusBarOrientation
{
  objc_super v4;

  if (-[MeasureApplication isOverriddingStatusBarOrientation](self, "isOverriddingStatusBarOrientation"))
    return -[MeasureApplication overriddenStatusBarOrientation](self, "overriddenStatusBarOrientation");
  v4.receiver = self;
  v4.super_class = (Class)MeasureApplication;
  return -[MeasureApplication statusBarOrientation](&v4, "statusBarOrientation");
}

- (BOOL)isOverriddingStatusBarOrientation
{
  return self->_overriddingStatusBarOrientation;
}

- (void)setOverriddingStatusBarOrientation:(BOOL)a3
{
  self->_overriddingStatusBarOrientation = a3;
}

- (int64_t)overriddenStatusBarOrientation
{
  return self->_overriddenStatusBarOrientation;
}

- (void)setOverriddenStatusBarOrientation:(int64_t)a3
{
  self->_overriddenStatusBarOrientation = a3;
}

@end
