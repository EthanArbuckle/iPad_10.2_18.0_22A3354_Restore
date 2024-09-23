@implementation PHAsset

- (id)resourceType
{
  __CFString **v3;
  unsigned __int8 v4;

  if ((id)-[PHAsset mediaType](self, "mediaType") == (id)2)
  {
    v3 = &MOPhotoResourceTypeVideo;
  }
  else if ((id)-[PHAsset mediaType](self, "mediaType") == (id)1)
  {
    v4 = -[PHAsset mediaSubtypes](self, "mediaSubtypes");
    v3 = &MOPhotoResourceTypeLivePhoto;
    if ((v4 & 8) == 0)
      v3 = &MOPhotoResourceTypeStillPhoto;
  }
  else
  {
    v3 = &MOPhotoResourceTypeUnknown;
  }
  return *v3;
}

@end
