@implementation MapsUIImageSpec

- (BOOL)useSearchImageFallback
{
  return 0;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(BOOL)a3
{
  self->_nightMode = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

@end
