@implementation _RMSNowPlayingArtworkCacheItem

- (BOOL)beginContentAccess
{
  NSData *artworkData;

  artworkData = self->_artworkData;
  if (artworkData)
    self->_keepAlive = 1;
  return artworkData != 0;
}

- (void)endContentAccess
{
  self->_keepAlive = 0;
}

- (void)discardContentIfPossible
{
  NSData *artworkData;

  if (!self->_keepAlive)
  {
    artworkData = self->_artworkData;
    self->_artworkData = 0;

  }
}

- (BOOL)isContentDiscarded
{
  return self->_artworkData == 0;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_artworkIdentifier, a3);
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void)setArtworkData:(id)a3
{
  objc_storeStrong((id *)&self->_artworkData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
}

@end
