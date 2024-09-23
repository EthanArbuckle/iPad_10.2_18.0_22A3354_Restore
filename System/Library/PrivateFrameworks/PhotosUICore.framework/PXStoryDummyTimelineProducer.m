@implementation PXStoryDummyTimelineProducer

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  void (**v7)(id, PXStoryProducerResult *);
  void *v8;
  PXStoryProducerResult *v9;

  v7 = (void (**)(id, PXStoryProducerResult *))a5;
  -[PXStoryDummyTimelineProducer createTimelineWithConfiguration:detailsFraction:](self, "createTimelineWithConfiguration:detailsFraction:", a3, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v8);
  v7[2](v7, v9);

  return 0;
}

- (id)createTimelineWithConfiguration:(id)a3 detailsFraction:(double)a4
{
  id v6;
  PXStoryMutableDummyTimeline *v7;
  void *v8;
  PXStoryMutableDummyTimeline *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _PXStoryDummyDisplayAssetsFetchResult *v20;
  void *v21;
  uint64_t v22;
  char v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  PXStoryMutableDummyTimeline *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _PXStoryDummyDisplayAssetsFetchResult *v43;
  void *v44;
  _OWORD v45[3];
  __int128 v46;
  uint64_t v47;
  CMTimeRange v48;
  CMTime v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD rhs[2];
  uint64_t v56;
  CMTime v57;
  CMTimeRange range;
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [PXStoryMutableDummyTimeline alloc];
  objc_msgSend(v6, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewportSize");
  v9 = -[PXStoryDummyTimeline initWithSize:](v7, "initWithSize:");

  objc_msgSend(v6, "resourcesDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createRandomNumberGenerators");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorReporter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v13;
  objc_msgSend(v12, "timelineStyleWithSpec:resourcesDataSource:randomNumberGenerators:errorReporter:", v11, v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "keyAssetResource");
  v16 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v16;
  if (v16)
  {
    v59[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeWithSeconds(&v57, 2.0, 600);
    memset(&range, 0, 40);
    rhs[0] = PXStoryTransitionInfoNone;
    rhs[1] = xmmword_1A7C0B7D8;
    v56 = 0;
    -[PXStoryMutableDummyTimeline addSegmentWithResources:preferredDuration:compositionInfo:transitionInfo:](v9, "addSegmentWithResources:preferredDuration:compositionInfo:transitionInfo:", v17, &v57, &range, rhs);

  }
  v52 = 0;
  v53 = 0;
  v54 = 0;
  -[PXStoryDummyTimelineProducer fixedDuration](self, "fixedDuration");
  v18 = objc_msgSend(v10, "numberOfDisplayAssetResources");
  if (v18 >= 1)
  {
    v19 = v18;
    v38 = v12;
    v39 = v11;
    v40 = v6;
    v50 = 0uLL;
    v51 = 0;
    if (v15)
      objc_msgSend(v15, "defaultDisplayAssetPresentationDuration");
    v20 = -[_PXStoryDummyDisplayAssetsFetchResult initWithResourcesDataSource:]([_PXStoryDummyDisplayAssetsFetchResult alloc], "initWithResourcesDataSource:", v10);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    v22 = 0;
    v23 = 0;
    v24 = (double)v19;
    v43 = v20;
    while (1)
    {
      v25 = v19 - v22;
      if (v19 - v22 >= 3)
        v26 = 3;
      else
        v26 = v19 - v22;
      -[_PXStoryDummyDisplayAssetsFetchResult configureWithRange:](v20, "configureWithRange:", v22, v26);
      if (v9)
        -[PXStoryDummyTimeline timeRange](v9, "timeRange");
      else
        memset(&v48, 0, sizeof(v48));
      range = v48;
      CMTimeRangeGetEnd(&v49, &range);
      objc_msgSend(v15, "allowedClipCompositionsWithStartTime:nextDisplayAssets:", &v49, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v27, "count") < 2)
        goto LABEL_17;
      v28 = 1;
      if ((v23 & 1) == 0)
        goto LABEL_18;
      if ((double)v22 / v24 >= a4)
LABEL_17:
        v28 = 1;
      else
        v28 = 2;
LABEL_18:
      if (v25 >= 1)
      {
        v44 = v27;
        v29 = v19;
        v30 = v15;
        v31 = v9;
        if (v28 >= v25)
          v32 = v25;
        else
          v32 = v28;
        v33 = v22 + v32;
        do
        {
          objc_msgSend(v10, "displayAssetResourceAtIndex:", v22);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v34);

          ++v22;
          --v32;
        }
        while (v32);
        v22 = v33;
        v9 = v31;
        v15 = v30;
        v19 = v29;
        v20 = v43;
        v27 = v44;
      }
      v46 = v50;
      v47 = v51;
      memset(&range, 0, 40);
      rhs[0] = PXStoryTransitionInfoNone;
      rhs[1] = xmmword_1A7C0B7D8;
      v56 = 0;
      -[PXStoryMutableDummyTimeline addSegmentWithResources:preferredDuration:compositionInfo:transitionInfo:](v9, "addSegmentWithResources:preferredDuration:compositionInfo:transitionInfo:", v21, &v46, &range, rhs);
      objc_msgSend(v21, "removeAllObjects");

      if (v22 >= v19)
      {

        v11 = v39;
        v6 = v40;
        v12 = v38;
        break;
      }
      ++v23;
    }
  }
  objc_msgSend(v12, "songResource");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    if (v9)
      -[PXStoryDummyTimeline timeRange](v9, "timeRange");
    else
      memset(v45, 0, sizeof(v45));
    -[PXStoryDummyTimeline size](v9, "size");
    PXRectWithOriginAndSize();
    *(_OWORD *)&range.start.value = PXStoryTransitionInfoNone;
    *(_OWORD *)&range.start.epoch = xmmword_1A7C0B7D8;
    *(_QWORD *)&range.duration.timescale = 0;
    -[PXStoryMutableDummyTimeline addClipWithTimeRange:frame:resource:playbackStyle:transitionInfo:](v9, "addClipWithTimeRange:frame:resource:playbackStyle:transitionInfo:", v45, v35, 0, &range);
  }
  v36 = (void *)-[PXStoryMutableDummyTimeline copy](v9, "copy");

  return v36;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (void)setFixedDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_fixedDuration.epoch = a3->var3;
  *(_OWORD *)&self->_fixedDuration.value = v3;
}

@end
