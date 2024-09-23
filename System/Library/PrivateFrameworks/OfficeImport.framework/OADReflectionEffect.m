@implementation OADReflectionEffect

- (OADReflectionEffect)init
{
  OADReflectionEffect *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADReflectionEffect;
  result = -[OADEffect initWithType:](&v3, sel_initWithType_, 3);
  if (result)
  {
    *(&result->super.mType + 1) = 0;
    result->mBlurRadius = 1.0;
    result->mStartOpacity = 0.0;
    result->mStartPosition = 0.0;
    result->mEndOpacity = 0.25;
    result->mEndPosition = 1.0;
    result->mDistance = 90.0;
    result->mDirection = 90.0;
    result->mFadeDirection = 1.0;
    result->mXScale = -1.0;
    result->mYScale = 0.0;
    result->mXSkew = 0.0;
    LODWORD(result->mYSkew) = 7;
    LOBYTE(result->mAlignment) = 0;
  }
  return result;
}

- (void)setBlurRadius:(float)a3
{
  *((float *)&self->super.mType + 1) = a3;
}

- (void)setStartOpacity:(float)a3
{
  self->mBlurRadius = a3;
}

- (void)setEndPosition:(float)a3
{
  self->mEndOpacity = a3;
}

- (void)setDistance:(float)a3
{
  self->mEndPosition = a3;
}

- (void)setDirection:(float)a3
{
  self->mDistance = a3;
}

- (void)setYScale:(float)a3
{
  self->mXScale = a3;
}

- (void)setRotateWithShape:(BOOL)a3
{
  LOBYTE(self->mAlignment) = a3;
}

- (void)setAlignment:(int)a3
{
  LODWORD(self->mYSkew) = a3;
}

- (float)startOpacity
{
  return self->mBlurRadius;
}

- (void)setEndOpacity:(float)a3
{
  self->mStartPosition = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = *(&self->super.mType + 1);
  *((_DWORD *)result + 4) = LODWORD(self->mBlurRadius);
  *((_DWORD *)result + 5) = LODWORD(self->mStartOpacity);
  *((_DWORD *)result + 6) = LODWORD(self->mStartPosition);
  *((_DWORD *)result + 7) = LODWORD(self->mEndOpacity);
  *((_DWORD *)result + 8) = LODWORD(self->mEndPosition);
  *((_DWORD *)result + 9) = LODWORD(self->mDistance);
  *((_DWORD *)result + 10) = LODWORD(self->mDirection);
  *((_DWORD *)result + 11) = LODWORD(self->mFadeDirection);
  *((_DWORD *)result + 12) = LODWORD(self->mXScale);
  *((_DWORD *)result + 13) = LODWORD(self->mYScale);
  *((_DWORD *)result + 14) = LODWORD(self->mXSkew);
  *((_DWORD *)result + 15) = LODWORD(self->mYSkew);
  *((_BYTE *)result + 64) = self->mAlignment;
  return result;
}

- (float)blurRadius
{
  return *((float *)&self->super.mType + 1);
}

- (float)startPosition
{
  return self->mStartOpacity;
}

- (void)setStartPosition:(float)a3
{
  self->mStartOpacity = a3;
}

- (float)endOpacity
{
  return self->mStartPosition;
}

- (float)endPosition
{
  return self->mEndOpacity;
}

- (float)distance
{
  return self->mEndPosition;
}

- (float)direction
{
  return self->mDistance;
}

- (float)fadeDirection
{
  return self->mDirection;
}

- (void)setFadeDirection:(float)a3
{
  self->mDirection = a3;
}

- (float)xScale
{
  return self->mFadeDirection;
}

- (void)setXScale:(float)a3
{
  self->mFadeDirection = a3;
}

- (float)yScale
{
  return self->mXScale;
}

- (float)xSkew
{
  return self->mYScale;
}

- (void)setXSkew:(float)a3
{
  self->mYScale = a3;
}

- (float)ySkew
{
  return self->mXSkew;
}

- (void)setYSkew:(float)a3
{
  self->mXSkew = a3;
}

- (int)alignment
{
  return LODWORD(self->mYSkew);
}

- (BOOL)rotateWithShape
{
  return self->mAlignment;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  objc_super v5;

  v2 = (unint64_t)self->mBlurRadius ^ (unint64_t)*((float *)&self->super.mType + 1) ^ (unint64_t)self->mStartOpacity ^ (unint64_t)self->mStartPosition ^ (unint64_t)self->mEndOpacity ^ (unint64_t)self->mEndPosition ^ (unint64_t)self->mDistance ^ (unint64_t)self->mDirection ^ (unint64_t)self->mFadeDirection ^ (unint64_t)self->mXScale ^ (unint64_t)self->mYScale;
  v3 = (unint64_t)self->mXSkew ^ LODWORD(self->mYSkew) ^ LOBYTE(self->mAlignment);
  v5.receiver = self;
  v5.super_class = (Class)OADReflectionEffect;
  return v2 ^ v3 ^ -[OADEffect hash](&v5, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float v5;
  float v6;
  float mBlurRadius;
  float v8;
  float mStartOpacity;
  float v10;
  float mStartPosition;
  float v12;
  float mEndOpacity;
  float v14;
  float mEndPosition;
  float v16;
  float mDistance;
  float v18;
  float mDirection;
  float v20;
  float mFadeDirection;
  float v22;
  float mXScale;
  float v24;
  float mYScale;
  float v26;
  float mXSkew;
  float v28;
  float mYSkew;
  int mAlignment_low;
  BOOL v31;
  objc_super v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  v5 = *((float *)&self->super.mType + 1);
  objc_msgSend(v4, "blurRadius");
  if (v5 != v6)
    goto LABEL_17;
  mBlurRadius = self->mBlurRadius;
  objc_msgSend(v4, "startOpacity");
  if (mBlurRadius != v8)
    goto LABEL_17;
  mStartOpacity = self->mStartOpacity;
  objc_msgSend(v4, "startPosition");
  if (mStartOpacity != v10)
    goto LABEL_17;
  mStartPosition = self->mStartPosition;
  objc_msgSend(v4, "endOpacity");
  if (mStartPosition != v12)
    goto LABEL_17;
  mEndOpacity = self->mEndOpacity;
  objc_msgSend(v4, "endPosition");
  if (mEndOpacity != v14)
    goto LABEL_17;
  mEndPosition = self->mEndPosition;
  objc_msgSend(v4, "distance");
  if (mEndPosition != v16)
    goto LABEL_17;
  mDistance = self->mDistance;
  objc_msgSend(v4, "direction");
  if (mDistance != v18)
    goto LABEL_17;
  mDirection = self->mDirection;
  objc_msgSend(v4, "fadeDirection");
  if (mDirection != v20)
    goto LABEL_17;
  mFadeDirection = self->mFadeDirection;
  objc_msgSend(v4, "xScale");
  if (mFadeDirection != v22)
    goto LABEL_17;
  mXScale = self->mXScale;
  objc_msgSend(v4, "yScale");
  if (mXScale != v24)
    goto LABEL_17;
  mYScale = self->mYScale;
  objc_msgSend(v4, "xSkew");
  if (mYScale == v26
    && (mXSkew = self->mXSkew, objc_msgSend(v4, "ySkew"), mXSkew == v28)
    && (mYSkew = self->mYSkew, LODWORD(mYSkew) == objc_msgSend(v4, "alignment"))
    && (mAlignment_low = LOBYTE(self->mAlignment), mAlignment_low == objc_msgSend(v4, "rotateWithShape")))
  {
    v33.receiver = self;
    v33.super_class = (Class)OADReflectionEffect;
    v31 = -[OADEffect isEqual:](&v33, sel_isEqual_, v4);
  }
  else
  {
LABEL_17:
    v31 = 0;
  }

  return v31;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADReflectionEffect;
  -[OADEffect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
