@implementation PRSWallpaperLocationStateObserver

- (PRSWallpaperLocationStateObserver)init
{
  PRSWallpaperLocationStateObserver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRSWallpaperLocationStateObserver;
  result = -[PRSWallpaperLocationStateObserver init](&v3, sel_init);
  if (result)
  {
    result->_locations = 12;
    result->_needsSandboxExtensions = 1;
  }
  return result;
}

- (unint64_t)locations
{
  return self->_locations;
}

- (void)setLocations:(unint64_t)a3
{
  self->_locations = a3;
}

- (BOOL)needsSandboxExtensions
{
  return self->_needsSandboxExtensions;
}

- (void)setNeedsSandboxExtensions:(BOOL)a3
{
  self->_needsSandboxExtensions = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
