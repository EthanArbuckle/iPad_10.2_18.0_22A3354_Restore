@implementation PXStoryViewModeBrowserToPlayerTransition

- (PXStoryViewModeBrowserToPlayerTransition)initWithDestinationTimelineLayoutSnapshot:(id)a3 assetReference:(id)a4 trackingClipIdentifier:(int64_t)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  PXStoryViewModeBrowserToPlayerTransition *v24;
  objc_super v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _OWORD v30[3];

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0CB3788];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "timeline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v8, "timeRange");
  else
    memset(v30, 0, sizeof(v30));
  objc_msgSend(v8, "timelineRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __124__PXStoryViewModeBrowserToPlayerTransition_initWithDestinationTimelineLayoutSnapshot_assetReference_trackingClipIdentifier___block_invoke;
  v27[3] = &unk_1E512D058;
  v28 = v11;
  v29 = v12;
  v22 = v12;
  v23 = v11;
  objc_msgSend(v13, "enumerateClipsInTimeRange:rect:usingBlock:", v30, v27, v15, v17, v19, v21);

  v26.receiver = self;
  v26.super_class = (Class)PXStoryViewModeBrowserToPlayerTransition;
  v24 = -[PXStoryViewModeFocusedClipsViewTransition initWithSourceViewMode:sourceSnapshot:destinationViewMode:destinationSnapshot:assetReference:focusedClipIdentifiers:trackingClipIdentifier:](&v26, sel_initWithSourceViewMode_sourceSnapshot_destinationViewMode_destinationSnapshot_assetReference_focusedClipIdentifiers_trackingClipIdentifier_, 2, 0, 1, v8, v10, v23, a5);

  return v24;
}

- (double)dampingRatio
{
  return 0.9;
}

- (double)springStiffness
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewModeBrowserToPlayerTransition;
  -[PXStoryViewModeTransition springStiffness](&v4, sel_springStiffness);
  return v2 * 1.5;
}

- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  id v10;
  unint64_t var1;
  double v13;
  _BYTE v15[768];
  objc_super v16;

  v10 = a6;
  var1 = a3->var1;
  if (var1 <= 3 && var1 != 1)
  {
    v16.receiver = self;
    v16.super_class = (Class)PXStoryViewModeBrowserToPlayerTransition;
    memcpy(v15, a3, sizeof(v15));
    -[PXStoryViewModeTransition alphaForClipWithInfo:proposedAlpha:inViewMode:layout:](&v16, sel_alphaForClipWithInfo_proposedAlpha_inViewMode_layout_, v15, a5, v10, a4);
    a4 = v13;
  }

  return a4;
}

void __124__PXStoryViewModeBrowserToPlayerTransition_initWithDestinationTimelineLayoutSnapshot_assetReference_trackingClipIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (a2 >= 1)
  {
    v29 = v14;
    v30 = v13;
    v31 = v12;
    v32 = v11;
    v33 = v10;
    v34 = v9;
    v35 = v8;
    v36 = v7;
    v37 = v6;
    v38 = v5;
    v39 = v15;
    v40 = v16;
    v18 = a2;
    v20 = (double *)(a4 + 16);
    do
    {
      v21 = *a5;
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", *a5, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);
      v22 = *(v20 - 2);
      v23 = *(v20 - 1);
      v24 = *v20;
      v25 = v20[1];
      v20 += 4;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

      a5 += 96;
      --v18;
    }
    while (v18);
  }
}

@end
