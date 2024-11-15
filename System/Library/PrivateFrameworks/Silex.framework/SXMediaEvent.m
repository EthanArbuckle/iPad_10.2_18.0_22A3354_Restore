@implementation SXMediaEvent

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)galleryType
{
  return self->_galleryType;
}

- (void)setGalleryType:(unint64_t)a3
{
  self->_galleryType = a3;
}

- (unint64_t)videoType
{
  return self->_videoType;
}

- (void)setVideoType:(unint64_t)a3
{
  self->_videoType = a3;
}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void)setMediaId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaId, a3);
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (void)setComponentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_componentIdentifier, a3);
}

- (NSString)componentType
{
  return self->_componentType;
}

- (void)setComponentType:(id)a3
{
  objc_storeStrong((id *)&self->_componentType, a3);
}

- (NSString)componentRole
{
  return self->_componentRole;
}

- (void)setComponentRole:(id)a3
{
  objc_storeStrong((id *)&self->_componentRole, a3);
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_componentRole, 0);
  objc_storeStrong((id *)&self->_componentType, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
}

@end
