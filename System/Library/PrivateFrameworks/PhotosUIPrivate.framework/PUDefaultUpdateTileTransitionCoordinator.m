@implementation PUDefaultUpdateTileTransitionCoordinator

- (CGAffineTransform)_adjustDefaultDisappearanceTransform:(SEL)a3
{
  __int128 v4;
  CGAffineTransform v6;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tx = *(_OWORD *)&a4->tx;
  return CGAffineTransformScale(retstr, &v6, 0.75, 0.75);
}

@end
