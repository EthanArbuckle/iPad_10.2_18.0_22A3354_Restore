@implementation PXStoryConcreteTimelineStyle

- (PXStoryConcreteTimelineStyle)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteStyle.m"), 412, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteTimelineStyle init]");

  abort();
}

- (PXStoryConcreteTimelineStyle)initWithSpec:(id)a3 audioAsset:(id)a4 cueSource:(id)a5 overallDurationInfo:(id *)a6 autoEditDecisionList:(id)a7 autoEditConfiguration:(id)a8 allowedKeyAssetClipCompositions:(id)a9 allowedClipCompositions:(id)a10 randomNumberGenerators:(id)a11 errorReporter:(id)a12 allowsIncompleteTimelines:(BOOL)a13 styleOptions:(id)a14 storyConfiguration:(id)a15
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  char *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id WeakRetained;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __CFString *v51;
  uint64_t v52;
  void *v53;
  __CFString *v54;
  PXStoryRecipeClipTransitionProvider *v55;
  void *v56;
  PXStoryRecipeClipMotionStyleProvider *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v64;
  id v65;
  id v67;
  id v68;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  objc_super v79;

  v19 = a3;
  v67 = a4;
  v20 = a4;
  v68 = a5;
  v21 = a5;
  v22 = v20;
  v77 = v21;
  v65 = a7;
  v76 = a7;
  v75 = a8;
  v74 = a9;
  v73 = a10;
  v23 = a11;
  v72 = a12;
  v78 = a15;
  v79.receiver = self;
  v79.super_class = (Class)PXStoryConcreteTimelineStyle;
  v24 = -[PXStoryConcreteTimelineStyle init](&v79, sel_init);
  if (v24)
  {
    v71 = v23;
    v64 = v19;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)v24 + 1, a3);
    v24[16] = objc_msgSend(*((id *)v24 + 1), "layoutDirection") == 2;
    objc_storeStrong((id *)v24 + 3, v67);
    if (v22)
      v26 = objc_msgSend(v22, "pace");
    else
      v26 = 2;
    *((_QWORD *)v24 + 4) = v26;
    *($1A23BB056C565A410801C90FE7234890 *)(v24 + 40) = a14;
    objc_storeStrong((id *)v24 + 27, v68);
    objc_storeWeak((id *)v24 + 39, v78);
    *((_DWORD *)v24 + 63) = 0;
    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = (void *)*((_QWORD *)v24 + 32);
    *((_QWORD *)v24 + 32) = v27;

    WeakRetained = objc_loadWeakRetained((id *)v24 + 39);
    v30 = objc_msgSend(WeakRetained, "preferFaceCrops");

    if (v30)
    {
      *(int64x2_t *)(v24 + 56) = vdupq_n_s64(2uLL);
    }
    else
    {
      v31 = *((_QWORD *)v24 + 5);
      *((_QWORD *)v24 + 7) = v31;
      *((_QWORD *)v24 + 8) = v31 & 0xFFFFFFFFFFFFFFFELL;
    }
    v32 = objc_msgSend(v25, "transitionShowcaseMode");
    v24[72] = objc_msgSend(v25, "allowsDefaultBehaviorForShowcaseMode:", v32);
    v24[73] = objc_msgSend(v25, "allowsRandomFallbackForShowcaseMode:", v32);
    objc_msgSend(v25, "possibleTransitionKindsForFallback:", objc_msgSend(v25, "transitionFallback"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v24 + 10);
    *((_QWORD *)v24 + 10) = v33;

    v35 = objc_msgSend(v25, "separatorEffectsShowcaseMode");
    v24[88] = objc_msgSend(v25, "allowsDefaultBehaviorForShowcaseMode:", v35);
    v24[89] = objc_msgSend(v25, "allowsRandomFallbackForShowcaseMode:", v35);
    v36 = objc_msgSend(v25, "kenBurnsShowcaseMode");
    v24[90] = objc_msgSend(v25, "allowsDefaultBehaviorForShowcaseMode:", v36);
    v24[91] = objc_msgSend(v25, "allowsRandomFallbackForShowcaseMode:", v36);
    *((_OWORD *)v24 + 6) = *(_OWORD *)&a6->var0;
    v37 = *(_OWORD *)&a6->var1.var2.var1;
    v39 = *(_OWORD *)&a6->var1.var0.var1;
    v38 = *(_OWORD *)&a6->var1.var1.var0;
    *((_OWORD *)v24 + 9) = *(_OWORD *)&a6->var1.var1.var3;
    *((_OWORD *)v24 + 10) = v37;
    *((_OWORD *)v24 + 7) = v39;
    *((_OWORD *)v24 + 8) = v38;
    objc_storeStrong((id *)v24 + 22, v65);
    objc_storeStrong((id *)v24 + 23, a9);
    objc_storeStrong((id *)v24 + 24, a10);
    objc_msgSend(v23, "firstObject");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v24 + 25);
    *((_QWORD *)v24 + 25) = v40;

    objc_storeStrong((id *)v24 + 26, a12);
    *((_QWORD *)v24 + 28) = 0x3FF0000000000000;
    if (objc_msgSend(v78, "movementAnimationCurve") == 5)
    {
      objc_msgSend(v25, "movementAnimationLinearFraction");
      *((double *)v24 + 28) = *((double *)v24 + 28) / v42;
    }
    objc_msgSend(*((id *)v24 + 1), "viewportSize");
    v44 = v43;
    objc_msgSend(*((id *)v24 + 1), "viewportSize");
    if (v44 >= v45)
      v46 = v44;
    else
      v46 = v45;
    if (v46 >= 1.0)
      v47 = 2.0 / v46;
    else
      v47 = 2.0;
    *((double *)v24 + 29) = v47;
    PXDegreesToRadians();
    *((_QWORD *)v24 + 30) = v48;
    objc_storeStrong((id *)v24 + 35, a8);
    if (v22)
    {
      v49 = objc_msgSend(v22, "pace");
      v50 = v22;
      objc_msgSend(v22, "colorGradeCategory");
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = 0;
      PFStoryColorGradeKindToString();
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v52;
      v54 = CFSTR("None");
      if (v52)
        v54 = (__CFString *)v52;
      v51 = v54;

      v49 = 2;
    }
    v55 = -[PXStoryRecipeClipTransitionProvider initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:]([PXStoryRecipeClipTransitionProvider alloc], "initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:", *((_QWORD *)v24 + 35), v51, v49, *((_QWORD *)v24 + 25));
    v56 = (void *)*((_QWORD *)v24 + 33);
    *((_QWORD *)v24 + 33) = v55;

    v57 = [PXStoryRecipeClipMotionStyleProvider alloc];
    v58 = *((_QWORD *)v24 + 35);
    v59 = *((_QWORD *)v24 + 25);
    objc_msgSend(v24, "storyConfiguration");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[PXStoryRecipeClipMotionStyleProvider initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:storyConfiguration:](v57, "initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:storyConfiguration:", v58, v51, v49, v59, v60);
    v62 = (void *)*((_QWORD *)v24 + 34);
    *((_QWORD *)v24 + 34) = v61;

    v24[288] = a13;
    v19 = v64;
    v22 = v50;
    v23 = v71;
  }

  return (PXStoryConcreteTimelineStyle *)v24;
}

- (BOOL)allowsKenBurnsAnimations
{
  return 1;
}

- (id)_clipForDisplayAssets:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteTimelineStyle _clipForDisplayAsset:](self, "_clipForDisplayAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_clipForDisplayAsset:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_clipByAssetUUID;
  id v7;
  void *v8;
  PXStoryConcreteAutoEditClip *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  int64_t songPace;
  PFStoryAutoEditConfiguration *autoEditConfiguration;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PXStoryRecipeClipMotionStyleProvider *fallbackMotionStyleProvider;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  PXStoryRecipeClipTransitionProvider *fallbackTransitionProvider;
  NSMutableDictionary *v34;
  id v35;
  void *v36;
  PXStoryConcreteAutoEditClip *v37;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  _QWORD v45[3];
  _OWORD v46[4];
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  __int128 buf;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_clipByAssetUUID = self->_lock_clipByAssetUUID;
  v7 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "alternateUUID");
  else
    objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](lock_clipByAssetUUID, "objectForKeyedSubscript:", v8);
  v9 = (PXStoryConcreteAutoEditClip *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v9)
    goto LABEL_44;
  -[PXStoryAutoEditDecisionList clipForDisplayAsset:](self->_autoEditDecisionList, "clipForDisplayAsset:", v7);
  v9 = (PXStoryConcreteAutoEditClip *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = objc_msgSend(v7, "playbackStyle");
    if (!v10)
    {
      PLStoryGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v7, "uuid");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v40;
        _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_FAULT, "Unsupported playback style for asset %@", (uint8_t *)&buf, 0xCu);

      }
      v10 = 1;
    }
    -[PXStoryConcreteTimelineStyle storyConfiguration](self, "storyConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "disableVideoPlayback");

    if (((v10 != 1) & v12) != 0)
      v10 = 1;
    songPace = self->_songPace;
    v57 = 0;
    v55 = 0u;
    v56 = 0u;
    buf = 0u;
    v54 = 0u;
    autoEditConfiguration = self->_autoEditConfiguration;
    if (autoEditConfiguration)
      -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](autoEditConfiguration, "durationInfoForPlaybackStyle:songPace:", v10, songPace);
    if (self->_allowsRandomKenBurnsFallback)
    {
      v15 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 3, songPace);
      v16 = v15 + 1;
      v17 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2);
      v18 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2);
      if (v15 == 2)
      {
        v21 = v18 + 1;
      }
      else
      {
        if (v15 != 1)
        {
          if (v15)
          {
            v41 = 0;
            v42 = 0;
          }
          else
          {
            v42 = 2;
            v41 = 1;
          }
          goto LABEL_24;
        }
        v21 = v17 + 1;
      }
      v41 = v21;
      v42 = 0;
      goto LABEL_24;
    }
    fallbackMotionStyleProvider = self->_fallbackMotionStyleProvider;
    v52 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (fallbackMotionStyleProvider)
    {
      -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForDisplayAssetCount:displayAssets:](fallbackMotionStyleProvider, "nextMotionInfoForDisplayAssetCount:displayAssets:", 1, v20);
      v16 = v48;
      v41 = *(_QWORD *)&v49;
      v42 = v50;
    }
    else
    {
      v41 = 0;
      v42 = 0;
      v16 = 0;
    }

LABEL_24:
    v43 = v16;
    if (self->_allowsRandomTransitionFallback)
    {
      PFArrayRandomObjectWithRandomNumberGenerator();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");

      v24 = (v23 - 1);
      if (v24 < 8)
        v25 = v24 + 1;
      else
        v25 = 0;
      v26 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2, v41, v42);
      v27 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2);
      v28 = 0.5;
      if (v25 == 7)
      {
        v29 = v10;
        v31 = 0;
        v32 = v27 + 1;
      }
      else
      {
        if (v25 != 6)
        {
          v29 = v10;
          if (v25 == 5)
          {
            v30 = 0;
            v31 = 2;
            LOWORD(v32) = 1;
          }
          else
          {
            LOWORD(v32) = 0;
            v30 = 0;
            v31 = 0;
          }
          goto LABEL_39;
        }
        v29 = v10;
        v31 = 0;
        v32 = v26 + 1;
      }
    }
    else
    {
      v29 = v10;
      fallbackTransitionProvider = self->_fallbackTransitionProvider;
      if (fallbackTransitionProvider)
      {
        -[PXStoryRecipeClipTransitionProvider nextIntraMomentTransition](fallbackTransitionProvider, "nextIntraMomentTransition");
        v25 = v48;
        v28 = v49;
        v32 = v50;
        v31 = v51;
      }
      else
      {
        v31 = 0;
        v32 = 0;
        v25 = 0;
        v28 = 0.0;
      }
    }
    v30 = v32 & 0xFFFFFFFFFFFF0000;
LABEL_39:
    v9 = -[PXStoryConcreteAutoEditClip initWithDisplayAsset:]([PXStoryConcreteAutoEditClip alloc], "initWithDisplayAsset:", v7);
    -[PXStoryConcreteAutoEditClip setPlaybackStyle:](v9, "setPlaybackStyle:", v29);
    v46[2] = v55;
    v46[3] = v56;
    v47 = v57;
    v46[0] = buf;
    v46[1] = v54;
    -[PXStoryConcreteAutoEditClip setDurationInfo:](v9, "setDurationInfo:", v46);
    v45[0] = v43;
    v45[1] = v41;
    v45[2] = v42;
    -[PXStoryConcreteAutoEditClip setMotionInfo:](v9, "setMotionInfo:", v45);
    v44[0] = v25;
    *(double *)&v44[1] = v28;
    v44[2] = v30 | (unsigned __int16)v32;
    v44[3] = v31;
    -[PXStoryConcreteAutoEditClip setTransitionInfo:](v9, "setTransitionInfo:", v44);
  }
  os_unfair_lock_lock(&self->_lock);
  v34 = self->_lock_clipByAssetUUID;
  v35 = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v35, "alternateUUID");
  else
    objc_msgSend(v35, "uuid");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v9, v36);
  os_unfair_lock_unlock(p_lock);
LABEL_44:
  v37 = v9;

  return v37;
}

- (double)effectiveMovementDurationForDurationInfo:(id *)a3
{
  double Seconds;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;

  var1 = a3->var1;
  Seconds = CMTimeGetSeconds((CMTime *)&var1);
  if (Seconds >= 0.0 && Seconds <= 0.0)
    Seconds = 1.0;
  return Seconds * self->_effectiveMovementDurationFactor;
}

- ($F6BA6A5CD79A8D3CC60DB9DEA7616E28)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  $F6BA6A5CD79A8D3CC60DB9DEA7616E28 *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v7 = a4;
  -[PXStoryConcreteTimelineStyle _clipForDisplayAssets:](self, "_clipForDisplayAssets:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourcesDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "croppingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *a5;
  -[PXStoryConcreteTimelineStyle _durationInfoForClip:startTime:croppingContext:](self, "_durationInfoForClip:startTime:croppingContext:", v8, &v12, v10);

  return result;
}

- ($F6BA6A5CD79A8D3CC60DB9DEA7616E28)_durationInfoForClip:(SEL)a3 startTime:(id)a4 croppingContext:(id *)a5
{
  id v10;
  int64_t v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  PXAudioCueSource *v16;
  Float64 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  $F6BA6A5CD79A8D3CC60DB9DEA7616E28 *result;
  PXStoryTimelineSpec *spec;
  PXStoryTimelineSpec *v23;
  PXStoryTimelineSpec *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  PXStoryRecipeClipMotionStyleProvider *fallbackMotionStyleProvider;
  void *v32;
  Float64 v33;
  uint64_t v34;
  CMTimeEpoch epoch;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  id v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTimeRange rhs;
  __int128 v46;
  __int128 v47;
  CMTime duration;
  CMTime start;
  CMTime var1;
  CMTime v51;
  CMTime v52;
  CMTime v53;
  CMTime v54;
  _QWORD v55[3];
  __int128 v56;
  CMTimeEpoch v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CMTime v61;
  CMTimeRange lhs;
  __int128 v63;
  _BYTE v64[40];
  CMTime v65;
  CMTime v66;
  CMTime v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  __int128 v72;
  int64_t v73;
  CMTime time2;

  v10 = a4;
  v41 = a6;
  v73 = 0;
  v72 = 0u;
  v70 = 0u;
  memset(v71, 0, sizeof(v71));
  if (v10)
  {
    objc_msgSend(v10, "durationInfo");
    v68 = 0u;
    v69 = 0u;
    objc_msgSend(v10, "transitionInfo");
  }
  else
  {
    v68 = 0uLL;
    v69 = 0uLL;
  }
  *(_OWORD *)&retstr->var0.var0 = v70;
  v11 = v71[3];
  retstr->var0.var3 = v71[0];
  *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&v71[1];
  retstr->var1.var3 = v11;
  *(_OWORD *)&retstr->var2.var0 = v72;
  retstr->var2.var3 = v73;
  *(_OWORD *)&retstr->var3.var0.var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var3 = 0u;
  *(_QWORD *)&retstr->var4 = 0;
  memset(&v67, 0, sizeof(v67));
  v12 = *((double *)&v68 + 1);
  +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cueAlignmentForTransitionKind:", 0);
  CMTimeMakeWithSeconds(&v67, v12 * v14, 600);

  *(_OWORD *)&lhs.start.value = *(_OWORD *)&retstr->var1.var0;
  lhs.start.epoch = retstr->var1.var3;
  rhs.start = v67;
  CMTimeAdd(&v66, &lhs.start, &rhs.start);
  *(_OWORD *)&rhs.start.value = *(_OWORD *)&retstr->var2.var0;
  rhs.start.epoch = retstr->var2.var3;
  lhs.start = v66;
  CMTimeMinimum((CMTime *)&v46, &lhs.start, &rhs.start);
  *(_OWORD *)&retstr->var1.var0 = v46;
  retstr->var1.var3 = v47;
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&retstr->var0.var0;
  lhs.start.epoch = retstr->var0.var3;
  rhs.start = v67;
  CMTimeAdd(&v65, &lhs.start, &rhs.start);
  *(_OWORD *)&rhs.start.value = *(_OWORD *)&retstr->var2.var0;
  rhs.start.epoch = retstr->var2.var3;
  lhs.start = v65;
  CMTimeMinimum((CMTime *)&v46, &lhs.start, &rhs.start);
  *(_OWORD *)&retstr->var0.var0 = v46;
  retstr->var0.var3 = v47;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_cueSource;
  if (objc_msgSend(v15, "overrideDurations"))
  {
    objc_msgSend(v15, "showcaseSegmentDuration");
    CMTimeMakeWithSeconds(&v61, v17, 600);
    lhs.duration = v61;
    lhs.start.epoch = 0;
    *(_OWORD *)&lhs.start.value = PXStoryTimeZero;
    memset(v64, 0, sizeof(v64));
    v63 = PXStoryTimeMaximum;
    v18 = *(_OWORD *)&v64[16];
    *(_OWORD *)&retstr->var2.var3 = *(_OWORD *)v64;
    *(_OWORD *)&retstr->var3.var0.var1 = v18;
    retstr->var3.var1 = *(_QWORD *)&v64[32];
    v19 = *(_OWORD *)&lhs.start.epoch;
    v20 = *(_OWORD *)&lhs.duration.timescale;
    *(_OWORD *)&retstr->var0.var0 = PXStoryTimeZero;
    *(_OWORD *)&retstr->var0.var3 = v19;
    *(_OWORD *)&retstr->var1.var1 = v20;
    *(_OWORD *)&retstr->var2.var0 = PXStoryTimeMaximum;
    retstr->var4 = 0;
    goto LABEL_6;
  }
  spec = self->_spec;
  if (spec)
  {
    -[PXStoryTimelineSpec fixedSegmentDuration](spec, "fixedSegmentDuration");
    if ((v59 & 0x100000000) != 0)
    {
      v23 = self->_spec;
      if (v23)
      {
        -[PXStoryTimelineSpec fixedSegmentDuration](v23, "fixedSegmentDuration");
      }
      else
      {
        v56 = 0uLL;
        v57 = 0;
      }
      *(_OWORD *)&lhs.start.value = v56;
      lhs.start.epoch = v57;
      *(_OWORD *)&rhs.start.value = PXStoryTimeZero;
      rhs.start.epoch = 0;
      if (CMTimeCompare(&lhs.start, &rhs.start) >= 1)
      {
        memset(&rhs, 0, 24);
        v24 = self->_spec;
        if (v24)
          -[PXStoryTimelineSpec fixedSegmentDuration](v24, "fixedSegmentDuration");
        objc_msgSend(v10, "displayAssets");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v26 != 1)
          goto LABEL_35;
        objc_msgSend(v10, "displayAssets");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstObject");
        v28 = objc_claimAutoreleasedReturnValue();

        -[PXStoryConcreteTimelineStyle storyConfiguration](self, "storyConfiguration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)v28;
        if (objc_msgSend(v29, "usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets"))
        {
          v30 = +[PXStoryRecipeClipUtilities assetIsPortraitAspectWithLargeVerticalFaceArea:](PXStoryRecipeClipUtilities, "assetIsPortraitAspectWithLargeVerticalFaceArea:", v28);

          if (!v30)
            goto LABEL_34;
          memset(&lhs, 0, 24);
          fallbackMotionStyleProvider = self->_fallbackMotionStyleProvider;
          if (v10)
            objc_msgSend(v10, "motionInfo");
          else
            memset(v55, 0, sizeof(v55));
          if (!fallbackMotionStyleProvider)
            goto LABEL_34;
          -[PXStoryRecipeClipMotionStyleProvider updatedMotionForPortraitAspectAsset:motionInfo:](fallbackMotionStyleProvider, "updatedMotionForPortraitAspectAsset:motionInfo:", v40, v55);
          if (lhs.start.value != 1 || (unint64_t)(*(_QWORD *)&lhs.start.timescale - 3) > 1)
            goto LABEL_34;
          -[PXStoryConcreteTimelineStyle storyConfiguration](self, "storyConfiguration");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "kenBurnsPanSpeed");
          time2 = lhs.start;
          v54 = rhs.start;
          -[PXStoryConcreteTimelineStyle durationForVerticallyPanningPortraitAsset:atSpeed:motionInfo:minimumDuration:croppingContext:](self, "durationForVerticallyPanningPortraitAsset:atSpeed:motionInfo:minimumDuration:croppingContext:", v40, &time2, &v54, v41);
          *(_OWORD *)&rhs.start.value = v46;
          rhs.start.epoch = v47;
        }

LABEL_34:
LABEL_35:
        lhs.start.epoch = rhs.start.epoch;
        lhs.duration = rhs.start;
        v37 = *(_OWORD *)&rhs.start.value;
        *(_QWORD *)v64 = rhs.start.epoch;
        memset(&v64[8], 0, 32);
        v38 = *(_OWORD *)&v64[16];
        *(_OWORD *)&retstr->var2.var3 = *(_OWORD *)v64;
        *(_OWORD *)&retstr->var3.var0.var1 = v38;
        v39 = *(_OWORD *)&lhs.start.epoch;
        *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&lhs.duration.timescale;
        *(_OWORD *)&retstr->var2.var0 = v37;
        retstr->var3.var1 = *(_QWORD *)&v64[32];
        *(_OWORD *)&retstr->var0.var0 = v37;
        *(_OWORD *)&retstr->var0.var3 = v39;
        retstr->var4 = 0;
        goto LABEL_6;
      }
    }
  }
  else
  {
    v58 = 0;
    v59 = 0;
    v60 = 0;
  }
  if (objc_msgSend(v15, "useMusicCuesForTimeline")
    && v16
    && (-[PXAudioCueSource isEmpty](v16, "isEmpty") & 1) == 0)
  {
    PXAudioAssetDefaultEntryPoint(self->_audioAsset);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v54, 0, sizeof(v54));
    objc_msgSend(v32, "time");
    CMTimeMakeWithSeconds(&v54, v33, 600);
    memset(&v53, 0, sizeof(v53));
    v52 = (CMTime)*a5;
    lhs.start = v54;
    CMTimeAdd(&v53, &lhs.start, &v52);
    memset(&v51, 0, sizeof(v51));
    var1 = (CMTime)retstr->var1;
    lhs.start = v53;
    CMTimeAdd(&v51, &lhs.start, &var1);
    memset(&lhs, 0, sizeof(lhs));
    rhs.start = v53;
    v46 = *(_OWORD *)&retstr->var0.var0;
    *(_QWORD *)&v47 = retstr->var0.var3;
    CMTimeAdd(&start, &rhs.start, (CMTime *)&v46);
    *(_OWORD *)&rhs.start.value = *(_OWORD *)&retstr->var2.var0;
    rhs.start.epoch = retstr->var2.var3;
    v46 = *(_OWORD *)&retstr->var0.var0;
    *(_QWORD *)&v47 = retstr->var0.var3;
    CMTimeSubtract(&duration, &rhs.start, (CMTime *)&v46);
    CMTimeRangeMake(&lhs, &start, &duration);
    v47 = 0u;
    rhs = lhs;
    v46 = 0u;
    time2 = v51;
    -[PXAudioCueSource bestCueInRange:preferredTime:](v16, "bestCueInRange:preferredTime:", &rhs, &time2);
    *(_OWORD *)&rhs.start.value = v46;
    v34 = *((_QWORD *)&v47 + 1);
    rhs.start.epoch = v47;
    memset(&time2, 0, sizeof(time2));
    if (CMTimeCompare(&rhs.start, &time2) || v34)
    {
      *(_OWORD *)&rhs.start.value = v46;
      rhs.start.epoch = v47;
      time2 = v53;
      CMTimeSubtract(&v44, &rhs.start, &time2);
      rhs.start = v44;
      memset(&v43, 0, sizeof(v43));
      time2 = v67;
      CMTimeSubtract(&v43, &rhs.start, &time2);
      *(_OWORD *)&rhs.start.value = *(_OWORD *)&retstr->var0.var0;
      rhs.start.epoch = retstr->var0.var3;
      time2 = v43;
      CMTimeMaximum(&v42, &rhs.start, &time2);
      epoch = v42.epoch;
      v43 = v42;
      *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&v42.value;
      retstr->var1.var3 = epoch;
      v36 = v47;
      *(_OWORD *)&retstr->var3.var0.var0 = v46;
      *(_OWORD *)&retstr->var3.var0.var3 = v36;
      retstr->var4 = 0;
    }

  }
LABEL_6:

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationForVerticallyPanningPortraitAsset:(SEL)a3 atSpeed:(id)a4 motionInfo:(double)a5 minimumDuration:(id *)a6 croppingContext:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PXStoryTimelineSpec *spec;
  id v24;
  uint64_t *v25;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  __int128 v31;
  unint64_t var1;
  double v33;
  __int128 v34;
  int64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  int64_t var3;
  _BYTE v42[152];
  uint64_t v43;
  _QWORD v44[4];

  v44[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a8;
  v44[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 1;
  -[PXStoryConcreteTimelineStyle storyConfiguration](self, "storyConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "keyAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v13, "isEqual:", v18);

  v20 = 64;
  if (v19)
    v20 = 56;
  v21 = *(uint64_t *)((char *)&self->super.isa + v20);
  +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v42, 0, 144);
  PXStoryBasicContentInfoForDisplayAsset(v13, (uint64_t)v42);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3810000000;
  v39 = &unk_1A7E74EE7;
  v40 = *(_OWORD *)&a7->var0;
  var3 = a7->var3;
  spec = self->_spec;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __125__PXStoryConcreteTimelineStyle_durationForVerticallyPanningPortraitAsset_atSpeed_motionInfo_minimumDuration_croppingContext___block_invoke;
  v28[3] = &unk_1E5141EB0;
  v28[4] = self;
  v35 = var3;
  v34 = v40;
  v24 = v13;
  v31 = *(_OWORD *)&a6->var0;
  var1 = a6->var1.var0.var1;
  v33 = a5;
  v29 = v24;
  v30 = &v36;
  +[PXStoryClipKenBurnsEffectFactory factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:](PXStoryClipKenBurnsEffectFactory, "factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:", spec, v22, v16, v14, v21, v42, &v43, 0, v28);
  v25 = v37;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v37 + 2);
  retstr->var3 = v25[6];

  _Block_object_dispose(&v36, 8);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_autoEditDecisionList;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE defaultDisplayAssetPresentationDuration](result, "defaultDisplayAssetPresentationDuration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (id)clipCompositionForKeyAsset:(id)a3 contentInfo:(id *)a4 finalPlaybackStyle:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  NSArray *allowedKeyAssetClipCompositions;
  void *v12;
  void *v13;

  v8 = a3;
  objc_msgSend(v8, "resourcesDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "croppingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  allowedKeyAssetClipCompositions = self->_allowedKeyAssetClipCompositions;
  objc_msgSend(v8, "displayAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXStoryConcreteStyle bestClipCompositionFromClipCompositions:forKeyAsset:contentInfo:playbackStyle:spec:croppingContext:options:loggingOptions:](PXStoryConcreteStyle, "bestClipCompositionFromClipCompositions:forKeyAsset:contentInfo:playbackStyle:spec:croppingContext:options:loggingOptions:", allowedKeyAssetClipCompositions, v12, a4, a5, self->_spec, v10, self->_keyAssetCroppingOptions, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)allowedClipCompositionsWithStartTime:(id *)a3 nextDisplayAssets:(id)a4
{
  return self->_allowedClipCompositions;
}

- (double)composabilityScoreForSegmentWithDisplayAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PXStoryConcreteTimelineStyle _clipForDisplayAssets:](self, "_clipForDisplayAssets:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = -1.0;
  if (v7 == objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v9 = 0;
      while (1)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v11)
          break;
        if (++v9 >= (unint64_t)objc_msgSend(v6, "count"))
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      v8 = 1.0;
    }
  }

  return v8;
}

- ($60B83496CA56D3588CF925FE7FBD90DC)contentInfoForDisplayAsset:(SEL)a3
{
  $60B83496CA56D3588CF925FE7FBD90DC *result;

  PXStoryStyleDefaultContentInfoForDisplayAsset(a4, (uint64_t)retstr);
  return result;
}

- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;

  if ((unint64_t)a3 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v4, v3, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryConcreteTimelineStyle isOriginalPlaybackStyleAllowedInNUp:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXStoryConcreteStyle.m"), 715, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return (0xAu >> a3) & 1;
}

- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v6 = a3;
  v7 = v6;
  if (a4 == 3 && self->_styleOptions.preferStillKeySegment && objc_msgSend(v6, "resourceIndex") == -1)
  {
    v11 = 1;
  }
  else
  {
    -[PXStoryConcreteTimelineStyle _clipForDisplayAsset:](self, "_clipForDisplayAsset:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "playbackStyle") == 4
      && (objc_msgSend(v7, "resourcesDataSource"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "movieHighlightsForDisplayAssetAtIndex:", objc_msgSend(v7, "resourceIndex")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v10,
          !v10))
    {
      v11 = 1;
    }
    else
    {
      v11 = objc_msgSend(v8, "playbackStyle");
    }

  }
  return v11;
}

- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3
{
  return 1;
}

- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9
{
  id v13;
  id v14;
  void (**v15)(id, $AEFAD17AB1CC80BF212AA0D0E83A8824 *, _QWORD);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  double v29;

  v13 = a3;
  v14 = a4;
  v15 = (void (**)(id, $AEFAD17AB1CC80BF212AA0D0E83A8824 *, _QWORD))a9;
  v16 = v13;
  v17 = objc_msgSend(v16, "numberOfClips");
  v18 = objc_msgSend(v16, "numberOfAssets");

  if (v17 <= v18 && self->_allowsRandomSeparatorEffectsFallback)
  {
    objc_msgSend(v16, "mainDividerAxis");
    PXAxisTransposed();
    v19 = PXMaxRectEdgeForAxis();
    if (self->_isRTL)
      v19 = PXRectEdgeFlippedHorizontally();
    PXDegreesToRadians();
    v21 = v20;
    v22 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2);
    v23 = -v21;
    if (v22)
      v24 = 10.0;
    else
      v24 = -10.0;
    if (!v22)
      v21 = -v21;
    v25 = objc_msgSend(v16, "numberOfClips", v23);
    if (v25 == 3)
    {
      +[PXStoryClipSeparatorEffectFactory getParameters:forOppositePansWithDistance:threeUpComposition:](PXStoryClipSeparatorEffectFactory, "getParameters:forOppositePansWithDistance:threeUpComposition:", a8, v16, -10.0);
LABEL_19:
      v15[2](v15, a8, 0);
      goto LABEL_20;
    }
    if (v25 == 2)
    {
      v26 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2);
      if (v26 == 1)
      {
        +[PXStoryClipSeparatorEffectFactory parametersForRotationWithAngle:](PXStoryClipSeparatorEffectFactory, "parametersForRotationWithAngle:", v21);
      }
      else
      {
        if (v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteStyle.m"), 782, CFSTR("Code which should be unreachable has been reached"));

          abort();
        }
        +[PXStoryClipSeparatorEffectFactory parametersForPanTowardsEdge:distance:](PXStoryClipSeparatorEffectFactory, "parametersForPanTowardsEdge:distance:", v19, v24);
      }
      *(_OWORD *)&a8->var0 = v28;
      a8->var2 = v29;
      goto LABEL_19;
    }
  }
  v15[2](v15, 0, 0);
LABEL_20:

}

- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12
{
  id v18;
  void (**v19)(id, _QWORD);
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  PXStoryTimelineSpec *spec;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  SEL v31;
  const int64_t *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  void (**v37)(id, _QWORD);
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  $D91B8EE9D09FDCAD835AAEC54CF3D85E *v45;
  SEL v46;

  v33 = a3;
  v18 = a4;
  v19 = (void (**)(id, _QWORD))a12;
  if (objc_msgSend(v18, "count") == 1 && (*a6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v19[2](v19, 0);
  }
  else
  {
    objc_msgSend(v18, "resourcesDataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "croppingContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v18;
    v32 = a6;
    v31 = a2;
    if (objc_msgSend(v22, "count") == 1)
    {
      v23 = objc_retainAutorelease(v22);
      v24 = *(_QWORD *)objc_msgSend(v23, "resourceIndexes");

      v25 = 64;
      if (v24 == -1)
        v25 = 56;
    }
    else
    {

      v25 = 64;
    }
    v26 = *(uint64_t *)((char *)&self->super.isa + v25);
    spec = self->_spec;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __244__PXStoryConcreteTimelineStyle_enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition_displayAssets_assetContentInfos_finalPlaybackStyles_startTime_durationInfo_separatorEffectParameters_separatorEffectContext_buffer_usingBlock___block_invoke;
    v34[3] = &unk_1E5141ED8;
    v34[4] = self;
    v28 = *(_OWORD *)&a8->var3.var0.var1;
    v42 = *(_OWORD *)&a8->var2.var3;
    v43 = v28;
    v44 = *(_OWORD *)&a8->var3.var1;
    v29 = *(_OWORD *)&a8->var0.var3;
    v38 = *(_OWORD *)&a8->var0.var0;
    v39 = v29;
    v30 = *(_OWORD *)&a8->var1.var1;
    v41 = *(_OWORD *)&a8->var2.var0;
    v40 = v30;
    v35 = v33;
    v45 = a11;
    v37 = v19;
    v36 = v22;
    v46 = v31;
    +[PXStoryClipKenBurnsEffectFactory factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:](PXStoryClipKenBurnsEffectFactory, "factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:", spec, v35, v36, v21, v26, a5, v32, a9, v34);

  }
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_kenBurnsMotionParametersForDuration:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  -[PXStoryConcreteTimelineStyle storyConfiguration](self, "storyConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "kenBurnsPanSpeed");
  v7 = v6 * a3;

  -[PXStoryConcreteTimelineStyle storyConfiguration](self, "storyConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kenBurnsScaleSpeed");
  v10 = 1.0;
  v11 = v9 * self->_scaleSpeedFactor * a3 + 1.0;

  +[PXStoryConcreteTimelineSettings sharedInstance](PXStoryConcreteTimelineSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "kenBurnsRotationSpeed");
  v14 = v13 * self->_rotationSpeedFactor * a3;
  objc_msgSend(v12, "kenBurnsScaleSpeedDuringRotation");
  v16 = v15 * self->_scaleSpeedFactor * a3 + 1.0;
  v17 = -[PXStoryConcreteTimelineStyle allowsKenBurnsAnimations](self, "allowsKenBurnsAnimations");
  if (v17)
    v18 = v11;
  else
    v18 = 1.0;
  if (v17)
  {
    v19 = v14;
  }
  else
  {
    v7 = 0.0;
    v19 = 0.0;
  }
  if (v17)
    v10 = v16;

  v20 = v7;
  v21 = v18;
  v22 = v19;
  v23 = v10;
  result.var3 = v23;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (void)_getOneUpKenBurnsParameters:(id *)a3 forDisplayAsset:(id)a4 motionInfo:(id *)a5 motionParameters:(id *)a6 factory:(id)a7
{
  id v13;
  void *v14;
  uint64_t v15;
  double var1;
  double var2;
  void *v18;
  int v19;
  void *v20;
  id v21;
  CGRect v22;

  v21 = a4;
  v13 = a7;
  v14 = v13;
  switch(a5->var0)
  {
    case 0:
    case 4:
      objc_msgSend(v13, "getParametersForNoEffect:", a3);
      break;
    case 1:
      v15 = 0;
      switch(a5->var1.var0.var0)
      {
        case 0uLL:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteStyle.m"), 1073, CFSTR("Pan direction is undefined"));

          abort();
        case 2uLL:
          v15 = 2;
          break;
        case 3uLL:
          v15 = 1;
          break;
        case 4uLL:
          v15 = 3;
          break;
        default:
          break;
      }
      if (self->_isRTL)
        v15 = PXRectEdgeFlippedHorizontally();
      -[PXStoryConcreteTimelineStyle storyConfiguration](self, "storyConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets");

      if (v19
        && (v15 & 0xFFFFFFFD) == 1
        && +[PXStoryRecipeClipUtilities assetIsPortraitAspectWithLargeVerticalFaceArea:](PXStoryRecipeClipUtilities, "assetIsPortraitAspectWithLargeVerticalFaceArea:", v21)&& (objc_msgSend(v21, "preferredCropRect"), !CGRectIsEmpty(v22)))
      {
        objc_msgSend(v14, "getParameters:forVerticallyPanningPreferredRectMovingTowardsVerticalEdge:", a3, v15);
      }
      else
      {
        objc_msgSend(v14, "getParameters:forPanWithCameraMovingTowardsEdge:distance:", a3, PXRectEdgeOpposite(), a6->var0);
      }
      break;
    case 2:
      var1 = a6->var1;
      if (a5->var1.var0.var0 != 1)
        var1 = 1.0 / var1;
      objc_msgSend(v13, "getParameters:forZoomWithScale:", a3, var1);
      break;
    case 3:
      var2 = a6->var2;
      if (a5->var1.var0.var0 != 1)
        var2 = -var2;
      objc_msgSend(v13, "getParameters:forRotationWithAngle:scale:", a3, var2, a6->var3);
      break;
    default:
      break;
  }

}

- ($C63E51281545771083DD8F52DBD4F646)transitionInfoForSegmentWithClipComposition:(SEL)a3 displayAssets:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  $C63E51281545771083DD8F52DBD4F646 *result;
  id v10;

  v6 = a5;
  -[PXStoryConcreteTimelineStyle _clipForDisplayAssets:](self, "_clipForDisplayAssets:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v8 = objc_msgSend(v10, "count") == 1
    && *(_QWORD *)objc_msgSend(objc_retainAutorelease(v10), "resourceIndexes") == -1;

  -[PXStoryConcreteTimelineStyle _transitionInfoForClip:isKeyAsset:](self, "_transitionInfoForClip:isKeyAsset:", v7, v8);
  return result;
}

- ($C63E51281545771083DD8F52DBD4F646)_transitionInfoForClip:(SEL)a3 isKeyAsset:(id)a4
{
  _BOOL4 v5;
  id v8;
  int64_t songPace;
  PFStoryAutoEditConfiguration *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Float64 v15;
  uint64_t v16;
  Float64 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  Float64 v30;
  double v31;
  int var0;
  int v33;
  char v34;
  unsigned __int8 v35;
  $C63E51281545771083DD8F52DBD4F646 *result;

  v5 = a5;
  v8 = a4;
  songPace = self->_songPace;
  v10 = self->_autoEditConfiguration;
  -[PXStoryConcreteTimelineStyle storyConfiguration](self, "storyConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allowedTransitionKinds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count") != 1 || !objc_msgSend(v12, "firstIndex"))
  {
    if (self->_allowsDefaultTransitions)
    {
      if (!v8)
      {
        *(_QWORD *)&retstr->var3 = 0;
        *(_OWORD *)&retstr->var0 = PXStoryTransitionInfoNone;
        *(_OWORD *)&retstr->var2.var1 = xmmword_1A7C0B7D8;
        goto LABEL_38;
      }
      objc_msgSend(v8, "transitionInfo");
      if (v5)
        v16 = 2;
      else
        v16 = 0;
      -[PFStoryAutoEditConfiguration durationForTransitionKind:songPace:](v10, "durationForTransitionKind:songPace:", v16, songPace);
      if ((unint64_t)(v16 - 1) >= 8)
        LOBYTE(v16) = 0;
      *(_OWORD *)&retstr->var0 = 0u;
      *(_OWORD *)&retstr->var2.var1 = 0u;
      *(_QWORD *)&retstr->var3 = 0;
      PXStoryTransitionInfoMakeDefault((char)v16, (uint64_t)retstr, v17);
      v24 = 0;
      if (v16 <= 0xAu)
      {
        switch((char)v16)
        {
          case 5:
            PXStoryErrorCreateWithCodeDebugFormat(8, CFSTR("invalid transition pan settings (direction: %li)"), v18, v19, v20, v21, v22, v23, 0);
            goto LABEL_27;
          case 6:
          case 9:
            PXStoryErrorCreateWithCodeDebugFormat(8, CFSTR("invalid transition scale settings (direction: %li)"), v18, v19, v20, v21, v22, v23, 0);
            goto LABEL_27;
          case 7:
            PXStoryErrorCreateWithCodeDebugFormat(8, CFSTR("invalid transition rotate settings (direction: %li)"), v18, v19, v20, v21, v22, v23, 0);
LABEL_27:
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            v24 = 0;
            break;
        }
      }
      if (self->_isRTL)
      {
        var0 = retstr->var0;
        v33 = SBYTE5(retstr->var2.var3);
        v34 = BYTE5(retstr->var2.var3);
        v35 = retstr->var1 ^ 1;
        if (var0 == 5)
        {
          if (v33 == 1)
          {
            v34 = 2;
          }
          else if (v33 == 2)
          {
            v34 = 1;
          }
        }
        retstr->var0 = var0;
        retstr->var1 = v35;
        BYTE5(retstr->var2.var3) = v34;
      }
      if (v24)
        -[PXStoryErrorReporter setError:forComponent:](self->_errorReporter, "setError:forComponent:", v24, CFSTR("AutoEditTransitionInfo"));
    }
    else
    {
      PFArrayRandomObjectWithRandomNumberGenerator();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      v27 = (v26 - 1);
      if (v27 < 8)
        v28 = v27 + 1;
      else
        v28 = 0;
      -[PFStoryAutoEditConfiguration durationForTransitionKind:songPace:](v10, "durationForTransitionKind:songPace:", v28, songPace);
      v30 = v29;
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "overrideDurations"))
      {
        objc_msgSend(v24, "showcaseTransitionDuration");
        v30 = v31;
      }
      *(_QWORD *)&retstr->var3 = 0;
      *(_OWORD *)&retstr->var0 = 0u;
      *(_OWORD *)&retstr->var2.var1 = 0u;
      PXStoryTransitionInfoMakeDefault(v26, (uint64_t)retstr, v30);
    }

    goto LABEL_38;
  }
  v13 = ((char)objc_msgSend(v12, "firstIndex") - 1);
  if (v13 < 8)
    v14 = v13 + 1;
  else
    v14 = 0;
  -[PFStoryAutoEditConfiguration durationForTransitionKind:songPace:](v10, "durationForTransitionKind:songPace:", v14, songPace);
  PXStoryTransitionInfoMakeDefault((char)v14, (uint64_t)retstr, v15);
LABEL_38:

  return result;
}

- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfoForDisplayAsset:(SEL)a3
{
  void *v6;
  void *v7;
  $654D12A5B96C89A393ABE69D6FE3CC0A *result;
  id v9;

  v9 = a4;
  if (objc_msgSend(v9, "playbackStyle") == 3
    && self->_styleOptions.preferStillKeySegment
    && objc_msgSend(v9, "resourceIndex") == -1)
  {
    retstr->var6 = 0.0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }
  else
  {
    -[PXStoryConcreteTimelineStyle _clipForDisplayAsset:](self, "_clipForDisplayAsset:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "audioInfo");
    }
    else
    {
      retstr->var6 = 0.0;
      *(_OWORD *)&retstr->var2 = 0u;
      *(_OWORD *)&retstr->var4 = 0u;
      *(_OWORD *)&retstr->var0 = 0u;
    }

  }
  return result;
}

- (void)_ensureDefaultMultipartPanoramaParameters
{
  void *v3;
  int v4;
  PXStoryTimelineSpec *spec;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PXStoryMultipartPanoramaParameters *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  PXStoryMultipartPanoramaParameters *v14;
  PXStoryMultipartPanoramaParameters *defaultHorizontalMultipartPanoramaParameters;
  PXStoryMultipartPanoramaParameters *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  PXStoryMultipartPanoramaParameters *v20;
  PXStoryMultipartPanoramaParameters *defaultVerticalMultipartPanoramaParameters;
  _BYTE v22[40];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[7];
  int64x2_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[40];
  CMTime v67;
  __int128 v68;
  _BYTE v69[32];
  __int128 v70;
  _OWORD v71[3];

  if (!self->_didInitializeDefaultMultipartPanoramaParameters)
  {
    +[PXStoryMultipartPanoramaSettings sharedInstance](PXStoryMultipartPanoramaSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFeatureEnabled");

    if (v4)
    {
      CMTimeMakeWithSeconds(&v67, 2.0, 600);
      *(CMTime *)&v69[8] = v67;
      *(_QWORD *)v69 = 0;
      v68 = PXStoryTimeZero;
      memset(v71, 0, 40);
      v70 = PXStoryTimeMaximum;
      memset(v66, 0, sizeof(v66));
      PXStoryTransitionInfoMakeDefault(5u, (uint64_t)v66, 0.5);
      v66[29] = 1;
      v56 = 0;
      v57 = &v56;
      v58 = 0x8010000000;
      v59 = &unk_1A7E74EE7;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v46 = 0;
      v47 = &v46;
      v48 = 0x8010000000;
      v49 = &unk_1A7E74EE7;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v42 = v71[0];
      v43 = v71[1];
      v38 = v68;
      v39 = *(_OWORD *)v69;
      v40 = *(_OWORD *)&v69[16];
      v41 = v70;
      v44 = *(_QWORD *)&v71[2];
      v45 = 0;
      -[PXStoryConcreteTimelineStyle effectiveMovementDurationForDurationInfo:](self, "effectiveMovementDurationForDurationInfo:", &v38);
      -[PXStoryConcreteTimelineStyle _kenBurnsMotionParametersForDuration:](self, "_kenBurnsMotionParametersForDuration:");
      spec = self->_spec;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __73__PXStoryConcreteTimelineStyle__ensureDefaultMultipartPanoramaParameters__block_invoke;
      v29[3] = &unk_1E5141F00;
      v29[4] = self;
      v29[5] = &v56;
      v30 = vdupq_n_s64(1uLL);
      v32 = v6;
      v33 = v7;
      v34 = v8;
      v35 = v9;
      v31 = 0;
      v29[6] = &v46;
      v36 = xmmword_1A7C0C480;
      v37 = 0;
      +[PXStoryClipKenBurnsEffectFactory genericFactoryForSpec:assetContentSize:handler:](PXStoryClipKenBurnsEffectFactory, "genericFactoryForSpec:assetContentSize:handler:", spec, v29, *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
      v10 = [PXStoryMultipartPanoramaParameters alloc];
      v11 = *((_OWORD *)v57 + 5);
      v25 = *((_OWORD *)v57 + 4);
      v26 = v11;
      v12 = *((_OWORD *)v57 + 7);
      v27 = *((_OWORD *)v57 + 6);
      v28 = v12;
      v13 = *((_OWORD *)v57 + 3);
      v23 = *((_OWORD *)v57 + 2);
      v24 = v13;
      v42 = v71[0];
      v43 = v71[1];
      v38 = v68;
      v39 = *(_OWORD *)v69;
      v40 = *(_OWORD *)&v69[16];
      v41 = v70;
      v44 = *(_QWORD *)&v71[2];
      v45 = 0;
      *(_OWORD *)v22 = *(_OWORD *)v66;
      *(_OWORD *)&v22[16] = *(_OWORD *)&v66[16];
      *(_QWORD *)&v22[32] = *(_QWORD *)&v66[32];
      v14 = -[PXStoryMultipartPanoramaParameters initWithNormalizedKenBurnsEffectParameters:partDurationInfo:transitionInfo:](v10, "initWithNormalizedKenBurnsEffectParameters:partDurationInfo:transitionInfo:", &v23, &v38, v22);
      defaultHorizontalMultipartPanoramaParameters = self->_defaultHorizontalMultipartPanoramaParameters;
      self->_defaultHorizontalMultipartPanoramaParameters = v14;

      v16 = [PXStoryMultipartPanoramaParameters alloc];
      v17 = *((_OWORD *)v47 + 5);
      v25 = *((_OWORD *)v47 + 4);
      v26 = v17;
      v18 = *((_OWORD *)v47 + 7);
      v27 = *((_OWORD *)v47 + 6);
      v28 = v18;
      v19 = *((_OWORD *)v47 + 3);
      v23 = *((_OWORD *)v47 + 2);
      v24 = v19;
      v42 = v71[0];
      v43 = v71[1];
      v38 = v68;
      v39 = *(_OWORD *)v69;
      v40 = *(_OWORD *)&v69[16];
      v41 = v70;
      v44 = *(_QWORD *)&v71[2];
      v45 = 0;
      *(_OWORD *)v22 = *(_OWORD *)v66;
      *(_OWORD *)&v22[13] = *(_OWORD *)&v66[13];
      v22[29] = 4;
      *(_QWORD *)&v22[30] = *(_QWORD *)&v66[30];
      *(_WORD *)&v22[38] = *(_WORD *)&v66[38];
      v20 = -[PXStoryMultipartPanoramaParameters initWithNormalizedKenBurnsEffectParameters:partDurationInfo:transitionInfo:](v16, "initWithNormalizedKenBurnsEffectParameters:partDurationInfo:transitionInfo:", &v23, &v38, v22);
      defaultVerticalMultipartPanoramaParameters = self->_defaultVerticalMultipartPanoramaParameters;
      self->_defaultVerticalMultipartPanoramaParameters = v20;

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(&v56, 8);
    }
    self->_didInitializeDefaultMultipartPanoramaParameters = 1;
  }
}

- (PXStoryMultipartPanoramaParameters)defaultHorizontalMultipartPanoramaParameters
{
  -[PXStoryConcreteTimelineStyle _ensureDefaultMultipartPanoramaParameters](self, "_ensureDefaultMultipartPanoramaParameters");
  return self->_defaultHorizontalMultipartPanoramaParameters;
}

- (PXStoryMultipartPanoramaParameters)defaultVerticalMultipartPanoramaParameters
{
  -[PXStoryConcreteTimelineStyle _ensureDefaultMultipartPanoramaParameters](self, "_ensureDefaultMultipartPanoramaParameters");
  return self->_defaultVerticalMultipartPanoramaParameters;
}

- (BOOL)allowsMultipartPanoramaForDisplayAsset:(id)a3 startTime:(id *)a4
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (objc_msgSend(v4, "mediaType") == 1)
    v5 = objc_msgSend(v4, "mediaSubtypes") & 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (id)sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:(id)a3 startTime:(id *)a4 proposedCropContentsRects:(id)a5 axis:(int64_t)a6 normalizedKenBurnsEffectParameters:(id *)a7 durationInfos:(id *)a8 transitionInfos:(id *)a9
{
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char *v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[7];

  v14 = a3;
  if (a6 == 1)
  {
    v15 = 1;
  }
  else
  {
    v15 = 1;
    if (self->_isRTL)
      v15 = -1;
  }
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __198__PXStoryConcreteTimelineStyle_sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset_startTime_proposedCropContentsRects_axis_normalizedKenBurnsEffectParameters_durationInfos_transitionInfos___block_invoke;
  v38[3] = &__block_descriptor_48_e29_q24__0__NSValue_8__NSValue_16l;
  v38[4] = a6;
  v38[5] = v15;
  objc_msgSend(a5, "sortedArrayUsingComparator:", v38);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  -[PXStoryConcreteTimelineStyle _clipForDisplayAsset:](self, "_clipForDisplayAsset:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  objc_msgSend(v14, "resourcesDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "croppingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(_OWORD *)&a4->var0;
  *(_QWORD *)&v29 = a4->var3;
  -[PXStoryConcreteTimelineStyle _durationInfoForClip:startTime:croppingContext:](self, "_durationInfoForClip:startTime:croppingContext:", v18, &v28, v20);

  if (v17 >= 1)
  {
    v21 = v17;
    do
    {
      v22 = v36;
      *(_OWORD *)&a8->var2.var3 = v35;
      *(_OWORD *)&a8->var3.var0.var1 = v22;
      *(_OWORD *)&a8->var3.var1 = v37;
      v23 = v32;
      *(_OWORD *)&a8->var0.var0 = v31;
      *(_OWORD *)&a8->var0.var3 = v23;
      v24 = v34;
      *(_OWORD *)&a8->var1.var1 = v33;
      *(_OWORD *)&a8->var2.var0 = v24;
      ++a8;
      --v21;
    }
    while (v21);
  }
  v25 = &a9->var0 + 40 * v17;
  -[PXStoryConcreteTimelineStyle _transitionInfoForClip:isKeyAsset:](self, "_transitionInfoForClip:isKeyAsset:", v18, objc_msgSend(v14, "resourceIndex") == -1);
  v26 = v29;
  *(_OWORD *)(v25 - 40) = v28;
  *(_OWORD *)(v25 - 24) = v26;
  *((_QWORD *)v25 - 1) = v30;

  return v16;
}

- (BOOL)allowsIncompleteTimelines
{
  return self->_allowsIncompleteTimelines;
}

- (PXStoryConfiguration)storyConfiguration
{
  return (PXStoryConfiguration *)objc_loadWeakRetained((id *)&self->_storyConfiguration);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storyConfiguration);
  objc_storeStrong((id *)&self->_defaultVerticalMultipartPanoramaParameters, 0);
  objc_storeStrong((id *)&self->_defaultHorizontalMultipartPanoramaParameters, 0);
  objc_storeStrong((id *)&self->_autoEditConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackMotionStyleProvider, 0);
  objc_storeStrong((id *)&self->_fallbackTransitionProvider, 0);
  objc_storeStrong((id *)&self->_lock_clipByAssetUUID, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositions, 0);
  objc_storeStrong((id *)&self->_allowedKeyAssetClipCompositions, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionList, 0);
  objc_storeStrong((id *)&self->_possibleFallbackTransitionKinds, 0);
  objc_storeStrong((id *)&self->_audioAsset, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

uint64_t __198__PXStoryConcreteTimelineStyle_sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset_startTime_proposedCropContentsRects_axis_normalizedKenBurnsEffectParameters_durationInfos_transitionInfos___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(a2, "CGRectValue");
  PXRectGetMidForAxis();
  objc_msgSend(v5, "CGRectValue");

  PXRectGetMidForAxis();
  return *(_QWORD *)(a1 + 40) * PXFloatCompare();
}

void __73__PXStoryConcreteTimelineStyle__ensureDefaultMultipartPanoramaParameters__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "displayAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_getOneUpKenBurnsParameters:forDisplayAsset:motionInfo:motionParameters:factory:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32, v5, a1 + 56, a1 + 80, v3);
  objc_msgSend(*(id *)(a1 + 32), "_getOneUpKenBurnsParameters:forDisplayAsset:motionInfo:motionParameters:factory:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32, v5, a1 + 112, a1 + 80, v3);

}

void __244__PXStoryConcreteTimelineStyle_enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition_displayAssets_assetContentInfos_finalPlaybackStyles_startTime_durationInfo_separatorEffectParameters_separatorEffectContext_buffer_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(void);
  _BYTE *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  const char *v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[16];
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 144);
  v72 = *(_OWORD *)(a1 + 128);
  v73 = v5;
  v74 = *(_OWORD *)(a1 + 160);
  v6 = *(_OWORD *)(a1 + 80);
  v68 = *(_OWORD *)(a1 + 64);
  v69 = v6;
  v7 = *(_OWORD *)(a1 + 112);
  v70 = *(_OWORD *)(a1 + 96);
  v71 = v7;
  objc_msgSend(v4, "effectiveMovementDurationForDurationInfo:", &v68);
  objc_msgSend(*(id *)(a1 + 32), "_kenBurnsMotionParametersForDuration:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  *(double *)&v68 = v8;
  *((double *)&v68 + 1) = v10;
  *(double *)&v69 = v12;
  *((double *)&v69 + 1) = v14;
  v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "nextUnsignedIntegerLessThan:", 2);
  v17 = *(id *)(a1 + 40);
  v18 = objc_msgSend(v17, "numberOfClips");
  v19 = objc_msgSend(v17, "numberOfAssets");

  if (v18 > v19)
  {
    v20 = -1;
    if (v16)
      v20 = 1;
    objc_msgSend(v3, "getParameters:forSplitAssetOppositePansWithDistance:", *(_QWORD *)(a1 + 176), v9 * (double)v20);
    goto LABEL_5;
  }
  v22 = *(_BYTE **)(a1 + 32);
  if (!v22[90])
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 48), "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectsAtIndexes:", v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
    v31 = objc_msgSend(*(id *)(a1 + 40), "numberOfClips");
    if (v30)
    {
      objc_msgSend(v30, "nextMotionInfoForDisplayAssetCount:displayAssets:", v31, v29);
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      v76 = 0;
    }
    v66 = *(_OWORD *)buf;
    v67 = v76;
    PLStoryGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)buf = v66;
      v76 = v67;
      PXStoryAutoEditClipMotionInfoDescription((__int128 *)buf);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v37;
      _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEBUG, "Does not allow default ken burns. Falling back to %@", buf, 0xCu);

    }
    goto LABEL_28;
  }
  objc_msgSend(v22, "storyConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(id *)(a1 + 48);
  if (objc_msgSend(v24, "count") == 1)
  {
    v25 = objc_retainAutorelease(v24);
    v26 = *(_QWORD *)objc_msgSend(v25, "resourceIndexes");

    if (v26 == -1 && (objc_msgSend(v23, "disabledClipMotionStyles") & 2) == 0)
    {
      v27 = objc_msgSend(v23, "forcedKenBurnsScaleDirection");
      if (!v27)
        v27 = objc_msgSend(v23, "keyAssetKenBurnsScaleDirection");
      v28 = 1;
      if (v16)
        v28 = 2;
      if (v27)
        v28 = v27;
      *((_QWORD *)&v66 + 1) = v28;
      v67 = 0;
      *(_QWORD *)&v66 = 2;
      goto LABEL_31;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "_clipForDisplayAssets:", *(_QWORD *)(a1 + 48));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "displayAssets");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");
  v35 = objc_msgSend(*(id *)(a1 + 40), "numberOfClips");

  if (v34 == v35)
  {
    if (v32)
    {
      objc_msgSend(v32, "motionInfo");
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      v76 = 0;
    }
    v66 = *(_OWORD *)buf;
    v67 = v76;

LABEL_31:
    if (objc_msgSend(*(id *)(a1 + 48), "count") != 1
      || !objc_msgSend(v23, "forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset"))
    {
LABEL_36:

      v39 = objc_msgSend(*(id *)(a1 + 40), "numberOfClips");
      switch(v39)
      {
        case 3:
          if ((_QWORD)v66 == 3)
          {
LABEL_57:
            v54 = -v13;
            if (*((_QWORD *)&v66 + 1) != 1)
              v54 = v13;
            objc_msgSend(v3, "getParameters:forRotationWithAngle:scale:", *(_QWORD *)(a1 + 176), v54, v15);
            goto LABEL_5;
          }
          if ((_QWORD)v66 != 1)
          {
            if ((_QWORD)v66)
            {
              PLStoryGetLog();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                PFStoryRecipeClipMotionStyleDescription();
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v52;
                v53 = "Unsupported 3-up motion style: %@";
LABEL_80:
                _os_log_impl(&dword_1A6789000, v51, OS_LOG_TYPE_DEBUG, v53, buf, 0xCu);

              }
LABEL_81:

            }
            goto LABEL_82;
          }
          v56 = *((_QWORD *)&v66 + 1);
          v55 = v67;
          v57 = (_QWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "dividerAxes");
          if (*v57 != v57[1])
          {
LABEL_82:
            v21 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
            goto LABEL_83;
          }
          v58 = 1;
          if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
            v58 = 2;
          v59 = v56 == v58 || v56 == 4;
          v45 = 1.0;
          if (v59)
            v45 = -1.0;
          if (v55 == 1)
          {
LABEL_89:
            objc_msgSend(v3, "getParameters:forParallelPansWithDistance:", *(_QWORD *)(a1 + 176), v45 * v9);
            goto LABEL_5;
          }
          if (v55 == 2)
          {
LABEL_90:
            objc_msgSend(v3, "getParameters:forOppositePansWithDistance:", *(_QWORD *)(a1 + 176), v45 * v9);
            goto LABEL_5;
          }
          if (v55)
          {
LABEL_5:
            v21 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_83:
            v21();
            goto LABEL_84;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          v48 = *(_QWORD *)(a1 + 184);
          v49 = *(_QWORD *)(a1 + 32);
          v50 = 985;
          break;
        case 2:
          switch((uint64_t)v66)
          {
            case 0:
              goto LABEL_82;
            case 1:
              v43 = 1;
              if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
                v43 = 2;
              v44 = *((_QWORD *)&v66 + 1) == v43 || *((_QWORD *)&v66 + 1) == 4;
              v45 = 1.0;
              if (v44)
                v45 = -1.0;
              if (v67 == 1)
                goto LABEL_89;
              if (v67 == 2)
                goto LABEL_90;
              if (v67)
                goto LABEL_5;
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v46;
              v48 = *(_QWORD *)(a1 + 184);
              v49 = *(_QWORD *)(a1 + 32);
              v50 = 939;
              break;
            case 2:
              if (*((_QWORD *)&v66 + 1) == 1)
                v61 = v11;
              else
                v61 = 1.0 / v11;
              PXRectGetCenter();
              objc_msgSend(v3, "getParameters:forZoomWithScale:relativeTransformOrigin:", *(_QWORD *)(a1 + 176), v61, v62, v63);
              goto LABEL_5;
            case 3:
              goto LABEL_57;
            default:
              PLStoryGetLog();
              v51 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                goto LABEL_81;
              PFStoryRecipeClipMotionStyleDescription();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v52;
              v53 = "Unsupported 2-up motion style: %@";
              goto LABEL_80;
          }
          break;
        case 1:
          v40 = *(void **)(a1 + 32);
          v41 = *(_QWORD *)(a1 + 176);
          objc_msgSend(*(id *)(a1 + 48), "firstObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "_getOneUpKenBurnsParameters:forDisplayAsset:motionInfo:motionParameters:factory:", v41, v42, &v66, &v68, v3);

          goto LABEL_5;
        default:
          goto LABEL_82;
      }
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v48, v49, CFSTR("PXStoryConcreteStyle.m"), v50, CFSTR("Relative pan direction is undefined"));

      abort();
    }
    objc_msgSend(*(id *)(a1 + 48), "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "aspectRatio");
    if (PXAspectRatioIsPortrait())
    {
      v38 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
      if (v38)
      {
        v64 = v66;
        v65 = v67;
        objc_msgSend(v38, "updatedMotionForPortraitAspectAsset:motionInfo:", v29, &v64);
      }
      else
      {
        memset(buf, 0, sizeof(buf));
        v76 = 0;
      }
      v66 = *(_OWORD *)buf;
      v67 = v76;
    }
    else if ((_QWORD)v66 == 1 && (unint64_t)(*((_QWORD *)&v66 + 1) - 3) <= 1)
    {
      v60 = 1;
      if (v16)
        v60 = 2;
      *(_QWORD *)&v66 = 2;
      *((_QWORD *)&v66 + 1) = v60;
      v67 = 0;
    }
LABEL_28:

    goto LABEL_36;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_84:
}

CMTime *__125__PXStoryConcreteTimelineStyle_durationForVerticallyPanningPortraitAsset_atSpeed_motionInfo_minimumDuration_croppingContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CMTime *result;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGRect rect;
  CMTime v47;
  _BYTE time[32];
  __int128 v49;
  _QWORD v50[4];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CMTime time2;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v3 = *(void **)(a1 + 32);
  *(_OWORD *)time = *(_OWORD *)(a1 + 88);
  *(_QWORD *)&time[16] = *(_QWORD *)(a1 + 104);
  v4 = a2;
  objc_msgSend(v3, "_kenBurnsMotionParametersForDuration:", CMTimeGetSeconds((CMTime *)time));
  v50[0] = v5;
  v50[1] = v6;
  v50[2] = v7;
  v50[3] = v8;
  objc_msgSend(*(id *)(a1 + 32), "_getOneUpKenBurnsParameters:forDisplayAsset:motionInfo:motionParameters:factory:", &v51, *(_QWORD *)(a1 + 40), a1 + 56, v50, v4);
  objc_msgSend(v4, "assetRectForClipIndex:", 0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "clipFrameForClipIndex:", 0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v58.origin.x = v10;
  v58.origin.y = v12;
  v58.size.width = v14;
  v58.size.height = v16;
  result = (CMTime *)CGRectIsNull(v58);
  if ((result & 1) == 0)
  {
    v59.origin.x = v18;
    v59.origin.y = v20;
    v59.size.width = v22;
    v59.size.height = v24;
    result = (CMTime *)CGRectIsNull(v59);
    if ((result & 1) == 0)
    {
      PXStoryRectFromCGRect();
      *(_OWORD *)time = v51;
      *(_OWORD *)&time[16] = v52;
      v49 = v53;
      PXStoryRectDenormalize();
      PXStoryRectOuterBounds();
      v44 = v27;
      rect.origin.x = v26;
      v42 = v29;
      v43 = v28;
      PXStoryRectFromCGRect();
      *(_OWORD *)time = v54;
      *(_OWORD *)&time[16] = v55;
      v49 = v56;
      PXStoryRectDenormalize();
      PXStoryRectOuterBounds();
      v65.origin.x = v30;
      v65.origin.y = v31;
      v65.size.width = v32;
      v65.size.height = v33;
      v60.origin.y = v44;
      v60.origin.x = rect.origin.x;
      v60.size.height = v42;
      v60.size.width = v43;
      v61 = CGRectUnion(v60, v65);
      x = v61.origin.x;
      y = v61.origin.y;
      width = v61.size.width;
      height = v61.size.height;
      v61.origin.x = v18;
      v61.origin.y = v20;
      v61.size.width = v22;
      v61.size.height = v24;
      rect.origin.x = v18;
      v38 = CGRectGetWidth(v61);
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      v45 = v38 / CGRectGetWidth(v62);
      v63.origin.x = x;
      v63.origin.y = y;
      v63.size.width = width;
      v63.size.height = height;
      v39 = CGRectGetHeight(v63);
      v64.origin.x = rect.origin.x;
      v64.origin.y = v20;
      v64.size.width = v22;
      v64.size.height = v24;
      v40 = CGRectGetHeight(v64);
      memset(&v47, 0, sizeof(v47));
      CMTimeMakeWithSeconds(&v47, -(v40 - v39 * v45) / *(double *)(a1 + 80), 600);
      *(_OWORD *)time = *(_OWORD *)(a1 + 88);
      *(_QWORD *)&time[16] = *(_QWORD *)(a1 + 104);
      time2 = v47;
      result = CMTimeMaximum((CMTime *)&rect.origin.y, (CMTime *)time, &time2);
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      *(_OWORD *)(v41 + 32) = *(_OWORD *)&rect.origin.y;
      *(CGFloat *)(v41 + 48) = rect.size.height;
    }
  }
  return result;
}

@end
