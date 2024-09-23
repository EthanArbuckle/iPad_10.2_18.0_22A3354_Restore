@implementation PXStoryConcreteSubtimelineScanner

- (PXStoryConcreteSubtimelineScanner)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteSubtimelineScanner.m"), 103, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteSubtimelineScanner init]");

  abort();
}

- (PXStoryConcreteSubtimelineScanner)initWithConfiguration:(id)a3
{
  id v4;
  PXStoryConcreteSubtimelineScanner *v5;
  uint64_t v6;
  PXStoryResourcesDataSource *resourcesDataSource;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *randomNumberGenerators;
  id *p_spec;
  PXStoryResourcesDataSource *v13;
  NSArray *v14;
  void *v15;
  uint64_t v16;
  PXStoryTimelineStyle *timelineStyle;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  PXStoryTimelineScorer *timelineScorer;
  PXStoryConcreteTimelineScorer *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  PXStoryConcreteSubtimelineScanner *v33;
  void (**v34)(void);
  uint64_t v35;
  PXStoryMutableConcreteTimeline *subtimelineWithClipComposition;
  uint64_t v37;
  PXStoryMutableConcreteTimeline *bestSubtimeline;
  uint64_t v39;
  PXStoryMutableConcreteTimeline *candidateSubtimeline;
  uint64_t v41;
  PXStoryMutableConcreteTimeline *precedingSubtimeline;
  uint64_t v43;
  PXStoryMutableConcreteTimeline *precedingSubtimelineWithCandidateSubtimeline;
  uint64_t v45;
  PXStoryMutableConcreteTimeline *precedingSubtimelineWithCandidateAndSubsequentSubtimelines;
  uint64_t v47;
  PXStoryMutableConcreteTimeline *subtimelineWithRemainingClips;
  uint64_t v49;
  PXStoryMutableConcreteTimeline *emptySubtimeline;
  id v51;
  uint64_t i;
  uint64_t v53;
  NSIndexSet *originalPlaybackStylesAllowedInNUp;
  uint64_t j;
  uint64_t v56;
  uint64_t v57;
  NSMutableArray *reusableDisplayAssetInfos;
  id v59;
  void *v60;
  PXStoryTimelineStyle *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  void *v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  __int128 time2;
  _BYTE time2_16[32];
  __int128 v79;
  _OWORD v80[3];
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE time1[32];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  _QWORD aBlock[4];
  id v93;
  PXStoryConcreteSubtimelineScanner *v94;
  objc_super v95;

  v4 = a3;
  v95.receiver = self;
  v95.super_class = (Class)PXStoryConcreteSubtimelineScanner;
  v5 = -[PXStoryConcreteSubtimelineScanner init](&v95, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "resourcesDataSource");
    v6 = objc_claimAutoreleasedReturnValue();
    resourcesDataSource = v5->_resourcesDataSource;
    v5->_resourcesDataSource = (PXStoryResourcesDataSource *)v6;

    objc_msgSend(v4, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createRandomNumberGenerators");
    v10 = objc_claimAutoreleasedReturnValue();
    randomNumberGenerators = v5->_randomNumberGenerators;
    v5->_randomNumberGenerators = (NSArray *)v10;

    p_spec = (id *)&v5->_spec;
    objc_storeStrong((id *)&v5->_spec, v8);
    v13 = v5->_resourcesDataSource;
    v14 = v5->_randomNumberGenerators;
    objc_msgSend(v4, "errorReporter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v9;
    objc_msgSend(v9, "timelineStyleWithSpec:resourcesDataSource:randomNumberGenerators:errorReporter:", v8, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    timelineStyle = v5->_timelineStyle;
    v5->_timelineStyle = (PXStoryTimelineStyle *)v16;

    objc_msgSend(v4, "scorerFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v4, "scorerFactory");
      v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, PXStoryTimelineStyle *))v19)[2](v19, v5->_timelineStyle);
      v20 = objc_claimAutoreleasedReturnValue();
      timelineScorer = v5->_timelineScorer;
      v5->_timelineScorer = (PXStoryTimelineScorer *)v20;

    }
    else
    {
      v22 = -[PXStoryConcreteTimelineScorer initWithTimelineStyle:]([PXStoryConcreteTimelineScorer alloc], "initWithTimelineStyle:", v5->_timelineStyle);
      v19 = (void (**)(_QWORD, _QWORD))v5->_timelineScorer;
      v5->_timelineScorer = (PXStoryTimelineScorer *)v22;
    }

    v5->_productionOptions = objc_msgSend(v4, "options");
    objc_msgSend(v8, "viewportSize");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v8, "nUpDividerWidth");
    v5->_clipCompositionContext.viewportSize.width = v24;
    v5->_clipCompositionContext.viewportSize.height = v26;
    v5->_clipCompositionContext.dividerWidth = v27;
    v5->_clipCompositionContext.singleAssetAspectRatio = 0.0;
    -[PXStoryResourcesDataSource keyAssetResource](v5->_resourcesDataSource, "keyAssetResource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      v29 = -1;
    else
      v29 = 0;
    v5->_initialResourceIndex = v29;
    v5->_nextResourceIndex = v29;
    v30 = -[PXStoryResourcesDataSource numberOfDisplayAssetResources](v5->_resourcesDataSource, "numberOfDisplayAssetResources");
    v5->_numberOfResources = v30;
    if (v30 >= 1)
    {
      -[PXStoryResourcesDataSource displayAssetResourceAtIndex:](v5->_resourcesDataSource, "displayAssetResourceAtIndex:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_firstDisplayAssetIsSameAsKey = objc_msgSend(v28, "isEqual:", v31);

    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PXStoryConcreteSubtimelineScanner_initWithConfiguration___block_invoke;
    aBlock[3] = &unk_1E512FD08;
    v32 = v8;
    v93 = v32;
    v33 = v5;
    v94 = v33;
    v34 = (void (**)(void))_Block_copy(aBlock);
    v34[2]();
    v35 = objc_claimAutoreleasedReturnValue();
    subtimelineWithClipComposition = v33->_subtimelineWithClipComposition;
    v33->_subtimelineWithClipComposition = (PXStoryMutableConcreteTimeline *)v35;

    ((void (*)(void (**)(void)))v34[2])(v34);
    v37 = objc_claimAutoreleasedReturnValue();
    bestSubtimeline = v33->_bestSubtimeline;
    v33->_bestSubtimeline = (PXStoryMutableConcreteTimeline *)v37;

    ((void (*)(void (**)(void)))v34[2])(v34);
    v39 = objc_claimAutoreleasedReturnValue();
    candidateSubtimeline = v33->_candidateSubtimeline;
    v33->_candidateSubtimeline = (PXStoryMutableConcreteTimeline *)v39;

    ((void (*)(void (**)(void)))v34[2])(v34);
    v41 = objc_claimAutoreleasedReturnValue();
    precedingSubtimeline = v33->_precedingSubtimeline;
    v33->_precedingSubtimeline = (PXStoryMutableConcreteTimeline *)v41;

    ((void (*)(void (**)(void)))v34[2])(v34);
    v43 = objc_claimAutoreleasedReturnValue();
    precedingSubtimelineWithCandidateSubtimeline = v33->_precedingSubtimelineWithCandidateSubtimeline;
    v33->_precedingSubtimelineWithCandidateSubtimeline = (PXStoryMutableConcreteTimeline *)v43;

    ((void (*)(void (**)(void)))v34[2])(v34);
    v45 = objc_claimAutoreleasedReturnValue();
    precedingSubtimelineWithCandidateAndSubsequentSubtimelines = v33->_precedingSubtimelineWithCandidateAndSubsequentSubtimelines;
    v33->_precedingSubtimelineWithCandidateAndSubsequentSubtimelines = (PXStoryMutableConcreteTimeline *)v45;

    ((void (*)(void (**)(void)))v34[2])(v34);
    v47 = objc_claimAutoreleasedReturnValue();
    subtimelineWithRemainingClips = v33->_subtimelineWithRemainingClips;
    v33->_subtimelineWithRemainingClips = (PXStoryMutableConcreteTimeline *)v47;

    ((void (*)(void (**)(void)))v34[2])(v34);
    v49 = objc_claimAutoreleasedReturnValue();
    emptySubtimeline = v33->_emptySubtimeline;
    v33->_emptySubtimeline = (PXStoryMutableConcreteTimeline *)v49;

    v51 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    for (i = 1; i != 6; ++i)
    {
      if (-[PXStoryTimelineStyle isOriginalPlaybackStyleAllowedInNUp:](v5->_timelineStyle, "isOriginalPlaybackStyleAllowedInNUp:", i))objc_msgSend(v51, "addIndex:", i);
    }
    v53 = objc_msgSend(v51, "copy");
    originalPlaybackStylesAllowedInNUp = v33->_originalPlaybackStylesAllowedInNUp;
    v33->_originalPlaybackStylesAllowedInNUp = (NSIndexSet *)v53;

    _PXGArrayResize();
    for (j = 0; j != 6; ++j)
    {
      if (j)
        v56 = -[PXStoryTimelineStyle finalNUpPlaybackStyleForOriginalPlaybackStyle:](v5->_timelineStyle, "finalNUpPlaybackStyleForOriginalPlaybackStyle:", j);
      else
        v56 = 0;
      v33->_nUpPlaybackStyleMapping[j] = v56;
    }
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    reusableDisplayAssetInfos = v33->_reusableDisplayAssetInfos;
    v33->_reusableDisplayAssetInfos = (NSMutableArray *)v57;

    if (*p_spec)
    {
      objc_msgSend(*p_spec, "fixedSegmentDuration");
      if ((v84 & 0x100000000) != 0)
      {
        if (*p_spec)
        {
          objc_msgSend(*p_spec, "fixedSegmentDuration");
        }
        else
        {
          v81 = 0uLL;
          v82 = 0;
        }
        *(_OWORD *)time1 = v81;
        *(_QWORD *)&time1[16] = v82;
        time2 = PXStoryTimeZero;
        *(_QWORD *)time2_16 = 0;
        if (CMTimeCompare((CMTime *)time1, (CMTime *)&time2) >= 1)
        {
          if (*p_spec)
          {
            objc_msgSend(*p_spec, "fixedSegmentDuration");
            if (*p_spec)
            {
              objc_msgSend(*p_spec, "fixedSegmentDuration");
              v59 = *p_spec;
              v60 = v68;
              if (v59)
              {
                objc_msgSend(v59, "fixedSegmentDuration");
LABEL_39:
                *(_QWORD *)time2_16 = v76;
                v62 = v75;
                time2 = v75;
                *(_OWORD *)&time2_16[8] = v73;
                *(_QWORD *)&time2_16[24] = v74;
                *(_QWORD *)&v80[0] = v72;
                v63 = v71;
                v79 = v71;
                memset((char *)v80 + 8, 0, 32);
LABEL_34:
                *(_OWORD *)time1 = v62;
                *(_OWORD *)&time1[16] = *(_OWORD *)time2_16;
                v91 = *(_QWORD *)&v80[2];
                v89 = v80[0];
                v90 = v80[1];
                v87 = *(_OWORD *)&time2_16[16];
                v88 = v63;
                v33->_defaultDurationInfo.preferredCue.rank = *(_QWORD *)&v80[2];
                v64 = v90;
                *(_OWORD *)&v33->_defaultDurationInfo.maximumDuration.epoch = v89;
                *(_OWORD *)&v33->_defaultDurationInfo.preferredCue.time.timescale = v64;
                v65 = *(_OWORD *)&time1[16];
                *(_OWORD *)&v33->_defaultDurationInfo.minimumDuration.value = *(_OWORD *)time1;
                *(_OWORD *)&v33->_defaultDurationInfo.minimumDuration.epoch = v65;
                v66 = v88;
                *(_OWORD *)&v33->_defaultDurationInfo.preferredDuration.timescale = v87;
                *(_OWORD *)&v33->_defaultDurationInfo.maximumDuration.value = v66;
                *(_OWORD *)&v33->_defaultDurationInfo.expectedTransitionKind = xmmword_1A7BE4B20;
                v33->_titleTextResourceIndexes = (int64_t *)malloc_type_calloc(2uLL, 8uLL, 0x100004000313F17uLL);
                -[PXStoryConcreteSubtimelineScanner _initializeDefaultMultipartPanoramaParameters](v33, "_initializeDefaultMultipartPanoramaParameters");

                goto LABEL_35;
              }
LABEL_38:
              v71 = 0uLL;
              v72 = 0;
              goto LABEL_39;
            }
          }
          else
          {
            v75 = 0uLL;
            v76 = 0;
          }
          v73 = 0uLL;
          v74 = 0;
          v60 = v68;
          goto LABEL_38;
        }
      }
    }
    else
    {
      v83 = 0;
      v84 = 0;
      v85 = 0;
    }
    v61 = v5->_timelineStyle;
    if (v61)
    {
      -[PXStoryTimelineStyle defaultDisplayAssetPresentationDuration](v61, "defaultDisplayAssetPresentationDuration");
    }
    else
    {
      v69 = 0uLL;
      v70 = 0;
    }
    v60 = v68;
    *(_OWORD *)&time2_16[8] = v69;
    *(_QWORD *)&time2_16[24] = v70;
    *(_QWORD *)time2_16 = 0;
    v62 = PXStoryTimeZero;
    time2 = PXStoryTimeZero;
    memset(v80, 0, 40);
    v63 = PXStoryTimeMaximum;
    v79 = PXStoryTimeMaximum;
    goto LABEL_34;
  }
LABEL_35:

  return v5;
}

- (void)_initializeDefaultMultipartPanoramaParameters
{
  PXStoryMultipartPanoramaParameters *v3;
  PXStoryMultipartPanoramaParameters *defaultHorizontalMultipartPanoramaParameters;
  PXStoryMultipartPanoramaParameters *v5;
  double v6;
  double v7;
  double v8;
  PXStoryMultipartPanoramaParameters *v9;
  PXStoryMultipartPanoramaParameters *defaultVerticalMultipartPanoramaParameters;
  PXStoryMultipartPanoramaParameters *v11;
  double v12;
  double v13;

  -[PXStoryTimelineStyle defaultHorizontalMultipartPanoramaParameters](self->_timelineStyle, "defaultHorizontalMultipartPanoramaParameters");
  v3 = (PXStoryMultipartPanoramaParameters *)objc_claimAutoreleasedReturnValue();
  defaultHorizontalMultipartPanoramaParameters = self->_defaultHorizontalMultipartPanoramaParameters;
  self->_defaultHorizontalMultipartPanoramaParameters = v3;

  v5 = self->_defaultHorizontalMultipartPanoramaParameters;
  if (v5
    && (-[PXStoryMultipartPanoramaParameters normalizedKenBurnsEffectParameters](v5, "normalizedKenBurnsEffectParameters"), (PXStoryRectIsNull() & 1) == 0))
  {
    PXStoryClipKenBurnsEffectsGetContentsRectBounds();
    PXSizeGetAspectRatio();
    v8 = v7 + v7;
    if (v8 >= 2.5)
      v6 = v8;
    else
      v6 = 2.5;
  }
  else
  {
    v6 = 1.79769313e308;
  }
  -[PXStoryTimelineStyle defaultVerticalMultipartPanoramaParameters](self->_timelineStyle, "defaultVerticalMultipartPanoramaParameters");
  v9 = (PXStoryMultipartPanoramaParameters *)objc_claimAutoreleasedReturnValue();
  defaultVerticalMultipartPanoramaParameters = self->_defaultVerticalMultipartPanoramaParameters;
  self->_defaultVerticalMultipartPanoramaParameters = v9;

  v11 = self->_defaultVerticalMultipartPanoramaParameters;
  if (v11
    && (-[PXStoryMultipartPanoramaParameters normalizedKenBurnsEffectParameters](v11, "normalizedKenBurnsEffectParameters"), (PXStoryRectIsNull() & 1) == 0))
  {
    PXStoryClipKenBurnsEffectsGetContentsRectBounds();
    PXSizeGetAspectRatio();
    v12 = fmin(v13 * 0.5, 0.4);
  }
  else
  {
    v12 = -1.79769313e308;
  }
  self->_minimumAspectRatioForHorizontalMultipartPanorama = v6;
  self->_maximumAspectRatioForVerticalMultipartPanorama = v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_nUpPlaybackStyleMapping);
  free(self->_titleTextResourceIndexes);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryConcreteSubtimelineScanner;
  -[PXStoryConcreteSubtimelineScanner dealloc](&v3, sel_dealloc);
}

- (BOOL)isAtBeginning
{
  return self->_nextResourceIndex == self->_initialResourceIndex;
}

- (BOOL)isAtEnd
{
  return self->_nextResourceIndex >= self->_numberOfResources;
}

- ($70EB31679AD570D2612C6654B67EF72A)scanState
{
  int64_t nextResourceIndex;
  void *v7;
  void *v8;
  uint64_t *v9;
  __int128 v10;
  $70EB31679AD570D2612C6654B67EF72A *result;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v14 = 0;
  v15 = &v14;
  v16 = 0x5010000000;
  v19 = 0u;
  v20 = 0u;
  v21 = 0;
  nextResourceIndex = self->_nextResourceIndex;
  v17 = &unk_1A7E74EE7;
  v18 = nextResourceIndex;
  -[PXStoryConcreteSubtimelineScanner randomNumberGenerators](self, "randomNumberGenerators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXStoryConcreteSubtimelineScanner.m"), 227, CFSTR("too many random number generators"));

  }
  -[PXStoryConcreteSubtimelineScanner randomNumberGenerators](self, "randomNumberGenerators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__PXStoryConcreteSubtimelineScanner_scanState__block_invoke;
  v13[3] = &unk_1E512FD30;
  v13[4] = &v14;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v9 = v15;
  v10 = *((_OWORD *)v15 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v15 + 2);
  *(_OWORD *)&retstr->var1[1] = v10;
  *(_OWORD *)&retstr->var1[3] = *((_OWORD *)v9 + 4);

  _Block_object_dispose(&v14, 8);
  return result;
}

- (void)setScanState:(id *)a3
{
  __int128 v4;
  id v5;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  self->_nextResourceIndex = a3->var0;
  -[PXStoryConcreteSubtimelineScanner randomNumberGenerators](self, "randomNumberGenerators");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PXStoryConcreteSubtimelineScanner_setScanState___block_invoke;
  v6[3] = &__block_descriptor_80_e48_v32__0___PFSeededRandomNumberGenerator__8Q16_B24l;
  v4 = *(_OWORD *)&a3->var1[1];
  v7 = *(_OWORD *)&a3->var0;
  v8 = v4;
  v9 = *(_OWORD *)&a3->var1[3];
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (BOOL)scanSubtimelineWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 playbackStyles:(const int64_t *)a6 separatorEffectParameters:(id *)a7 kenBurnsEffectParameters:(id *)a8 transitionInfo:(id *)a9 startTime:(id *)a10 durationInfo:(id *)a11 resultHandler:(id)a12
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v17[7];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  _OWORD v19[2];
  uint64_t v20;

  v12 = *(_OWORD *)&a9->var2.var1;
  v19[0] = *(_OWORD *)&a9->var0;
  v19[1] = v12;
  v20 = *(_QWORD *)&a9->var3;
  v18 = *a10;
  v13 = *(_OWORD *)&a11->var3.var0.var1;
  v17[4] = *(_OWORD *)&a11->var2.var3;
  v17[5] = v13;
  v17[6] = *(_OWORD *)&a11->var3.var1;
  v14 = *(_OWORD *)&a11->var0.var3;
  v17[0] = *(_OWORD *)&a11->var0.var0;
  v17[1] = v14;
  v15 = *(_OWORD *)&a11->var2.var0;
  v17[2] = *(_OWORD *)&a11->var1.var1;
  v17[3] = v15;
  return -[PXStoryConcreteSubtimelineScanner _scanSubtimelineWithClipComposition:displayAssets:assetContentInfos:playbackStyles:separatorEffectParameters:kenBurnsEffectParameters:transitionInfo:startTime:durationInfo:resultHandler:](self, "_scanSubtimelineWithClipComposition:displayAssets:assetContentInfos:playbackStyles:separatorEffectParameters:kenBurnsEffectParameters:transitionInfo:startTime:durationInfo:resultHandler:", a3, a4, a5, a6, a7, a8, v19, &v18, v17, a12);
}

- (BOOL)_scanFastestSubtimelineWithNextDisplayAssetResultHandler:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  BOOL v10;
  _OWORD v12[7];
  _QWORD v13[3];
  _BYTE v14[40];
  uint64_t v15;

  v4 = _scanFastestSubtimelineWithNextDisplayAssetResultHandler__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&_scanFastestSubtimelineWithNextDisplayAssetResultHandler__onceToken, &__block_literal_global_160821);
  v15 = 1;
  v6 = _scanFastestSubtimelineWithNextDisplayAssetResultHandler__oneUpComposition;
  PXStoryTransitionInfoMakeDefault(1u, (uint64_t)v14, 0.0);
  memset(v13, 0, sizeof(v13));
  v7 = *(_OWORD *)&self->_defaultDurationInfo.preferredCue.time.timescale;
  v12[4] = *(_OWORD *)&self->_defaultDurationInfo.maximumDuration.epoch;
  v12[5] = v7;
  v12[6] = *(_OWORD *)&self->_defaultDurationInfo.preferredCue.rank;
  v8 = *(_OWORD *)&self->_defaultDurationInfo.minimumDuration.epoch;
  v12[0] = *(_OWORD *)&self->_defaultDurationInfo.minimumDuration.value;
  v12[1] = v8;
  v9 = *(_OWORD *)&self->_defaultDurationInfo.maximumDuration.value;
  v12[2] = *(_OWORD *)&self->_defaultDurationInfo.preferredDuration.timescale;
  v12[3] = v9;
  v10 = -[PXStoryConcreteSubtimelineScanner _scanSubtimelineWithClipComposition:displayAssets:assetContentInfos:playbackStyles:separatorEffectParameters:kenBurnsEffectParameters:transitionInfo:startTime:durationInfo:resultHandler:](self, "_scanSubtimelineWithClipComposition:displayAssets:assetContentInfos:playbackStyles:separatorEffectParameters:kenBurnsEffectParameters:transitionInfo:startTime:durationInfo:resultHandler:", v6, 0, 0, &v15, 0, 0, v14, v13, v12, v5);

  return v10;
}

- (BOOL)_scanSubtimelineWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 playbackStyles:(const int64_t *)a6 separatorEffectParameters:(id *)a7 kenBurnsEffectParameters:(id *)a8 transitionInfo:(id *)a9 startTime:(id *)a10 durationInfo:(id *)a11 resultHandler:(id)a12
{
  id v17;
  id v18;
  void (**v19)(_QWORD, PXStoryMutableConcreteTimeline *);
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  int32_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  PXStoryMutableConcreteTimeline *subtimelineWithClipComposition;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BOOL4 v38;
  uint64_t v39;
  _BOOL4 v40;
  int v41;
  PXStoryMutableConcreteTimeline *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  PXStoryMutableConcreteTimeline *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  unsigned int v56;
  PXStoryMutableConcreteTimeline *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  BOOL v63;
  int64_t v65;
  uint64_t v66;
  void (**v67)(_QWORD, PXStoryMutableConcreteTimeline *);
  const $AEFAD17AB1CC80BF212AA0D0E83A8824 *v68;
  const int64_t *v69;
  void *v70;
  _BYTE time2[32];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[5];
  id v90;
  id v91;
  CMTime *p_time1;
  uint64_t *v93;
  uint64_t v94;
  const $AEFAD17AB1CC80BF212AA0D0E83A8824 *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  const $D91B8EE9D09FDCAD835AAEC54CF3D85E *v103;
  SEL v104;
  const $60B83496CA56D3588CF925FE7FBD90DC *v105;
  const int64_t *v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  BOOL v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  CMTime time1;
  void *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  uint64_t v127;

  v17 = a3;
  v18 = a4;
  v19 = (void (**)(_QWORD, PXStoryMutableConcreteTimeline *))a12;
  v20 = objc_msgSend(v17, "numberOfAssets");
  v21 = -[PXStoryConcreteSubtimelineScanner numberOfRemainingResources](self, "numberOfRemainingResources");
  if (v20 <= v21)
  {
    v69 = a6;
    v65 = v21;
    v22 = objc_msgSend(v17, "numberOfClips");
    time1 = (CMTime)a11->var1;
    *(_OWORD *)time2 = PXStoryTimeZero;
    *(_QWORD *)&time2[16] = 0;
    v23 = CMTimeCompare(&time1, (CMTime *)time2);
    v127 = 0;
    v125 = 0u;
    v126 = 0u;
    PXStorySegmentClipCompositionInfoFromComposition(v17, (uint64_t)&v125);
    time1.value = 0;
    *(_QWORD *)&time1.timescale = &time1;
    time1.epoch = 0x9810000000;
    v116 = &unk_1A7E74EE7;
    v124 = 0;
    v121 = xmmword_1A7C0BF70;
    v122 = xmmword_1A7C0BF80;
    v123 = xmmword_1A7C0BF90;
    v117 = PXStoryKenBurnsAnimationInfoNone;
    v118 = unk_1A7C0BF40;
    v119 = xmmword_1A7C0BF50;
    v120 = xmmword_1A7C0BF60;
    v111 = 0;
    v112 = &v111;
    v113 = 0x2020000000;
    v114 = 0;
    -[PXStoryMutableConcreteTimeline removeAllClipsAndSegments](self->_subtimelineWithClipComposition, "removeAllClipsAndSegments");
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v70 = v24;
    v66 = v20;
    v67 = v19;
    v68 = a7;
    if (v23 >= 1
      && objc_msgSend(v24, "smartGradientEnabled")
      && (!objc_msgSend(v17, "clipFramesExtendToBounds")
       || objc_msgSend(v25, "allowAspectModeToggle")))
    {
      v26 = v22;
      v27 = objc_msgSend(v17, "numberOfAssets") == 1;
    }
    else
    {
      v26 = v22;
      v27 = 0;
    }
    subtimelineWithClipComposition = self->_subtimelineWithClipComposition;
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __223__PXStoryConcreteSubtimelineScanner__scanSubtimelineWithClipComposition_displayAssets_assetContentInfos_playbackStyles_separatorEffectParameters_kenBurnsEffectParameters_transitionInfo_startTime_durationInfo_resultHandler___block_invoke;
    v89[3] = &unk_1E512FD98;
    v89[4] = self;
    v29 = v26;
    v94 = v26;
    v90 = v18;
    v30 = v17;
    v31 = *(_OWORD *)&a11->var1.var1;
    v99 = *(_OWORD *)&a11->var2.var0;
    v32 = *(_OWORD *)&a11->var2.var0;
    v100 = *(_OWORD *)&a11->var2.var3;
    v33 = *(_OWORD *)&a11->var2.var3;
    v101 = *(_OWORD *)&a11->var3.var0.var1;
    v34 = *(_OWORD *)&a11->var3.var0.var1;
    v102 = *(_OWORD *)&a11->var3.var1;
    v35 = *(_OWORD *)&a11->var0.var3;
    v96 = *(_OWORD *)&a11->var0.var0;
    v36 = *(_OWORD *)&a11->var0.var0;
    v97 = *(_OWORD *)&a11->var0.var3;
    v98 = *(_OWORD *)&a11->var1.var1;
    v37 = *(_OWORD *)&a9->var0;
    v108 = *(_OWORD *)&a9->var2.var1;
    v107 = v37;
    v76 = v33;
    v77 = v34;
    v78 = *(_OWORD *)&a11->var3.var1;
    *(_OWORD *)time2 = v36;
    *(_OWORD *)&time2[16] = v35;
    v103 = a8;
    v104 = a2;
    v105 = a5;
    v106 = v69;
    v38 = v27;
    v110 = v27;
    v91 = v30;
    p_time1 = &time1;
    v95 = v68;
    v93 = &v111;
    v109 = *(_QWORD *)&a9->var3;
    v74 = v31;
    v75 = v32;
    v86 = v125;
    v87 = v126;
    *(_QWORD *)&v88 = v127;
    v39 = -[PXStoryMutableConcreteTimeline appendSegmentWithDurationInfo:clipCount:compositionInfo:configuration:](subtimelineWithClipComposition, "appendSegmentWithDurationInfo:clipCount:compositionInfo:configuration:", time2, v29, &v86, v89);
    v20 = v66;
    v19 = v67;
    v40 = v38;
    if (objc_msgSend(v30, "numberOfClips") < 2)
      v41 = 0;
    else
      v41 = objc_msgSend(v70, "allowsNUpBackground");
    if ((v41 | v40) == 1)
    {
      v87 = 0u;
      v88 = 0u;
      v86 = 0u;
      v42 = self->_subtimelineWithClipComposition;
      if (v42)
      {
        -[PXStoryConcreteTimeline timeRangeForSegmentWithIdentifier:](v42, "timeRangeForSegmentWithIdentifier:", v39);
        v42 = self->_subtimelineWithClipComposition;
      }
      -[PXStoryConcreteTimeline size](v42, "size");
      PXRectWithOriginAndSize();
      v46 = v43;
      v48 = v47;
      v49 = v44;
      v50 = v45;
      if (v41)
      {
        v51 = self->_subtimelineWithClipComposition;
        v83 = v86;
        v84 = v87;
        v85 = v88;
        v52 = *(_OWORD *)&a9->var2.var1;
        v80 = *(_OWORD *)&a9->var0;
        v81 = v52;
        v82 = *(_QWORD *)&a9->var3;
        v53 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 112);
        v76 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 96);
        v77 = v53;
        v78 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 128);
        v79 = *(_QWORD *)(*(_QWORD *)&time1.timescale + 144);
        v54 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 48);
        *(_OWORD *)time2 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 32);
        *(_OWORD *)&time2[16] = v54;
        v55 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 80);
        v74 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 64);
        v75 = v55;
        -[PXStoryMutableConcreteTimeline insertClipInTimeRange:resourceKind:options:resourceIndex:frame:transitionInfo:kenBurnsAnimationInfo:](v51, "insertClipInTimeRange:resourceKind:options:resourceIndex:frame:transitionInfo:kenBurnsAnimationInfo:", &v83, 4, 0, 1, &v80, time2, v43, v48, v44, v45);
      }
      if (v40)
      {
        v56 = objc_msgSend(v30, "clipFramesExtendToBounds");
        v57 = self->_subtimelineWithClipComposition;
        v58 = v112[3];
        v83 = v86;
        v84 = v87;
        v85 = v88;
        v59 = *(_OWORD *)&a9->var2.var1;
        v80 = *(_OWORD *)&a9->var0;
        v81 = v59;
        v82 = *(_QWORD *)&a9->var3;
        v60 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 112);
        v76 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 96);
        v77 = v60;
        v78 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 128);
        v79 = *(_QWORD *)(*(_QWORD *)&time1.timescale + 144);
        v61 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 48);
        *(_OWORD *)time2 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 32);
        *(_OWORD *)&time2[16] = v61;
        v62 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 80);
        v74 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 64);
        v75 = v62;
        -[PXStoryMutableConcreteTimeline insertClipInTimeRange:resourceKind:options:resourceIndex:frame:transitionInfo:kenBurnsAnimationInfo:](v57, "insertClipInTimeRange:resourceKind:options:resourceIndex:frame:transitionInfo:kenBurnsAnimationInfo:", &v83, 5, v56, v58, &v80, time2, v46, v48, v49, v50);
      }
    }
    self->_nextResourceIndex += v66;
    v67[2](v67, self->_subtimelineWithClipComposition);

    _Block_object_dispose(&v111, 8);
    _Block_object_dispose(&time1, 8);
    v21 = v65;
  }
  v63 = v20 <= v21;

  return v63;
}

- (BOOL)_scanMultipartPanoramaSubtimelineAfterTime:(id *)a3 nextDisplayAssetsInfo:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, uint64_t);
  BOOL v12;
  _QWORD aBlock[5];
  id v15;
  id v16;
  uint64_t *v17;
  __int128 v18;
  int64_t var3;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a4;
  v9 = a5;
  if (-[PXStoryConcreteSubtimelineScanner numberOfRemainingResources](self, "numberOfRemainingResources") >= 1
    && objc_msgSend(v8, "count") >= 1
    && (v10 = objc_retainAutorelease(v8), *(_QWORD *)objc_msgSend(v10, "oneUpPlaybackStyles") == 1))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_nextDisplayAssetsInfo_resultHandler___block_invoke;
    aBlock[3] = &unk_1E512FDC0;
    v17 = &v20;
    aBlock[4] = self;
    v18 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v15 = v10;
    v16 = v9;
    v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v11[2](v11, 2);
    v11[2](v11, 1);
    v12 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_scanMultipartPanoramaSubtimelineAfterTime:(id *)a3 axis:(int64_t)a4 nextDisplayAssetsInfo:(id)a5 resultHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  void *v19;
  PXStoryTimelineStyle *timelineStyle;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  void *v24;
  double (*v25)(_QWORD *, __int128 *);
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  id v40;
  uint64_t v41;
  _OWORD *v42;
  _OWORD *v43;
  _BYTE *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  PXStoryTimelineStyle *v53;
  id v54;
  uint64_t v55;
  PXStoryConcreteSubtimelineScanner *v56;
  void *v57;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  PXStoryMutableConcreteTimeline *subtimelineWithClipComposition;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  PXStoryMutableConcreteTimeline *v87;
  void *v89;
  _BYTE v90[12];
  int v91;
  _BYTE *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  PXStoryConcreteSubtimelineScanner *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  id v108;
  id v109;
  _OWORD v110[2];
  uint64_t v111;
  _QWORD v112[5];
  id v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  uint64_t v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _QWORD aBlock[7];

  aBlock[5] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "assetContentInfos");
  PXSizeGetAspectRatioWithDefault();
  v16 = v15;
  if (a4 != 2)
  {
    if (a4 != 1 || v15 <= self->_maximumAspectRatioForVerticalMultipartPanorama)
      goto LABEL_7;
LABEL_6:
    v17 = 0;
    goto LABEL_31;
  }
  if (v15 < self->_minimumAspectRatioForHorizontalMultipartPanorama)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v13, "displayAssetsWithCount:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storyDisplayAssetAtIndex:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  timelineStyle = self->_timelineStyle;
  v155 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&v156 = a3->var3;
  if (-[PXStoryTimelineStyle allowsMultipartPanoramaForDisplayAsset:startTime:](timelineStyle, "allowsMultipartPanoramaForDisplayAsset:startTime:", v19, &v155))
  {
    v106 = (char *)a2;
    v107 = (uint64_t)a3;
    v103 = (_QWORD *)v14;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_axis_nextDisplayAssetsInfo_resultHandler___block_invoke;
    aBlock[3] = &__block_descriptor_40_e72_d104__0_______CGAffineTransform_dddddd______CGAffineTransform_dddddd___8l;
    *(double *)&aBlock[4] = v16;
    v21 = _Block_copy(aBlock);
    v22 = 592;
    if (a4 == 2)
      v22 = 584;
    v23 = *(id *)((char *)&self->super.isa + v22);
    v24 = v23;
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    if (v23)
      objc_msgSend(v23, "normalizedKenBurnsEffectParameters");
    v109 = v24;
    v25 = (double (*)(_QWORD *, __int128 *))v21[2];
    v157 = v164;
    v158 = v165;
    v159 = v166;
    v160 = v167;
    v155 = v162;
    v156 = v163;
    v26 = v25(v21, &v155);
    -[PXStoryConcreteSubtimelineScanner resourcesDataSource](self, "resourcesDataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "croppingContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "cropContentRectsForMultipartPanoramaAsset:axis:cropContentsRectsApectRatio:", v19, a4, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");
    if (v30)
    {
      v31 = v30;
      v95 = v29;
      v96 = v19;
      v93 = v28;
      v94 = v13;
      v108 = v21;
      v97 = v12;
      v98 = self;
      v92 = v90;
      MEMORY[0x1E0C80A78](v30);
      v33 = &v90[-32 * v32];
      MEMORY[0x1E0C80A78](v34);
      v36 = &v90[-v35];
      MEMORY[0x1E0C80A78](v37);
      v39 = &v90[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
      v40 = v109;
      if (v41 >= 1)
      {
        v42 = v33;
        v43 = v36;
        v44 = &v90[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
        v45 = v31;
        do
        {
          v46 = v165;
          v42[2] = v164;
          v42[3] = v46;
          v47 = v167;
          v42[4] = v166;
          v42[5] = v47;
          v48 = v163;
          *v42 = v162;
          v42[1] = v48;
          if (v40)
          {
            objc_msgSend(v109, "partDurationInfo");
            v49 = v160;
            v43[4] = v159;
            v43[5] = v49;
            v43[6] = v161;
            v50 = v156;
            *v43 = v155;
            v43[1] = v50;
            v51 = v158;
            v43[2] = v157;
            v43[3] = v51;
            objc_msgSend(v109, "transitionInfo");
            v40 = v109;
          }
          else
          {
            v43[5] = 0u;
            v43[6] = 0u;
            v43[3] = 0u;
            v43[4] = 0u;
            v43[1] = 0u;
            v43[2] = 0u;
            *v43 = 0u;
            *(_QWORD *)&v157 = 0;
            v155 = 0u;
            v156 = 0u;
          }
          v52 = v156;
          *(_OWORD *)v44 = v155;
          *((_OWORD *)v44 + 1) = v52;
          *((_QWORD *)v44 + 4) = v157;
          v44 += 40;
          v43 += 7;
          v42 += 6;
          --v45;
        }
        while (v45);
      }
      v53 = v98->_timelineStyle;
      v155 = *(_OWORD *)v107;
      *(_QWORD *)&v156 = *(_QWORD *)(v107 + 16);
      v29 = v95;
      v19 = v96;
      -[PXStoryTimelineStyle sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:startTime:proposedCropContentsRects:axis:normalizedKenBurnsEffectParameters:durationInfos:transitionInfos:](v53, "sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:startTime:proposedCropContentsRects:axis:normalizedKenBurnsEffectParameters:durationInfos:transitionInfos:", v96, &v155, v95, a4, v33, v36, v39);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");
      v107 = v55;
      if (v55 > v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "handleFailureInMethod:object:file:lineNumber:description:", v106, v98, CFSTR("PXStoryConcreteSubtimelineScanner.m"), 417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfParts <= proposedNumberOfParts"));

        v55 = v107;
      }
      v17 = v55 != 0;
      v12 = v97;
      if (v55)
      {
        v91 = 1;
        v56 = v98;
        -[PXStoryMutableConcreteTimeline removeAllClipsAndSegments](v98->_subtimelineWithClipComposition, "removeAllClipsAndSegments");
        v154 = 0;
        v152 = 0u;
        v153 = 0u;
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        PXStorySegmentClipCompositionInfoFromComposition(v57, (uint64_t)&v152);

        v105 = 3221225472;
        v106 = (char *)v54;
        if (v107 >= 1)
        {
          v58 = 0;
          v59 = *v103;
          v103 = (_QWORD *)v103[1];
          v104 = v59;
          v60 = *MEMORY[0x1E0C9D628];
          v61 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
          v62 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
          v63 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
          v64 = *(_QWORD *)off_1E50B86D0;
          v101 = *((_QWORD *)off_1E50B86D0 + 1);
          v102 = v64;
          v65 = *((_QWORD *)off_1E50B86D0 + 2);
          v99 = *((_QWORD *)off_1E50B86D0 + 3);
          v100 = v65;
          do
          {
            objc_msgSend(v106, "objectAtIndexedSubscript:", v58);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "CGRectValue");
            PXRectFlippedVertically();
            v68 = v67;
            v70 = v69;
            v72 = v71;
            v74 = v73;

            v75 = v33[3];
            v134 = v33[2];
            v135 = v75;
            v76 = v33[5];
            v136 = v33[4];
            v137 = v76;
            v77 = *v33;
            v78 = v33[1];
            v33 += 6;
            v132 = v77;
            v133 = v78;
            v79 = v36[5];
            v159 = v36[4];
            v160 = v79;
            v161 = v36[6];
            v80 = v36[1];
            v155 = *v36;
            v156 = v80;
            v81 = v36[3];
            v157 = v36[2];
            v158 = v81;
            v151 = *((_QWORD *)v39 + 4);
            v82 = *((_OWORD *)v39 + 1);
            v149 = *(_OWORD *)v39;
            v150 = v82;
            subtimelineWithClipComposition = v56->_subtimelineWithClipComposition;
            v112[0] = MEMORY[0x1E0C809B0];
            v112[1] = v105;
            v112[2] = __121__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_axis_nextDisplayAssetsInfo_resultHandler___block_invoke_2;
            v112[3] = &unk_1E512FE08;
            v112[4] = v56;
            v114 = v104;
            v115 = v103;
            v116 = v60;
            v117 = v61;
            v118 = v62;
            v119 = v63;
            v120 = v60;
            v121 = v61;
            v122 = v62;
            v123 = v63;
            v124 = v60;
            v125 = v61;
            v126 = v62;
            v127 = v63;
            v128 = v60;
            v129 = v61;
            v130 = v62;
            v131 = v63;
            v113 = v108;
            v138 = v68;
            v139 = v70;
            v140 = v72;
            v141 = v74;
            v84 = v36[5];
            v146 = v36[4];
            v147 = v84;
            v148 = v36[6];
            v85 = v36[1];
            v142 = *v36;
            v143 = v85;
            v86 = v36[3];
            v144 = v36[2];
            v145 = v86;
            v110[0] = v152;
            v110[1] = v153;
            v111 = v154;
            -[PXStoryMutableConcreteTimeline appendSegmentWithDurationInfo:clipCount:compositionInfo:configuration:](subtimelineWithClipComposition, "appendSegmentWithDurationInfo:clipCount:compositionInfo:configuration:", &v155, 1, v110, v112);

            v58 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)v58 + 1);
            v39 += 40;
            v36 += 7;
          }
          while (($3CC8671D27C23BF42ADDB32F2B5E48AE *)v107 != v58);
        }
        ++v56->_nextResourceIndex;
        v87 = v56->_subtimelineWithClipComposition;
        v12 = v97;
        (*((void (**)(id, PXStoryMutableConcreteTimeline *))v97 + 2))(v97, v87);
        v29 = v95;
        v19 = v96;
        v17 = v91;
        v54 = v106;
      }

      v28 = v93;
      v13 = v94;
      v21 = v108;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

LABEL_31:
  return v17;
}

- (BOOL)scanBestSubtimelineFollowingTimeline:(id)a3 loggingOptions:(unint64_t)a4 resultHandler:(id)a5
{
  id v8;
  void (**v9)(id, PXStoryMutableConcreteTimeline *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PXStoryMutableConcreteTimeline *precedingSubtimeline;
  PXStoryMutableConcreteTimeline *v14;
  void *v15;
  PXStoryMutableConcreteTimeline *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  __int128 v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  _OWORD v29[3];
  _QWORD v30[5];
  id v31;
  CMTime *p_rhs;
  _BYTE *v33;
  unint64_t v34;
  CMTimeRange v35;
  CMTime rhs;
  unint64_t v37;
  __int128 v38;
  CMTimeEpoch epoch;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CMTime v43;
  CMTime v44;
  _BYTE range[56];
  __int128 v46;
  uint64_t v47;
  CMTimeRange v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, PXStoryMutableConcreteTimeline *))a5;
  -[PXStoryMutableConcreteTimeline removeAllClipsAndSegments](self->_precedingSubtimeline, "removeAllClipsAndSegments");
  v10 = objc_msgSend(v8, "numberOfSegments");
  if ((a4 & 1) != 0)
  {
    PLStoryGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)range = 134217984;
      *(_QWORD *)&range[4] = v10;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_DEFAULT, "scan best subtimeline following timeline with %ti segments", range, 0xCu);
    }

  }
  if (v10 >= 1)
  {
    v11 = 2;
    if (v10 > 2)
      v11 = v10;
    v12 = objc_msgSend(v8, "identifierForSegmentAtIndex:", v11 - 2);
    memset(&v48, 0, sizeof(v48));
    if (v8)
    {
      objc_msgSend(v8, "timeRangeForSegmentWithIdentifier:", v12);
      objc_msgSend(v8, "timeRange");
    }
    else
    {
      v40 = 0uLL;
      v41 = 0uLL;
      v42 = 0uLL;
    }
    *(_OWORD *)range = v40;
    *(_OWORD *)&range[16] = v41;
    *(_OWORD *)&range[32] = v42;
    CMTimeRangeGetEnd(&v43, (CMTimeRange *)range);
    rhs = v48.start;
    *(CMTime *)range = v43;
    CMTimeSubtract(&v44, (CMTime *)range, &rhs);
    v48.duration = v44;
    precedingSubtimeline = self->_precedingSubtimeline;
    v38 = *(_OWORD *)&v48.start.value;
    epoch = v48.start.epoch;
    -[PXStoryMutableConcreteTimeline setStartTime:](precedingSubtimeline, "setStartTime:", &v38);
    v14 = self->_precedingSubtimeline;
    *(CMTimeRange *)range = v48;
    -[PXStoryMutableConcreteTimeline appendTimeRange:fromTimeline:](v14, "appendTimeRange:fromTimeline:", range, v8);
  }
  if ((a4 & 1) != 0)
  {
    PLStoryGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[PXStoryBaseTimeline diagnosticDescription](self->_precedingSubtimeline, "diagnosticDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)range = 138412290;
      *(_QWORD *)&range[4] = v27;
      _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "preceding subtimeline: %@", range, 0xCu);

    }
  }
  -[PXStoryMutableConcreteTimeline removeAllClipsAndSegments](self->_bestSubtimeline, "removeAllClipsAndSegments");
  -[PXStoryConcreteSubtimelineScanner timelineScorer](self, "timelineScorer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  rhs.value = 0;
  *(_QWORD *)&rhs.timescale = &rhs;
  rhs.epoch = 0x2020000000;
  v37 = 0xFFEFFFFFFFFFFFFFLL;
  *(_QWORD *)range = 0;
  *(_QWORD *)&range[8] = range;
  *(_QWORD *)&range[16] = 0x5010000000;
  *(_OWORD *)&range[40] = 0u;
  v46 = 0u;
  v47 = 0;
  *(_QWORD *)&range[24] = &unk_1A7E74EE7;
  *(_QWORD *)&range[32] = 0x7FFFFFFFFFFFFFFFLL;
  memset(&v44, 0, sizeof(v44));
  v16 = self->_precedingSubtimeline;
  if (v16)
    -[PXStoryConcreteTimeline timeRange](v16, "timeRange");
  else
    memset(&v35, 0, sizeof(v35));
  v48 = v35;
  CMTimeRangeGetEnd(&v44, &v48);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __103__PXStoryConcreteSubtimelineScanner_scanBestSubtimelineFollowingTimeline_loggingOptions_resultHandler___block_invoke;
  v30[3] = &unk_1E512FE30;
  v34 = a4;
  v30[4] = self;
  v17 = v15;
  v31 = v17;
  p_rhs = &rhs;
  v33 = range;
  v48.start = v44;
  -[PXStoryConcreteSubtimelineScanner enumeratePossibleNextSubtimelinesAfterTime:loggingOptions:usingBlock:](self, "enumeratePossibleNextSubtimelinesAfterTime:loggingOptions:usingBlock:", &v48, a4, v30);
  if (*(_QWORD *)(*(_QWORD *)&range[8] + 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = *(_OWORD *)(*(_QWORD *)&range[8] + 48);
    v29[0] = *(_OWORD *)(*(_QWORD *)&range[8] + 32);
    v29[1] = v21;
    v29[2] = *(_OWORD *)(*(_QWORD *)&range[8] + 64);
    -[PXStoryConcreteSubtimelineScanner setScanState:](self, "setScanState:", v29);
    goto LABEL_19;
  }
  -[PXStoryConcreteSubtimelineScanner timelineStyle](self, "timelineStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "allowsIncompleteTimelines");

  if (v19)
  {
    PLStoryGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v48.start.value) = 0;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "skipping trailing clips because the timeline style allows incomplete timelines", (uint8_t *)&v48, 2u);
    }

    self->_nextResourceIndex = self->_numberOfResources;
LABEL_19:
    -[PXStoryConcreteSubtimelineScanner spec](self, "spec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryConcreteSubtimelineScanner _addTitles:toTimeline:](self, "_addTitles:toTimeline:", objc_msgSend(v22, "allowedInlineTitles"), self->_bestSubtimeline);

    v9[2](v9, self->_bestSubtimeline);
    v23 = 1;
    if ((a4 & 1) == 0)
      goto LABEL_22;
    goto LABEL_29;
  }
  v23 = 0;
  if ((a4 & 1) == 0)
    goto LABEL_22;
LABEL_29:
  PLStoryGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v48.start.value) = 67109120;
    HIDWORD(v48.start.value) = v23;
    _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_DEFAULT, "scanned: %i", (uint8_t *)&v48, 8u);
  }

LABEL_22:
  _Block_object_dispose(range, 8);
  _Block_object_dispose(&rhs, 8);

  return v23;
}

- (void)_addTitles:(unint64_t)a3 toTimeline:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PXStoryConcreteSubtimelineScanner *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  SEL v28;
  _OWORD v29[3];
  _QWORD v30[4];

  v7 = a4;
  -[PXStoryConcreteSubtimelineScanner resourcesDataSource](self, "resourcesDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 && objc_msgSend(v8, "numberOfTextResources") && objc_msgSend(v7, "numberOfSegments"))
  {
    objc_msgSend(v7, "size");
    PXRectWithOriginAndSize();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0x7FFFFFFFFFFFFFFFLL;
    if (v7)
      objc_msgSend(v7, "timeRange");
    else
      memset(v29, 0, sizeof(v29));
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke;
    v18[3] = &unk_1E512FEE8;
    v23 = v11;
    v24 = v13;
    v25 = v15;
    v26 = v17;
    v19 = v7;
    v22 = v30;
    v20 = v9;
    v21 = self;
    v27 = a3;
    v28 = a2;
    objc_msgSend(v19, "enumerateSegmentsInTimeRange:usingBlock:", v29, v18);

    _Block_object_dispose(v30, 8);
  }

}

- (void)enumeratePossibleNextSubtimelinesAfterTime:(id *)a3 loggingOptions:(unint64_t)a4 usingBlock:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  _BOOL4 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v29;
  PXStoryMutableConcreteTimeline *emptySubtimeline;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _BOOL4 v34;
  int v35;
  BOOL v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  __int128 *v55;
  __int128 *v56;
  id v57;
  id v58;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v59;
  uint64_t *v60;
  __int128 v61;
  _OWORD *v62;
  _QWORD *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  NSObject *v67;
  int v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t *v83;
  __int128 *v84;
  uint64_t v85;
  SEL v86;
  void *v87;
  id v88;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v89;
  id v90;
  id v91;
  uint64_t v92;
  _BOOL4 firstDisplayAssetIsSameAsKey;
  unint64_t v94;
  uint64_t v95;
  id v96;
  _OWORD v97[3];
  __int128 v98;
  int64_t var3;
  _QWORD v100[4];
  id v101;
  void *v102;
  id v103;
  PXStoryConcreteSubtimelineScanner *v104;
  id v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD v110[15];
  _QWORD v111[6];
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  char v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD v121[4];
  id v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  char v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _OWORD v132[3];
  _QWORD v133[5];
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _OWORD v142[7];
  _BYTE v143[32];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  _BYTE v150[128];
  void *v151;
  _QWORD v152[4];

  v89 = a3;
  v86 = a2;
  v152[1] = *MEMORY[0x1E0C80C00];
  v91 = a5;
  v87 = (void *)MEMORY[0x1A85CE17C]();
  v94 = a4;
  if ((a4 & 1) != 0)
  {
    PLStoryGetLog();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)v143 = *(_OWORD *)&v89->var0;
      *(_QWORD *)&v143[16] = v89->var3;
      PXStoryTimeDescription((CMTime *)v143);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v143 = 138412290;
      *(_QWORD *)&v143[4] = v73;
      _os_log_impl(&dword_1A6789000, v72, OS_LOG_TYPE_DEFAULT, "enumerate possible next subtimelines after %@", v143, 0xCu);

    }
    if (-[PXStoryConcreteSubtimelineScanner isAtEnd](self, "isAtEnd"))
    {
      PLStoryGetLog();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v143 = 0;
        _os_log_impl(&dword_1A6789000, v74, OS_LOG_TYPE_DEFAULT, "at end", v143, 2u);
      }

      goto LABEL_86;
    }
  }
  else if (-[PXStoryConcreteSubtimelineScanner isAtEnd](self, "isAtEnd"))
  {
    goto LABEL_86;
  }
  v140 = 0u;
  v141 = 0u;
  v139 = 0u;
  -[PXStoryConcreteSubtimelineScanner scanState](self, "scanState");
  -[PXStoryConcreteSubtimelineScanner timelineStyle](self, "timelineStyle");
  v88 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteSubtimelineScanner _nextDisplayAssetsInfoWithMaximumCount:](self, "_nextDisplayAssetsInfoWithMaximumCount:", 3);
  v96 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_nextResourceIndex == -1)
  {
    if ((self->_productionOptions & 1) == 0)
    {
      objc_msgSend(v96, "displayAssetsWithCount:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "storyDisplayAssetAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_retainAutorelease(v96);
      objc_msgSend(v88, "clipCompositionForKeyAsset:contentInfo:finalPlaybackStyle:", v7, objc_msgSend(v10, "assetContentInfos"), *(_QWORD *)objc_msgSend(objc_retainAutorelease(v10), "oneUpPlaybackStyles"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v96, "displayAssetsWithCount:", objc_msgSend(v96, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)v143 = *(_OWORD *)&v89->var0;
    *(_QWORD *)&v143[16] = v89->var3;
    objc_msgSend(v88, "allowedClipCompositionsWithStartTime:nextDisplayAssets:", v143, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v8;
LABEL_9:

  if (self->_nextResourceIndex)
    firstDisplayAssetIsSameAsKey = 0;
  else
    firstDisplayAssetIsSameAsKey = self->_firstDisplayAssetIsSameAsKey;
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v135, v150, 16);
  if (v14)
  {
    v15 = 0;
    v16 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v136 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * i), "numberOfClips");
        if (v15 <= v18)
          v15 = v18;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v135, v150, 16);
    }
    while (v14);

    if (v15 < 4)
      goto LABEL_25;
    -[PXStoryConcreteSubtimelineScanner _nextDisplayAssetsInfoWithMaximumCount:](self, "_nextDisplayAssetsInfoWithMaximumCount:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v96;
    v96 = v19;
  }
  else
  {
    v20 = v13;
  }

LABEL_25:
  v21 = v96;
  if ((v94 & 1) != 0)
  {
    PLStoryGetLog();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v143 = 67109120;
      *(_DWORD *)&v143[4] = firstDisplayAssetIsSameAsKey;
      _os_log_impl(&dword_1A6789000, v75, OS_LOG_TYPE_DEFAULT, "shouldSkipOneUp: %i", v143, 8u);
    }

    v21 = v96;
  }
  if (!firstDisplayAssetIsSameAsKey)
  {
    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke;
    v133[3] = &unk_1E512FF10;
    v134 = v91;
    v133[4] = self;
    *(_OWORD *)v143 = *(_OWORD *)&v89->var0;
    *(_QWORD *)&v143[16] = v89->var3;
    v22 = -[PXStoryConcreteSubtimelineScanner _scanMultipartPanoramaSubtimelineAfterTime:nextDisplayAssetsInfo:resultHandler:](self, "_scanMultipartPanoramaSubtimelineAfterTime:nextDisplayAssetsInfo:resultHandler:", v143, v21, v133);
    v132[0] = v139;
    v132[1] = v140;
    v132[2] = v141;
    -[PXStoryConcreteSubtimelineScanner setScanState:](self, "setScanState:", v132);
    if (v22)
    {
      if ((v94 & 1) != 0)
      {
        PLStoryGetLog();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v143 = 0;
          _os_log_impl(&dword_1A6789000, v77, OS_LOG_TYPE_DEFAULT, "did scan multipart pano", v143, 2u);
        }

      }
      v13 = 0;
    }

  }
  if ((v94 & 1) != 0)
  {
    PLStoryGetLog();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v143 = 138412290;
      *(_QWORD *)&v143[4] = v13;
      _os_log_impl(&dword_1A6789000, v76, OS_LOG_TYPE_DEFAULT, "allowedClipCompositions: %@", v143, 0xCu);
    }

  }
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v90 = v13;
  v95 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
  if (v95)
  {
    v82 = v110;
    v83 = &v112;
    v81 = v111;
    v92 = *(_QWORD *)v129;
    *(_QWORD *)&v23 = 67109120;
    v79 = v23;
    *(_QWORD *)&v23 = 138412546;
    v80 = v23;
    *(_QWORD *)&v23 = 67109378;
    v78 = v23;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v129 != v92)
          objc_enumerationMutation(v90);
        v25 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v24);
        v124 = 0;
        v125 = &v124;
        v126 = 0x2020000000;
        v127 = 0;
        v26 = objc_msgSend(v25, "numberOfClips", (_QWORD)v78, *((_QWORD *)&v78 + 1));
        v27 = v26;
        if (v26 == 1 && firstDisplayAssetIsSameAsKey)
        {
          ++self->_nextResourceIndex;
          v29 = -[PXStoryConcreteSubtimelineScanner isAtEnd](self, "isAtEnd");
          if ((v94 & 1) != 0)
          {
            PLStoryGetLog();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v143 = v79;
              *(_DWORD *)&v143[4] = v29;
              _os_log_impl(&dword_1A6789000, v69, OS_LOG_TYPE_DEFAULT, "did skip one up, is at end %i", v143, 8u);
            }

          }
          if (v29)
          {
            emptySubtimeline = self->_emptySubtimeline;
            -[PXStoryConcreteSubtimelineScanner scanState](self, "scanState");
            (*((void (**)(id, PXStoryMutableConcreteTimeline *, uint64_t *, uint64_t *))v91 + 2))(v91, emptySubtimeline, &v120, v125 + 3);
            goto LABEL_75;
          }
          v121[0] = MEMORY[0x1E0C809B0];
          v121[1] = 3221225472;
          v121[2] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_45;
          v121[3] = &unk_1E512FF38;
          v122 = v91;
          v123 = &v124;
          *(_OWORD *)v143 = *(_OWORD *)&v89->var0;
          *(_QWORD *)&v143[16] = v89->var3;
          -[PXStoryConcreteSubtimelineScanner enumeratePossibleNextSubtimelinesAfterTime:loggingOptions:usingBlock:](self, "enumeratePossibleNextSubtimelinesAfterTime:loggingOptions:usingBlock:", v143, v94, v121);
          v38 = v122;
          goto LABEL_74;
        }
        v31 = v26 - 1;
        if (v26 >= 1)
        {
          v32 = objc_msgSend(v25, "numberOfAssets");
          if (v32 <= objc_msgSend(v96, "count"))
          {
            if ((unint64_t)v27 < 2)
            {
              v35 = 1;
            }
            else
            {
              v33 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v25), "clipAssetIndexes");
              do
              {
                v34 = -[NSIndexSet containsIndex:](self->_originalPlaybackStylesAllowedInNUp, "containsIndex:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(v96), "originalPlaybackStyles") + 8 * *v33));
                v35 = v34;
                v37 = v31-- != 0 && v34;
                ++v33;
              }
              while (v37);
            }
            if ((v94 & 1) != 0)
            {
              PLStoryGetLog();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v143 = v78;
                *(_DWORD *)&v143[4] = v35;
                *(_WORD *)&v143[8] = 2112;
                *(_QWORD *)&v143[10] = v25;
                _os_log_impl(&dword_1A6789000, v70, OS_LOG_TYPE_DEFAULT, "is composition allowed %i %@", v143, 0x12u);
              }

            }
            if (v35)
            {
              v39 = objc_msgSend(v25, "numberOfAssets");
              v40 = v96;
              objc_msgSend(v96, "displayAssetsWithCount:", v39);
              v41 = objc_claimAutoreleasedReturnValue();
              v42 = objc_retainAutorelease(v40);
              v85 = objc_msgSend(v42, "assetContentInfos");
              v43 = v27 - 1;
              v44 = objc_retainAutorelease(v42);
              if ((unint64_t)v27 <= 1)
                v45 = objc_msgSend(v44, "oneUpPlaybackStyles");
              else
                v45 = objc_msgSend(v44, "nUpPlaybackStyles");
              v46 = v45;
              v47 = (void *)v41;
              v119 = 0;
              v117 = 0u;
              v118 = 0u;
              v48 = (uint64_t)v88;
              if (v88)
                v48 = objc_msgSend(v88, "transitionInfoForSegmentWithClipComposition:displayAssets:", v25, v41);
              v84 = &v78;
              MEMORY[0x1E0C80A78](v48);
              v51 = (v50 + 15) & 0xFFFFFFFFFFFFFFF0;
              v52 = (char *)&v78 - v51;
              if (v27 >= 2)
              {
                v53 = (_QWORD *)((char *)&v78 - v51);
                do
                {
                  *v53 = 0;
                  v53[1] = 0;
                  v53[2] = 0;
                  v53 += 3;
                  --v43;
                }
                while (v43);
              }
              MEMORY[0x1E0C80A78](v49);
              v55 = &v78 - 2 * v54;
              v56 = v55;
              do
              {
                v56[2] = xmmword_1A7C09FA8;
                v56[3] = unk_1A7C09FB8;
                v56[4] = xmmword_1A7C09FC8;
                v56[5] = unk_1A7C09FD8;
                *v56 = PXStoryClipKenBurnsEffectParametersNull;
                v56[1] = unk_1A7C09F98;
                v56 += 6;
                --v27;
              }
              while (v27);
              v113 = 0;
              v114 = &v113;
              v115 = 0x2020000000;
              v116 = 0;
              v148 = 0u;
              v147 = 0u;
              v146 = 0u;
              v145 = 0u;
              v144 = 0u;
              memset(v143, 0, sizeof(v143));
              v57 = v88;
              if (v88)
              {
                v142[0] = *(_OWORD *)&v89->var0;
                *(_QWORD *)&v142[1] = v89->var3;
                objc_msgSend(v88, "durationInfoForSegmentWithDisplayAssets:startTime:", v47, v142);
                v57 = v88;
              }
              v100[0] = MEMORY[0x1E0C809B0];
              v100[1] = 3221225472;
              v100[2] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_46;
              v100[3] = &unk_1E512FFB0;
              v58 = v57;
              v101 = v58;
              v102 = v25;
              v38 = v47;
              v108 = v85;
              v109 = v46;
              v85 = v46;
              v59 = v89;
              v60 = v83;
              *(_OWORD *)v83 = *(_OWORD *)&v89->var0;
              v60[2] = v59->var3;
              v61 = v147;
              v63 = v81;
              v62 = v82;
              *((_OWORD *)v82 + 4) = v146;
              v62[5] = v61;
              v62[6] = v148;
              v64 = *(_OWORD *)&v143[16];
              *v62 = *(_OWORD *)v143;
              v62[1] = v64;
              v65 = v145;
              v62[2] = v144;
              v62[3] = v65;
              v110[14] = v55;
              v103 = v38;
              v104 = self;
              v63[4] = v119;
              v66 = v118;
              *(_OWORD *)v63 = v117;
              *((_OWORD *)v63 + 1) = v66;
              v105 = v91;
              v106 = &v124;
              v111[5] = v86;
              v107 = &v113;
              v98 = *(_OWORD *)&v59->var0;
              var3 = v59->var3;
              v142[4] = v146;
              v142[5] = v147;
              v142[6] = v148;
              v142[0] = *(_OWORD *)v143;
              v142[1] = *(_OWORD *)&v143[16];
              v142[3] = v145;
              v142[2] = v144;
              objc_msgSend(v58, "enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:displayAssets:finalPlaybackStyles:startTime:durationInfo:buffer:usingBlock:", v25, v38, v85, &v98, v142, v52, v100);
              if (!*((_BYTE *)v114 + 24))
              {
                PXAssertGetLog();
                v67 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(v142[0]) = v80;
                  *(_QWORD *)((char *)v142 + 4) = v88;
                  WORD6(v142[0]) = 2112;
                  *(_QWORD *)((char *)v142 + 14) = v25;
                  _os_log_fault_impl(&dword_1A6789000, v67, OS_LOG_TYPE_FAULT, "style %@ didn't enumerate any separator effect for %@", (uint8_t *)v142, 0x16u);
                }

              }
              _Block_object_dispose(&v113, 8);
LABEL_74:

            }
          }
        }
LABEL_75:
        v97[0] = v139;
        v97[1] = v140;
        v97[2] = v141;
        -[PXStoryConcreteSubtimelineScanner setScanState:](self, "setScanState:", v97);
        v68 = *((unsigned __int8 *)v125 + 24);
        _Block_object_dispose(&v124, 8);
        if (v68)
          goto LABEL_85;
        ++v24;
      }
      while (v24 != v95);
      v71 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
      v95 = v71;
    }
    while (v71);
  }
LABEL_85:

  -[PXStoryConcreteSubtimelineScanner _recycleDisplayAssetsInfo:](self, "_recycleDisplayAssetsInfo:", v96);
LABEL_86:
  objc_autoreleasePoolPop(v87);

}

- (BOOL)scanFastestSubtimelineWithDisplayAssetResourceCount:(int64_t)a3 resultHandler:(id)a4
{
  void (**v6)(id, PXStoryMutableConcreteTimeline *);
  BOOL v7;
  int64_t v8;
  uint64_t v9;
  _QWORD v12[5];

  v6 = (void (**)(id, PXStoryMutableConcreteTimeline *))a4;
  v7 = -[PXStoryConcreteSubtimelineScanner isAtEnd](self, "isAtEnd");
  if (!v7)
  {
    -[PXStoryMutableConcreteTimeline removeAllClipsAndSegments](self->_subtimelineWithRemainingClips, "removeAllClipsAndSegments");
    if (!-[PXStoryConcreteSubtimelineScanner isAtEnd](self, "isAtEnd") && a3 >= 1)
    {
      v8 = 1;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __103__PXStoryConcreteSubtimelineScanner_scanFastestSubtimelineWithDisplayAssetResourceCount_resultHandler___block_invoke;
        v12[3] = &unk_1E5131308;
        v12[4] = self;
        -[PXStoryConcreteSubtimelineScanner _scanFastestSubtimelineWithNextDisplayAssetResultHandler:](self, "_scanFastestSubtimelineWithNextDisplayAssetResultHandler:", v12);
        if (-[PXStoryConcreteSubtimelineScanner isAtEnd](self, "isAtEnd"))
          break;
      }
      while (v8++ < a3);
    }
    v6[2](v6, self->_subtimelineWithRemainingClips);
  }

  return !v7;
}

- (BOOL)scanFastestSubtimelineWithRemainingClipsResultHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[PXStoryResourcesDataSource keyAssetResource](self->_resourcesDataSource, "keyAssetResource");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_nextResourceIndex)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (!v7)
  {
    -[PXStoryResourcesDataSource displayAssetResourceAtIndex:](self->_resourcesDataSource, "displayAssetResourceAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_nextResourceIndex = objc_msgSend(v6, "isEqual:", v8);

  }
  v9 = -[PXStoryConcreteSubtimelineScanner scanFastestSubtimelineWithDisplayAssetResourceCount:resultHandler:](self, "scanFastestSubtimelineWithDisplayAssetResourceCount:resultHandler:", 0x7FFFFFFFFFFFFFFFLL, v4);

  return v9;
}

- (int64_t)numberOfRemainingResources
{
  return self->_numberOfResources - self->_nextResourceIndex;
}

- (id)_nextDisplayAssetsInfoWithMaximumCount:(int64_t)a3
{
  id v5;
  int64_t nextResourceIndex;
  int64_t v7;
  void *v8;
  void *v9;

  v5 = -[PXStoryConcreteSubtimelineScanner _newDisplayAssetsInfo](self, "_newDisplayAssetsInfo");
  nextResourceIndex = self->_nextResourceIndex;
  v7 = -[PXStoryConcreteSubtimelineScanner numberOfRemainingResources](self, "numberOfRemainingResources");
  if (v7 < a3)
    a3 = v7;
  -[PXStoryConcreteSubtimelineScanner resourcesDataSource](self, "resourcesDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteSubtimelineScanner timelineStyle](self, "timelineStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithRange:resourcesDataSource:timelineStyle:nUpPlaybackStyleMapping:", nextResourceIndex, a3, v8, v9, self->_nUpPlaybackStyleMapping);

  return v5;
}

- (id)_newDisplayAssetsInfo
{
  id result;

  -[NSMutableArray px_popFirst](self->_reusableDisplayAssetInfos, "px_popFirst");
  result = (id)objc_claimAutoreleasedReturnValue();
  if (!result)
    return objc_alloc_init(_PXStoryDisplayAssetsInfo);
  return result;
}

- (void)_recycleDisplayAssetsInfo:(id)a3
{
  -[NSMutableArray addObject:](self->_reusableDisplayAssetInfos, "addObject:", a3);
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (PXStoryTimelineSpec)spec
{
  return self->_spec;
}

- (PXStoryTimelineStyle)timelineStyle
{
  return self->_timelineStyle;
}

- (PXStoryTimelineScorer)timelineScorer
{
  return self->_timelineScorer;
}

- (NSArray)randomNumberGenerators
{
  return self->_randomNumberGenerators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomNumberGenerators, 0);
  objc_storeStrong((id *)&self->_timelineScorer, 0);
  objc_storeStrong((id *)&self->_timelineStyle, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_defaultVerticalMultipartPanoramaParameters, 0);
  objc_storeStrong((id *)&self->_defaultHorizontalMultipartPanoramaParameters, 0);
  objc_storeStrong((id *)&self->_reusableDisplayAssetInfos, 0);
  objc_storeStrong((id *)&self->_originalPlaybackStylesAllowedInNUp, 0);
  objc_storeStrong((id *)&self->_emptySubtimeline, 0);
  objc_storeStrong((id *)&self->_subtimelineWithRemainingClips, 0);
  objc_storeStrong((id *)&self->_precedingSubtimelineWithCandidateAndSubsequentSubtimelines, 0);
  objc_storeStrong((id *)&self->_precedingSubtimelineWithCandidateSubtimeline, 0);
  objc_storeStrong((id *)&self->_precedingSubtimeline, 0);
  objc_storeStrong((id *)&self->_candidateSubtimeline, 0);
  objc_storeStrong((id *)&self->_bestSubtimeline, 0);
  objc_storeStrong((id *)&self->_subtimelineWithClipComposition, 0);
}

uint64_t __103__PXStoryConcreteSubtimelineScanner_scanFastestSubtimelineWithDisplayAssetResourceCount_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "appendTimeline:", a2);
}

void __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _OWORD v6[3];
  char v7;

  v3 = a2;
  v7 = 0;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v4, "scanState");
  else
    memset(v6, 0, sizeof(v6));
  (*(void (**)(uint64_t, id, _OWORD *, char *))(v5 + 16))(v5, v3, v6, &v7);

}

uint64_t __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_45(uint64_t a1, uint64_t a2, _OWORD *a3, _BYTE *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t);
  __int128 v11;
  uint64_t result;
  _OWORD v13[3];

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v10 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t))(v8 + 16);
  v11 = a3[1];
  v13[0] = *a3;
  v13[1] = v11;
  v13[2] = a3[2];
  result = v10(v8, a2, v13, v9, a5, a6);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

void __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[6];
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _BYTE buf[32];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 216);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_2;
  v30[3] = &unk_1E512FF88;
  v10 = *(void **)(a1 + 48);
  v30[4] = *(_QWORD *)(a1 + 56);
  v30[5] = v6;
  v31 = v10;
  v35 = *(_OWORD *)(a1 + 88);
  v11 = *(_OWORD *)(a1 + 240);
  v37 = *(_OWORD *)(a1 + 224);
  v38 = v11;
  v12 = *(_QWORD *)(a1 + 256);
  v36 = a2;
  v39 = v12;
  v13 = *(_OWORD *)(a1 + 272);
  v48 = *(_QWORD *)(a1 + 288);
  v14 = *(_OWORD *)(a1 + 120);
  v15 = *(_OWORD *)(a1 + 136);
  v40 = *(_OWORD *)(a1 + 104);
  v41 = v14;
  v16 = *(_OWORD *)(a1 + 152);
  v17 = *(_OWORD *)(a1 + 168);
  v46 = *(_OWORD *)(a1 + 200);
  v47 = v13;
  v18 = *(_OWORD *)(a1 + 184);
  v44 = v17;
  v45 = v18;
  v42 = v15;
  v43 = v16;
  v19 = *(id *)(a1 + 64);
  v20 = *(_QWORD *)(a1 + 72);
  v32 = v19;
  v33 = v20;
  v34 = &v49;
  v28 = *(_OWORD *)(a1 + 272);
  v29 = *(_QWORD *)(a1 + 288);
  v21 = *(_OWORD *)(a1 + 152);
  v22 = *(_OWORD *)(a1 + 184);
  v56 = *(_OWORD *)(a1 + 168);
  v57 = v22;
  v58 = *(_OWORD *)(a1 + 200);
  v23 = *(_OWORD *)(a1 + 120);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 104);
  *(_OWORD *)&buf[16] = v23;
  v54 = *(_OWORD *)(a1 + 136);
  v55 = v21;
  objc_msgSend(v5, "enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:displayAssets:assetContentInfos:finalPlaybackStyles:startTime:durationInfo:separatorEffectParameters:separatorEffectContext:buffer:usingBlock:", v6, v31, v7, v8, &v28, buf, a2, a3, v9, v30);
  if (!*((_BYTE *)v50 + 24))
  {
    PXAssertGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      _os_log_fault_impl(&dword_1A6789000, v24, OS_LOG_TYPE_FAULT, "style %@ didn't enumerate any Ken Burns for %@", buf, 0x16u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;

  _Block_object_dispose(&v49, 8);
}

void __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[7];
  __int128 v17;
  uint64_t v18;
  _OWORD v19[2];
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_3;
  v21[3] = &unk_1E512FF60;
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v21[4] = *(_QWORD *)(a1 + 32);
  v22 = v10;
  v23 = *(_QWORD *)(a1 + 64);
  v11 = *(_OWORD *)(a1 + 120);
  v19[0] = *(_OWORD *)(a1 + 104);
  v19[1] = v11;
  v20 = *(_QWORD *)(a1 + 136);
  v12 = *(_OWORD *)(a1 + 256);
  v16[6] = *(_OWORD *)(a1 + 240);
  v17 = v12;
  v18 = *(_QWORD *)(a1 + 272);
  v13 = *(_OWORD *)(a1 + 224);
  v16[4] = *(_OWORD *)(a1 + 208);
  v16[5] = v13;
  v14 = *(_OWORD *)(a1 + 160);
  v16[0] = *(_OWORD *)(a1 + 144);
  v16[1] = v14;
  v15 = *(_OWORD *)(a1 + 192);
  v16[2] = *(_OWORD *)(a1 + 176);
  v16[3] = v15;
  objc_msgSend(v4, "scanSubtimelineWithClipComposition:displayAssets:assetContentInfos:playbackStyles:separatorEffectParameters:kenBurnsEffectParameters:transitionInfo:startTime:durationInfo:resultHandler:", v5, v9, v6, v7, v8, a2, v19, &v17, v16, v21);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

}

void __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _OWORD v6[3];

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  if (v4)
    objc_msgSend(v4, "scanState");
  else
    memset(v6, 0, sizeof(v6));
  (*(void (**)(uint64_t, id, _OWORD *, uint64_t))(v5 + 16))(v5, v3, v6, *(_QWORD *)(a1[6] + 8) + 24);

}

void __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t i;
  __int128 *v9;
  __int128 v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  uint64_t v34;
  _OWORD v35[3];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  if (a2 >= 1)
  {
    for (i = 0; i != a2; ++i)
    {
      v9 = (__int128 *)(a3 + 48 * i);
      v10 = v9[1];
      v51 = *v9;
      v52 = v10;
      v53 = v9[2];
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 0;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_2;
      v39[3] = &unk_1E512FEC0;
      v43 = *(_QWORD *)(a1 + 56);
      v11 = *(void **)(a1 + 32);
      v12 = *(id *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 96);
      v14 = *(_QWORD *)(a1 + 104);
      v44 = &v47;
      v45 = v13;
      v15 = *(_QWORD *)(a1 + 48);
      v40 = v12;
      v41 = v15;
      v46 = v14;
      v42 = *(id *)(a1 + 32);
      v25 = v51;
      v26 = v52;
      v27 = v53;
      objc_msgSend(v11, "enumerateConcreteClipsInTimeRange:rect:usingBlock:", &v25, v39, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      if (v48[3] >= 1)
      {
        v16 = 0;
        v17 = a4 + 200 * i;
        v18 = *(_OWORD *)(v17 + 64);
        v36 = *(_OWORD *)(v17 + 48);
        v37 = v18;
        v38 = *(_QWORD *)(v17 + 80);
        do
        {
          v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 576) + 8 * v16);
          v20 = *(void **)(a1 + 32);
          v35[0] = v51;
          v35[1] = v52;
          v35[2] = v53;
          v21 = *(double *)(a1 + 64);
          v22 = *(double *)(a1 + 72);
          v23 = *(double *)(a1 + 80);
          v24 = *(double *)(a1 + 88);
          v33[0] = v36;
          v33[1] = v37;
          v34 = v38;
          v32 = 0;
          v29 = xmmword_1A7C0BF70;
          v30 = xmmword_1A7C0BF80;
          v31 = xmmword_1A7C0BF90;
          v25 = PXStoryKenBurnsAnimationInfoNone;
          v26 = unk_1A7C0BF40;
          v27 = xmmword_1A7C0BF50;
          v28 = xmmword_1A7C0BF60;
          objc_msgSend(v20, "insertClipInTimeRange:resourceKind:options:resourceIndex:frame:transitionInfo:kenBurnsAnimationInfo:", v35, 3, 0, v19, v33, &v25, v21, v22, v23, v24);
          ++v16;
        }
        while (v16 < v48[3]);
      }

      _Block_object_dispose(&v47, 8);
    }
  }
}

uint64_t __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v21[7];

  if (a2 >= 1)
  {
    v11 = result;
    v12 = 0;
    v13 = (_QWORD *)(a5 + 8);
    v14 = MEMORY[0x1E0C809B0];
    while (1)
    {
      if (*v13 == 1)
      {
        v15 = *(_QWORD *)(a6 + 8 * v12);
        if (v15 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v11 + 56) + 8) + 24))
        {
          v21[0] = v14;
          v21[1] = 3221225472;
          v21[2] = __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_3;
          v21[3] = &unk_1E512FE58;
          v17 = *(_QWORD *)(v11 + 64);
          v16 = *(_QWORD *)(v11 + 72);
          v18 = *(void **)(v11 + 32);
          v21[4] = *(_QWORD *)(v11 + 40);
          v21[5] = v17;
          v21[6] = *(_QWORD *)(v11 + 80);
          result = objc_msgSend(v18, "enumerateTextResourcesForTitles:displayAssetResourceAtIndex:usingBlock:", v16, v15, v21);
          if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(v11 + 64) + 8) + 24) > 0)
            break;
        }
      }
      v13 += 96;
      if (a2 == ++v12)
        return result;
    }
    result = objc_msgSend(*(id *)(v11 + 48), "modifyOptionsForClipWithIdentifier:hintIndex:usingBlock:", *(_QWORD *)(a5 + 768 * v12), v12 + a7, &__block_literal_global_40_160791);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v11 + 56) + 8) + 24) = v15;
    *a8 = 1;
  }
  return result;
}

void __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v4 >= *(_QWORD *)(v3 + 568))
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568);
      v7 = 134217984;
      v8 = v6;
      _os_log_fault_impl(&dword_1A6789000, v5, OS_LOG_TYPE_FAULT, "more title text resources than expected (%li)", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(v3 + 576) + 8 * v4) = a2;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
}

void __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_38(uint64_t a1, _QWORD *a2)
{
  *a2 |= 8uLL;
}

void __103__PXStoryConcreteSubtimelineScanner_scanBestSubtimelineFollowingTimeline_loggingOptions_resultHandler___block_invoke(uint64_t a1, void *a2, __int128 *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  CMTimeValue v19;
  NSObject *v20;
  CMTimeValue v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  CMTimeRange v29;
  CMTime v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  unint64_t v38;
  CMTimeRange range;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    PLStoryGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "diagnosticDescription");
      LODWORD(range.start.value) = 138412290;
      *(CMTimeValue *)((char *)&range.start.value + 4) = objc_claimAutoreleasedReturnValue();
      v17 = *(void **)((char *)&range.start.value + 4);
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "possible next subtimeline 1: %@", (uint8_t *)&range, 0xCu);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setTimeline:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setTimeline:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "appendTimeline:", v5);
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0xFFEFFFFFFFFFFFFFLL;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  memset(&v30, 0, sizeof(v30));
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (v6)
    objc_msgSend(v6, "timeRange");
  else
    memset(&v29, 0, sizeof(v29));
  range = v29;
  CMTimeRangeGetEnd(&v30, &range);
  v7 = *(_QWORD *)(a1 + 64);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __103__PXStoryConcreteSubtimelineScanner_scanBestSubtimelineFollowingTimeline_loggingOptions_resultHandler___block_invoke_35;
  v24[3] = &unk_1E512FE30;
  v28 = v7;
  v9 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v26 = &v31;
  v24[4] = v9;
  v25 = v8;
  v27 = &v35;
  range.start = v30;
  objc_msgSend(v9, "enumeratePossibleNextSubtimelinesAfterTime:loggingOptions:usingBlock:", &range, v7, v24);
  if (!*((_BYTE *)v32 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "scoreForTimeline:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
    *((_QWORD *)v36 + 3) = v10;
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    {
      PLStoryGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *((_QWORD *)v36 + 3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "diagnosticDescription");
        v22 = objc_claimAutoreleasedReturnValue();
        LODWORD(range.start.value) = 134218242;
        *(CMTimeValue *)((char *)&range.start.value + 4) = v21;
        LOWORD(range.start.flags) = 2112;
        *(_QWORD *)((char *)&range.start.flags + 2) = v22;
        v23 = (void *)v22;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "score %f for %@", (uint8_t *)&range, 0x16u);

      }
    }
  }
  v11 = v36[3];
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v11 > *(double *)(v12 + 24))
  {
    *(double *)(v12 + 24) = v11;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setTimeline:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
    v13 = *(_OWORD **)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *a3;
    v15 = a3[2];
    v13[3] = a3[1];
    v13[4] = v15;
    v13[2] = v14;
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    {
      PLStoryGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        LODWORD(range.start.value) = 134217984;
        *(CMTimeValue *)((char *)&range.start.value + 4) = v19;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "bestScore: %f", (uint8_t *)&range, 0xCu);
      }

    }
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

}

void __103__PXStoryConcreteSubtimelineScanner_scanBestSubtimelineFollowingTimeline_loggingOptions_resultHandler___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  double v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    PLStoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "diagnosticDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = *(double *)&v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "possible next subtimeline 2: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setTimeline:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "appendTimeline:", v3);
  objc_msgSend(*(id *)(a1 + 40), "scoreForTimeline:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  v5 = v4;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    PLStoryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "diagnosticDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218242;
      v12 = v5;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "score %f for %@", (uint8_t *)&v11, 0x16u);

    }
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v5 > *(double *)(v6 + 24))
    *(double *)(v6 + 24) = v5;

}

double __121__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_axis_nextDisplayAssetsInfo_resultHandler___block_invoke(uint64_t a1)
{
  double v2;

  PXStoryClipKenBurnsEffectsGetContentsRectBounds();
  PXSizeGetAspectRatio();
  return v2 / *(double *)(a1 + 32);
}

double __121__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_axis_nextDisplayAssetsInfo_resultHandler___block_invoke_2(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _OWORD *a6, _OWORD *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _QWORD *a12)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void (*v29)(void);
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  double result;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  *a2 = 1;
  *a3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  PXRectWithOriginAndSize();
  *a4 = v18;
  a4[1] = v19;
  a4[2] = v20;
  a4[3] = v21;
  *a5 = 1;
  v22 = *(_OWORD *)(a1 + 128);
  v23 = *(_OWORD *)(a1 + 144);
  v24 = *(_OWORD *)(a1 + 176);
  a6[7] = *(_OWORD *)(a1 + 160);
  a6[8] = v24;
  a6[5] = v22;
  a6[6] = v23;
  v25 = *(_OWORD *)(a1 + 64);
  v26 = *(_OWORD *)(a1 + 80);
  v27 = *(_OWORD *)(a1 + 112);
  a6[3] = *(_OWORD *)(a1 + 96);
  a6[4] = v27;
  a6[1] = v25;
  a6[2] = v26;
  *a6 = *(_OWORD *)(a1 + 48);
  v28 = *((_OWORD *)off_1E50B8020 + 1);
  *a7 = *(_OWORD *)off_1E50B8020;
  a7[1] = v28;
  *(_QWORD *)(a8 + 208) = 0;
  *(_OWORD *)(a8 + 160) = xmmword_1A7C0BEF8;
  *(_OWORD *)(a8 + 176) = xmmword_1A7C0BF08;
  *(_OWORD *)(a8 + 192) = xmmword_1A7C0BF18;
  *(_OWORD *)(a8 + 96) = xmmword_1A7C0BEB8;
  *(_OWORD *)(a8 + 112) = unk_1A7C0BEC8;
  *(_OWORD *)(a8 + 128) = xmmword_1A7C0BED8;
  *(_OWORD *)(a8 + 144) = xmmword_1A7C0BEE8;
  *(_OWORD *)(a8 + 32) = xmmword_1A7C0BE78;
  *(_OWORD *)(a8 + 48) = unk_1A7C0BE88;
  *(_OWORD *)(a8 + 64) = xmmword_1A7C0BE98;
  *(_OWORD *)(a8 + 80) = unk_1A7C0BEA8;
  *(_OWORD *)a8 = PXStoryClippingAnimationInfoNone;
  *(_OWORD *)(a8 + 16) = unk_1A7C0BE68;
  v29 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  v30 = *(_OWORD *)(a1 + 240);
  v45 = *(_OWORD *)(a1 + 224);
  v46 = v30;
  v31 = *(_OWORD *)(a1 + 272);
  v47 = *(_OWORD *)(a1 + 256);
  v48 = v31;
  v32 = *(_OWORD *)(a1 + 208);
  v43 = *(_OWORD *)(a1 + 192);
  v44 = v32;
  v29();
  PXRectWithAspectRatioFittingRect();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  PXStoryClipKenBurnsEffectsTransformedWithContentsRectBounds(&v43);
  v34 = v43;
  v33 = v44;
  v35 = v45;
  v36 = v46;
  v37 = v48;
  v38 = *(_QWORD *)(a1 + 360);
  v39 = *(_OWORD *)(a1 + 344);
  *(_OWORD *)(a9 + 64) = v47;
  *(_OWORD *)(a9 + 80) = v37;
  *(_OWORD *)(a9 + 96) = v39;
  *(_QWORD *)(a9 + 112) = v38;
  *(_OWORD *)a9 = v34;
  *(_OWORD *)(a9 + 16) = v33;
  *(_OWORD *)(a9 + 32) = v35;
  *(_OWORD *)(a9 + 48) = v36;
  v40 = *(_OWORD *)(a1 + 432);
  v41 = *(_OWORD *)(a1 + 448);
  *(_QWORD *)(a10 + 32) = *(_QWORD *)(a1 + 464);
  *(_OWORD *)a10 = v40;
  *(_OWORD *)(a10 + 16) = v41;
  *(_QWORD *)(a11 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a11 + 16) = 0u;
  *(_OWORD *)(a11 + 32) = 0u;
  *(_OWORD *)a11 = 0u;
  *a12 = 0;
  return result;
}

uint64_t __116__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_nextDisplayAssetsInfo_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 80);
    result = objc_msgSend(v5, "_scanMultipartPanoramaSubtimelineAfterTime:axis:nextDisplayAssetsInfo:resultHandler:", &v8, a2, v6, v7);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

void __223__PXStoryConcreteSubtimelineScanner__scanSubtimelineWithClipComposition_displayAssets_assetContentInfos_playbackStyles_separatorEffectParameters_kenBurnsEffectParameters_transitionInfo_startTime_durationInfo_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6, uint64_t a7, uint64_t a8, __int128 *a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 *v34;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _OWORD *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  int v50;
  __int128 *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v75;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  _QWORD v88[6];

  objc_msgSend(*(id *)(a1 + 32), "spec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 72) == 1 && (v18 = *(void **)(a1 + 40)) != 0)
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "aspectRatio");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v20;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "getClipFrames:forContext:", a4, *(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v17, "safeAreaInsets");
  objc_msgSend(v17, "viewportSize");
  PXRectWithOriginAndSize();
  PXEdgeInsetsForRectsFromEdgeInsetsForRect();
  v21 = *(_QWORD *)(a1 + 80);
  if (v21)
  {
    v22 = *(_QWORD *)(a1 + 72);
    v79 = *(_OWORD *)(a1 + 112);
    *(_QWORD *)&v80 = *(_QWORD *)(a1 + 128);
    *(_QWORD *)&v78 = v22;
    *((_QWORD *)&v78 + 1) = a4;
    PXStoryClipSeparatorEffectGetClippingAnimationInfosAdjustedClipFramesForParametersAndContext(a8, a4, a7, v21, (uint64_t)&v78);
  }
  v23 = *(void **)(a1 + 40);
  if (v23)
  {
    v24 = *(__int128 **)(a1 + 200);
    if (!v24)
    {
      objc_msgSend(v23, "resourcesDataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "croppingContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "numberOfClips") >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 32), CFSTR("PXStoryConcreteSubtimelineScanner.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clipComposition.numberOfClips <= sizeof(_noKenBurnsEffectParameters) / sizeof(_noKenBurnsEffectParameters[0])"));

      }
      if (!*(_QWORD *)(a1 + 216))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 32), CFSTR("PXStoryConcreteSubtimelineScanner.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetContentInfos != NULL"));

      }
      v27 = *(_QWORD *)(a1 + 224);
      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 32), CFSTR("PXStoryConcreteSubtimelineScanner.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playbackStyles != NULL"));

        v27 = *(_QWORD *)(a1 + 224);
      }
      v29 = *(_QWORD *)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 48);
      v30 = *(_QWORD *)(a1 + 216);
      v31 = *(_QWORD *)(a1 + 80);
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __223__PXStoryConcreteSubtimelineScanner__scanSubtimelineWithClipComposition_displayAssets_assetContentInfos_playbackStyles_separatorEffectParameters_kenBurnsEffectParameters_transitionInfo_startTime_durationInfo_resultHandler___block_invoke_2;
      v88[3] = &unk_1E5142BE8;
      v88[4] = *(_QWORD *)(a1 + 32);
      +[PXStoryClipKenBurnsEffectFactory factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:](PXStoryClipKenBurnsEffectFactory, "factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:", v17, v28, v29, v26, 0, v30, v27, v31, v88);
      v24 = (__int128 *)(*(_QWORD *)(a1 + 32) + 168);

    }
  }
  else
  {
    v24 = 0;
  }
  v73 = v17;
  v75 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "clipAssetIndexes");
  if (*(uint64_t *)(a1 + 72) >= 1)
  {
    v32 = 0;
    v34 = (__int128 *)(a1 + 232);
    do
    {
      v37 = *(_QWORD *)(v75 + 8 * v32);
      *(_QWORD *)(a2 + 8 * v32) = 1;
      if (*(_BYTE *)(a1 + 272)
        && (objc_msgSend(*(id *)(a1 + 48), "clipFramesExtendToBounds") & 1) == 0
        && objc_msgSend(*(id *)(a1 + 48), "numberOfClips") == 1)
      {
        *(_QWORD *)(a12 + 8 * v32) |= 4uLL;
      }
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + v37;
      *(_QWORD *)(a3 + 8 * v32) = v38;
      if (v38 == -1)
        *(_QWORD *)(a12 + 8 * v32) |= 2uLL;
      v39 = *(_QWORD *)(a1 + 224);
      if (v39)
        *(_QWORD *)(a5 + 8 * v32) = *(_QWORD *)(v39 + 8 * v37);
      v40 = *(void **)(a1 + 40);
      if (v40)
      {
        objc_msgSend(v40, "storyDisplayAssetAtIndex:", v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (_OWORD *)(*(_QWORD *)(a1 + 216) + 144 * v37);
        v44 = v42[7];
        v43 = v42[8];
        v45 = v42[6];
        a6[5] = v42[5];
        a6[6] = v45;
        a6[7] = v44;
        a6[8] = v43;
        v47 = v42[3];
        v46 = v42[4];
        v48 = v42[2];
        a6[1] = v42[1];
        a6[2] = v48;
        a6[3] = v47;
        a6[4] = v46;
        *a6 = *v42;
        +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "forceMinDurationKenBurnsAnimations");
        v51 = (__int128 *)(a1 + 112);
        if (v50)
          v51 = (__int128 *)(a1 + 88);
        v86 = *v51;
        v87 = *((_QWORD *)v51 + 2);

        v52 = *v24;
        v53 = v24[1];
        v54 = v24[2];
        v81 = v24[3];
        v83 = v24[5];
        v82 = v24[4];
        v85 = v87;
        v84 = v86;
        *a9 = v52;
        a9[1] = v53;
        v55 = v81;
        v56 = v82;
        a9[2] = v54;
        a9[3] = v55;
        *((_QWORD *)a9 + 14) = v85;
        v57 = v84;
        a9[5] = v83;
        a9[6] = v57;
        a9[4] = v56;
        v58 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v60 = a9[5];
        v59 = a9[6];
        v61 = a9[4];
        *(_QWORD *)(v58 + 144) = *((_QWORD *)a9 + 14);
        *(_OWORD *)(v58 + 112) = v60;
        *(_OWORD *)(v58 + 128) = v59;
        *(_OWORD *)(v58 + 96) = v61;
        v62 = *a9;
        v63 = a9[1];
        v64 = a9[3];
        *(_OWORD *)(v58 + 64) = a9[2];
        *(_OWORD *)(v58 + 80) = v64;
        *(_OWORD *)(v58 + 32) = v62;
        *(_OWORD *)(v58 + 48) = v63;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_QWORD *)(a3 + 8 * v32);
        *(_QWORD *)&v81 = 0;
        v79 = 0u;
        v80 = 0u;
        v78 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "timelineStyle");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v65;
        if (v65)
        {
          objc_msgSend(v65, "audioInfoForDisplayAsset:", v41);
        }
        else
        {
          *(_QWORD *)&v81 = 0;
          v79 = 0u;
          v80 = 0u;
          v78 = 0u;
        }

        v67 = v79;
        *(_OWORD *)a11 = v78;
        *(_OWORD *)(a11 + 16) = v67;
        *(_OWORD *)(a11 + 32) = v80;
        *(_QWORD *)(a11 + 48) = v81;

      }
      if (*(_BYTE *)v34)
      {
        v68 = *v34;
        v69 = *(_OWORD *)(a1 + 248);
        *(_QWORD *)(a10 + 32) = *(_QWORD *)(a1 + 264);
        *(_OWORD *)a10 = v68;
        *(_OWORD *)(a10 + 16) = v69;
      }
      ++v32;
      v24 += 6;
      a10 += 40;
      a11 += 56;
      a9 = (__int128 *)((char *)a9 + 120);
      a6 += 9;
    }
    while (v32 < *(_QWORD *)(a1 + 72));
  }

}

uint64_t __223__PXStoryConcreteSubtimelineScanner__scanSubtimelineWithClipComposition_displayAssets_assetContentInfos_playbackStyles_separatorEffectParameters_kenBurnsEffectParameters_transitionInfo_startTime_durationInfo_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getParametersForNoEffect:", *(_QWORD *)(a1 + 32) + 168);
}

void __94__PXStoryConcreteSubtimelineScanner__scanFastestSubtimelineWithNextDisplayAssetResultHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_scanFastestSubtimelineWithNextDisplayAssetResultHandler__oneUpComposition;
  _scanFastestSubtimelineWithNextDisplayAssetResultHandler__oneUpComposition = v0;

}

uint64_t __50__PXStoryConcreteSubtimelineScanner_setScanState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setSeed:", *(_QWORD *)(a1 + 8 * a3 + 40));
}

uint64_t __46__PXStoryConcreteSubtimelineScanner_scanState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "seed");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8 * a3 + 40) = result;
  return result;
}

PXStoryMutableConcreteTimeline *__59__PXStoryConcreteSubtimelineScanner_initWithConfiguration___block_invoke(uint64_t a1)
{
  PXStoryMutableConcreteTimeline *v2;

  v2 = [PXStoryMutableConcreteTimeline alloc];
  objc_msgSend(*(id *)(a1 + 32), "viewportSize");
  return -[PXStoryConcreteTimeline initWithSize:resourcesDataSource:](v2, "initWithSize:resourcesDataSource:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 616));
}

@end
