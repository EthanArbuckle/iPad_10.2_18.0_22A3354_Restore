@implementation PXStoryConcreteAutoEditDecisionList

- (PXStoryConcreteAutoEditDecisionList)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteAutoEditDecisionList.m"), 23, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteAutoEditDecisionList init]");

  abort();
}

- (PXStoryConcreteAutoEditDecisionList)initWithColorGradeCategory:(id)a3 song:(id)a4 clipCatalog:(id)a5 constrainedOverallDurationInfo:(id *)a6 outroDuration:(id *)a7 allowsNUp:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  PXStoryConcreteAutoEditDecisionList *v18;
  PXStoryConcreteAutoEditDecisionList *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTime v25;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PXStoryConcreteAutoEditDecisionList;
  v18 = -[PXStoryConcreteAutoEditDecisionList init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_colorGradeCategory, a3);
    objc_storeStrong((id *)&v19->_song, a4);
    objc_storeStrong((id *)&v19->_clipCatalog, a5);
    *(_OWORD *)&v19->_overallDurationInfo.kind = *(_OWORD *)&a6->var0;
    v20 = *(_OWORD *)&a6->var1.var0.var1;
    v21 = *(_OWORD *)&a6->var1.var1.var0;
    v22 = *(_OWORD *)&a6->var1.var1.var3;
    *(_OWORD *)&v19->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = *(_OWORD *)&a6->var1.var2.var1;
    *(_OWORD *)&v19->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = v22;
    *(_OWORD *)&v19->_overallDurationInfo.specificDurationInfo.preferredDuration.value = v21;
    *(_OWORD *)&v19->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v20;
    CMTimeMakeWithSeconds(&v25, 3.0, 600);
    v19->_defaultDisplayAssetPresentationDuration = ($95D729B680665BEAEFA1D6FCA8238556)v25;
    v19->_allowsNUp = a8;
    v23 = *(_OWORD *)&a7->var0;
    v19->_outroDuration.epoch = a7->var3;
    *(_OWORD *)&v19->_outroDuration.value = v23;
  }

  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Float64 Seconds;
  const char *v8;
  void *v9;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXStoryConcreteAutoEditDecisionList colorGradeCategory](self, "colorGradeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteAutoEditDecisionList song](self, "song");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteAutoEditDecisionList defaultDisplayAssetPresentationDuration](self, "defaultDisplayAssetPresentationDuration");
  Seconds = CMTimeGetSeconds(&time);
  if (-[PXStoryConcreteAutoEditDecisionList allowsNUp](self, "allowsNUp"))
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p - colorGradeCategory: %@, song: %@, default asset duration: %f, allows N-up: %s, number of clips: %ld>"), v4, self, v5, v6, *(_QWORD *)&Seconds, v8, -[PXStoryConcreteAutoEditDecisionList numberOfClips](self, "numberOfClips"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Float64 Seconds;
  const char *v8;
  int64_t v9;
  void *v10;
  void *v11;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXStoryConcreteAutoEditDecisionList colorGradeCategory](self, "colorGradeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteAutoEditDecisionList song](self, "song");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteAutoEditDecisionList defaultDisplayAssetPresentationDuration](self, "defaultDisplayAssetPresentationDuration");
  Seconds = CMTimeGetSeconds(&time);
  if (-[PXStoryConcreteAutoEditDecisionList allowsNUp](self, "allowsNUp"))
    v8 = "YES";
  else
    v8 = "NO";
  v9 = -[PXStoryConcreteAutoEditDecisionList numberOfClips](self, "numberOfClips");
  -[PXStoryAutoEditClipCatalog debugDescription](self->_clipCatalog, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p - colorGradeCategory: %@, song: %@, default asset duration: %f, allows N-up: %s, number of clips: %ld, clips: %@>"), v4, self, v5, v6, *(_QWORD *)&Seconds, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)diagnosticDescription
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("Clip\tStyle\tN\tMin(s)\tPref(s)\tMax(s)\tAudio\tVolume\tJ-Cut\tL-Cut\tFadeIn\tFadeOut\tMotion\tSettings  \tTransition\tDuration\tSettings  \tModule    \tType \n"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PXStoryConcreteAutoEditDecisionList_diagnosticDescription__block_invoke;
  v6[3] = &unk_1E513BD30;
  v4 = v3;
  v7 = v4;
  -[PXStoryConcreteAutoEditDecisionList enumerateClipsUsingBlock:](self, "enumerateClipsUsingBlock:", v6);

  return (NSString *)v4;
}

- (NSString)decisionPapertrail
{
  void *v3;
  _QWORD v5[4];
  __CFString *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__237847;
  v12 = __Block_byref_object_dispose__237848;
  v13 = (id)objc_opt_new();
  objc_msgSend((id)v9[5], "appendFormat:", CFSTR("%@ output\n=================\n"), CFSTR("Papertrail"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PXStoryConcreteAutoEditDecisionList_decisionPapertrail__block_invoke;
  v5[3] = &unk_1E513BD58;
  v6 = CFSTR("Papertrail");
  v7 = &v8;
  -[PXStoryConcreteAutoEditDecisionList enumerateClipsUsingBlock:](self, "enumerateClipsUsingBlock:", v5);
  v3 = (void *)objc_msgSend((id)v9[5], "copy");

  _Block_object_dispose(&v8, 8);
  return (NSString *)v3;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)overallDurationInfo
{
  $19C3178046A4CD95E25554FCB23DE520 *p_var1;
  $336525CEFD5B2F1C5550B48E7B6054AC *v5;
  uint64_t v6;
  void *var0;
  __int128 v8;
  __int128 v9;
  int64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  p_var1 = &self[1].var1;
  if (!self[1].var1.var0.var0)
  {
    v5 = self;
    v16 = 0;
    v17 = &v16;
    v18 = 0x6810000000;
    v20 = *MEMORY[0x1E0CA2E68];
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v19 = &unk_1A7E74EE7;
    v21 = v6;
    v22 = v20;
    v24 = v20;
    v23 = v6;
    v25 = v6;
    var0 = (void *)self->var1.var0.var0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__PXStoryConcreteAutoEditDecisionList_overallDurationInfo__block_invoke;
    v15[3] = &unk_1E513BD80;
    v15[4] = &v16;
    objc_msgSend(var0, "enumerateClipsUsingBlock:", v15);
    v8 = *((_OWORD *)v17 + 4);
    v9 = *((_OWORD *)v17 + 5);
    v10 = v17[12];
    v12 = *((_OWORD *)v17 + 2);
    v11 = *((_OWORD *)v17 + 3);
    v5[1].var1.var0.var0 = 1;
    v5[2].var0 = v10;
    *(_OWORD *)&v5[1].var1.var1.var3 = v8;
    *(_OWORD *)&v5[1].var1.var2.var1 = v9;
    *(_OWORD *)&v5[1].var1.var0.var1 = v12;
    *(_OWORD *)&v5[1].var1.var1.var0 = v11;
    _Block_object_dispose(&v16, 8);
  }
  v13 = *(_OWORD *)&p_var1->var2.var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&p_var1->var1.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v13;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&p_var1->var2.var3;
  v14 = *(_OWORD *)&p_var1->var0.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_var1->var0.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v14;
  return self;
}

- (int64_t)numberOfClips
{
  return -[PXStoryAutoEditClipCatalog numberOfClips](self->_clipCatalog, "numberOfClips");
}

- (id)clipForDisplayAsset:(id)a3
{
  return (id)-[PXStoryAutoEditClipCatalog clipForDisplayAsset:](self->_clipCatalog, "clipForDisplayAsset:", a3);
}

- (id)clipAtIndex:(int64_t)a3
{
  return (id)-[PXStoryAutoEditClipCatalog clipAtIndex:](self->_clipCatalog, "clipAtIndex:", a3);
}

- (void)enumerateClipsUsingBlock:(id)a3
{
  -[PXStoryAutoEditClipCatalog enumerateClipsUsingBlock:](self->_clipCatalog, "enumerateClipsUsingBlock:", a3);
}

- (NSString)colorGradeCategory
{
  return self->_colorGradeCategory;
}

- (PXAudioAsset)song
{
  return self->_song;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (BOOL)allowsNUp
{
  return self->_allowsNUp;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_clipCatalog, 0);
}

double __58__PXStoryConcreteAutoEditDecisionList_overallDurationInfo__block_invoke(uint64_t a1, void *a2)
{
  double result;
  CMTime v4;
  CMTime v5;
  CMTime rhs;
  CMTime lhs;
  CMTime v8;
  __int128 v9;
  _BYTE v10[64];

  v9 = 0u;
  memset(v10, 0, 56);
  if (a2)
    objc_msgSend(a2, "durationInfo");
  lhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  *(_OWORD *)&rhs.value = v9;
  rhs.epoch = *(_QWORD *)v10;
  CMTimeAdd(&v8, &lhs, &rhs);
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v8;
  lhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
  rhs = *(CMTime *)&v10[8];
  CMTimeAdd(&v5, &lhs, &rhs);
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = v5;
  lhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80);
  rhs = *(CMTime *)&v10[32];
  CMTimeAdd(&v4, &lhs, &rhs);
  result = *(double *)&v4.value;
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80) = v4;
  return result;
}

void __57__PXStoryConcreteAutoEditDecisionList_decisionPapertrail__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(a2, "debugInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nClip %d:\n=====\n%@"), a3, v6);

}

void __60__PXStoryConcreteAutoEditDecisionList_diagnosticDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  Float64 v9;
  Float64 v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  char v28;
  void *v29;
  __int16 v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  Float64 Seconds;
  void *v43;
  void *v44;
  _OWORD v45[2];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[6];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  CMTime v78;
  CMTime v79;
  __int128 v80;
  _OWORD v81[3];
  uint64_t v82;
  CMTime v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  CMTime time;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "playbackStyle");
  PFDisplayAssetPlaybackStyleDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByPaddingToLength:withString:startingAtIndex:", 5, CFSTR(" "), 0);
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v4)
  {
    objc_msgSend(v4, "durationInfo");
    *(_OWORD *)&time.value = v84;
    time.epoch = v85;
    Seconds = CMTimeGetSeconds(&time);
    objc_msgSend(v4, "durationInfo");
    v83 = *(CMTime *)((char *)v81 + 8);
    v9 = CMTimeGetSeconds(&v83);
    objc_msgSend(v4, "durationInfo");
    v79 = v78;
    v10 = CMTimeGetSeconds(&v79);
    objc_msgSend(v4, "audioInfo");
    v11 = v71;
    if ((unint64_t)v71 > 3)
    {
      v12 = CFSTR("??");
      goto LABEL_6;
    }
  }
  else
  {
    v88 = 0;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    v82 = 0;
    v80 = 0u;
    memset(v81, 0, sizeof(v81));
    *(_OWORD *)&v83.value = *(_OWORD *)((char *)v81 + 8);
    v83.epoch = 0;
    v9 = CMTimeGetSeconds(&v83);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    memset(&v78, 0, sizeof(v78));
    memset(&v79, 0, sizeof(v79));
    v10 = CMTimeGetSeconds(&v79);
    v11 = 0;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0;
  }
  v12 = off_1E51361C0[v11];
LABEL_6:
  v13 = v12;
  -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v13, "stringByPaddingToLength:withString:startingAtIndex:", 5, CFSTR(" "), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "audioInfo");
    objc_msgSend(v4, "audioInfo");
    v15 = *((_QWORD *)&v64 + 1);
    objc_msgSend(v4, "audioInfo");
    v16 = v61;
    objc_msgSend(v4, "audioInfo");
    v17 = *((_QWORD *)&v57 + 1);
    objc_msgSend(v4, "audioInfo");
    v18 = v54;
    objc_msgSend(v4, "motionInfo");
    v19 = *(float *)&v68;
  }
  else
  {
    v70 = 0;
    v68 = 0u;
    v69 = 0u;
    v67 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0;
    v54 = 0;
    v52 = 0u;
    v53 = 0u;
    v51 = 0u;
    v18 = 0;
    v16 = 0;
    v19 = 0.0;
    memset(&v50[3], 0, 24);
    v15 = 0;
    v17 = 0;
  }
  PFStoryRecipeClipMotionStyleDescription();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringByPaddingToLength:withString:startingAtIndex:", 6, CFSTR(" "), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "motionInfo");
  else
    memset(v50, 0, 24);
  PXStoryAutoEditClipMotionSettingsDescription(v50);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringByPaddingToLength:withString:startingAtIndex:", 10, CFSTR(" "), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "transitionInfo");
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
  }
  PFStoryRecipeClipTransitionKindDescription();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringByPaddingToLength:withString:startingAtIndex:", 10, CFSTR(" "), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "transitionInfo");
    v21 = *((_QWORD *)&v46 + 1);
    objc_msgSend(v4, "transitionInfo");
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    memset(v45, 0, sizeof(v45));
    v21 = 0;
  }
  PXStoryAutoEditClipTransitionSettingsDescription(v45);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByPaddingToLength:withString:startingAtIndex:", 10, CFSTR(" "), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "moduleInfo");
  v41 = v5;
  v36 = v8;
  if (v24 > 3)
    v25 = CFSTR("??");
  else
    v25 = off_1E511F160[v24];
  v26 = v25;
  -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v26, "stringByPaddingToLength:withString:startingAtIndex:", 10, CFSTR(" "), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moduleInfo");
  v43 = v7;
  v44 = v6;
  if ((v28 & 1) != 0)
  {
    v29 = (void *)v33;
    v31 = CFSTR("start");
  }
  else
  {
    v29 = (void *)v33;
    objc_msgSend(v4, "moduleInfo");
    if ((v30 & 0x100) != 0)
      v31 = CFSTR("break");
    else
      v31 = CFSTR("--");
  }
  -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v31, "stringByPaddingToLength:withString:startingAtIndex:", 5, CFSTR(" "), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendFormat:", CFSTR("%4lu\t%@\t%lu\t%6.2f\t%7.2f\t%6.2f\t%@\t%6.2f\t%5.2f\t%5.2f\t%6.2f\t%7.2f\t%@\t%@\t%@\t%8.2f\t%@\t%@\t%@\n"), a3, v29, v36, *(_QWORD *)&Seconds, *(_QWORD *)&v9, *(_QWORD *)&v10, v14, *(_QWORD *)&v19, v15, v16, v17, v18, v39, v34, v20, v21,
    v23,
    v27,
    v32);

}

@end
