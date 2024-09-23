@implementation PXStoryConcreteThumbnailOnlyStyle

- (PXStoryConcreteThumbnailOnlyStyle)init
{
  return -[PXStoryConcreteThumbnailOnlyStyle initWithCustomColorGradeKind:originalColorGradeCategory:](self, "initWithCustomColorGradeKind:originalColorGradeCategory:", 0, 0);
}

- (PXStoryConcreteThumbnailOnlyStyle)initWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4
{
  id v7;
  PXStoryConcreteThumbnailOnlyStyle *v8;
  PXStoryConcreteThumbnailOnlyStyle *v9;
  void *v10;
  uint64_t v11;
  NSArray *allowedClipCompositions;
  CMTime v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryConcreteThumbnailOnlyStyle;
  v8 = -[PXStoryConcreteThumbnailOnlyStyle init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_customColorGradeKind = a3;
    objc_storeStrong((id *)&v8->_originalColorGradeCategory, a4);
    CMTimeMakeWithSeconds(&v14, 42.0, 600);
    v9->_defaultDisplayAssetPresentationDuration = ($95D729B680665BEAEFA1D6FCA8238556)v14;
    +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    allowedClipCompositions = v9->_allowedClipCompositions;
    v9->_allowedClipCompositions = (NSArray *)v11;

    CMTimeMakeWithSeconds(&v14, 42.0, 600);
    v9->_outroDuration = ($95D729B680665BEAEFA1D6FCA8238556)v14;
  }

  return v9;
}

- (PXStorySongResource)songResource
{
  return 0;
}

- (PXAudioCueSource)cueSource
{
  return 0;
}

- (BOOL)isCustomized
{
  return 0;
}

- (id)createRandomNumberGenerators
{
  return (id)MEMORY[0x1E0C9AA60];
}

- ($F6BA6A5CD79A8D3CC60DB9DEA7616E28)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4
{
  $F6BA6A5CD79A8D3CC60DB9DEA7616E28 *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  result = -[PXStoryConcreteThumbnailOnlyStyle defaultDisplayAssetPresentationDuration](self, "defaultDisplayAssetPresentationDuration", a4, a5);
  retstr->var1 = v7;
  retstr->var0.var3 = 0;
  *(_OWORD *)&retstr->var0.var0 = PXStoryTimeZero;
  retstr->var2.var3 = 0;
  *(_OWORD *)&retstr->var2.var0 = PXStoryTimeMaximum;
  *(_OWORD *)&retstr->var3.var0.var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var3 = 0u;
  retstr->var4 = 0;
  return result;
}

- (id)clipCompositionForKeyAsset:(id)a3 contentInfo:(id *)a4 finalPlaybackStyle:(int64_t)a5
{
  return +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition", a3, a4, a5);
}

- (id)allowedClipCompositionsWithStartTime:(id *)a3 nextDisplayAssets:(id)a4
{
  return self->_allowedClipCompositions;
}

- (double)composabilityScoreForSegmentWithDisplayAssets:(id)a3
{
  return 0.0;
}

- ($60B83496CA56D3588CF925FE7FBD90DC)contentInfoForDisplayAsset:(SEL)a3
{
  $60B83496CA56D3588CF925FE7FBD90DC *result;

  PXStoryStyleDefaultContentInfoForDisplayAsset(a4, (uint64_t)retstr);
  return result;
}

- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3
{
  return 0;
}

- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4
{
  if (a4 == 4)
    return 1;
  else
    return a4;
}

- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3
{
  return a3;
}

- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9
{
  (*((void (**)(id, _QWORD, _QWORD))a9 + 2))(a9, 0, 0);
}

- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12
{
  (*((void (**)(id, _QWORD))a12 + 2))(a12, 0);
}

- ($C63E51281545771083DD8F52DBD4F646)transitionInfoForSegmentWithClipComposition:(SEL)a3 displayAssets:(id)a4
{
  *(_QWORD *)&retstr->var3 = 0;
  *(_OWORD *)&retstr->var0 = PXStoryTransitionInfoNone;
  *(_OWORD *)&retstr->var2.var1 = xmmword_1A7C0B7D8;
  return self;
}

- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfoForDisplayAsset:(SEL)a3
{
  retstr->var6 = 0.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return self;
}

- (PXStoryMultipartPanoramaParameters)defaultHorizontalMultipartPanoramaParameters
{
  return 0;
}

- (PXStoryMultipartPanoramaParameters)defaultVerticalMultipartPanoramaParameters
{
  return 0;
}

- (BOOL)allowsMultipartPanoramaForDisplayAsset:(id)a3 startTime:(id *)a4
{
  return 0;
}

- (id)sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:(id)a3 startTime:(id *)a4 proposedCropContentsRects:(id)a5 axis:(int64_t)a6 normalizedKenBurnsEffectParameters:(id *)a7 durationInfos:(id *)a8 transitionInfos:(id *)a9
{
  return 0;
}

- (BOOL)allowsIncompleteTimelines
{
  return 0;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositions, 0);
}

@end
