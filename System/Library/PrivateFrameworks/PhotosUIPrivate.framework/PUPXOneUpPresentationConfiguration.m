@implementation PUPXOneUpPresentationConfiguration

- (PUPXOneUpPresentationConfiguration)init
{
  PUPXOneUpPresentationConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPXOneUpPresentationConfiguration;
  result = -[PUPXOneUpPresentationConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_animated = 1;
    result->_interactiveMode = 0;
    result->_activity = 0;
  }
  return result;
}

- (int64_t)pu_interactiveMode
{
  return -[PUPXOneUpPresentationConfiguration interactiveMode](self, "interactiveMode") == 1;
}

- (unint64_t)pu_activity
{
  unint64_t result;

  result = -[PUPXOneUpPresentationConfiguration activity](self, "activity");
  if (result != 2)
    return result == 1;
  return result;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (int64_t)interactiveMode
{
  return self->_interactiveMode;
}

- (void)setInteractiveMode:(int64_t)a3
{
  self->_interactiveMode = a3;
}

- (unint64_t)activity
{
  return self->_activity;
}

- (void)setActivity:(unint64_t)a3
{
  self->_activity = a3;
}

- (id)activityCompletion
{
  return self->_activityCompletion;
}

- (void)setActivityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityCompletion, 0);
}

@end
