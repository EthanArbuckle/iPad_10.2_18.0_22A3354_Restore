@implementation TSDMutableFrame

- (void)setAssetScale:(double)a3
{
  double v4;

  -[TSDFrameSpec i_minimumAssetScale](-[TSDFrame frameSpec](self, "frameSpec"), "i_minimumAssetScale");
  TSUClamp();
  if (self->super.mAssetScale != v4)
  {
    self->super.mAssetScale = v4;
    p_calculateDerivedValuesFromFrameSpecAndAssetScale(self->super.mSpec, &self->super.mLeftWidth, &self->super.mRightWidth, &self->super.mTopHeight, &self->super.mBottomHeight, (uint64_t)&self->super.mAdornmentSize, v4);
  }
}

@end
