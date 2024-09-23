@implementation SUScrollRequest

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScrollRequest;
  -[SUScrollRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSValue)contentOffsetValue
{
  return (NSValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentOffsetValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSValue)frameValue
{
  return (NSValue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFrameValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

@end
