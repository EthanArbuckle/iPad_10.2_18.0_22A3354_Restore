@implementation PXStoryConcreteClip

- (PXStoryConcreteClip)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteClip.m"), 33, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteClip init]");

  abort();
}

- (PXStoryConcreteClip)initWithInfo:(id *)a3 resourceKind:(int64_t)a4 resourceIndex:(int64_t)a5 resourceOccurrenceIndex:(int64_t)a6 resourcesDataSource:(id)a7
{
  id v14;
  PXStoryConcreteClip *v15;
  PXStoryConcreteClip *v16;
  uint64_t v17;
  PXStoryResource *resource;
  void *v20;
  objc_super v21;

  v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryConcreteClip;
  v15 = -[PXStoryConcreteClip init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_identifier = a3->var0;
    memcpy(&v15->_info, a3, 0x300uLL);
    v16->_resourceKind = a4;
    v16->_resourceIndex = a5;
    v16->_resourceOccurrenceIndex = a6;
    objc_storeStrong((id *)&v16->_resourcesDataSource, a7);
    switch(a4)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("PXStoryConcreteClip.m"), 49, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1:
        objc_msgSend(v14, "displayAssetResourceAtIndex:", a5);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(v14, "songResourceAtIndex:", a5);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend(v14, "textResourceAtIndex:", a5);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        objc_msgSend(v14, "colorResourceAtIndex:", a5);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        objc_msgSend(v14, "frameFillingEffectResourceAtIndex:", a5);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        v17 = 0;
        break;
    }
    resource = v16->_resource;
    v16->_resource = (PXStoryResource *)v17;

  }
  return v16;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXStoryConcreteClip identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryConcreteClip resourceKind](self, "resourceKind");
  if (v7 > 5)
    v8 = CFSTR("??");
  else
    v8 = off_1E5135F60[v7];
  v9 = v8;
  -[PXStoryConcreteClip resource](self, "resource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXStoryConcreteClip resourceIndex](self, "resourceIndex");
  v12 = -[PXStoryConcreteClip resourceOccurrenceIndex](self, "resourceOccurrenceIndex");
  -[PXStoryConcreteClip resourcesDataSource](self, "resourcesDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@; %p; ID: %@; Resource Kind: %@; Resource:%@ resourceIndex:%ld resourceOccurenceIndex:%ld resourcesDataSource:%@>"),
                  v5,
                  self,
                  v6,
                  v9,
                  v10,
                  v11,
                  v12,
                  v13);

  return (NSString *)v14;
}

- (id)videoHighlight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[PXStoryConcreteClip resourceKind](self, "resourceKind") != 1)
  {
    v6 = 0;
    return v6;
  }
  -[PXStoryResourcesDataSource movieHighlightsForDisplayAssetAtIndex:](self->_resourcesDataSource, "movieHighlightsForDisplayAssetAtIndex:", self->_resourceIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryConcreteClip info](self, "info");
    v4 = v12;
    PXStoryMovieHighlightForPlaybackStyle(v3, v12);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if ((unint64_t)(v4 - 3) > 2 || v5 != 0)
      goto LABEL_12;
    PLStoryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PXStoryConcreteClip resource](self, "resource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXDisplayAssetPlaybackStyleDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Missing highlight for %@ (%@), curation: %@", buf, 0x20u);

    }
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)videoTimeRange
{
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  -[PXStoryConcreteClip info](self, "info");
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v6 = v11;
  v7 = v12;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  return -[PXStoryConcreteClip _videoTimeRangeForTargetDuration:](self, "_videoTimeRangeForTargetDuration:", &v6);
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)_videoTimeRangeForTargetDuration:(SEL)a3
{
  void *v7;
  Float64 Seconds;
  __int128 v9;
  NSObject *v10;
  void *v11;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  uint64_t v13;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  _BYTE rhs[32];
  __int128 v22;
  _BYTE time2[32];
  __int128 v24;
  _BYTE time1[32];
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];
  CMTime time[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 buf;
  _BYTE v38[32];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  -[PXStoryConcreteClip videoHighlight](self, "videoHighlight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXStoryConcreteClip info](self, "info");
    *(_OWORD *)&v38[16] = v32;
    v39 = v33;
    v40 = v34;
    v41 = v35;
    v42 = v36;
    buf = v30;
    *(_OWORD *)v38 = v31;
    *(_OWORD *)&time[0].value = *(_OWORD *)&v38[8];
    time[0].epoch = *((_QWORD *)&v32 + 1);
    Seconds = CMTimeGetSeconds(time);
    memset(time, 0, sizeof(time));
    objc_msgSend(v7, "bestTimeRangeForTargetDuration:", Seconds);
    memset(v28, 0, sizeof(v28));
    v27 = 0u;
    objc_msgSend(v7, "timeRange");
    *(_OWORD *)&time2[16] = *(_OWORD *)&time[0].epoch;
    v24 = *(_OWORD *)&time[1].timescale;
    *(_OWORD *)rhs = v27;
    *(_OWORD *)&rhs[16] = v28[0];
    v22 = v28[1];
    *(_OWORD *)time2 = *(_OWORD *)&time[0].value;
    PXStoryTimeRangeIntersection(time2, rhs, time1);
    *(_OWORD *)&time[0].epoch = *(_OWORD *)&time1[16];
    *(_OWORD *)&time[1].timescale = v26;
    *(_OWORD *)&time[0].value = *(_OWORD *)time1;
    *(_OWORD *)time1 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&time1[16] = a4->var3;
    *(_OWORD *)time2 = *(_OWORD *)&time[1].value;
    *(_QWORD *)&time2[16] = *((_QWORD *)&v26 + 1);
    if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) <= 0)
    {
      memset(time1, 0, 24);
      *(CMTime *)time2 = time[1];
      *(_OWORD *)rhs = *(_OWORD *)&a4->var0;
      *(_QWORD *)&rhs[16] = a4->var3;
      CMTimeSubtract(&v20, (CMTime *)time2, (CMTime *)rhs);
      CMTimeMultiplyByRatio((CMTime *)time1, &v20, 1, 2);
      *(CMTime *)rhs = time[0];
      v19 = *(CMTime *)time1;
      CMTimeAdd((CMTime *)time2, (CMTime *)rhs, &v19);
    }
    else
    {
      *(_OWORD *)time1 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&time1[16] = a4->var3;
      *(_OWORD *)time2 = *(_OWORD *)((char *)v28 + 8);
      *(_QWORD *)&time2[16] = *((_QWORD *)&v28[1] + 1);
      if ((CMTimeCompare((CMTime *)time1, (CMTime *)time2) & 0x80000000) == 0)
      {
        v9 = v28[0];
        *(_OWORD *)&retstr->var0.var0 = v27;
        *(_OWORD *)&retstr->var0.var3 = v9;
        *(_OWORD *)&retstr->var1.var1 = v28[1];
        goto LABEL_12;
      }
      memset(time1, 0, 24);
      *(CMTime *)time2 = time[0];
      *(_OWORD *)rhs = v27;
      *(_QWORD *)&rhs[16] = *(_QWORD *)&v28[0];
      CMTimeSubtract(&v18, (CMTime *)time2, (CMTime *)rhs);
      *(_OWORD *)time2 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&time2[16] = a4->var3;
      *(CMTime *)rhs = time[1];
      CMTimeSubtract(&v17, (CMTime *)time2, (CMTime *)rhs);
      *(_OWORD *)time2 = *(_OWORD *)((char *)v28 + 8);
      *(_QWORD *)&time2[16] = *((_QWORD *)&v28[1] + 1);
      *(CMTime *)rhs = time[1];
      CMTimeSubtract(&v16, (CMTime *)time2, (CMTime *)rhs);
      CMTimeMultiplyTimeByTimeRatio();
      *(CMTime *)time2 = time[0];
      *(_OWORD *)rhs = *(_OWORD *)time1;
      *(_QWORD *)&rhs[16] = *(_QWORD *)&time1[16];
      CMTimeSubtract(&v14, (CMTime *)time2, (CMTime *)rhs);
      CMTimeConvertScale(&v15, &v14, 600, kCMTimeRoundingMethod_RoundAwayFromZero);
      *(_OWORD *)rhs = v27;
      *(_QWORD *)&rhs[16] = *(_QWORD *)&v28[0];
      CMTimeMaximum((CMTime *)time2, &v15, (CMTime *)rhs);
    }
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)time2;
    retstr->var0.var3 = *(_QWORD *)&time2[16];
    *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&a4->var0;
    retstr->var1.var3 = a4->var3;
    goto LABEL_12;
  }
  -[PXStoryConcreteClip info](self, "info");
  if (v13 == 4)
  {
    PLStoryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PXStoryConcreteClip resource](self, "resource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Video clip is missing movie highlight! %@", (uint8_t *)&buf, 0xCu);

    }
  }
LABEL_12:

  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)playbackTimeRangeForClipDuration:(SEL)a3
{
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  CMTime v8;
  CMTime v9;
  CMTime v10;
  CMTime v11;
  CMTimeRange time2;
  __int128 v13;
  unsigned __int128 v14;
  uint64_t v15;
  _BYTE v16[32];
  uint64_t v17;
  CMTime v18;
  CMTimeRange v19;
  CMTimeRange time1;
  CMTime rhs;

  result = -[PXStoryConcreteClip resourceKind](self, "resourceKind");
  if (result == ($DEC141BA10DB957F4DDC414EFF8F1C09 *)1)
  {
    memset(&v19, 0, sizeof(v19));
    -[PXStoryConcreteClip videoTimeRange](self, "videoTimeRange");
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    CMTimeMakeWithSeconds(&v18, a4, 600);
    result = -[PXStoryConcreteClip _videoTimeRangeForTargetDuration:](self, "_videoTimeRangeForTargetDuration:", &v18);
    if ((v19.start.flags & 1) != 0
      && (v19.duration.flags & 1) != 0
      && !v19.duration.epoch
      && (v19.duration.value & 0x8000000000000000) == 0)
    {
      -[PXStoryConcreteClip info](self, "info");
      *(_OWORD *)v16 = v13;
      *(_OWORD *)&v16[16] = v14;
      v17 = v15;
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v16[4];
      time1.start.epoch = v14 >> 32;
      *(_OWORD *)&time2.start.value = PXStoryTimeZero;
      time2.start.epoch = 0;
      result = ($DEC141BA10DB957F4DDC414EFF8F1C09 *)CMTimeCompare(&time1.start, &time2.start);
      if ((int)result >= 1)
      {
        *(_OWORD *)&time2.start.value = *(_OWORD *)&retstr->var0.var0;
        time2.start.epoch = retstr->var0.var3;
        memset(&time2.duration, 0, sizeof(time2.duration));
        *(_OWORD *)&time1.start.value = *(_OWORD *)&retstr->var1.var0;
        time1.start.epoch = retstr->var1.var3;
        rhs = *(CMTime *)&v16[4];
        CMTimeAdd(&time2.duration, &time1.start, &rhs);
        time1 = time2;
        CMTimeRangeGetEnd(&v11, &time1);
        time1 = v19;
        CMTimeRangeGetEnd(&v10, &time1);
        time1.start = v11;
        rhs = v10;
        result = ($DEC141BA10DB957F4DDC414EFF8F1C09 *)CMTimeCompare(&time1.start, &rhs);
        if ((int)result >= 1)
        {
          time1 = v19;
          CMTimeRangeGetEnd(&v8, &time1);
          rhs = time2.duration;
          time1.start = v8;
          CMTimeSubtract(&v9, &time1.start, &rhs);
          time2.start = v9;
          time1.start = v9;
          rhs = v19.start;
          result = ($DEC141BA10DB957F4DDC414EFF8F1C09 *)CMTimeCompare(&time1.start, &rhs);
          if ((result & 0x80000000) != 0)
            time2 = v19;
          *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time2.start.value;
          retstr->var0.var3 = time2.start.epoch;
        }
      }
    }
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0uLL;
    *(_OWORD *)&retstr->var1.var1 = 0uLL;
    *(_OWORD *)&retstr->var0.var0 = 0uLL;
  }
  return result;
}

- (PFStoryRecipeDisplayAssetNormalization)colorNormalization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PXStoryResourcesDataSource displayAssetResourceAtIndex:](self->_resourcesDataSource, "displayAssetResourceAtIndex:", self->_resourceIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "px_storyResourceDisplayAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "resource px_storyResourceDisplayAsset uuid is %@", (uint8_t *)&v11, 0xCu);

  }
  if (-[PXStoryConcreteClip resourceKind](self, "resourceKind") != 1
    && -[PXStoryConcreteClip resourceKind](self, "resourceKind") != 5)
  {
    v8 = 0;
    goto LABEL_10;
  }
  -[PXStoryResourcesDataSource movieHighlightsForDisplayAssetAtIndex:](self->_resourcesDataSource, "movieHighlightsForDisplayAssetAtIndex:", self->_resourceIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestHighlight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "normalizationData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v3, "px_storyResourceFetchNormalizationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_8;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }

LABEL_8:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752C0]), "initWithAnalysisData:", v8);
LABEL_11:

  return (PFStoryRecipeDisplayAssetNormalization *)v9;
}

- (BOOL)isEqualToClip:(id)a3
{
  PXStoryConcreteClip *v4;
  PXStoryConcreteClip *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (PXStoryConcreteClip *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXStoryConcreteClip resourceKind](self, "resourceKind");
      if (v6 == -[PXStoryConcreteClip resourceKind](v5, "resourceKind")
        && (v7 = -[PXStoryConcreteClip resourceIndex](self, "resourceIndex"),
            v7 == -[PXStoryConcreteClip resourceIndex](v5, "resourceIndex"))
        && (v8 = -[PXStoryConcreteClip resourceOccurrenceIndex](self, "resourceOccurrenceIndex"),
            v8 == -[PXStoryConcreteClip resourceOccurrenceIndex](v5, "resourceOccurrenceIndex")))
      {
        -[PXStoryConcreteClip resourcesDataSource](self, "resourcesDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryConcreteClip resourcesDataSource](v5, "resourcesDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[PXStoryConcreteClip resourceKind](self, "resourceKind");
  return v3 ^ (2 * -[PXStoryConcreteClip resourceIndex](self, "resourceIndex"));
}

- (BOOL)isVisuallyEqualToClip:(id)a3
{
  PXStoryConcreteClip *v4;
  PXStoryConcreteClip *v5;
  BOOL v6;
  char v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v4 = (PXStoryConcreteClip *)a3;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_15;
  }
  v5 = v4;
  if (!-[PXStoryConcreteClip isEqualToClip:](self, "isEqualToClip:", v5)
    || self->_info.playbackStyle != v5->_info.playbackStyle)
  {
    goto LABEL_11;
  }
  v6 = self->_info.clipSize.width == v5->_info.clipSize.width
    && self->_info.clipSize.height == v5->_info.clipSize.height;
  if (!v6 || ((LODWORD(v5->_info.options) ^ LODWORD(self->_info.options)) & 0xDLL) != 0)
    goto LABEL_11;
  v7 = 0;
  if (self->_info.assetContentInfo.size.width != v5->_info.assetContentInfo.size.width
    || self->_info.assetContentInfo.size.height != v5->_info.assetContentInfo.size.height)
  {
    goto LABEL_12;
  }
  x = self->_info.assetContentInfo.acceptableCropRect.origin.x;
  y = self->_info.assetContentInfo.acceptableCropRect.origin.y;
  width = self->_info.assetContentInfo.acceptableCropRect.size.width;
  height = self->_info.assetContentInfo.acceptableCropRect.size.height;
  v31 = self->_info.assetContentInfo.faceAreaRect.origin.y;
  v32 = self->_info.assetContentInfo.faceAreaRect.origin.x;
  v29 = self->_info.assetContentInfo.faceAreaRect.size.height;
  v30 = self->_info.assetContentInfo.faceAreaRect.size.width;
  v23 = self->_info.assetContentInfo.bestPlaybackRect.origin.y;
  v24 = self->_info.assetContentInfo.bestPlaybackRect.origin.x;
  v21 = self->_info.assetContentInfo.bestPlaybackRect.size.height;
  v22 = self->_info.assetContentInfo.bestPlaybackRect.size.width;
  v13 = v5->_info.assetContentInfo.acceptableCropRect.origin.x;
  v14 = v5->_info.assetContentInfo.acceptableCropRect.origin.y;
  v15 = v5->_info.assetContentInfo.acceptableCropRect.size.width;
  v16 = v5->_info.assetContentInfo.acceptableCropRect.size.height;
  v27 = v5->_info.assetContentInfo.faceAreaRect.origin.y;
  v28 = v5->_info.assetContentInfo.faceAreaRect.origin.x;
  v25 = v5->_info.assetContentInfo.faceAreaRect.size.height;
  v26 = v5->_info.assetContentInfo.faceAreaRect.size.width;
  v19 = v5->_info.assetContentInfo.bestPlaybackRect.origin.y;
  v20 = v5->_info.assetContentInfo.bestPlaybackRect.origin.x;
  v17 = v5->_info.assetContentInfo.bestPlaybackRect.size.height;
  v18 = v5->_info.assetContentInfo.bestPlaybackRect.size.width;
  if (!CGRectEqualToRect(self->_info.assetContentInfo.preferredCropRect, v5->_info.assetContentInfo.preferredCropRect))
    goto LABEL_11;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v36.origin.x = v13;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = v16;
  if (!CGRectEqualToRect(v33, v36))
    goto LABEL_11;
  v34.origin.y = v31;
  v34.origin.x = v32;
  v34.size.height = v29;
  v34.size.width = v30;
  v37.origin.y = v27;
  v37.origin.x = v28;
  v37.size.height = v25;
  v37.size.width = v26;
  if (!CGRectEqualToRect(v34, v37))
    goto LABEL_11;
  v35.origin.y = v23;
  v35.origin.x = v24;
  v35.size.height = v21;
  v35.size.width = v22;
  v38.origin.y = v19;
  v38.origin.x = v20;
  v38.size.height = v17;
  v38.size.width = v18;
  if (!CGRectEqualToRect(v35, v38) || !PXEdgeInsetsEqualToEdgeInsets())
    goto LABEL_11;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.sourceInsets.top.preRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.top.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.top.rotationAngle != v5->_info.clippingAnimationInfo.sourceInsets.top.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.top.postRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.top.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.sourceInsets.left.preRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.left.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.left.rotationAngle != v5->_info.clippingAnimationInfo.sourceInsets.left.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.left.postRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.left.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.sourceInsets.bottom.preRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.bottom.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.bottom.rotationAngle != v5->_info.clippingAnimationInfo.sourceInsets.bottom.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.bottom.postRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.bottom.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.sourceInsets.right.preRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.right.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.right.rotationAngle != v5->_info.clippingAnimationInfo.sourceInsets.right.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.sourceInsets.right.postRotationInset != v5->_info.clippingAnimationInfo.sourceInsets.right.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.targetInsets.top.preRotationInset != v5->_info.clippingAnimationInfo.targetInsets.top.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.top.rotationAngle != v5->_info.clippingAnimationInfo.targetInsets.top.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.top.postRotationInset != v5->_info.clippingAnimationInfo.targetInsets.top.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.targetInsets.left.preRotationInset != v5->_info.clippingAnimationInfo.targetInsets.left.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.left.rotationAngle != v5->_info.clippingAnimationInfo.targetInsets.left.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.left.postRotationInset != v5->_info.clippingAnimationInfo.targetInsets.left.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.targetInsets.bottom.preRotationInset != v5->_info.clippingAnimationInfo.targetInsets.bottom.preRotationInset)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.bottom.rotationAngle != v5->_info.clippingAnimationInfo.targetInsets.bottom.rotationAngle)
    goto LABEL_12;
  if (self->_info.clippingAnimationInfo.targetInsets.bottom.postRotationInset != v5->_info.clippingAnimationInfo.targetInsets.bottom.postRotationInset)
    goto LABEL_12;
  v7 = 0;
  if (self->_info.clippingAnimationInfo.targetInsets.right.preRotationInset != v5->_info.clippingAnimationInfo.targetInsets.right.preRotationInset
    || self->_info.clippingAnimationInfo.targetInsets.right.rotationAngle != v5->_info.clippingAnimationInfo.targetInsets.right.rotationAngle
    || self->_info.clippingAnimationInfo.targetInsets.right.postRotationInset != v5->_info.clippingAnimationInfo.targetInsets.right.postRotationInset)
  {
    goto LABEL_12;
  }
  if (PXStoryRectEqualToRect())
    v7 = PXStoryRectEqualToRect();
  else
LABEL_11:
    v7 = 0;
LABEL_12:

LABEL_15:
  return v7;
}

- (id)copyWithInfo:(id *)a3
{
  PXStoryConcreteClip *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  PXStoryConcreteClip *v10;
  _BYTE v12[768];

  v5 = [PXStoryConcreteClip alloc];
  v6 = -[PXStoryConcreteClip resourceKind](self, "resourceKind");
  v7 = -[PXStoryConcreteClip resourceIndex](self, "resourceIndex");
  v8 = -[PXStoryConcreteClip resourceOccurrenceIndex](self, "resourceOccurrenceIndex");
  -[PXStoryConcreteClip resourcesDataSource](self, "resourcesDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v12, a3, sizeof(v12));
  v10 = -[PXStoryConcreteClip initWithInfo:resourceKind:resourceIndex:resourceOccurrenceIndex:resourcesDataSource:](v5, "initWithInfo:resourceKind:resourceIndex:resourceOccurrenceIndex:resourcesDataSource:", v12, v6, v7, v8, v9);

  return v10;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (PXStoryResource)resource
{
  return self->_resource;
}

- ($C99EDD0FAA5CC172DE20AC79C6A499CF)info
{
  return ($C99EDD0FAA5CC172DE20AC79C6A499CF *)memcpy(retstr, &self->_info, 0x300uLL);
}

- (int64_t)resourceKind
{
  return self->_resourceKind;
}

- (int64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (int64_t)resourceOccurrenceIndex
{
  return self->_resourceOccurrenceIndex;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

@end
