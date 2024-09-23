@implementation PKBannerPresentableConfiguration

- (id)factory
{
  return self->_factory;
}

- (void)setFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (void)setDidStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didFinishHandler
{
  return self->_didFinishHandler;
}

- (void)setDidFinishHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
  objc_storeStrong(&self->_factory, 0);
}

@end
