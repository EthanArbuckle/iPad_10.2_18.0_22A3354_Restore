@implementation _BCPPTFlawlessImageEntry

+ (id)entry
{
  return _objc_msgSend(a1, "entryOfSize:", CGSizeZero.width, CGSizeZero.height);
}

+ (id)entryOfSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  void *v6;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init((Class)objc_opt_class(a1));
  objc_msgSend(v5, "setImageSize:", width, height);
  objc_msgSend(v5, "setLevel:", 0);
  objc_msgSend(v5, "setQuality:", 207);
  objc_msgSend(v5, "setPotentialPrimary:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_BCPPTImageSet imageSetWithEntry:](_BCPPTImageSet, "imageSetWithEntry:", v5));
  objc_msgSend(v5, "setImageSet:", v6);

  return v5;
}

- (BOOL)isExpired
{
  return 0;
}

- (id)entryLocationFromParameters
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  return v3;
}

- (NSString)dataStoreInformation
{
  return self->dataStoreInformation;
}

- (void)setDataStoreInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)entryLocation
{
  return self->entryLocation;
}

- (void)setEntryLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BICImageSetProtocol)imageSet
{
  return self->imageSet;
}

- (void)setImageSet:(id)a3
{
  objc_storeStrong((id *)&self->imageSet, a3);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->imageSize.width;
  height = self->imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->imageSize = a3;
}

- (signed)level
{
  return self->level;
}

- (void)setLevel:(signed __int16)a3
{
  self->level = a3;
}

- (unsigned)processingOptions
{
  return self->processingOptions;
}

- (void)setProcessingOptions:(unsigned __int16)a3
{
  self->processingOptions = a3;
}

- (unsigned)quality
{
  return self->quality;
}

- (void)setQuality:(unsigned __int16)a3
{
  self->quality = a3;
}

- (signed)state
{
  return self->state;
}

- (void)setState:(signed __int16)a3
{
  self->state = a3;
}

- (NSDate)expiry
{
  return self->expiry;
}

- (void)setExpiry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)lastUsed
{
  return self->lastUsed;
}

- (void)setLastUsed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)potentialPrimary
{
  return self->potentialPrimary;
}

- (void)setPotentialPrimary:(BOOL)a3
{
  self->potentialPrimary = a3;
}

- (unsigned)shadowHeight
{
  return self->shadowHeight;
}

- (void)setShadowHeight:(unsigned __int16)a3
{
  self->shadowHeight = a3;
}

- (unsigned)shadowLeft
{
  return self->shadowLeft;
}

- (void)setShadowLeft:(unsigned __int16)a3
{
  self->shadowLeft = a3;
}

- (unsigned)shadowTop
{
  return self->shadowTop;
}

- (void)setShadowTop:(unsigned __int16)a3
{
  self->shadowTop = a3;
}

- (unsigned)shadowWidth
{
  return self->shadowWidth;
}

- (void)setShadowWidth:(unsigned __int16)a3
{
  self->shadowWidth = a3;
}

- (BOOL)permanent
{
  return self->permanent;
}

- (void)setPermanent:(BOOL)a3
{
  self->permanent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastUsed, 0);
  objc_storeStrong((id *)&self->expiry, 0);
  objc_storeStrong((id *)&self->imageSet, 0);
  objc_storeStrong((id *)&self->entryLocation, 0);
  objc_storeStrong((id *)&self->dataStoreInformation, 0);
}

@end
