@implementation LegacyTileCacheTombstone

- (BOOL)isDead
{
  return self->dead;
}

- (void)setDead:(BOOL)a3
{
  self->dead = a3;
}

@end
