@implementation VideosExtrasSlideshowArtworkCatalogHelper

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCatalog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
}

@end
