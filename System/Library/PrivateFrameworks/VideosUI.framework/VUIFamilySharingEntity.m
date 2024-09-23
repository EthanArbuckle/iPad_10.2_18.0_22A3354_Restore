@implementation VUIFamilySharingEntity

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (VUIMediaEntityType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (void)setShowTitle:(id)a3
{
  objc_storeStrong((id *)&self->_showTitle, a3);
}

- (NSString)genreTitle
{
  return self->_genreTitle;
}

- (void)setGenreTitle:(id)a3
{
  objc_storeStrong((id *)&self->_genreTitle, a3);
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (NSString)iTunesExtrasUrl
{
  return self->_iTunesExtrasUrl;
}

- (void)setITunesExtrasUrl:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesExtrasUrl, a3);
}

- (NSString)previewArtworkURL
{
  return self->_previewArtworkURL;
}

- (void)setPreviewArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewArtworkURL, a3);
}

- (NSString)standardDescription
{
  return self->_standardDescription;
}

- (void)setStandardDescription:(id)a3
{
  objc_storeStrong((id *)&self->_standardDescription, a3);
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
  objc_storeStrong((id *)&self->_seasonNumber, a3);
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_episodeNumber, a3);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
  objc_storeStrong((id *)&self->_contentRating, a3);
}

- (VUIFamilySharingRelationships)relationships
{
  return self->_relationships;
}

- (void)setRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_relationships, a3);
}

- (WLKOfferListing)offerListing
{
  return self->_offerListing;
}

- (void)setOfferListing:(id)a3
{
  objc_storeStrong((id *)&self->_offerListing, a3);
}

- (WLKOfferListing)personalizedOfferListing
{
  return self->_personalizedOfferListing;
}

- (void)setPersonalizedOfferListing:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedOfferListing, a3);
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_personalizedOfferListing, 0);
  objc_storeStrong((id *)&self->_offerListing, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_standardDescription, 0);
  objc_storeStrong((id *)&self->_previewArtworkURL, 0);
  objc_storeStrong((id *)&self->_iTunesExtrasUrl, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_genreTitle, 0);
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
