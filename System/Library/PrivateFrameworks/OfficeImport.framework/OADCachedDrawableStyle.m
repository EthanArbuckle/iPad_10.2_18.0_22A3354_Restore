@implementation OADCachedDrawableStyle

- (OADCachedDrawableStyle)initWithFillCategory:(int)a3 mFillIndex:(unint64_t)a4 strokeIndex:(unint64_t)a5 shadowIndex:(unint64_t)a6 reflectionOpacity:(unsigned __int8)a7 textStyleIndex:(unint64_t)a8
{
  OADCachedDrawableStyle *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)OADCachedDrawableStyle;
  result = -[OADCachedDrawableStyle init](&v15, sel_init);
  if (result)
  {
    result->mFillCategory = a3;
    result->mFillIndex = a4;
    result->mStrokeIndex = a5;
    result->mShadowIndex = a6;
    result->mReflectionOpacity = a7;
    result->mTextStyleIndex = a8;
  }
  return result;
}

- (unint64_t)hash
{
  uint64x2_t v2;
  int8x16_t v3;

  v2.i64[0] = self->mShadowIndex;
  v2.i64[1] = self->mTextStyleIndex;
  v3 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)&self->mFillIndex, (uint64x2_t)xmmword_22A4BEA60), (int8x16_t)xmmword_22A4BEA70), vandq_s8((int8x16_t)vshlq_u64(v2, (uint64x2_t)xmmword_22A4BEA50), (int8x16_t)xmmword_22A4BEA80));
  return *(_QWORD *)&vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) | ((unint64_t)(self->mReflectionOpacity & 7) << 21) | self->mFillCategory & 3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  _DWORD *v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v6 = self->mFillCategory == v7[2]
      && self->mFillIndex == *((_QWORD *)v7 + 2)
      && self->mStrokeIndex == *((_QWORD *)v7 + 3)
      && self->mShadowIndex == *((_QWORD *)v7 + 4)
      && self->mReflectionOpacity == *((unsigned __int8 *)v7 + 40)
      && self->mTextStyleIndex == *((_QWORD *)v7 + 6);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)fillCategory
{
  return self->mFillCategory;
}

- (unint64_t)fillIndex
{
  return self->mFillIndex;
}

- (unint64_t)strokeIndex
{
  return self->mStrokeIndex;
}

- (unint64_t)shadowIndex
{
  return self->mShadowIndex;
}

- (unsigned)reflectionOpacity
{
  return self->mReflectionOpacity;
}

- (unint64_t)textStyleIndex
{
  return self->mTextStyleIndex;
}

@end
