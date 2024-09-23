@implementation _PXStoryDummyTimelineStyle

- (_PXStoryDummyTimelineStyle)initWithStyle:(id)a3 spec:(id)a4 allowedClipCompositions:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PXStoryDummyTimelineStyle *v12;
  _PXStoryDummyTimelineStyle *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PXStoryDummyTimelineStyle;
  v12 = -[_PXStoryDummyTimelineStyle init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_style, a3);
    objc_storeStrong((id *)&v13->_spec, a4);
    objc_storeStrong((id *)&v13->_allowedClipCompositions, a5);
  }

  return v13;
}

- ($F6BA6A5CD79A8D3CC60DB9DEA7616E28)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4
{
  $F6BA6A5CD79A8D3CC60DB9DEA7616E28 *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  result = -[_PXStoryDummyTimelineStyle defaultDisplayAssetPresentationDuration](self, "defaultDisplayAssetPresentationDuration", a4, a5);
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  Float64 v4;

  -[PXStoryDummyStyle defaultSegmentDuration](self->_style, "defaultSegmentDuration");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 600);
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

  PXStoryBasicContentInfoForDisplayAsset(a4, (uint64_t)retstr);
  return result;
}

- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3
{
  return 1;
}

- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4
{
  return a4;
}

- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3
{
  return 1;
}

- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9
{
  id v11;
  void (**v12)(id, $AEFAD17AB1CC80BF212AA0D0E83A8824 *, _QWORD);
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  $AEFAD17AB1CC80BF212AA0D0E83A8824 *v21;
  __int128 v22;
  double v23;

  v11 = a3;
  v12 = (void (**)(id, $AEFAD17AB1CC80BF212AA0D0E83A8824 *, _QWORD))a9;
  objc_msgSend(v11, "mainDividerAxis");
  PXAxisTransposed();
  v13 = PXMaxRectEdgeForAxis();
  -[PXStoryDummyStyle separatorPanDistance](self->_style, "separatorPanDistance");
  v15 = v14;
  -[PXStoryDummyStyle separatorRotationAngle](self->_style, "separatorRotationAngle");
  v17 = v16;
  v18 = objc_msgSend(v11, "numberOfClips");
  if (v18 == 3)
  {
    v20 = -[PXStoryDummyStyle threeUpSeparatorEffectKind](self->_style, "threeUpSeparatorEffectKind");
    v21 = 0;
    switch(v20)
    {
      case 0:
        goto LABEL_16;
      case 1:
        +[PXStoryClipSeparatorEffectFactory getParameters:forParallelPansWithDistance:threeUpComposition:](PXStoryClipSeparatorEffectFactory, "getParameters:forParallelPansWithDistance:threeUpComposition:", a8, v11, v15);
        goto LABEL_15;
      case 2:
        +[PXStoryClipSeparatorEffectFactory getParameters:forOppositePansWithDistance:threeUpComposition:](PXStoryClipSeparatorEffectFactory, "getParameters:forOppositePansWithDistance:threeUpComposition:", a8, v11, v15);
        goto LABEL_15;
      case 3:
        +[PXStoryClipSeparatorEffectFactory getParameters:forParallelRotationsWithAngle:threeUpComposition:](PXStoryClipSeparatorEffectFactory, "getParameters:forParallelRotationsWithAngle:threeUpComposition:", a8, v11, v17);
        goto LABEL_15;
      case 4:
        +[PXStoryClipSeparatorEffectFactory getParameters:forOppositeRotationsWithAngle:threeUpComposition:](PXStoryClipSeparatorEffectFactory, "getParameters:forOppositeRotationsWithAngle:threeUpComposition:", a8, v11, v17);
LABEL_15:
        v21 = a8;
LABEL_16:
        v12[2](v12, v21, 0);
        break;
      default:
        goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (v18 != 2)
  {
LABEL_17:
    v12[2](v12, 0, 0);
    goto LABEL_18;
  }
  v19 = -[PXStoryDummyStyle twoUpSeparatorEffectKind](self->_style, "twoUpSeparatorEffectKind");
  if (v19 == 2)
  {
    +[PXStoryClipSeparatorEffectFactory parametersForRotationWithAngle:](PXStoryClipSeparatorEffectFactory, "parametersForRotationWithAngle:", v17);
  }
  else
  {
    if (v19 != 1)
    {
      if (v19)
        goto LABEL_18;
      goto LABEL_17;
    }
    +[PXStoryClipSeparatorEffectFactory parametersForPanTowardsEdge:distance:](PXStoryClipSeparatorEffectFactory, "parametersForPanTowardsEdge:distance:", v13, v15);
  }
  *(_OWORD *)&a8->var0 = v22;
  a8->var2 = v23;
  v12[2](v12, a8, 0);
LABEL_18:

}

- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12
{
  id v16;
  id v17;
  id v18;
  void *v19;
  PXStoryTimelineSpec *spec;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _PXStoryDummyTimelineStyle *v26;
  id v27;
  $D91B8EE9D09FDCAD835AAEC54CF3D85E *v28;

  v16 = a3;
  v17 = a12;
  v18 = a4;
  objc_msgSend(v18, "resourcesDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "croppingContext");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  spec = self->_spec;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __242___PXStoryDummyTimelineStyle_enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition_displayAssets_assetContentInfos_finalPlaybackStyles_startTime_durationInfo_separatorEffectParameters_separatorEffectContext_buffer_usingBlock___block_invoke;
  v24[3] = &unk_1E5147F18;
  v25 = v16;
  v26 = self;
  v27 = v17;
  v28 = a11;
  v21 = v17;
  v22 = v16;
  +[PXStoryClipKenBurnsEffectFactory factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:](PXStoryClipKenBurnsEffectFactory, "factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:", spec, v22, v18, v23, 0, a5, a6, a9, v24);

}

- ($C63E51281545771083DD8F52DBD4F646)transitionInfoForSegmentWithClipComposition:(SEL)a3 displayAssets:(id)a4
{
  $C63E51281545771083DD8F52DBD4F646 *result;

  result = ($C63E51281545771083DD8F52DBD4F646 *)self->_style;
  if (result)
    return ($C63E51281545771083DD8F52DBD4F646 *)-[$C63E51281545771083DD8F52DBD4F646 transitionInfo](result, "transitionInfo", a4, a5);
  *(_QWORD *)&retstr->var3 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2.var1 = 0u;
  return result;
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
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClipCompositions, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
