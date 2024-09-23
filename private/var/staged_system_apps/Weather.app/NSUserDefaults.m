@implementation NSUserDefaults

- (BOOL)weather_vfx_animatedBackgrounds_enabled
{
  NSUserDefaults *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1008FDCC0();

  return v3 & 1;
}

- (void)setWeather_vfx_animatedBackgrounds_enabled:(BOOL)a3
{
  NSUserDefaults *v3;

  v3 = self;
  sub_1008FDD58();

}

@end
