@implementation RadioMutableRecentStationsGroup

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RadioRecentStationsGroup _copyWithRecentStationsGroupClass:](self, "_copyWithRecentStationsGroupClass:", objc_opt_class());
}

- (void)setActive:(BOOL)a3
{
  self->super._active = a3;
}

- (void)setLocalizedTitle:(id)a3
{
  NSString *v4;
  NSString *localizedTitle;

  if (self->super._localizedTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    localizedTitle = self->super._localizedTitle;
    self->super._localizedTitle = v4;

  }
}

- (void)setStations:(id)a3
{
  NSArray *v4;
  NSArray *stations;

  if (self->super._stations != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    stations = self->super._stations;
    self->super._stations = v4;

  }
}

@end
