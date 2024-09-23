@implementation PBOutlineBulletKey

- (PBOutlineBulletKey)initWithOutlineBullet:(id)a3
{
  id v4;
  const void *v5;
  unsigned int *v6;
  PBOutlineBulletKey *v7;

  v4 = a3;
  v5 = (const void *)objc_msgSend(v4, "eshObject");
  if (v5
  {
    self = -[PBOutlineBulletKey initWithSlideId:textType:placeholderIndex:](self, "initWithSlideId:textType:placeholderIndex:", v6[12], v6[13], EshRecord::getInstance((EshRecord *)v6));
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PBOutlineBulletKey)initWithSlideId:(unsigned int)a3 textType:(int)a4 placeholderIndex:(unsigned int)a5
{
  PBOutlineBulletKey *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBOutlineBulletKey;
  result = -[PBOutlineBulletKey init](&v9, sel_init);
  if (result)
  {
    result->mSlideId = a3;
    result->mTextType = a4;
    result->mPlaceholderIndex = a5;
  }
  return result;
}

- (unint64_t)hash
{
  return (LOBYTE(self->mTextType) << 16) | (self->mPlaceholderIndex << 24) | LOWORD(self->mSlideId);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = self->mSlideId == v5[2] && self->mTextType == v5[3] && self->mPlaceholderIndex == v5[4];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
