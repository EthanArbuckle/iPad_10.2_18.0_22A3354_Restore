@implementation BICMemoryImageEntry

- (CGSize)imageSize
{
  float v3;
  double v4;
  float v5;
  double v6;
  double v7;
  CGSize result;

  -[BICMemoryImageEntry width](self, "width");
  v4 = v3;
  -[BICMemoryImageEntry height](self, "height");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double v5;

  height = a3.height;
  *(float *)&a3.width = a3.width;
  -[BICMemoryImageEntry setWidth:](self, "setWidth:", a3.width);
  *(float *)&v5 = height;
  -[BICMemoryImageEntry setHeight:](self, "setHeight:", v5);
}

- (void)deleteEntry
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BICMemoryImageEntry imageSet](self, "imageSet"));
  objc_msgSend(v3, "deleteEntry:", self);

}

- (id)entryLocationFromParameters
{
  void *v3;
  void *v4;
  signed int v5;
  float v6;
  uint64_t v7;
  float v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryImageEntry imageSet](self, "imageSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = -[BICMemoryImageEntry level](self, "level");
  -[BICMemoryImageEntry width](self, "width");
  v7 = (int)v6;
  -[BICMemoryImageEntry height](self, "height");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%d|%d|%d|%hd"), v4, v5, v7, (int)v8, -[BICMemoryImageEntry processingOptions](self, "processingOptions")));

  return v9;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryImageEntry expiry](self, "expiry"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryImageEntry expiry](self, "expiry"));
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 < 0.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
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

- (float)width
{
  return self->width;
}

- (void)setWidth:(float)a3
{
  self->width = a3;
}

- (float)height
{
  return self->height;
}

- (void)setHeight:(float)a3
{
  self->height = a3;
}

- (unsigned)processingOptions
{
  return self->processingOptions;
}

- (void)setProcessingOptions:(unsigned __int16)a3
{
  self->processingOptions = a3;
}

- (signed)level
{
  return self->level;
}

- (void)setLevel:(signed __int16)a3
{
  self->level = a3;
}

- (signed)state
{
  return self->state;
}

- (void)setState:(signed __int16)a3
{
  self->state = a3;
}

- (NSString)dataStoreInformation
{
  return self->dataStoreInformation;
}

- (void)setDataStoreInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unsigned)quality
{
  return self->quality;
}

- (void)setQuality:(unsigned __int16)a3
{
  self->quality = a3;
}

- (BOOL)potentialPrimary
{
  return self->potentialPrimary;
}

- (void)setPotentialPrimary:(BOOL)a3
{
  self->potentialPrimary = a3;
}

- (NSDate)lastUsed
{
  return self->lastUsed;
}

- (void)setLastUsed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)expiry
{
  return self->expiry;
}

- (void)setExpiry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)permanent
{
  return self->permanent;
}

- (void)setPermanent:(BOOL)a3
{
  self->permanent = a3;
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

- (unsigned)shadowHeight
{
  return self->shadowHeight;
}

- (void)setShadowHeight:(unsigned __int16)a3
{
  self->shadowHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->expiry, 0);
  objc_storeStrong((id *)&self->lastUsed, 0);
  objc_storeStrong((id *)&self->dataStoreInformation, 0);
  objc_storeStrong((id *)&self->imageSet, 0);
  objc_storeStrong((id *)&self->entryLocation, 0);
}

@end
