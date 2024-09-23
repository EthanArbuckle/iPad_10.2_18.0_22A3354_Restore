@implementation _PLViewControllerOneToOneTransitionContext

- (CGAffineTransform)targetTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].ty;
  return self;
}

- (void)setTargetTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_targetTransform.c = v4;
  *(_OWORD *)&self->_targetTransform.tx = v3;
}

@end
