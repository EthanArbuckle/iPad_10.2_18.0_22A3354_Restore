@implementation _UIRBSymbolAnimationConfiguration

- (unsigned)animation
{
  return self->_animation;
}

- (void)setAnimation:(unsigned int)a3
{
  self->_animation = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
