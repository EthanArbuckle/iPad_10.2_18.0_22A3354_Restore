@implementation PXStoryTimelineVisualDiagnosticsProvider

- (PXStoryTimelineVisualDiagnosticsProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineVisualDiagnosticsProvider.m"), 85, CFSTR("%s is not available as initializer"), "-[PXStoryTimelineVisualDiagnosticsProvider init]");

  abort();
}

- (PXStoryTimelineVisualDiagnosticsProvider)initWithModel:(id)a3 screenScale:(double)a4
{
  id v7;
  PXStoryTimelineVisualDiagnosticsProvider *v8;
  PXStoryTimelineVisualDiagnosticsProvider *v9;
  double v10;
  uint64_t v11;
  PXStoryTimeline *timeline;
  uint64_t v13;
  PXStoryConfiguration *configuration;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PXStoryAutoEditMomentsProvider *momentsProvider;
  void *v20;
  void *v21;
  uint64_t v22;
  PXStoryResourcesDataSource *resourcesDataSource;
  PXStoryVisualDiagnosticsProviderHelper *v24;
  PXStoryVisualDiagnosticsProviderHelper *helper;
  objc_super v27;

  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXStoryTimelineVisualDiagnosticsProvider;
  v8 = -[PXStoryTimelineVisualDiagnosticsProvider init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    v10 = 1.0;
    if (a4 >= 1.0)
      v10 = a4;
    v9->_screenScale = v10;
    -[PXStoryModel timeline](v9->_model, "timeline");
    v11 = objc_claimAutoreleasedReturnValue();
    timeline = v9->_timeline;
    v9->_timeline = (PXStoryTimeline *)v11;

    -[PXStoryModel configuration](v9->_model, "configuration");
    v13 = objc_claimAutoreleasedReturnValue();
    configuration = v9->_configuration;
    v9->_configuration = (PXStoryConfiguration *)v13;

    -[PXStoryModel timelineManager](v9->_model, "timelineManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resourcesDataSourceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recipeManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "diagnosticsMomentsProvider");
    v18 = objc_claimAutoreleasedReturnValue();
    momentsProvider = v9->_momentsProvider;
    v9->_momentsProvider = (PXStoryAutoEditMomentsProvider *)v18;

    -[PXStoryModel timelineManager](v9->_model, "timelineManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resourcesDataSourceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dataSource");
    v22 = objc_claimAutoreleasedReturnValue();
    resourcesDataSource = v9->_resourcesDataSource;
    v9->_resourcesDataSource = (PXStoryResourcesDataSource *)v22;

    v24 = -[PXStoryVisualDiagnosticsProviderHelper initWithConfiguration:]([PXStoryVisualDiagnosticsProviderHelper alloc], "initWithConfiguration:", v9->_configuration);
    helper = v9->_helper;
    v9->_helper = v24;

  }
  return v9;
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  -[PXStoryTimelineVisualDiagnosticsProvider _addCoverPage:](self, "_addCoverPage:", v6);
  -[PXStoryTimelineVisualDiagnosticsProvider _addSegmentDiagnostics:](self, "_addSegmentDiagnostics:", v6);
  -[PXStoryTimelineVisualDiagnosticsProvider _addCinematicDiagnostics:](self, "_addCinematicDiagnostics:", v6);
  -[PXStoryTimelineVisualDiagnosticsProvider _addSegmentsDetailsTable:](self, "_addSegmentsDetailsTable:", v6);
  -[PXStoryTimelineVisualDiagnosticsProvider _addSegmentsAutoEditDebugInfoTables:debugInfoKeys:](self, "_addSegmentsAutoEditDebugInfoTables:debugInfoKeys:", v6, &unk_1E53E9078);
  -[PXStoryTimelineVisualDiagnosticsProvider _addCropDiagnostics:](self, "_addCropDiagnostics:", v6);
  -[PXStoryTimelineVisualDiagnosticsProvider _addDetailedSaliencyDiagnostics:](self, "_addDetailedSaliencyDiagnostics:", v6);
  -[PXStoryTimelineVisualDiagnosticsProvider _addMiscellaneousDiagnostics:](self, "_addMiscellaneousDiagnostics:", v6);

  v7[2](v7, 1, 0);
}

- (void)_addCoverPage:(id)a3
{
  objc_msgSend(a3, "addTitlePageWithTitle:subtitle:", CFSTR("Visual Diagnostics"), CFSTR("Interactive Memory Player"));
}

- (void)_addSegmentDiagnostics:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  double height;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  void *v40;
  Float64 Seconds;
  Float64 v42;
  void *v43;
  double MinX;
  double MaxY;
  double v46;
  uint64_t v47;
  id v48;
  id v49;
  int v50;
  __CFString *v51;
  __CFString *v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  double MaxX;
  double MinY;
  double v60;
  uint64_t v61;
  void *v62;
  __CFString *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  PXStoryTimelineVisualDiagnosticsProvider *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  _QWORD v75[4];
  __CFString *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  __int128 v94;
  _OWORD v95[2];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[15];
  CMTime time;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v4 = a3;
  objc_msgSend(v4, "addTitlePageWithTitle:subtitle:", CFSTR("Timeline"), CFSTR("Segments & Transitions"));
  PXEdgeInsetsMake();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "beginPage");
  objc_msgSend(v4, "currentPageBounds");
  v108 = CGRectInset(v107, 10.0, 10.0);
  width = v108.size.width;
  height = v108.size.height;
  -[PXStoryTimelineVisualDiagnosticsProvider timeline](self, "timeline", v108.origin.x, v108.origin.y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(v15, "numberOfSegments");
  v21 = v20;
  v22 = floor((height + 10.0) / (v10 + v6 + ((width + 0.0) / 3.0 - v8 - v12) / v17 * v19 + 10.0));
  if (v22 < 1.0)
    v22 = 1.0;
  v23 = (uint64_t)v22;
  v74 = v10;
  v24 = floor((width + 0.0) / (v12 + v8 + ((height + 10.0) * 0.5 + -10.0 - v6 - v10) / v19 * v17 + 0.0));
  if (v24 < 1.0)
    v24 = 1.0;
  if (v23 == 1)
    v25 = (uint64_t)v24;
  else
    v25 = 3;
  if (v23 == 1)
    v23 = 2;
  v65 = v23;
  v26 = (v20 + v23 * v25 - 1) / (v23 * v25);
  -[PXStoryTimelineVisualDiagnosticsProvider _momentEndSegmentIndexesInTimeline:](self, "_momentEndSegmentIndexesInTimeline:", v15);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineVisualDiagnosticsProvider _moduleStartSegmentIndexesInTimeline:](self, "_moduleStartSegmentIndexesInTimeline:", v15);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineVisualDiagnosticsProvider _segmentIndexesWithInvalidOrderOutTransitionInTimeline:](self, "_segmentIndexesWithInvalidOrderOutTransitionInTimeline:", v15);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 >= 1)
  {
    v27 = 0;
    v28 = 0;
    v69 = v25;
    v70 = v21;
    v68 = self;
    v67 = v12;
    while (1)
    {
      if (v27)
      {
        objc_msgSend(v4, "endPage");
        objc_msgSend(v4, "beginPage");
      }
      if (v65 >= 1)
        break;
LABEL_41:
      if (++v27 == v26)
        goto LABEL_42;
    }
    v66 = 0;
    v64 = v27;
    while (v25 < 1)
    {
LABEL_40:
      ++v66;
      v27 = v64;
      if (v66 == v65)
        goto LABEL_41;
    }
    v29 = 0;
    while (v28 >= v21)
    {
LABEL_39:
      if (v25 == ++v29)
        goto LABEL_40;
    }
    v30 = objc_msgSend(v15, "identifierForSegmentAtIndex:", v28);
    PXEdgeInsetsInsetRect();
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[PXStoryTimelineVisualDiagnosticsProvider _drawSegmentAtIndex:timeline:inRect:options:context:](self, "_drawSegmentAtIndex:timeline:inRect:options:context:", v28, v15, 7, v4);
    v104 = 0u;
    memset(v105, 0, sizeof(v105));
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    if (v15)
      objc_msgSend(v15, "infoForSegmentWithIdentifier:", v30);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%li"), v28);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = *(_OWORD *)&v105[9];
    v98 = *(_OWORD *)&v105[11];
    v99 = *(_OWORD *)&v105[13];
    v94 = *(_OWORD *)&v105[1];
    v95[0] = *(_OWORD *)&v105[3];
    v95[1] = *(_OWORD *)&v105[5];
    v96 = *(_OWORD *)&v105[7];
    v40 = (void *)MEMORY[0x1E0CB3940];
    *(_OWORD *)&time.value = *(_OWORD *)((char *)v95 + 8);
    time.epoch = v105[6];
    Seconds = CMTimeGetSeconds(&time);
    *(_OWORD *)&time.value = v94;
    time.epoch = *(_QWORD *)&v95[0];
    v42 = CMTimeGetSeconds(&time);
    *(_OWORD *)&time.value = v96;
    time.epoch = v97;
    objc_msgSend(v40, "stringWithFormat:", CFSTR("%0.1f s\n(min: %0.1f / max: %0.1f)"), *(_QWORD *)&Seconds, *(_QWORD *)&v42, CMTimeGetSeconds(&time));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v109.origin.x = v32;
    v109.origin.y = v34;
    v109.size.width = v36;
    v109.size.height = v38;
    MinX = CGRectGetMinX(v109);
    v110.origin.x = v32;
    v110.origin.y = v34;
    v110.size.width = v36;
    v110.size.height = v38;
    MaxY = CGRectGetMaxY(v110);
    v111.origin.x = v32;
    v111.origin.y = v34;
    v111.size.width = v36;
    v111.size.height = v38;
    v46 = CGRectGetWidth(v111);
    v47 = MEMORY[0x1E0C809B0];
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke;
    v92[3] = &unk_1E512C9F0;
    v93 = v39;
    v48 = v39;
    objc_msgSend(v4, "drawTextInRect:configuration:", v92, MinX, MaxY, v46, v74);
    v90[0] = v47;
    v90[1] = 3221225472;
    v90[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke_2;
    v90[3] = &unk_1E512C9F0;
    v91 = v43;
    v49 = v43;
    objc_msgSend(v4, "drawTextInRect:configuration:", v90, MinX, MaxY, v46, v74);

    if (v15)
    {
      objc_msgSend(v15, "infoForSegmentWithIdentifier:", v30);
      v50 = v80;
      v51 = CFSTR("??");
      if (v80 > 0xAu)
      {
LABEL_26:
        v52 = v51;
        if (objc_msgSend(v71, "containsIndex:", v28))
        {
          v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("⚠️(%@)"), v52);

          v52 = (__CFString *)v53;
        }
        v54 = objc_msgSend(v73, "containsIndex:", v28++);
        v55 = objc_msgSend(v72, "containsIndex:", v28);
        if (v54)
        {
          -[__CFString stringByAppendingString:](v52, "stringByAppendingString:", CFSTR(" (moment boundary)"));
          v56 = objc_claimAutoreleasedReturnValue();

          v52 = (__CFString *)v56;
        }
        if (v55)
        {
          -[__CFString stringByAppendingString:](v52, "stringByAppendingString:", CFSTR(" (module boundary)"));
          v57 = objc_claimAutoreleasedReturnValue();

          v52 = (__CFString *)v57;
        }
        v112.origin.x = v32;
        v112.origin.y = v34;
        v112.size.width = v36;
        v112.size.height = v38;
        MaxX = CGRectGetMaxX(v112);
        v113.origin.x = v32;
        v113.origin.y = v34;
        v113.size.width = v36;
        v113.size.height = v38;
        MinY = CGRectGetMinY(v113);
        v114.origin.x = v32;
        v114.origin.y = v34;
        v114.size.width = v36;
        v114.size.height = v38;
        v60 = CGRectGetHeight(v114);
        if (v54)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
          v61 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v55)
          {
            v62 = 0;
            goto LABEL_38;
          }
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.96, 0.92, 1.0);
          v61 = objc_claimAutoreleasedReturnValue();
        }
        v62 = (void *)v61;
LABEL_38:
        self = v68;
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke_3;
        v75[3] = &unk_1E512C9F0;
        v76 = v52;
        v63 = v52;
        -[PXStoryTimelineVisualDiagnosticsProvider _drawVerticalInRect:backgroundColor:context:configuration:](v68, "_drawVerticalInRect:backgroundColor:context:configuration:", v62, v4, v75, MaxX, MinY, v67, v60);

        v25 = v69;
        v21 = v70;
        goto LABEL_39;
      }
    }
    else
    {
      v50 = 0;
      v89 = 0;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
    }
    v51 = off_1E5136018[v50];
    goto LABEL_26;
  }
LABEL_42:
  objc_msgSend(v4, "endPage");

}

- (void)_addCinematicDiagnostics:(id)a3
{
  id v4;
  void *v5;
  uint64_t AspectRatio;
  double v7;
  double v8;
  __int128 v9;
  uint64_t v10;
  id v11;
  void *v17;
  id v18;
  void (**v19)(_QWORD);
  _QWORD *v20;
  CGContext *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double x;
  double y;
  double width;
  double height;
  const CGPath *v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void (*v37)(_QWORD *, double);
  int v38;
  int v39;
  int v40;
  const __CFString *v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  const CGPath *v48;
  id v49;
  void *v50;
  void *v51;
  void (**v52)(void);
  void *v53;
  void *v54;
  void *v55;
  PXStoryTimelineVisualDiagnosticsProvider *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  double v64;
  double (**v65)(double, double);
  const __CFString *v66;
  _QWORD v67[4];
  id v68;
  uint64_t v69;
  char v70;
  _QWORD v71[4];
  __CFString *v72;
  CGRect slice;
  _QWORD v74[5];
  CGRect remainder;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  CGContext *v87;
  CGRect v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  _QWORD v103[5];
  _QWORD v104[4];
  id v105;
  _QWORD *v106;
  _QWORD *v107;
  double v108;
  _QWORD v109[4];
  void (**v110)(void);
  id v111;
  _QWORD *v112;
  _QWORD v113[4];
  id v114;
  _QWORD *v115;
  _QWORD aBlock[4];
  id v117;
  _QWORD *v118;
  _QWORD *v119;
  __int128 v120;
  _QWORD v121[6];
  _QWORD v122[4];
  __int128 v123;
  __int128 v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;

  v4 = a3;
  v56 = self;
  -[PXStoryTimelineVisualDiagnosticsProvider timeline](self, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  AspectRatio = PXSizeGetAspectRatio();
  v61 = MEMORY[0x1A85CD654](AspectRatio);
  v122[0] = 0;
  v122[1] = v122;
  v64 = v7;
  v8 = v7 + 20.0;
  v122[2] = 0x4010000000;
  v122[3] = &unk_1A7E74EE7;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v123 = *MEMORY[0x1E0C9D628];
  v124 = v9;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x3010000000;
  v121[5] = 0;
  v121[3] = &unk_1A7E74EE7;
  v121[4] = 0;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke;
  aBlock[3] = &unk_1E5120208;
  v11 = v4;
  v117 = v11;
  v118 = v122;
  __asm { FMOV            V0.2D, #10.0 }
  v120 = _Q0;
  v119 = v121;
  v17 = _Block_copy(aBlock);
  v113[0] = v10;
  v113[1] = 3221225472;
  v113[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_2;
  v113[3] = &unk_1E5148AA8;
  v18 = v11;
  v114 = v18;
  v115 = v122;
  v109[0] = v10;
  v109[1] = 3221225472;
  v109[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_3;
  v109[3] = &unk_1E513DDF0;
  v112 = v122;
  v52 = _Block_copy(v113);
  v110 = v52;
  v19 = v17;
  v111 = v19;
  v104[0] = v10;
  v104[1] = 3221225472;
  v104[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_4;
  v104[3] = &unk_1E5120230;
  v106 = v121;
  v107 = v122;
  v108 = v8;
  v50 = _Block_copy(v109);
  v105 = v50;
  v65 = (double (**)(double, double))_Block_copy(v104);
  v103[0] = v10;
  v103[1] = 3221225472;
  v103[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_5;
  v103[3] = &unk_1E5143A58;
  v103[4] = v121;
  v20 = _Block_copy(v103);
  v51 = v19;
  v19[2](v19);
  v62 = v18;
  v21 = (CGContext *)objc_msgSend(v18, "CGContext");
  v63 = objc_msgSend(v5, "numberOfSegments");
  objc_msgSend(v5, "size");
  PXRectWithOriginAndSize();
  v59 = v23;
  v60 = v22;
  v57 = v25;
  v58 = v24;
  -[PXStoryTimelineVisualDiagnosticsProvider _momentEndSegmentIndexesInTimeline:](v56, "_momentEndSegmentIndexesInTimeline:", v5);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineVisualDiagnosticsProvider _moduleStartSegmentIndexesInTimeline:](v56, "_moduleStartSegmentIndexesInTimeline:", v5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineVisualDiagnosticsProvider _segmentIndexesWithInvalidOrderOutTransitionInTimeline:](v56, "_segmentIndexesWithInvalidOrderOutTransitionInTimeline:", v5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63 >= 1)
  {
    v26 = 0;
    do
    {
      CGContextSaveGState(v21);
      v102 = 0;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v27 = objc_msgSend(v5, "identifierForSegmentAtIndex:", v26);
      if (v5)
      {
        objc_msgSend(v5, "infoForSegmentWithIdentifier:", v27);
      }
      else
      {
        v102 = 0;
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
      }
      v125.origin.x = v65[2](v61, v64);
      x = v125.origin.x;
      y = v125.origin.y;
      width = v125.size.width;
      height = v125.size.height;
      v32 = CGPathCreateWithRoundedRect(v125, 3.0, 3.0, 0);
      CGContextAddPath(v21, v32);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(v21, (CGColorRef)objc_msgSend(v33, "CGColor"));

      CGContextFillPath(v21);
      CGPathRelease(v32);
      CGContextClip(v21);
      v34 = objc_msgSend(v5, "identifierForSegmentAtIndex:", v26);
      v89 = 0u;
      memset(&v88, 0, sizeof(v88));
      if (v5)
        objc_msgSend(v5, "timeRangeForSegmentWithIdentifier:", v34);
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_6;
      v77[3] = &unk_1E5120280;
      v79 = v60;
      v80 = v59;
      v81 = v58;
      v82 = v57;
      v83 = x;
      v84 = y;
      v85 = width;
      v86 = height;
      v87 = v21;
      v35 = v62;
      v78 = v35;
      remainder = v88;
      v76 = v89;
      objc_msgSend(v5, "enumerateClipsInTimeRange:rect:usingBlock:", &remainder, v77, v60, v59, v58, v57);
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_8;
      v74[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
      v74[4] = v26;
      objc_msgSend(v35, "drawTextInRect:configuration:", v74, x, y, width, height);
      CGContextRestoreGState(v21);
      v36 = v93;
      v37 = (void (*)(_QWORD *, double))v20[2];
      if (v93 > 1u)
      {
        v38 = SBYTE13(v94);
        v37(v20, 2.0);
        v39 = objc_msgSend(v55, "containsIndex:", v26);
        v40 = objc_msgSend(v54, "containsIndex:", v26 + 1);
        if (v36 > 0xA)
        {
LABEL_25:
          v66 = 0;
          LOBYTE(v38) = 1;
        }
        else
        {
          switch(v36)
          {
            case 5:
              switch(v38)
              {
                case 0:
                  LOBYTE(v38) = 0;
                  goto LABEL_20;
                case 1:
                  LOBYTE(v38) = 0;
                  v41 = CFSTR("arrow.left");
                  goto LABEL_35;
                case 2:
                  LOBYTE(v38) = 0;
                  v41 = CFSTR("arrow.right");
                  goto LABEL_35;
                case 3:
                  LOBYTE(v38) = 0;
                  v41 = CFSTR("arrow.up");
                  goto LABEL_35;
                case 4:
                  LOBYTE(v38) = 0;
                  v41 = CFSTR("arrow.down");
                  goto LABEL_35;
                default:
                  goto LABEL_25;
              }
            case 6:
            case 9:
              if (v38 == 2)
              {
                LOBYTE(v38) = 0;
                v41 = CFSTR("arrow.down.right.and.arrow.up.left");
              }
              else
              {
                if (v38 != 1)
                  goto LABEL_19;
                LOBYTE(v38) = 0;
                v41 = CFSTR("arrow.up.backward.and.arrow.down.forward");
              }
              goto LABEL_35;
            case 7:
              if (v38 == 2)
              {
                LOBYTE(v38) = 0;
                v41 = CFSTR("arrow.counterclockwise");
              }
              else if (v38 == 1)
              {
                LOBYTE(v38) = 0;
                v41 = CFSTR("arrow.clockwise");
              }
              else
              {
LABEL_19:
                if (v38)
                  goto LABEL_25;
LABEL_20:
                v41 = CFSTR("exclamationmark.triangle");
              }
              goto LABEL_35;
            case 8:
              if (v38 == 2)
              {
                LOBYTE(v38) = 0;
                v41 = CFSTR("arrow.up.arrow.down");
              }
              else if (v38 == 1)
              {
                LOBYTE(v38) = 0;
                v41 = CFSTR("arrow.left.and.right");
              }
              else
              {
                if (v38)
                  goto LABEL_25;
                v41 = CFSTR("questionmark.circle");
              }
LABEL_35:
              v66 = v41;
              break;
            default:
              goto LABEL_25;
          }
        }
        if (v39)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.96, 0.92, 1.0);
            v43 = objc_claimAutoreleasedReturnValue();

            v42 = (void *)v43;
          }
        }
        v126.origin.x = v65[2](20.0, v64);
        v44 = v126.origin.x;
        v45 = v126.origin.y;
        v46 = v126.size.width;
        v47 = v126.size.height;
        v48 = CGPathCreateWithRoundedRect(v126, 3.0, 3.0, 0);
        CGContextAddPath(v21, v48);
        v49 = objc_retainAutorelease(v42);
        CGContextSetFillColorWithColor(v21, (CGColorRef)objc_msgSend(v49, "CGColor"));
        CGContextFillPath(v21);
        CGPathRelease(v48);
        remainder.origin.x = v44;
        remainder.origin.y = v45;
        remainder.size.width = v46;
        remainder.size.height = v47;
        if ((v38 & 1) == 0)
        {
          memset(&slice, 0, sizeof(slice));
          v127.origin.x = v44;
          v127.origin.y = v45;
          v127.size.width = v46;
          v127.size.height = v47;
          CGRectDivide(v127, &slice, &remainder, v46, CGRectMinYEdge);
          v71[0] = MEMORY[0x1E0C809B0];
          v71[1] = 3221225472;
          v71[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_9;
          v71[3] = &unk_1E5120258;
          v72 = (__CFString *)v66;
          objc_msgSend(v35, "drawImageInRect:configuration:", v71, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

          v44 = remainder.origin.x;
          v45 = remainder.origin.y;
          v46 = remainder.size.width;
          v47 = remainder.size.height;
        }
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_10;
        v67[3] = &unk_1E51202C8;
        v70 = v36;
        v68 = v53;
        v69 = v26;
        -[PXStoryTimelineVisualDiagnosticsProvider _drawVerticalInRect:backgroundColor:context:configuration:](v56, "_drawVerticalInRect:backgroundColor:context:configuration:", 0, v35, v67, v44, v45, v46, v47);
        ((void (*)(_QWORD *, double))v20[2])(v20, 2.0);

        ++v26;
      }
      else
      {
        v37(v20, 2.0);
        ++v26;
      }

    }
    while (v26 != v63);
  }
  v52[2]();

  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v122, 8);

}

- (void)_addSegmentsDetailsTable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  __CFString *v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD v13[4];
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;

  v4 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_2;
  v13[3] = &unk_1E51203F0;
  v14 = CFSTR("Segment");
  v15 = CFSTR("Duration");
  v16 = CFSTR("Movement");
  v17 = CFSTR("Transition");
  v18 = CFSTR("MomentBoundary");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_8;
  v6[3] = &unk_1E5120490;
  v6[4] = self;
  v7 = CFSTR("Segment");
  v8 = v4;
  v9 = CFSTR("Duration");
  v10 = CFSTR("Movement");
  v11 = CFSTR("Transition");
  v12 = CFSTR("MomentBoundary");
  v5 = v4;
  objc_msgSend(v5, "addPagesForTableWithConfiguration:columnsConfiguration:rowsConfiguration:", &__block_literal_global_69299, v13, v6);

}

- (unint64_t)_approxLinesInString:(id)a3 lineLength:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "length") / a4 + 1;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_addSegmentsAutoEditDebugInfoTables:(id)a3 debugInfoKeys:(id)a4
{
  id v6;
  PXStoryTimelineVisualDiagnosticsProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  __CFString *v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  __CFString *v30;
  uint64_t v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  -[PXStoryTimelineVisualDiagnosticsProvider timeline](self, "timeline");
  v7 = self;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineVisualDiagnosticsProvider _autoEditDebugInfoBySegmentInTimeline:](self, "_autoEditDebugInfoBySegmentInTimeline:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v9;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v17);
        if (!v6 || objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v17)))
        {
          v31 = v18;
          v32[0] = v16;
          v32[1] = 3221225472;
          v32[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke;
          v32[3] = &unk_1E51204B8;
          v32[4] = v18;
          v29[0] = v16;
          v29[1] = 3221225472;
          v29[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_2;
          v29[3] = &unk_1E5120528;
          v30 = CFSTR("Segment");
          v24[0] = v16;
          v24[1] = 3221225472;
          v24[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_5;
          v24[3] = &unk_1E5120578;
          v24[4] = v7;
          v25 = CFSTR("Segment");
          v19 = v23;
          v26 = v19;
          v27 = v22;
          v28 = v18;
          objc_msgSend(v19, "addPagesForTableWithConfiguration:columnsConfiguration:rowsConfiguration:", v32, v29, v24);

        }
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

}

- (void)_addAssetsDetailsTable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  __CFString *v7;
  id v8;
  __CFString *v9;
  _QWORD v10[4];
  __CFString *v11;
  __CFString *v12;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_2;
  v10[3] = &unk_1E5120528;
  v11 = CFSTR("Assets");
  v12 = CFSTR("Distance");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_5;
  v6[3] = &unk_1E5120678;
  v6[4] = self;
  v7 = CFSTR("Assets");
  v8 = v4;
  v9 = CFSTR("Distance");
  v5 = v4;
  objc_msgSend(v5, "addPagesForTableWithConfiguration:columnsConfiguration:rowsConfiguration:", &__block_literal_global_249_69270, v10, v6);

}

- (id)_descriptionForDurationInfo:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  var1 = a3->var1;
  PXStoryTimeDescription((CMTime *)&var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a3->var0;
  PXStoryTimeDescription((CMTime *)&var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a3->var2;
  PXStoryTimeDescription((CMTime *)&var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ (%@ - %@)"), v5, v6, v7);

  return v8;
}

- (id)_movementDescriptionForSegmentAtIndex:(int64_t)a3 inTimeline:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v26;
  id v27;
  PXStoryTimelineVisualDiagnosticsProvider *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v6, "identifierForSegmentAtIndex:", a3);
  if (v6)
  {
    objc_msgSend(v6, "timeRangeForSegmentWithIdentifier:", v8);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
  }
  objc_msgSend(v6, "size");
  PXRectWithOriginAndSize();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __93__PXStoryTimelineVisualDiagnosticsProvider__movementDescriptionForSegmentAtIndex_inTimeline___block_invoke;
  v26 = &unk_1E512D058;
  v27 = v7;
  v28 = self;
  v20 = v29;
  v21 = v30;
  v22 = v31;
  v17 = v7;
  objc_msgSend(v6, "enumerateClipsInTimeRange:rect:usingBlock:", &v20, &v23, v10, v12, v14, v16);
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" / "), v20, v21, v22, v23, v24, v25, v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_descriptionForMovementType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD)
    return CFSTR("??");
  else
    return off_1E51208F0[a3];
}

- (id)_momentEndSegmentIndexesInTimeline:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  PXStoryTimelineVisualDiagnosticsProvider *v18;
  id v19;
  id v20;
  SEL v21;
  _OWORD v22[3];
  _QWORD v23[4];
  id v24;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXStoryTimelineVisualDiagnosticsProvider momentsProvider](self, "momentsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke;
  v23[3] = &unk_1E51389A8;
  v9 = v6;
  v24 = v9;
  objc_msgSend(v7, "enumerateMomentsUsingBlock:", v23);

  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(v22, 0, sizeof(v22));
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke_2;
  v16[3] = &unk_1E51206C8;
  v20 = v10;
  v21 = a2;
  v17 = v5;
  v18 = self;
  v19 = v9;
  v11 = v10;
  v12 = v9;
  v13 = v5;
  objc_msgSend(v13, "enumerateSegmentsInTimeRange:usingBlock:", v22, v16);
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

- (id)_moduleDescriptionsBySegmentInTimeline:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  PXStoryTimelineVisualDiagnosticsProvider *v16;
  id v17;
  id v18;
  SEL v19;
  _OWORD v20[3];

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXStoryTimelineVisualDiagnosticsProvider model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "autoEditDecisionList");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      if (v5)
        objc_msgSend(v5, "timeRange");
      else
        memset(v20, 0, sizeof(v20));
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __83__PXStoryTimelineVisualDiagnosticsProvider__moduleDescriptionsBySegmentInTimeline___block_invoke;
      v14[3] = &unk_1E51206C8;
      v15 = v5;
      v16 = self;
      v19 = a2;
      v17 = v10;
      v18 = v6;
      v11 = v10;
      objc_msgSend(v15, "enumerateSegmentsInTimeRange:usingBlock:", v20, v14);

    }
  }
  v12 = (void *)objc_msgSend(v6, "copy");

  return v12;
}

- (id)_autoEditDebugInfoBySegmentInTimeline:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  PXStoryTimelineVisualDiagnosticsProvider *v16;
  id v17;
  id v18;
  SEL v19;
  _OWORD v20[3];

  v5 = a3;
  v6 = (void *)objc_opt_new();
  -[PXStoryTimelineVisualDiagnosticsProvider model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "autoEditDecisionList");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      if (v5)
        objc_msgSend(v5, "timeRange");
      else
        memset(v20, 0, sizeof(v20));
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __82__PXStoryTimelineVisualDiagnosticsProvider__autoEditDebugInfoBySegmentInTimeline___block_invoke;
      v14[3] = &unk_1E51206C8;
      v15 = v5;
      v16 = self;
      v19 = a2;
      v17 = v10;
      v18 = v6;
      v11 = v10;
      objc_msgSend(v15, "enumerateSegmentsInTimeRange:usingBlock:", v20, v14);

    }
  }
  v12 = (void *)objc_msgSend(v6, "copy");

  return v12;
}

- (id)_moduleStartSegmentIndexesInTimeline:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  PXStoryTimelineVisualDiagnosticsProvider *v16;
  id v17;
  id v18;
  SEL v19;
  _OWORD v20[3];

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXStoryTimelineVisualDiagnosticsProvider model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "autoEditDecisionList");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      if (v5)
        objc_msgSend(v5, "timeRange");
      else
        memset(v20, 0, sizeof(v20));
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __81__PXStoryTimelineVisualDiagnosticsProvider__moduleStartSegmentIndexesInTimeline___block_invoke;
      v14[3] = &unk_1E51206C8;
      v15 = v5;
      v16 = self;
      v19 = a2;
      v17 = v10;
      v18 = v6;
      v11 = v10;
      objc_msgSend(v15, "enumerateSegmentsInTimeRange:usingBlock:", v20, v14);

    }
  }
  v12 = (void *)objc_msgSend(v6, "copy");

  return v12;
}

- (id)_segmentIndexesWithInvalidOrderOutTransitionInTimeline:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t *);
  void *v12;
  id v13;
  id v14;
  _OWORD v15[3];

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (v3)
    objc_msgSend(v3, "timeRange");
  else
    memset(v15, 0, sizeof(v15));
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __99__PXStoryTimelineVisualDiagnosticsProvider__segmentIndexesWithInvalidOrderOutTransitionInTimeline___block_invoke;
  v12 = &unk_1E512EDE0;
  v13 = v3;
  v14 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v6, "enumerateSegmentsInTimeRange:usingBlock:", v15, &v9);
  v7 = (void *)objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

- (void)_addCropDiagnostics:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  id v37;
  id v38;
  PXStoryDefaultDisplayAssetCroppingContext *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  PXStoryDefaultDisplayAssetCroppingContext *v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  PXStoryTimelineVisualDiagnosticsProvider *v52;
  id v53;
  id v54;
  id v55;
  PXStoryDefaultDisplayAssetCroppingContext *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  SEL v61;
  char v62;
  _OWORD v63[3];
  _QWORD v64[4];
  id v65;
  PXStoryTimelineVisualDiagnosticsProvider *v66;
  id v67;
  uint64_t *v68;
  SEL v69;
  _OWORD v70[3];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;

  v49 = a3;
  objc_msgSend(v49, "addTitlePageWithTitle:subtitle:", CFSTR("Timeline"), CFSTR("Crops"));
  -[PXStoryTimelineVisualDiagnosticsProvider helper](self, "helper");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineVisualDiagnosticsProvider timeline](self, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineVisualDiagnosticsProvider resourcesDataSource](self, "resourcesDataSource");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(v6, "setTimeStyle:", 2);
  objc_msgSend(v6, "setDateStyle:", 1);
  -[PXStoryTimelineVisualDiagnosticsProvider configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetCollection");
  v9 = objc_claimAutoreleasedReturnValue();

  v46 = -[PXStoryDefaultDisplayAssetCroppingContext initWithAssetCollection:detailedSaliency:]([PXStoryDefaultDisplayAssetCroppingContext alloc], "initWithAssetCollection:detailedSaliency:", v9, 0);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "showTVPreviewInDiagnostics");

  v12 = 0;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXStoryTimelineVisualDiagnosticsProvider _tvPreviewRankByAssetUUIDForMemory:](self, "_tvPreviewRankByAssetUUIDForMemory:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  v45 = (void *)v12;
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__69121;
  v75 = __Block_byref_object_dispose__69122;
  v76 = 0;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(v70, 0, sizeof(v70));
  objc_msgSend(v5, "size");
  PXRectWithOriginAndSize();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke;
  v64[3] = &unk_1E51206A0;
  v23 = v5;
  v69 = a2;
  v65 = v23;
  v66 = self;
  v24 = v13;
  v67 = v24;
  v68 = &v71;
  objc_msgSend(v23, "enumerateClipsInTimeRange:rect:usingBlock:", v70, v64, v15, v17, v19, v21);
  v44 = (void *)v9;
  objc_msgSend((id)v72[5], "cloudIdentifierMappingsForLocalIdentifiers:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v72[5], "photoAnalysisClient");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v23, "timeRange");
  else
    memset(v63, 0, sizeof(v63));
  objc_msgSend(v23, "size");
  PXRectWithOriginAndSize();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v50[0] = v22;
  v50[1] = 3221225472;
  v50[2] = __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_2;
  v50[3] = &unk_1E5120740;
  v35 = v23;
  v61 = a2;
  v51 = v35;
  v52 = self;
  v36 = v47;
  v53 = v36;
  v37 = v49;
  v54 = v37;
  v38 = v48;
  v55 = v38;
  v62 = v11;
  v39 = v46;
  v56 = v39;
  v40 = v6;
  v57 = v40;
  v41 = v25;
  v58 = v41;
  v42 = v45;
  v59 = v42;
  v43 = v26;
  v60 = v43;
  objc_msgSend(v35, "enumerateClipsInTimeRange:rect:usingBlock:", v63, v50, v28, v30, v32, v34);

  _Block_object_dispose(&v71, 8);
}

- (void)_addDetailedSaliencyDiagnostics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void (**v23)(void *, void *, double, double, double, double);
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double x;
  double y;
  double width;
  double height;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  PXStoryTimelineVisualDiagnosticsProvider *v36;
  void *v37;
  char v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD aBlock[4];
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CGRect v51;
  CGRect remainder;
  CGRect slice;
  CGRect v54;

  v4 = a3;
  objc_msgSend(v4, "addTitlePageWithTitle:subtitle:", CFSTR("Assets"), CFSTR("Detailed Saliency"));
  v37 = v4;
  v35 = objc_msgSend(v4, "CGContext");
  v36 = self;
  -[PXStoryTimelineVisualDiagnosticsProvider resourcesDataSource](self, "resourcesDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailedSaliency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_respondsToSelector();
  if (objc_msgSend(v5, "numberOfDisplayAssetResources") >= 1)
  {
    v7 = 0;
    v34 = v6;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v5, "displayAssetResourceAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_storyResourceDisplayAsset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "saliencyAreasForDisplayAsset:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v38 & 1) != 0)
      {
        objc_msgSend(v6, "rawSaliencyAreasForDisplayAsset:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      if (objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
      {
        objc_msgSend(v37, "beginPage");
        memset(&slice, 0, sizeof(slice));
        objc_msgSend(v37, "currentPageBounds");
        slice = CGRectInset(v54, 10.0, 10.0);
        memset(&remainder, 0, sizeof(remainder));
        memset(&v51, 0, sizeof(v51));
        CGRectDivide(slice, &slice, &remainder, 40.0, CGRectMaxYEdge);
        CGRectDivide(slice, &v51, &slice, 30.0, CGRectMaxYEdge);
        objc_msgSend(v10, "aspectRatio");
        PXRectWithAspectRatioFittingRect();
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        -[PXStoryTimelineVisualDiagnosticsProvider _drawAsset:inRect:context:](v36, "_drawAsset:inRect:context:", v10, v37);
        aBlock[0] = v8;
        aBlock[1] = 3221225472;
        aBlock[2] = __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke;
        aBlock[3] = &unk_1E5120790;
        v46 = v14;
        v47 = v16;
        v48 = v18;
        v49 = v20;
        v50 = v35;
        v21 = v37;
        v45 = v21;
        v22 = _Block_copy(aBlock);
        v42[0] = v8;
        v42[1] = 3221225472;
        v42[2] = __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_3;
        v42[3] = &unk_1E51207B8;
        v43 = v22;
        v39 = v22;
        v23 = (void (**)(void *, void *, double, double, double, double))_Block_copy(v42);
        v23[2](v23, v12, 1.0, 1.0, 0.0, 1.0);
        v23[2](v23, v11, 1.0, 0.0, 0.0, 0.0);
        v24 = v12;
        v25 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v10, "uuid");
        v26 = v5;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendFormat:", CFSTR("UUID: %@\n"), v27);

        v40[0] = v8;
        v40[1] = 3221225472;
        v40[2] = __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_4;
        v40[3] = &unk_1E512C9F0;
        v41 = v25;
        x = v51.origin.x;
        y = v51.origin.y;
        width = v51.size.width;
        height = v51.size.height;
        v32 = v25;
        v12 = v24;
        v33 = v32;
        objc_msgSend(v21, "drawTextInRect:configuration:", v40, x, y, width, height);
        objc_msgSend(v21, "endPage");

        v5 = v26;
        v6 = v34;

      }
      ++v7;
    }
    while (v7 < objc_msgSend(v5, "numberOfDisplayAssetResources"));
  }

}

- (void)_addMiscellaneousDiagnostics:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  _QWORD v10[5];
  id v11;
  CGRect v12;
  CGRect v13;

  v4 = a3;
  objc_msgSend(v4, "addTitlePageWithTitle:subtitle:", CFSTR("Timeline"), CFSTR("Miscellaneous"));
  objc_msgSend(v4, "beginPage");
  objc_msgSend(v4, "currentPageBounds");
  v13 = CGRectInset(v12, 20.0, 20.0);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PXStoryTimelineVisualDiagnosticsProvider__addMiscellaneousDiagnostics___block_invoke;
  v10[3] = &unk_1E51207E0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v9, "drawTextInRect:configuration:", v10, x, y, width, height);
  objc_msgSend(v9, "endPage");

}

- (id)_descriptionForFaces:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
LABEL_15:

      if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_19;
    }
    v10 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v9, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchPersonWithFace:options:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (!objc_msgSend(v6, "isPrivateDataAllowed")
        || (objc_msgSend(v14, "name"), (v15 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0)
        && (objc_msgSend(v14, "displayName"), (v15 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v14, "localIdentifier");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (!-[__CFString length](v15, "length"))
      {

        v15 = CFSTR("<unnamed>");
        if (!v8)
          goto LABEL_14;
        goto LABEL_13;
      }
    }
    else
    {
      v15 = CFSTR("?");
    }
    if (!v8)
    {
LABEL_14:
      objc_msgSend(v7, "appendFormat:", CFSTR("%li: %@"), v8, v15);

      goto LABEL_15;
    }
LABEL_13:
    objc_msgSend(v7, "appendString:", CFSTR(", "));
    goto LABEL_14;
  }
LABEL_19:
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

- (void)_drawSegmentAtIndex:(int64_t)a3 timeline:(id)a4 inRect:(CGRect)a5 options:(unint64_t)a6 context:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  CGContext *v15;
  double v16;
  const CGPath *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  CGFloat y;
  double v34;
  CGFloat width;
  double v36;
  CGFloat height;
  double v38;
  double x;
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  _OWORD v44[3];
  _QWORD v45[4];
  id v46;
  PXStoryTimelineVisualDiagnosticsProvider *v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  SEL v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGContext *v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  CGRect v78;

  width = a5.size.width;
  height = a5.size.height;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4;
  v13 = a7;
  v14 = objc_msgSend(v12, "identifierForSegmentAtIndex:", a3);
  v76 = 0u;
  v77 = 0u;
  v75 = 0u;
  if (v12)
    objc_msgSend(v12, "timeRangeForSegmentWithIdentifier:", v14);
  v15 = (CGContext *)objc_msgSend(v13, "CGContext", *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
  CGContextSaveGState(v15);
  if ((a6 & 2) != 0)
    v16 = 6.0;
  else
    v16 = 0.0;
  v78.origin.x = x;
  v78.origin.y = v34;
  v78.size.width = v36;
  v78.size.height = v38;
  v17 = CGPathCreateWithRoundedRect(v78, v16, v16, 0);
  CGContextAddPath(v15, v17);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v15, (CGColorRef)objc_msgSend(v18, "CGColor"));

  CGContextFillPath(v15);
  CGPathRelease(v17);
  CGContextClip(v15);
  objc_msgSend(v12, "size");
  PXRectWithOriginAndSize();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTimeZone:", v28);

  objc_msgSend(v27, "setTimeStyle:", 2);
  objc_msgSend(v27, "setDateStyle:", 1);
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__69121;
  v73 = __Block_byref_object_dispose__69122;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__69121;
  v67 = __Block_byref_object_dispose__69122;
  v68 = 0;
  v29 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke;
  v45[3] = &unk_1E5120808;
  v30 = v12;
  v52 = a2;
  v46 = v30;
  v47 = self;
  v53 = v20;
  v54 = v22;
  v55 = v24;
  v56 = v26;
  v57 = x;
  v58 = v34;
  v59 = v36;
  v60 = v38;
  v61 = v15;
  v31 = v13;
  v48 = v31;
  v62 = a6;
  v32 = v27;
  v49 = v32;
  v50 = &v69;
  v51 = &v63;
  v44[0] = v75;
  v44[1] = v76;
  v44[2] = v77;
  objc_msgSend(v30, "enumerateClipsInTimeRange:rect:usingBlock:", v44, v45, v20, v22, v24, v26);
  if ((a6 & 4) != 0 && (v70[5] || v64[5]))
  {
    v40[0] = v29;
    v40[1] = 3221225472;
    v40[2] = __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_3;
    v40[3] = &unk_1E5120858;
    v40[4] = self;
    v41 = v31;
    v42 = &v69;
    v43 = &v63;
    objc_msgSend(v41, "drawTextInRect:configuration:", v40, x, v34, v36, v38);

  }
  CGContextRestoreGState(v15);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);

}

- (id)_displayStringForPrivateString:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(a4, "isPrivateDataAllowed"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(&stru_1E5149688, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v5, "length"), CFSTR("*"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v12 = a3;
  -[PXStoryTimelineVisualDiagnosticsProvider helper](self, "helper");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "drawAsset:inRect:context:", v12, v11, x, y, width, height);

}

- (void)_drawVerticalInRect:(CGRect)a3 backgroundColor:(id)a4 context:(id)a5 configuration:(id)a6
{
  id v8;
  id v9;
  id v10;
  CGContext *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform t2;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;

  v8 = a4;
  v9 = a5;
  v10 = a6;
  v11 = (CGContext *)objc_msgSend(v9, "CGContext");
  CGContextSaveGState(v11);
  memset(&v23, 0, sizeof(v23));
  PXRectGetCenter();
  PXAffineTransformMakeRotationAroundPoint();
  CGContextGetCTM(&t2, v11);
  v20 = v23;
  CGAffineTransformConcat(&v22, &v20, &t2);
  CGContextSetCTM();
  PXRectGetCenter();
  PXSizeTranspose();
  PXRectWithCenterAndSize();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (v8)
  {
    CGContextSetFillColorWithColor(v11, (CGColorRef)objc_msgSend(objc_retainAutorelease(v8), "CGColor"));
    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    CGContextFillRect(v11, v24);
  }
  objc_msgSend(v9, "drawTextInRect:configuration:", v10, v13, v15, v17, v19);
  CGContextRestoreGState(v11);

}

- (id)_tvPreviewRankByAssetUUIDForMemory:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "rankedPreviewAssetsForLength:targetSize:", 4, 1920.0, 1080.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PXStoryTimelineVisualDiagnosticsProvider__tvPreviewRankByAssetUUIDForMemory___block_invoke;
  v9[3] = &unk_1E51478D8;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

- (PXStoryVisualDiagnosticsProviderHelper)helper
{
  return self->_helper;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (PXStoryAutoEditMomentsProvider)momentsProvider
{
  return self->_momentsProvider;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_momentsProvider, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

void __79__PXStoryTimelineVisualDiagnosticsProvider__tvPreviewRankByAssetUUIDForMemory___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
}

void __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGContext *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  if (a2 >= 1)
  {
    v52 = v12;
    v53 = v11;
    v54 = v10;
    v55 = v9;
    v56 = v8;
    v57 = v7;
    v58 = v5;
    v59 = v6;
    v13 = a2;
    v48 = a1 + 72;
    v15 = a1 + 64;
    v16 = a4 + 16;
    v17 = (uint64_t *)(a5 + 8);
    while (1)
    {
      v18 = (void *)MEMORY[0x1A85CE17C]();
      v19 = *v17;
      objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(v17 - 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), CFSTR("PXStoryTimelineVisualDiagnosticsProvider.m"), 1215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clip != nil"));

      }
      if (v19 == 3)
        break;
      if (v19 == 1)
      {
        objc_msgSend(v20, "resource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "px_storyResourceDisplayAsset");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), CFSTR("PXStoryTimelineVisualDiagnosticsProvider.m"), 1222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

        }
        PXRectNormalize();
        PXRectDenormalize();
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        CGContextSaveGState(*(CGContextRef *)(a1 + 152));
        v60.origin.x = v24;
        v60.origin.y = v26;
        v60.size.width = v28;
        v60.size.height = v30;
        CGContextClipToRect(*(CGContextRef *)(a1 + 152), v60);
        v31 = *(CGContext **)(a1 + 152);
        objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
        v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(v31, (CGColorRef)objc_msgSend(v32, "CGColor"));

        v61.origin.x = v24;
        v61.origin.y = v26;
        v61.size.width = v28;
        v61.size.height = v30;
        CGContextFillRect(*(CGContextRef *)(a1 + 152), v61);
        objc_msgSend(v22, "aspectRatio");
        PXRectWithAspectRatioFittingRect();
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        objc_msgSend(*(id *)(a1 + 40), "_drawAsset:inRect:context:", v22, *(_QWORD *)(a1 + 48));
        if ((*(_BYTE *)(a1 + 160) & 1) != 0)
        {
          v41 = *(void **)(a1 + 48);
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_2;
          v49[3] = &unk_1E51207E0;
          v50 = v22;
          v51 = *(id *)(a1 + 56);
          objc_msgSend(v41, "drawTextInRect:configuration:", v49, v34, v36, v38, v40);

        }
        CGContextRestoreGState(*(CGContextRef *)(a1 + 152));
        goto LABEL_17;
      }
LABEL_18:
      v17 += 96;

      objc_autoreleasePoolPop(v18);
      v16 += 32;
      if (!--v13)
        return;
    }
    objc_msgSend(v20, "resource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "px_storyResourceTextResourceInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "string");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_msgSend(v22, "px_storyResourceTextType");
    v45 = v15;
    if (v44)
    {
      if (v44 != 1)
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      v45 = v48;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v45 + 8) + 40), v43);
    goto LABEL_16;
  }
}

void __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v4;
  id v5;
  void (**v6)(void *, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t aBlock;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, const __CFString *);
  void *v16;
  uint64_t v17;
  id v18;

  aBlock = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_4;
  v16 = &unk_1E5120830;
  v4 = (void *)a1[5];
  v17 = a1[4];
  v18 = v4;
  v5 = a2;
  v6 = (void (**)(void *, _QWORD))_Block_copy(&aBlock);
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6[2](v6, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@\n%@"), v8, v9, aBlock, v14, v15, v16, v17);
  objc_msgSend(v5, "setText:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v12);

  objc_msgSend(v5, "setFontSize:", 8.0);
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.0);

}

uint64_t __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_4(uint64_t a1, const __CFString *a2)
{
  const __CFString *v2;

  if (a2)
    v2 = a2;
  else
    v2 = &stru_1E5149688;
  return objc_msgSend(*(id *)(a1 + 32), "_displayStringForPrivateString:context:", v2, *(_QWORD *)(a1 + 40));
}

void __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(void **)(a1 + 32);
  v11 = a2;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "localCreationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  objc_msgSend(v11, "setFontSize:", 4.0);
  objc_msgSend(v11, "setRelativePosition:", 0.0, 1.0);

}

void __73__PXStoryTimelineVisualDiagnosticsProvider__addMiscellaneousDiagnostics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v8);

    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\tUUID: %@\n"), v9);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = v6;
      v45 = v3;
      v10 = v6;
      objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", objc_msgSend(v10, "category"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("\tCategory: %@"), v11);

      v12 = objc_msgSend(v10, "subcategory");
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CD1630], "stringForSubcategory:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(" (%@)"), v13);

      }
      objc_msgSend(v4, "appendString:", CFSTR("\n"));
      objc_msgSend(v10, "featuredPersonLocalIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("\tFeatured: %li\n"), objc_msgSend(v14, "count"));
      v43 = v10;
      objc_msgSend(v10, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "librarySpecificFetchOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v17 = v14;
      v47 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v47)
      {
        v18 = *(_QWORD *)v49;
        v46 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v49 != v18)
              objc_enumerationMutation(v17);
            v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            v21 = (void *)MEMORY[0x1E0CD16C0];
            v52 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "fetchPersonsWithLocalIdentifiers:options:", v22, v16);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "firstObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(*(id *)(a1 + 40), "isPrivateDataAllowed"))
            {
              v25 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v24, "name");
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = (void *)v26;
              if (v26)
              {
                v28 = (id)objc_msgSend(v25, "initWithFormat:", CFSTR("%@ (%@)"), v26, v20);
              }
              else
              {
                objc_msgSend(v24, "displayName");
                v29 = v17;
                v30 = v16;
                v31 = a1;
                v32 = v4;
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = (id)objc_msgSend(v25, "initWithFormat:", CFSTR("%@ (%@)"), v33, v20);

                v4 = v32;
                a1 = v31;
                v16 = v30;
                v17 = v29;
                v18 = v46;
              }

            }
            else
            {
              v28 = v20;
            }
            objc_msgSend(v4, "appendFormat:", CFSTR("\t\t%@\n"), v28);

          }
          v47 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        }
        while (v47);
      }

      v6 = v44;
      v3 = v45;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "infoDictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bundleIdentifier");
  v36 = v6;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Main Bundle: %@ %@ (%@)\n"), v37, v38, v39);

  objc_msgSend(*(id *)(a1 + 32), "model");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "timelineSpec");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutDirection");
  PXUserInterfaceLayoutDirectionDescription();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Layout Direction: %@\n"), v42);

  objc_msgSend(v3, "setText:", v4);
}

void __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8)
{
  id v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGContext *v24;
  id v25;
  void *v26;
  double x;
  double y;
  double width;
  double height;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v31 = a2;
  v15 = a3;
  v36.origin.x = a4;
  v36.origin.y = a5;
  v36.size.width = a6;
  v36.size.height = a7;
  if (!CGRectIsEmpty(v36))
  {
    PXRectFlippedVertically();
    PXRectDenormalize();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    CGContextSaveGState(*(CGContextRef *)(a1 + 72));
    v24 = *(CGContext **)(a1 + 72);
    objc_msgSend(v31, "colorWithAlphaComponent:", 0.8);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v24, (CGColorRef)objc_msgSend(v25, "CGColor"));

    v37.origin.x = v17;
    v37.origin.y = v19;
    v37.size.width = v21;
    v37.size.height = v23;
    CGContextStrokeRect(*(CGContextRef *)(a1 + 72), v37);
    CGContextRestoreGState(*(CGContextRef *)(a1 + 72));
    v26 = *(void **)(a1 + 32);
    v38.origin.x = v17;
    v38.origin.y = v19;
    v38.size.width = v21;
    v38.size.height = v23;
    v39 = CGRectInset(v38, 3.0, 3.0);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_2;
    v32[3] = &unk_1E5120768;
    v33 = v15;
    v34 = v31;
    v35 = a8;
    objc_msgSend(v26, "drawTextInRect:configuration:", v32, x, y, width, height);

  }
}

void __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_3(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  float v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a2;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v14, "confidence");
        v16 = v15;
        PXFloatDenormalize();
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v17 * a3, v17 * a4, v17 * a5, 1.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v14, "contentsRect");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%0.2f"), *(_QWORD *)&v16);
        (*(void (**)(uint64_t, void *, void *, double, double, double, double, double))(v19 + 16))(v19, v18, v28, v21, v23, v25, v27, a6);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

}

void __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

void __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setText:", v3);
  objc_msgSend(v4, "setFontSize:", 7.0);
  objc_msgSend(v4, "setTextColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setRelativePosition:", 0.0, *(double *)(a1 + 48));

}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  if (a2 >= 1)
  {
    v5 = a2;
    v7 = (_QWORD *)(a5 + 8);
    do
    {
      v8 = (void *)MEMORY[0x1A85CE17C]();
      if (*v7 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(v7 - 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "px_storyResourceDisplayAsset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          v13 = *(void **)(a1 + 48);
          objc_msgSend(v12, "localIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          {
            objc_msgSend(v12, "photoLibrary");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v17 = *(void **)(v16 + 40);
            *(_QWORD *)(v16 + 40) = v15;

          }
        }

      }
      objc_autoreleasePoolPop(v8);
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  BOOL v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  BOOL v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  __CFString *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  float v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  id v112;
  void (**v115)(void *, void *);
  void *context;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  _QWORD v123[4];
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;
  _BYTE v145[608];
  _QWORD aBlock[4];
  id v147;
  _QWORD v148[5];
  id v149;
  uint64_t *v150;
  uint64_t *v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t v166;
  _QWORD v167[4];
  id v168;
  uint64_t v169;
  uint64_t v170;
  __int128 v171;
  uint64_t v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  uint64_t v180;
  _BYTE v181[616];
  CGRect v182;
  CGRect remainder;
  CGRect slice;
  _BYTE __dst[608];
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  void *v194;
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;
  CGRect v198;

  v197 = *MEMORY[0x1E0C80C00];
  if (a2 >= 1)
  {
    v120 = 0;
    v110 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v111 = *MEMORY[0x1E0C9D628];
    v108 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v109 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    do
    {
      context = (void *)MEMORY[0x1A85CE17C]();
      v5 = (uint64_t *)(a5 + 768 * v120);
      v7 = *v5;
      v6 = v5[1];
      v193 = *((_OWORD *)v5 + 1);
      v8 = v5[4];
      v9 = *(_OWORD *)(v5 + 11);
      v10 = *(_OWORD *)(v5 + 15);
      v190 = *(_OWORD *)(v5 + 13);
      v191 = v10;
      v192 = *(_OWORD *)(v5 + 17);
      v11 = *(_OWORD *)(v5 + 7);
      v186 = *(_OWORD *)(v5 + 5);
      v187 = v11;
      v12 = *(_OWORD *)(v5 + 9);
      v189 = v9;
      v188 = v12;
      v118 = v5[19];
      memcpy(__dst, v5 + 20, sizeof(__dst));
      if (v6 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v13;
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 40), CFSTR("PXStoryTimelineVisualDiagnosticsProvider.m"), 925, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clip != nil"));

          v13 = 0;
        }
        objc_msgSend(v13, "resource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "px_storyResourceDisplayAsset");
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v121)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 40), CFSTR("PXStoryTimelineVisualDiagnosticsProvider.m"), 927, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

        }
        v15 = *(void **)(a1 + 48);
        v16 = objc_alloc((Class)off_1E50B1688);
        v17 = *((_OWORD *)off_1E50B8778 + 1);
        v134 = *(_OWORD *)off_1E50B8778;
        v135 = v17;
        v18 = (void *)objc_msgSend(v16, "initWithSectionObject:itemObject:subitemObject:indexPath:", v121, 0, 0, &v134);
        v19 = objc_msgSend(v15, "indexForDisplayAssetReference:", v18);

        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "movieHighlightsForDisplayAssetAtIndex:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          PXStoryMovieHighlightForPlaybackStyle(v21, v118);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(*(id *)(a1 + 56), "beginPage");
        memset(&slice, 0, sizeof(slice));
        objc_msgSend(*(id *)(a1 + 56), "currentPageBounds");
        slice = CGRectInset(v198, 10.0, 10.0);
        memset(&remainder, 0, sizeof(remainder));
        memset(&v182, 0, sizeof(v182));
        CGRectDivide(slice, &slice, &remainder, 260.0, CGRectMaxYEdge);
        CGRectDivide(slice, &v182, &slice, 250.0, CGRectMaxYEdge);
        objc_msgSend(v121, "aspectRatio");
        PXRectWithAspectRatioFittingRect();
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        objc_msgSend(*(id *)(a1 + 40), "_drawAsset:inRect:context:", v121, *(_QWORD *)(a1 + 56));
        v30 = *(void **)(a1 + 64);
        v31 = *(_QWORD *)(a1 + 56);
        v167[0] = MEMORY[0x1E0C809B0];
        v167[1] = 3221225472;
        v167[2] = __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_3;
        v167[3] = &unk_1E51206F0;
        v169 = v7;
        v170 = 1;
        v171 = v193;
        v177 = v190;
        v178 = v191;
        v179 = v192;
        v173 = v186;
        v174 = v187;
        v175 = v188;
        v176 = v189;
        v172 = v8;
        v180 = v118;
        memcpy(v181, __dst, 0x260uLL);
        v112 = v20;
        v168 = v112;
        v181[608] = *(_BYTE *)(a1 + 120);
        objc_msgSend(v30, "drawCropRectsForAsset:inRect:context:configuration:", v121, v31, v167, v23, v25, v27, v29);
        v163 = 0;
        v164 = &v163;
        v165 = 0x2020000000;
        v166 = 0;
        v159 = 0;
        v160 = &v159;
        v161 = 0x2020000000;
        v162 = 0;
        v153 = 0;
        v154 = &v153;
        v155 = 0x3032000000;
        v156 = __Block_byref_object_copy__69121;
        v157 = __Block_byref_object_dispose__69122;
        v158 = 0;
        v32 = *(void **)(a1 + 72);
        v148[0] = MEMORY[0x1E0C809B0];
        v148[1] = 3221225472;
        v148[2] = __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_4;
        v148[3] = &unk_1E5120718;
        v151 = &v159;
        v152 = &v153;
        v33 = *(_QWORD *)(a1 + 40);
        v150 = &v163;
        v148[4] = v33;
        v149 = *(id *)(a1 + 56);
        objc_msgSend(v32, "requestIndividualFaceRectsInAsset:options:resultHandler:", v121, 1, v148);
        v34 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v34, "appendFormat:", CFSTR("Clip ID: %ld"), v7);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_5;
        aBlock[3] = &unk_1E51485B0;
        v35 = v34;
        v147 = v35;
        v115 = (void (**)(void *, void *))_Block_copy(aBlock);
        PXDisplayAssetPlaybackStyleDescription();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v115[2](v115, v36);

        if (v8)
        {
          PXStoryClipOptionsDescription(v8);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v115[2](v115, v37);

        }
        objc_msgSend(v35, "appendString:", CFSTR("\n"));
        objc_msgSend(v121, "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "appendFormat:", CFSTR("UUID: %@\n"), v38);

        v39 = *(void **)(a1 + 80);
        objc_msgSend(v121, "localCreationDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringFromDate:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "appendFormat:", CFSTR("Date: %@\n"), v41);

        objc_msgSend(*(id *)(a1 + 40), "screenScale");
        *(_QWORD *)&v134 = v7;
        *((_QWORD *)&v134 + 1) = 1;
        v135 = v193;
        v141 = v190;
        v142 = v191;
        v143 = v192;
        v137 = v186;
        v138 = v187;
        v139 = v188;
        v140 = v189;
        v136 = v8;
        v144 = v118;
        memcpy(v145, __dst, sizeof(v145));
        PXStoryMediaSizeForDisplayAssetClipInfo((uint64_t)&v134);
        v43 = v42;
        v45 = v44;
        PXSizeGetArea();
        objc_msgSend(v35, "appendFormat:", CFSTR("Required Media Size: %.0f x %.0f (%.1fMP)\n"), v43, v45, v46 / 1000000.0);
        objc_msgSend(v117, "colorNormalization");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "detailedDescription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "appendFormat:", CFSTR("Color Normalization: %@\n"), v48);

        v49 = v164[3];
        if (v49 >= 1)
          objc_msgSend(v35, "appendFormat:", CFSTR("Faces: %li (featured: %li; %@)\n"), v49, v160[3], v154[5]);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = v121;
          v51 = *(void **)(a1 + 88);
          objc_msgSend(v50, "localIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKeyedSubscript:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "cloudIdentifier");
          v119 = (void *)objc_claimAutoreleasedReturnValue();

          if (v119)
          {
            objc_msgSend(v119, "stringValue");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "appendFormat:", CFSTR("Cloud Identifier: %@\n"), v54);

          }
          objc_msgSend(v50, "curationScore");
          objc_msgSend(v35, "appendFormat:", CFSTR("Curation Score: %0.2f\n"), v55);
          objc_msgSend(v50, "location");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56 == 0;

          if (!v57)
          {
            objc_msgSend(v50, "location");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "appendFormat:", CFSTR("Location: %@\n"), v58);

          }
          objc_msgSend(v50, "sceneClassifications");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v59 == 0;

          if (!v60)
          {
            objc_msgSend(v50, "sceneClassifications");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            PXStorySceneClassificationDescription(v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "appendFormat:", CFSTR("Scenes: %@\n"), v62);

          }
          PFDeviceScreenSize();
          v64 = v63;
          v66 = v65;
          objc_msgSend(MEMORY[0x1E0D77E68], "cropVariantsForAsset:targetSize:faces:", v50, 0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "count") == 0;

          if (!v68)
          {
            objc_msgSend(MEMORY[0x1E0D77E68], "cropVariantsForAsset:targetSize:faces:", v50, 0, v64, v66);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "appendString:", CFSTR("Crop Variant Scores: "));
            v132 = 0u;
            v133 = 0u;
            v130 = 0u;
            v131 = 0u;
            v70 = v69;
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v130, v196, 16);
            if (v71)
            {
              v72 = *(_QWORD *)v131;
              do
              {
                for (i = 0; i != v71; ++i)
                {
                  if (*(_QWORD *)v131 != v72)
                    objc_enumerationMutation(v70);
                  v74 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
                  objc_msgSend(MEMORY[0x1E0D77E68], "stringForCropVariantType:", objc_msgSend(v74, "cropType"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "cropScore");
                  objc_msgSend(v35, "appendFormat:", CFSTR("%@: %f, "), v75, v76);

                }
                v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v130, v196, 16);
              }
              while (v71);
            }

            objc_msgSend(v35, "appendString:", CFSTR("\n"));
          }
          objc_msgSend(MEMORY[0x1E0D77E68], "cropVariantsForAsset:targetSize:faces:", v50, 0, v66, v64);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "count") == 0;

          if (!v78)
          {
            objc_msgSend(MEMORY[0x1E0D77E68], "cropVariantsForAsset:targetSize:faces:", v50, 0, v66, v64);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "appendString:", CFSTR("Landscape Crop Variant Scores: "));
            v128 = 0u;
            v129 = 0u;
            v126 = 0u;
            v127 = 0u;
            v80 = v79;
            v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v126, v195, 16);
            if (v81)
            {
              v82 = *(_QWORD *)v127;
              do
              {
                for (j = 0; j != v81; ++j)
                {
                  if (*(_QWORD *)v127 != v82)
                    objc_enumerationMutation(v80);
                  v84 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
                  objc_msgSend(MEMORY[0x1E0D77E68], "stringForCropVariantType:", objc_msgSend(v84, "cropType"));
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "cropScore");
                  objc_msgSend(v35, "appendFormat:", CFSTR("%@: %f, "), v85, v86);

                }
                v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v126, v195, 16);
              }
              while (v81);
            }

            objc_msgSend(v35, "appendString:", CFSTR("\n"));
          }
          if (*(_BYTE *)(a1 + 120))
          {
            v87 = *(void **)(a1 + 96);
            objc_msgSend(v50, "uuid");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "objectForKeyedSubscript:", v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            if (v89)
            {
              objc_msgSend(v89, "stringValue");
              v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v90 = CFSTR("Not Found");
            }
            *(_QWORD *)&v134 = 0;
            objc_msgSend(v50, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v134, 1920.0, 1080.0, v111, v110, v109, v108);
            v91 = *(void **)(a1 + 104);
            objc_msgSend(v50, "uuid");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v194 = v92;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = 0;
            objc_msgSend(v91, "requestIconicSceneScoreForAssetLocalIdentifiers:error:", v93, &v125);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v125;

            objc_msgSend(v50, "uuid");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "objectForKey:", v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "doubleValue");
            v99 = v98;

            v100 = v134;
            objc_msgSend(v50, "curationScore");
            v102 = v101;
            objc_msgSend(v50, "overallAestheticScore");
            objc_msgSend(v35, "appendFormat:", CFSTR("TV Preview Rank:%@, cropScore:%0.4f, curationScore:%0.4f, aestheticScore:%0.4f, iconicSceneScore:%0.4f\n"), v90, v100, v102, v103, v99);

          }
        }
        v104 = *(void **)(a1 + 56);
        v123[0] = MEMORY[0x1E0C809B0];
        v123[1] = 3221225472;
        v123[2] = __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_6;
        v123[3] = &unk_1E512C9F0;
        v105 = v35;
        v124 = v105;
        objc_msgSend(v104, "drawTextInRect:configuration:", v123, v182.origin.x, v182.origin.y, v182.size.width, v182.size.height);
        objc_msgSend(*(id *)(a1 + 56), "endPage");

        _Block_object_dispose(&v153, 8);
        _Block_object_dispose(&v159, 8);
        _Block_object_dispose(&v163, 8);

      }
      objc_autoreleasePoolPop(context);
      ++v120;
    }
    while (v120 != a2);
  }
}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[7];
  uint64_t v8;

  v3 = a2;
  v4 = *(_OWORD *)(a1 + 672);
  v7[4] = *(_OWORD *)(a1 + 656);
  v7[5] = v4;
  v7[6] = *(_OWORD *)(a1 + 688);
  v8 = *(_QWORD *)(a1 + 704);
  v5 = *(_OWORD *)(a1 + 608);
  v7[0] = *(_OWORD *)(a1 + 592);
  v7[1] = v5;
  v6 = *(_OWORD *)(a1 + 640);
  v7[2] = *(_OWORD *)(a1 + 624);
  v7[3] = v6;
  objc_msgSend(v3, "setKenBurnsAnimationInfo:", v7);
  objc_msgSend(v3, "setMovieHighlight:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 808))
    objc_msgSend(v3, "setTVPreviewSize:", 1920.0, 1080.0);

}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a4;
  objc_msgSend(*(id *)(a1 + 32), "_descriptionForFaces:context:", a5, *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@"), v3);

}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 10.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

uint64_t __99__PXStoryTimelineVisualDiagnosticsProvider__segmentIndexesWithInvalidOrderOutTransitionInTimeline___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a2 >= 2)
  {
    v19 = v9;
    v20 = v8;
    v21 = v7;
    v22 = v6;
    v23 = v5;
    v24 = v4;
    v25 = v10;
    v26 = v11;
    v13 = result;
    v14 = 0;
    v15 = a2 - 1;
    do
    {
      v16 = *a4;
      v17 = *((char *)a4 + 48);
      v18 = a4[25];
      a4 += 25;
      result = +[PXStoryTransitionProducer isSupportedTransitionWithKind:fromSegmentIdentifier:toSegmentIdentifier:inTimeline:](PXStoryTransitionProducer, "isSupportedTransitionWithKind:fromSegmentIdentifier:toSegmentIdentifier:inTimeline:", v17, v16, v18, *(_QWORD *)(v13 + 32), v19, v20, v21, v22, v23, v24, v25, v26);
      if ((result & 1) == 0)
        result = objc_msgSend(*(id *)(v13 + 40), "addIndex:", v14);
      ++v14;
    }
    while (v15 != v14);
  }
  return result;
}

void __81__PXStoryTimelineVisualDiagnosticsProvider__moduleStartSegmentIndexesInTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  void *v20;
  _OWORD v21[3];
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  if (a2 >= 1)
  {
    v4 = 0;
    v5 = 0uLL;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v33 = v5;
      v34 = v5;
      v32 = v5;
      v7 = *(void **)(a1 + 32);
      v8 = objc_msgSend(v7, "identifierForSegmentAtIndex:", v4);
      if (v7)
      {
        objc_msgSend(v7, "timeRangeForSegmentWithIdentifier:", v8);
      }
      else
      {
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
      }
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "size");
      PXRectWithOriginAndSize();
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __81__PXStoryTimelineVisualDiagnosticsProvider__moduleStartSegmentIndexesInTimeline___block_invoke_2;
      v22[3] = &unk_1E51206A0;
      v18 = *(id *)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 64);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(void **)(a1 + 48);
      v23 = v18;
      v24 = v19;
      v25 = v20;
      v26 = &v28;
      v21[0] = v32;
      v21[1] = v33;
      v21[2] = v34;
      objc_msgSend(v9, "enumerateClipsInTimeRange:rect:usingBlock:", v21, v22, v11, v13, v15, v17);
      if (*((_BYTE *)v29 + 24))
        objc_msgSend(*(id *)(a1 + 56), "addIndex:", v4);

      _Block_object_dispose(&v28, 8);
      ++v4;
      v5 = 0uLL;
    }
    while (a2 != v4);
  }
}

void __81__PXStoryTimelineVisualDiagnosticsProvider__moduleStartSegmentIndexesInTimeline___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  if (a2 >= 1)
  {
    v5 = a2;
    v7 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(v7 - 1));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "px_storyResourceDisplayAsset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "clipForDisplayAsset:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "moduleInfo");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= v12 & 1;

      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

void __82__PXStoryTimelineVisualDiagnosticsProvider__autoEditDebugInfoBySegmentInTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _OWORD v23[3];
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  if (a2 >= 1)
  {
    v4 = 0;
    v5 = 0uLL;
    do
    {
      v37 = v5;
      v38 = v5;
      v36 = v5;
      v6 = *(void **)(a1 + 32);
      v7 = objc_msgSend(v6, "identifierForSegmentAtIndex:", v4);
      if (v6)
      {
        objc_msgSend(v6, "timeRangeForSegmentWithIdentifier:", v7);
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
        v36 = 0u;
      }
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__69121;
      v34 = __Block_byref_object_dispose__69122;
      v35 = (id)MEMORY[0x1E0C9AA70];
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "size");
      PXRectWithOriginAndSize();
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __82__PXStoryTimelineVisualDiagnosticsProvider__autoEditDebugInfoBySegmentInTimeline___block_invoke_2;
      v24[3] = &unk_1E51206A0;
      v17 = *(id *)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(a1 + 48);
      v25 = v17;
      v26 = v18;
      v27 = v19;
      v28 = &v30;
      v23[0] = v36;
      v23[1] = v37;
      v23[2] = v38;
      objc_msgSend(v8, "enumerateClipsInTimeRange:rect:usingBlock:", v23, v24, v10, v12, v14, v16);
      v20 = v31[5];
      v21 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

      _Block_object_dispose(&v30, 8);
      ++v4;
      v5 = 0uLL;
    }
    while (a2 != v4);
  }
}

void __82__PXStoryTimelineVisualDiagnosticsProvider__autoEditDebugInfoBySegmentInTimeline___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if (a2 >= 1)
  {
    v5 = a2;
    v7 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(v7 - 1));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "px_storyResourceDisplayAsset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "clipForDisplayAsset:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "debugInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "debugInfo");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v15 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v13;

        }
      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

void __83__PXStoryTimelineVisualDiagnosticsProvider__moduleDescriptionsBySegmentInTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _OWORD v23[3];
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  if (a2 >= 1)
  {
    v4 = 0;
    v5 = 0uLL;
    do
    {
      v37 = v5;
      v38 = v5;
      v36 = v5;
      v6 = *(void **)(a1 + 32);
      v7 = objc_msgSend(v6, "identifierForSegmentAtIndex:", v4);
      if (v6)
      {
        objc_msgSend(v6, "timeRangeForSegmentWithIdentifier:", v7);
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
        v36 = 0u;
      }
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__69121;
      v34 = __Block_byref_object_dispose__69122;
      v35 = (id)objc_opt_new();
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "size");
      PXRectWithOriginAndSize();
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __83__PXStoryTimelineVisualDiagnosticsProvider__moduleDescriptionsBySegmentInTimeline___block_invoke_301;
      v24[3] = &unk_1E51206A0;
      v17 = *(id *)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(a1 + 48);
      v25 = v17;
      v26 = v18;
      v27 = v19;
      v28 = &v30;
      v23[0] = v36;
      v23[1] = v37;
      v23[2] = v38;
      objc_msgSend(v8, "enumerateClipsInTimeRange:rect:usingBlock:", v23, v24, v10, v12, v14, v16);
      v20 = v31[5];
      v21 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

      _Block_object_dispose(&v30, 8);
      ++v4;
      v5 = 0uLL;
    }
    while (a2 != v4);
  }
}

void __83__PXStoryTimelineVisualDiagnosticsProvider__moduleDescriptionsBySegmentInTimeline___block_invoke_301(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;

  if (a2 >= 1)
  {
    v5 = a2;
    v7 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(v7 - 1));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "px_storyResourceDisplayAsset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "clipForDisplayAsset:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length"))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "appendString:", CFSTR(" / "));
        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v13 = objc_msgSend(v11, "moduleInfo");
        v14 = CFSTR("??");
        if (v13 <= 3)
          v14 = off_1E511F160[v13];
        v15 = v14;
        objc_msgSend(v11, "moduleInfo");
        if ((v16 & 1) != 0)
          v17 = CFSTR(" start");
        else
          v17 = &stru_1E5149688;
        objc_msgSend(v11, "moduleInfo");
        v19 = CFSTR(" empty space break");
        if ((v18 & 0x100) == 0)
          v19 = &stru_1E5149688;
        objc_msgSend(v12, "appendFormat:", CFSTR("%@%@%@"), v15, v17, v19);

      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

void __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "lastAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  void *v20;
  _OWORD v21[3];
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  if (a2 >= 1)
  {
    v4 = 0;
    v5 = 0uLL;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v33 = v5;
      v34 = v5;
      v32 = v5;
      v7 = *(void **)(a1 + 32);
      v8 = objc_msgSend(v7, "identifierForSegmentAtIndex:", v4);
      if (v7)
      {
        objc_msgSend(v7, "timeRangeForSegmentWithIdentifier:", v8);
      }
      else
      {
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
      }
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "size");
      PXRectWithOriginAndSize();
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke_3;
      v22[3] = &unk_1E51206A0;
      v18 = *(id *)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 64);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(void **)(a1 + 48);
      v23 = v18;
      v24 = v19;
      v25 = v20;
      v26 = &v28;
      v21[0] = v32;
      v21[1] = v33;
      v21[2] = v34;
      objc_msgSend(v9, "enumerateClipsInTimeRange:rect:usingBlock:", v21, v22, v11, v13, v15, v17);
      if (*((_BYTE *)v29 + 24))
        objc_msgSend(*(id *)(a1 + 56), "addIndex:", v4);

      _Block_object_dispose(&v28, 8);
      ++v4;
      v5 = 0uLL;
    }
    while (a2 != v4);
  }
}

void __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v7;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a2 >= 1)
  {
    v7 = a2;
    v9 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(v9 - 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "px_storyResourceDisplayAsset");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = *(void **)(a1 + 48);
          objc_msgSend(v12, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v14) = objc_msgSend(v14, "containsObject:", v15);

          if ((_DWORD)v14)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
            *a6 = 1;
          }
        }

      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
}

void __93__PXStoryTimelineVisualDiagnosticsProvider__movementDescriptionForSegmentAtIndex_inTimeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t MovementType;
  void *v12;
  void *v13;
  __int128 v14[7];
  uint64_t v15;
  _QWORD __dst[92];

  if (a2 >= 1)
  {
    __dst[90] = v5;
    __dst[91] = v6;
    v7 = a2;
    v9 = (_QWORD *)(a5 + 16);
    do
    {
      v10 = *(v9 - 1);
      memcpy(__dst, v9, 0x290uLL);
      if (v10 == 1)
      {
        v14[4] = *(_OWORD *)&__dst[75];
        v14[5] = *(_OWORD *)&__dst[77];
        v14[6] = *(_OWORD *)&__dst[79];
        v15 = __dst[81];
        v14[0] = *(_OWORD *)&__dst[67];
        v14[1] = *(_OWORD *)&__dst[69];
        v14[2] = *(_OWORD *)&__dst[71];
        v14[3] = *(_OWORD *)&__dst[73];
        MovementType = PXStoryClipKenBurnsAnimationInfoGetMovementType(v14);
        v12 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "_descriptionForMovementType:", MovementType);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", v3, &__block_literal_global_252);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", *(_QWORD *)(a1 + 40), &__block_literal_global_253);

}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_5(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v10 = a2;
  objc_msgSend(a1[4], "resourcesDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfDisplayAssetResources");
  if (v4 >= 2)
  {
    v5 = 0;
    v6 = v4 - 1;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_6;
      v11[3] = &unk_1E5120650;
      v12 = v3;
      v17 = v5;
      v8 = a1[5];
      v9 = a1[4];
      v13 = v8;
      v14 = v9;
      v15 = a1[6];
      v16 = a1[7];
      objc_msgSend(v10, "addRowWithConfiguration:", v11);

      ++v5;
    }
    while (v6 != v5);
  }

}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Assets Pairs"));
  objc_msgSend(v2, "setDefaultRowHeight:", 30.0);
  objc_msgSend(v2, "setDefaultRowFontSize:", 7.0);

}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(void *, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD aBlock[4];
  id v20;
  uint64_t v21;

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_7;
  aBlock[3] = &unk_1E5120600;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 72);
  v20 = v5;
  v21 = v6;
  v7 = a2;
  v8 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v8[2](v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_8;
  v14[3] = &unk_1E5120628;
  v18 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 48);
  v15 = v9;
  v16 = *(id *)(a1 + 56);
  v17 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v7, "addCellForColumnWithIdentifier:rendering:", v11, v14);
  objc_msgSend(v7, "addCellForColumnWithIdentifier:text:", *(_QWORD *)(a1 + 64), CFSTR("..."));

}

id __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "displayAssetResourceAtIndex:", *(_QWORD *)(a1 + 40) + a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_storyResourceDisplayAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_8(uint64_t a1, void *a2, double a3, CGFloat a4, double a5, CGFloat a6)
{
  CGFloat v10;
  _QWORD v12[5];
  CGRect v13;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_9;
  v12[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
  v12[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(a2, "drawTextInRect:configuration:", v12, a3);
  v10 = a3 + 25.0;
  objc_msgSend(*(id *)(a1 + 32), "_drawAsset:inRect:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v10, a4, a6, a6);
  v13.origin.x = v10;
  v13.origin.y = a4;
  v13.size.width = a6;
  v13.size.height = a6;
  return objc_msgSend(*(id *)(a1 + 32), "_drawAsset:inRect:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CGRectGetMaxX(v13) + 2.0, a4, a6, a6);
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_9(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a2;
  v4 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%li-%li"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32) + 1);
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setFontSize:", 7.0);
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.5);

}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Distance"));
  objc_msgSend(v2, "setWidth:", 200.0);

}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Assets"));
  objc_msgSend(v2, "setWidth:", 100.0);

}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Segment AutoEdit Debug Info: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  objc_msgSend(v5, "setDefaultRowHeight:", 30.0);
  objc_msgSend(v5, "setDefaultRowFontSize:", 7.0);

}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", v3, &__block_literal_global_244_69291);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_4;
  v9 = &unk_1E5120500;
  v10 = v5;
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:");

}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSegments");
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = 0;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_6;
      v13[3] = &unk_1E5120550;
      v8 = *(id *)(a1 + 40);
      v20 = v6;
      v9 = *(_QWORD *)(a1 + 32);
      v14 = v8;
      v15 = v9;
      v16 = v3;
      v17 = *(id *)(a1 + 48);
      v10 = *(id *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 64);
      v18 = v10;
      v19 = v11;
      objc_msgSend(v12, "addRowWithConfiguration:", v13);

      ++v6;
    }
    while (v5 != v6);
  }

}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *, double, double);
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_7;
  v16 = &unk_1E5120418;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 80);
  v17 = v4;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v6 = a2;
  objc_msgSend(v6, "addCellForColumnWithIdentifier:rendering:", v5, &v13);
  v7 = *(void **)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80), v13, v14, v15, v16, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 40), "_approxLinesInString:lineLength:", v10, 100);
  objc_msgSend(v6, "height");
  if (v12 < (double)v11 * 8.5)
    v12 = (double)v11 * 8.5;
  objc_msgSend(v6, "setHeight:", v12);
  objc_msgSend(v6, "addCellForColumnWithIdentifier:text:", *(_QWORD *)(a1 + 72), v10);

}

uint64_t __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_7(uint64_t a1, void *a2, double a3, double a4)
{
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_8;
  v8[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
  v8[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(a2, "drawTextInRect:configuration:", v8, a3);
  return objc_msgSend(*(id *)(a1 + 32), "_drawSegmentAtIndex:timeline:inRect:options:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), a3 + 25.0, a4, 30.0, 30.0);
}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_8(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a2;
  v4 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("#%li"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setFontSize:", 7.0);
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.5);

}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setTitle:", v2);
  objc_msgSend(v3, "setWidth:", 500.0);

}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Segment"));
  objc_msgSend(v2, "setWidth:", 70.0);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", v3, &__block_literal_global_226_69308);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", a1[5], &__block_literal_global_227);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", a1[6], &__block_literal_global_228_69309);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", a1[7], &__block_literal_global_229);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", a1[8], &__block_literal_global_230);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_8(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v12 = a2;
  objc_msgSend(a1[4], "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSegments");
  objc_msgSend(a1[4], "_momentEndSegmentIndexesInTimeline:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_moduleStartSegmentIndexesInTimeline:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_moduleDescriptionsBySegmentInTimeline:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_segmentIndexesWithInvalidOrderOutTransitionInTimeline:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_9;
      v13[3] = &unk_1E5120468;
      v14 = v3;
      v26 = i;
      v10 = a1[5];
      v11 = a1[4];
      v15 = v10;
      v16 = v11;
      v17 = a1[6];
      v18 = a1[7];
      v19 = a1[8];
      v20 = v8;
      v21 = a1[9];
      v22 = a1[10];
      v23 = v5;
      v24 = v6;
      v25 = v7;
      objc_msgSend(v12, "addRowWithConfiguration:", v13);

    }
  }

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Segments"));
  objc_msgSend(v2, "setDefaultRowHeight:", 30.0);
  objc_msgSend(v2, "setDefaultRowFontSize:", 7.0);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _OWORD v25[7];
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[8];

  v3 = a2;
  v34 = 0u;
  memset(v35, 0, 120);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "identifierForSegmentAtIndex:", *(_QWORD *)(a1 + 128));
  if (v4)
  {
    objc_msgSend(v4, "infoForSegmentWithIdentifier:", v5);
  }
  else
  {
    v34 = 0u;
    memset(v35, 0, 120);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
  }
  v6 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_10;
  v26[3] = &unk_1E5120418;
  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v29 = *(_QWORD *)(a1 + 128);
  v26[4] = v7;
  v27 = *(id *)(a1 + 32);
  v28 = *(id *)(a1 + 56);
  objc_msgSend(v3, "addCellForColumnWithIdentifier:rendering:", v8, v26);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(void **)(a1 + 48);
  v25[4] = *(_OWORD *)((char *)&v35[4] + 8);
  v25[5] = *(_OWORD *)((char *)&v35[5] + 8);
  v25[6] = *(_OWORD *)((char *)&v35[6] + 8);
  v25[0] = *(_OWORD *)((char *)v35 + 8);
  v25[1] = *(_OWORD *)((char *)&v35[1] + 8);
  v25[2] = *(_OWORD *)((char *)&v35[2] + 8);
  v25[3] = *(_OWORD *)((char *)&v35[3] + 8);
  objc_msgSend(v10, "_descriptionForDurationInfo:", v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCellForColumnWithIdentifier:text:", v9, v11);

  v12 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 48), "_movementDescriptionForSegmentAtIndex:inTimeline:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCellForColumnWithIdentifier:text:", v12, v13);

  if (v33 > 0xAuLL)
    v14 = CFSTR("??");
  else
    v14 = off_1E5136018[v33];
  v15 = v14;
  if (objc_msgSend(*(id *)(a1 + 80), "containsIndex:", *(_QWORD *)(a1 + 128)))
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("⚠️(%@)"), v15);

    v15 = (__CFString *)v16;
  }
  objc_msgSend(v3, "addCellForColumnWithIdentifier:text:", *(_QWORD *)(a1 + 88), v15);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_12;
  v20[3] = &unk_1E5120418;
  v17 = *(_QWORD *)(a1 + 96);
  v18 = *(id *)(a1 + 104);
  v19 = *(_QWORD *)(a1 + 128);
  v21 = v18;
  v24 = v19;
  v22 = *(id *)(a1 + 112);
  v23 = *(id *)(a1 + 120);
  objc_msgSend(v3, "addCellForColumnWithIdentifier:rendering:", v17, v20);

}

uint64_t __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_10(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  _QWORD v11[5];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_11;
  v11[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
  v11[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(a2, "drawTextInRect:configuration:", v11, a3);
  return objc_msgSend(*(id *)(a1 + 32), "_drawSegmentAtIndex:timeline:inRect:options:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), a3 + 25.0, a4, a6, a6);
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_12(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGContext *v11;
  void *v12;
  id v13;
  CGContext *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  CGRect v21;

  v17 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", *(_QWORD *)(a1 + 56)))
  {
    v11 = (CGContext *)objc_msgSend(v17, "CGContext");
    objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = objc_retainAutorelease(v12);
    CGContextSetFillColorWithColor(v11, (CGColorRef)objc_msgSend(v13, "CGColor"));

    v14 = (CGContext *)objc_msgSend(v17, "CGContext");
    v21.origin.x = a3;
    v21.origin.y = a4;
    v21.size.width = a5;
    v21.size.height = a6;
    CGContextFillRect(v14, v21);
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", *(_QWORD *)(a1 + 56)))
  {
    v11 = (CGContext *)objc_msgSend(v17, "CGContext");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.96, 0.92, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_13;
  v18[3] = &unk_1E5120440;
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v19 = v15;
  v20 = v16;
  objc_msgSend(v17, "drawTextInRect:configuration:", v18, a3, a4, a5, a6);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v2, "numberWithInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v7, "setFontSize:", 7.0);
  objc_msgSend(v7, "setRelativePosition:", 0.0, 0.5);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_11(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a2;
  v4 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("#%li"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setFontSize:", 7.0);
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.5);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Module"));
  objc_msgSend(v2, "setWidth:", 120.0);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Transition"));
  objc_msgSend(v2, "setWidth:", 120.0);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Movement"));
  objc_msgSend(v2, "setWidth:", 120.0);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Duration"));
  objc_msgSend(v2, "setWidth:", 120.0);

}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Segment"));
  objc_msgSend(v2, "setWidth:", 70.0);

}

__n128 __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke(uint64_t a1)
{
  __n128 result;
  CGRect v3;

  objc_msgSend(*(id *)(a1 + 32), "beginPage");
  objc_msgSend(*(id *)(a1 + 32), "currentPageBounds");
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectInset(v3, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = result;
  return result;
}

__n128 __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "endPage");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)MEMORY[0x1E0C9D628];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v2 + 32) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v2 + 48) = v4;
  return result;
}

uint64_t __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_3(_QWORD *a1)
{
  if (!CGRectIsNull(*(CGRect *)(*(_QWORD *)(a1[6] + 8) + 32)))
    (*(void (**)(void))(a1[4] + 16))();
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

double __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_4(uint64_t a1, double a2, double a3)
{
  CGFloat v5;
  CGFloat v6;
  double x;
  CGRect v9;

  v5 = a2 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  if (v5 > CGRectGetMaxX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)))
  {
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                           + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(a1 + 56)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
    v6 = a3 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v6 > CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)))
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  PXRectWithOriginAndSize();
  x = v9.origin.x;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectGetMaxX(v9);
  return x;
}

double __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_5(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v2 + 32) + a2;
  *(double *)(v2 + 32) = result;
  return result;
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  _QWORD *v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGContext *v28;
  id v29;
  unint64_t v30;
  __CFString **v31;
  __CFString *v32;
  void *v33;
  _QWORD v34[4];
  __CFString *v35;
  __int128 v36[7];
  uint64_t v37;
  _QWORD __dst[83];
  CGRect v39;
  CGRect v40;

  if (a2 >= 1)
  {
    __dst[65] = v12;
    __dst[66] = v11;
    __dst[67] = v10;
    __dst[68] = v9;
    __dst[69] = v8;
    __dst[70] = v7;
    __dst[81] = v5;
    __dst[82] = v6;
    v13 = a2;
    v15 = (_QWORD *)(a5 + 160);
    for (i = a4 + 16; ; i += 32)
    {
      v17 = (void *)MEMORY[0x1A85CE17C]();
      v18 = *(v15 - 19);
      v19 = *(v15 - 1);
      memcpy(__dst, v15, 0x200uLL);
      if (v18 == 1)
        break;
LABEL_11:
      v15 += 96;
      objc_autoreleasePoolPop(v17);
      if (!--v13)
        return;
    }
    PXRectNormalize();
    PXRectDenormalize();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    CGContextSaveGState(*(CGContextRef *)(a1 + 104));
    v39.origin.x = v21;
    v39.origin.y = v23;
    v39.size.width = v25;
    v39.size.height = v27;
    CGContextClipToRect(*(CGContextRef *)(a1 + 104), v39);
    v28 = *(CGContext **)(a1 + 104);
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v28, (CGColorRef)objc_msgSend(v29, "CGColor"));

    v40.origin.x = v21;
    v40.origin.y = v23;
    v40.size.width = v25;
    v40.size.height = v27;
    CGContextFillRect(*(CGContextRef *)(a1 + 104), v40);
    v30 = v19 - 3;
    if ((unint64_t)(v19 - 3) >= 3)
    {
      v36[4] = *(_OWORD *)&__dst[57];
      v36[5] = *(_OWORD *)&__dst[59];
      v36[6] = *(_OWORD *)&__dst[61];
      v37 = __dst[63];
      v36[0] = *(_OWORD *)&__dst[49];
      v36[1] = *(_OWORD *)&__dst[51];
      v36[2] = *(_OWORD *)&__dst[53];
      v36[3] = *(_OWORD *)&__dst[55];
      v30 = PXStoryClipKenBurnsAnimationInfoGetMovementType(v36) - 2;
      if (v30 >= 0xC)
      {
        v32 = 0;
        goto LABEL_10;
      }
      v31 = off_1E5120890;
    }
    else
    {
      v31 = off_1E5120878;
    }
    v32 = v31[v30];
LABEL_10:
    v33 = *(void **)(a1 + 32);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_7;
    v34[3] = &unk_1E5120258;
    v35 = v32;
    objc_msgSend(v33, "drawImageInRect:configuration:", v34, v21, v23, v25, v27);
    CGContextRestoreGState(*(CGContextRef *)(a1 + 104));

    goto LABEL_11;
  }
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_8(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a2;
  v4 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("#%li"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setFontSize:", 4.0);
  objc_msgSend(v5, "setRelativePosition:", 0.0, 1.0);

}

uint64_t __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSymbolName:", *(_QWORD *)(a1 + 32));
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_10(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;
  __CFString *v5;
  uint64_t v6;
  id v7;
  __CFString *v8;
  id v9;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = a2;
  if (v3 > 0xA)
    v5 = CFSTR("??");
  else
    v5 = off_1E5136018[v3];
  v8 = v5;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", *(_QWORD *)(a1 + 40)))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("⚠️(%@)"), v8);

    v7 = (id)v6;
  }
  else
  {
    v7 = v8;
  }
  v9 = v7;
  objc_msgSend(v4, "setText:", v7);
  objc_msgSend(v4, "setFontSize:", 7.0);
  objc_msgSend(v4, "setRelativePosition:", 0.5, 0.5);

}

uint64_t __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSymbolName:", *(_QWORD *)(a1 + 32));
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 7.0);
  objc_msgSend(v3, "setRelativePosition:", 0.0, 0.0);

}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 7.0);
  objc_msgSend(v3, "setRelativePosition:", 0.5, 0.0);

}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 7.0);
  objc_msgSend(v3, "setRelativePosition:", 0.5, 0.5);

}

@end
