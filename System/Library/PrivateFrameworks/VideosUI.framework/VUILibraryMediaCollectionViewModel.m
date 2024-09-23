@implementation VUILibraryMediaCollectionViewModel

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  -[VUILibraryMediaCollectionViewModel seasonViewModels](self, "seasonViewModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)seasonViewModels
{
  return self->_seasonViewModels;
}

- (void)setSeasonViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_seasonViewModels, a3);
}

- (NSDictionary)seasonBySeasonIdentifier
{
  return self->_seasonBySeasonIdentifier;
}

- (void)setSeasonBySeasonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_seasonBySeasonIdentifier, a3);
}

- (NSDictionary)episodeShelfViewControllerBySeasonIdentifier
{
  return self->_episodeShelfViewControllerBySeasonIdentifier;
}

- (void)setEpisodeShelfViewControllerBySeasonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_episodeShelfViewControllerBySeasonIdentifier, a3);
}

- (NSDictionary)productLockupViewBySeasonIdentifier
{
  return self->_productLockupViewBySeasonIdentifier;
}

- (void)setProductLockupViewBySeasonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_productLockupViewBySeasonIdentifier, a3);
}

- (NSDictionary)episodesBySeasonIdentifer
{
  return self->_episodesBySeasonIdentifer;
}

- (void)setEpisodesBySeasonIdentifer:(id)a3
{
  objc_storeStrong((id *)&self->_episodesBySeasonIdentifer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodesBySeasonIdentifer, 0);
  objc_storeStrong((id *)&self->_productLockupViewBySeasonIdentifier, 0);
  objc_storeStrong((id *)&self->_episodeShelfViewControllerBySeasonIdentifier, 0);
  objc_storeStrong((id *)&self->_seasonBySeasonIdentifier, 0);
  objc_storeStrong((id *)&self->_seasonViewModels, 0);
}

@end
