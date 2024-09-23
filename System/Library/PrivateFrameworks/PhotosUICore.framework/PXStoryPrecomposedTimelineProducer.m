@implementation PXStoryPrecomposedTimelineProducer

- (PXStoryPrecomposedTimelineProducer)initWithTimelineKind:(unint64_t)a3
{
  PXStoryPrecomposedTimelineProducer *v4;

  v4 = -[PXStoryPrecomposedTimelineProducer init](self, "init");
  -[PXStoryPrecomposedTimelineProducer setTimelineKind:](v4, "setTimelineKind:", a3);
  return v4;
}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  void (**v7)(id, PXStoryProducerResult *);
  id v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  void *v16;
  PXStoryProducerResult *v17;

  v7 = (void (**)(id, PXStoryProducerResult *))a5;
  v8 = a3;
  objc_msgSend(v8, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewportSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nUpDividerWidth");
  self->_clipCompositionContext.viewportSize.width = v11;
  self->_clipCompositionContext.viewportSize.height = v13;
  self->_clipCompositionContext.dividerWidth = v15;
  self->_clipCompositionContext.singleAssetAspectRatio = 0.0;

  -[PXStoryPrecomposedTimelineProducer createTimelineWithConfiguration:](self, "createTimelineWithConfiguration:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v16);
  v7[2](v7, v17);

  return 0;
}

- (id)createTimelineWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  PXStoryMutableConcreteTimeline *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _PXStoryPrecomposedDisplayAssetsFetchResult *v21;
  void *v22;
  id v23;
  _PXStoryPrecomposedDisplayAssetsFetchResult *v24;
  id v25;
  id obj;
  PXStoryPrecomposedTimelineProducer *v28;
  uint64_t v29;
  uint64_t v30;
  PXStoryMutableConcreteTimeline *v31;
  void *v32;
  _OWORD v33[6];
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  PXStoryPrecomposedTimelineProducer *v38;
  id v39;
  _PXStoryPrecomposedDisplayAssetsFetchResult *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  _BYTE v53[40];
  CMTime v54;
  __int128 v55;
  _BYTE v56[32];
  __int128 v57;
  _OWORD v58[3];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PXStoryMutableConcreteTimeline alloc];
  objc_msgSend(v5, "viewportSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "resourcesDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PXStoryConcreteTimeline initWithSize:resourcesDataSource:](v6, "initWithSize:resourcesDataSource:", v11, v8, v10);

  v28 = self;
  v32 = v5;
  -[PXStoryPrecomposedTimelineProducer _segmentsForTimelineKind:spec:](self, "_segmentsForTimelineKind:spec:", -[PXStoryPrecomposedTimelineProducer timelineKind](self, "timelineKind"), v5);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v60;
    v12 = -1;
    while (2)
    {
      v13 = 0;
      v14 = v12;
      do
      {
        if (*(_QWORD *)v60 != v29)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v13);
        objc_msgSend(v15, "clipComposition");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "transitionKind");
        v18 = objc_msgSend(v16, "numberOfClips");
        objc_msgSend(v4, "resourcesDataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "numberOfDisplayAssetResources");
        v12 = v18 + v14;

        if (v20 < v18 + v14)
        {

          goto LABEL_11;
        }
        v21 = objc_alloc_init(_PXStoryPrecomposedDisplayAssetsFetchResult);
        objc_msgSend(v4, "resourcesDataSource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PXStoryPrecomposedDisplayAssetsFetchResult configureWithRange:resourcesDataSource:](v21, "configureWithRange:resourcesDataSource:", v14, v18, v22);

        CMTimeMakeWithSeconds(&v54, 4.0, 600);
        *(CMTime *)&v56[8] = v54;
        *(_QWORD *)v56 = 0;
        v55 = PXStoryTimeZero;
        memset(v58, 0, 40);
        v57 = PXStoryTimeMaximum;
        PXStorySegmentClipCompositionInfoFromComposition(v16, (uint64_t)v53);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __70__PXStoryPrecomposedTimelineProducer_createTimelineWithConfiguration___block_invoke;
        v36[3] = &unk_1E5142C10;
        v37 = v16;
        v38 = v28;
        v42 = v18;
        v39 = v32;
        v40 = v21;
        v23 = v4;
        v48 = v58[0];
        v49 = v58[1];
        v44 = v55;
        v45 = *(_OWORD *)v56;
        v46 = *(_OWORD *)&v56[16];
        v47 = v57;
        v33[4] = v58[0];
        v33[5] = v58[1];
        v33[0] = v55;
        v33[1] = *(_OWORD *)v56;
        v41 = v23;
        v43 = v14;
        v52 = v17;
        v50 = *(_QWORD *)&v58[2];
        v51 = 0;
        v33[2] = *(_OWORD *)&v56[16];
        v33[3] = v57;
        v34 = *(_QWORD *)&v58[2];
        v35 = 0;
        v24 = v21;
        v25 = v16;
        -[PXStoryMutableConcreteTimeline appendSegmentWithDurationInfo:clipCount:compositionInfo:configuration:](v31, "appendSegmentWithDurationInfo:clipCount:compositionInfo:configuration:", v33, v18, v53, v36);

        ++v13;
        v14 += v18;
      }
      while (v30 != v13);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v30)
        continue;
      break;
    }
  }
LABEL_11:

  return v31;
}

- (id)_segmentsForTimelineKind:(unint64_t)a3 spec:(id)a4
{
  id v7;
  void *v8;
  id v9;
  _PXStoryPrecomposedTimelineSegment *v10;
  void *v11;
  _PXStoryPrecomposedTimelineSegment *v12;
  _PXStoryPrecomposedTimelineSegment *v13;
  void *v14;
  _PXStoryPrecomposedTimelineSegment *v15;
  _PXStoryPrecomposedTimelineSegment *v16;
  void *v17;
  _PXStoryPrecomposedTimelineSegment *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _PXStoryPrecomposedTimelineSegment *v24;
  uint64_t v25;
  _PXStoryPrecomposedTimelineSegment *v26;
  void *v27;
  _PXStoryPrecomposedTimelineSegment *v28;
  _PXStoryPrecomposedTimelineSegment *v29;
  void *v30;
  _PXStoryPrecomposedTimelineSegment *v31;
  _PXStoryPrecomposedTimelineSegment *v32;
  void *v33;
  _PXStoryPrecomposedTimelineSegment *v34;
  _PXStoryPrecomposedTimelineSegment *v35;
  void *v36;
  _PXStoryPrecomposedTimelineSegment *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _PXStoryPrecomposedTimelineSegment *v42;
  _PXStoryPrecomposedTimelineSegment *v43;
  _PXStoryPrecomposedTimelineSegment *v44;
  _PXStoryPrecomposedTimelineSegment *v45;
  _PXStoryPrecomposedTimelineSegment *v46;
  _PXStoryPrecomposedTimelineSegment *v47;
  _PXStoryPrecomposedTimelineSegment *v48;
  _PXStoryPrecomposedTimelineSegment *v49;
  _PXStoryPrecomposedTimelineSegment *v50;
  _PXStoryPrecomposedTimelineSegment *v51;
  _PXStoryPrecomposedTimelineSegment *v52;
  _PXStoryPrecomposedTimelineSegment *v53;
  _PXStoryPrecomposedTimelineSegment *v54;
  _PXStoryPrecomposedTimelineSegment *v55;
  _PXStoryPrecomposedTimelineSegment *v56;
  _PXStoryPrecomposedTimelineSegment *v57;
  _PXStoryPrecomposedTimelineSegment *v58;
  _PXStoryPrecomposedTimelineSegment *v59;
  _PXStoryPrecomposedTimelineSegment *v60;
  _PXStoryPrecomposedTimelineSegment *v61;
  void *v62;
  _PXStoryPrecomposedTimelineSegment *v63;
  _PXStoryPrecomposedTimelineSegment *v64;
  void *v65;
  _PXStoryPrecomposedTimelineSegment *v66;
  _PXStoryPrecomposedTimelineSegment *v67;
  void *v68;
  _PXStoryPrecomposedTimelineSegment *v69;
  _PXStoryPrecomposedTimelineSegment *v70;
  void *v71;
  _PXStoryPrecomposedTimelineSegment *v72;
  _PXStoryPrecomposedTimelineSegment *v73;
  _PXStoryPrecomposedTimelineSegment *v74;
  _PXStoryPrecomposedTimelineSegment *v75;
  _PXStoryPrecomposedTimelineSegment *v76;
  _PXStoryPrecomposedTimelineSegment *v77;
  _PXStoryPrecomposedTimelineSegment *v78;
  _PXStoryPrecomposedTimelineSegment *v79;
  _PXStoryPrecomposedTimelineSegment *v80;
  _PXStoryPrecomposedTimelineSegment *v81;
  _PXStoryPrecomposedTimelineSegment *v82;
  _PXStoryPrecomposedTimelineSegment *v83;
  _PXStoryPrecomposedTimelineSegment *v84;
  _PXStoryPrecomposedTimelineSegment *v85;
  _PXStoryPrecomposedTimelineSegment *v86;
  _PXStoryPrecomposedTimelineSegment *v87;
  _PXStoryPrecomposedTimelineSegment *v88;
  _PXStoryPrecomposedTimelineSegment *v89;
  _PXStoryPrecomposedTimelineSegment *v90;
  _PXStoryPrecomposedTimelineSegment *v91;
  _PXStoryPrecomposedTimelineSegment *v92;
  _PXStoryPrecomposedTimelineSegment *v93;
  void *v94;
  _PXStoryPrecomposedTimelineSegment *v95;
  _PXStoryPrecomposedTimelineSegment *v96;
  void *v97;
  _PXStoryPrecomposedTimelineSegment *v98;
  _PXStoryPrecomposedTimelineSegment *v99;
  void *v100;
  _PXStoryPrecomposedTimelineSegment *v101;
  _PXStoryPrecomposedTimelineSegment *v102;
  void *v103;
  _PXStoryPrecomposedTimelineSegment *v104;
  void *v106;
  _PXStoryPrecomposedTimelineSegment *v107;
  void *v108;
  _PXStoryPrecomposedTimelineSegment *v109;
  void *v110;
  _PXStoryPrecomposedTimelineSegment *v111;
  void *v112;
  _PXStoryPrecomposedTimelineSegment *v113;
  void *v114;
  _PXStoryPrecomposedTimelineSegment *v115;
  void *v116;
  _PXStoryPrecomposedTimelineSegment *v117;
  void *v118;
  _PXStoryPrecomposedTimelineSegment *v119;
  void *v120;
  _PXStoryPrecomposedTimelineSegment *v121;
  void *v122;
  _PXStoryPrecomposedTimelineSegment *v123;
  void *v124;
  _PXStoryPrecomposedTimelineSegment *v125;
  void *v126;
  _PXStoryPrecomposedTimelineSegment *v127;
  void *v128;
  _PXStoryPrecomposedTimelineSegment *v129;
  void *v130;
  _PXStoryPrecomposedTimelineSegment *v131;
  void *v132;
  _PXStoryPrecomposedTimelineSegment *v133;
  void *v134;
  _PXStoryPrecomposedTimelineSegment *v135;
  void *v136;
  _PXStoryPrecomposedTimelineSegment *v137;
  void *v138;
  _PXStoryPrecomposedTimelineSegment *v139;
  void *v140;
  _PXStoryPrecomposedTimelineSegment *v141;
  void *v142;
  _PXStoryPrecomposedTimelineSegment *v143;
  void *v144;
  _PXStoryPrecomposedTimelineSegment *v145;
  void *v146;
  _PXStoryPrecomposedTimelineSegment *v147;
  _PXStoryPrecomposedTimelineSegment *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  _QWORD v152[25];
  _QWORD v153[22];
  _QWORD v154[5];
  _QWORD v155[5];

  v155[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPrecomposedTimelineProducer.m"), 121, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1uLL:
      v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v10 = [_PXStoryPrecomposedTimelineSegment alloc];
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v10, "initWithClipComposition:transitionKind:", v11, 1);
      v155[0] = v12;
      v13 = [_PXStoryPrecomposedTimelineSegment alloc];
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v13, "initWithClipComposition:transitionKind:", v14, 2);
      v155[1] = v15;
      v16 = [_PXStoryPrecomposedTimelineSegment alloc];
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v16, "initWithClipComposition:transitionKind:", v17, 3);
      v155[2] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v9, "initWithArray:", v19);

      -[PXStoryPrecomposedTimelineProducer _segmentsForTimelineKind:spec:](self, "_segmentsForTimelineKind:spec:", 2, v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v21);

      -[PXStoryPrecomposedTimelineProducer _segmentsForTimelineKind:spec:](self, "_segmentsForTimelineKind:spec:", 3, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v22);

      v23 = (void *)objc_msgSend(v20, "copy");
      goto LABEL_9;
    case 2uLL:
      v24 = [_PXStoryPrecomposedTimelineSegment alloc];
      v150 = v8;
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v25 = objc_claimAutoreleasedReturnValue();
      v148 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v24, "initWithClipComposition:transitionKind:", v25, 4);
      v154[0] = v148;
      v26 = [_PXStoryPrecomposedTimelineSegment alloc];
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v26, "initWithClipComposition:transitionKind:", v27, 5);
      v154[1] = v28;
      v29 = [_PXStoryPrecomposedTimelineSegment alloc];
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v29, "initWithClipComposition:transitionKind:", v30, 6);
      v154[2] = v31;
      v32 = [_PXStoryPrecomposedTimelineSegment alloc];
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v32, "initWithClipComposition:transitionKind:", v33, 7);
      v154[3] = v34;
      v35 = [_PXStoryPrecomposedTimelineSegment alloc];
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v35, "initWithClipComposition:transitionKind:", v36, 9);
      v154[4] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v150;
      v20 = (void *)v25;

      goto LABEL_9;
    case 3uLL:
      objc_msgSend(v7, "viewportSize");
      v39 = v38;
      v151 = v8;
      objc_msgSend(v8, "viewportSize");
      v41 = v40;
      v42 = [_PXStoryPrecomposedTimelineSegment alloc];
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v149 = objc_claimAutoreleasedReturnValue();
      if (v39 <= v41)
      {
        v147 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v42, "initWithClipComposition:transitionKind:", v149, 1);
        v152[0] = v147;
        v73 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v73, "initWithClipComposition:transitionKind:", v146, 8);
        v152[1] = v145;
        v74 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsTopOneThirdBottomComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsTopOneThirdBottomComposition");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v74, "initWithClipComposition:transitionKind:", v144, 8);
        v152[2] = v143;
        v75 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition](PXStoryClipCompositionFactory, "twoUpHalfTopHalfBottomComposition");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v75, "initWithClipComposition:transitionKind:", v142, 8);
        v152[3] = v141;
        v76 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v76, "initWithClipComposition:transitionKind:", v140, 8);
        v152[4] = v139;
        v77 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v77, "initWithClipComposition:transitionKind:", v138, 8);
        v152[5] = v137;
        v78 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory threeUpHorizontalThirdsComposition](PXStoryClipCompositionFactory, "threeUpHorizontalThirdsComposition");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v78, "initWithClipComposition:transitionKind:", v136, 1);
        v152[6] = v135;
        v79 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v79, "initWithClipComposition:transitionKind:", v134, 8);
        v152[7] = v133;
        v80 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpOneThirdTopTwoThirdsBottomComposition](PXStoryClipCompositionFactory, "twoUpOneThirdTopTwoThirdsBottomComposition");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v80, "initWithClipComposition:transitionKind:", v132, 1);
        v152[8] = v131;
        v81 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v81, "initWithClipComposition:transitionKind:", v130, 8);
        v152[9] = v129;
        v82 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsTopOneThirdBottomComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsTopOneThirdBottomComposition");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v82, "initWithClipComposition:transitionKind:", v128, 1);
        v152[10] = v127;
        v83 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v83, "initWithClipComposition:transitionKind:", v126, 8);
        v152[11] = v125;
        v84 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition](PXStoryClipCompositionFactory, "twoUpHalfTopHalfBottomComposition");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v84, "initWithClipComposition:transitionKind:", v124, 1);
        v152[12] = v123;
        v85 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsTopOneThirdBottomComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsTopOneThirdBottomComposition");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v85, "initWithClipComposition:transitionKind:", v122, 8);
        v152[13] = v121;
        v86 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v86, "initWithClipComposition:transitionKind:", v120, 1);
        v152[14] = v119;
        v87 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpOneThirdTopTwoThirdsBottomComposition](PXStoryClipCompositionFactory, "twoUpOneThirdTopTwoThirdsBottomComposition");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v87, "initWithClipComposition:transitionKind:", v118, 8);
        v152[15] = v117;
        v88 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v88, "initWithClipComposition:transitionKind:", v116, 1);
        v152[16] = v115;
        v89 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition](PXStoryClipCompositionFactory, "twoUpHalfTopHalfBottomComposition");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v89, "initWithClipComposition:transitionKind:", v114, 8);
        v152[17] = v113;
        v90 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v90, "initWithClipComposition:transitionKind:", v112, 1);
        v152[18] = v111;
        v91 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsTopOneThirdBottomComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsTopOneThirdBottomComposition");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v91, "initWithClipComposition:transitionKind:", v110, 8);
        v152[19] = v109;
        v92 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpOneThirdTopTwoThirdsBottomComposition](PXStoryClipCompositionFactory, "twoUpOneThirdTopTwoThirdsBottomComposition");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v92, "initWithClipComposition:transitionKind:", v108, 1);
        v152[20] = v107;
        v93 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition](PXStoryClipCompositionFactory, "twoUpHalfTopHalfBottomComposition");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v93, "initWithClipComposition:transitionKind:", v94, 8);
        v152[21] = v95;
        v96 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition](PXStoryClipCompositionFactory, "twoUpHalfTopHalfBottomComposition");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v96, "initWithClipComposition:transitionKind:", v97, 1);
        v152[22] = v98;
        v99 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v99, "initWithClipComposition:transitionKind:", v100, 1);
        v152[23] = v101;
        v102 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v102, "initWithClipComposition:transitionKind:", v103, 1);
        v152[24] = v104;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)v149;
      }
      else
      {
        v147 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v42, "initWithClipComposition:transitionKind:", v149, 8);
        v153[0] = v147;
        v43 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory threeUpVerticalThirdsComposition](PXStoryClipCompositionFactory, "threeUpVerticalThirdsComposition");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v43, "initWithClipComposition:transitionKind:", v146, 1);
        v153[1] = v145;
        v44 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsLeadingOneThirdTrailingComposition");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v44, "initWithClipComposition:transitionKind:", v144, 8);
        v153[2] = v143;
        v45 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v45, "initWithClipComposition:transitionKind:", v142, 1);
        v153[3] = v141;
        v46 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsLeadingOneThirdTrailingComposition");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v46, "initWithClipComposition:transitionKind:", v140, 8);
        v153[4] = v139;
        v47 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v47, "initWithClipComposition:transitionKind:", v138, 1);
        v153[5] = v137;
        v48 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfLeadingHalfTrailingComposition](PXStoryClipCompositionFactory, "twoUpHalfLeadingHalfTrailingComposition");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v48, "initWithClipComposition:transitionKind:", v136, 8);
        v153[6] = v135;
        v49 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v49, "initWithClipComposition:transitionKind:", v134, 1);
        v153[7] = v133;
        v50 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v50, "initWithClipComposition:transitionKind:", v132, 8);
        v153[8] = v131;
        v51 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfLeadingHalfTrailingComposition](PXStoryClipCompositionFactory, "twoUpHalfLeadingHalfTrailingComposition");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v51, "initWithClipComposition:transitionKind:", v130, 1);
        v153[9] = v129;
        v52 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v52, "initWithClipComposition:transitionKind:", v128, 8);
        v153[10] = v127;
        v53 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpOneThirdLeadingTwoThirdsTrailingComposition](PXStoryClipCompositionFactory, "twoUpOneThirdLeadingTwoThirdsTrailingComposition");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v53, "initWithClipComposition:transitionKind:", v126, 1);
        v153[11] = v125;
        v54 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v54, "initWithClipComposition:transitionKind:", v124, 8);
        v153[12] = v123;
        v55 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsLeadingOneThirdTrailingComposition");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v55, "initWithClipComposition:transitionKind:", v122, 1);
        v153[13] = v121;
        v56 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsLeadingOneThirdTrailingComposition");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v56, "initWithClipComposition:transitionKind:", v120, 8);
        v153[14] = v119;
        v57 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v57, "initWithClipComposition:transitionKind:", v118, 1);
        v153[15] = v117;
        v58 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition](PXStoryClipCompositionFactory, "twoUpTwoThirdsLeadingOneThirdTrailingComposition");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v58, "initWithClipComposition:transitionKind:", v116, 8);
        v153[16] = v115;
        v59 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpOneThirdLeadingTwoThirdsTrailingComposition](PXStoryClipCompositionFactory, "twoUpOneThirdLeadingTwoThirdsTrailingComposition");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v59, "initWithClipComposition:transitionKind:", v114, 1);
        v153[17] = v60;
        v61 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfLeadingHalfTrailingComposition](PXStoryClipCompositionFactory, "twoUpHalfLeadingHalfTrailingComposition");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v61, "initWithClipComposition:transitionKind:", v62, 8);
        v153[18] = v63;
        v64 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory twoUpHalfLeadingHalfTrailingComposition](PXStoryClipCompositionFactory, "twoUpHalfLeadingHalfTrailingComposition");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v64, "initWithClipComposition:transitionKind:", v65, 1);
        v153[19] = v66;
        v67 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v67, "initWithClipComposition:transitionKind:", v68, 1);
        v153[20] = v69;
        v70 = [_PXStoryPrecomposedTimelineSegment alloc];
        +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = -[_PXStoryPrecomposedTimelineSegment initWithClipComposition:transitionKind:](v70, "initWithClipComposition:transitionKind:", v71, 1);
        v153[21] = v72;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)v149;
      }

      v8 = v151;
LABEL_9:

      break;
    default:
      v23 = 0;
      break;
  }

  return v23;
}

- (unint64_t)timelineKind
{
  return self->_timelineKind;
}

- (void)setTimelineKind:(unint64_t)a3
{
  self->_timelineKind = a3;
}

void __70__PXStoryPrecomposedTimelineProducer_createTimelineWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v56 = a5;
  v55 = a3;
  v54 = a2;
  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getClipFrames:forContext:", a4, *(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(*(id *)(a1 + 48), "safeAreaInsets");
  objc_msgSend(*(id *)(a1 + 48), "viewportSize");
  PXRectWithOriginAndSize();
  v14 = PXEdgeInsetsForRectsFromEdgeInsetsForRect();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v17);
  v20 = &v52 - 2 * v18;
  if (v21 >= 1)
  {
    v22 = 0;
    v23 = v16;
    v24 = &v52 - 2 * v18;
    do
    {
      *(_QWORD *)v23 = 0;
      *((_QWORD *)v23 + 1) = 0;
      *((_QWORD *)v23 + 2) = 0;
      objc_msgSend(*(id *)(a1 + 56), "storyDisplayAssetAtIndex:", v22, v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryStyleDefaultContentInfoForDisplayAsset(v25, (uint64_t)&v58);
      v26 = v65;
      *((_OWORD *)v24 + 6) = v64;
      *((_OWORD *)v24 + 7) = v26;
      *((_OWORD *)v24 + 8) = v66;
      v27 = v61;
      *((_OWORD *)v24 + 2) = v60;
      *((_OWORD *)v24 + 3) = v27;
      v28 = v63;
      *((_OWORD *)v24 + 4) = v62;
      *((_OWORD *)v24 + 5) = v28;
      v29 = v59;
      *(_OWORD *)v24 = v58;
      *((_OWORD *)v24 + 1) = v29;
      v24 += 18;

      ++v22;
      v23 += 24;
    }
    while (v22 < *(_QWORD *)(a1 + 72));
  }
  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(_QWORD *)(a1 + 48);
  v32 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "resourcesDataSource", v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "croppingContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __70__PXStoryPrecomposedTimelineProducer_createTimelineWithConfiguration___block_invoke_2;
  v57[3] = &unk_1E5142BE8;
  v57[4] = *(_QWORD *)(a1 + 40);
  +[PXStoryClipKenBurnsEffectFactory factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:](PXStoryClipKenBurnsEffectFactory, "factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:", v31, v30, v32, v34, 1, v20, v56, v16, v57);

  v53 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "clipAssetIndexes");
  if (*(uint64_t *)(a1 + 72) >= 1)
  {
    v35 = 0;
    v52 = a12;
    do
    {
      v38 = *(_QWORD *)(a1 + 80) + *(_QWORD *)(v53 + 8 * v35);
      *(_QWORD *)(v54 + 8 * v35) = 1;
      v39 = v55;
      *(_QWORD *)(v55 + 8 * v35) = v38;
      *(_QWORD *)(v56 + 8 * v35) = 1;
      if (*(_QWORD *)(v39 + 8 * v35) == -1)
        *(_QWORD *)(v52 + 8 * v35) |= 2uLL;
      PXStoryTransitionInfoMakeDefault(*(char *)(a1 + 200), (uint64_t)&v58, 1.0);
      v40 = v59;
      *(_OWORD *)a10 = v58;
      *(_OWORD *)(a10 + 16) = v40;
      *(_QWORD *)(a10 + 32) = v60;
      v41 = *((_OWORD *)v20 + 7);
      a6[6] = *((_OWORD *)v20 + 6);
      a6[7] = v41;
      a6[8] = *((_OWORD *)v20 + 8);
      v42 = *((_OWORD *)v20 + 3);
      a6[2] = *((_OWORD *)v20 + 2);
      a6[3] = v42;
      v43 = *((_OWORD *)v20 + 5);
      a6[4] = *((_OWORD *)v20 + 4);
      a6[5] = v43;
      v45 = *(_OWORD *)v20;
      v44 = *((_OWORD *)v20 + 1);
      v20 += 18;
      *a6 = v45;
      a6[1] = v44;
      a6 += 9;
      v46 = *(_QWORD *)(a1 + 40);
      v47 = *(_OWORD *)(v46 + 56);
      v58 = *(_OWORD *)(v46 + 40);
      v59 = v47;
      v60 = *(_OWORD *)(v46 + 72);
      v48 = *(_OWORD *)(v46 + 104);
      v61 = *(_OWORD *)(v46 + 88);
      v62 = v48;
      v63 = *(_OWORD *)(v46 + 120);
      *(_QWORD *)&v65 = *(_QWORD *)(a1 + 128);
      v64 = *(_OWORD *)(a1 + 112);
      v49 = v63;
      *(_OWORD *)(a9 + 64) = v48;
      *(_OWORD *)(a9 + 80) = v49;
      *(_QWORD *)(a9 + 112) = v65;
      *(_OWORD *)(a9 + 96) = v64;
      v50 = v59;
      *(_OWORD *)a9 = v58;
      *(_OWORD *)(a9 + 16) = v50;
      v51 = v61;
      ++v35;
      *(_OWORD *)(a9 + 32) = v60;
      *(_OWORD *)(a9 + 48) = v51;
      a9 += 120;
      a10 += 40;
    }
    while (v35 < *(_QWORD *)(a1 + 72));
  }
}

uint64_t __70__PXStoryPrecomposedTimelineProducer_createTimelineWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getParametersForNoEffect:", *(_QWORD *)(a1 + 32) + 40);
}

@end
