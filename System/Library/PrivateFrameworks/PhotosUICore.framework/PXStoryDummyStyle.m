@implementation PXStoryDummyStyle

- (PXStoryDummyStyle)init
{
  return -[PXStoryDummyStyle initWithConfiguration:](self, "initWithConfiguration:", &__block_literal_global_297355);
}

- (PXStoryDummyStyle)initWithConfiguration:(id)a3
{
  void (**v4)(id, _QWORD);
  PXStoryDummyStyle *v5;
  PXStoryDummyStyle *v6;
  CMTime v8;
  objc_super v9;

  v4 = (void (**)(id, _QWORD))a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryDummyStyle;
  v5 = -[PXStoryDummyStyle init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_cropVerticalContentMode = 0;
    v5->_cropMode = 0;
    v5->_defaultSegmentDuration = 3.0;
    CMTimeMakeWithSeconds(&v8, 1.5, 600);
    v6->_outroDuration = ($95D729B680665BEAEFA1D6FCA8238556)v8;
    ((void (**)(id, PXStoryDummyStyle *))v4)[2](v4, v6);
  }

  return v6;
}

- (id)createRandomNumberGenerators
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)timelineStyleWithSpec:(id)a3 resourcesDataSource:(id)a4 randomNumberGenerators:(id)a5 errorReporter:(id)a6
{
  id v7;
  double v8;
  void *v9;
  _PXStoryDummyTimelineStyle *v10;

  v7 = a3;
  objc_msgSend(v7, "viewportSize");
  PXSizeGetAspectRatio();
  if (v8 >= 1.0)
    -[PXStoryDummyStyle allowedClipCompositionsInLandscape](self, "allowedClipCompositionsInLandscape");
  else
    -[PXStoryDummyStyle allowedClipCompositionsInPortrait](self, "allowedClipCompositionsInPortrait");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_PXStoryDummyTimelineStyle initWithStyle:spec:allowedClipCompositions:]([_PXStoryDummyTimelineStyle alloc], "initWithStyle:spec:allowedClipCompositions:", self, v7, v9);

  return v10;
}

- (double)defaultSegmentDuration
{
  return self->_defaultSegmentDuration;
}

- (void)setDefaultSegmentDuration:(double)a3
{
  self->_defaultSegmentDuration = a3;
}

- (int64_t)cropVerticalContentMode
{
  return self->_cropVerticalContentMode;
}

- (void)setCropVerticalContentMode:(int64_t)a3
{
  self->_cropVerticalContentMode = a3;
}

- (int64_t)cropMode
{
  return self->_cropMode;
}

- (void)setCropMode:(int64_t)a3
{
  self->_cropMode = a3;
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (void)setOutroDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_outroDuration.epoch = a3->var3;
  *(_OWORD *)&self->_outroDuration.value = v3;
}

- (NSArray)allowedClipCompositionsInPortrait
{
  return self->_allowedClipCompositionsInPortrait;
}

- (void)setAllowedClipCompositionsInPortrait:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)allowedClipCompositionsInLandscape
{
  return self->_allowedClipCompositionsInLandscape;
}

- (void)setAllowedClipCompositionsInLandscape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)oneUpKenBurnsKind
{
  return self->_oneUpKenBurnsKind;
}

- (void)setOneUpKenBurnsKind:(int64_t)a3
{
  self->_oneUpKenBurnsKind = a3;
}

- (int64_t)twoUpKenBurnsKind
{
  return self->_twoUpKenBurnsKind;
}

- (void)setTwoUpKenBurnsKind:(int64_t)a3
{
  self->_twoUpKenBurnsKind = a3;
}

- (int64_t)threeUpKenBurnsKind
{
  return self->_threeUpKenBurnsKind;
}

- (void)setThreeUpKenBurnsKind:(int64_t)a3
{
  self->_threeUpKenBurnsKind = a3;
}

- (double)kenBurnsScale
{
  return self->_kenBurnsScale;
}

- (void)setKenBurnsScale:(double)a3
{
  self->_kenBurnsScale = a3;
}

- (unsigned)kenBurnsPanDirection
{
  return self->_kenBurnsPanDirection;
}

- (void)setKenBurnsPanDirection:(unsigned int)a3
{
  self->_kenBurnsPanDirection = a3;
}

- (double)kenBurnsDistance
{
  return self->_kenBurnsDistance;
}

- (void)setKenBurnsDistance:(double)a3
{
  self->_kenBurnsDistance = a3;
}

- (CGPoint)kenBurnsRelativeTransformOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_kenBurnsRelativeTransformOrigin.x;
  y = self->_kenBurnsRelativeTransformOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setKenBurnsRelativeTransformOrigin:(CGPoint)a3
{
  self->_kenBurnsRelativeTransformOrigin = a3;
}

- (double)kenBurnsRotationInDegrees
{
  return self->_kenBurnsRotationInDegrees;
}

- (void)setKenBurnsRotationInDegrees:(double)a3
{
  self->_kenBurnsRotationInDegrees = a3;
}

- (int64_t)twoUpSeparatorEffectKind
{
  return self->_twoUpSeparatorEffectKind;
}

- (void)setTwoUpSeparatorEffectKind:(int64_t)a3
{
  self->_twoUpSeparatorEffectKind = a3;
}

- (int64_t)threeUpSeparatorEffectKind
{
  return self->_threeUpSeparatorEffectKind;
}

- (void)setThreeUpSeparatorEffectKind:(int64_t)a3
{
  self->_threeUpSeparatorEffectKind = a3;
}

- (double)separatorPanDistance
{
  return self->_separatorPanDistance;
}

- (void)setSeparatorPanDistance:(double)a3
{
  self->_separatorPanDistance = a3;
}

- (double)separatorRotationAngle
{
  return self->_separatorRotationAngle;
}

- (void)setSeparatorRotationAngle:(double)a3
{
  self->_separatorRotationAngle = a3;
}

- ($C63E51281545771083DD8F52DBD4F646)transitionInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2.var1;
  *(_OWORD *)&retstr->var2.var1 = v3;
  *(_QWORD *)&retstr->var3 = *(_QWORD *)&self[5].var0;
  return self;
}

- (void)setTransitionInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2.var1;
  *(_QWORD *)&self->_transitionInfo.fallbackFromTransitionKind = *(_QWORD *)&a3->var3;
  *(_OWORD *)&self->_transitionInfo.orderOutTransition = v3;
  *(_OWORD *)&self->_transitionInfo.duration.timescale = v4;
}

- (BOOL)isCustomized
{
  return self->_isCustomized;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInLandscape, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInPortrait, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
}

@end
