@implementation MFPColorAdjust

- (MFPColorAdjust)init
{
  MFPColorAdjust *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFPColorAdjust;
  result = -[MFPColorAdjust init](&v3, sel_init);
  if (result)
  {
    result->mColorMatrixFlags = -1;
    result->mGamma = -1.0;
    result->mThreshold = -1.0;
    result->mEnabled = 1;
  }
  return result;
}

- (void)dealloc
{
  MFPColorMatrix *mColorMatrix;
  MFPColorMatrix *mGrayMatrix;
  objc_super v5;

  mColorMatrix = self->mColorMatrix;
  if (mColorMatrix)
    MEMORY[0x22E2DD408](mColorMatrix, 0x1000C4093FC706DLL);
  mGrayMatrix = self->mGrayMatrix;
  if (mGrayMatrix)
    MEMORY[0x22E2DD408](mGrayMatrix, 0x1000C4093FC706DLL);
  v5.receiver = self;
  v5.super_class = (Class)MFPColorAdjust;
  -[MFPColorAdjust dealloc](&v5, sel_dealloc);
}

- (MFPColorMatrix)colorMatrix
{
  return self->mColorMatrix;
}

- (void)setColorMatrix:(MFPColorMatrix *)a3
{
  MFPColorMatrix *mColorMatrix;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  mColorMatrix = self->mColorMatrix;
  if (mColorMatrix)
    MEMORY[0x22E2DD408](mColorMatrix, 0x1000C4093FC706DLL);
  v6 = operator new();
  v7 = *(_OWORD *)&a3->var0[4][0];
  *(_OWORD *)(v6 + 64) = *(_OWORD *)&a3->var0[3][1];
  *(_OWORD *)(v6 + 80) = v7;
  *(float *)(v6 + 96) = a3->var0[4][4];
  v8 = *(_OWORD *)&a3->var0[0][4];
  *(_OWORD *)v6 = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)(v6 + 16) = v8;
  v9 = *(_OWORD *)&a3->var0[2][2];
  *(_OWORD *)(v6 + 32) = *(_OWORD *)&a3->var0[1][3];
  *(_OWORD *)(v6 + 48) = v9;
  self->mColorMatrix = (MFPColorMatrix *)v6;
}

- (MFPColorMatrix)grayMatrix
{
  return self->mGrayMatrix;
}

- (void)setGrayMatrix:(MFPColorMatrix *)a3
{
  MFPColorMatrix *mGrayMatrix;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  mGrayMatrix = self->mGrayMatrix;
  if (mGrayMatrix)
    MEMORY[0x22E2DD408](mGrayMatrix, 0x1000C4093FC706DLL);
  v6 = operator new();
  v7 = *(_OWORD *)&a3->var0[4][0];
  *(_OWORD *)(v6 + 64) = *(_OWORD *)&a3->var0[3][1];
  *(_OWORD *)(v6 + 80) = v7;
  *(float *)(v6 + 96) = a3->var0[4][4];
  v8 = *(_OWORD *)&a3->var0[0][4];
  *(_OWORD *)v6 = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)(v6 + 16) = v8;
  v9 = *(_OWORD *)&a3->var0[2][2];
  *(_OWORD *)(v6 + 32) = *(_OWORD *)&a3->var0[1][3];
  *(_OWORD *)(v6 + 48) = v9;
  self->mGrayMatrix = (MFPColorMatrix *)v6;
}

- (int)colorMatrixFlags
{
  return self->mColorMatrixFlags;
}

- (void)setColorMatrixFlags:(int)a3
{
  self->mColorMatrixFlags = a3;
}

- (id)transparentLow
{
  return self->mTransparentRangeLow;
}

- (id)transparentHigh
{
  return self->mTransparentRangeHigh;
}

- (void)setTransparentLow:(id)a3 high:(id)a4
{
  OITSUColor *v6;
  OITSUColor *v7;
  OITSUColor *mTransparentRangeLow;
  OITSUColor *mTransparentRangeHigh;
  OITSUColor *v10;

  v6 = (OITSUColor *)a3;
  v7 = (OITSUColor *)a4;
  mTransparentRangeLow = self->mTransparentRangeLow;
  self->mTransparentRangeLow = v6;
  v10 = v6;

  mTransparentRangeHigh = self->mTransparentRangeHigh;
  self->mTransparentRangeHigh = v7;

}

- (float)gamma
{
  return self->mGamma;
}

- (void)setGamma:(float)a3
{
  self->mGamma = a3;
}

- (id)recolorMap
{
  return self->mRecolorMap;
}

- (void)setRecolorMap:(id)a3
{
  objc_storeStrong((id *)&self->mRecolorMap, a3);
}

- (float)threshold
{
  return self->mThreshold;
}

- (void)setThreshold:(float)a3
{
  self->mThreshold = a3;
}

- (BOOL)isEnabled
{
  return self->mEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->mEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRecolorMap, 0);
  objc_storeStrong((id *)&self->mTransparentRangeHigh, 0);
  objc_storeStrong((id *)&self->mTransparentRangeLow, 0);
}

@end
