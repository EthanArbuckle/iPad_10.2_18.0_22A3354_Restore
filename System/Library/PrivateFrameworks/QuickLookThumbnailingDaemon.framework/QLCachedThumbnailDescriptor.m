@implementation QLCachedThumbnailDescriptor

- (float)size
{
  return self->_size;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (unint64_t)externalGeneratorDataHash
{
  return self->_externalGeneratorDataHash;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (QLCachedThumbnailDescriptor)initWithSize:(float)a3 iconMode:(BOOL)a4 badgeType:(unint64_t)a5 externalGeneratorDataHash:(unint64_t)a6
{
  QLCachedThumbnailDescriptor *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QLCachedThumbnailDescriptor;
  result = -[QLCachedThumbnailDescriptor init](&v11, sel_init);
  if (result)
  {
    result->_size = a3;
    result->_iconMode = a4;
    result->_badgeType = a5;
    result->_externalGeneratorDataHash = a6;
  }
  return result;
}

- (unint64_t)hash
{
  float size;
  unint64_t externalGeneratorDataHash;

  size = self->_size;
  externalGeneratorDataHash = self->_externalGeneratorDataHash;
  if (self->_iconMode)
    return self->_badgeType ^ externalGeneratorDataHash ^ (unint64_t)size;
  else
    return -(uint64_t)(self->_badgeType ^ externalGeneratorDataHash ^ (unint64_t)size);
}

- (BOOL)isEqual:(id)a3
{
  QLCachedThumbnailDescriptor *v4;
  QLCachedThumbnailDescriptor *v5;
  float size;
  float v7;
  _BOOL4 iconMode;
  unint64_t badgeType;
  int64_t iconVariant;
  int interpolationQuality;
  BOOL v12;

  v4 = (QLCachedThumbnailDescriptor *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      size = self->_size;
      -[QLCachedThumbnailDescriptor size](v5, "size");
      if (size == v7
        && (iconMode = self->_iconMode, iconMode == -[QLCachedThumbnailDescriptor iconMode](v5, "iconMode"))
        && (badgeType = self->_badgeType, badgeType == -[QLCachedThumbnailDescriptor badgeType](v5, "badgeType"))
        && (iconVariant = self->_iconVariant,
            iconVariant == -[QLCachedThumbnailDescriptor iconVariant](v5, "iconVariant")))
      {
        interpolationQuality = self->_interpolationQuality;
        v12 = interpolationQuality == -[QLCachedThumbnailDescriptor interpolationQuality](v5, "interpolationQuality");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (QLCachedThumbnailDescriptor)initWithThumbnailRequest:(id)a3
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "maximumPixelSize");
  v6 = v5;
  v7 = objc_msgSend(v4, "iconMode");
  v8 = objc_msgSend(v4, "badgeType");
  v9 = objc_msgSend(v4, "externalThumbnailGeneratorDataHash");

  LODWORD(v10) = v6;
  return -[QLCachedThumbnailDescriptor initWithSize:iconMode:badgeType:externalGeneratorDataHash:](self, "initWithSize:iconMode:badgeType:externalGeneratorDataHash:", v7, v8, v9, v10);
}

- (QLCachedThumbnailDescriptor)initWithSize:(float)a3 iconMode:(BOOL)a4 badgeType:(unint64_t)a5
{
  return -[QLCachedThumbnailDescriptor initWithSize:iconMode:badgeType:externalGeneratorDataHash:](self, "initWithSize:iconMode:badgeType:externalGeneratorDataHash:", a4, a5, 0);
}

- (void)setIconVariant:(int64_t)a3
{
  self->_iconVariant = a3;
}

- (void)setInterpolationQuality:(int)a3
{
  self->_interpolationQuality = a3;
}

- (void)setExternalGeneratorDataHash:(unint64_t)a3
{
  self->_externalGeneratorDataHash = a3;
}

@end
