@implementation PXStoryTransitionProducer

- (id)transitionsWithConfiguration:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  PXStoryTransitionProducerSegment *v12;
  PXStoryTransitionProducerSegment *v13;
  PXStoryTransitionProducerSegment *v14;
  PXStoryTransitionProducerSegment *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v47;
  void *v49;
  PXStoryTransitionProducerSegment *v50;
  PXStoryTransitionProducerSegment *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  PXStoryTransitionProducerSegment *v62;
  PXStoryTransitionProducerSegment *v63;
  id v64;
  _BYTE buf[48];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  _OWORD v77[2];
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
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _OWORD v94[3];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionModel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v53, "segmentTransitionInfo");
  v8 = v7;
  objc_msgSend(v3, "entityManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  memset(v94, 0, sizeof(v94));
  v91 = 0u;
  v92 = 0u;
  v47 = v4;
  v49 = v5;
  if (v5)
  {
    objc_msgSend(v5, "infoForSegmentWithIdentifier:", v6);
    v90 = 0;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(v5, "infoForSegmentWithIdentifier:", v8);
    v10 = v94[0];
  }
  else
  {
    v10 = 0;
    v90 = 0;
    v88 = 0uLL;
    v89 = 0uLL;
    v86 = 0uLL;
    v87 = 0uLL;
    v84 = 0uLL;
    v85 = 0uLL;
    v82 = 0uLL;
    v83 = 0uLL;
    v80 = 0uLL;
    v81 = 0uLL;
    v78 = 0uLL;
    v79 = 0uLL;
  }
  v76 = *(_OWORD *)((char *)v94 + 1);
  v77[0] = *(_OWORD *)((char *)&v94[1] + 1);
  *(_QWORD *)((char *)v77 + 15) = *(_QWORD *)&v94[2];
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = [PXStoryTransitionProducerSegment alloc];
  v73 = v88;
  v74 = v89;
  v75 = v90;
  v69 = v84;
  v70 = v85;
  v71 = v86;
  v72 = v87;
  *(_OWORD *)&buf[32] = v80;
  v66 = v81;
  v67 = v82;
  v68 = v83;
  *(_OWORD *)buf = v78;
  *(_OWORD *)&buf[16] = v79;
  v13 = -[PXStoryTransitionProducerSegment initWithSegmentInfo:](v12, "initWithSegmentInfo:", buf);
  v14 = [PXStoryTransitionProducerSegment alloc];
  v73 = v99;
  v74 = v100;
  v75 = v101;
  v69 = v95;
  v70 = v96;
  v71 = v97;
  v72 = v98;
  *(_OWORD *)&buf[32] = v93;
  v66 = v94[0];
  v67 = v94[1];
  v68 = v94[2];
  *(_OWORD *)buf = v91;
  *(_OWORD *)&buf[16] = v92;
  v15 = -[PXStoryTransitionProducerSegment initWithSegmentInfo:](v14, "initWithSegmentInfo:", buf);
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke;
  v60[3] = &unk_1E51216C0;
  v16 = v9;
  v61 = v16;
  v51 = v13;
  v62 = v51;
  v50 = v15;
  v63 = v50;
  v17 = v11;
  v64 = v17;
  objc_msgSend(v53, "enumerateClipIdentifiersUsingBlock:", v60);
  objc_msgSend(v3, "timelineSpec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allowedTransitionKinds");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v18, "allowedTransitionKinds");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsIndex:", 1);

    if (!v21)
      goto LABEL_12;
  }
  else
  {

  }
  if (!+[PXStoryTransitionProducer isSupportedTransitionWithKind:fromSegmentIdentifier:toSegmentIdentifier:inTimeline:](PXStoryTransitionProducer, "isSupportedTransitionWithKind:fromSegmentIdentifier:toSegmentIdentifier:inTimeline:", v10, v6, v8, v49))
  {
    PXAssertGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Encountered unexpected invalid transition.", buf, 2u);
    }

  }
LABEL_12:
  if (objc_msgSend(v17, "count"))
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Transition source failed to provide layouts for clips: %@. Falling back to cut."), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryTransitionProducer _recordFallbackToCutTransitionBetweenSegmentWithIdentifier:andSegmentWithIdentifier:reason:](self, "_recordFallbackToCutTransitionBetweenSegmentWithIdentifier:andSegmentWithIdentifier:reason:", v6, v8, v25);
    objc_msgSend(v3, "timelineSpec");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v26, "fallbackTransitionKind");

  }
  objc_msgSend(v18, "viewportSize");
  v28 = v27;
  objc_msgSend(v16, "transitionViewport");
  v30 = v29;
  v32 = v31;
  objc_msgSend(v18, "nUpDividerWidth");
  if (v10 == 5)
  {
    buf[0] = v10;
    *(_OWORD *)&buf[1] = v76;
    *(_OWORD *)&buf[17] = v77[0];
    *(_QWORD *)&buf[32] = *(_QWORD *)((char *)v77 + 15);
    -[PXStoryTransitionProducer _panTransitionsForOrderOutSegment:orderInSegment:viewportSize:transitionInfo:](self, "_panTransitionsForOrderOutSegment:orderInSegment:viewportSize:transitionInfo:", v50, v51, buf, v30, v32);
    v34 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v10 == 8)
  {
    buf[0] = v10;
    *(_OWORD *)&buf[1] = v76;
    *(_OWORD *)&buf[17] = v77[0];
    *(_QWORD *)&buf[32] = *(_QWORD *)((char *)v77 + 15);
    -[PXStoryTransitionProducer _wipeTransitionsForOrderOutSegment:orderInSegment:viewportSize:dividerWidth:transitionInfo:](self, "_wipeTransitionsForOrderOutSegment:orderInSegment:viewportSize:dividerWidth:transitionInfo:", v50, v51, buf, v30, v32, v33 * (v30 / v28));
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v35 = (void *)v34;
    objc_msgSend(v47, "addObjectsFromArray:", v34);
    goto LABEL_20;
  }
  -[PXStoryTransitionProducerSegment clipLayouts](v50, "clipLayouts");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v18, "storyTransitionCurveType");
  buf[0] = v10;
  *(_OWORD *)&buf[1] = v76;
  *(_OWORD *)&buf[17] = v77[0];
  *(_QWORD *)&buf[32] = *(_QWORD *)((char *)v77 + 15);
  +[PXStoryTransitionFactory segmentTransitionWithInfo:event:clipLayouts:storyTransitionCurveType:](PXStoryTransitionFactory, "segmentTransitionWithInfo:event:clipLayouts:storyTransitionCurveType:", buf, 2, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v38);

  -[PXStoryTransitionProducerSegment clipLayouts](v51, "clipLayouts");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v18, "storyTransitionCurveType");
  buf[0] = v10;
  *(_OWORD *)&buf[1] = v76;
  *(_OWORD *)&buf[17] = v77[0];
  *(_QWORD *)&buf[32] = *(_QWORD *)((char *)v77 + 15);
  +[PXStoryTransitionFactory segmentTransitionWithInfo:event:clipLayouts:storyTransitionCurveType:](PXStoryTransitionFactory, "segmentTransitionWithInfo:event:clipLayouts:storyTransitionCurveType:", buf, 1, v35, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v40);

LABEL_20:
  buf[0] = v10;
  *(_OWORD *)&buf[1] = v76;
  *(_OWORD *)&buf[17] = v77[0];
  *(_QWORD *)&buf[32] = *(_QWORD *)((char *)v77 + 15);
  +[PXStoryTransitionFactory effectTransitionWithInfo:entityManager:](PXStoryTransitionFactory, "effectTransitionWithInfo:entityManager:", buf, v52);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "effect");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "auxiliaryEffect");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    objc_msgSend(v16, "didBeginTransitionWithEffect:auxiliaryEffect:", v42, v43);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke_41;
    v58[3] = &unk_1E51216E8;
    v44 = v16;
    v59 = v44;
    objc_msgSend(v41, "setEffectAlphaHandler:", v58);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke_2;
    v54[3] = &unk_1E5142230;
    v55 = v44;
    v56 = v42;
    v57 = v43;
    objc_msgSend(v41, "setCompletionHandler:", v54);
    objc_msgSend(v47, "addObject:", v41);

  }
  v45 = (void *)objc_msgSend(v47, "copy");

  return v45;
}

- (void)_recordFallbackToCutTransitionBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4 reason:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v8 = a5;
  -[PXStoryTransitionProducer fallbackTransitionReasons](self, "fallbackTransitionReasons");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld → %ld: %@"), a3, a4, v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "arrayByAddingObject:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryTransitionProducer setFallbackTransitionReasons:](self, "setFallbackTransitionReasons:", v13);
}

- (id)_wipeTransitionsForOrderOutSegment:(id)a3 orderInSegment:(id)a4 viewportSize:(CGSize)a5 dividerWidth:(double)a6 transitionInfo:(id *)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  int v25;
  PXStoryWipeTransitionConfiguration *v26;
  PXStoryWipeTransitionConfiguration *v27;
  void **v28;
  PXStoryWipeTransitionConfiguration *v29;
  id *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  PXStoryWipeTransitionConfiguration *v34;
  PXStoryWipeTransitionConfiguration *v35;
  id v36;
  __int128 v37;
  uint64_t v38;
  PXStoryWipeTransitionConfiguration *v39;
  void *v40;
  PXStoryWipeTransitionConfiguration *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void **v45;
  PXStoryWipeTransitionConfiguration *v46;
  id *v47;
  id v48;
  __int128 v49;
  uint64_t v50;
  PXStoryWipeTransitionConfiguration *v51;
  uint64_t v52;
  PXStoryWipeTransitionConfiguration *v53;
  void (*v54)(uint64_t, uint64_t, uint64_t, uint64_t, const void *, void *);
  uint64_t *v55;
  PXStoryWipeTransitionConfiguration *v56;
  PXStoryWipeTransitionConfiguration *v57;
  void *v58;
  void *v59;
  PXStoryWipeTransitionConfiguration *v61;
  PXStoryWipeTransitionConfiguration *v62;
  _QWORD *v63;
  PXStoryWipeTransitionConfiguration *v64;
  __int128 v65;
  PXStoryWipeTransitionConfiguration *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[4];
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[4];
  _QWORD v80[4];
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[4];
  _QWORD v84[7];
  _QWORD v85[4];
  _QWORD v86[7];
  _QWORD v87[4];
  PXStoryWipeTransitionConfiguration *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  double v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  CGFloat v104;
  CGFloat v105;
  _QWORD v106[4];
  _QWORD v107[7];
  _QWORD v108[4];
  _QWORD v109[3];
  _QWORD v110[4];
  _QWORD v111[3];
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[4];
  _QWORD v117[3];
  _QWORD v118[4];
  PXStoryWipeTransitionConfiguration *v119;
  id v120;
  uint64_t v121;
  double v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  _QWORD v126[4];
  _QWORD v127[2];
  __int128 v128;
  double v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD v132[4];
  PXStoryWipeTransitionConfiguration *v133;
  uint64_t v134;
  __int128 v135;
  double v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD v139[4];
  PXStoryWipeTransitionConfiguration *v140;
  id v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  uint64_t v145;
  double v146;
  __int128 v147;
  uint64_t v148;
  _QWORD aBlock[6];
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint64_t v175;

  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a4;
  if (v14)
  {
    objc_msgSend(v14, "segmentInfo");
    v16 = *((_QWORD *)&v163 + 1);
    v18 = *((_QWORD *)&v164 + 1);
    v17 = v164;
    v67 = *((_QWORD *)&v165 + 1);
    v19 = *(double *)&v165;
  }
  else
  {
    v67 = 0;
    v18 = 0;
    v17 = 0;
    v16 = 0;
    v173 = 0u;
    v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    v163 = 0u;
    v164 = 0u;
    v19 = 0.0;
    v175 = 0;
  }
  v73 = v15;
  v74 = v14;
  if (v15)
  {
    objc_msgSend(v15, "segmentInfo");
    v20 = *((_QWORD *)&v150 + 1);
    v70 = *((_QWORD *)&v152 + 1);
    v21 = *(double *)&v152;
    v69 = v151;
  }
  else
  {
    v70 = 0;
    v69 = 0uLL;
    v20 = 0;
    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    v21 = 0.0;
    v162 = 0;
  }
  v68 = v18;
  v71 = PXAxisTransposed();
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke;
  aBlock[3] = &unk_1E5121710;
  aBlock[5] = a2;
  aBlock[4] = self;
  v72 = _Block_copy(aBlock);
  v24 = v20 == 1 && v16 == 2;
  v25 = v24;
  if (v24)
  {
    if (BYTE5(a7->var2.var3) != 2)
      goto LABEL_16;
    goto LABEL_22;
  }
  if (v20 == 1 && v16 == 3)
  {
LABEL_22:
    v34 = [PXStoryWipeTransitionConfiguration alloc];
    v147 = *(_OWORD *)(&a7->var1 + 3);
    v148 = *(_QWORD *)&a7->var2.var2;
    v139[0] = v23;
    v139[1] = 3221225472;
    v139[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_48;
    v139[3] = &unk_1E5121760;
    v35 = -[PXStoryWipeTransitionConfiguration initWithDuration:](v34, "initWithDuration:", &v147);
    v140 = v35;
    v142 = v71;
    v36 = v72;
    v37 = *(_OWORD *)&a7->var2.var1;
    v143 = *(_OWORD *)&a7->var0;
    v144 = v37;
    v38 = *(_QWORD *)&a7->var3;
    v141 = v36;
    v145 = v38;
    v146 = a6;
    objc_msgSend(v14, "enumerateClipsUsingBlock:", v139);
    v132[0] = MEMORY[0x1E0C809B0];
    v132[1] = 3221225472;
    v132[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_3;
    v132[3] = &unk_1E51217B0;
    v133 = v35;
    v134 = v20;
    v135 = v69;
    v136 = v21;
    v137 = v70;
    v138 = v71;
    v39 = v35;
    objc_msgSend(v73, "enumerateClipsUsingBlock:", v132);
    +[PXStoryTransitionFactory wipeTransitionWithConfiguration:](PXStoryTransitionFactory, "wipeTransitionWithConfiguration:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v40);

    v23 = MEMORY[0x1E0C809B0];
  }
  switch(v16)
  {
    case 3:
      if (v20 == 2)
      {
        v51 = [PXStoryWipeTransitionConfiguration alloc];
        v147 = *(_OWORD *)(&a7->var1 + 3);
        v148 = *(_QWORD *)&a7->var2.var2;
        v27 = -[PXStoryWipeTransitionConfiguration initWithDuration:](v51, "initWithDuration:", &v147);
LABEL_45:
        +[PXStoryTransitionFactory wipeTransitionWithConfiguration:](PXStoryTransitionFactory, "wipeTransitionWithConfiguration:", v27);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v58);

        break;
      }
      break;
    case 2:
      if (!v25)
      {
        v56 = [PXStoryWipeTransitionConfiguration alloc];
        v147 = *(_OWORD *)(&a7->var1 + 3);
        v148 = *(_QWORD *)&a7->var2.var2;
        v57 = -[PXStoryWipeTransitionConfiguration initWithDuration:](v56, "initWithDuration:", &v147);
        v27 = v57;
        if (v20 == 3)
        {
          if (v71 == 2)
          {
            v81[0] = v23;
            v81[1] = 3221225472;
            v81[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_28;
            v81[3] = &unk_1E5121960;
            v28 = (void **)v82;
            v62 = v57;
            v82[0] = v62;
            *(CGFloat *)&v82[1] = width;
            *(CGFloat *)&v82[2] = height;
            *(double *)&v82[3] = a6;
            objc_msgSend(v14, "enumerateClipsUsingBlock:", v81);
            v79[0] = v23;
            v79[1] = 3221225472;
            v79[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_30;
            v79[3] = &unk_1E5121960;
            v30 = (id *)v80;
            v27 = v62;
            v80[0] = v27;
            *(double *)&v80[1] = a6;
            *(CGFloat *)&v80[2] = width;
            *(CGFloat *)&v80[3] = height;
            v63 = v79;
          }
          else
          {
            v77[0] = v23;
            v77[1] = 3221225472;
            v77[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_32;
            v77[3] = &unk_1E5121960;
            v28 = (void **)v78;
            v66 = v57;
            v78[0] = v66;
            *(CGFloat *)&v78[1] = width;
            *(CGFloat *)&v78[2] = height;
            *(double *)&v78[3] = a6;
            objc_msgSend(v14, "enumerateClipsUsingBlock:", v77);
            v75[0] = v23;
            v75[1] = 3221225472;
            v75[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_34;
            v75[3] = &unk_1E5121960;
            v30 = (id *)v76;
            v27 = v66;
            v76[0] = v27;
            *(double *)&v76[1] = a6;
            *(CGFloat *)&v76[2] = width;
            *(CGFloat *)&v76[3] = height;
            v63 = v75;
          }
          objc_msgSend(v73, "enumerateClipsUsingBlock:", v63);
          goto LABEL_19;
        }
        if (v20 == 2)
        {
          if (v19 <= v21)
          {
            v106[0] = v23;
            v106[1] = 3221225472;
            v106[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_20;
            v106[3] = &unk_1E51217B0;
            v28 = (void **)v107;
            v64 = v57;
            v107[0] = v64;
            *(double *)&v107[1] = v21;
            *(double *)&v107[2] = v19;
            v107[3] = v71;
            *(double *)&v107[4] = a6;
            *(CGFloat *)&v107[5] = width;
            *(CGFloat *)&v107[6] = height;
            objc_msgSend(v14, "enumerateClipsUsingBlock:", v106);
            v87[0] = v23;
            v87[1] = 3221225472;
            v87[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_22;
            v87[3] = &unk_1E5121918;
            v30 = (id *)&v88;
            v27 = v64;
            v88 = v27;
            v89 = v72;
            v65 = *(_OWORD *)&a7->var2.var1;
            v90 = *(_OWORD *)&a7->var0;
            v91 = v65;
            v92 = *(_QWORD *)&a7->var3;
            v93 = 2;
            v94 = v17;
            v95 = v68;
            v96 = v19;
            v97 = v67;
            v98 = 2;
            v99 = v69;
            v100 = v21;
            v101 = v70;
            v102 = v71;
            v103 = a6;
            v104 = width;
            v105 = height;
            objc_msgSend(v73, "enumerateClipsUsingBlock:", v87);

            goto LABEL_19;
          }
          v85[0] = v23;
          v85[1] = 3221225472;
          v85[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_24;
          v85[3] = &unk_1E51217B0;
          v28 = (void **)v86;
          v61 = v57;
          v86[0] = v61;
          *(double *)&v86[1] = v21;
          *(double *)&v86[2] = v19;
          v86[3] = v71;
          *(double *)&v86[4] = a6;
          *(CGFloat *)&v86[5] = width;
          *(CGFloat *)&v86[6] = height;
          objc_msgSend(v14, "enumerateClipsUsingBlock:", v85);
          v83[0] = v23;
          v83[1] = 3221225472;
          v83[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_26;
          v83[3] = &unk_1E51217B0;
          v30 = (id *)v84;
          v27 = v61;
          v84[0] = v27;
          *(double *)&v84[1] = v19;
          *(double *)&v84[2] = v21;
          v84[3] = v71;
          *(double *)&v84[4] = a6;
          *(CGFloat *)&v84[5] = width;
          *(CGFloat *)&v84[6] = height;
          v31 = v83;
          v32 = v73;
LABEL_18:
          objc_msgSend(v32, "enumerateClipsUsingBlock:", v31);
LABEL_19:

          v33 = *v28;
LABEL_44:

          goto LABEL_45;
        }
        if (v20 != 1)
          goto LABEL_45;
LABEL_17:
        v110[0] = v23;
        v110[1] = 3221225472;
        v110[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_16;
        v110[3] = &unk_1E51217F8;
        v28 = (void **)v111;
        v29 = v27;
        v111[0] = v29;
        v111[1] = v71;
        *(double *)&v111[2] = v19;
        objc_msgSend(v73, "enumerateClipsUsingBlock:", v110);
        v108[0] = v23;
        v108[1] = 3221225472;
        v108[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_18;
        v108[3] = &unk_1E51217F8;
        v30 = (id *)v109;
        v27 = v29;
        v109[0] = v27;
        v109[1] = v71;
        *(double *)&v109[2] = a6;
        v31 = v108;
        v32 = v14;
        goto LABEL_18;
      }
      if (BYTE5(a7->var2.var3) == 2)
        break;
LABEL_16:
      v26 = [PXStoryWipeTransitionConfiguration alloc];
      v147 = *(_OWORD *)(&a7->var1 + 3);
      v148 = *(_QWORD *)&a7->var2.var2;
      v27 = -[PXStoryWipeTransitionConfiguration initWithDuration:](v26, "initWithDuration:", &v147);
      goto LABEL_17;
    case 1:
      v41 = [PXStoryWipeTransitionConfiguration alloc];
      v147 = *(_OWORD *)(&a7->var1 + 3);
      v148 = *(_QWORD *)&a7->var2.var2;
      v27 = -[PXStoryWipeTransitionConfiguration initWithDuration:](v41, "initWithDuration:", &v147);
      +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "useSplitWipeTransitionsFromOneUp");

      if (v43)
      {
        v126[0] = v23;
        v126[1] = 3221225472;
        v126[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_5;
        v126[3] = &unk_1E51217B0;
        v44 = v23;
        v45 = (void **)v127;
        v46 = v27;
        v127[0] = v46;
        v127[1] = v20;
        v128 = v69;
        v129 = v21;
        v130 = v70;
        v131 = v71;
        objc_msgSend(v74, "enumerateClipsUsingBlock:", v126);
        v118[0] = v44;
        v118[1] = 3221225472;
        v118[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_7;
        v118[3] = &unk_1E5121760;
        v47 = (id *)&v119;
        v119 = v46;
        v121 = v71;
        v122 = a6;
        v48 = v72;
        v49 = *(_OWORD *)&a7->var2.var1;
        v123 = *(_OWORD *)&a7->var0;
        v124 = v49;
        v50 = *(_QWORD *)&a7->var3;
        v120 = v48;
        v125 = v50;
        objc_msgSend(v73, "enumerateClipsUsingBlock:", v118);

      }
      else
      {
        v52 = v23;
        v116[0] = v23;
        v116[1] = 3221225472;
        v116[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_9;
        v116[3] = &unk_1E51217F8;
        v45 = (void **)v117;
        v53 = v27;
        v117[0] = v53;
        v117[1] = v71;
        *(double *)&v117[2] = a6;
        objc_msgSend(v14, "enumerateClipsUsingBlock:", v116);
        if (v20 == 3)
        {
          v47 = (id *)&v113;
          v112 = v52;
          v54 = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_14;
          v55 = &v112;
        }
        else
        {
          if (v20 != 2)
          {
LABEL_43:
            v33 = *v45;
            goto LABEL_44;
          }
          v47 = (id *)&v115;
          v114 = v52;
          v54 = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_11;
          v55 = &v114;
        }
        v55[1] = 3221225472;
        v55[2] = (uint64_t)v54;
        v55[3] = (uint64_t)&unk_1E5121860;
        v55[5] = v20;
        *((_OWORD *)v55 + 3) = v69;
        *((double *)v55 + 8) = v21;
        v55[9] = v70;
        v55[4] = (uint64_t)v53;
        v55[10] = v71;
        *((CGFloat *)v55 + 11) = width;
        *((CGFloat *)v55 + 12) = height;
        *((double *)v55 + 13) = a6;
        objc_msgSend(v73, "enumerateClipsUsingBlock:", v55);
      }

      goto LABEL_43;
  }
  v59 = (void *)objc_msgSend(v22, "copy");

  return v59;
}

- (id)_panTransitionsForOrderOutSegment:(id)a3 orderInSegment:(id)a4 viewportSize:(CGSize)a5 transitionInfo:(id *)a6
{
  id v8;
  id v9;
  int var0;
  int v11;
  char v12;
  unsigned __int8 v13;
  uint64_t v14;
  __int16 v15;
  char v16;
  id v17;
  NSObject *v18;
  PXStoryPanTransitionConfiguration *v19;
  PXStoryPanTransitionConfiguration *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  PXStoryPanTransitionConfiguration *v40;
  PXStoryPanTransitionConfiguration *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[16];
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((a6->var1 & 1) != 0)
  {
    var0 = a6->var0;
    v11 = SBYTE5(a6->var2.var3);
    v12 = BYTE5(a6->var2.var3);
    v13 = a6->var1 ^ 1;
    if (var0 == 5)
    {
      if (v11 == 1)
      {
        v12 = 2;
      }
      else if (v11 == 2)
      {
        v12 = 1;
      }
    }
    a6->var0 = var0;
    a6->var1 = v13;
    v14 = *(_QWORD *)((char *)&a6->var2.var1 + 2);
    v15 = WORD1(a6->var2.var3);
    v16 = BYTE4(a6->var2.var3);
    *(_OWORD *)(&a6->var1 + 1) = *(_OWORD *)(&a6->var1 + 1);
    BYTE4(a6->var2.var3) = v16;
    WORD1(a6->var2.var3) = v15;
    *(_QWORD *)((char *)&a6->var2.var1 + 2) = v14;
    BYTE5(a6->var2.var3) = v12;
  }
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v73 = *(_OWORD *)(&a6->var1 + 3);
  v74 = *(_QWORD *)&a6->var2.var2;
  switch(BYTE5(a6->var2.var3))
  {
    case 0:
      PXAssertGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "undefined transition pan direction", buf, 2u);
      }

      break;
    default:
      break;
  }
  v19 = [PXStoryPanTransitionConfiguration alloc];
  *(_OWORD *)buf = v73;
  v72 = v74;
  v20 = -[PXStoryPanTransitionConfiguration initWithDuration:](v19, "initWithDuration:", buf);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v8, "clipLayouts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v68 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v26, "contentSize");
        PXRectWithOriginAndSize();
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;
        objc_msgSend(v26, "contentSize");
        PXRectWithOriginAndSize();
        -[PXStoryPanTransitionConfiguration addClipLayout:sourceRect:targetRect:](v20, "addClipLayout:sourceRect:targetRect:", v26, v28, v30, v32, v34, v35, v36, v37, v38);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v23);
  }

  +[PXStoryTransitionFactory panTransitionWithConfiguration:](PXStoryTransitionFactory, "panTransitionWithConfiguration:", v20);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v39);

  v40 = [PXStoryPanTransitionConfiguration alloc];
  *(_OWORD *)buf = v73;
  v72 = v74;
  v41 = -[PXStoryPanTransitionConfiguration initWithDuration:](v40, "initWithDuration:", buf);
  PXPointSubtract();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v9, "clipLayouts", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v64 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
        objc_msgSend(v47, "contentSize");
        PXRectWithOriginAndSize();
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v55 = v54;
        objc_msgSend(v47, "contentSize");
        PXRectWithOriginAndSize();
        -[PXStoryPanTransitionConfiguration addClipLayout:sourceRect:targetRect:](v41, "addClipLayout:sourceRect:targetRect:", v47, v49, v51, v53, v55, v56, v57, v58, v59);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v44);
  }

  +[PXStoryTransitionFactory panTransitionWithConfiguration:](PXStoryTransitionFactory, "panTransitionWithConfiguration:", v41);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v60);

  v61 = (void *)objc_msgSend(v17, "copy");
  return v61;
}

- (NSArray)fallbackTransitionReasons
{
  return self->_fallbackTransitionReasons;
}

- (void)setFallbackTransitionReasons:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackTransitionReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTransitionReasons, 0);
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke(uint64_t a1, char a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  NSObject *v8;
  uint8_t v10[16];
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    if ((a2 & 1) != 0)
      v5 = 1;
    else
      v5 = 2;
    if ((a2 & 1) != 0)
      v6 = 2;
    else
      v6 = 1;
    if (a3 == 1)
      v7 = v6;
    else
      v7 = 1;
    if (a3 == 2)
      return v5;
  }
  else
  {
    v11 = v3;
    v12 = v4;
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_1A6789000, v8, OS_LOG_TYPE_FAULT, "Unsupported asset direction", v10, 2u);
    }

    return 1;
  }
  return v7;
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[768];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_2;
  v21[3] = &unk_1E5121738;
  memcpy(v23, a5, sizeof(v23));
  v19 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 48);
  v25 = v11;
  v26 = v13;
  v27 = v15;
  v28 = v17;
  v22 = v19;
  v29 = a4;
  v20 = *(_OWORD *)(a1 + 72);
  v30 = *(_OWORD *)(a1 + 56);
  v31 = v20;
  v32 = *(_QWORD *)(a1 + 88);
  v33 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v21);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _BYTE v15[768];
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a6;
  v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_4;
  v13[3] = &unk_1E5121788;
  memcpy(v15, a5, sizeof(v15));
  v10 = *(_OWORD *)(a1 + 56);
  v16 = *(_OWORD *)(a1 + 40);
  v17 = v10;
  v11 = *(_QWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 80);
  v18 = v11;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v9, "addClipLayout:configurationBlock:", v12, v13);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _BYTE v15[768];
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a6;
  v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_6;
  v13[3] = &unk_1E5121788;
  memcpy(v15, a5, sizeof(v15));
  v10 = *(_OWORD *)(a1 + 56);
  v16 = *(_OWORD *)(a1 + 40);
  v17 = v10;
  v11 = *(_QWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 80);
  v18 = v11;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v9, "addClipLayout:configurationBlock:", v12, v13);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[768];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_8;
  v21[3] = &unk_1E5121738;
  memcpy(v23, a5, sizeof(v23));
  v19 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 48);
  v25 = v11;
  v26 = v13;
  v27 = v15;
  v28 = v17;
  v29 = *(_QWORD *)(a1 + 56);
  v22 = v19;
  v30 = a4;
  v20 = *(_OWORD *)(a1 + 80);
  v31 = *(_OWORD *)(a1 + 64);
  v32 = v20;
  v33 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v21);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_9(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[10];
  _BYTE v15[768];

  v8 = a6;
  objc_msgSend(v8, "contentSize");
  PXRectWithOriginAndSize();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_10;
  v14[3] = &__block_descriptor_848_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  v9 = (void *)a1[4];
  v14[4] = a1[5];
  v14[5] = v10;
  v14[6] = v11;
  v14[7] = v12;
  v14[8] = v13;
  v14[9] = a1[6];
  memcpy(v15, a5, sizeof(v15));
  objc_msgSend(v9, "addClipLayout:configurationBlock:", v8, v14);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  _BYTE v21[768];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_12;
  v20[3] = &__block_descriptor_880_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  memcpy(v21, a5, sizeof(v21));
  v22 = a4;
  v23 = v18;
  v24 = *(_QWORD *)(a1 + 80);
  v25 = v11;
  v26 = v13;
  v27 = v15;
  v28 = v17;
  v29 = *(_OWORD *)(a1 + 88);
  v30 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v19, "addClipLayout:configurationBlock:", v9, v20);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  _BYTE v21[768];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_15;
  v20[3] = &__block_descriptor_880_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  memcpy(v21, a5, sizeof(v21));
  v22 = *(_QWORD *)(a1 + 80);
  v23 = v18;
  v24 = a4;
  v25 = *(_OWORD *)(a1 + 88);
  v26 = *(_QWORD *)(a1 + 104);
  v27 = v11;
  v28 = v13;
  v29 = v15;
  v30 = v17;
  objc_msgSend(v19, "addClipLayout:configurationBlock:", v9, v20);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_16(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[10];

  v7 = a6;
  objc_msgSend(v7, "contentSize");
  PXRectWithOriginAndSize();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_17;
  v13[3] = &__block_descriptor_80_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  v8 = (void *)a1[4];
  v13[4] = a1[5];
  v13[5] = v9;
  v13[6] = v10;
  v13[7] = v11;
  v13[8] = v12;
  v13[9] = a1[6];
  objc_msgSend(v8, "addClipLayout:configurationBlock:", v7, v13);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_18(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[768];

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_19;
  v16[3] = &unk_1E51218A8;
  v10 = (void *)a1[4];
  v18 = a1[5];
  v19 = v11;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = a1[6];
  v24 = a4;
  memcpy(v25, a5, sizeof(v25));
  v17 = v9;
  v15 = v9;
  objc_msgSend(v10, "addClipLayout:configurationBlock:", v15, v16);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  _BYTE v21[768];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_21;
  v19[3] = &__block_descriptor_888_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  v19[4] = a4;
  v20 = *(_OWORD *)(a1 + 40);
  memcpy(v21, a5, sizeof(v21));
  v22 = *(_QWORD *)(a1 + 56);
  v23 = v11;
  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = *(_QWORD *)(a1 + 64);
  v28 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v19);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[768];
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_23;
  v23[3] = &unk_1E51218F0;
  memcpy(v25, a5, sizeof(v25));
  v24 = *(id *)(a1 + 40);
  v26 = a4;
  v19 = *(_OWORD *)(a1 + 64);
  v27 = *(_OWORD *)(a1 + 48);
  v28 = v19;
  v29 = *(_QWORD *)(a1 + 80);
  v20 = *(_OWORD *)(a1 + 104);
  v30 = *(_OWORD *)(a1 + 88);
  v31 = v20;
  v32 = *(_QWORD *)(a1 + 120);
  v21 = *(_QWORD *)(a1 + 168);
  v35 = *(_QWORD *)(a1 + 160);
  v22 = *(_OWORD *)(a1 + 128);
  v34 = *(_OWORD *)(a1 + 144);
  v33 = v22;
  v36 = v21;
  v37 = v11;
  v38 = v13;
  v39 = v15;
  v40 = v17;
  v41 = *(_QWORD *)(a1 + 176);
  v42 = *(_OWORD *)(a1 + 184);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v23);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  _BYTE v21[768];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_25;
  v19[3] = &__block_descriptor_888_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  v19[4] = a4;
  v20 = *(_OWORD *)(a1 + 40);
  memcpy(v21, a5, sizeof(v21));
  v22 = *(_QWORD *)(a1 + 56);
  v23 = v11;
  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = *(_QWORD *)(a1 + 64);
  v28 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v19);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  _BYTE v20[768];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_27;
  v19[3] = &__block_descriptor_888_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  memcpy(v20, a5, sizeof(v20));
  v21 = a4;
  v22 = *(_OWORD *)(a1 + 40);
  v23 = *(_QWORD *)(a1 + 56);
  v24 = v11;
  v25 = v13;
  v26 = v15;
  v27 = v17;
  v28 = *(_QWORD *)(a1 + 64);
  v29 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v19);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  _BYTE v20[768];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_29;
  v19[3] = &__block_descriptor_864_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  memcpy(v20, a5, sizeof(v20));
  v21 = a4;
  v22 = *(_OWORD *)(a1 + 40);
  v23 = v11;
  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v19);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  _BYTE v20[768];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_31;
  v19[3] = &__block_descriptor_864_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  memcpy(v20, a5, sizeof(v20));
  v21 = a4;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v19);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  _BYTE v20[768];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_33;
  v19[3] = &__block_descriptor_864_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  memcpy(v20, a5, sizeof(v20));
  v21 = a4;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  v26 = *(_OWORD *)(a1 + 40);
  v27 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v19);

}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  _BYTE v20[768];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;

  v9 = a6;
  objc_msgSend(v9, "contentSize");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_35;
  v19[3] = &__block_descriptor_864_e301_v40__0_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__8_____CGRect__CGPoint_dd__CGSize_dd________ddd____ddd____ddd____ddd___CGPoint_dd__CGSize_dd__16_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__24_____CGSize_dd__CGSize_dd__CGSize_dd_BQ_CGPoint_dd__32l;
  memcpy(v20, a5, sizeof(v20));
  v21 = a4;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v18, "addClipLayout:configurationBlock:", v9, v19);

}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_35(uint64_t result, uint64_t a2, uint64_t a3)
{
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;

  v5 = (double *)result;
  v6 = *(_QWORD *)(result + 800);
  if (v6 == 2)
  {
    PXRectWithSizeAlignedToRectEdges();
    *(_QWORD *)a3 = v10;
    *(_QWORD *)(a3 + 8) = v11;
    *(_QWORD *)(a3 + 16) = v12;
    *(_QWORD *)(a3 + 24) = v13;
    v14 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v14;
    v15 = v5[105];
    *(double *)&v14 = (v5[104] + v15) * 0.5;
    v16 = v15 + v5[103];
    *(_QWORD *)(a2 + 32) = v14;
    *(_QWORD *)(a2 + 40) = 0;
    *(_QWORD *)(a2 + 48) = 0;
    *(double *)(a2 + 56) = v16;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(double *)(a3 + 32) = v5[104] + v5[105];
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_QWORD *)(a3 + 120) = 0;
    *(double *)&v14 = v5[105] / v5[107];
    v17 = (1.0 - *(double *)&v14) * 0.5 / ((*(double *)&v14 * -2.0 + 1.0) / 3.0);
    *(double *)(a3 + 144) = v17;
    *(double *)(a3 + 152) = v17;
    *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 144);
    PXStoryRectOuterBounds();
    v18 = v17 + -1.0;
    *(double *)(a2 + 128) = -(v19 * v18);
    *(_QWORD *)(a2 + 136) = 0;
    result = PXStoryRectOuterBounds();
    *(_QWORD *)(a3 + 128) = 0;
    *(double *)(a3 + 136) = -(v20 * v18) * 0.5;
  }
  else if (v6 == 1)
  {
    PXRectWithSizeAlignedToRectEdgesWithPadding();
    *(_QWORD *)a2 = v21;
    *(_QWORD *)(a2 + 8) = v22;
    *(_QWORD *)(a2 + 16) = v23;
    *(_QWORD *)(a2 + 24) = v24;
    v25 = v5[103] + v5[105];
    *(_QWORD *)(a2 + 96) = 0;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(double *)(a2 + 104) = v25;
    *(_QWORD *)(a2 + 112) = 0;
    *(_QWORD *)(a2 + 120) = 0;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    __asm { FMOV            V0.2D, #1.5 }
    *(_OWORD *)(a2 + 144) = _Q0;
    PXStoryRectOuterBounds();
    v32 = v31 * 33.0 / v5[104];
    result = PXStoryRectOuterBounds();
    *(double *)(a2 + 128) = v32;
    *(double *)(a2 + 136) = v33 * -0.5;
  }
  else if (v6)
  {
    v34 = *MEMORY[0x1E0C9D648];
    v35 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(a3 + 16) = v35;
    *(_OWORD *)a2 = v34;
    *(_OWORD *)(a2 + 16) = v35;
  }
  else
  {
    v7 = *(double *)(result + 832) + *(double *)(result + 840);
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(double *)(a2 + 80) = v7;
    *(_OWORD *)(a2 + 88) = 0u;
    *(_OWORD *)(a2 + 104) = 0u;
    *(_QWORD *)(a2 + 120) = 0;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    result = PXStoryRectOuterBounds();
    v9 = v8 * 33.0 / v5[104];
    *(_QWORD *)(a2 + 128) = 0;
    *(double *)(a2 + 136) = v9;
  }
  return result;
}

__n128 __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  __n128 result;
  double v14;
  double v15;
  __int128 v16;

  v6 = *(_QWORD *)(a1 + 800);
  if (v6 == 1)
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    v14 = *(double *)(a1 + 824) + *(double *)(a1 + 856);
    *(double *)(a3 + 32) = *(double *)(a1 + 848) * 0.16667;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(double *)(a3 + 104) = v14;
    *(_QWORD *)(a3 + 112) = 0;
    *(_QWORD *)(a3 + 120) = 0;
    PXStoryRectOuterBounds();
    result.n128_f64[0] = v15 * 33.0 / *(double *)(a1 + 824);
    *(_QWORD *)(a3 + 128) = result.n128_u64[0];
    *(double *)(a3 + 136) = -result.n128_f64[0];
  }
  else if (v6)
  {
    result = *(__n128 *)MEMORY[0x1E0C9D648];
    v16 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(a3 + 16) = v16;
    *(__n128 *)a2 = result;
    *(_OWORD *)(a2 + 16) = v16;
  }
  else
  {
    PXRectWithSizeAlignedToRectEdges();
    *(_QWORD *)a3 = v7;
    *(_QWORD *)(a3 + 8) = v8;
    *(_QWORD *)(a3 + 16) = v9;
    *(_QWORD *)(a3 + 24) = v10;
    v11 = *(double *)(a1 + 824) + *(double *)(a1 + 856);
    *(_QWORD *)(a3 + 32) = 0;
    *(_QWORD *)(a3 + 40) = 0;
    *(_QWORD *)(a3 + 48) = 0;
    *(double *)(a3 + 56) = v11;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    PXStoryRectOuterBounds();
    result.n128_f64[0] = v12 * -33.0 / *(double *)(a1 + 832);
    *(_QWORD *)(a3 + 128) = result.n128_u64[0];
    *(_QWORD *)(a3 + 136) = 0;
  }
  return result;
}

int64x2_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_31(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v6;
  int64x2_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;

  v6 = *(_QWORD *)(a1 + 800);
  if (v6 == 1)
  {
    PXRectWithSizeAlignedToRectEdgesWithPadding();
    *(_QWORD *)a2 = v8;
    *(_QWORD *)(a2 + 8) = v9;
    *(_QWORD *)(a2 + 16) = v10;
    *(_QWORD *)(a2 + 24) = v11;
    *(double *)(a2 + 32) = *(double *)(a1 + 832) + *(double *)(a1 + 840);
    *(_OWORD *)(a2 + 40) = 0u;
    *(_OWORD *)(a2 + 56) = 0u;
    *(_OWORD *)(a2 + 72) = 0u;
    *(_OWORD *)(a2 + 88) = 0u;
    *(_OWORD *)(a2 + 104) = 0u;
    *(_QWORD *)(a2 + 120) = 0;
    a3[2] = 0u;
    a3[3] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[6] = 0u;
    a3[7] = 0u;
    __asm { FMOV            V0.2D, #1.5 }
    *(_OWORD *)(a2 + 144) = _Q0;
    PXStoryRectOuterBounds();
    *(double *)result.i64 = v17 * -33.0 / *(double *)(a1 + 824);
    *(_QWORD *)(a2 + 128) = result.i64[0];
    *(_QWORD *)(a2 + 136) = result.i64[0];
  }
  else if (v6)
  {
    PXRectWithSizeAlignedToRectEdges();
    *(_QWORD *)a2 = v18;
    *(_QWORD *)(a2 + 8) = v19;
    *(_QWORD *)(a2 + 16) = v20;
    *(_QWORD *)(a2 + 24) = v21;
    v22 = *(double *)(a1 + 832) + *(double *)(a1 + 840);
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(double *)(a2 + 80) = v22;
    *(_OWORD *)(a2 + 88) = 0u;
    *(_OWORD *)(a2 + 104) = 0u;
    *(_QWORD *)(a2 + 120) = 0;
    a3[6] = 0u;
    a3[7] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    result = vdupq_n_s64(0x3FF2AA64C2F837B5uLL);
    *(int64x2_t *)(a2 + 144) = result;
  }
  else
  {
    *(double *)result.i64 = *(double *)(a1 + 824) + *(double *)(a1 + 840);
    *(_QWORD *)(a2 + 96) = 0;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_QWORD *)(a2 + 104) = result.i64[0];
    *(_QWORD *)(a2 + 112) = 0;
    *(_QWORD *)(a2 + 120) = 0;
    a3[6] = 0u;
    a3[7] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
  }
  return result;
}

__n128 __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;
  double v11;
  double v12;
  __int128 v13;

  v6 = *(_QWORD *)(a1 + 800);
  if (v6 == 1)
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    v11 = *(double *)(a1 + 808) * 0.16667;
    *(double *)(a3 + 32) = *(double *)(a1 + 848) + *(double *)(a1 + 856);
    *(_QWORD *)(a3 + 40) = 0;
    *(_QWORD *)(a3 + 48) = 0;
    *(double *)(a3 + 56) = v11;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    PXStoryRectOuterBounds();
    result.n128_f64[0] = v12 * -33.0 / *(double *)(a1 + 840);
    *(_QWORD *)(a3 + 128) = result.n128_u64[0];
    *(_QWORD *)(a3 + 136) = result.n128_u64[0];
  }
  else if (v6)
  {
    result = *(__n128 *)MEMORY[0x1E0C9D648];
    v13 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(a3 + 16) = v13;
    *(__n128 *)a2 = result;
    *(_OWORD *)(a2 + 16) = v13;
  }
  else
  {
    PXRectWithSizeAlignedToRectEdges();
    *(_QWORD *)a3 = result.n128_u64[0];
    *(_QWORD *)(a3 + 8) = v7;
    *(_QWORD *)(a3 + 16) = v8;
    *(_QWORD *)(a3 + 24) = v9;
    result.n128_f64[0] = *(double *)(a1 + 848) + *(double *)(a1 + 856);
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_QWORD *)(a3 + 80) = result.n128_u64[0];
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_QWORD *)(a3 + 120) = 0;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
  }
  return result;
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  double v28;
  double v29;
  __int128 v30;
  double v31;

  PXStoryRectOuterBounds();
  v8 = v6;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 800);
  if (v10 == 1)
  {
    v23 = (1.0 - *(double *)(a1 + 808)) / (1.0 - *(double *)(a1 + 816));
    v24 = *(double *)(a1 + 848);
    if (*(_QWORD *)(a1 + 824) == 2)
    {
      v25 = (1.0 - v23) * v24;
      v26 = *(double *)(a1 + 856) + *(double *)(a1 + 864);
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 48) = 0;
      *(double *)(a2 + 56) = v25;
      *(_QWORD *)(a2 + 64) = 0;
      *(_QWORD *)(a2 + 72) = 0;
      *(double *)(a2 + 80) = v26;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)(a2 + 104) = 0u;
      *(_QWORD *)(a2 + 120) = 0;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_QWORD *)(a2 + 128) = 0;
      *(double *)(a2 + 136) = v7 * -0.1;
    }
    else
    {
      v31 = v24 + *(double *)(a1 + 864);
      *(double *)(a2 + 32) = (1.0 - v23) * *(double *)(a1 + 856);
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 48) = 0;
      *(double *)(a2 + 56) = v31;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(double *)(a2 + 128) = v8 * -0.1;
      *(_QWORD *)(a2 + 136) = 0;
    }
  }
  else if (v10)
  {
    *(CGRect *)a3 = CGRectOffset(*(CGRect *)(a1 + 832), *(CGFloat *)(a1 + 872), *(CGFloat *)(a1 + 880));
    v27 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v27;
  }
  else
  {
    v11 = *(double *)(a1 + 808) / *(double *)(a1 + 816);
    v12 = v11 + -1.0;
    if (*(_QWORD *)(a1 + 824) == 2)
    {
      v13 = v6 * v12 * 0.5;
      PXRectWithOriginAndSize();
      v18 = v12 * *(double *)(a1 + 848);
      *(double *)(a2 + 32) = *(double *)(a1 + 856) + *(double *)(a1 + 864);
      *(_QWORD *)(a2 + 120) = 0;
      *(_OWORD *)(a2 + 104) = 0u;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)(a2 + 72) = 0u;
      *(_OWORD *)(a2 + 56) = 0u;
      *(_OWORD *)(a2 + 40) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_QWORD *)(a3 + 96) = 0;
      *(double *)(a3 + 104) = v18;
      v19 = v9 * -0.1;
      *(_QWORD *)(a3 + 112) = 0;
      *(_QWORD *)(a3 + 120) = 0;
      v20 = 0.0;
      v21 = v13;
      v22 = v11;
      v11 = 1.0;
    }
    else
    {
      v19 = v7 * v12 * 0.5;
      PXRectWithOriginAndSize();
      v28 = *(double *)(a1 + 848) + *(double *)(a1 + 864);
      v29 = v12 * *(double *)(a1 + 856);
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_QWORD *)(a2 + 96) = 0;
      *(double *)(a2 + 104) = v28;
      *(_QWORD *)(a2 + 112) = 0;
      *(_QWORD *)(a2 + 120) = 0;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(double *)(a3 + 80) = v29;
      v13 = v8 * -0.1;
      *(_QWORD *)(a3 + 120) = 0;
      *(_OWORD *)(a3 + 104) = 0u;
      *(_OWORD *)(a3 + 88) = 0u;
      v22 = 1.0;
      v21 = 0.0;
      v20 = v19;
    }
    *(double *)(a2 + 128) = v13;
    *(double *)(a2 + 136) = v19;
    *(double *)(a3 + 128) = v21;
    *(double *)(a3 + 136) = v20;
    *(double *)(a3 + 144) = v22;
    *(double *)(a3 + 152) = v11;
    *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 144);
    *(_QWORD *)a3 = v14;
    *(_QWORD *)(a3 + 8) = v15;
    *(_QWORD *)(a3 + 16) = v16;
    *(_QWORD *)(a3 + 24) = v17;
    v30 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v30;
  }
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  _OWORD *v15;
  _OWORD *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;

  v6 = *(double *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = 1.0 - v6;
    v7 = 1.0 - *(double *)(a1 + 48);
  }
  else
  {
    v7 = *(double *)(a1 + 48);
  }
  v8 = v6 / v7;
  PXStoryRectOuterBounds();
  v11 = v9;
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 32);
  if (v13 == 1)
  {
    v18 = v8 + -1.0;
    if (*(_QWORD *)(a1 + 824) == 2)
    {
      v19 = v18 * v9 * -0.5;
      PXRectWithSizeAlignedToRectEdges();
      v24 = v18 * *(double *)(a1 + 848);
      v25 = *(double *)(a1 + 856) + *(double *)(a1 + 864);
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 48) = 0;
      *(_QWORD *)(a2 + 32) = 0;
      *(double *)(a2 + 56) = v24 + v24;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_QWORD *)(a3 + 40) = 0;
      *(_QWORD *)(a3 + 48) = 0;
      *(double *)(a3 + 56) = v24;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      v26 = v12 * 0.1;
      v27 = 0.0;
      v28 = v19;
      v29 = v8;
      v8 = 1.0;
    }
    else
    {
      v27 = v18 * v10 * -0.5;
      PXRectWithSizeAlignedToRectEdges();
      v25 = v18 * *(double *)(a1 + 856);
      v33 = *(double *)(a1 + 848) + *(double *)(a1 + 864);
      *(double *)(a2 + 32) = v25 + v25;
      *(_QWORD *)(a2 + 120) = 0;
      *(_OWORD *)(a2 + 104) = 0u;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)(a2 + 72) = 0u;
      *(_OWORD *)(a2 + 56) = 0u;
      *(_OWORD *)(a2 + 40) = 0u;
      *(_OWORD *)(a3 + 40) = 0u;
      *(_OWORD *)(a3 + 56) = 0u;
      *(_OWORD *)(a3 + 72) = 0u;
      *(_OWORD *)(a3 + 88) = 0u;
      *(double *)(a3 + 104) = v33;
      *(_QWORD *)(a3 + 112) = 0;
      *(_QWORD *)(a3 + 120) = 0;
      v28 = v11 * 0.1;
      v29 = 1.0;
      v19 = 0.0;
      v26 = v27;
    }
    *(double *)(a3 + 32) = v25;
    *(double *)(a2 + 128) = v19;
    *(double *)(a2 + 136) = v27;
    *(double *)(a3 + 128) = v28;
    *(double *)(a3 + 136) = v26;
    *(double *)(a3 + 144) = v29;
    *(double *)(a3 + 152) = v8;
    *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 144);
    *(_QWORD *)a3 = v20;
    *(_QWORD *)(a3 + 8) = v21;
    *(_QWORD *)(a3 + 16) = v22;
    *(_QWORD *)(a3 + 24) = v23;
    v34 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v34;
  }
  else if (v13)
  {
    *(CGRect *)a3 = CGRectOffset(*(CGRect *)(a1 + 832), *(CGFloat *)(a1 + 872), *(CGFloat *)(a1 + 880));
    v30 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v30;
  }
  else
  {
    v14 = *(double *)(a1 + 848);
    v15 = (_OWORD *)(a2 + 32);
    v16 = (_OWORD *)(a3 + 32);
    if (*(_QWORD *)(a1 + 824) == 2)
    {
      v17 = *(double *)(a1 + 856) + *(double *)(a1 + 864);
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *v15 = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *v16 = 0u;
      *(double *)(a3 + 80) = v17;
      *(_QWORD *)(a3 + 88) = 0;
      *(_QWORD *)(a3 + 96) = 0;
      *(double *)(a3 + 104) = (1.0 - v8) * v14;
      *(_QWORD *)(a3 + 120) = 0;
      *(_QWORD *)(a3 + 128) = 0;
      *(_QWORD *)(a3 + 112) = 0;
      *(double *)(a3 + 136) = v10 * -0.1;
    }
    else
    {
      v31 = v14 + *(double *)(a1 + 864);
      v32 = (1.0 - v8) * *(double *)(a1 + 856);
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *v15 = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_QWORD *)v16 = 0;
      *(_QWORD *)(a3 + 40) = 0;
      *(_QWORD *)(a3 + 48) = 0;
      *(double *)(a3 + 56) = v31;
      *(_QWORD *)(a3 + 64) = 0;
      *(_QWORD *)(a3 + 72) = 0;
      *(double *)(a3 + 80) = v32;
      *(_OWORD *)(a3 + 88) = 0u;
      *(_OWORD *)(a3 + 104) = 0u;
      *(_QWORD *)(a3 + 120) = 0;
      *(double *)(a3 + 128) = v9 * -0.1;
      *(_QWORD *)(a3 + 136) = 0;
    }
  }
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  _OWORD *v16;
  _OWORD *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;

  PXStoryRectOuterBounds();
  v7 = v6;
  v9 = v8;
  if ((*(unsigned int (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 808), *(char *)(a1 + 848), v10, v11, v12) == 1)v13 = -1.0;
  else
    v13 = 1.0;
  v14 = *(_QWORD *)(a1 + 808);
  if (v14 == 1)
  {
    v21 = *(double *)(a1 + 920) / *(double *)(a1 + 880);
    v22 = v21 + -1.0;
    v23 = (_QWORD *)(a2 + 40);
    if (*(_QWORD *)(a1 + 936) == 2)
    {
      v24 = v22 * v7 * -0.5;
      PXRectWithSizeAlignedToRectEdges();
      v29 = v22 * *(double *)(a1 + 960);
      *(double *)(a2 + 32) = *(double *)(a1 + 968) + *(double *)(a1 + 976);
      *v23 = 0;
      *(_QWORD *)(a2 + 48) = 0;
      *(double *)(a2 + 56) = v29 / v21 + v29 / v21;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_QWORD *)(a3 + 32) = 0;
      *(_QWORD *)(a3 + 40) = 0;
      *(_QWORD *)(a3 + 48) = 0;
      *(double *)(a3 + 56) = v29 + v29;
      v30 = v9 * v13 * 0.1;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      v31 = 0.0;
      v32 = v24;
      v33 = v21;
      v21 = 1.0;
    }
    else
    {
      v30 = v22 * v9 * -0.5;
      PXRectWithSizeAlignedToRectEdges();
      v37 = *(double *)(a1 + 960) + *(double *)(a1 + 976);
      v38 = v22 * *(double *)(a1 + 968);
      *(double *)(a2 + 32) = v38 / v21 + v38 / v21;
      *(_OWORD *)(a2 + 72) = 0u;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)v23 = 0u;
      *(_OWORD *)(a2 + 56) = 0u;
      *(double *)(a2 + 104) = v37;
      *(_QWORD *)(a2 + 112) = 0;
      *(_QWORD *)(a2 + 120) = 0;
      *(double *)(a3 + 32) = v38 + v38;
      *(_QWORD *)(a3 + 120) = 0;
      *(_OWORD *)(a3 + 104) = 0u;
      v24 = v7 * v13 * 0.1;
      *(_OWORD *)(a3 + 88) = 0u;
      *(_OWORD *)(a3 + 72) = 0u;
      *(_OWORD *)(a3 + 56) = 0u;
      *(_OWORD *)(a3 + 40) = 0u;
      v33 = 1.0;
      v32 = 0.0;
      v31 = v30;
    }
    *(double *)(a2 + 128) = v24;
    *(double *)(a2 + 136) = v30;
    *(double *)(a3 + 128) = v32;
    *(double *)(a3 + 136) = v31;
    *(double *)(a3 + 144) = v33;
    *(double *)(a3 + 152) = v21;
    *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 144);
    *(_QWORD *)a3 = v25;
    *(_QWORD *)(a3 + 8) = v26;
    *(_QWORD *)(a3 + 16) = v27;
    *(_QWORD *)(a3 + 24) = v28;
    v39 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v39;
  }
  else if (v14)
  {
    *(CGRect *)a3 = CGRectOffset(*(CGRect *)(a1 + 944), *(CGFloat *)(a1 + 984), *(CGFloat *)(a1 + 992));
    v34 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v34;
  }
  else
  {
    v15 = *(double *)(a1 + 960);
    v16 = (_OWORD *)(a2 + 32);
    v17 = (_OWORD *)(a3 + 32);
    v18 = *(double *)(a1 + 880) / *(double *)(a1 + 920);
    if (*(_QWORD *)(a1 + 936) == 2)
    {
      v19 = (1.0 - v18) * v15;
      v20 = *(double *)(a1 + 968) + *(double *)(a1 + 976);
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *v16 = 0u;
      *(double *)(a2 + 80) = v20;
      *(_QWORD *)(a2 + 88) = 0;
      *(_QWORD *)(a2 + 96) = 0;
      *(double *)(a2 + 104) = v19;
      *(_QWORD *)(a2 + 112) = 0;
      *(_QWORD *)(a2 + 120) = 0;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *v17 = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_QWORD *)(a2 + 128) = 0;
      *(double *)(a2 + 136) = v9 * v13 * 0.1;
    }
    else
    {
      v35 = v15 + *(double *)(a1 + 976);
      v36 = (1.0 - v18) * *(double *)(a1 + 968);
      *(_QWORD *)v16 = 0;
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 48) = 0;
      *(double *)(a2 + 56) = v35;
      *(_QWORD *)(a2 + 64) = 0;
      *(_QWORD *)(a2 + 72) = 0;
      *(double *)(a2 + 80) = v36;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)(a2 + 104) = 0u;
      *(_QWORD *)(a2 + 120) = 0;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *v17 = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(double *)(a2 + 128) = v7 * v13 * 0.1;
      *(_QWORD *)(a2 + 136) = 0;
    }
  }
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  _OWORD *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _OWORD *v28;
  double v29;
  __int128 v30;
  double v31;
  double v32;
  __int128 v33;
  double v34;
  double v35;

  v6 = *(double *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = 1.0 - v6;
    v7 = 1.0 - *(double *)(a1 + 48);
  }
  else
  {
    v7 = *(double *)(a1 + 48);
  }
  v8 = v6 / v7;
  PXStoryRectOuterBounds();
  v11 = v9;
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 32);
  if (v13 == 1)
  {
    v27 = *(double *)(a1 + 848);
    v28 = (_OWORD *)(a2 + 32);
    if (*(_QWORD *)(a1 + 824) == 2)
    {
      v29 = *(double *)(a1 + 856) + *(double *)(a1 + 864);
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *v28 = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_QWORD *)(a3 + 32) = 0;
      *(_QWORD *)(a3 + 40) = 0;
      *(_QWORD *)(a3 + 48) = 0;
      *(double *)(a3 + 56) = (1.0 - v8) * v27;
      *(_QWORD *)(a3 + 64) = 0;
      *(_QWORD *)(a3 + 72) = 0;
      *(double *)(a3 + 80) = v29;
      *(_OWORD *)(a3 + 88) = 0u;
      *(_OWORD *)(a3 + 104) = 0u;
      *(_OWORD *)(a3 + 120) = 0u;
      *(double *)(a3 + 136) = v10 * -0.1;
    }
    else
    {
      v34 = v27 + *(double *)(a1 + 864);
      v35 = (1.0 - v8) * *(double *)(a1 + 856);
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *v28 = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(double *)(a3 + 32) = v35;
      *(_QWORD *)(a3 + 40) = 0;
      *(_QWORD *)(a3 + 48) = 0;
      *(double *)(a3 + 56) = v34;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(double *)(a3 + 128) = v9 * -0.1;
      *(_QWORD *)(a3 + 136) = 0;
    }
  }
  else if (v13)
  {
    *(CGRect *)a3 = CGRectOffset(*(CGRect *)(a1 + 832), *(CGFloat *)(a1 + 872), *(CGFloat *)(a1 + 880));
    v30 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v30;
  }
  else
  {
    v14 = v8 + -1.0;
    v15 = (_OWORD *)(a2 + 32);
    if (*(_QWORD *)(a1 + 824) == 2)
    {
      v16 = v14 * v9 * 0.5;
      PXRectWithOriginAndSize();
      v21 = v14 * *(double *)(a1 + 848);
      v22 = *(double *)(a1 + 856) + *(double *)(a1 + 864);
      *v15 = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_QWORD *)(a2 + 96) = 0;
      *(double *)(a2 + 104) = v21;
      *(_QWORD *)(a2 + 112) = 0;
      *(_QWORD *)(a2 + 120) = 0;
      *(double *)(a3 + 32) = v22;
      *(_QWORD *)(a3 + 120) = 0;
      *(_OWORD *)(a3 + 104) = 0u;
      *(_OWORD *)(a3 + 88) = 0u;
      *(_OWORD *)(a3 + 72) = 0u;
      *(_OWORD *)(a3 + 56) = 0u;
      *(_OWORD *)(a3 + 40) = 0u;
      v23 = v12 * 0.1;
      v24 = 0.0;
      v25 = v16;
      v26 = v8;
      v8 = 1.0;
    }
    else
    {
      v24 = v14 * v10 * 0.5;
      PXRectWithOriginAndSize();
      v31 = v14 * *(double *)(a1 + 856);
      v32 = *(double *)(a1 + 848) + *(double *)(a1 + 864);
      *v15 = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(double *)(a2 + 80) = v31;
      *(_QWORD *)(a2 + 120) = 0;
      *(_OWORD *)(a2 + 104) = 0u;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_QWORD *)(a3 + 96) = 0;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(double *)(a3 + 104) = v32;
      *(_QWORD *)(a3 + 112) = 0;
      *(_QWORD *)(a3 + 120) = 0;
      v25 = v11 * 0.1;
      v26 = 1.0;
      v16 = 0.0;
      v23 = v24;
    }
    *(double *)(a2 + 128) = v16;
    *(double *)(a2 + 136) = v24;
    *(double *)(a3 + 128) = v25;
    *(double *)(a3 + 136) = v23;
    *(double *)(a3 + 144) = v26;
    *(double *)(a3 + 152) = v8;
    *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 144);
    *(_QWORD *)a3 = v17;
    *(_QWORD *)(a3 + 8) = v18;
    *(_QWORD *)(a3 + 16) = v19;
    *(_QWORD *)(a3 + 24) = v20;
    v33 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)(a2 + 16) = v33;
  }
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_19(uint64_t result, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v5 = result;
  v6 = *(_QWORD *)(result + 40);
  v7 = *(_QWORD *)(result + 88);
  v8 = (_QWORD *)(a3 + 32);
  v9 = v6 == 2;
  if (v6 == 2)
    v10 = 64;
  else
    v10 = 72;
  v11 = *(double *)(result + v10) + *(double *)(result + 80);
  if (v9)
  {
    *v8 = 0;
    *(_QWORD *)(a3 + 40) = 0;
    *(_QWORD *)(a3 + 48) = 0;
    if (v7)
    {
      *(double *)(a3 + 56) = v11;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
    }
    else
    {
      *(_OWORD *)(a3 + 72) = 0u;
      *(_OWORD *)(a3 + 88) = 0u;
      *(_OWORD *)(a3 + 56) = 0u;
      *(double *)(a3 + 104) = v11;
      *(_QWORD *)(a3 + 112) = 0;
      *(_QWORD *)(a3 + 120) = 0;
    }
  }
  else
  {
    if (v7)
    {
      *(double *)(a3 + 32) = v11;
      *(_OWORD *)(a3 + 40) = 0u;
      *(_OWORD *)(a3 + 56) = 0u;
      *(_OWORD *)(a3 + 72) = 0u;
    }
    else
    {
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)v8 = 0u;
      *(double *)(a3 + 80) = v11;
    }
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_QWORD *)(a3 + 120) = 0;
  }
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  v12 = *(_QWORD *)(result + 104);
  if (v12 == 1)
  {
    v15 = *(_OWORD *)(result + 648);
    v16 = *(_OWORD *)(result + 664);
    v17 = *(_OWORD *)(result + 680);
    PXStoryRectOuterBounds();
    objc_msgSend(*(id *)(v5 + 32), "contentSize", v15, v16, v17);
    result = PXAffineTransformMakeFromRects();
    *(_OWORD *)(a3 + 128) = 0u;
    v12 = *(_QWORD *)(v5 + 104);
  }
  if (v12 == 4)
  {
    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(a3 + 16) = v14;
    *a2 = v13;
    a2[1] = v14;
  }
  return result;
}

__n128 __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __n128 result;

  v3 = *(_QWORD *)(a1 + 32);
  _ZF = v3 == 2;
  if (v3 == 2)
    v5 = 56;
  else
    v5 = 64;
  v6 = *(double *)(a1 + v5);
  v7 = v6 * *(double *)(a1 + 72);
  v8 = v6 - v7;
  if (_ZF)
  {
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 40) = 0;
    *(_QWORD *)(a2 + 48) = 0;
    *(double *)(a2 + 56) = v7;
    v9 = 0.0;
  }
  else
  {
    *(double *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 48) = 0;
    *(_QWORD *)(a2 + 56) = 0;
    v9 = v8;
    v8 = 0.0;
    *(_QWORD *)(a2 + 40) = 0;
  }
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(double *)(a2 + 80) = v9;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 96) = 0;
  *(double *)(a2 + 104) = v8;
  *(_QWORD *)(a2 + 112) = 0;
  *(_QWORD *)(a2 + 120) = 0;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(int64x2_t *)(a2 + 144) = vdupq_n_s64(0x3FF199999999999AuLL);
  __asm { FMOV            V0.2D, #1.0 }
  *(__n128 *)(a3 + 144) = result;
  return result;
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_15(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    PXStoryRectOuterBounds();
    PXAffineTransformMakeFromRects();
    *(_OWORD *)(a2 + 128) = 0u;
  }
  v4 = *(_QWORD *)(a1 + 800);
  v5 = v4 == 2;
  if (v4 == 2)
    v6 = 824;
  else
    v6 = 832;
  v7 = *(double *)(a1 + v6) + *(double *)(a1 + 840);
  v8 = -v7;
  if (v5)
  {
    v10 = 0.0;
    v9 = -v7;
  }
  else
  {
    v9 = 0.0;
    v10 = v8;
  }
  *(CGRect *)a2 = CGRectOffset(*(CGRect *)(a1 + 848), v9, v10);
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_12(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void (**v13)(void *, double, double, double);
  void (**v14)(void *, double, double, double);
  void (*v15)(void *, double, double, double);
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  _QWORD v23[10];
  __int128 v24;
  __int128 v25;
  __int128 v26;

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    v4 = *(_OWORD *)(a1 + 600);
    v24 = *(_OWORD *)(a1 + 584);
    v25 = v4;
    v26 = *(_OWORD *)(a1 + 616);
    PXStoryRectOuterBounds();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_13;
    v23[3] = &__block_descriptor_80_e14_d32__0d8d16d24l;
    v23[4] = *(_QWORD *)(a1 + 800);
    *(double *)&v23[5] = v5;
    *(double *)&v23[6] = v7;
    *(double *)&v23[7] = v9;
    *(double *)&v23[8] = v11;
    v23[9] = *(_QWORD *)(a1 + 808);
    v13 = (void (**)(void *, double, double, double))_Block_copy(v23);
    v14 = v13;
    v15 = v13[2];
    if (*(_QWORD *)(a1 + 816) == 2)
      v15(v13, v6, v10, *(double *)(a1 + 840));
    else
      v15(v13, v8, v12, *(double *)(a1 + 848));
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    PXAffineTransformMakeFromRects();
    *(_OWORD *)(a2 + 128) = v26;

  }
  v16 = *(_QWORD *)(a1 + 816);
  v17 = v16 == 2;
  if (v16 == 2)
    v18 = 856;
  else
    v18 = 864;
  v19 = *(double *)(a1 + v18) + *(double *)(a1 + 872);
  v20 = -v19;
  if (v17)
  {
    v22 = 0.0;
    v21 = -v19;
  }
  else
  {
    v21 = 0.0;
    v22 = v20;
  }
  *(CGRect *)a2 = CGRectOffset(*(CGRect *)(a1 + 824), v21, v22);
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_13()
{
  return PXFloatApproximatelyEqualToFloat();
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_10(uint64_t result, _OWORD *a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;

  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  v3 = 64;
  if (*(_QWORD *)(result + 32) == 2)
    v3 = 56;
  v4 = (*(double *)(result + v3) + *(double *)(result + 72)) * 0.5;
  if (*(_QWORD *)(result + 32) == 2)
    v5 = 0.0;
  else
    v5 = (*(double *)(result + v3) + *(double *)(result + 72)) * 0.5;
  if (*(_QWORD *)(result + 32) != 2)
    v4 = 0.0;
  *(double *)(a3 + 32) = v5;
  *(_QWORD *)(a3 + 40) = 0;
  *(double *)(a3 + 48) = v5;
  *(double *)(a3 + 56) = v4;
  *(_QWORD *)(a3 + 64) = 0;
  *(double *)(a3 + 72) = v4;
  *(_OWORD *)(a3 + 80) = 0uLL;
  *(_OWORD *)(a3 + 96) = 0uLL;
  *(_OWORD *)(a3 + 112) = 0uLL;
  if (*(_QWORD *)(result + 88) == 1)
  {
    v7 = result;
    result = PXStoryRectOuterBounds();
    v9 = *(_QWORD *)(v7 + 32);
    v10 = v8 * -0.3;
    if (v9 == 2)
      v11 = v8 * -0.3;
    else
      v11 = 0.0;
    if (v9 == 2)
      v10 = 0.0;
    *(double *)(a3 + 128) = v11;
    *(double *)(a3 + 136) = v10;
  }
  return result;
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v10;
  double *v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  double v16;
  int v17;
  _OWORD *v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double *v26;
  double v27;
  double v28;
  double *v29;
  uint64_t v30;
  double v31;
  __int128 v32;
  __int128 v33;

  v7 = *(_QWORD *)(result + 48);
  if (v7 == 1)
  {
    v10 = result;
    v11 = (double *)(result + 840);
    v12 = (double *)(result + 832);
    v13 = 832;
    if (*(_QWORD *)(result + 808) == 2)
      v13 = 840;
    v14 = *(_QWORD *)(result + v13);
    v15 = (double *)(result + 848);
    v16 = -*(double *)(result + 848);
    v17 = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    v18 = (_OWORD *)(a2 + 32);
    if (*(_QWORD *)(v10 + 808) == 2)
    {
      result = PXStoryRectOuterBounds();
      v20 = v19 * 33.0 / *v11;
      if (v17 == 1)
      {
        *(_QWORD *)(a2 + 32) = v14;
        *(_OWORD *)(a2 + 40) = 0u;
        *(_OWORD *)(a2 + 56) = 0u;
        *(_OWORD *)(a2 + 72) = 0u;
        *(_OWORD *)(a2 + 88) = 0u;
        *(_OWORD *)(a2 + 104) = 0u;
        *(_OWORD *)(a2 + 120) = 0u;
        *(double *)(a2 + 136) = -v20;
        *(double *)(a3 + 32) = v16;
        *(_OWORD *)(a3 + 40) = 0u;
        *(_OWORD *)(a3 + 56) = 0u;
        *(_OWORD *)(a3 + 72) = 0u;
        *(_OWORD *)(a3 + 88) = 0u;
        *(_OWORD *)(a3 + 104) = 0u;
        *(_QWORD *)(a3 + 120) = 0;
        v21 = -(*v11 + *v15);
        v22 = xmmword_1A7C0C250;
        v23 = 8;
        v24 = 0.0;
        v25 = 4;
        v26 = v12;
      }
      else
      {
        *(_OWORD *)(a2 + 48) = 0u;
        *(_OWORD *)(a2 + 64) = 0u;
        *v18 = 0u;
        *(_QWORD *)(a2 + 80) = v14;
        *(_OWORD *)(a2 + 88) = 0u;
        *(_OWORD *)(a2 + 104) = 0u;
        *(_OWORD *)(a2 + 120) = 0u;
        *(double *)(a2 + 136) = v20;
        *(_OWORD *)(a3 + 48) = 0u;
        *(_OWORD *)(a3 + 64) = 0u;
        *(_OWORD *)(a3 + 32) = 0u;
        *(double *)(a3 + 80) = v16;
        *(_OWORD *)(a3 + 88) = 0u;
        *(_OWORD *)(a3 + 104) = 0u;
        *(_QWORD *)(a3 + 120) = 0;
        v21 = *v11 + *v15;
        v24 = 0.0;
        v23 = 8;
        v25 = 1;
        v26 = v12;
        v22 = xmmword_1A7C0C250;
      }
      v29 = v15;
      v12 = v15;
    }
    else
    {
      result = PXStoryRectOuterBounds();
      v28 = v27 * 33.0 / *v12;
      *(_QWORD *)v18 = 0;
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 48) = 0;
      if (v17 == 1)
      {
        *(_OWORD *)(a2 + 72) = 0u;
        *(_OWORD *)(a2 + 88) = 0u;
        *(_OWORD *)(a2 + 56) = 0u;
        *(_QWORD *)(a2 + 104) = v14;
        *(_QWORD *)(a2 + 112) = 0;
        *(_QWORD *)(a2 + 120) = 0;
        *(double *)(a2 + 128) = v28;
        *(_QWORD *)(a2 + 136) = 0;
        *(_QWORD *)(a3 + 96) = 0;
        *(_OWORD *)(a3 + 64) = 0u;
        *(_OWORD *)(a3 + 80) = 0u;
        *(_OWORD *)(a3 + 32) = 0u;
        *(_OWORD *)(a3 + 48) = 0u;
        *(double *)(a3 + 104) = v16;
        *(_QWORD *)(a3 + 112) = 0;
        *(_QWORD *)(a3 + 120) = 0;
        v24 = *v12 + *v15;
        v21 = 0.0;
        v23 = 4;
        v25 = 2;
        v22 = xmmword_1A7C0C360;
      }
      else
      {
        *(_QWORD *)(a2 + 56) = v14;
        *(_OWORD *)(a2 + 64) = 0u;
        *(_OWORD *)(a2 + 80) = 0u;
        *(_OWORD *)(a2 + 96) = 0u;
        *(_OWORD *)(a2 + 112) = 0u;
        *(double *)(a2 + 128) = -v28;
        *(_QWORD *)(a2 + 136) = 0;
        *(_QWORD *)(a3 + 32) = 0;
        *(_QWORD *)(a3 + 40) = 0;
        *(_QWORD *)(a3 + 48) = 0;
        *(double *)(a3 + 56) = v16;
        *(_OWORD *)(a3 + 64) = 0u;
        *(_OWORD *)(a3 + 80) = 0u;
        *(_OWORD *)(a3 + 96) = 0u;
        *(_OWORD *)(a3 + 112) = 0u;
        v24 = -(*v12 + *v15);
        v22 = xmmword_1A7C0C360;
        v23 = 4;
        v21 = 0.0;
        v25 = 8;
      }
      v26 = v15;
      v29 = v11;
      v11 = v15;
    }
    *(_QWORD *)(a4 + 56) = v25;
    *(double *)(a4 + 64) = v24;
    *(double *)(a4 + 72) = v21;
    v30 = *(_QWORD *)v29;
    *(double *)a4 = *v26;
    *(_QWORD *)(a4 + 8) = v30;
    *(_QWORD *)(a5 + 56) = v23;
    v31 = *v11;
    *(double *)a5 = *v12;
    *(double *)(a5 + 8) = v31;
    *(_OWORD *)(a5 + 16) = v22;
    v7 = *(_QWORD *)(v10 + 48);
  }
  if (v7 == 4)
  {
    v32 = *MEMORY[0x1E0C9D648];
    v33 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(a3 + 16) = v33;
    *(_OWORD *)a2 = v32;
    *(_OWORD *)(a2 + 16) = v33;
  }
  return result;
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  if (*(_QWORD *)(result + 48) == 1)
  {
    v4 = result;
    v5 = 1.0;
    if (*(_QWORD *)(result + 808) == 2)
    {
      if (*(double *)(result + 832) == 0.333333333)
        v5 = -1.0;
      else
        v5 = 1.0;
    }
    v14 = *(_OWORD *)(result + 592);
    v15 = *(_OWORD *)(result + 608);
    v16 = *(_OWORD *)(result + 624);
    if (*(_QWORD *)(result + 848) == 2)
    {
      PXStoryRectOuterBounds();
      v7 = v6 * 33.0;
      result = objc_msgSend(*(id *)(v4 + 32), "contentSize", v14, v15, v16);
      v9 = v5 * (v7 / v8);
      v10 = 0.0;
    }
    else
    {
      PXStoryRectOuterBounds();
      v12 = v11;
      result = objc_msgSend(*(id *)(v4 + 32), "contentSize", v14, v15, v16);
      v10 = v5 * (v12 * -33.0 / v13);
      v9 = 0.0;
    }
    *(double *)(a3 + 128) = v10;
    *(double *)(a3 + 136) = v9;
  }
  return result;
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  if (*(_QWORD *)(result + 48) == 1)
  {
    v3 = result;
    v4 = 1.0;
    if (*(_QWORD *)(result + 808) == 2)
    {
      if (*(double *)(result + 832) == 0.333333333)
        v4 = -1.0;
      else
        v4 = 1.0;
    }
    v13 = *(_OWORD *)(result + 592);
    v14 = *(_OWORD *)(result + 608);
    v15 = *(_OWORD *)(result + 624);
    if (*(_QWORD *)(result + 848) == 2)
    {
      PXStoryRectOuterBounds();
      v6 = v5 * 33.0;
      result = objc_msgSend(*(id *)(v3 + 32), "contentSize", v13, v14, v15);
      v8 = v4 * (v6 / v7);
      v9 = 0.0;
    }
    else
    {
      PXStoryRectOuterBounds();
      v11 = v10;
      result = objc_msgSend(*(id *)(v3 + 32), "contentSize", v13, v14, v15);
      v9 = v4 * (v11 * -33.0 / v12);
      v8 = 0.0;
    }
    *(double *)(a2 + 128) = v9;
    *(double *)(a2 + 136) = v8;
  }
  return result;
}

double *__120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_2(double *result, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  double *v10;
  double *v11;
  double *v12;
  uint64_t v13;
  double v14;
  int v15;
  _OWORD *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  __int128 v25;
  double *v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  double v30;
  __int128 v31;
  __int128 v32;

  v7 = *((_QWORD *)result + 6);
  if (v7 == 1)
  {
    v10 = result;
    v11 = result + 105;
    v12 = result + 104;
    v13 = 104;
    if (*((_QWORD *)result + 101) == 2)
      v13 = 105;
    v14 = result[v13];
    v15 = (*(uint64_t (**)(void))(*((_QWORD *)result + 4) + 16))();
    v16 = (_OWORD *)(a3 + 32);
    if (*((_QWORD *)v10 + 101) == 2)
    {
      result = (double *)PXStoryRectOuterBounds();
      v18 = v17 * 33.0 / *v11;
      if (v15 == 2)
      {
        *(double *)(a3 + 32) = v14;
        *(_OWORD *)(a3 + 40) = 0u;
        *(_OWORD *)(a3 + 56) = 0u;
        *(_OWORD *)(a3 + 72) = 0u;
        *(_OWORD *)(a3 + 88) = 0u;
        *(_OWORD *)(a3 + 104) = 0u;
        *(_OWORD *)(a3 + 120) = 0u;
        *(double *)(a3 + 136) = -v18;
        v19 = v10[105] + v10[112];
        v20 = 1;
      }
      else
      {
        *(_OWORD *)(a3 + 48) = 0u;
        *(_OWORD *)(a3 + 64) = 0u;
        *v16 = 0u;
        *(double *)(a3 + 80) = v14;
        *(_OWORD *)(a3 + 88) = 0u;
        *(_OWORD *)(a3 + 104) = 0u;
        *(_OWORD *)(a3 + 120) = 0u;
        *(double *)(a3 + 136) = v18;
        v19 = -(v10[105] + v10[112]);
        v20 = 4;
      }
      *(_QWORD *)(a4 + 56) = v20;
      *(_QWORD *)(a4 + 64) = 0;
      *(double *)(a4 + 72) = v19;
      v25 = xmmword_1A7C0C250;
      v26 = v10 + 112;
      v27 = 8;
      v28 = v12;
      v12 = v10 + 112;
    }
    else
    {
      result = (double *)PXStoryRectOuterBounds();
      v22 = v21 * 33.0 / *v12;
      *(_QWORD *)v16 = 0;
      *(_QWORD *)(a3 + 40) = 0;
      *(_QWORD *)(a3 + 48) = 0;
      if (v15 == 2)
      {
        *(_OWORD *)(a3 + 72) = 0u;
        *(_OWORD *)(a3 + 88) = 0u;
        *(_OWORD *)(a3 + 56) = 0u;
        *(double *)(a3 + 104) = v14;
        *(_QWORD *)(a3 + 112) = 0;
        *(_QWORD *)(a3 + 120) = 0;
        *(double *)(a3 + 128) = v22;
        *(_QWORD *)(a3 + 136) = 0;
        v23 = -(v10[104] + v10[112]);
        v24 = 8;
      }
      else
      {
        *(double *)(a3 + 56) = v14;
        *(_OWORD *)(a3 + 64) = 0u;
        *(_OWORD *)(a3 + 80) = 0u;
        *(_OWORD *)(a3 + 96) = 0u;
        *(_OWORD *)(a3 + 112) = 0u;
        *(double *)(a3 + 128) = -v22;
        *(_QWORD *)(a3 + 136) = 0;
        v23 = v10[104] + v10[112];
        v24 = 2;
      }
      *(_QWORD *)(a4 + 56) = v24;
      *(double *)(a4 + 64) = v23;
      *(_QWORD *)(a4 + 72) = 0;
      v25 = xmmword_1A7C0C360;
      v28 = v10 + 112;
      v27 = 4;
      v26 = v11;
      v11 = v10 + 112;
    }
    v29 = *(_QWORD *)v26;
    *(double *)a4 = *v28;
    *(_QWORD *)(a4 + 8) = v29;
    *(_QWORD *)(a5 + 56) = v27;
    v30 = *v11;
    *(double *)a5 = *v12;
    *(double *)(a5 + 8) = v30;
    *(_OWORD *)(a5 + 32) = v25;
    *(_BYTE *)(a5 + 48) = 1;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    v7 = *((_QWORD *)v10 + 6);
  }
  if (v7 == 4)
  {
    v31 = *MEMORY[0x1E0C9D648];
    v32 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(a3 + 16) = v32;
    *a2 = v31;
    a2[1] = v32;
  }
  return result;
}

void __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE v13[768];

  objc_msgSend(*(id *)(a1 + 32), "layoutForClipWithIdentifier:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 48;
    if (a4 == 1)
      v9 = 40;
    v10 = *(void **)(a1 + v9);
    memcpy(v13, a3, sizeof(v13));
    objc_msgSend(v10, "addClipWithIdentifier:layout:info:", a2, v8, v13);
  }
  else
  {
    v11 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
}

uint64_t __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyTransitionEffectAlpha:auxiliaryEffectAlpha:");
}

uint64_t __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionWithEffect:auxiliaryEffect:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)isSupportedTransitionWithKind:(char)a3 betweenSegmentWithClipComposition:(id *)a4 andSegmentWithClipComposition:(id *)a5
{
  int v7;
  void *v8;
  int v9;
  BOOL result;
  int64_t var0;
  int64_t v12;
  int v13;
  BOOL v16;
  int v17;

  v7 = a3;
  objc_msgSend(a1, "supportedTransitionKinds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsIndex:", v7);

  if (!v9)
    return 0;
  if (v7 != 8)
  {
    if (v7 == 2)
      return a4->var0 < 2;
    if ((v7 & 0xFFFFFFFE) != 6)
      return 1;
    if (a4->var0 == 1 && a4->var1)
      return a5->var0 == 1 && a5->var1;
    return 0;
  }
  var0 = a4->var0;
  v12 = a5->var0;
  v13 = PXFloatApproximatelyEqualToFloat();
  if (var0 == 1 && (v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return a4->var1 && a4->var1 == a5->var1;
  v16 = var0 == 2 && v12 == 2;
  v17 = !v16;
  if (v12 == 1 && (var0 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return a4->var1 && a4->var1 == a5->var1;
  if (!v17)
    return a4->var1 && a4->var1 == a5->var1;
  result = 0;
  if (var0 == 2 && v12 == 3 && ((v13 ^ 1) & 1) == 0)
    return a4->var1 && a4->var1 == a5->var1;
  return result;
}

+ (id)supportedTransitionKinds
{
  if (supportedTransitionKinds_onceToken != -1)
    dispatch_once(&supportedTransitionKinds_onceToken, &__block_literal_global_62_73720);
  return (id)supportedTransitionKinds_indexSet;
}

+ (BOOL)isSupportedTransitionWithKind:(char)a3 fromSegmentIdentifier:(int64_t)a4 toSegmentIdentifier:(int64_t)a5 inTimeline:(id)a6
{
  uint64_t v8;
  id v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v8 = a3;
  v9 = a6;
  v10 = v9;
  if (v8 >= 2)
  {
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    if (v9)
    {
      objc_msgSend(v9, "infoForSegmentWithIdentifier:", a4);
      v37 = 0;
      v36 = 0u;
      v35 = 0u;
      v34 = 0u;
      v33 = 0u;
      v32 = 0u;
      v31 = 0u;
      v30 = 0u;
      v29 = 0u;
      v28 = 0u;
      v27 = 0u;
      v26 = 0u;
      v25 = 0u;
      objc_msgSend(v10, "infoForSegmentWithIdentifier:", a5);
      v12 = *((_QWORD *)&v38 + 1);
      v13 = *((_QWORD *)&v40 + 1);
      v14 = v40;
    }
    else
    {
      v13 = 0;
      v12 = 0;
      v36 = 0uLL;
      v35 = 0uLL;
      v34 = 0uLL;
      v33 = 0uLL;
      v32 = 0uLL;
      v31 = 0uLL;
      v30 = 0uLL;
      v29 = 0uLL;
      v28 = 0uLL;
      v27 = 0uLL;
      v26 = 0uLL;
      v25 = 0uLL;
      v14 = 0;
      v37 = 0;
    }
    v24 = v39;
    v17 = v26;
    v19 = 0;
    v20 = v12;
    v21 = v39;
    v22 = v14;
    v23 = v13;
    v16 = 0;
    v18 = 0;
    v11 = +[PXStoryTransitionProducer isSupportedTransitionWithKind:betweenSegmentWithClipComposition:andSegmentWithClipComposition:](PXStoryTransitionProducer, "isSupportedTransitionWithKind:betweenSegmentWithClipComposition:andSegmentWithClipComposition:", v8, &v20, &v16);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __112__PXStoryTransitionProducer_isSupportedTransitionWithKind_fromSegmentIdentifier_toSegmentIdentifier_inTimeline___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  _OWORD v14[3];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _BOOL8 v18;
  double v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "timeRangeForSegmentWithIdentifier:", a2);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = PXAxisTransposed();
  v7 = v4 > v5;
  v8 = 56;
  if (v4 <= v5)
    v9 = 56;
  else
    v9 = 48;
  if (v4 <= v5)
    v8 = 48;
  v10 = *(double *)(a1 + v9) / *(double *)(a1 + v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__PXStoryTransitionProducer_isSupportedTransitionWithKind_fromSegmentIdentifier_toSegmentIdentifier_inTimeline___block_invoke_3;
  v15[3] = &unk_1E51219E8;
  v17 = &v24;
  v18 = v7;
  v11 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v19 = v10;
  v20 = v6;
  v14[0] = v21;
  v14[1] = v22;
  v14[2] = v23;
  objc_msgSend(v11, "enumerateClipsInTimeRange:rect:usingBlock:", v14, v15, *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v12 = *((unsigned __int8 *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v12;
}

uint64_t __112__PXStoryTransitionProducer_isSupportedTransitionWithKind_fromSegmentIdentifier_toSegmentIdentifier_inTimeline___block_invoke(CGFloat a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  __int128 v13;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  PXStoryRectOuterBounds();
  memset(&v20, 0, sizeof(v20));
  if (a4 == 2)
  {
    v9 = 1.0;
    v10 = a1;
  }
  else
  {
    v10 = 1.0;
    v9 = a1;
  }
  CGAffineTransformMakeScale(&v20, v10, v9);
  memset(&v19, 0, sizeof(v19));
  if (a5)
    v11 = -(a1 + -1.0);
  else
    v11 = a1 + -1.0;
  PXRectGetLengthForAxis();
  CGAffineTransformMakeTranslation(&v19, v11 * v12 * 0.5, 0.0);
  memset(&v18, 0, sizeof(v18));
  t1 = v20;
  t2 = v19;
  CGAffineTransformConcat(&v17, &t1, &t2);
  PXRectGetCenter();
  v13 = a3[1];
  *(_OWORD *)&t1.a = *a3;
  *(_OWORD *)&t1.c = v13;
  *(_OWORD *)&t1.tx = a3[2];
  PXStoryRectFromStoryRectApplyingTransformWithAnchorPoint();
  t2 = v18;
  memset(&t1, 0, sizeof(t1));
  PXStoryRectFitIntoUnitRect();
  t2 = v18;
  return PXStoryRectEqualToRect();
}

uint64_t __112__PXStoryTransitionProducer_isSupportedTransitionWithKind_fromSegmentIdentifier_toSegmentIdentifier_inTimeline___block_invoke_3(uint64_t result, uint64_t a2, int a3, int a4, char *__src, _BYTE *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _BYTE __dst[768];
  uint64_t v17;
  uint64_t v18;

  if (a2 >= 1)
  {
    v17 = v6;
    v18 = v7;
    v11 = result;
    v12 = 0;
    while (1)
    {
      if (v12 == *(_QWORD *)(v11 + 48))
      {
        memcpy(__dst, __src, sizeof(__dst));
        v13 = *(_QWORD *)(*(_QWORD *)(v11 + 40) + 8);
        if (*(_BYTE *)(v13 + 24))
        {
          v14 = (*(uint64_t (**)(double))(*(_QWORD *)(v11 + 32) + 16))(*(double *)(v11 + 56));
          v13 = *(_QWORD *)(*(_QWORD *)(v11 + 40) + 8);
        }
        else
        {
          v14 = 0;
        }
        *(_BYTE *)(v13 + 24) = v14;
        v15 = *(_QWORD *)(*(_QWORD *)(v11 + 40) + 8);
        if (*(_BYTE *)(v15 + 24))
        {
          result = (*(uint64_t (**)(double))(*(_QWORD *)(v11 + 32) + 16))(*(double *)(v11 + 56));
          v15 = *(_QWORD *)(*(_QWORD *)(v11 + 40) + 8);
        }
        else
        {
          result = 0;
        }
        *(_BYTE *)(v15 + 24) = result;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v11 + 40) + 8) + 24))
          break;
      }
      ++v12;
      __src += 768;
      if (a2 == v12)
        return result;
    }
    *a6 = 1;
  }
  return result;
}

void __53__PXStoryTransitionProducer_supportedTransitionKinds__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 1);
  objc_msgSend(v2, "addIndex:", 2);
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 8);
  objc_msgSend(v2, "addIndex:", 5);
  objc_msgSend(v2, "addIndex:", 6);
  objc_msgSend(v2, "addIndex:", 7);
  objc_msgSend(v2, "addIndex:", 9);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)supportedTransitionKinds_indexSet;
  supportedTransitionKinds_indexSet = v0;

}

@end
