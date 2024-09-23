@implementation _UIViewKeyValueAnimationFactoryTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAnimation, 0);
  objc_storeStrong((id *)&self->_fromAnimation, 0);
}

- (CABasicAnimation)toAnimation
{
  return self->_toAnimation;
}

- (void)setFromAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_fromAnimation, a3);
}

- (CABasicAnimation)fromAnimation
{
  return self->_fromAnimation;
}

- (void)setToAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_toAnimation, a3);
}

@end
