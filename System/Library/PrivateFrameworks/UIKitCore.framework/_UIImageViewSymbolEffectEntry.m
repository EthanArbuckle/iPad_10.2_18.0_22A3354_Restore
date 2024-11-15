@implementation _UIImageViewSymbolEffectEntry

- (NSSymbolEffect)symbolEffect
{
  return self->_symbolEffect;
}

- (void)setSymbolEffect:(id)a3
{
  objc_storeStrong((id *)&self->_symbolEffect, a3);
}

- (NSSymbolEffectOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)animated
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_symbolEffect, 0);
}

@end
