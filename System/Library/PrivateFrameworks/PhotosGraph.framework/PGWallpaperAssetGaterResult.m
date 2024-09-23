@implementation PGWallpaperAssetGaterResult

- (BOOL)passesAnyGating
{
  return -[PGWallpaperAssetGaterResult passesSettlingEffect](self, "passesSettlingEffect")
      || -[PGWallpaperAssetGaterResult passesSegmentation](self, "passesSegmentation");
}

- (unint64_t)availableFeatures
{
  return -[PGWallpaperAssetGaterResult passesSettlingEffect](self, "passesSettlingEffect");
}

- (BOOL)passesSegmentation
{
  return self->_passesSegmentation;
}

- (void)setPassesSegmentation:(BOOL)a3
{
  self->_passesSegmentation = a3;
}

- (BOOL)passesSettlingEffect
{
  return self->_passesSettlingEffect;
}

- (void)setPassesSettlingEffect:(BOOL)a3
{
  self->_passesSettlingEffect = a3;
}

- (BOOL)didTimeout
{
  return self->_didTimeout;
}

- (void)setDidTimeout:(BOOL)a3
{
  self->_didTimeout = a3;
}

@end
